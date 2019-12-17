unit TimeTh;

interface

uses
  Classes, Data, SysUtils;

type
  TTimeThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses Dialogs, Main;

procedure TTimeThread.Execute;
var
  pRun : Boolean;
  pTime, pDateRun : TDateTime;
  pTimeStr, pFlagPath, pFlagName : String;
  pFileFlagHandle : Integer;
begin
try
 with dmData.taTimeEvn do begin
  Active := True;
  First;
  while not EOF do begin
    pRun := FieldByName('RUN').AsBoolean;
    if pRun then // Если процесс активен
    begin
      pTimeStr := FieldByName('TIME').AsString;
      pTime := StrToTime(pTimeStr);
      pDateRun := FieldByName('DATERUN').AsDateTime;
      if (pTime <= Time) and (pDateRun < Date) then // Создаем флаг
      begin
        pFlagPath := FieldByName('FLAGPATH').AsString;
        pFlagName := FieldByName('FLAGNAME').AsString;
        pFileFlagHandle := FileCreate(pFlagPath +'\'+ pFlagName);
        FileClose(pFileFlagHandle);
        Edit;
        FieldByName('DATERUN').AsString := DateToStr(Date);
        FieldByName('TIMERUN').AsString := TimeToStr(Time);
        Post;
      end;{if}
    end;{if}
    Next;
  end; {while}
  Active := False;

 end; {with}
except
(*  MessageDlg('TTimeThread.Execute не выполнен.'
             +DateToStr(Date)+' '+TimeToStr(Time),mtError,[mbOk],0);
*)
  fmMain.pTimeThread.Terminate;
end;{try}
end;

end.
