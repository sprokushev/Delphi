unit PingTh;

interface

uses
  Classes, SysUtils, Data, DB, Windows;

type
  TPingThread = class(TThread)
  private
    { Private declarations }
  protected
    pStLineText : String;
    procedure Execute; override;
    procedure UpdateStLine;
    procedure MoveFiles(From,Into:String);
  end;

implementation

uses Main, VCLUtils, Dialogs;

procedure TPingThread.Execute;
var
  f:TextFile;
  i:integer;
  HostToPing        :String;
  IfPingFlag        :String;
  IfPingSourceDir   :String[255];
  IfNoPingSourceDir :String[255];
begin
  with dmData.taPingList do
  try
    Active := True;
    First;
    while not EOF do
    begin
      if FieldByName('RUN').AsBoolean = True then
      begin
        pStLineText := Trim('Анализ доступности узла - '+FieldByName('ADDR').AsString);
        Synchronize(UpdateStLine);
        { Start PING }
        HostToPing:=FieldByName('ADDR').AsString;
        IfPingFlag:=FieldByName('FlagPath').AsString+'\'+FieldByName('FlagName').AsString;
        If (HostToPing<>'') AND (IfPingFlag<>'') then
        Begin
          fmMain.PingICMP.TimeOut := 1000;
          fmMain.PingICMP.HostName :=HostToPing;
          fmMain.PingICMP.HostIP := '';
          AssignFile(f,IfPingFlag);
          if (fmMain.PingICMP.ping = nil) then
          begin
            pStLineText := Trim('Узел '+FieldByName('ADDR').AsString+' НЕ доступен');
            Synchronize(UpdateStLine);
            if FileExists(IfPingFlag) then
            begin
              SysUtils.DeleteFile(IfPingFlag);
              for i:=1 to 3 do
              begin
                IfPingSourceDir:=FieldByName('PINGDIR'+intToStr(i)).AsString;
                If System.Copy(IfPingSourceDir,length(IfPingSourceDir),1)<>'\' then
                   IfPingSourceDir:=IfPingSourceDir+'\';
                IfNoPingSourceDir:=FieldByName('NOPINGDIR'+intToStr(i)).AsString;
                If System.Copy(IfNoPingSourceDir,length(IfNoPingSourceDir),1)<>'\' then
                   IfNoPingSourceDir:=IfNoPingSourceDir+'\';
                if (IfPingSourceDir<>'\') and (IfNoPingSourceDir<>'\') then
                  MoveFiles(IfPingSourceDir,IfNoPingSourceDir);
              end
            end;
          end
          else
          begin
            pStLineText := Trim('Узел '+FieldByName('ADDR').AsString+' доступен');
            Synchronize(UpdateStLine);
            if not FileExists(IfPingFlag) then
            try
              Rewrite(f);
              Write(f,'I''m Pinging');
              CloseFile(f);
              for i:=1 to 3 do
              begin
                IfPingSourceDir:=FieldByName('PINGDIR'+intToStr(i)).AsString;
                If System.Copy(IfPingSourceDir,length(IfPingSourceDir),1)<>'\' then
                   IfPingSourceDir:=IfPingSourceDir+'\';
                IfNoPingSourceDir:=FieldByName('NOPINGDIR'+intToStr(i)).AsString;
                If System.Copy(IfNoPingSourceDir,length(IfNoPingSourceDir),1)<>'\' then
                   IfNoPingSourceDir:=IfNoPingSourceDir+'\';
                if (IfPingSourceDir<>'\') and (IfNoPingSourceDir<>'\') then
                  MoveFiles(IfNoPingSourceDir,IfPingSourceDir);
              end
            except
            end;
          end;
        end;
        { Finish PING }
      end; {if}
      Next;
    end; {while}
  finally
    Active := False;
  end;{try}
end;

procedure TPingThread.UpdateStLine;
begin
  fmMain.slPinging.Panels[0].Text := pStLineText;
end;

procedure TPingThread.MoveFiles(From,Into:String);
var
  SR:TSearchRec;
  s1,s2:String[255];
  i,Err:Integer;
begin
  i:=0;
  Err:=0;
  while (Err=0) AND (i<200) do
  Begin
    Err:=FindFirst(From+'*.*',faArchive,SR);
    If Err=0 then
    Begin
      s1:=From+SR.Name+#0;
      s2:=Into+SR.Name+#0;
      MoveFile(@s1[1],@s2[1]);
    End;
    i:=i+1;
    SysUtils.FindClose(SR);
  end;
end;


end.
