unit Predpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, RxLookup, OracleData, Oracle,
  ToolEdit, Buttons, ExtCtrls, ComCtrls, Grids, DBGridEh,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Item, Menus, TB2Dock, TB2Toolbar,DateUtils,
  GridsEh;

type
  Tf_Predpr = class(TForm)
    PageControl1: TPageControl;
    tabMain: TTabSheet;
    gb_Addr: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    q_banks: TOracleDataSet;
    ds_bank: TDataSource;
    q_Region: TOracleDataSet;
    ds_Region: TDataSource;
    q_Holding: TOracleDataSet;
    ds_Holding: TDataSource;
    q_Pertype: TOracleDataSet;
    ds_pertype: TDataSource;
    ds_Predpr: TDataSource;
    tabRS: TTabSheet;
    tabTerm: TTabSheet;
    tabLinks: TTabSheet;
    tabRoles: TTabSheet;
    gb_Rs_Def: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label15: TLabel;
    Label16: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label17: TLabel;
    lc_Region: TRxDBLookupCombo;
    sb_Regions: TSpeedButton;
    Label20: TLabel;
    lc_State: TRxDBLookupCombo;
    sb_States: TSpeedButton;
    gb_Kods: TGroupBox;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label21: TLabel;
    tabAkciz: TTabSheet;
    tabContacts: TTabSheet;
    DBEdit13: TDBEdit;
    gb_Class: TGroupBox;
    Label18: TLabel;
    lc_Holding: TRxDBLookupCombo;
    Label19: TLabel;
    lc_Pertype: TRxDBLookupCombo;
    Label22: TLabel;
    lc_Class: TRxDBLookupCombo;
    gb_Main: TGroupBox;
    Label1: TLabel;
    l_ID: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    e_Predpr_Name: TDBEdit;
    e_short_name: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    gb_Contacts_Def: TGroupBox;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    gb_Contacts: TGroupBox;
    gridContacts: TDBGridEh;
    gb_Rs: TGroupBox;
    gb_term_Def: TGroupBox;
    Label23: TLabel;
    gb_Term: TGroupBox;
    gb_Akciz_Def: TGroupBox;
    gb_Akciz: TGroupBox;
    cb_Ex_Svid: TDBCheckBox;
    Label24: TLabel;
    ed_RS: TDBEdit;
    e_TAG: TDBEdit;
    Label25: TLabel;
    BitBtn3: TBitBtn;
    gb_Roles: TGroupBox;
    gridRoles: TDBGridEh;
    gb_Links: TGroupBox;
    q_States: TOracleDataSet;
    ds_States: TDataSource;
    q_Class: TOracleDataSet;
    ds_Class: TDataSource;
    ds_Contacts: TDataSource;
    TBPopupMenu1: TTBPopupMenu;
    TBItem2: TTBItem;
    ActionManager1: TActionManager;
    acMemoEdit: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem4: TTBItem;
    TBItem3: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    acContactAdd: TAction;
    acContactDel: TAction;
    acContactApply: TAction;
    acContactRefresh: TAction;
    q_Contacts: TOracleDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField3: TIntegerField;
    StringField15: TStringField;
    q_ContactsID: TFloatField;
    q_Rs: TOracleDataSet;
    ds_Rs: TDataSource;
    q_RsID: TFloatField;
    q_RsPREDPR_ID: TFloatField;
    q_RsBANKS_ID: TFloatField;
    q_RsRS: TStringField;
    q_RsIS_MAIN: TIntegerField;
    q_banksID: TFloatField;
    q_banksKORS: TStringField;
    q_banksBIK: TStringField;
    q_banksBANK_NAME: TStringField;
    q_banksPOSTINDEX: TStringField;
    q_banksADDRESS: TStringField;
    q_RsBANK_KORS: TStringField;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem1: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem9: TTBItem;
    gridRS: TDBGridEh;
    acRSAdd: TAction;
    acRSApply: TAction;
    acRSDel: TAction;
    acRSRefresh: TAction;
    Label26: TLabel;
    DBEdit14: TDBEdit;
    q_cmn: TOracleQuery;
    q_RsBANK_NAME: TStringField;
    q_RsADDRESS: TStringField;
    q_RsPOSTINDEX: TStringField;
    q_RsBIK: TStringField;
    q_banks_def: TOracleDataSet;
    FloatField1: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    ds_banks_def: TDataSource;
    DBEdit15: TDBEdit;
    TBDock3: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    acTermAdd: TAction;
    acTermApply: TAction;
    acTermDel: TAction;
    acTermRefresh: TAction;
    q_Term: TOracleDataSet;
    ds_Term: TDataSource;
    q_TermPREDPR_ID: TIntegerField;
    q_TermSTAN_ID: TFloatField;
    q_TermPREDPR_GDKOD: TStringField;
    q_TermIS_MAIN: TIntegerField;
    q_TermID: TFloatField;
    gridTerm: TDBGridEh;
    q_Stan: TOracleDataSet;
    ds_Stan: TDataSource;
    q_StanSTAN_KOD: TIntegerField;
    q_StanID: TFloatField;
    q_StanSTAN_NAME: TStringField;
    q_StanAREN_DAYS: TIntegerField;
    q_StanRAST: TIntegerField;
    q_StanREGION_ID: TIntegerField;
    q_StanGDOR_ID: TIntegerField;
    q_StanOTDELENIE: TStringField;
    q_StanSTATES_ID: TFloatField;
    q_Vetka: TOracleDataSet;
    ds_Vetka: TDataSource;
    q_VetkaVETKA_NAME: TStringField;
    q_VetkaOWNER_ID: TIntegerField;
    q_VetkaIS_AUTO_LINK: TFloatField;
    q_TermSTAN_NAME: TStringField;
    q_TermSTAN_KOD: TIntegerField;
    q_StanGDOR_NAME: TStringField;
    q_TermGDOR_NAME: TStringField;
    q_TermSTAN_RAST: TIntegerField;
    q_TermVETKA_NAME: TStringField;
    q_Roles: TOracleDataSet;
    ds_Roles: TDataSource;
    TBDock4: TTBDock;
    TBToolbar4: TTBToolbar;
    TBItem15: TTBItem;
    TBItem17: TTBItem;
    acRoleApply: TAction;
    acRoleRefresh: TAction;
    q_RolesID: TFloatField;
    q_RolesCHAR1: TStringField;
    q_RolesNUM2: TFloatField;
    q_RolesNUM3: TFloatField;
    q_RolesNUM4: TFloatField;
    q_Akciz: TOracleDataSet;
    ds_Akciz: TDataSource;
    Label27: TLabel;
    DBEdit16: TDBEdit;
    q_AkcizID: TFloatField;
    q_AkcizPLAT_ID: TFloatField;
    q_AkcizDATE_BEG: TDateTimeField;
    q_AkcizDATE_END: TDateTimeField;
    q_AkcizEX_SVID: TFloatField;
    q_AkcizEX_SVID_PREF: TStringField;
    q_AkcizEX_SVID_NUMB: TStringField;
    q_AkcizDATE_CANCEL: TDateTimeField;
    q_AkcizDATE_GIVE: TDateTimeField;
    q_AkcizIS_OPT: TIntegerField;
    q_AkcizIS_ROZN: TIntegerField;
    q_AkcizPROD_GROUPS_ID: TFloatField;
    gridAkciz: TDBGridEh;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem14: TTBItem;
    TBItem16: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    acAkcizAdd: TAction;
    acAkcizApply: TAction;
    acAkcizDel: TAction;
    acAkcizRefresh: TAction;
    q_VetkaID: TFloatField;
    q_TermVETKA_ID: TIntegerField;
    procedure sb_RegionsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure sb_StatesClick(Sender: TObject);
    procedure acMemoEditExecute(Sender: TObject);
    procedure gridContactsSortMarkingChanged(Sender: TObject);
    procedure acContactAddExecute(Sender: TObject);
    procedure acContactApplyExecute(Sender: TObject);
    procedure acContactDelExecute(Sender: TObject);
    procedure acContactRefreshExecute(Sender: TObject);
    procedure q_ContactsBeforePost(DataSet: TDataSet);
    procedure q_RsBeforePost(DataSet: TDataSet);
    procedure gridRSSortMarkingChanged(Sender: TObject);
    procedure acRSAddExecute(Sender: TObject);
    procedure acRSApplyExecute(Sender: TObject);
    procedure acRSDelExecute(Sender: TObject);
    procedure acRSRefreshExecute(Sender: TObject);
    procedure gridRSDblClick(Sender: TObject);
    procedure acTermAddExecute(Sender: TObject);
    procedure acTermApplyExecute(Sender: TObject);
    procedure acTermDelExecute(Sender: TObject);
    procedure acTermRefreshExecute(Sender: TObject);
    procedure q_TermBeforePost(DataSet: TDataSet);
    procedure q_RsAfterPost(DataSet: TDataSet);
    procedure q_RsAfterDelete(DataSet: TDataSet);
    procedure q_TermAfterDelete(DataSet: TDataSet);
    procedure gridTermDblClick(Sender: TObject);
    procedure q_TermAfterPost(DataSet: TDataSet);
    procedure gridTermSortMarkingChanged(Sender: TObject);
    procedure gridRSColumns0EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure gridTermColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure gridTermColumns2EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridRolesDblClick(Sender: TObject);
    procedure q_RolesAfterPost(DataSet: TDataSet);
    procedure acRoleApplyExecute(Sender: TObject);
    procedure acRoleRefreshExecute(Sender: TObject);
    procedure acAkcizAddExecute(Sender: TObject);
    procedure acAkcizApplyExecute(Sender: TObject);
    procedure acAkcizDelExecute(Sender: TObject);
    procedure acAkcizRefreshExecute(Sender: TObject);
    procedure q_AkcizBeforePost(DataSet: TDataSet);
    procedure gridAkcizSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
    procedure ViewEditTabs;
  public
    { Public declarations }
    t_kls_data:TOracleDataSet;
  end;

