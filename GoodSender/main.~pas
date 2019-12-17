{-----------------------------------------------------------------------------
 Demo Name: SMTPRelay
 Author:    Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
 Copyright: Indy Pit Crew
 Purpose:
 History:
 Date:      27/10/2002 00:27:55
 Checked with Indy version: 9.0 - Allen O'Neill - Springboard Technologies Ltd  - http://www.springboardtechnologies.com
-----------------------------------------------------------------------------
 Notes:

 Demonstrates sending an email without the use of a local SMTP server
 This works by extracting the domain part form the recipient email address,
 then doing an MX lookup against a DNS server for that domain part,
 and finally connecting directly to the SMTP server that the MX record
 point to, to deliver the message.

}


unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdComponent,
  IdUDPBase, IdUDPClient, IdDNSResolver, IdBaseComponent, IdMessage,
  StdCtrls, ExtCtrls, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, Mask,
  ToolEdit, Placemnt, RXShell, AppEvnts, Menus;

type
  TfrmMain = class(TForm)
    sbMain: TStatusBar;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtDNS: TEdit;
    edtSender: TEdit;
    edtRecipient: TEdit;
    edtSubject: TEdit;
    mmoMessageText: TMemo;
    btnSendMail: TButton;
    btnExit: TButton;
    edtTimeOut: TEdit;
    IdMessage: TIdMessage;
    IdDNSResolver: TIdDNSResolver;
    IdSMTP: TIdSMTP;
    IdAntiFreeze: TIdAntiFreeze;
    Label1: TLabel;
    e_MailPath: TDirectoryEdit;
    m_CantMove: TMemo;
    Label4: TLabel;
    Label9: TLabel;
    m_FilesToSend: TMemo;
    m_Log: TMemo;
    Splitter1: TSplitter;
    m_SMTPServers: TMemo;
    Label10: TLabel;
    FormStorage1: TFormStorage;
    Timer1: TTimer;
    l_Time: TLabel;
    RxTrayIcon1: TRxTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    N1: TMenuItem;
    SendMail1: TMenuItem;
    Exit1: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
    procedure SendMail1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  f_log:TextFile;
  fMailServers : TStringList;
  Function PadZero(s:String):String;
  Function GetMailServers(ServerNo:integer):Boolean;
  Function ValidData : Boolean;
  Procedure SendMail; OverLoad;
  Function SendMail(aHost : String):Boolean; OverLoad;
  Procedure LockControls;
  procedure UnlockControls;
  Procedure Msg(aMessage:String);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}


procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnSendMailClick(Sender: TObject);
var
  SR:TSearchRec;
  SR2:TSearchRec;
begin
  RxTrayIcon1.Animated:=True;
  Timer1.Enabled:=False;
  if e_MailPath.Text[length(e_MailPath.Text)]<>'\' then
    e_MailPath.Text:=e_MailPath.Text+'\';
  Msg('');
  LockControls;
  sr.Name:='*.*';
  sr.Attr:=faAnyFile;
  if FindFirst(e_MailPath.Text+'*.*', faAnyFile, sr) = 0 then
    repeat
      if (pos('@',sr.Name)<>0) then
        begin
          Refresh;
          edtRecipient.Text:=sr.Name;
          if FindFirst(e_MailPath.Text+sr.Name+'\*.*', faAnyFile, sr2) = 0 then
            repeat
              if (SR2.Name<>'.') and (SR2.Name<>'..') and (UpperCase(SR2.Name)<>'SENT') then
                begin
                  if ValidData then SendMail;
                  break;
                end;
            until FindNext(SR2)<>0;
          FindClose(SR2);
        end;
     until FindNext(sr) <> 0;
  FindClose(sr);
  UnlockControls;
  Msg('');
  Timer1.Enabled:=True;
  RxTrayIcon1.Animated:=False;
end;

function TfrmMain.GetMailServers(ServerNo:integer): Boolean;
var
  i,x : integer;
  LDomainPart : String;
  LMXRecord : TMXRecord;
begin
if not assigned(fmailServers) then fMailServers := TStringList.Create;
fmailServers.clear;

Result := true;
with IdDNSResolver do
  begin
  QueryResult.Clear;
  QueryRecords := [qtMX];
  Msg('Setting up DNS query parameters');
  Host := edtDNS.text;
  ReceiveTimeout := StrToInt(edtTimeOut.text);
  // Extract the domain part from recipient email address
  if UpperCase(m_SMTPServers.Lines[ServerNo])='DIRECT' then
    LDomainPart := copy(edtRecipient.text,pos('@',edtRecipient.text)+1,length(edtRecipient.text))
  else
    LDomainPart :=m_SMTPServers.Lines[ServerNo];

  try
  Msg('Resolving DNS');
  Resolve(LDomainPart);

  if QueryResult.Count > 0 then
    begin
      for i := 0 to QueryResult.Count - 1 do
        begin
          LMXRecord := TMXRecord(QueryResult.Items[i]);
          fMailServers.Append(PadZero(IntToStr(LMXRecord.Preference)) + '=' + LMXRecord.ExchangeServer);
        end;

    // sort in order of priority and then remove extra data
    fMailServers.Sorted := false;
    for i := 0 to fMailServers.count - 1 do
      begin
      x := pos('=',fMailServers.Strings[i]);
      if x > 0 then fMailServers.Strings[i] :=
        copy(fMailServers.Strings[i],x+1,length(fMailServers.Strings[i]));
      end;
    fMailServers.Sorted := true;
    fMailServers.Duplicates := dupIgnore;
    Result := true;
    end
  else
    begin
    Msg('No response from DNS server');
