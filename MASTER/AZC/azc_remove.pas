unit azc_remove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, StdCtrls, Mask, ToolEdit, RxLookup, DB, OracleData,
  Oracle, Placemnt;

type
  Tf_forAZCRemove = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    ODS_oil_from: TOracleDataSet;
    ODS_oil_to: TOracleDataSet;
    DS_oil_from: TDataSource;
    DS_oil_to: TDataSource;
    ODS_oil_fromID_ORG: TFloatField;
    ODS_oil_fromNAME_ORG: TStringField;
    ODS_oil_fromID_PARENT_ORG: TFloatField;
    ODS_oil_fromID_ORG_TYPE: TFloatField;
    ODS_oil_toID_ORG: TFloatField;
    ODS_oil_toNAME_ORG: TStringField;
    ODS_oil_toID_PARENT_ORG: TFloatField;
    ODS_oil_toID_ORG_TYPE: TFloatField;
    ODS_oil: TOracleDataSet;
    Ds_oil: TDataSource;
    ODS_oilID_NPR: TStringField;
    ODS_oilID_GROUP_NPR: TStringField;
    ODS_oilNAME_NPR: TStringField;
    ODS_oilAZC_PR_GRP_ID: TFloatField;
    OQ_oil_from: TOracleQuery;
    oq_oil_to: TOracleQuery;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    rx_rpod: TRxLookupEdit;
    GroupBox4: TGroupBox;
    Rx_azc_from: TRxLookupEdit;
    rx_azc_to: TRxLookupEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    bt_remove: TButton;
    bt_cancel: TButton;
    GroupBox6: TGroupBox;
    dt_date: TDateEdit;
    Label7: TLabel;
    bt_test: TButton;
    FormPlacement1: TFormPlacement;
    chb_ves_vol: TCheckBox;
    rx_place: TRxLookupEdit;
    Label8: TLabel;
    ODS_place: TOracleDataSet;
    ODS_placeID: TFloatField;
    ODS_placeNAME: TStringField;
    DS_place: TDataSource;
    chb_parus: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rx_rpodCloseUp(Sender: TObject);
    procedure bt_testClick(Sender: TObject);
    procedure bt_removeClick(Sender: TObject);
    procedure chb_ves_volClick(Sender: TObject);
  private
    function rasschet_str(a1, a2, com: string):real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_forAZCRemove: Tf_forAZCRemove;
  flag_vesvol:boolean;

implementation

uses main;

{$R *.dfm}

procedure Tf_forAZCRemove.FormCreate(Sender: TObject);
begin
  inherited;
  ODS_oil_from.Session:=f_main.ora_Session;
  ODS_oil_to.Session:=f_main.ora_Session;
  ODS_oil.Session:=f_main.ora_Session;
  ODs_place.Session:=f_main.ora_Session;
  ODS_oil_from.Open;
  ODS_oil_to.open;
  ODS_oil.Open;
  ODS_place.open;
  Rx_azc_from.LookupValue:=ODS_oil_from.fieldbyname('NAME_ORG').asstring;
  Rx_azc_to.LookupValue:=ODS_oil_to.fieldbyname('NAME_ORG').asstring;
  Rx_rpod.LookupValue:=ODS_oil.fieldbyname('NAME_NPR').asstring;
  rx_place.LookupValue:=ODS_place.fieldbyname('NAME').AsString;

  dt_date.Date:=date;
  rx_rpodCloseUp(self);
  end;


procedure Tf_forAZCRemove.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ODS_oil_from.Close;
  ODS_oil_to.Close;
  OQ_oil_from.Close;
  OQ_oil_to.Close;
  ODS_oil.Close;
  self.Free;
end;

procedure Tf_forAZCRemove.rx_rpodCloseUp(Sender: TObject);
begin
  inherited;
  oq_oil_from.SQL.clear;
  oq_oil_from.SQL.Add('Select for_azc.GET_AZC_OST_VOL( '+ODS_oil_from.fieldbyname('ID_ORG').AsString+','+ODS_oil.fieldbyname('ID_NPR').AsString+',1, SYSDATE) as vol,');
  oq_oil_from.SQL.Add('for_azc.GET_AZC_OST_VES( '+ODS_oil_from.fieldbyname('ID_ORG').AsString+','+ODS_oil.fieldbyname('ID_NPR').AsString+',1, SYSDATE) as ves from dual');
  oq_oil_from.Execute;
  Edit2.Text:=oq_oil_from.Field('VOL');// объем
  Edit1.Text:=oq_oil_from.Field('VES'); // вес
  Edit9.Text:=oq_oil_from.Field('VOL');// объем
  Edit10.Text:=oq_oil_from.Field('VES'); // вес

  oq_oil_to.SQL.clear;
  oq_oil_to.SQL.Add('Select for_azc.GET_AZC_OST_VOL( '+ODS_oil_to.fieldbyname('ID_ORG').AsString+','+ODS_oil.fieldbyname('ID_NPR').AsString+',1, SYSDATE) as vol,');
  oq_oil_to.SQL.Add('for_azc.GET_AZC_OST_VES( '+ODS_oil_to.fieldbyname('ID_ORG').AsString+','+ODS_oil.fieldbyname('ID_NPR').AsString+',1, SYSDATE) as ves from dual');
  oq_oil_to.Execute;
  Edit3.Text:=oq_oil_to.Field('VOL');// объем
  Edit4.Text:=oq_oil_to.Field('VES'); // вес
  Edit11.Text:=oq_oil_to.Field('VOL');// объем
  Edit12.Text:=oq_oil_to.Field('VES'); // вес

