unit U_zayav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, StdCtrls, Mask,
  DBCtrlsEh, RxLookup, TB2Item, TB2Dock, TB2Toolbar, ExtCtrls, ToolEdit,
  RXDBCtrl, ActnList, XPStyleActnCtrls, ActnMan, ImgList, Buttons, ADODB,
  DateUtils, Menus, GridsEh ;

type
  Tf_zayav = class(TForm)
    ActMan: TActionManager;
    requery_zayav: TAction;
    TBDock2: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem_add: TTBItem;
    TBItem_Rec: TTBItem;
    TBItem_del: TTBItem;
    q_filter_prod: TOracleDataSet;
    ds_filter_prod: TDataSource;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem_ClearFilter: TTBItem;
    TBItem_reis: TTBItem;
    CopyZayav: TAction;
    TBItem1: TTBItem;
    find_nomz: TAction;
    ds_zayav: TDataSource;
    q_zayav: TOracleDataSet;
    menu_print: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N11: TMenuItem;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel4: TPanel;
    l_nomz: TLabel;
    e_nomz: TEdit;
    Label5: TLabel;
    c_BeginDate: TDBDateTimeEditEh;
    Label6: TLabel;
    c_EndDate: TDBDateTimeEditEh;
    Label7: TLabel;
    c_DateReg: TDBDateTimeEditEh;
    Label8: TLabel;
    c_DateSogl: TDBDateTimeEditEh;
    Label9: TLabel;
    c_Otprav: TRxDBLookupCombo;
    Label10: TLabel;
    c_Exped: TRxDBLookupCombo;
    Label11: TLabel;
    c_plattar: TRxDBLookupCombo;
    t_dog: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    c_rodvag: TRxDBLookupCombo;
    c_grgr: TRxDBLookupCombo;
    c_prod: TRxDBLookupCombo;
    Label16: TLabel;
    t_statnagr: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    c_podach: TRxDBLookupCombo;
    c_protpr: TRxDBLookupCombo;
    Label20: TLabel;
    c_stanotpr: TRxDBLookupCombo;
    Label21: TLabel;
    e_nomotd: TEdit;
    c_vladput: TRxDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    c_vidsoob: TRxDBLookupCombo;
    q_otprav: TOracleDataSet;
    q_exped: TOracleDataSet;
    q_plattar: TOracleDataSet;
    q_prod: TOracleDataSet;
    q_grgr: TOracleDataSet;
    q_rodvag: TOracleDataSet;
    q_stanotpr: TOracleDataSet;
    q_vladput: TOracleDataSet;
    q_podach: TOracleDataSet;
    q_protpr: TOracleDataSet;
    q_vidsoob: TOracleDataSet;
    q_prinvag: TOracleDataSet;
    ds_otprav: TDataSource;
    ds_exped: TDataSource;
    ds_plattar: TDataSource;
    ds_prod: TDataSource;
    ds_grgr: TDataSource;
    ds_rodvag: TDataSource;
    ds_stanotpr: TDataSource;
    ds_podach: TDataSource;
    ds_protpr: TDataSource;
    ds_vladput: TDataSource;
    ds_vidsoob: TDataSource;
    ds_prinvag: TDataSource;
    obnov: TAction;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    GroupBox3: TGroupBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    c_filter_regdate1: TDBDateTimeEditEh;
    c_filter_regdate2: TDBDateTimeEditEh;
    Panel1: TPanel;
    b_zayav_refresh: TSpeedButton;
    Label3: TLabel;
    e_find_nomz: TEdit;
    B_find: TButton;
    c_filter_prod: TRxDBLookupCombo;
    q_delreis: TOracleQuery;
    N10: TMenuItem;
    Label24: TLabel;
    l_count_reis: TLabel;
    q_count_reis: TOracleDataSet;
    q_renewtest: TOracleQuery;
    RadioGroup2: TRadioGroup;
    q_podpis: TOracleDataSet;
    ds_podpis: TDataSource;
    Label25: TLabel;
    c_podpis: TRxDBLookupCombo;
    acGU12ToDBF: TAction;
    TBItem2: TTBItem;
    N12: TMenuItem;
    TBItem_hist: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    Label19: TLabel;
    c_DateZakr: TDBDateTimeEditEh;
    N13: TMenuItem;
    N14: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure TBItem_addZayavClick(Sender: TObject);
    procedure TBItem_redZayavClick(Sender: TObject);
    procedure TBItem_delZayavClick(Sender: TObject);
    procedure requery_zayavExecute(Sender: TObject);
    procedure b_zayav_refreshClick(Sender: TObject);
    procedure TBItemClearFilter(Sender: TObject);
    procedure c_filter_regdate1Change(Sender: TObject);
    procedure c_filter_regdate2Change(Sender: TObject);
    procedure TBItem_reisClick(Sender: TObject);
    procedure CopyZayavExecute(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure c_filter_prodKeyPress(Sender: TObject; var Key: Char);
    procedure TBItem1Click(Sender: TObject);
    function SaveCopyFile(FromF:string ;ToF:string):boolean;
    procedure B_findClick(Sender: TObject);
    procedure e_find_nomzKeyPress(Sender: TObject; var Key: Char);
    procedure find_nomzExecute(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure c_prodChange(Sender: TObject);
    procedure c_plattarChange(Sender: TObject);
    procedure c_ExpedChange(Sender: TObject);
    procedure c_stanotprChange(Sender: TObject);
    procedure obnovExecute(Sender: TObject);
    procedure q_zayavAfterScroll(DataSet: TDataSet);
    procedure TBItemWriteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure q_zayavBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_podpisChange(Sender: TObject);
    procedure acGU12ToDBFExecute(Sender: TObject);
    procedure c_vladputKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_prodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_grgrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_rodvagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_stanotprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_OtpravKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_ExpedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_plattarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_protprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_podachKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_vidsoobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N12Click(Sender: TObject);
    procedure e_find_nomzChange(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure b_history_aClick(Sender: TObject);
    procedure e_nomzChange(Sender: TObject);
    procedure e_nomzEnter(Sender: TObject);
    procedure e_nomzExit(Sender: TObject);
    procedure TBItem_histClick(Sender: TObject);
    procedure c_DateZakrChange(Sender: TObject);
    procedure c_DateZakrEnter(Sender: TObject);
    procedure c_DateZakrExit(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_zayav: Tf_zayav;
  ind_append: integer;

implementation

uses u_glob_var, ForTemp, U_reis, ShellApi, U_period,
  ForDB, ForSystem, main, MemoEdit, U_add_razb, U_otkaz, OraToDbf,
  U_history;

{$R *.dfm}

procedure Tf_zayav.FormActivate(Sender: TObject);
begin

  if m_unp=true then
    TempVari.SetVariNum('USER_UNP',1,'MASTER','GU12')
  else
    TempVari.SetVariNum('USER_UNP',0,'MASTER','GU12');

  c_filter_regdate1.Value:=m_date_filt1;
  c_filter_regdate2.Value:=m_date_filt2;

  e_find_nomz.Text:='';

  q_podpis.Locate('ID',m_podpis,[]);
  c_podpis.value:=q_podpis.FieldValues['ID'];

end;

procedure Tf_zayav.TBItem_addZayavClick(Sender: TObject);
begin
if q_zayav.CountQueryHits=0 then
  begin
  q_zayav.Insert;
  q_zayav.FieldValues['FROM_DATE']:=date();
  q_zayav.Post
  end
else
  begin
    CopyZayav.Execute;
  end;
obnov.Execute;
e_nomz.SetFocus;
end;

procedure Tf_zayav.TBItem_redZayavClick(Sender: TObject);
begin
if m_change_a+m_focus_a=2 then
  begin
  m_change_a:=0;
  q_zayav.Edit;
  q_zayav.FieldValues['FROM_DATE']:=c_BeginDate.Value;
  q_zayav.FieldValues['TO_DATE']:=c_EndDate.Value;
  q_zayav.FieldValues['SOGL_DATE']:=c_DateSogl.Value;
  q_zayav.FieldValues['REG_DATE']:=c_DateReg.Value;
  q_zayav.FieldValues['ZAKR_DATE']:=c_DateZakr.Value;
  q_zayav.FieldValues['DOGOVOR']:=t_dog.text;
  //m_focus_a:=0;
  if c_Otprav.Value<>'0' then
    q_zayav.FieldValues['GROTP_ID']:=c_Otprav.Value
  else
    q_zayav.FieldValues['GROTP_ID']:=0;

  if c_Exped.Value<>'0' then
    q_zayav.FieldValues['EXPED_ID']:=c_Exped.Value
  else
    q_zayav.FieldValues['EXPED_ID']:=0;

  if c_plattar.Value<>'0' then
    q_zayav.FieldValues['PLATTAR_ID']:=c_plattar.Value
  else
    q_zayav.FieldValues['PLATTAR_ID']:=0;

  if c_prod.Value<>'' then
    q_zayav.FieldValues['PROD_ID']:=c_prod.Value
  else
    q_zayav.FieldValues['PROD_ID']:=0;

  if c_grgr.Value<>'' then
    q_zayav.FieldValues['GR_GRUZ_ID']:=c_grgr.Value
  else
    q_zayav.FieldValues['GR_GRUZ_ID']:=0;

  if c_rodvag.Value<>'' then
    q_zayav.FieldValues['RODVAG_ID']:=c_rodvag.Value
  else
    q_zayav.FieldValues['RODVAG_ID']:=0;

  if c_stanotpr.Value<>'' then
    q_zayav.FieldValues['STANOTPR_ID']:=c_stanotpr.Value
  else
    q_zayav.FieldValues['STANOTPR_ID']:=0;

  if c_vladput.Value<>'' then
    //showmessage('.'+c_vladput.Value+'.');
    q_zayav.FieldValues['VLADPUT_ID']:=c_vladput.Value
  else
    q_zayav.FieldValues['VLADPUT_ID']:=0;

  if c_podach.Value<>'' then
    q_zayav.FieldValues['PODACH_ID']:=c_podach.Value
  else
    q_zayav.FieldValues['PODACH_ID']:=0;

  if c_protpr.Value<>'' then
    q_zayav.FieldValues['PRIZNOTPR_ID']:=c_protpr.Value
  else
    q_zayav.FieldValues['PRIZNOTPR_ID']:=0;

  if e_nomz.text<>'' then
    q_zayav.FieldValues['NOM_Z']:=e_nomz.text
  else
    q_zayav.FieldValues['NOM_Z']:='';

  if VarToStr(c_vidsoob.Value)<>'' then
    q_zayav.FieldValues['VIDSOOB_ID']:=c_vidsoob.Value
  else
    q_zayav.FieldValues['VIDSOOB_ID']:=0;

  q_zayav.Post;
  end;

end;

procedure Tf_zayav.TBItem_delZayavClick(Sender: TObject);
begin
  if MessageDlg('Удалить заявку?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  Begin
    q_delreis.SetVariable('IDZAYAV',q_zayav.FieldValues['ID']);
    q_delreis.Execute;
    q_zayav.Delete;
  end;
end;

procedure Tf_zayav.requery_zayavExecute(Sender: TObject);
begin

  q_zayav.Close;
//  q_zayav.be

  q_zayav.Sql.Clear;
  q_zayav.Sql.Add('SELECT');
  q_zayav.Sql.Add('Z.ROWID,');
  q_zayav.Sql.Add('Z.ID,');
  q_zayav.Sql.Add('Z.NOM_Z,');
  q_zayav.Sql.Add('Z.FROM_DATE,');
  q_zayav.Sql.Add('Z.TO_DATE,');
  q_zayav.Sql.Add('Z.PROD_ID,');
  q_zayav.Sql.Add('KP.NAME AS PROD,');
  q_zayav.Sql.Add('Z.REG_DATE,');
  q_zayav.Sql.Add('Z.SOGL_DATE,');
  q_zayav.Sql.Add('Z.GROTP_ID,');
  q_zayav.Sql.Add('O.SHORT_NAME AS OTPRAV,');
  q_zayav.Sql.Add('Z.PLATTAR_ID,');
  q_zayav.Sql.Add('PLT.SHORT_NAME AS PLATTAR,');
  q_zayav.Sql.Add('Z.EXPED_ID,');
  q_zayav.Sql.Add('E.SHORT_NAME AS EXPED,');
  q_zayav.Sql.Add('Z.RODVAG_ID,');
  q_zayav.Sql.Add('RV.NAME AS RODVAG,');
  q_zayav.Sql.Add('KP.STAT_NAGR AS STAT_NAGR,');
  q_zayav.Sql.Add('Z.DOGOVOR,');
  q_zayav.Sql.Add('Z.STANOTPR_ID,');
  q_zayav.Sql.Add('SO.STAN_NAME AS STANOTPR,');
  q_zayav.Sql.Add('Z.PODACH_ID,');
  q_zayav.Sql.Add('POD.NAME AS PODACH,');
  q_zayav.Sql.Add('Z.VIDSOOB_ID AS VIDSOOB_ID,');
  q_zayav.Sql.Add('SOOB.NAME AS VIDSOOB,');
  q_zayav.Sql.Add('Z.GR_GRUZ_ID,');
  q_zayav.Sql.Add('GRGR.NAME AS GR_GRUZ,');
  q_zayav.Sql.Add('Z.PRIZNOTPR_ID,');
  q_zayav.Sql.Add('PROT.NAME AS PRIZNOTPR,');
  q_zayav.Sql.Add('Z.VLADPUT_ID,');
  q_zayav.Sql.Add('VP.VLADPUT,');
  q_zayav.Sql.Add('Z.ID_NOSOGL,');
  q_zayav.Sql.Add('Z.FOX_KOD,');
  q_zayav.Sql.Add('Z.SOGL,');
  q_zayav.Sql.Add('Z.ISCOR,');
  q_zayav.Sql.Add('Z.ZAKR_DATE ');
  q_zayav.Sql.Add('FROM ');
  q_zayav.Sql.Add('GU12_A Z,');
  q_zayav.Sql.Add('V_GU12_OTPRAV O,');
  q_zayav.Sql.Add('V_GU12_PLATTAR PLT,');
  q_zayav.Sql.Add('V_GU12_EXPED E,');
  q_zayav.Sql.Add('KLS_PROD_GU12 KP,');
  q_zayav.Sql.Add('KLS_GD_VAGTYPE RV,');
  q_zayav.Sql.Add('V_GU12_STAN_OTPR SO,');
  q_zayav.Sql.Add('KLS_GD_PODACH POD,');
  q_zayav.Sql.Add('KLS_GD_SOOB SOOB,');
  q_zayav.Sql.Add('KLS_GD_GROUP GRGR,');
  q_zayav.Sql.Add('KLS_GD_OTPR PROT,');
  q_zayav.Sql.Add('V_GU12_VLADPUT VP');
  q_zayav.Sql.Add('WHERE');
  q_zayav.Sql.Add('Z.GROTP_ID=O.GROTP_ID(+)');
  q_zayav.Sql.Add('AND Z.PLATTAR_ID=PLT.PLATTAR_ID(+)');
  q_zayav.Sql.Add('AND Z.EXPED_ID=E.ID(+)');
  q_zayav.Sql.Add('AND Z.PROD_ID=KP.ID(+)');
  q_zayav.Sql.Add('AND Z.RODVAG_ID=RV.ID(+)');
  q_zayav.Sql.Add('AND Z.STANOTPR_ID=SO.STAN_ID(+)');
  q_zayav.Sql.Add('AND Z.PODACH_ID=POD.ID(+)');
  q_zayav.Sql.Add('AND Z.VIDSOOB_ID=SOOB.ID(+)');
  q_zayav.Sql.Add('AND Z.GR_GRUZ_ID=GRGR.ID(+)');
  q_zayav.Sql.Add('AND Z.PRIZNOTPR_ID=PROT.ID(+)');
  q_zayav.Sql.Add('AND Z.VLADPUT_ID=VP.VLADPUT_ID(+)');
  q_zayav.Sql.Add('AND '+m_filter2+' ');
  q_zayav.Sql.Add('ORDER BY ID');

  q_zayav.Open;

end;

procedure Tf_zayav.b_zayav_refreshClick(Sender: TObject);
  var
     mnomz: real;
     Code: Integer;

begin
 if c_filter_regdate2.Value<c_filter_regdate1.Value then
           showmessage('Дата начала периода больше даты окончания.')
 else
 begin
  q_zayav.Cursor:=crSQLWait;
  m_filter2:=m_filter1+'1=1';
  case RadioGroup1.ItemIndex of
    1:begin
        m_filter2:=m_filter2+' AND Z.SOGL_DATE IS NULL';
      end;
    2:begin
        m_filter2:=m_filter2+' AND Z.SOGL_DATE IS NOT NULL';
      end;
  end;
  case RadioGroup2.ItemIndex of
    1:begin
        m_filter2:=m_filter2+' AND NVL(Z.EXPED_ID,0)=0';
      end;
    2:begin
        m_filter2:=m_filter2+' AND NVL(Z.EXPED_ID,0)<>0';
      end;
  end;
  if c_filter_prod.Value<>'' then
    m_filter2:=m_filter2+' AND Z.PROD_ID='+trim(c_filter_prod.Value);
  if (VarToStr(c_filter_regdate1.Value)<>'') and (VarToStr(c_filter_regdate2.Value)<>'') then
    begin
      m_date_filt1:=c_filter_regdate1.Value;
      m_date_filt2:=c_filter_regdate2.Value;
      m_filter2:=m_filter2+' AND Z.FROM_DATE>=TO_DATE('''+VarToStr(c_filter_regdate1.Value)+''',''dd.mm.yyyy'')';
      m_filter2:=m_filter2+' AND Z.FROM_DATE<=TO_DATE('''+VarToStr(c_filter_regdate2.Value)+''',''dd.mm.yyyy'')';
    end;
   Val(e_find_nomz.Text, mnomz, Code);
   if mnomz<>0 then
    begin
      m_filter2:=m_filter2+' AND Z.NOM_Z='+Trim(e_find_nomz.Text);
    end;

    q_zayav.Close;
    q_zayav.Open;
    obnov.Execute;
    q_zayav.Cursor:=crDefault;
 end;
end;

procedure Tf_zayav.TBItemClearFilter(Sender: TObject);
begin

  c_filter_prod.ResetField;
  m_fregdate1:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  m_fregdate2:=EndOfTheMonth(Date);
  m_date_filt1:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  m_date_filt2:=EndOfTheMonth(EndOfTheMonth(Date)+1);
  m_filter2:=m_filter1+'Z.FROM_DATE>=TO_DATE('''+DateToStr(m_fregdate1)+''',''dd.mm.yyyy'')';
  m_filter2:=m_filter2+' AND Z.FROM_DATE<=TO_DATE('''+DateToStr(m_fregdate2)+''',''dd.mm.yyyy'')';

  c_filter_regdate1.Value:=m_date_filt1;
  c_filter_regdate2.Value:=m_date_filt2;

  RadioGroup1.ItemIndex:=0;
  RadioGroup2.ItemIndex:=0;

  q_zayav.Close;
  q_zayav.Open;
  obnov.Execute;

end;

procedure Tf_zayav.c_filter_regdate1Change(Sender: TObject);
begin
  //if c_filter_regdate2.Value<c_filter_regdate1.Value then
  //  c_filter_regdate2.Value:=c_filter_regdate1.Value;
  e_find_nomz.Text:=' ';
end;

procedure Tf_zayav.c_filter_regdate2Change(Sender: TObject);
begin
  //if c_filter_regdate2.Value<c_filter_regdate1.Value then
  // c_filter_regdate1.Value:=c_filter_regdate2.Value;
  e_find_nomz.Text:='';
end;

procedure Tf_zayav.TBItem_reisClick(Sender: TObject);
begin
  m_back:='f_zayav';
  m_wherefrom:='f_zayav';
  m_id_zayav:=q_zayav.FieldValues['ID'];
  f_reis.q_reis.SetVariable('IDZAYAV',m_id_zayav);
  f_reis.show;
  hide;
end;

procedure Tf_zayav.CopyZayavExecute(Sender: TObject);
begin
  m_id_zayav:=q_zayav.FieldValues['ID'];
  arr_z:= VarArrayCreate([0, 30], varVariant);
  arr_z[1]:=q_zayav.FieldValues['NOM_Z'];
  arr_z[2]:=q_zayav.FieldValues['FROM_DATE'];
  arr_z[3]:=q_zayav.FieldValues['TO_DATE'];
  arr_z[4]:=q_zayav.FieldValues['PROD_ID'];
  arr_z[5]:=q_zayav.FieldValues['REG_DATE'];
  arr_z[6]:=q_zayav.FieldValues['SOGL_DATE'];
  arr_z[7]:=q_zayav.FieldValues['GROTP_ID'];
  arr_z[8]:=q_zayav.FieldValues['PLATTAR_ID'];
  arr_z[9]:=q_zayav.FieldValues['EXPED_ID'];
  arr_z[10]:=q_zayav.FieldValues['RODVAG_ID'];
  arr_z[11]:=q_zayav.FieldValues['DOGOVOR'];
  arr_z[12]:=q_zayav.FieldValues['STANOTPR_ID'];
  arr_z[13]:=q_zayav.FieldValues['PODACH_ID'];
  arr_z[14]:=q_zayav.FieldValues['VIDSOOB_ID'];
  arr_z[15]:=q_zayav.FieldValues['GR_GRUZ_ID'];
  arr_z[16]:=q_zayav.FieldValues['PRIZNOTPR_ID'];
  arr_z[17]:=q_zayav.FieldValues['VLADPUT_ID'];
  arr_z[18]:=q_zayav.FieldValues['SOGL'];
  arr_z[19]:=q_zayav.FieldValues['ID_NOSOGL'];
  arr_z[21]:=q_zayav.FieldValues['FOX_KOD'];

  q_zayav.edit;
  q_zayav.Append;
  q_zayav.FieldValues['SOGL']:=0;
  q_zayav.FieldValues['NOM_Z']:=arr_z[1];
  q_zayav.FieldValues['FROM_DATE']:=arr_z[2];
  q_zayav.FieldValues['TO_DATE']:=arr_z[3];
  q_zayav.FieldValues['PROD_ID']:=arr_z[4];
  q_zayav.FieldValues['REG_DATE']:=arr_z[5];
  q_zayav.FieldValues['SOGL_DATE']:=arr_z[6];
  q_zayav.FieldValues['GROTP_ID']:=arr_z[7];
  q_zayav.FieldValues['PLATTAR_ID']:=arr_z[8];
  q_zayav.FieldValues['EXPED_ID']:=arr_z[9];
  q_zayav.FieldValues['RODVAG_ID']:=arr_z[10];
  q_zayav.FieldValues['DOGOVOR']:=arr_z[11];
  q_zayav.FieldValues['STANOTPR_ID']:=arr_z[12];
  q_zayav.FieldValues['PODACH_ID']:=arr_z[13];
  q_zayav.FieldValues['VIDSOOB_ID']:=arr_z[14];
  q_zayav.FieldValues['GR_GRUZ_ID']:=arr_z[15];
  q_zayav.FieldValues['PRIZNOTPR_ID']:=arr_z[16];
  q_zayav.FieldValues['VLADPUT_ID']:=arr_z[17];
  q_zayav.FieldValues['SOGL']:=arr_z[18];
  q_zayav.FieldValues['ID_NOSOGL']:=arr_z[19];
  q_zayav.FieldValues['FOX_KOD']:='';
  q_zayav.Post;

end;

procedure Tf_zayav.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
// if (Key = Chr(vk_Escape)) then
//     f_zayav.Close;
end;

procedure Tf_zayav.c_filter_prodKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = Chr(vk_Escape)) then
    f_zayav.Close;

end;

procedure Tf_zayav.TBItem1Click(Sender: TObject);
var
   p: tpoint;
begin
  GetCursorPos(p);
  Menu_print.Popup(p.X,p.Y)
end;

function Tf_zayav.SaveCopyFile(FromF:string ;ToF:string):boolean;
var
  f1,f2:String[255];
Begin
  f1:=FromF+#0;
  f2:=ToF+#0;
  Result:=Windows.COPYFILE(@f1[1],@f2[1],False);
End;

procedure Tf_zayav.B_findClick(Sender: TObject);
begin

//if q_zayav.FieldValues['ISCOR']=10 then
//  begin
//    q_zayav.FieldValues['ISCOR']:=m_oldiscor;
//  end;

  find_nomz.Execute;
end;

procedure Tf_zayav.e_find_nomzKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(13)) then
    begin
         //if q_zayav.FieldValues['ISCOR']=10 then
         //   begin
         //     q_zayav.FieldValues['ISCOR']:=m_oldiscor;
         //   end;
      find_nomz.Execute;
    end;
end;

procedure Tf_zayav.find_nomzExecute(Sender: TObject);
var
  find_nomz,curr_nomz: string;
  i: integer;
begin

    m_poisk_good:=0;
    find_nomz:=Trim(e_find_nomz.Text);

    if Length(find_nomz)<10 then
      begin
        for i:=1 to 10-Length(e_find_nomz.Text) do
            find_nomz:='0'+find_nomz;
       end;

    if find_nomz='0000000000' then
       find_nomz:='';

    if m_poisk2=0 then
      begin
        q_zayav.First;
      end;

    if m_poisk2=1 then
      begin
        q_zayav.Next;
      end;

    m_poisk:=1;

   if VarIsNull(q_zayav.FieldValues['NOM_Z']) then
      curr_nomz:=''
   else
      curr_nomz:=q_zayav.FieldValues['NOM_Z'];

//    while q_zayav.FieldValues['NOM_Z']<>find_nomz do
    while curr_nomz<>find_nomz do
      begin

        q_zayav.Next;
        if VarIsNull(q_zayav.FieldValues['NOM_Z']) then
         curr_nomz:=''
        else
          curr_nomz:=q_zayav.FieldValues['NOM_Z'];

       if q_zayav.Eof then
          begin
            m_poisk:=0;
            m_poisk2:=0;
            b_find.Caption:='Найти';
            obnov.Execute;

//         if q_zayav.FieldValues['NOM_Z']<>find_nomz then
           if curr_nomz<>find_nomz then
              begin
                showmessage('Номер не найден');
              end;
           exit;
          end;
      end;
    m_poisk:=0;
    if q_zayav.Eof then
      begin
        m_poisk2:=0;
        b_find.Caption:='Найти';
      end
    else
      begin
        m_poisk2:=1;
        b_find.Caption:='Найти далее';
      end;
    m_poisk_good:=1;
    obnov.Execute;

    //if not VarIsNull(q_zayav.FieldValues['ISCOR']) then
    //  m_oldiscor:=q_zayav.FieldValues['ISCOR']
    //else
    //  m_oldiscor:=0;

    //q_zayav.FieldValues['ISCOR']:=10;

end;

procedure Tf_zayav.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_zayav.FieldValues['iscor']=1 then
      Background:=$00DDFFDD;
  if q_zayav.FieldValues['iscor']=2 then
      Background:=$00DDDDFF;
  if q_zayav.FieldValues['iscor']=10 then
      Background:=$00FFDDBB;

//  Background:=$00AAEEFF;
//  Background:=clInfoBk;
//  Background:=clMoneyGreen;
//  Background:=clSkyBlue	;

end;

procedure Tf_zayav.N2Click(Sender: TObject);
begin
    FromFile:='U:\Master\gu12\GU12_ZAYAVKA.XLS';
    //FromFile:='C:\Proj_gu12or\GU12_ZAYAVKA.XLS';
    ToFile:='C:\TMP\GU12_ZAYAVKA.XLS';
    SaveCopyFile(FromFile,ToFile);
    TempVari.SetVariNum('ID_ZAYAV',q_zayav.FieldValues['ID'],'MASTER','GU12');
    m_podpis:=q_podpis.FieldValues['ID'];
    TempVari.SetVariNum('ID_PODPIS',m_podpis,'MASTER','GU12');
    ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);

end;

procedure Tf_zayav.N3Click(Sender: TObject);
begin
    FromFile:='U:\Master\gu12\GU12_CARD.XLS';
    ToFile:='C:\TMP\GU12_CARD.XLS';
    SaveCopyFile(FromFile,ToFile);
    TempVari.SetVariNum('ID_ZAYAV',q_zayav.FieldValues['ID'],'MASTER','GU12');
    ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
end;

procedure Tf_zayav.N11Click(Sender: TObject);
begin
   FromFile:='U:\Master\gu12\GU12_grafik_one.XLS';
   ToFile:='C:\TMP\GU12_grafik_one.XLS';
   SaveCopyFile(FromFile,ToFile);
   TempVari.SetVariNum('ID_ZAYAV',q_zayav.FieldValues['ID'],'MASTER','GU12');
   ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);

end;

procedure Tf_zayav.DBGridEh1Enter(Sender: TObject);
begin
c_BeginDate.Value:=q_zayav.FieldValues['FROM_DATE'];
end;

procedure Tf_zayav.c_prodChange(Sender: TObject);
begin
  q_prod.Open;
  t_statnagr.Text:=q_prod.FieldValues['STAT_NAGR'];
end;

procedure Tf_zayav.c_plattarChange(Sender: TObject);
begin
  if c_plattar.Value<>'0' then c_exped.Value:='0';
  //showmessage(c_plattar.Value);
  if c_plattar.Value='0' then t_dog.Text:='';
  if c_plattar.Value='8' then t_dog.Text:='7242352';
  if c_plattar.Value='4175' then t_dog.Text:='7242352';
  if c_plattar.Value='3490' then t_dog.Text:='7242958';
end;

procedure Tf_zayav.c_ExpedChange(Sender: TObject);
begin
  if c_exped.Value<>'0' then c_plattar.Value:='0';

end;

procedure Tf_zayav.c_stanotprChange(Sender: TObject);
begin
  if c_stanotpr.Value='2250' then
    begin
      c_vladput.Value:='2641';
      c_grgr.Value:='42';
      c_protpr.Value:='1';
    end;
  if c_stanotpr.Value='3110' then
    begin
      c_vladput.Value:='2952';
      c_grgr.Value:='3';
      c_protpr.Value:='2';
    end;
   q_stanotpr.open;
   e_nomotd.Text:=VarToStr(q_stanotpr.FieldValues['otdelenie']);

end;

procedure Tf_zayav.obnovExecute(Sender: TObject);
begin

c_BeginDate.Value:=q_zayav.FieldValues['FROM_DATE'];
c_EndDate.Value:=q_zayav.FieldValues['TO_DATE'];
c_DateSogl.Value:=q_zayav.FieldValues['SOGL_DATE'];
c_DateReg.Value:=q_zayav.FieldValues['REG_DATE'];
c_DateZakr.Value:=q_zayav.FieldValues['ZAKR_DATE'];
if VarIsNull(q_zayav.FieldValues['GROTP_ID']) then
  c_Otprav.Value:=''
else
  c_Otprav.Value:=q_zayav.FieldValues['GROTP_ID'];

if VarIsNull(q_zayav.FieldValues['EXPED_ID']) then
  c_Exped.Value:=''
else
  c_Exped.Value:=q_zayav.FieldValues['EXPED_ID'];

if VarIsNull(q_zayav.FieldValues['PLATTAR_ID']) then
  c_plattar.Value:=''
else
  c_plattar.Value:=q_zayav.FieldValues['PLATTAR_ID'];

if VarIsNull(q_zayav.FieldValues['DOGOVOR']) then
  t_dog.Text:=''
else
  t_dog.text:=q_zayav.FieldValues['DOGOVOR'];

if VarIsNull(q_zayav.FieldValues['PROD_ID']) then
  c_prod.Value:=''
else
  c_prod.Value:=q_zayav.FieldValues['PROD_ID'];

if VarIsNull(q_zayav.FieldValues['GR_GRUZ_ID']) then
  c_grgr.Value:=''
else
  c_grgr.Value:=q_zayav.FieldValues['GR_GRUZ_ID'];

if VarIsNull(q_zayav.FieldValues['RODVAG_ID']) then
  c_rodvag.Value:=''
else
  c_rodvag.Value:=q_zayav.FieldValues['RODVAG_ID'];

if VarIsNull(q_zayav.FieldValues['STANOTPR_ID']) then
  begin
    c_stanotpr.Value:='';
    e_nomotd.Text:=''
  end
else
  begin
    c_stanotpr.Value:=q_zayav.FieldValues['STANOTPR_ID'];
    //e_nomotd.Text:=VarToStr(q_stanotpr.FieldValues['OTDELENIE']);
  end;

if VarIsNull(q_zayav.FieldValues['VLADPUT_ID']) then
  c_vladput.Value:=''
else
  c_vladput.Value:=VarToStr(q_zayav.FieldValues['VLADPUT_ID']);

if VarIsNull(q_zayav.FieldValues['PODACH_ID']) then
  c_podach.Value:=''
else
  c_podach.Value:=q_zayav.FieldValues['PODACH_ID'];

if VarIsNull(q_zayav.FieldValues['PRIZNOTPR_ID']) then
  c_protpr.Value:=''
else
  c_protpr.Value:=q_zayav.FieldValues['PRIZNOTPR_ID'];

if VarIsNull(q_zayav.FieldValues['VIDSOOB_ID']) then
  c_vidsoob.Value:=''
else
  c_vidsoob.Value:=q_zayav.FieldValues['VIDSOOB_ID'];

if VarIsNull(q_zayav.FieldValues['NOM_Z']) then
  e_nomz.text:=''
else
    if m_indred=1 then
      e_nomz.text:=''
    else
      e_nomz.text:=q_zayav.FieldValues['NOM_Z'];

  if q_zayav.CountQueryHits=0 then
  begin
    if f_db.CheckGrant('acGU12_READ') then
      Begin
      TBItem_add.Enabled:=false;
      TBItem_reis.Enabled:=false;
      TBItem_rec.Enabled:=false;
      TBItem_del.Enabled:=false;
      acGU12ToDBF.Enabled:=false;
      TBItem_hist.Enabled:=false;
      End;
    if f_db.CheckGrant('acGU12_FULL') then
      Begin
      TBItem_add.Enabled:=true;
      TBItem_reis.Enabled:=false;
      TBItem_rec.Enabled:=false;
      TBItem_del.Enabled:=false;
      acGU12ToDBF.Enabled:=false;
      TBItem_hist.Enabled:=false;
      End;
  end
  else
  begin
    if f_db.CheckGrant('acGU12_READ') then
    Begin
      TBItem_add.Enabled:=false;
      TBItem_reis.Enabled:=true;
      TBItem_rec.Enabled:=false;
      TBItem_del.Enabled:=false;
      acGU12ToDBF.Enabled:=false;
      TBItem_hist.Enabled:=false;
      End;

    if f_db.CheckGrant('acGU12_FULL') then
      Begin
      TBItem_add.Enabled:=true;
      TBItem_reis.Enabled:=true;
      TBItem_rec.Enabled:=true;
      TBItem_del.Enabled:=true;
      acGU12ToDBF.Enabled:=true;
      TBItem_hist.Enabled:=true;
      End;

  q_count_reis.SetVariable('IDZAYAV',q_zayav.FieldValues['ID']);
  q_count_reis.Close;
  q_count_reis.Open;
  l_count_reis.caption:=VarToStr(q_count_reis.FieldValues['count_reis']);
  end;

end;

procedure Tf_zayav.q_zayavAfterScroll(DataSet: TDataSet);
begin
  m_change_a:=0;
  if m_poisk=0 then
    obnov.Execute;
end;

procedure Tf_zayav.TBItemWriteClick(Sender: TObject);
begin
q_zayav.Edit;
q_zayav.FieldValues['FROM_DATE']:=c_BeginDate.Value;
q_zayav.FieldValues['TO_DATE']:=c_EndDate.Value;
q_zayav.FieldValues['SOGL_DATE']:=c_DateSogl.Value;
q_zayav.FieldValues['REG_DATE']:=c_DateReg.Value;
q_zayav.FieldValues['ZAKR_DATE']:=c_DateZakr.Value;

q_zayav.FieldValues['DOGOVOR']:=t_dog.text;

if c_Otprav.Value<>'0' then
  q_zayav.FieldValues['GROTP_ID']:=c_Otprav.Value
else
  q_zayav.FieldValues['GROTP_ID']:=0;

if c_Exped.Value<>'0' then
  q_zayav.FieldValues['EXPED_ID']:=c_Exped.Value
else
  q_zayav.FieldValues['EXPED_ID']:=0;

if c_plattar.Value<>'0' then
  q_zayav.FieldValues['PLATTAR_ID']:=c_plattar.Value
else
  q_zayav.FieldValues['PLATTAR_ID']:=0;

if c_prod.Value<>'0' then
  q_zayav.FieldValues['PROD_ID']:=c_prod.Value
else
  q_zayav.FieldValues['PROD_ID']:=0;

if c_grgr.Value<>'0' then
  q_zayav.FieldValues['GR_GRUZ_ID']:=c_grgr.Value
else
  q_zayav.FieldValues['GR_GRUZ_ID']:=0;

if c_rodvag.Value<>'0' then
  q_zayav.FieldValues['RODVAG_ID']:=c_rodvag.Value
else
  q_zayav.FieldValues['RODVAG_ID']:=0;

if c_stanotpr.Value<>'0' then
  q_zayav.FieldValues['STANOTPR_ID']:=c_stanotpr.Value
else
  q_zayav.FieldValues['STANOTPR_ID']:=0;

if c_vladput.Value<>'0' then
  q_zayav.FieldValues['VLADPUT_ID']:=c_vladput.Value
else
  q_zayav.FieldValues['VLADPUT_ID']:=0;

if c_podach.Value<>'0' then
  q_zayav.FieldValues['PODACH_ID']:=c_podach.Value
else
  q_zayav.FieldValues['PODACH_ID']:=0;

if c_protpr.Value<>'' then
  q_zayav.FieldValues['PRIZNOTPR_ID']:=c_protpr.Value
else
  q_zayav.FieldValues['PRIZNOTPR_ID']:=0;

if e_nomz.text<>'' then
  q_zayav.FieldValues['NOM_Z']:=e_nomz.text
else
  q_zayav.FieldValues['NOM_Z']:='';

if VarToStr(c_vidsoob.Value)<>'' then
  q_zayav.FieldValues['VIDSOOB_ID']:=c_vidsoob.Value
else
  q_zayav.FieldValues['VIDSOOB_ID']:=0;

q_zayav.Post;

end;

procedure Tf_zayav.N1Click(Sender: TObject);
begin
  m_otchet:='ispolnenie';
  f_period.show;
end;

procedure Tf_zayav.N4Click(Sender: TObject);
begin
  m_otchet:='plan';
  f_period.show;
end;

procedure Tf_zayav.N5Click(Sender: TObject);
begin
  m_otchet:='grafik';
  f_period.show;

end;

procedure Tf_zayav.N6Click(Sender: TObject);
begin
  m_otchet:='otgruzka';
  f_period.show;

end;

procedure Tf_zayav.N7Click(Sender: TObject);
begin
  m_otchet:='planfakt_gen';
  f_period.show;

end;

procedure Tf_zayav.N8Click(Sender: TObject);
begin
  m_otchet:='planfaktexp';
  f_period.show;

end;

procedure Tf_zayav.N9Click(Sender: TObject);
begin
  m_otchet:='sverka';
  f_period.show;

end;

procedure Tf_zayav.N10Click(Sender: TObject);
begin
  m_otchet:='spiszayavplat';
  f_period.show;

end;

procedure Tf_zayav.FormCreate(Sender: TObject);
begin

//  m_fregdate1:=StartOfTheMonth(StartOfTheMonth(Date)-1);
//  m_fregdate2:=EndOfTheMonth(Date);
  m_date_filt1:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  m_date_filt2:=EndOfTheMonth(EndOfTheMonth(Date)+1);
{
  m_filter1:='EXISTS (SELECT 1 FROM GU12_B_TEST WHERE GU12_B_TEST.ID_A=Z.ID AND GU12_B_TEST.PLAT_ID=2641) AND ';
  m_unp:=false;

  N1.Enabled:=false;
  N2.Enabled:=false;
  N3.Enabled:=false;
  N4.Enabled:=false;
  N5.Enabled:=false;
  N6.Enabled:=false;
  N7.Enabled:=true;
  N8.Enabled:=false;
  N9.Enabled:=false;
  N10.Enabled:=false;
  N11.Enabled:=false;
}

  if f_main.UserUNP then
    begin
      m_filter1:='';
      m_unp:=true;
      N1.Enabled:=true;
      N2.Enabled:=true;
      N3.Enabled:=true;
      N4.Enabled:=true;
      N5.Enabled:=true;
      N6.Enabled:=true;
      N7.Enabled:=true;
      N8.Enabled:=true;
      N9.Enabled:=true;
      N10.Enabled:=true;
      N11.Enabled:=true;
    end
  else
    begin
      m_filter1:='EXISTS (SELECT 1 FROM GU12_B WHERE GU12_B.ID_A=Z.ID AND GU12_B.PLAT_ID=2641) AND ';
      m_unp:=false;
      N1.Enabled:=false;
      N2.Enabled:=false;
      N3.Enabled:=true;
      N4.Enabled:=false;
      N5.Enabled:=false;
      N6.Enabled:=false;
      N7.Enabled:=true;
      N8.Enabled:=false;
      N9.Enabled:=false;
      N10.Enabled:=false;
      N11.Enabled:=false;
    end;

  m_filter2:=m_filter1+'Z.FROM_DATE>=TO_DATE('''+DateToStr(m_date_filt1)+''',''dd.mm.yyyy'')';
  m_filter2:=m_filter2+' AND Z.FROM_DATE<=TO_DATE('''+DateToStr(m_date_filt2)+''',''dd.mm.yyyy'')';

  f_db.LogonMasterSession(f_main.ora_Session);

  q_zayav.Active:=true;
  q_filter_prod.Active:=true;
  q_prinvag.Active:=true;
  q_count_reis.Active:=true;
  q_otprav.Active:=true;
  q_exped.Active:=true;
  q_plattar.Active:=true;
  q_prod.Active:=true;
  q_grgr.Active:=true;
  q_rodvag.Active:=true;
  q_stanotpr.Active:=true;
  q_vladput.Active:=true;
  q_podach.Active:=true;
  q_protpr.Active:=true;
  q_vidsoob.Active:=true;
  q_podpis.Active:=true;

  f_reis:=TF_reis.Create(Self);
  f_MemoEdit:=TF_MemoEdit.Create(Self);
  f_add_razb:=TF_add_razb.Create(Self);
  f_otkaz:=TF_otkaz.Create(Self);
  f_period:=TF_period.Create(Self);

  m_username:=F_ForSystem.GetUserName(true);
  TempVari := TTempVari.Create(nil);
  TempVari.Session := f_main.Ora_Session;
  TempVari.SetVariChar('gu12_user',m_username,'MASTER','GU12');

  q_zayav.Cursor:=crDefault;
  q_filter_prod.Cursor:=crDefault;
  q_prinvag.Cursor:=crDefault;
  q_count_reis.Cursor:=crDefault;
  q_otprav.Cursor:=crDefault;
  q_exped.Cursor:=crDefault;
  q_plattar.Cursor:=crDefault;
  q_prod.Cursor:=crDefault;
  q_grgr.Cursor:=crDefault;
  q_rodvag.Cursor:=crDefault;
  q_stanotpr.Cursor:=crDefault;
  q_vladput.Cursor:=crDefault;
  q_podach.Cursor:=crDefault;
  q_protpr.Cursor:=crDefault;
  q_vidsoob.Cursor:=crDefault;

end;

procedure Tf_zayav.q_zayavBeforeOpen(DataSet: TDataSet);
begin
  q_zayav.Sql.Clear;
  q_zayav.Sql.Add('SELECT');
  q_zayav.Sql.Add('Z.ROWID,');
  q_zayav.Sql.Add('Z.ID,');
  q_zayav.Sql.Add('Z.NOM_Z,');
  q_zayav.Sql.Add('Z.FROM_DATE,');
  q_zayav.Sql.Add('Z.TO_DATE,');
  q_zayav.Sql.Add('Z.PROD_ID,');
  q_zayav.Sql.Add('KP.NAME AS PROD,');
  q_zayav.Sql.Add('Z.REG_DATE,');
  q_zayav.Sql.Add('Z.SOGL_DATE,');
  q_zayav.Sql.Add('Z.GROTP_ID,');
  q_zayav.Sql.Add('O.SHORT_NAME AS OTPRAV,');
  q_zayav.Sql.Add('Z.PLATTAR_ID,');
  q_zayav.Sql.Add('PLT.SHORT_NAME AS PLATTAR,');
  q_zayav.Sql.Add('Z.EXPED_ID,');
  q_zayav.Sql.Add('E.SHORT_NAME AS EXPED,');
  q_zayav.Sql.Add('Z.RODVAG_ID,');
  q_zayav.Sql.Add('RV.NAME AS RODVAG,');
  q_zayav.Sql.Add('KP.STAT_NAGR AS STAT_NAGR,');
  q_zayav.Sql.Add('Z.DOGOVOR,');
  q_zayav.Sql.Add('Z.STANOTPR_ID,');
  q_zayav.Sql.Add('SO.STAN_NAME AS STANOTPR,');
  q_zayav.Sql.Add('Z.PODACH_ID,');
  q_zayav.Sql.Add('POD.NAME AS PODACH,');
  q_zayav.Sql.Add('Z.VIDSOOB_ID AS VIDSOOB_ID,');
  q_zayav.Sql.Add('SOOB.NAME AS VIDSOOB,');
  q_zayav.Sql.Add('Z.GR_GRUZ_ID,');
  q_zayav.Sql.Add('GRGR.NAME AS GR_GRUZ,');
  q_zayav.Sql.Add('Z.PRIZNOTPR_ID,');
  q_zayav.Sql.Add('PROT.NAME AS PRIZNOTPR,');
  q_zayav.Sql.Add('Z.VLADPUT_ID,');
  q_zayav.Sql.Add('VP.VLADPUT,');
  q_zayav.Sql.Add('Z.ID_NOSOGL,');
  q_zayav.Sql.Add('Z.FOX_KOD,');
  q_zayav.Sql.Add('Z.SOGL,');
  q_zayav.Sql.Add('Z.ISCOR,');
  q_zayav.Sql.Add('Z.ZAKR_DATE ');
  q_zayav.Sql.Add('FROM ');
  q_zayav.Sql.Add('GU12_A Z,');
  q_zayav.Sql.Add('V_GU12_OTPRAV O,');
  q_zayav.Sql.Add('V_GU12_PLATTAR PLT,');
  q_zayav.Sql.Add('V_GU12_EXPED E,');
  q_zayav.Sql.Add('KLS_PROD_GU12 KP,');
  q_zayav.Sql.Add('KLS_GD_VAGTYPE RV,');
  q_zayav.Sql.Add('V_GU12_STAN_OTPR SO,');
  q_zayav.Sql.Add('KLS_GD_PODACH POD,');
  q_zayav.Sql.Add('KLS_GD_SOOB SOOB,');
  q_zayav.Sql.Add('KLS_GD_GROUP GRGR,');
  q_zayav.Sql.Add('KLS_GD_OTPR PROT,');
  q_zayav.Sql.Add('V_GU12_VLADPUT VP');
  q_zayav.Sql.Add('WHERE');
  q_zayav.Sql.Add('Z.GROTP_ID=O.GROTP_ID(+)');
  q_zayav.Sql.Add('AND Z.PLATTAR_ID=PLT.PLATTAR_ID(+)');
  q_zayav.Sql.Add('AND Z.EXPED_ID=E.ID(+)');
  q_zayav.Sql.Add('AND Z.PROD_ID=KP.ID(+)');
  q_zayav.Sql.Add('AND Z.RODVAG_ID=RV.ID(+)');
  q_zayav.Sql.Add('AND Z.STANOTPR_ID=SO.STAN_ID(+)');
  q_zayav.Sql.Add('AND Z.PODACH_ID=POD.ID(+)');
  q_zayav.Sql.Add('AND Z.VIDSOOB_ID=SOOB.ID(+)');
  q_zayav.Sql.Add('AND Z.GR_GRUZ_ID=GRGR.ID(+)');
  q_zayav.Sql.Add('AND Z.PRIZNOTPR_ID=PROT.ID(+)');
  q_zayav.Sql.Add('AND Z.VLADPUT_ID=VP.VLADPUT_ID(+)');
  q_zayav.Sql.Add('AND '+m_filter2+' ');
  q_zayav.Sql.Add('ORDER BY ID');

  //showmessage(q_zayav.Sql.Text);

end;

procedure Tf_zayav.FormDestroy(Sender: TObject);
begin
  DeleteFile('C:\TMP\GU12_ZAYAVKA.XLS');
  DeleteFile('C:\TMP\GU12_CARD.XLS');
  DeleteFile('C:\TMP\GU12_grafik_one.XLS');
  DeleteFile('C:\TMP\GU12_ispoln.XLS');
  DeleteFile('C:\TMP\GU12_planpod.XLS');
  DeleteFile('C:\TMP\GU12_grafper.XLS');
  DeleteFile('C:\TMP\GU12_otgr.XLS');
  DeleteFile('C:\TMP\GU12_planfakt.XLS');
  DeleteFile('C:\TMP\GU12_planfakt_exp.XLS');
  DeleteFile('C:\TMP\GU12_sverka.XLS');
  DeleteFile('C:\TMP\GU12_spisok_zayav.XLS');
end;

procedure Tf_zayav.Button1Click(Sender: TObject);
begin
q_renewtest.Execute;
q_zayav.Close;
q_zayav.Open;
end;

procedure Tf_zayav.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Trim(VarToStr(Key))='27' then
      if MessageDlg('Выйти из программы?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
             f_zayav.Close;

end;

procedure Tf_zayav.c_podpisChange(Sender: TObject);
begin
  m_podpis:=q_podpis.FieldValues['ID'];
  TempVari.SetVariNum('ID_PODPIS',m_podpis,'MASTER','GU12');
end;

procedure Tf_zayav.acGU12ToDBFExecute(Sender: TObject);
begin
  with tf_ORAToDBF.Create(Self) do
    begin
      DontAsk:=true;
      DBFtoORAid:='GU12A';
      ShowModal;
    end;
  with tf_ORAToDBF.Create(Self) do
    begin
      DontAsk:=true;
      DBFtoORAid:='GU12B';
      ShowModal;
    end;
  with tf_ORAToDBF.Create(Self) do
    begin
      DontAsk:=true;
      DBFtoORAid:='GU12BR';
      ShowModal;
    end;
end;

procedure Tf_zayav.c_prodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_prod.Value:='';

end;

procedure Tf_zayav.c_grgrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_grgr.Value:='';

end;

procedure Tf_zayav.c_rodvagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_rodvag.Value:='';
end;

procedure Tf_zayav.c_stanotprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_stanotpr.Value:='';
end;

procedure Tf_zayav.c_vladputKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_vladput.Value:='';
end;

procedure Tf_zayav.c_OtpravKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_Otprav.Value:='';
end;

procedure Tf_zayav.c_ExpedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_Exped.Value:='';
end;

procedure Tf_zayav.c_plattarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_plattar.Value:='';
end;

procedure Tf_zayav.c_protprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_protpr.Value:='';
end;

procedure Tf_zayav.c_podachKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_podach.Value:='';
end;

procedure Tf_zayav.c_vidsoobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_vidsoob.Value:='';
end;

procedure Tf_zayav.N12Click(Sender: TObject);
begin
  m_otchet:='planfakt_gd';
  f_period.show;
end;

procedure Tf_zayav.e_find_nomzChange(Sender: TObject);
begin
  m_poisk2:=0;
  b_find.Caption:='Найти';
end;

procedure Tf_zayav.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
{
   if q_zayav.FieldValues['ISCOR']=10 then
    begin
      q_zayav.FieldValues['ISCOR']:=m_oldiscor;
    end;
}
end;

procedure Tf_zayav.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

if q_zayav.FieldValues['ISCOR']=10 then
  begin
    q_zayav.FieldValues['ISCOR']:=m_oldiscor;
  end;

end;

procedure Tf_zayav.b_history_aClick(Sender: TObject);
begin
  m_id_zayav:=q_zayav.FieldValues['id'];
  f_history:=TF_history.Create(Self);
  with f_history do
  Begin
    ShowModal;
    Free;
  end;
end;

procedure Tf_zayav.e_nomzChange(Sender: TObject);
begin
  m_change_a:=1;
end;

procedure Tf_zayav.e_nomzEnter(Sender: TObject);
begin
  m_focus_a:=1;
end;

procedure Tf_zayav.e_nomzExit(Sender: TObject);
begin
  m_focus_a:=0;
end;

procedure Tf_zayav.TBItem_histClick(Sender: TObject);
begin
  m_id_zayav:=q_zayav.FieldValues['id'];
  if VarIsNull(q_zayav.FieldValues['nom_z']) then
      m_nomz:=''
  else
      m_nomz:=q_zayav.FieldValues['nom_z'];
      
  f_history:=TF_history.Create(Self);
  with f_history do
  Begin
    ShowModal;
    Free;
  end;

end;

procedure Tf_zayav.c_DateZakrChange(Sender: TObject);
begin
  m_change_a:=1;
end;

procedure Tf_zayav.c_DateZakrEnter(Sender: TObject);
begin
  m_focus_a:=1;
end;

procedure Tf_zayav.c_DateZakrExit(Sender: TObject);
begin
  m_focus_a:=0;
end;

procedure Tf_zayav.N13Click(Sender: TObject);
begin
  m_otchet:='plansnp';
  f_period.show;

end;

procedure Tf_zayav.N14Click(Sender: TObject);
begin
  m_otchet:='sverkadate';
  f_period.show;

end;

end.
