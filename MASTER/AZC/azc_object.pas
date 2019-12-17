unit azc_object;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, TB2Item, TB2Dock, TB2Toolbar, DB, OracleData, Oracle,
  ComCtrls, Grids, DBGridEh, DBGrids, RXDBCtrl,
  StdCtrls, ActnList, XPStyleActnCtrls, ActnMan, Mask, ToolEdit, Dateutils,
  ExtCtrls, Buttons, MemTableDataEh, DataDriverEh, MemTableEh;

type
  Tf_forAZC_object = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    tbItemChange: TTBItem;
    tbItemDel: TTBItem;
    tbItemAdd: TTBItem;
    ODS_azc_obj: TOracleDataSet;
    DS_azc_obj: TDataSource;
    ODS_azc_obj_all: TOracleDataSet;
    DS_azc_obj_all: TDataSource;
    ActionManager1: TActionManager;
    ac_AZCObj_add: TAction;
    ODS_azc_obj_allID: TStringField;
    ODS_azc_obj_allADRESS: TStringField;
    ODS_azc_obj_allNOTE: TStringField;
    ODS_azc_obj_allNAME: TStringField;
    ODS_azc_obj_allORG_KIND_ID: TStringField;
    ODS_azc_obj_allORG_TYPE_ID: TStringField;
    ODS_azc_obj_allNAME_1: TStringField;
    ODS_azc_obj_allNAME_2: TStringField;
    ac_AZCObj_del: TAction;
    OQ_azc_obj: TOracleQuery;
    azc_AZCObj_edit: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ODS_rez: TOracleDataSet;
    DS_rez: TDataSource;
    Panel1: TPanel;
    Time_2: TDateEdit;
    Label1: TLabel;
    Time_1: TDateEdit;
    Label2: TLabel;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    Button1: TButton;
    ODS_azc_objID_ORG: TFloatField;
    ODS_azc_objNAME_ORG: TStringField;
    ODS_azc_objID_PARENT_ORG: TFloatField;
    ODS_azc_objID_ORG_TYPE: TFloatField;
    ODS_rezID_ORG: TFloatField;
    ODS_rezDATEUPLOAD: TDateTimeField;
    ODS_rezREZ_NUM: TStringField;
    ODS_rezREZ_NUM_UNP: TStringField;
    ODS_rezVOL: TFloatField;
    ODS_rezDEAD_VOL: TFloatField;
    ODS_rezMAX_VOL: TFloatField;
    ODS_rezPRIM: TStringField;
    ODS_rezDISP_NAME: TStringField;
    ODS_rezAR_TOV_ID: TIntegerField;
    ODS_rezPROD_ID_NPR: TStringField;
    ODS_rezORG_STRU_ID: TFloatField;
    ODS_rezNAME: TStringField;
    ODS_rezNAME_NPR: TStringField;
    ODS_rezNAME_1: TStringField;
    ODS_azc_objIS_ROOT: TIntegerField;
    ac_AZCObj_refresh: TAction;
    TBItem1: TTBItem;
    ac_AZCRez_add: TAction;
    ac_AZCRez_del: TAction;
    azc_AZCRez_edit: TAction;
    EHazs_rez: TDBGridEh;
    mte_azs_obj: TMemTableEh;
    dsd_azs_obj: TDataSetDriverEh;
    mte_azs_objID_ORG: TFloatField;
    mte_azs_objNAME_ORG: TStringField;
    mte_azs_objID_PARENT_ORG: TFloatField;
    mte_azs_objID_ORG_TYPE: TFloatField;
    mte_azs_objIS_ROOT: TIntegerField;
    EHazs_tree: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ac_AZCObj_addExecute(Sender: TObject);
    procedure ac_AZCObj_delExecute(Sender: TObject);
    procedure azc_AZCObj_editExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumnEh);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ac_AZCObj_refreshExecute(Sender: TObject);
    procedure ac_AZCRez_addExecute(Sender: TObject);
    procedure ac_AZCRez_delExecute(Sender: TObject);
    procedure azc_AZCRez_editExecute(Sender: TObject);
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mte_azs_objAfterScroll(DataSet: TDataSet);
    procedure EHazs_treeColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_forAZC_object: Tf_forAZC_object;
  azc_obj_col: integer;
  ods_integer: string;
  node_flag:boolean;
  list_node:TStringList;

implementation

uses azc_object_add, azc_rezerv, ForDB, main;