var
  f_Predpr: Tf_Predpr;

implementation
uses KLSMisc2, MemoEdit, ForDB, main;
{$R *.dfm}

procedure Tf_Predpr.sb_RegionsClick(Sender: TObject);
begin
  if t_kls_data.State=dsBrowse then t_kls_data.Edit;
  KlsMisc2.SetKLSParam('KLS_REGION','CHOOSE',fsNormal,lc_Region.Value);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
      lc_Region.Value:=KlsMisc2.vIdToSeek;
    Free;
  end;
end;

procedure Tf_predpr.ViewEditTabs;
Begin
  Caption:='Редактирование предприятия "'+t_kls_data.FieldByName('PREDPR_NAME').AsString+'"';
  gb_Contacts.Caption:=' Список контактных лиц ';
  gb_Contacts.Enabled:=true;
  gb_RS.Caption:=' Список расчетных счетов ';
  gb_RS.Enabled:=true;
  gb_Term.Caption:=' Список терминалов ';
  gb_Term.Enabled:=true;
  gb_Roles.Caption:=' Список ролей ';
  gb_Roles.Enabled:=true;
  gb_Akciz.Caption:=' Список акцизных свидетельств ';
  gb_Akciz.Enabled:=true;
  gb_Akciz.Caption:=' Связи с другими системами ';
  gb_Akciz.Enabled:=true;

  q_Contacts.Close;
  q_Contacts.SQL[4]:='WHERE PREDPR_ID='+t_kls_data.FieldByName('ID').AsString;
  q_Contacts.Open;
  q_RS.Close;
  q_RS.SQL[4]:='WHERE PREDPR_ID='+t_kls_data.FieldByName('ID').AsString;
  q_RS.Open;
  q_Term.Close;
  q_Term.SQL[4]:='WHERE PREDPR_ID='+t_kls_data.FieldByName('ID').AsString;
  q_Term.Open;
  q_Akciz.Close;
  q_Akciz.SQL[4]:='WHERE PLAT_ID='+t_kls_data.FieldByName('ID').AsString;
  q_Akciz.Open;

  with q_cmn do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('BEGIN');
    SQL.Add('  DELETE FROM V_TEMPTABLE WHERE APP_NAME='''+APPLICATION_NAME+''' AND UNIT_NAME=''PREDPR'' AND TABLE_NAME=''PREDPR_ROLE'';');
    SQL.Add('  INSERT INTO V_TEMPTABLE(APP_NAME, UNIT_NAME, TABLE_NAME,CHAR1,NUM2,NUM3,NUM4)');
    SQL.Add('  SELECT');
    SQL.Add('    '''+APPLICATION_NAME+''',');
    SQL.Add('    ''PREDPR'',');
    SQL.Add('    ''PREDPR_ROLE'',');
    SQL.Add('    KLS_ROLE.PREDPR_ROLE,');
    SQL.Add('    KLS_ROLE.ID,');
    SQL.Add('    DECODE(roles.KLS_ROLE_ID,NULL,0,1),');
    SQL.Add('    roles.FOX_KOD');
    SQL.Add('  FROM KLS_ROLE,(SELECT * FROM PREDPR_ROLE WHERE PREDPR_ID='+t_kls_data.FieldByName('ID').AsString+') roles');
    SQL.Add('  WHERE KLS_ROLE.ID=roles.KLS_ROLE_ID(+)');
    SQL.Add('  ORDER BY KLS_ROLE.ID;');
    SQL.Add('  COMMIT;');
    SQL.Add('END;');
    Execute;
    Close;
  End;
  q_Roles.Close;
  q_Roles.Open;

End;

procedure Tf_Predpr.FormShow(Sender: TObject);
begin

  q_banks.Session:=f_main.ora_Session;
  q_banks_def.Session:=f_main.ora_Session;
  if t_kls_data.FieldByName('BANKS_ID').AsString<>'' then
    q_banks_def.SQL[1]:='WHERE ID='+t_kls_data.FieldByName('BANKS_ID').AsString
  else
    q_banks_def.SQL[1]:='WHERE 1=0';
  q_Region.Session:=f_main.ora_Session;
  q_States.Session:=f_main.ora_Session;
  q_Holding.Session:=f_main.ora_Session;
  q_Pertype.Session:=f_main.ora_Session;
  q_Contacts.Session:=f_main.ora_Session;
  q_Class.Session:=f_main.ora_Session;
  q_RS.Session:=f_main.ora_Session;
  q_Term.Session:=f_main.ora_Session;
  q_Stan.Session:=f_main.ora_Session;
  q_Vetka.Session:=f_main.ora_Session;
  q_cmn.Session:=f_main.ora_Session;
  q_Roles.Session:=f_main.ora_Session;

  q_banks.Open;
  q_banks_def.Open;
  q_Region.Open;
  q_States.Open;
  q_Holding.Open;
  q_Pertype.Open;
  q_Class.Open;
  q_Vetka.Open;
  q_Stan.Open;

  ds_Predpr.DataSet:=t_kls_data;

  If t_kls_data.State<>dsInsert then
  Begin
    ViewEditTabs;
  end
  else
  Begin
    Caption:='Добавление записи в справочник "Предприятия"';
  End;
end;

procedure Tf_Predpr.BitBtn1Click(Sender: TObject);
begin
  if t_kls_data.State in [dsEdit,dsInsert] then t_kls_data.Post;
  ModalResult:=mrOk;
end;

procedure Tf_Predpr.BitBtn3Click(Sender: TObject);
begin
  if t_kls_data.State in [dsEdit,dsInsert] then t_kls_data.Post;
  ViewEditTabs;
  t_kls_data.Edit;
end;

procedure Tf_Predpr.sb_StatesClick(Sender: TObject);
begin
  if t_kls_data.State=dsBrowse then t_kls_data.Edit;
  KlsMisc2.SetKLSParam('KLS_STATES','CHOOSE',fsNormal,lc_State.Value);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
      lc_State.Value:=KlsMisc2.vIdToSeek;
    Free;
  end;
end;

procedure Tf_Predpr.acMemoEditExecute(Sender: TObject);
begin
  f_db.EditInMemo(TDBGridEh(Sender));
end;

procedure Tf_Predpr.gridContactsSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Contacts,q_Contacts.SQL.Count-1,gridContacts);
end;

procedure Tf_Predpr.acContactAddExecute(Sender: TObject);
begin
  q_Contacts.Append;
end;

procedure Tf_Predpr.acContactApplyExecute(Sender: TObject);
begin
  if q_Contacts.State<>dsBrowse then q_Contacts.Post;
end;

procedure Tf_Predpr.acContactDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if q_Contacts.State<>dsBrowse then q_Contacts.Post;
    q_Contacts.Delete;
  End;
end;

procedure Tf_Predpr.acContactRefreshExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Contacts,true);
end;

procedure Tf_Predpr.q_ContactsBeforePost(DataSet: TDataSet);
begin
  q_Contacts.FieldByName('PREDPR_ID').AsInteger:=t_kls_data.FieldByname('ID').AsInteger;
end;

procedure Tf_Predpr.q_RsBeforePost(DataSet: TDataSet);
begin
  q_RS.FieldByName('PREDPR_ID').AsInteger:=t_kls_data.FieldByname('ID').AsInteger;
end;

procedure Tf_Predpr.gridRSSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_RS,q_RS.SQL.Count-1,gridRS);
end;

procedure Tf_Predpr.acRSAddExecute(Sender: TObject);
var vBankId:integer;
    vRS:string;
    vMAIN:integer;
begin
  if q_RS.State<>dsBrowse then q_RS.Post;
  if q_RS.EOF then
  Begin
    vBankID:=t_kls_data.FieldByName('BANKS_ID').AsInteger;
    vRS:=t_kls_data.FieldByname('RS').AsString;
    vMAIN:=1;
  End
  Else
  Begin
    vBankID:=0;
    vRS:='';
    vMAIN:=0;
  End;
  q_rs.Append;
  q_rsBANKS_ID.AsInteger:=vBankID;
  q_rsRS.AsString:=vRS;
  q_rsIS_MAIN.AsInteger:=vMAIN;
end;

procedure Tf_Predpr.acRSApplyExecute(Sender: TObject);
begin
  if q_RS.State<>dsBrowse then q_RS.Post;
end;

procedure Tf_Predpr.acRSDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if q_RS.State<>dsBrowse then q_RS.Post;
    q_RS.Delete;
  End;
end;

procedure Tf_Predpr.acRSRefreshExecute(Sender: TObject);
begin
  f_db.ReQuery(q_RS,true);
end;

procedure Tf_Predpr.gridRSDblClick(Sender: TObject);
begin
  if NOT q_RS.Eof then
  if gridRS.SelectedField.FullName='IS_MAIN' then
  Begin
    if q_RS.State<>dsBrowse then q_RS.Post;
    if q_rsIS_MAIN.AsInteger=1 then
    Begin
      // Уже - основной р/с
    End
    Else
      // Сделать основным
      with q_cmn do
      Begin
        q_Cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('BEGIN');
        q_cmn.SQL.Add('  UPDATE kls_predpr_rs SET is_main=0 WHERE predpr_id='+t_kls_data.FieldByName('ID').AsString+';');
        q_cmn.SQL.Add('  COMMIT;');
        q_cmn.SQL.Add('END;');
        q_cmn.Execute;
      end;
    q_Rs.Edit;
    q_RsIS_MAIN.AsInteger:=1;
    q_rs.Post;
    acRSRefreshExecute(Sender);
  End;
end;

procedure Tf_Predpr.acTermAddExecute(Sender: TObject);
var vGD_KOD:string;
    vSTAN_ID:integer;
    vVETKA_ID:integer;
    vMAIN:integer;
begin
  if q_Term.State<>dsBrowse then q_Term.Post;
  if q_Term.EOF then
  Begin
    vSTAN_ID:=2250;
    vVETKA_ID:=1;
    vMAIN:=1;
    vGD_KOD:=t_kls_data.FieldByName('GD_KOD').AsString;
  End
  Else
  Begin
    vSTAN_ID:=2250;
    vVETKA_ID:=1;
    vMAIN:=0;
    vGD_KOD:='';
  End;
  q_Term.Append;
  q_TermSTAN_ID.AsInteger:=vSTAN_ID;
  q_TermVETKA_ID.AsInteger:=vVETKA_ID;
  q_TermPREDPR_GDKOD.AsString:=vGD_KOD;
  q_TermIS_MAIN.AsInteger:=vMAIN;
end;

procedure Tf_Predpr.acTermApplyExecute(Sender: TObject);
begin
  if q_Term.State<>dsBrowse then q_Term.Post;
end;

procedure Tf_Predpr.acTermDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if q_Term.State<>dsBrowse then q_Term.Post;
    q_Term.Delete;
  End;
end;

procedure Tf_Predpr.acTermRefreshExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Term,true);
end;

procedure Tf_Predpr.q_TermBeforePost(DataSet: TDataSet);
begin
  q_Term.FieldByName('PREDPR_ID').AsInteger:=t_kls_data.FieldByname('ID').AsInteger;
end;

procedure Tf_Predpr.q_RsAfterPost(DataSet: TDataSet);
begin
  if q_rsIS_MAIN.AsInteger=1 then
  Begin
    if t_kls_data.State=dsBrowse then t_kls_data.Edit;
    t_kls_data.FieldByName('BANK_KORS').AsString:=q_rs.FieldByName('BANK_KORS').AsString;
    t_kls_data.FieldByName('RS').AsString:=q_rs.FieldByName('RS').AsString;
    t_kls_data.FieldByName('BANKS_ID').AsInteger:=q_rs.FieldByName('BANKS_ID').AsInteger;
    q_banks_def.Close;
    if t_kls_data.FieldByName('BANKS_ID').AsString<>'' then
      q_banks_def.SQL[1]:='WHERE ID='+t_kls_data.FieldByName('BANKS_ID').AsString
    else
      q_banks_def.SQL[1]:='WHERE 1=0';
    q_banks_def.Open;
  End;
end;

procedure Tf_Predpr.q_RsAfterDelete(DataSet: TDataSet);
begin
  if q_RS.Eof then
  Begin
    if t_kls_data.State=dsBrowse then t_kls_data.Edit;
    t_kls_data.FieldByName('BANK_KORS').AsString:='';
    t_kls_data.FieldByName('RS').AsString:='';
    t_kls_data.FieldByName('BANKS_ID').AsVariant:=VarNull;

    q_banks_def.Close;
    if t_kls_data.FieldByName('BANKS_ID').AsString<>'' then
      q_banks_def.SQL[1]:='WHERE ID='+t_kls_data.FieldByName('BANKS_ID').AsString
    else
      q_banks_def.SQL[1]:='WHERE 1=0';
    q_banks_def.Open;
  End;
end;

procedure Tf_Predpr.q_TermAfterDelete(DataSet: TDataSet);
begin
  if q_Term.Eof then
  Begin
    if t_kls_data.State=dsBrowse then t_kls_data.Edit;
    t_kls_data.FieldByName('GD_KOD').AsString:='';
  End;
end;

procedure Tf_Predpr.gridTermDblClick(Sender: TObject);
begin
  if NOT q_Term.Eof then
  if gridTerm.SelectedField.FullName='IS_MAIN' then
  Begin
    if q_Term.State<>dsBrowse then q_Term.Post;
    if q_TermIS_MAIN.AsInteger=1 then
    Begin
      // Уже - основной р/с
    End
    Else
      // Сделать основным
      with q_cmn do
      Begin
        q_Cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('BEGIN');
        q_cmn.SQL.Add('  UPDATE stan_predpr SET is_main=0 WHERE predpr_id='+t_kls_data.FieldByName('ID').AsString+';');
        q_cmn.SQL.Add('  COMMIT;');
        q_cmn.SQL.Add('END;');
        q_cmn.Execute;
      end;
    q_Term.Edit;
    q_TermIS_MAIN.AsInteger:=1;
    q_Term.Post;
    acTermRefreshExecute(Sender);
  End;
end;

procedure Tf_Predpr.q_TermAfterPost(DataSet: TDataSet);
begin
  if q_TermIS_MAIN.AsInteger=1 then
  Begin
    if t_kls_data.State=dsBrowse then t_kls_data.Edit;
    t_kls_data.FieldByName('GD_KOD').AsString:=q_TermPREDPR_GDKOD.AsString;
  End;
end;

procedure Tf_Predpr.gridTermSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Term,q_Term.SQL.Count-1,gridTerm);
end;

procedure Tf_Predpr.gridRSColumns0EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  KlsMisc2.SetKLSParam('KLS_BANKS','EDIT',fsNormal,q_rsBANKS_ID.AsString);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Banks,true);
      if q_RS.State=dsBrowse then q_RS.Edit;
      q_rsBANKS_ID.AsString:=KlsMisc2.vIdToSeek;
    End;
    Free;
  end;
end;

procedure Tf_Predpr.gridTermColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  KlsMisc2.SetKLSParam('KLS_STAN','EDIT',fsNormal,q_TermSTAN_ID.AsString);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Stan,true);
      if q_Term.State=dsBrowse then q_Term.Edit;
      q_TermSTAN_ID.AsString:=KlsMisc2.vIdToSeek;
    End;
    Free;
  end;
end;

procedure Tf_Predpr.gridTermColumns2EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  KlsMisc2.SetKLSParam('KLS_VETKA','EDIT',fsNormal,q_TermVETKA_ID.AsString);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      f_db.ReQuery(q_Vetka,true);
      if q_Term.State=dsBrowse then q_Term.Edit;
      q_TermVETKA_ID.AsString:=KlsMisc2.vIdToSeek;
    End;
    Free;
  end;
end;

procedure Tf_Predpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_cmn.Close;
  q_cmn.SQL.Clear;
end;

procedure Tf_Predpr.gridRolesDblClick(Sender: TObject);
begin
  if NOT q_Roles.Eof then
  if q_RolesNUM4.AsString='' then
  Begin
    if gridRoles.SelectedField.FullName='NUM3' then
    Begin
      if q_Roles.State<>dsBrowse then q_Roles.Post;
      q_Roles.Edit;
      if q_RolesNUM3.AsInteger=1 then q_RolesNUM3.AsInteger:=0
      else q_RolesNUM3.AsInteger:=1;
      try
        q_Roles.Post;
      except
        q_Roles.Cancel;
      end;
      acRoleRefreshExecute(Sender);
    End;
  End
  Else
    Application.MessageBox('Информацию о роли предприятия надо изменить в DBF-файле!','Внимание!',MB_OK);
end;

procedure Tf_Predpr.q_RolesAfterPost(DataSet: TDataSet);
begin
  if q_RolesNUM3.AsInteger=1 then
  Begin
    // Добавить строку в список ролей
    with q_cmn do
    Begin
      q_Cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('BEGIN');
      q_cmn.SQL.Add('  UPDATE predpr_role SET fox_kod=fox_kod');
      q_cmn.SQL.Add('   WHERE predpr_id='+t_kls_data.FieldByname('ID').AsString);
      q_cmn.SQL.Add('     AND kls_role_id='+q_RolesNUM2.AsString+';');
      q_cmn.SQL.Add('  IF SQL%NOTFOUND THEN ');
      q_cmn.SQL.Add('    INSERT INTO predpr_role (predpr_id,kls_role_id)');
      q_cmn.SQL.Add('      VALUES ('+t_kls_data.FieldByname('ID').AsString+','+q_RolesNUM2.AsString+');');
      q_cmn.SQL.Add('  END IF;');
      q_cmn.SQL.Add('  COMMIT;');
      q_cmn.SQL.Add('END;');
//      q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
      q_cmn.Execute;
    end;
  End
  Else
  Begin
    // Убрать строку из списка ролей
    with q_cmn do
    Begin
      q_Cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('BEGIN');
      q_cmn.SQL.Add('  DELETE FROM predpr_role');
      q_cmn.SQL.Add('   WHERE predpr_id='+t_kls_data.FieldByname('ID').AsString+' AND kls_role_id='+q_RolesNUM2.AsString+';');
      q_cmn.SQL.Add('  COMMIT;');
      q_cmn.SQL.Add('END;');
//      q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
      q_cmn.Execute;
    end;
  End
end;

procedure Tf_Predpr.acRoleApplyExecute(Sender: TObject);
begin
  if q_Roles.State<>dsBrowse then q_Roles.Post;
end;

procedure Tf_Predpr.acRoleRefreshExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Roles,true);
end;

procedure Tf_Predpr.acAkcizAddExecute(Sender: TObject);
var vEX_SVID:Integer;
    vDATE_BEG:TDateTime;
    vDATE_END:TDateTime;
begin
  if q_Akciz.State<>dsBrowse then q_Akciz.Post;
  if q_Akciz.EOF then
  Begin
    vDATE_BEG:=StartOfTheYear(Now);
    vDATE_END:=EndOfTheYear(Now);
    vEX_SVID:=t_kls_data.FieldByName('EX_SVID').AsInteger;
  End
  Else
  Begin
    vDATE_BEG:=StartOfTheYear(Now);
    vDATE_END:=EndOfTheYear(Now);
    vEX_SVID:=0;
  End;
  q_Akciz.Append;
  q_AkcizEX_SVID.AsInteger:=vEX_SVID;
  q_AkcizDATE_BEG.AsDateTime:=vDATE_BEG;
  q_AkcizDATE_END.AsDateTime:=vDATE_END;
end;

procedure Tf_Predpr.acAkcizApplyExecute(Sender: TObject);
begin
  if q_Akciz.State<>dsBrowse then q_Akciz.Post;
end;

procedure Tf_Predpr.acAkcizDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    if q_Akciz.State<>dsBrowse then q_Akciz.Post;
    q_Akciz.Delete;
  End;
end;

procedure Tf_Predpr.acAkcizRefreshExecute(Sender: TObject);
begin
  f_db.ReQuery(q_Akciz,true);
end;

procedure Tf_Predpr.q_AkcizBeforePost(DataSet: TDataSet);
begin
  q_Akciz.FieldByName('PLAT_ID').AsInteger:=t_kls_data.FieldByname('ID').AsInteger;
end;

procedure Tf_Predpr.gridAkcizSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Akciz,q_Akciz.SQL.Count-1,gridAkciz);
end;

end.