//    MessageDlg('There is no response from the DNS server !', mtInformation, [mbOK], 0);
    Result := false;
    end;
  except
  on E : Exception do
    begin
    Msg('Error resolving domain');
//    MessageDlg('Error resolving domain: ' + e.message, mtInformation, [mbOK], 0);
    Result := false;
    end;
  end;

  end;
end;

// Used in DNS preferance sorting
procedure TfrmMain.LockControls;
var i : integer;
begin
edtDNS.enabled := false;
edtSender.enabled := false;
edtRecipient.enabled := false;
edtSubject.enabled := false;
mmoMessageText.enabled := false;
btnExit.enabled := false;
btnSendMail.enabled := false;
end;

procedure TfrmMain.UnlockControls;
begin
edtDNS.enabled := true;
edtSender.enabled := true;
edtRecipient.enabled := true;
edtSubject.enabled := true;
mmoMessageText.enabled := true;
btnExit.enabled := true;
btnSendMail.enabled := true;
end;


function TfrmMain.PadZero(s: String): String;
begin
if length(s) < 2 then
  s := '0' + s;
Result := s;
end;

procedure TfrmMain.SendMail;
var
  i : integer;
  X : TIdAttachment;
  sr: TSearchRec;
  Year,Month,Day,
  Hour, Min, Sec, MSec: Word;
  F1,F2:String[255];
  FileIsBlocked:Boolean;
  CurrSMTpServer:Integer;
  SendResult:Boolean;
  f:TextFile;
  s:String;
  MesSize:integer;