end;

procedure Tf_forAZCRemove.bt_testClick(Sender: TObject);
begin
  inherited;
  IF Edit5.Visible=false then
  begin
  bt_test.Caption:='Отменить тест';
  Edit5.Visible:=true;
  Edit6.Visible:=true;
  Edit7.Visible:=true;
  Edit8.Visible:=true;
  if flag_vesvol=false then
  Edit5.text:=floattostr(strtofloat(edit2.Text)-strtofloat(edit9.Text))
  else
  Edit5.text:=edit2.text;



  Edit6.text:=floattostr(strtofloat(edit1.Text)-strtofloat(edit10.Text));


  Edit7.text:=floattostr(strtofloat(edit3.Text)+strtofloat(edit9.Text));
  Edit8.text:=floattostr(strtofloat(edit4.Text)+strtofloat(edit10.Text))
  end
  else
  begin
  Edit5.Visible:=false;
  Edit6.Visible:=false;
  Edit7.Visible:=false;
  Edit8.Visible:=false;
  bt_test.Caption:='Тест';
  end;
end;

procedure Tf_forAZCRemove.bt_removeClick(Sender: TObject);
var
plotnost:real;
begin
  inherited;
IF (Edit9.text<>'0') and  (Edit9.text<>'') then
plotnost:=rasschet_str(Edit10.Text,Edit9.Text,'/')
else
plotnost:=1;
with oq_oil_to do
begin
IF chb_parus.Checked = false then
begin
SQL.Clear;
SQL.Add('INSERT INTO AZC_OPERATION (DATE_OPER, DENCITY, VOLUME, VES,TYPE_OPER_ID, ');
SQL.Add('PLACE_SEND_ID, PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID) ');
SQL.Add(' VALUES (TO_DATE('''+(dt_date.text)+''',''DD-MM-YY''),'+floattostr(plotnost)+',');
SQL.Add(trim(edit9.text)+', '+trim(edit10.text)+', 4 ,'+ODS_place.fieldbyname('ID').asstring+',');
SQL.Add(''''+ ODS_OIL.FIELDBYNAME('ID_NPR').ASSTRING+''' ,1,'+ODS_OIL_TO.FIELDBYNAME('ID_ORG').ASSTRING+')');
execute;
session.commit;
end;

SQL.Clear;
SQL.Add('INSERT INTO AZC_OPERATION (DATE_OPER, DENCITY, VOLUME, VES,TYPE_OPER_ID, ');
SQL.Add('PLACE_SEND_ID, PROD_ID_NPR, SOBSTV_ID, ORG_STRU_ID) ');
IF flag_vesvol=false then
begin
SQL.Add(' VALUES (TO_DATE('''+(dt_date.text)+''',''DD-MM-YY''), NVL('+floattostr(plotnost) +',0), ');
SQL.Add('NVL('+trim(edit9.text)+',0),NVL('+trim(edit10.text)+',0),18,'+ODS_place.fieldbyname('ID').asstring+',');
end
else
begin
SQL.Add(' VALUES (TO_DATE('''+(dt_date.text)+''',''DD-MM-YY''), 1, ');
SQL.Add('0,'+trim(edit10.text)+',18,'+ODS_place.fieldbyname('ID').asstring+',');
end;
SQL.Add(''''+ ODS_OIL.FIELDBYNAME('ID_NPR').ASSTRING+''' ,1,'+ODS_OIL_FROM.FIELDBYNAME('ID_ORG').ASSTRING+')');
execute;
session.commit;
ShowMessage('Был переведен продукт '''+ODS_OIL.FIELDBYNAME('NAME_NPR').ASSTRING+''' c '+ ODS_oil_from.fieldbyname('NAME_ORG').asstring+' на '+ ODS_oil_to.fieldbyname('NAME_ORG').asstring);
end;
end;

function Tf_forAZCRemove.rasschet_str(a1,a2,com:string):real;
begin
if com='*' then
Result:=strtofloat(a1)*strtofloat(a2);

if com='/' then
Result:=strtofloat(a1)/strtofloat(a2);

if com='-' then
Result:=strtofloat(a1)-strtofloat(a2);

if com='+' then
Result:=strtofloat(a1)+strtofloat(a2);
end;



procedure Tf_forAZCRemove.chb_ves_volClick(Sender: TObject);
begin
  inherited;
If   chb_ves_vol.Checked = true then
begin
flag_vesvol:=true;
ShowMessage('Внимание!Включен режим "вес->объем"')
end
else
begin
flag_vesvol:=false;
ShowMessage('Внимание!Режим "вес->объем" выключен')
end;
end;

end.
