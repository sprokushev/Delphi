unit LdTaskTh;

interface

uses
  Classes, SysUtils, Data, DB, Windows, ADODB;

type
  TLoadTaskThread = class(TThread)
  private
    { Private declarations }
  protected
    pStLineText : String;
    procedure Execute; override;
    procedure UpdateStLine;
    function FileChanged(ID: integer):boolean;
  end;

implementation

uses Main, VCLUtils, Dialogs, FMXUtils;

var
  pFileName, pLoader, pTask, pDirectory : String;

function TLoadTaskThread.FileChanged(ID: integer):boolean;
var tmpFileName: String;
    tmpLastDT: string;
    tmpNewDT:string;
    tmpFileDT:integer;
    q:TADOQuery;
Begin
  Result:=false;
  q:=TADOQuery.Create(dmData);
  with q do
  try
    Connection:=dmData.UHTA_ODBC;
    SQL.Add('SELECT * FROM loadtask WHERE ID='+IntToStr(ID));
    Open;
    Result:=FieldByName('RUN').AsBoolean;
    If Result Then
    Begin
      tmpFileName := Trim(FieldByName('FILENAME').AsString);
      tmpLastDT := DateToStr(FieldByName('LASTDATE').AsDateTime) +
                         FieldByName('LASTTIME').AsString;
      tmpFileDT:=FileAge(tmpFileName);
      Result:=(tmpFileDT<>-1);
      if Result then // Если проверяемый файл обнаружен - проверка даты и времени последнего изменения
      begin
        tmpNewDT:=DateToStr(FileDateToDateTime(tmpFileDT)) +
                  TimeToStr(FileDateToDateTime(tmpFileDT));
        Result:=tmpNewDT<>tmpLastDT
      end;
    end;
  finally
    Close;
    SQL.Clear;
    Free;
  end;
End;

procedure TLoadTaskThread.Execute;
begin
  with dmData do
  with taLoadTask do
  try
    Active:=true;
    First;
    While NOT Eof Do
    Begin
      If FieldByName('ID').AsInteger>0 Then
      If FileChanged(FieldByName('ID').AsInteger) Then
      Begin
        pFileName := Trim(FieldByName('FILENAME').AsString);
        pStLineText := 'Закачка файла - '+pFileName+'...';
        Synchronize(UpdateStLine);
        pLoader := Trim(FieldByName('LOADER').AsString);
        pTask := Trim(FieldByName('TASK').AsString);
        pDirectory := ExtractFileDir(Trim(pLoader));
        If pLoader<>'' then
        Begin
          if NOT ExecAndWait(pLoader,pTask,SW_SHOWMINIMIZED,TRUE) Then
          with dmData do
          try
            taLogTask.Open;
            taLogTask.Append;
            taLogTask['ID']:=taLoadTask['ID'];
            taLogTask['FILENAME']:=taLoadTask['FILENAME'];
            taLogTask.FieldByName('LASTDATE').AsDateTime:=DATE;
            taLogTask.FieldByName('LASTTIME').AsString:=TimeToStr(TIME);
            taLogTask.FieldByName('ERROR').AsBoolean:=True;
            taLogTask.FieldByName('INFO').AsString:='Can''t execute program';
            taLogTask.Post;
          finally
            taLogTask.Close;
          end;
        end;
      end;
      Next;
    End;
  finally
    Active:=false;
    pStLineText := 'Закачка завершена';
    Synchronize(UpdateStLine);
  end;
end;


procedure TLoadTaskThread.UpdateStLine;
begin
  fmMain.slLoadTask.Panels[0].Text := pStLineText;
end;

end.
