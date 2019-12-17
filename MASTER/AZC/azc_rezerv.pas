unit azc_rezerv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, StdCtrls, ExtCtrls, Oracle, DB, OracleData, Mask,
  ToolEdit, RxLookup, dateutils, CurrEdit;

type
  Tf_forAZC_Obj_rez = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ODS_sobstv: TOracleDataSet;
    DS_sobstv: TDataSource;
    OQ_rezerv: TOracleQuery;
    ODS_type: TOracleDataSet;
    DS_type: TDataSource;
    DS_PROD: TDataSource;
    ODS_PROD: TOracleDataSet;
    Label7: TLabel;
    e_max_vol: TRxCalcEdit;
    e_dead: TRxCalcEdit;
    LookUpProd: TRxLookupEdit;
    LookUp_type: TRxLookupEdit;
    LookUp_Sobst: TRxLookupEdit;
    Button1: TButton;
    Button2: TButton;
    e_vol: TRxCalcEdit;
    e_num_rez: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure e_max_volChange(Sender: TObject);
  private
    procedure correct_rez_insert(var flag_correct:boolean);
    { Private declarations }
  public
    { Public declarations }
     ParentObjECT:TForm;
  end;

var
  f_forAZC_Obj_rez: Tf_forAZC_Obj_rez;
  edit_flag:boolean;

implementation

uses azc_object, main;

{$R *.dfm}

procedure Tf_forAZC_Obj_rez.FormCreate(Sender: TObject);
begin
  inherited;
  ParentObject:=TForm(owner);

  ODS_type.Session:= F_main.ora_session;
  ODS_PROD.Session:= f_MAIN.ora_Session;
  oq_REZERV.SESSION:=f_MAIN.ora_Session;
  ODS_sobstv.Session:=f_MAIN.ora_Session;
  ODS_sobstv.Open;
  ODS_type.Open;
  ODS_PROD.OPEN;

end;

procedure Tf_forAZC_Obj_rez.Button1Click(Sender: TObject);
var
rezrv_mark: Tbookmark;
Flag_correct:boolean;
var1:string;
var2:string;
var3:string;
var4:string;
var5:string;

begin
  inherited;
correct_rez_insert(flag_correct);
IF flag_correct=true then
begin
If  edit_flag=false then
WITH  Tf_forAZC_object(parentobjECT) DO
    BEGIN
rezrv_mark:=ods_rez.GetBookmark;
with OQ_rezerv do begin
sql.Clear;
SQL.Add( 'INSERT INTO ARC_REZ ');
SQL.Add ('(DATEUPLOAD, REZ_NUM, VOL,DEAD_VOL,');
SQL.Add (' AR_TOV_ID, PROD_ID_NPR, ORG_STRU_ID, max_vol) VALUES ');
SQL.Add ('(TO_DATE('''+FormatDateTime('dd.mm.yyyy',today)+''',''dd-mm-yy'') , '''+ E_NUM_REZ.Text+''', '+ E_VOL.Text+', '+E_DEAD.Text+', ');
var1:='(SYSDATE, '''+ E_NUM_REZ.Text+''', '''+ E_VOL.Text+''', '+E_DEAD.Text+', ';
SQL.Add (ods_TYPE.FIELDBYNAME('id').ASSTRING+', '''+ ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+''',');
var2:=ods_TYPE.FIELDBYNAME('id').ASSTRING+', '''+ ODS_PROD.FIELDBYNAME('ID_NPR').ASSTRING+''', ';
SQL.Add (ODS_sobstv.FIELDBYNAME('ID').ASSTRING+','+ e_max_vol.Text+')');
var3:= ODS_sobstv.FIELDBYNAME('ID').ASSTRING+','+ e_max_vol.Text+')';
Execute;
end;
  f_main.ora_Session.Commit;
  ods_rez.Refresh;
  ODs_rez.GotoBookmark(rezrv_mark);
  ods_rez.FreeBookmark(rezrv_mark);
  SELF.Close;
end
 else
 //TODO: редактирование резервуаров  - дата изменени€ ставитс€ сегодн€шним днем
with   Tf_forAZC_object(parentobjECT) DO
BEGIN
rezrv_mark:=ods_rez.GetBookmark;
with OQ_rezerv do begin
SQL.Clear;
SQL.Add ('UPDATE ARC_REZ SET ');
SQL.Add ('DATEUPLOAD = TO_DATE('''+FormatDateTime('dd.mm.yyyy',today)+''', ''dd.mm.yyyy''), REZ_NUM='''+ e_num_rez.Text+''', ');
SQL.Add ('VOL='+e_vol.Text+', DEAD_VOL='+ e_dead.Text+',max_vol='+ e_max_vol.Text+',');
SQL.Add ('ar_tov_id='+ODS_type.fieldbyname('ID').AsString+', PROD_ID_NPR='''+ODS_prod.fieldbyname('ID_NPR').AsString+''',');
SQL.Add ('org_stru_id='+ ODS_sobstv.fieldbyname('ID').asstring);
SQL.Add ('WHERE dateupload= TO_DATE('''+FormatDateTime('dd.mm.yyyy',ODS_rez.fieldbyname('DATEUPLOAD').asdatetime)+''',''dd-mm-yy'') and ORG_STRU_ID='+ODS_rez.fieldbyname('ORG_STRU_ID').AsString);
SQL.Add (' and PROD_ID_NPR='''+ODS_rez.fieldbyname('PROD_ID_NPR').Asstring+''' and  REZ_NUM='''+ ODS_rez.fieldbyname('REZ_NUM').AsString+'''');
Execute;
session.Commit;
end;
  ods_rez.GotoBookmark(rezrv_mark);
  ods_rez.FreeBookmark(rezrv_mark);
  edit_flag:= false;
  ODS_rez.Refresh;
  mte_azs_obj.Refresh;
//  azc_rez.Refresh;
  SELF.Close;
end;

end;
end;

/// проверка заполнени€ формы
procedure Tf_forAZC_Obj_rez.correct_rez_insert(var flag_correct:boolean);
begin
If  (trim(e_num_rez.Text)='') or
(trim(e_vol.Text)='') or
(trim(e_max_vol.Text)='') or
(trim(lookupprod.Text)='') or
(trim(lookup_type.Text)='') or
(trim(lookup_sobst.Text)='')
then begin
flag_correct:= false;
ShowMEssage ('Ќе все пол€ заполнены!!!')
end
else
flag_correct:= true
end;
//-------------END ѕроверка заполнение формы


procedure Tf_forAZC_Obj_rez.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ODS_type.CLOSE;
ODS_PROD.CLOSE;
end;
procedure Tf_forAZC_Obj_rez.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure Tf_forAZC_Obj_rez.e_max_volChange(Sender: TObject);
begin
IF (e_max_vol.Text<>'') and (e_dead.Text<>'') then
begin
e_vol.Text:=floattostr( strtofloat(e_max_vol.Text) - strtofloat(e_dead.Text));
end;

end;

end.