{$R *.dfm}

procedure Tf_forAZC_object.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ODS_azc_obj.close;
ODS_rez.Close;
ODs_azc_obj_all.Close;
Action:=caFree;
end;

procedure Tf_forAZC_object.FormCreate(Sender: TObject);

begin
  inherited;
    ODS_rez.Session:= f_main.ora_Session;
    ODS_azc_obj.Session:=f_main.ora_Session;
    ODS_azc_obj_all.Session:=f_main.ora_Session;
    OQ_azc_obj.Session:=f_main.ora_Session;

    ODS_azc_obj.Open;
    mte_azs_obj.TreeList.Active := True;
    mte_azs_obj.TreeList.KeyFieldName := 'ID_ORG';
    mte_azs_obj.TreeList.RefParentFieldName := 'ID_PARENT_ORG';
    mte_azs_obj.Open;

    ODS_rez.SetVariable(':ID_ORG', mte_azs_obj.fieldbyname('ID_ORG').asinteger);
    ODS_rez.SetVariable(':DATE_1', FormatDateTime('dd.mm.yyyy',StartOfTheMonth(NOW)));
    ODS_rez.SetVariable(':DATE_2', FormatDateTime('dd.mm.yyyy',now+1));
    ODS_azc_obj_all.SetVariable(':var_kind',0);
    Time_1.Date:= StartOfTheMonth(NOW);
    Time_2.Date:= now;
    ODS_rez.OPEN;
    ODS_azc_obj_all.Open;
end;

procedure Tf_forAZC_object.ac_AZCObj_addExecute(Sender: TObject);
begin
  inherited;
  // добавление объекта
  with tf_forAZC_object_add.create (self) do begin
    Showmodal;
  end;
end;

///TODO: рпоблема с удалением составной ключи - УДАЛЕНИЕ ОБЪЕКТА
procedure Tf_forAZC_object.ac_AZCObj_delExecute(Sender: TObject);
var st_id_del, st_str_del:string;
    rez_bookmark:Tbookmark;
begin
  inherited;
  // *****УДАЛЕНИЕ ОБЪЕКТА
  IF Application.messagebox('Вы удаляете объект. Возможно произойдет наружение связей в оргструктуре','Внимание!!!', MB_OKCANCEL) = ID_OK
  then
     with OQ_Azc_obj do begin
       rez_bookmark := ODS_azc_obj_all.GetBookmark;
       // проверка
       st_id_del := ODS_azc_obj_all.fieldbyname ('ID').asstring;
       SQL.Clear;
       sql.Add('select COUNT(*) from azc_operation where azc_operation.ORG_STRU_ID='+st_id_del);
       Execute;
       if RowCount>0 then begin
         st_str_del:='DELETE FROM ORG_RELATIONS WHERE ORG_STRU_1_ID='+st_id_del+' or ORG_STRU_2_ID='+st_id_del;
         SQL.Clear;
         SQL.Add(st_str_del);
         Execute;
         Session.Commit;
         st_str_del:= 'DELETE  FROM ARC_REZ WHERE ORG_STRU_ID ='+st_id_del;
         SQL.Clear;
         SQL.Add(st_str_del);
         Execute;
         Session.Commit;
         st_str_del:='DELETE FROM ORG_structure WHERE ID='+st_id_del;
         st_id_del:=ODS_AZC_obj_all.FieldByName('ID').AsString;
         SQL.Clear;
         SQL.Add(st_str_del);
         Execute;
         Session.Commit;
         ODS_azc_obj.Refresh;
         ODS_azc_obj_all.Refresh;
         EHazs_tree.Refresh;
//         azc_tree.Update;
         WITH ODS_azc_obj_all DO  begin
           IF  BookmarkValid(rez_bookmark)= true  then
             GotoBookmark (rez_bookmark)
           else ODS_Azc_obj_all.Last;
         end;
       end
       else
         ShowMEssage ('ВЫ не можете удалить этот объект! Объект участвует в операциях');
     end;
  ODS_azc_obj_all.FreeBookmark(rez_bookmark);
end;

