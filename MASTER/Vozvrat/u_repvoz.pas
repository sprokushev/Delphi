unit u_repvoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DualList, MDIForm, PropFilerEh, PropStorageEh, StdCtrls,
  CheckLst, Buttons, main, Oracle, DB, OracleData, DBCtrls, Grids,
  DBGridEh, TB2Item, TB2Dock, TB2Toolbar, Mask, DBCtrlsEh, ExtCtrls, DateUtils,
  XPStyleActnCtrls, ActnList, ActnMan, ForSystem,  ForTemp, ShellApi;

type
  Tf_repvoz = class(Tf_MDIForm)
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    ds_numakt: TDataSource;
    TBDock1: TTBDock;
    TBDock2: TTBDock;
    TBToolbar1: TTBToolbar;
    GridSource: TDBGridEh;
    TBControlItem1: TTBControlItem;
    TBToolbar2: TTBToolbar;
    TBControlItem2: TTBControlItem;
    GroupBox1: TGroupBox;
    c_dbeg: TDBDateTimeEditEh;
    c_dend: TDBDateTimeEditEh;
    Panel1: TPanel;
    TBControlItem3: TTBControlItem;
    GridSelect: TDBGridEh;
    TBControlItem4: TTBControlItem;
    ActionManager1: TActionManager;
    acRequery: TAction;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    GroupBox2: TGroupBox;
    TBControlItem6: TTBControlItem;
    e_find: TEdit;
    But_find: TBitBtn;
    But_refresh: TSpeedButton;
    acFind: TAction;
    q_selakt: TOracleDataSet;
    ds_selakt: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    q_selaktNUM_AKT: TStringField;
    acSelone: TAction;
    q_selaktUSER_NAME: TStringField;
    acUnselone: TAction;
    acSelall: TAction;
    acUnselall: TAction;
    SpeedButton5: TSpeedButton;
    acPrint: TAction;
    q_numakt: TOracleDataSet;
    q_numaktNUM_AKT: TStringField;
    q_unselall: TOracleQuery;
    q_selall: TOracleQuery;
    q_selaktPRIZNAK: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acRequeryExecute(Sender: TObject);
    procedure c_dbegChange(Sender: TObject);
    procedure c_dendChange(Sender: TObject);
    procedure But_findClick(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure e_findKeyPress(Sender: TObject; var Key: Char);
    procedure acSeloneExecute(Sender: TObject);
    procedure acUnseloneExecute(Sender: TObject);
    procedure acSelallExecute(Sender: TObject);
    procedure acUnselallExecute(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure GridSelectDblClick(Sender: TObject);
    procedure GridSourceDblClick(Sender: TObject);
    procedure GridSourceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_repvoz: Tf_repvoz;
  //m_dbeg,m_dend: TDateTime;
  m_username,FromFile,ToFile: string;
  m_prior: string;
  f1,f2:String[255];
  gReportId:integer;

implementation

{$R *.dfm}

procedure Tf_repvoz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  acUnselall.Execute;
  Action:=caFree;
end;

procedure Tf_repvoz.FormCreate(Sender: TObject);
begin
  inherited;
  m_username:=F_ForSystem.GetUserName(true);
  q_numakt.SetVariable('USERN',m_username);
  q_selakt.SetVariable('USERN',m_username);
  q_numakt.SetVariable('D1',StartOfTheMonth(StartOfTheMonth(Date)-1));
  q_numakt.SetVariable('D2',EndOfTheMonth(Date));
  q_numakt.Active:=true;
  q_selakt.Active:=true;

end;

procedure Tf_repvoz.FormActivate(Sender: TObject);
begin
  inherited;
  c_dbeg.Value:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  c_dend.Value:=EndOfTheMonth(Date);
  //m_dbeg:=c_dbeg.Value;
  //m_dend:=c_dend.Value;
  acRequery.Execute;
end;

procedure Tf_repvoz.acRequeryExecute(Sender: TObject);
begin
  inherited;
  q_selakt.SetVariable('USERN',m_username);
  q_selakt.Close;
  q_selakt.Open;
  q_numakt.SetVariable('D1',c_dbeg.Value);
  q_numakt.SetVariable('D2',c_dend.Value);
  q_numakt.Close;
  q_numakt.Open;
end;

procedure Tf_repvoz.c_dbegChange(Sender: TObject);
begin
  inherited;
  if c_dbeg.Value>c_dend.Value then
    c_dend.Value:=EndOfTheMonth(c_dbeg.Value);
  //m_dbeg:=c_dbeg.Value;
end;

procedure Tf_repvoz.c_dendChange(Sender: TObject);
begin
  inherited;
  if c_dend.Value<c_dbeg.Value then
    c_dbeg.Value:=StartOfTheMonth(c_dend.Value);
  //m_dend:=c_dend.Value;
end;

procedure Tf_repvoz.But_findClick(Sender: TObject);
begin
  inherited;
   acFind.Execute;
end;

procedure Tf_repvoz.acFindExecute(Sender: TObject);
begin
    inherited;
    if not q_numakt.Locate('num_akt',Trim(e_find.Text),[loPartialKey]) then
       showmessage('Номер не найден')
    else
       Gridsource.SetFocus;
end;

procedure Tf_repvoz.e_findKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = Chr(13)) then
    begin
      acFind.Execute;
    end;
end;

procedure Tf_repvoz.acSeloneExecute(Sender: TObject);
begin
  inherited;
  if q_numakt.CountQueryHits>0 then

    begin
      q_selakt.Append;
      q_selakt.FieldValues['NUM_AKT']:=q_numakt.FieldValues['NUM_AKT'];
      q_selakt.FieldValues['USER_NAME']:=m_username;
      q_selakt.FieldValues['PRIZNAK']:=1;
      q_selakt.Post;
      q_numakt.Next;
      m_prior:=q_numakt.FieldValues['NUM_AKT'];
      acRequery.Execute;
      q_numakt.Locate('NUM_AKT',m_prior,[loPartialKey])
    end;

end;

procedure Tf_repvoz.acUnseloneExecute(Sender: TObject);
begin
  inherited;
  if not q_selakt.Eof then
    begin
      q_selakt.Delete;
      acRequery.Execute;
    end;
end;

procedure Tf_repvoz.acSelallExecute(Sender: TObject);
begin
  inherited;
{
  q_numakt.First;
  while not q_numakt.Eof do
    begin
      q_selakt.Append;
      q_selakt.FieldValues['NUM_AKT']:=q_numakt.FieldValues['NUM_AKT'];
      q_selakt.FieldValues['USER_NAME']:=m_username;
      q_selakt.Post;
      q_numakt.Next;
    end;
  acRequery.Execute;
}
  q_selall.SetVariable('D1',c_dbeg.Value);
  q_selall.SetVariable('D2',c_dend.Value);
  q_selall.SetVariable('USERN',m_username);
  q_selall.Execute;
  acRequery.Execute;
end;

procedure Tf_repvoz.acUnselallExecute(Sender: TObject);
begin
  inherited;

  q_unselall.SetVariable('USERN',m_username);
  q_unselall.Execute;
  acRequery.Execute;

end;

procedure Tf_repvoz.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  FromFile:='u:\master\xls\vozvrat.XLS';
  ToFile:='C:\TMP\vozvrat.XLS';
  Windows.COPYFILE(@FromFile[1],@ToFile[1],False);
  ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
end;

procedure Tf_repvoz.GridSelectDblClick(Sender: TObject);
begin
  inherited;
  acUnselone.Execute;
end;

procedure Tf_repvoz.GridSourceDblClick(Sender: TObject);
begin
  inherited;
  acSelone.Execute;
end;

procedure Tf_repvoz.GridSourceKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = Chr(13)) then
    begin
      acSelone.Execute;
    end;
end;

end.
