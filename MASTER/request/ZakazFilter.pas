unit ZakazFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, OracleData, Oracle,
  RXCtrls, RxLookup, Mask, ToolEdit, StrUtils, DBCtrls;

type
  Tf_ZakazFilter = class(TForm)
    Panel1: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    btClear: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edClientNumFrom: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edClientNumTo: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label8: TLabel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edInputNumFrom: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edInputNumTo: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edNomZd: TEdit;
    cbFilial: TRxDBLookupCombo;
    cbNeftebasa: TRxDBLookupCombo;
    edStanKod: TEdit;
    cbStan: TRxDBLookupCombo;
    cbPoluch: TRxDBLookupCombo;
    btPoluch: TRxSpeedButton;
    cbPlat: TRxDBLookupCombo;
    btPlat: TRxSpeedButton;
    edDog: TEdit;
    cbPlanStru: TRxDBLookupCombo;
    cbProd: TRxDBLookupCombo;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    oraSes: TOracleSession;
    oraFilial: TOracleDataSet;
    dsFilial: TDataSource;
    oraNeftebasa: TOracleDataSet;
    dsNeftebasa: TDataSource;
    oraStan: TOracleDataSet;
    dsStan: TDataSource;
    oraPoluch: TOracleDataSet;
    dsPoluch: TDataSource;
    dsPlat: TDataSource;
    oraPlat: TOracleDataSet;
    cbDog: TRxDBLookupCombo;
    oraDog: TOracleDataSet;
    dsDog: TDataSource;
    oraPlanStru: TOracleDataSet;
    oraPlanStruID: TFloatField;
    oraPlanStruNAME: TStringField;
    oraPlanStruREGION_ID: TFloatField;
    dsPlanstru: TDataSource;
    oraProd: TOracleDataSet;
    dsProd: TDataSource;
    edClientDatFrom: TDateEdit;
    edClientDatTo: TDateEdit;
    edInputDatFrom: TDateEdit;
    edInputDatTo: TDateEdit;
    oraFilialID: TFloatField;
    oraFilialNAME: TStringField;
    oraNeftebasaID: TStringField;
    oraNeftebasaNAME: TStringField;
    oraStanID: TFloatField;
    oraStanSTAN_NAME: TStringField;
    oraStanSTAN_KOD: TIntegerField;
    oraPoluchID: TIntegerField;
    oraPoluchSHORT_NAME: TStringField;
    oraPoluchPREDPR_NAME: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    procedure btOkClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edStanKodChange(Sender: TObject);
    procedure cbStanChange(Sender: TObject);
    procedure btPoluchClick(Sender: TObject);
    procedure btPlatClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure oraFilialBeforeOpen(DataSet: TDataSet);
    procedure oraPlatBeforeOpen(DataSet: TDataSet);
    procedure oraDogBeforeOpen(DataSet: TDataSet);
    procedure oraProdBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    IS_AGENT:integer;
  public
    { Public declarations }
    FilterStr:string;
    FilterText:string;
    BEGIN_DATE:TDateTime;
    END_DATE:TDateTime;
    procedure ClearFields;
  end;

var
  f_ZakazFilter: Tf_ZakazFilter;
  gIS_AGENT:integer;

implementation

uses ForDB, KlsMisc2;

{$R *.dfm}

procedure Tf_ZakazFilter.btOkClick(Sender: TObject);
var s:string;
    zpt:string;