procedure Tf_forAZC_object.azc_AZCObj_editExecute(Sender: TObject);
begin
  inherited;
  ods_integer:= ODS_azc_obj_all.fieldbyname ('ID').AsString;
  // редактирование объекта
  if (ODS_azc_obj_all.FieldByName('ID').AsString<>'')  then
  begin
    azc_object_add.edit_flag:=true;
    with tf_forAZC_object_add.create (self) do  begin
      ODS_azc_obj_all.locate('ID', ods_integer,[]);
      ed_NOTE.DataSource:=DS_azc_obj_all;
      ed_name.DataSource:=DS_azc_obj_all;
      ed_name.DataField:='NAME';
      ed_adress.DataField:='ADRESS';
      ed_adress.DataSource:=DS_azc_obj_all;
      ed_NOTE.DataField:='NOTE';
      LU_azc_obj_kind.Text:=ODS_azc_obj_all.FieldByName('NAME_1').AsString;
      LU_azc_obj_type.Text:=ODS_azc_obj_all.FieldByName('NAME_2').AsString;
      ods_azc_kind_a.Locate('ID',ODS_azc_obj_all.FieldByName('ORG_KIND_ID').AsInteger, []);
      ods_azc_type_a.Locate('ID',ODS_azc_obj_all.FieldByName('ORG_TYPE_ID').AsInteger, []);
      Showmodal;
    end;
  end;
end;

procedure Tf_forAZC_object.Button1Click(Sender: TObject);
begin
  inherited;
if TRIM(TIME_1.Text)='' THEN time_1.Date:=  StartOfTheMonth(NOW);
if TRIM(TIME_2.Text)='' THEN time_2.Date:= now;
  with ODS_rez do begin
    SetVariable(':DATE_2',Time_2.Date+1);
    SetVariable(':DATE_1',Time_1.Date);
    Refresh;
  end;
end;

procedure Tf_forAZC_object.ComboBox1Change(Sender: TObject);
begin
  inherited;

if combobox1.ItemIndex=1 then
  with ODS_rez do begin
    Close;
    sql[5]:='and org_structure.id<>:ID_ORG';
    open;
    SetVariable(':ID_ORG',1);
    Refresh;
   EHazs_rez.Enabled:=false;
end;
if combobox1.ItemIndex=0 then
  with ODS_rez do begin
  Close;
  EHazs_rez.Enabled:=true;
  SQL[5]:='and org_structure.id=:ID_ORG';
  SetVariable(':ID_ORG',55);
  open;
end;

end;

procedure Tf_forAZC_object.DBGrid1CellClick(Column: TColumnEh);
begin
  inherited;
//if (ods_azc_obj_all.Active) and (ods_azc_obj_all.RecordCount>0) then
//azc_tree.LookupNodeEx(ODS_azc_obj_all.FieldByName('ID').AsVariant, true);
end;

procedure Tf_forAZC_object.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
azc_AZCObj_editExecute(Sender);
end;

procedure Tf_forAZC_object.DBGrid1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
if ODS_azc_obj_all.RecNo mod 2<>0 then
        Background:=clInfoBk ;
if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_forAZC_object.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
if ODS_rez.RecNo mod 2<>0 then
        Background:=clInfoBk;
if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_forAZC_object.ac_AZCObj_refreshExecute(Sender: TObject);
begin
  inherited;
  if pagecontrol1.TabIndex=0 then f_db.ReQuery(ODS_azc_obj_all,true);
  if pagecontrol1.TabIndex=1 then f_db.ReQuery(ODS_rez,true);
end;

procedure Tf_forAZC_object.ac_AZCRez_addExecute(Sender: TObject);
begin
  inherited;
  // добавление резервуара
  with Tf_forAZC_Obj_rez.create (self) do begin
    ODS_sobstv.Locate('ID', ODS_azc_obj.fieldbyname('ID_ORG').asstring, []);
    lookup_sobst.Text:= ODS_azc_obj.fieldbyname('NAME_ORG').asstring;
    showmodal;
  end;
end;

procedure Tf_forAZC_object.ac_AZCRez_delExecute(Sender: TObject);
var st_id_del, st_str_del:string;
    rez_bookmark:Tbookmark;
