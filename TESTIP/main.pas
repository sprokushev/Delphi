unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXShell, Menus, XPStyleActnCtrls, ActnList, ActnMan, ExtCtrls,
  ComCtrls, AppEvnts, ForEnv, ForSESS, Oracle, StrUtils, StdCtrls, Buttons,
  ICMP, PingTh, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

const
  APPLICATION_NAME='TESTIP';
  APPLICATION_VERSION='beta';
  SCHEMA_NAME='';
  MAX_GROUPS=10;
  MAX_NODES=10;
  MAX_SERVICES=10;

type
  TGroupInfo = record
    Name:string[50];
    NodeCnt:integer;
  end;

  TNodeInfo = record
    Name:string[50];
    Host:string[50];
    ServiceCnt:integer;
    Caption:TLabel;
    Result:TLabel;
  end;

  TServiceInfo = record
    Name:string[50];
    Host:string[50];
    Tip:string[20];
    Query:string[250];
    Caption:TLabel;
    Result:TMemo;
  end;

type
  Tf_main = class(TForm)
    rxtiMain: TRxTrayIcon;
    PopupMenuMain: TPopupMenu;
    miCheck: TMenuItem;
    miExit: TMenuItem;
    PageControl: TPageControl;
    TabARM: TTabSheet;
    TabService: TTabSheet;
    panARM: TPanel;
    sbARM: TScrollBox;
    panService: TPanel;
    sbService: TScrollBox;
    ActionManager: TActionManager;
    ApplicationEvents: TApplicationEvents;
    acMainClose: TAction;
    acMainShow: TAction;
    acMainQuit: TAction;
    acPingExecute: TAction;
    ora_Session: TOracleSession;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PingICMP: Ticmp;
    acServiceClose: TAction;
    IdTCPClient: TIdTCPClient;
    procedure acMainCloseExecute(Sender: TObject);
    procedure acMainShowExecute(Sender: TObject);
    procedure acMainQuitExecute(Sender: TObject);
    procedure acPingExecuteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    // ����������
    ApplSession:TApplSession; // ������ ������� ����������
    ApplIniName:string; // INI-���� ����������

    // ����������
    MasterRPTPath, // ���� � �������� � ��������� rpt-�������
    MasterXLSPath:string; // ���� � �������� � ��������� xls-�������
    GroupCnt:integer;

    Groups:array [1..MAX_GROUPS] of TGroupInfo;
    Nodes:array [1..MAX_GROUPS,1..MAX_NODES] of TNodeInfo;
    Services:array [1..MAX_GROUPS,1..MAX_NODES,1..MAX_SERVICES] of TServiceInfo;

    // ������������
    UserADMIN:boolean;

    GroupI:integer;
    NodeJ:integer;

    // Ping
    pPingThread : TPingThread;
    procedure pPingThTerminated(Sender: TObject);
    procedure ServiceView(Sender: TObject);
  end;

var
  f_main: Tf_main;

implementation

{$R *.dfm}

