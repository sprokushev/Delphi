// ============= закачка данных из Oracle в DBF ============
// ==================== VEV ================================
unit OraToDbf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OracleData, Oracle, Db, ADODB, ComCtrls, StdCtrls, ExtCtrls;

type
  Tf_OraToDbf = class(TForm)
    cnn_DbfToOra: TADOConnection;
    t_DbfToOra: TOracleDataSet;
    ProgressBar1: TProgressBar;
    q_DbfToOraList: TOracleDataSet;
    Button1: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DBFtoORAid: String;
    DontAsk:Boolean;
    Title:string;
    Param1,Param2:String;
  end;

var
  f_OraToDbf: Tf_OraToDbf;

implementation

uses ForDB,ShellAPI,EdCatCen,rxStrUtils, main, ForSESS;

{$R *.DFM}

procedure Tf_OraToDbf.FormCreate(Sender: TObject);
begin
  t_DbfToOra.Session:=f_main.ora_Session;
  q_DbfToOraList.Session:=f_main.ora_Session;
  q_DbfToOraList.Open;
end;

procedure Tf_OraToDbf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_DbfToOraList.Close;
  Action:=caFree;
end;

procedure Tf_OraToDbf.FormShow(Sender: TObject);
var
  I:Integer;
begin
  If Title='' then Caption:='Передача данных в DBF'
  Else Caption:='Передача данных в DBF: '+Title;

  if not q_DBFtoORAList.Locate('id',DBFtoOraID,[]) then
    ShowMessage('Информация по передаче на найдена!')
  else
    with t_DbfToOra do
      begin
        SQL.Clear;
        SQL.Add(q_DBFtoORAlist.FieldByName('sourcequery').AsString);
        for i:=0 to SQL.Count-1 do
          begin
           SQL[i]:=ReplaceStr(AnsiUpperCase(SQL[i]), ':PARAM1', Param1);
           SQL[i]:=ReplaceStr(AnsiUpperCase(SQL[i]), ':PARAM2', Param2);
          end;
        if DontAsk then Timer1.Enabled:=True;
      end;
end;

procedure Tf_OraToDbf.Button1Click(Sender: TObject);
var
  InsertHeader:String;
  InsertFooter:String;
  I:Integer;
  Source,Source1,Source2,Dest:String[255];
  Fo,Fo1  : TSHFileOpStruct;
  q_ORAtoDBF:TADOCommand;
  FH:Integer;
  SR:TSearchRec;
  ErrCounter:integer;