begin
  inherited;
  // *****УДАЛЕНИЕ ИНфОРМАЦИИ О РЕЗЕРВУАРЕ
  If application.MessageBox('ВЫ точно хотите удалить информацию по этому резервуару?', 'Внимание!!!', MB_OKCANCEL	) = ID_OK then
  with OQ_azc_obj do begin
    rez_bookmark:=ODS_rez.GetBookmark;
    SQL.Clear;
    SQL.Add('DELETE FROM ARC_REZ');
    SQL.Add ('WHERE to_date(dateupload, ''dd-mm-yy'')= TO_DATE('''+datetostr((ODS_rez.fieldbyname('DATEUPLOAD').asdatetime))+''',''dd-mm-yy'') and ORG_STRU_ID='+ODS_rez.fieldbyname('ORG_STRU_ID').AsString);
    SQL.Add ('and PROD_ID_NPR='''+ODS_rez.fieldbyname('PROD_ID_NPR').Asstring+''' and  REZ_NUM='''+ ODS_rez.fieldbyname('REZ_NUM').AsString+'''');
    Execute;
    session.Commit;
    ODS_rez.Refresh;
    mte_azs_obj.Refresh;
//    azc_rez.Update;
    if ODS_rez.BookmarkValid(rez_bookmark) then ODS_rez.GotoBookmark(rez_bookmark)
    else ODS_rez.Last;
    with EHazs_tree do begin
      Refresh;
      Update;
    end;
  end;
  ODS_azc_obj_all.FreeBookmark(rez_bookmark);
end;

procedure Tf_forAZC_object.azc_AZCRez_editExecute(Sender: TObject);
begin
  inherited;
  // редактирование резервуара
  if (ODS_rez.FieldByName('ID_ORG').AsString<>'')  then
  with Tf_forAZC_Obj_rez.create (self) do begin
    azc_rezerv.edit_flag:=true;
    e_num_rez.Text:= ods_rez.fieldbyname('REZ_NUM').AsString;
    e_vol.Text:=ods_rez.fieldbyname('vol').AsString;
    e_dead.Text:=ods_rez.fieldbyname('dead_vol').AsString;
    e_max_vol.Text:= ods_rez.fieldbyname ('MAX_VOL').AsString;
    ODS_prod.Locate('ID_NPR',ods_rez.fieldbyname('PROD_ID_NPR').asstring,[]);
    lookupprod.Text:= ods_rez.fieldbyname('NAME_NPR').asstring;
    ODS_type.Locate('ID',ods_rez.fieldbyname('AR_TOV_ID').asinteger,[]);
    lookup_type.Text:= ods_rez.fieldbyname('NAME_1').asstring;
    ODS_sobstv.Locate('ID',ods_rez.fieldbyname('ORG_STRU_ID').asinteger,[]);
    lookup_sobst.Text:= ods_sobstv.fieldbyname('NAME').asstring;
    Showmodal;
  end;

end;

procedure Tf_forAZC_object.DBGridEh1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
 if mte_azs_obj.TreeNodeExpanded  then
   params.ImageIndex:=38
 else
  if mte_azs_obj.TreeNodeHasChildren then
   params.ImageIndex:=41
  else
   params.ImageIndex:=40;
end;

procedure Tf_forAZC_object.mte_azs_objAfterScroll(DataSet: TDataSet);
var
 a:integer;
 ex_var:string;
begin
  inherited;
if PageControl1.ActivePage.Name ='TabSheet2' then begin
if mte_azs_obj.Active then begin
    ODS_rez.SetVariable(':ID_ORG', mte_azs_obj.fieldbyname('ID_ORG').asinteger);
   IF ODS_REZ.Active THEN Button1Click(self);
end;
end;

if PageControl1.ActivePage.Name='TabSheet1' then begin
if mte_azs_obj.Active then begin
//azc_tree.UpdateCursorPos;
ods_azc_obj_all.close;
ex_var:=ods_azc_obj_all.GetVariable(':var_kind');
ods_azc_obj_all.SetVariable(':var_kind', mte_azs_obj.fieldbyname('id_org').AsString);
ods_azc_obj_all.Open;
If ods_azc_obj_all.RecordCount=0 then
begin
ods_azc_obj_all.close;
ods_azc_obj_all.SetVariable(':var_kind', mte_azs_obj.fieldbyname('id_PARENT_ORG').AsString);
ods_azc_obj_all.Open;
ods_azc_obj_all.Locate('ID',mte_azs_obj.fieldbyname('id_org').asinteger,[]);
ods_azc_obj_all.UpdateCursorPos;
end;
end;
end;
end;

procedure Tf_forAZC_object.EHazs_treeColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
 if mte_azs_obj.TreeNodeExpanded  then
   params.ImageIndex:=38
 else
  if mte_azs_obj.TreeNodeHasChildren then
   params.ImageIndex:=41
  else
   params.ImageIndex:=40;
end;

end.