procedure Tf_main.acMainCloseExecute(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure Tf_main.acMainShowExecute(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_SHOW);
end;

procedure Tf_main.acMainQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure Tf_main.pPingThTerminated(Sender: TObject);
begin
  pPingThread := nil;
end;

procedure Tf_main.acPingExecuteExecute(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;

  // �������
  if not Assigned(pPingThread) then
  begin
    pPingThread := TPingThread.Create(False);
    pPingThread.FreeOnTerminate := True;
    pPingThread.OnTerminate := pPingThTerminated;
    pPingThread.Resume;
  end;
end;

procedure Tf_main.FormCreate(Sender: TObject);
var
  str:TStringList;
  YY,XX,i,j,k:integer;
  s:string;
  gb:TGroupBox;
  tb:TButton;
begin
  Caption:=Caption+' (������: '+APPLICATION_VERSION+')';
  ApplIniName:=ExtractFilePath(ParamStr(0))+'ti_client.ini';
  str:=TStringList.Create;
  str.Delimiter:=';';
  str.QuoteChar:='"';

  // ������� ������
  ApplSession:=TApplSession.Create(Self);

  // ������������� ����������
  UserADMIN:=true;
  F_Env:=TMasterEnv.Create(Self);
  try
    F_Env.OpenINI(ApplIniName,'');
    // ����������
    with F_Env.ApplIni do
    begin
      GroupCnt:=0;
      for i:=1 to MAX_GROUPS do
      Begin
        s:=ReadString('GROUP'+IntToStr(i), 'GROUPNAME', '');
        Groups[i].Name:= s;
        Groups[i].NodeCnt:=0;
        if groups[i].Name<>'' then
        Begin
          Inc(GroupCnt);
          for j:=1 to MAX_NODES do
          Begin
            s:=ReadString('GROUP'+IntToStr(i), 'NODE'+IntToStr(j), '');
            s:=AnsiReplaceStr(s,';',#13);
            s:=AnsiReplaceStr(s,'"','');
            str.Clear;
            str.Text:=s;
            if (str.Count=2) and (str.Strings[0]<>'') then
            Begin
              Nodes[GroupCnt,j].Name:=str.Strings[0];
              Nodes[GroupCnt,j].Host:=str.Strings[1];
              Nodes[GroupCnt,j].ServiceCnt:=0;
              inc(Groups[GroupCnt].NodeCnt);
              for k:=1 to MAX_SERVICES do
              Begin
                s:=ReadString('GROUP'+IntToStr(i), 'NODE'+IntToStr(j)+'_SERVICE'+IntToStr(k), '');
                s:=AnsiReplaceStr(s,';',#13);
                s:=AnsiReplaceStr(s,'"','');
                str.Clear;
                str.Text:=s;
                if (str.Count=4) and (str.Strings[0]<>'') then
                Begin
                  Services[GroupCnt,Groups[GroupCnt].NodeCnt,k].Name:=str.Strings[0];
                  Services[GroupCnt,Groups[GroupCnt].NodeCnt,k].Host:=str.Strings[1];
                  Services[GroupCnt,Groups[GroupCnt].NodeCnt,k].Tip:=str.Strings[2];
                  Services[GroupCnt,Groups[GroupCnt].NodeCnt,k].Query:=str.Strings[3];
                  inc(Nodes[GroupCnt,Groups[GroupCnt].NodeCnt].ServiceCnt);
                end; // if service
              end; //services
            end; // if node
          end; // nodes
        end; // if group
      end; //groups
    end; //end with

    // ������� ������
    ApplSession.InitSession(amFull,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',nil);
  except
    on E: Exception do
    Begin
      // ������� ������
      ApplSession.InitSession(amFull,APPLICATION_NAME,SCHEMA_NAME,'MAIN',ApplIniName,'������ ����������',nil);
      ApplSession.WriteToLog(amDefault,'MAIN',sesError,E.Message+#13#10+'�� ������� �������� ������',0,'');
    end;
  end;

  str.Clear;
  str.Free;

  // ������� INI-����
  F_Env.CloseINI;

  // ��������� �����
  tabService.Caption:='';
  PageControl.ActivePage:=tabARM;
  // ������� �����
  for i:=1 to GroupCnt do
  Begin
    gb:=TGroupBox.Create(Self);
    with gb do
    begin
      Parent := sbARM;
      Caption:=Groups[i].Name;
      Left := 1;
      Align:=alTop;

      YY:=15;
      // ������� �����
      for j:=1 to Groups[i].NodeCnt do
      Begin
        XX:=0;
        // ��������
        Nodes[i,j].Caption:=TLabel.Create(Self);
        with Nodes[i,j].Caption do
        begin
          Parent := gb;
          Caption:= Nodes[i,j].Name + ' ('+Nodes[i,j].Host+')';
          Left := XX+1;
          Top := YY;
          AutoSize:=false;
          Alignment:=taLeftJustify;
          Width:=300;
          XX:=XX+Width+5
        end;
        // ���������
        Nodes[i,j].Result:=TLabel.Create(Self);
        with Nodes[i,j].Result do
        begin
          Parent := gb;
          Caption:= '�� (0 ��)';
          Left := XX+1;
          Top := YY;
          AutoSize:=false;
          Alignment:=taCenter;
          Width:=150;
          XX:=XX+Width+5
        end;
        // ������
        if Nodes[i,j].ServiceCnt>0 then
        Begin
          tb:=TButton.Create(Self);
          gb.InsertControl(tb);
          with tb do
          begin
            Parent := gb;
            Caption:= '�������';
            Left := XX+1;
            Top := YY-4;
            Width:=60;
            Height:=20;
            XX:=XX+Width+5;
            Tag:=i*1000+j;
            OnClick:=ServiceView;
          end;
        end;
        YY:=YY+20;
      end; // nodes
      Height:=Groups[i].NodeCnt*22+10;
    end; // end with gb
  End; // groups

  acPingExecuteExecute(Sender);
end;

procedure Tf_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // ��������� ������
  ApplSession.DoneSession('MAIN');
end;

procedure Tf_main.ServiceView(Sender: TObject);
var
  YY,XX,k:integer;
  s:string;
begin
  GroupI:=TButton(Sender).Tag div 1000;
  NodeJ:=TButton(Sender).Tag mod 1000;
  // �������� �����
  for k:=1 to Nodes[GroupI,NodeJ].ServiceCnt do
  Begin
    // �������
    FreeAndNil(Services[GroupI,NodeJ,k].Caption);
    FreeAndNil(Services[GroupI,NodeJ,k].Result);
  End; // services

  // ��������� �����
  PageControl.ActivePage:=tabService;
  if GroupI>GroupCnt then exit;
  if NodeJ>Groups[GroupI].NodeCnt then exit;
  if Nodes[GroupI,NodeJ].ServiceCnt<=0 then exit;

  tabService.Caption:='������� '+Nodes[GroupI,NodeJ].Name + ' ('+Nodes[GroupI,NodeJ].Host+')';

  YY:=1;
  // ������� ��������
  for k:=1 to Nodes[GroupI,NodeJ].ServiceCnt do
  Begin
    XX:=0;
    // ��������
    Services[GroupI,NodeJ,k].Caption:=TLabel.Create(Self);
    with Services[GroupI,NodeJ,k].Caption do
    begin
      Parent := sbService;
      Caption:= Services[GroupI,NodeJ,k].Name + ' ('+Services[GroupI,NodeJ,k].Host+')';
      Left := XX+1;
      Top := YY;
      AutoSize:=false;
      Alignment:=taLeftJustify;
      Width:=300;
      XX:=XX+Width+5
    end;
    // ���������
    YY:=YY+20;
    XX:=0;
    Services[GroupI,NodeJ,k].Result:=TMemo.Create(Self);
    with Services[GroupI,NodeJ,k].Result do
    begin
      Parent := sbService;
      ReadOnly:=true;
      Left := XX+1;
      Top := YY;
      ScrollBars:=ssVertical;
      // ��������� ������
      with IdTCPClient do
      begin
        Host := Services[GroupI,NodeJ,k].Host;
        Port := 50001;
        try
          Connect; // add a timeout here if you wish, eg: Connect(3000) = timeout after 3 seconds.
          WriteBuffer(Services[GroupI,NodeJ,k],SizeOf(Services[GroupI,NodeJ,k]),true);
          // ping
          s:=ReadLn;
          Services[GroupI,NodeJ,k].Result.Lines.Add(s);
          // ������ �������
          s:=ReadLn;
          Services[GroupI,NodeJ,k].Result.Lines.Add(s);
          if s='������ - ��' then
          Begin
            Services[GroupI,NodeJ,k].Caption.Color:=clBtnFace;
          End
          else
          Begin
            Services[GroupI,NodeJ,k].Caption.Color:=clRed;
          End;
          Disconnect;
        except
        end;
      end;
      // �������� ���������
      //Lines.Text:= 'Ok';
      Width:=500;
      Height:=50;
      XX:=XX+Width+5;
      YY:=YY+Height+5;
    end;
  End; // services
end;

end.