begin
  CurrSMTPServer:=0;
  with IdMessage do
    begin
      Msg('Assigning mail message properties');
      From.Text := edtSender.text;
      Sender.Text := edtSender.text;
      Recipients.EMailAddresses := edtRecipient.text;
      Subject := edtSubject.text;
      Body := mmoMessageText.Lines;
      sr.Name:='*.*';
      sr.Attr:=faAnyFile;
      if FileExists(e_MailPath.Text+edtRecipient.text+'\subject.it') then
        begin
          AssignFile(F,e_MailPath.Text+edtRecipient.text+'\subject.it');
          Reset(F);
          readln(f,S);
          if S<>'' then Subject:=S;
          CloseFile(F);
          DeleteFile(e_MailPath.Text+edtRecipient.text+'\subject.it')
        end;
      if FindFirst(e_MailPath.Text+edtRecipient.text+'\*.*', faAnyFile, sr) = 0 then
        begin
          repeat
            if (sr.Name<>'.')
              and (sr.Name<>'..')
              and (UpperCase(sr.Name)<>'SENT')
              and (UpperCase(sr.Name)<>'SUBJECT.IT') then
              begin
                FileIsBlocked:=False;
                for i:=0 to m_CantMove.Lines.Count-1 do
                  if m_CantMove.Lines[i]=e_MailPath.Text+edtRecipient.text+'\'+sr.Name then
                    FileIsBlocked:=true;
                if not FileIsBlocked then
                  begin
                    X := TIdAttachment.Create(IdMessage.MessageParts,e_MailPath.Text+edtRecipient.text+'\'+sr.Name);
                    m_FilesToSend.Lines.Add(sr.Name);
                    MesSize:=MesSize+sr.Size;
                    Msg('File '+sr.Name+' attached ('+ IntToStr(MesSize)+' bytes)');
                  end;
              end;
           until FindNext(sr) <> 0;
           FindClose(sr);
        end;
    end;
    // ========================== ÂÀÆÍÎ ==================================================
    if m_FilesToSend.Lines.Count=0 then Exit;
    // ========================== ÂÀÆÍÎ ==================================================
    SendResult:=False;
    while (not SendResult) do
      begin
        while (not GetMailServers(CurrSMTpServer)) and (CurrSMTpServer<m_SMTPServers.Lines.Count) do
          inc(CurrSMTpServer);
        for i := 0 to fMailServers.count -1 do
          begin
            Msg('Attempting to send mail ('+IntToStr(MesSize)+') bytes');
            if SendMail(fMailServers.Strings[i]) then
              begin
                SendResult:=True;
                IdMessage.MessageParts.Clear;
                // Ïåðåíîñ ôàéëîâ
                while m_FilesToSend.Lines.Count>0 do
                  begin
                    DecodeDate(Sysutils.Date,Year,Month,Day);
                    DecodeTime(Time(),Hour, Min, Sec, MSec);
                    F1:=e_MailPath.Text+edtRecipient.text+'\'+m_FilesToSend.Lines[0]+#0;
                    F2:=e_MailPath.Text+edtRecipient.text+'\SENT\'+
                      Copy('0'+IntToStr(Year),Length(IntToStr(Year)),2)+'_'+
                      Copy('0'+IntToStr(Month),Length(IntToStr(Month)),2)+'_'+
                      Copy('0'+IntToStr(Day),Length(IntToStr(Day)),2)+' '+
                      Copy('0'+IntToStr(Hour),Length(IntToStr(Hour)),2)+'_'+
                      Copy('0'+IntToStr(Min),Length(IntToStr(Min)),2)+'_'+
                      Copy('0'+IntToStr(Sec),Length(IntToStr(Sec)),2)+' '+m_FilesToSend.Lines[0]+#0;
                    if not MoveFile(@F1[1],@F2[1]) then
                      begin
                        if FileExists(e_MailPath.Text+edtRecipient.text+'\'+m_FilesToSend.Lines[0]) then
                          m_CantMove.Lines.Add(e_MailPath.Text+edtRecipient.text+'\'+m_FilesToSend.Lines[0]);
                      end;
                    m_FilesToSend.Lines.Delete(0);
                  end;
                m_FilesToSend.Clear;
                Exit;
              end;
          end;
        inc(CurrSMTpServer);
      end;
  // if we are here then something went wrong .. ie there were no available servers to accept our mail!
  //MessageDlg('Could not send mail to remote server - please try again later.', mtInformation, [mbOK], 0);
  if assigned(fMailServers) then FreeAndNil(fMailServers);
  IdMessage.MessageParts.Clear;
end;

function TfrmMain.SendMail(aHost: String): Boolean;
begin
Result := false;
with IdSMTP do
  begin
    Caption := 'Trying to sendmail via: ' + aHost;
    Msg('Trying to sendmail via: ' + aHost+' to '+edtRecipient.text);
    Host := aHost;
    try
      Msg('Attempting connect');
      Connect;
      Msg('Successful connect ... sending message');
      Send(IdMessage);
      Msg('Attempting disconnect');
      Disconnect;
      msg('Successful disconnect');
      Result := true;
    except on E : Exception do
      begin
        if connected then try disconnect; except end;
        Msg('Error sending message '+E.Message);
        result := false;
      end;
    end;
  end;
  Caption := '';
end;


function TfrmMain.ValidData: Boolean;
var ErrString:string;
begin
Result := True;
ErrString := '';

if trim(edtDNS.text) = '' then ErrString := ErrString +  'DNS server not filled in';
if trim(edtSender.text) = '' then ErrString := ErrString + 'Sender email not filled in';
if trim(edtRecipient.text) = '' then ErrString := ErrString +  'Recipient not filled in';

if ErrString <> '' then
  begin
  Msg('Cannot proceed due to the following errors: '+ErrString);
  Result := False;
  end;
end;

procedure TfrmMain.Msg(aMessage: String);
begin
  sbMain.SimpleText := aMessage;
  if aMessage<>'' then
    begin
      if m_Log.Lines.Count>1000 then m_Log.Lines.Delete(m_Log.Lines.Count-1);
      m_Log.Lines.Insert(0,FormatDateTime('dd.mm.yyyy hh:nn:ss ',now)+aMessage);
      Writeln(f_log,FormatDateTime('dd.mm.yyyy hh:nn:ss ',now)+aMessage);
      Flush(f_log);
    end;
  application.ProcessMessages;
end;


procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  Tm:String[5];
begin
  l_Time.Caption:=FormatDateTime('HH:NN:SS',Now);
  tm:=FormatDateTime('NN:SS',Now);
  Delete(tm,1,1);
  if (tm='0:00') or (tm='5:00') then
    begin
      Timer1.Enabled:=False;
      btnSendMail.Click;
      Timer1.Enabled:=True;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  AssignFile(f_log,ChangeFileExt(ParamStr(0),'.log'));
  if FileExists(ChangeFileExt(ParamStr(0),'.log')) then
    Append(f_log)
  else
    Rewrite(f_log);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (MessageDlg('Exit now? Are You realy sure?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    CloseFile(f_log)
  else
    Action:=caNone;
end;

procedure TfrmMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmMain.ApplicationEvents1Restore(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOW);
end;

procedure TfrmMain.SendMail1Click(Sender: TObject);
begin
  btnSendMailClick(Self);
end;

procedure TfrmMain.Restore1Click(Sender: TObject);
begin
  Application.Restore;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.


