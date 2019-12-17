
unit azc_object_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, StdCtrls, Mask, ToolEdit, RxLookup,
  ExtCtrls, DBCtrls, Oracle, DBCtrlsEh;

type
  Tf_forAZC_object_add = class(TForm)
    ODS_azc_kind_a: TOracleDataSet;
    ODS_azc_type_a: TOracleDataSet;
    DS_azc_obj_kind_a: TDataSource;
    DS_azc_obj_type_a: TDataSource;
    Panel1: TPanel;
    lb_org: TLabel;
    lb_adr: TLabel;
    lb_note: TLabel;
    lb_type: TLabel;
    lb_kind: TLabel;
    OQ_azc_add_obj: TOracleQuery;
    ODS_azc_relations: TOracleDataSet;
    DS_azc_relations: TDataSource;
    ChB_relation: TCheckBox;
    LU_azc_obj_obj: TRxLookupEdit;
    Button2: TButton;
    Button1: TButton;
    Label2: TLabel;
    ed_workshop: TDBEditEh;
    Label3: TLabel;
    ed_INN: TDBEditEh;
    ed_abbr: TDBEditEh;
    ed_adress: TDBEditEh;
    ed_note: TDBEditEh;
    LU_azc_obj_kind: TRxLookupEdit;
    LU_azc_obj_type: TRxLookupEdit;
    Label1: TLabel;
    Label4: TLabel;
    ed_name: TDBEditEh;
    ed_fullname: TDBEditEh;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LU_azc_obj_objCloseUp(Sender: TObject);
    procedure ChB_relationClick(Sender: TObject);
    procedure LU_azc_obj_kindCloseUp(Sender: TObject);
    procedure LU_azc_obj_typeCloseUp(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LU_azc_obj_objChange(Sender: TObject);
    procedure LU_azc_obj_typeChange(Sender: TObject);
    procedure LU_azc_obj_kindChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddObject_correct(var correct: boolean);
    { Private declarations }
  public
    { Public declarations }
    ParentObj: TForm;
  end;

var
  f_forAZC_object_add: Tf_forAZC_object_add;
  arelations_o:string;
  edit_flag:boolean;
implementation

uses azc_object, main;

{$R *.dfm}

procedure Tf_forAZC_object_add.FormCreate(Sender: TObject);
begin
  inherited;
  ParentObj:=TForm(owner);
  with Tf_forAZC_object(ParentObj) do
  begin
    ODS_azc_kind_a.Session:= f_main.ora_Session;
    ODS_azc_type_a.Session:=f_main.ora_Session;
    ODS_azc_relations.Session:=f_main.ora_Session;
    OQ_azc_add_obj.Session:= f_main.ora_Session;

    LU_azc_obj_kind.LookupSource:= DS_azc_obj_kind_a;
    LU_azc_obj_type.LookupSource:= DS_azc_obj_type_a;
    LU_azc_obj_obj.LookupSource:=DS_azc_obj_all;

    ed_name.DataSource:=DS_azc_obj_all;
    ed_fullname.DataSource:=DS_azc_obj_all;
    ed_abbr.DataSource:=DS_azc_obj_all;
    ed_adress.DataSource:=DS_azc_obj_all;
    ed_note.DataSource:=DS_azc_obj_all;
    ed_workshop.DataSource:=DS_azc_obj_all;
    ed_INN.DataSource:=DS_azc_obj_all;

    ODS_azc_kind_a.Open;
    ODS_azc_type_a.Open;
    ODS_azc_relations.Open;
  end;
end;

// ÔÓ‚ÂÍ‡ Á‡ÔÓÎÌÂÌËÂ ÙÓÏ˚

procedure Tf_forAZC_object_add.AddObject_correct(var correct:boolean);
begin
if (ed_name.Text='') or (ed_adress.text='') or (LU_azc_obj_kind.Text='') then
     begin
 SHowMessage ('«‡ÔÓÌÂÌ˚ ÌÂ ‚ÒÂ ÔÓÎˇ!!!');
 correct:= false;
end
        else correct:= true;
end;

procedure Tf_forAZC_object_add.Button1Click(Sender: TObject);
var ainsert, arelations, core:string;
    correct:boolean;
    x:TBookmark;
begin
addobject_correct(correct);

IF correct=true then begin

if edit_flag=false then begin

//************* ƒŒ¡¿¬À≈Õ»≈ Œ¡⁄≈ “¿
ainsert:='INSERT INTO ORG_STRUCTURE (adress, note, name, org_kind_id, org_type_id) VALUES ( '''+
ed_adress.text + ''', '''+ ed_note.text + ''', '''+ ed_name.text+''',  '''+ ODS_azc_kind_a.FieldByName('ID').AsString +''' , ''' +ODS_azc_type_a.FieldByName('ID').AsString+ ''')';
  OQ_azc_add_obj.SQL.Clear;
    OQ_azc_add_obj.SQL.Add(ainsert);
      OQ_azc_add_obj.Execute;
        OQ_azc_add_obj.Session.Commit;

//************¬€◊»—À≈Õ»≈ ≈√Œ ID
ainsert:='select seq_org_structure.currval from dual';
OQ_azc_add_obj.SQL.Clear;
  OQ_azc_add_obj.SQL.Add(ainsert);
    OQ_azc_add_obj.Execute;

ainsert:=inttostr(OQ_azc_add_obj.Field('CURRVAL'));

with Tf_forAZC_object(ParentObj) DO
begin
if Chb_relation.Checked=false then arelations_o:=ainsert;
//************ ƒŒ¡¿¬À≈Õ»≈ —¬ﬂ«» Œ¡⁄≈ “Œ¬
arelations:= 'INSERT INTO ORG_RELATIONS (org_stru_1_id,org_stru_2_id, kind_rela_id ) VALUES ('+
trim(ainsert)+', '+trim(arelations_o)+', '+'1 )';
OQ_azc_add_obj.SQL.Clear;
OQ_azc_add_obj.SQL.Add(arelations);
OQ_azc_add_obj.Execute;
OQ_azc_add_obj.Session.Commit;
ODS_azc_obj_all.Refresh;
ODS_azc_obj.Refresh;
end;
self.Close;
end
///************ Œ¡ÕŒ¬À≈Õ»≈ ƒ¿ÕÕ€’
else
with Tf_forAZC_object(ParentObj) DO begin
arelations:= 'UPDATE ORG_STRUCTURE SET NAME='''+
ed_name.Text+ ''' , ADRESS = '''+ ed_adress.text+ ''' , NOTE='''+ed_note.Text+ ''' , ORG_KIND_ID='+
ODS_azc_kind_a.fieldbyname('ID').AsString+ ' , ORG_TYPE_ID='+ODS_azc_type_a.fieldbyname('ID').AsString+
' WHERE ID='+ODS_Azc_obj_all.FieldByName('ID').AsString;
OQ_azc_add_obj.SQL.Clear;
OQ_azc_add_obj.SQL.Add(arelations);
OQ_azc_add_obj.Execute;
OQ_azc_add_obj.Session.Commit;
x:=ODS_azc_obj_all.GetBookmark;
ODS_azc_obj_all.Refresh;
ODS_azc_obj.Refresh;
ODS_azc_obj_all.GotoBookmark(x);
ODS_Azc_obj_all.FreeBookmark(x);
end;
self.close;
end;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_objCloseUp(Sender: TObject);
begin
  with Tf_forAZC_object(ParentObj) do  begin
    arelations_o:=ODS_azc_obj_all.FieldByName('ID').AsString;
   ShowMessage( ODS_azc_obj_all.FieldByName('ID').AsString);
   end;
end;

procedure Tf_forAZC_object_add.ChB_relationClick(Sender: TObject);
begin
  IF Chb_relation.Checked then LU_azc_obj_obj.Enabled:=true
    else LU_azc_obj_obj.Enabled:=false;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_kindCloseUp(Sender: TObject);
begin
  if edit_flag=true then
    with Tf_forAZC_object(ParentObj) DO
   ODS_azc_obj_all.FieldByName('ORG_KIND_ID').AsInteger:= ODS_azc_kind_a.FieldByName('ID').Asinteger;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_typeCloseUp(Sender: TObject);
begin
  if edit_flag=true then
  with Tf_forAZC_object(ParentObj) DO
  ODS_azc_obj_all.FieldByName('ORG_TYPE_ID').AsInteger:= ODS_azc_type_a.FieldByName('ID').Asinteger;
end;

procedure Tf_forAZC_object_add.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_objChange(Sender: TObject);
begin
  with Tf_forAZC_object(ParentObj) do
    arelations_o:=ODS_azc_obj_all.FieldByName('ID').AsString;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_typeChange(Sender: TObject);
begin
if edit_flag=true then
  with Tf_forAZC_object(ParentObj) DO
  ODS_azc_obj_all.FieldByName('ORG_TYPE_ID').AsInteger:= ODS_azc_type_a.FieldByName('ID').Asinteger;
end;

procedure Tf_forAZC_object_add.LU_azc_obj_kindChange(Sender: TObject);
begin
  if edit_flag=true then
   with Tf_forAZC_object(ParentObj) DO
   ODS_azc_obj_all.FieldByName('ORG_KIND_ID').AsInteger:= ODS_azc_kind_a.FieldByName('ID').Asinteger;
end;

procedure Tf_forAZC_object_add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
edit_flag:=false;
with Tf_forAZC_object(ParentObj) DO begin
//azc_tree.Repaint;
EHazs_tree.Refresh;
end;
ODS_azc_kind_a.Close;
ODS_azc_relations.Close;
ODs_azc_type_a.Close;


end;

end.