begin
  FilterText:='';
  FilterStr:='';

  zpt:=' ';
  If edClientNumFrom.Text<>'' then
  Begin
    FilterText:=FilterText+zpt+'Исх.№>='+Trim(edClientNumFrom.Text);
    FilterStr:=FilterStr+' AND mon.CLIENT_NUMBER>='''+Trim(edClientNumFrom.Text)+'''';
    zpt:=' И ';
  end;
  If edClientNumTo.Text<>'' then
  Begin
    FilterText:=FilterText+zpt+'Исх.№<='+Trim(edClientNumTo.Text);
    FilterStr:=FilterStr+' AND mon.CLIENT_NUMBER<='''+Trim(edClientNumTo.Text)+'''';
    zpt:=' И ';
  end;
  If edInputNumFrom.Text<>'' then
  Begin
    FilterText:=FilterText+zpt+'Вх.№>='+Trim(edInputNumFrom.Text);
    FilterStr:=FilterStr+' AND mon.INPUT_NUMBER>='''+Trim(edInputNumFrom.Text)+'''';
    zpt:=' И ';
  end;
  If edInputNumTo.Text<>'' then
  Begin
    FilterText:=FilterText+zpt+'Вх.№<='+Trim(edInputNumTo.Text);
    FilterStr:=FilterStr+' AND mon.INPUT_NUMBER<='''+Trim(edInputNumTo.Text)+'''';
    zpt:=' И ';
  end;
  If edClientDatFrom.Text<>'  .  .    ' then
  Begin
    FilterText:=FilterText+zpt+'Исх.дата>='+Trim(edClientDatFrom.Text);
    FilterStr:=FilterStr+' AND mon.CLIENT_DATE>=TO_DATE('''+Trim(edClientDatFrom.Text)+''',''dd.mm.yyyy'')';
    zpt:=' И ';
  end;
  If edClientDatTo.Text<>'  .  .    ' then
  Begin
    FilterText:=FilterText+zpt+'Исх.дата<='+Trim(edClientDatTo.Text);
    FilterStr:=FilterStr+' AND mon.CLIENT_DATE<=TO_DATE('''+Trim(edClientDatTo.Text)+''',''dd.mm.yyyy'')';
    zpt:=' И ';
  end;
  If edInputDatFrom.Text<>'  .  .    ' then
  Begin
    FilterText:=FilterText+zpt+'Вх.дата>='+Trim(edInputDatFrom.Text);
    FilterStr:=FilterStr+' AND mon.INPUT_DATE>=TO_DATE('''+Trim(edInputDatFrom.Text)+''',''dd.mm.yyyy'')';
    zpt:=' И ';
  end;
  If edInputDatTo.Text<>'  .  .    ' then
  Begin
    FilterText:=FilterText+zpt+'Вх.дата<='+Trim(edInputDatTo.Text);
    FilterStr:=FilterStr+' AND mon.INPUT_DATE<=TO_DATE('''+Trim(edInputDatTo.Text)+''',''dd.mm.yyyy'')';
    zpt:=' И ';
  end;
  if cbFilial.Value<>'0' then
  Begin
    FilterText:=FilterText+zpt+'Филиал='+oraFilialNAME.AsString;
    FilterStr:=FilterStr+' AND mon.FILIAL_ID='+cbFilial.Value;
    zpt:=' И ';
  end;

  IF (IS_AGENT<>9) then
  Begin
    s:=StrUtils.AnsiReplaceStr(edNomZd.Text,'*','%');
    If s<>'' then
    Begin
      FilterText:=FilterText+zpt+'№ ФИН='+s+'%';
      FilterStr:=FilterStr+' AND mon.NOM_ZD_LIST LIKE '''+s+'%''';
      zpt:=' И ';
    end;
    if cbStan.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Станция='+oraStanSTAN_NAME.AsString;
      FilterStr:=FilterStr+' AND mon.STAN_ID='+cbStan.Value;
      zpt:=' И ';
    end;
    if cbPoluch.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Получ.='+oraPoluchSHORT_NAME.AsString;
      FilterStr:=FilterStr+' AND mon.POLUCH_ID='+cbPoluch.Value;
      zpt:=' И ';
    end;
    if cbPlat.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Плател.='+oraPlat.FieldByName('SHORT_NAME').AsString;
      FilterStr:=FilterStr+' AND mon.PLAT_ID='+cbPlat.Value;
      zpt:=' И ';
    end;
    s:=StrUtils.AnsiReplaceStr(edDog.Text,'*','%');
    If s<>'' then
    Begin
      FilterText:=FilterText+zpt+'Дог='+s+'%';
      FilterStr:=FilterStr+' AND KLS_DOG.DOG_NUMBER LIKE '''+s+'%''';
      zpt:=' И ';
    end;
    if cbDog.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Дог='+oraDog.FieldByName('DOG_NUMBER').AsString;
      FilterStr:=FilterStr+' AND mon.DOG_ID='+cbDog.Value;
      zpt:=' И ';
    end;
    if cbPlanStru.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Поз.план='+oraPlanStruNAME.AsString;
      FilterStr:=FilterStr+' AND mon.PLANSTRU_ID='+cbPlanStru.Value;
      zpt:=' И ';
    end;
    if cbProd.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Продукт='+oraProd.FieldByName('NAME_NPR').AsString;
      FilterStr:=FilterStr+' AND mon.PROD_ID_NPR='''+cbProd.Value+'''';
      zpt:=' И ';
    end;
  End;

  if IS_AGENT=9 then
  Begin
    if cbNeftebasa.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Нефтебаза='+oraNeftebasaNAME.AsString;
      FilterStr:=FilterStr+' AND mon.NEFTEBASA='''+cbNeftebasa.Value+'''';
      zpt:=' И ';
    end;
    if cbPlat.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Плател.='+oraPlat.FieldByName('SHORT_NAME').AsString;
      FilterStr:=FilterStr+' AND mon.PARUS_AGENT_TAG='''+cbPlat.Value+'''';
      zpt:=' И ';
    end;
    s:=StrUtils.AnsiReplaceStr(edDog.Text,'*','%');
    If s<>'' then
    Begin
      FilterText:=FilterText+zpt+'Дог='+s+'%';
      FilterStr:=FilterStr+' AND mon.PARUS_DOGOVOR LIKE '''+s+'%''';
      zpt:=' И ';
    end;
    if cbDog.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Дог='+oraDog.FieldByName('DOG_NUMBER').AsString;
      FilterStr:=FilterStr+' AND mon.PARUS_DOGOVOR='''+cbDog.Value+'''';
      zpt:=' И ';
    end;
    if cbProd.Value<>'0' then
    Begin
      FilterText:=FilterText+zpt+'Продукт='+oraProd.FieldByName('NAME_NPR').AsString;
      FilterStr:=FilterStr+' AND mon.PARUS_NOMEN_TAG='''+cbProd.Value+'''';
      zpt:=' И ';
    end;
  End;

  ModalResult:=mrOk;
end;

procedure Tf_ZakazFilter.ClearFields;
Begin
  edClientNumFrom.Text:='';
  edClientNumTo.Text:='';
  edInputNumFrom.Text:='';
  edInputNumTo.Text:='';
  edClientDatFrom.Text:='  .  .    ';
  edClientDatTo.Text:='  .  .    ';
  edInputDatFrom.Text:='  .  .    ';
  edInputDatTo.Text:='  .  .    ';
  cbFilial.Value:='0';
  edNomZd.Text:='';
  edStanKod.Text:='';
  cbStan.Value:='0';
  cbPoluch.Value:='0';
  cbPlat.Value:='0';
  edDog.Text:='';
  cbDog.Value:='0';
  cbPlanStru.Value:='0';
  cbProd.Value:='0';
  cbNeftebasa.Value:='0';
End;

procedure Tf_ZakazFilter.btClearClick(Sender: TObject);
begin
  ClearFields;
end;

procedure Tf_ZakazFilter.FormCreate(Sender: TObject);
begin
  IS_AGENT:=gIS_AGENT;
  FilterStr:='';
  FilterText:='нет';
  f_db.LogonMasterSession(oraSes);

  IF IS_AGENT<>9 then
  Begin
    cbNeftebasa.Enabled:=false;
  End;

  if IS_AGENT=9 then
  Begin
    edNomZd.Enabled:=false;
    cbStan.Enabled:=false;
    edStanKod.Enabled:=false;
    cbPlanStru.Enabled:=false;
    cbPoluch.Enabled:=false;
    btPoluch.Enabled:=false;
    btPlat.Enabled:=false;
  End;
end;

procedure Tf_ZakazFilter.edStanKodChange(Sender: TObject);
begin
  if edStanKod.Text<>'' then
  if oraStan.locate('STAN_KOD',edStanKod.Text,[]) then
    cbStan.KeyValue:=oraStan.FieldByName('ID').AsInteger;
end;

procedure Tf_ZakazFilter.cbStanChange(Sender: TObject);
begin
  if cbStan.Value='0' then
    edStanKod.Text:=''
  else
    edStanKod.Text:=oraStan.FieldByName('STAN_KOD').AsString;
end;

procedure Tf_ZakazFilter.btPoluchClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_POLUCH','CHOOSE',fsNormal,VarToStr(cbPoluch.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      cbPoluch.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ZakazFilter.btPlatClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_PREDPR_PLAT','CHOOSE',fsNormal,VarToStr(cbPoluch.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      cbPlat.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_ZakazFilter.FormDestroy(Sender: TObject);
begin
  oraSes.Commit;
  oraSes.Connected:=false;
end;

procedure Tf_ZakazFilter.FormShow(Sender: TObject);
var OldID:variant;
begin
  IF (IS_AGENT<>9) then
  Begin
    OldId:=cbPlanStru.KeyValue;
    cbPlanStru.Value:='0';
    oraPlanStru.Close;
    oraPlanStru.SetVariable('BEGIN_DATE',BEGIN_DATE);
    oraPlanStru.SetVariable('END_DATE',END_DATE);
    f_db.ReQuery(oraPlanStru,true);
    if VarType(OldId)=VarNull then
      cbPlanStru.Value:='0'
    else
      cbPlanStru.KeyValue:=OldId;
  end;

  OldId:=cbFilial.KeyValue;
  cbFilial.Value:='0';
  oraFilial.Close;
  oraFilial.SetVariable('BEGIN_DATE',BEGIN_DATE);
  oraFilial.SetVariable('END_DATE',END_DATE);
  f_db.ReQuery(oraFilial,true);
  if VarType(OldId)=VarNull then
    cbFilial.Value:='0'
  else
    cbFilial.KeyValue:=OldId;

  if IS_AGENT=9 then
  Begin
    OldId:=cbNeftebasa.KeyValue;
    cbNeftebasa.Value:='0';
    oraNeftebasa.Close;
    oraNeftebasa.SetVariable('BEGIN_DATE',BEGIN_DATE);
    oraNeftebasa.SetVariable('END_DATE',END_DATE);
    f_db.ReQuery(oraNeftebasa,true);
    if VarType(OldId)=VarNull then
      cbNeftebasa.Value:='0'
    else
      cbNeftebasa.KeyValue:=OldId;
  end;

  IF (IS_AGENT<>9) then
  Begin
    OldId:=cbStan.KeyValue;
    cbStan.Value:='0';
    oraStan.Close;
    oraStan.SetVariable('BEGIN_DATE',BEGIN_DATE);
    oraStan.SetVariable('END_DATE',END_DATE);
    f_db.ReQuery(oraStan,true);
    if VarType(OldId)=VarNull then
      cbStan.Value:='0'
    else
      cbStan.KeyValue:=OldId;

    OldId:=cbPoluch.KeyValue;
    cbPoluch.Value:='0';
    oraPoluch.Close;
    oraPoluch.SetVariable('BEGIN_DATE',BEGIN_DATE);
    oraPoluch.SetVariable('END_DATE',END_DATE);
    f_db.ReQuery(oraPoluch,true);
    if VarType(OldId)=VarNull then
      cbPoluch.Value:='0'
    else
      cbPoluch.KeyValue:=OldId;
  end;

  OldId:=cbPlat.KeyValue;
  cbPlat.Value:='0';
  oraPlat.Close;
  oraPlat.SetVariable('BEGIN_DATE',BEGIN_DATE);
  oraPlat.SetVariable('END_DATE',END_DATE);
  f_db.ReQuery(oraPlat,true);
  if VarType(OldId)=VarNull then
    cbPlat.Value:='0'
  else
    cbPlat.KeyValue:=OldId;

  OldId:=cbDog.KeyValue;
  cbDog.Value:='0';
  oraDog.Close;
  f_db.ReQuery(oraDog,true);
  if VarType(OldId)=VarNull then
    cbDog.Value:='0'
  else
    cbDog.KeyValue:=OldId;

  OldId:=cbProd.KeyValue;
  cbProd.Value:='0';
  oraProd.Close;
  oraProd.SetVariable('BEGIN_DATE',BEGIN_DATE);
  oraProd.SetVariable('END_DATE',END_DATE);
  f_db.ReQuery(oraProd,true);
  if VarType(OldId)=VarNull then
    cbProd.Value:='0'
  else
    cbProd.KeyValue:=OldId;
end;

procedure Tf_ZakazFilter.oraFilialBeforeOpen(DataSet: TDataSet);
begin
  if IS_AGENT=9 then
  Begin
    oraFilial.SQL[1]:='FROM ORG_STRUCTURE, zakaz_parus m ';
  end
  else
  Begin
    oraFilial.SQL[1]:='FROM ORG_STRUCTURE, zakaz m';
  End;
end;

procedure Tf_ZakazFilter.oraPlatBeforeOpen(DataSet: TDataSet);
begin
  oraPlat.SQL.Clear;
  if IS_AGENT=9 then
    oraPlat.SQL.Add('SELECT DISTINCT parus_agent_tag as ID, parus_agent_tag as short_name, parus_agent_name as predpr_name '+
                    ' FROM zakaz_parus m '+
                    ' WHERE m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE '+
                    '   order by m.parus_agent_tag')
  else
    oraPlat.SQL.Add('SELECT DISTINCT kls.ID, kls.short_name, kls.predpr_name FROM kls_predpr kls, zakaz m '+
                    ' WHERE is_block<>1 AND m.plat_id=kls.id AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE '+
                    '   order by kls.short_name');
end;

procedure Tf_ZakazFilter.oraDogBeforeOpen(DataSet: TDataSet);
begin
  oraDog.SQL.Clear;
  if IS_AGENT=9 then
    oraDog.SQL.Add('SELECT DISTINCT parus_dogovor as ID, parus_dogovor as dog_number FROM zakaz_parus m '+
                    ' WHERE m.PARUS_AGENT_TAG=:ID')
  else
    oraDog.SQL.Add('SELECT DISTINCT kls_dog.ID, kls_dog.dog_number '+
                   ' FROM kls_predpr kls, kls_dog kls_dog WHERE ((kls.ID = kls_dog.predpr_id)) '+
                   ' and kls.id=TO_NUMBER(:id)');
end;

procedure Tf_ZakazFilter.oraProdBeforeOpen(DataSet: TDataSet);
begin
  oraProd.SQL.Clear;
  if IS_AGENT=9 then
    oraProd.SQL.Add('SELECT DISTINCT parus_nomen_tag as ID_NPR, parus_nomen_name as name_npr '+
                    ' FROM zakaz_parus m '+
                    ' WHERE m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE '+
                    '   order by m.parus_nomen_tag')
  else
    oraProd.SQL.Add('SELECT /*+ RULE */ DISTINCT kls_prod.id_npr, kls_prod.long_name_npr as name_npr '+
                    ' FROM zakaz m, kls_prod WHERE m.prod_id_npr = kls_prod.id_npr '+
                    '  AND m.date_plan BETWEEN :BEGIN_DATE AND :END_DATE '+
                    '  ORDER BY kls_prod.long_name_npr ASC');
end;

end.