begin
  Button1.Enabled:=False;
  Button1.Refresh;
  source:=q_DbfToOraList.fieldByName('destinationtable').AsString+'.*'#0;
  FillChar(Fo, sizeof(Fo), #0);
  Fo.Wnd    := Handle;
  Fo.wFunc  := FO_COPY;
  Fo.pFrom  := @source[1];
  Fo.pTo    := 'c:\load\';
  Fo.fFlags := FOF_NOCONFIRMATION+FOF_FILESONLY;
  if ((SHFileOperation(Fo) = 0) and
     (not Fo.fAnyOperationsAborted)) then
  if true then
    begin
      InsertHeader:='INSERT INTO "'+'c:\load\'+ExtractFilename(q_DbfToOraList.fieldByName('destinationtable').AsString)+'" (';
      //t_DbfToOra.SQL.SaveToFile('c:\tmp\1.sql');
      t_DbfToOra.Open;
      for i:=0 to t_DbfToOra.FieldCount-1 do
        if copy(t_DbfToOra.Fields[i].FieldName,length(t_DbfToOra.Fields[i].FieldName),1)<>'_' then
          InsertHeader:=InsertHeader+t_DbfToOra.Fields[i].FieldName+','
        else
          InsertHeader:=InsertHeader+copy(t_DbfToOra.Fields[i].FieldName,1,length(t_DbfToOra.Fields[i].FieldName)-1)+',';
      InsertHeader:=COPY(InsertHeader,1,Length(InsertHeader)-1)+') VALUES ';
      q_ORAtoDBF:=TADOCommand.Create(Self);
      q_ORAtoDBF.ConnectionString:=cnn_DbfToOra.ConnectionString;
      q_ORAtoDBF.CommandText:='DELETE FROM "'+'c:\load\'+ExtractFilename(q_DbfToOraList.fieldByName('destinationtable').AsString)+'"';
      q_ORAtoDBF.Execute;
      ErrCounter:=0;
      while not t_DbfToOra.Eof do
        begin
          InsertFooter:='(';
          for i:=0 to t_DbfToOra.FieldCount-1 do
            InsertFooter:=InsertFooter+t_DbfToOra.Fields[i].AsString+',';
          InsertFooter:=COPY(InsertFooter,1,Length(InsertFooter)-1)+')';
          q_ORAtoDBF.CommandText:=InsertHeader+' '+InsertFooter;
          try
            q_ORAtoDBF.Execute;
          except
            on E:Exception do
            Begin
              Inc(ErrCounter);
              f_main.ApplSession.WriteToLog(amFull,'ORA_TO_DBF',sesError,E.Message,0,'',ErrCounter);
            end;
          end;
          ProgressBar1.Position:=Round(t_DbfToOra.RecNo/t_DbfToOra.RecordCount*100);
          ProgressBar1.Refresh;
          t_DbfToOra.Next;
        end;
      q_ORAtoDBF.Free;
      t_DbfToOra.Close;
      source1:='c:\load\'+Trim(ExtractFilename(q_DbfToOraList.fieldByName('destinationtable').AsString))+'.*'#0;
      source2:='c:\load\'+Trim(ExtractFilename(q_DbfToOraList.fieldByName('destinationtable').AsString))+'.*'#0;
      Dest:=q_DbfToOraList.fieldByName('copytotable').AsString+#0;
      FillChar(Fo1, sizeof(Fo1), #0);
      Fo1.Wnd    := Handle;
      Fo1.wFunc  := FO_COPY;
      Fo1.pFrom  := @source2[1];
      Fo1.pTo    := @dest[1];
      Fo1.fFlags := FOF_NOCONFIRMATION+FOF_FILESONLY;
      if ((SHFileOperation(Fo1) = 0) and
         (not Fo1.fAnyOperationsAborted)) then
        begin
          Fo.Wnd    := Handle;
          Fo.wFunc  := FO_DELETE;
          Fo.pFrom  := @source1[1];
          Fo.pTo    := @source1[1];
          Fo.fFlags := FOF_NOCONFIRMATION+FOF_NOERRORUI+FOF_SILENT+FOF_FILESONLY;
          SHFileOperation(Fo);
          IF NOT DontAsk Then
            MessageDlg('Данные успешно перенесены',mtInformation,[mbOK],0);
          IF FindFirst(Copy(Dest,1,Length(Dest)-1)+Trim(ExtractFilename(q_DbfToOraList.fieldByName('destinationtable').AsString))+'.*',faAnyFile,SR)=0 then
            begin
              FH:=FileOpen(Copy(Dest,1,Length(Dest)-1)+SR.Name, fmOpenWrite or fmShareDenyNone);
              FileSetDate(FH,DateTimeToFileDate(Now));
              FileClose(FH);
              while FindNext(SR)=0 do
                begin
                  FH:=FileOpen(Copy(Dest,1,Length(Dest)-1)+SR.Name, fmOpenWrite or fmShareDenyNone);
                  FileSetDate(FH,DateTimeToFileDate(Now));
                  FileClose(FH);
                end;
            end;
        end;
    end
  else
    begin
      MessageDlg('Копирование во временный каталог не удалось!',mtError,[mbOK],0)
    end;
  close;
end;

procedure Tf_OraToDbf.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Button1Click(Self);
end;

end.
