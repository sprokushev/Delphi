unit U_gu12a;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, StdCtrls, Mask,
  DBCtrlsEh, RxLookup, TB2Item, TB2Dock, TB2Toolbar, ExtCtrls, ToolEdit,
  RXDBCtrl, ActnList, XPStyleActnCtrls, ActnMan, ImgList, Buttons;

type
  Tf_zayav = class(TForm)
    OracleSession1: TOracleSession;
    q_zayav: TOracleDataSet;
    ds_zayav: TDataSource;
    gr_zayav: TDBGridEh;
    TBDock1: TTBDock;
    ActMan: TActionManager;
    requery_zayav: TAction;
    TBToolbar2: TTBToolbar;
    TBControlItem2: TTBControlItem;
    GroupBox2: TGroupBox;
    RadioGroup1: TRadioGroup;
    TBDock2: TTBDock;
    TBToolbar3: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    Panel2: TPanel;
    b_zayav_refresh: TSpeedButton;
    Label1: TLabel;
    c_filter_prod: TRxDBLookupCombo;
    DBGridEh1: TDBGridEh;
    q_filter_prod: TOracleDataSet;
    ds_filter_prod: TDataSource;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem5: TTBItem;
    GroupBox1: TGroupBox;
    c_filter_regdate1: TDBDateTimeEditEh;
    c_filter_regdate2: TDBDateTimeEditEh;
    Label2: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    q_nrow: TOracleDataSet;
    procedure FormActivate(Sender: TObject);
    procedure TBItem_addZayavClick(Sender: TObject);
    procedure TBItem_redZayavClick(Sender: TObject);
    procedure TBItem_delZayavClick(Sender: TObject);
    procedure requery_zayavExecute(Sender: TObject);
    procedure b_zayav_refreshClick(Sender: TObject);
    procedure TBItemClearFilter(Sender: TObject);
    procedure c_filter_regdate1Change(Sender: TObject);
    procedure c_filter_regdate2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_zayav: Tf_zayav;
  ind_append: integer;

implementation

uses U_red_zayav,u_glob_var, ForTemp;

{$R *.dfm}

procedure Tf_zayav.FormActivate(Sender: TObject);
begin
  m_filter:='Z.REG_DATE>=TO_DATE('''+DateToStr(m_fregdate1)+''',''dd.mm.yyyy'')';
  m_filter:=m_filter+' AND Z.REG_DATE<=TO_DATE('''+DateToStr(m_fregdate2)+''',''dd.mm.yyyy'')';
  c_filter_regdate1.Value:=m_fregdate1;
  c_filter_regdate2.Value:=m_fregdate2;
  requery_zayav.Execute;
  if m_indred=1 then
    q_zayav.Locate('ID',m_id_new,[])
  else
    q_zayav.Locate('ID',m_id_old,[]);
end;

procedure Tf_zayav.TBItem_addZayavClick(Sender: TObject);
begin

  
  //q_nrow.Refresh;
  if q_nrow.FieldValues['NROW']>0 then
  begin
  m_id_old:=q_zayav.FieldValues['ID'];
  //MessageDlg(m_id_old, mtConfirmation, [mbYes, mbNo], 0);

  arr_z := VarArrayCreate([0, 30], varVariant);
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
  end;


  q_zayav.Append;

  if q_nrow.FieldValues['NROW']>0 then
  begin
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
  q_zayav.FieldValues['VLADPUT_ID']:=arr_z[17]
  end
  else
  begin
  q_zayav.FieldValues['REG_DATE']:=date();
  end;

  q_zayav.Post;
  m_indred:=1;
  m_id_new:=q_zayav.FieldValues['ID'];
  f_red_zayav.show;

end;

procedure Tf_zayav.TBItem_redZayavClick(Sender: TObject);
begin
  m_id_old:=q_zayav.FieldValues['ID'];
  m_indred:=2;
  hide;
  f_red_zayav.show;
end;

procedure Tf_zayav.TBItem_delZayavClick(Sender: TObject);
begin
  if MessageDlg('Удалить заявку?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    q_zayav.Delete;
end;

procedure Tf_zayav.requery_zayavExecute(Sender: TObject);
begin
  q_zayav.Close;
  q_zayav.Sql.Clear;
  q_zayav.Sql.Add('SELECT');
  q_zayav.Sql.Add('Z.ROWID,');
  q_zayav.Sql.Add('Z.ID,');
  q_zayav.Sql.Add('Z.NOM_Z,');
  q_zayav.Sql.Add('Z.FROM_DATE,');
  q_zayav.Sql.Add('Z.TO_DATE,');
  q_zayav.Sql.Add('Z.PROD_ID,');
  q_zayav.Sql.Add('KP.NAME_GU12 AS PROD,');
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
  q_zayav.Sql.Add('VP.VLADPUT');
  q_zayav.Sql.Add('FROM');
  q_zayav.Sql.Add('GU12_A Z,');
  q_zayav.Sql.Add('V_GU12_OTPRAV O,');
  q_zayav.Sql.Add('V_GU12_PLATTAR PLT,');
  q_zayav.Sql.Add('KLS_PREDPR E,');
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
  q_zayav.Sql.Add('AND '+m_filter+' ');
  q_zayav.Sql.Add('ORDER BY ID');
  //MessageDlg(Q_ZAYAV.SQL.Text, mtConfirmation, [mbYes, mbNo], 0);
  q_zayav.Open;

end;

procedure Tf_zayav.b_zayav_refreshClick(Sender: TObject);
begin
  m_filter:='1=1';
  case RadioGroup1.ItemIndex of
    1: m_filter:=m_filter+' AND Z.SOGL=0';
    2: m_filter:=m_filter+' AND Z.SOGL=1';
  end;
  if c_filter_prod.Value<>'' then
    m_filter:=m_filter+' AND Z.PROD_ID='+trim(c_filter_prod.Value);
  if (VarToStr(c_filter_regdate1.Value)<>'') and (VarToStr(c_filter_regdate2.Value)<>'') then
    begin
      m_filter:=m_filter+' AND Z.REG_DATE>=TO_DATE('''+VarToStr(c_filter_regdate1.Value)+''',''dd.mm.yyyy'')';
      m_filter:=m_filter+' AND Z.REG_DATE<=TO_DATE('''+VarToStr(c_filter_regdate2.Value)+''',''dd.mm.yyyy'')';
    end;
  requery_zayav.Execute;
end;

procedure Tf_zayav.TBItemClearFilter(Sender: TObject);
begin
  c_filter_prod.ResetField;
  c_filter_regdate1.Value:=StrToDate('01.03.2003');
  c_filter_regdate2.Value:=StrToDate('30.04.2004');
  RadioGroup1.ItemIndex:=0;
  m_filter:='1=1';
  requery_zayav.Execute;
end;

procedure Tf_zayav.c_filter_regdate1Change(Sender: TObject);
begin
if c_filter_regdate2.Value<c_filter_regdate1.Value then
    c_filter_regdate2.Value:=c_filter_regdate1.Value
end;

procedure Tf_zayav.c_filter_regdate2Change(Sender: TObject);
begin
if c_filter_regdate2.Value<c_filter_regdate1.Value then
    c_filter_regdate1.Value:=c_filter_regdate2.Value
end;

end.
