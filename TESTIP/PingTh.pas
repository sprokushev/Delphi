unit PingTh;

interface

uses
  Classes, SysUtils, Windows, ICMP, Math, Graphics;

const
  MAX_PING=5;

type
  TPingThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses Main, VCLUtils, Dialogs;

procedure TPingThread.Execute;
var
  i,j,l:integer;
  ErrorStr,HostToPing        :String;
  ErrorPing:integer;
  SumPingRTT:integer;
begin
  with f_main do
  Begin
    // перебор групп
    for i:=1 to GroupCnt do
    Begin
      // перебор узлов
      for j:=1 to Groups[i].NodeCnt do
      Begin
        Nodes[i,j].Caption.Color:=clBtnFace;
        Nodes[i,j].Result.Color:=clBtnFace;
        Nodes[i,j].Result.Font.Style:=[fsBold,fsItalic,fsUnderline];
//          Nodes[i,j].Caption:=TLabel.Create(Self);
//          Caption:= Nodes[i,j].Name + ' ('+Nodes[i,j].Host+')';
//          Nodes[i,j].Result:=TLabel.Create(Self);
        { Start PING }
        HostToPing:=Nodes[i,j].Host;
        ErrorStr:='';
        ErrorPing:=0;
        SumPingRTT:=0;
        If (HostToPing<>'') then
        Begin
          PingICMP.TimeOut := 1000;
          PingICMP.HostName :=HostToPing;
          PingICMP.HostIP := '';
          for l:=1 to MAX_PING do
          Begin
            if (PingICMP.ping = nil) then begin
              if PingICMP.status = CICMP_RESOLVE_ERROR then begin
                 ErrorStr:='no resolve';
                 ErrorPing:=MAX_PING;
                 break; // Cancel any repeat Pings
              end else if PingICMP.status = CICMP_NO_RESPONSE then begin
                 ErrorStr:='нет ответа';
                 ErrorPing:=ErrorPing+1;
              end else begin
                 ErrorStr:='error '+inttostr(PingICMP.status);
                 ErrorPing:=MAX_PING;
                 break; // Cancel any repeat Pings
              end;
            end else begin
              SumPingRTT:=SumPingRTT+PingICMP.pIPEchoReply^.RTT;
            end;
          end;
          if ErrorPing=MAX_PING then
          Begin
            Nodes[i,j].Result.Caption:='Ошибка ('+ErrorStr+')';
            Nodes[i,j].Caption.Color:=clRed;
            Nodes[i,j].Result.Color:=clRed;
            Nodes[i,j].Result.Font.Style:=[fsBold];
          end
          else if ErrorPing=0 then
          Begin
            Nodes[i,j].Result.Caption:='Ок ('+FloatToStr(RoundTo(SumPingRTT/MAX_PING,1))+' мс)';
            Nodes[i,j].Caption.Color:=clBtnFace;
            Nodes[i,j].Result.Color:=clBtnFace;
            Nodes[i,j].Result.Font.Style:=[];
          end
          else
          Begin
            Nodes[i,j].Result.Caption:='Потери ('+IntToStr(ErrorPing)+' из '+IntToStr(MAX_PING)+')';
            Nodes[i,j].Caption.Color:=clFuchsia;
            Nodes[i,j].Result.Color:=clFuchsia;
            Nodes[i,j].Result.Font.Style:=[];
          end;
        end;
        { Finish PING }
      end; // nodes
    End; // groups
  end;{end with f_main}
end;



end.
