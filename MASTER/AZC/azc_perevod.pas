unit azc_perevod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, StdCtrls, Mask, ToolEdit, RxLookup, DB, OracleData,
  CurrEdit, Oracle, RXCtrls, ExtCtrls, Grids, DBGridEh, ComCtrls, DBCtrls,
  MemTableDataEh, DataDriverEh, MemTableEh;

type
  Tf_forAZC_perevod = class(Tf_MDIForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ODS_obj: TOracleDataSet;
    DS_obj: TDataSource;
    ODS_objID: TFloatField;
    ODS_objADRESS: TStringField;
    ODS_objNOTE: TStringField;
    ODS_objNAME: TStringField;
    ODS_objORG_KIND_ID: TFloatField;
    ODS_objPREDPR_ID: TIntegerField;
    ODS_objORG_TYPE_ID: TFloatField;
    ODS_objFILIAL: TFloatField;
    ODS_objWORKSHOP: TStringField;
    ODS_objINN: TStringField;
    ODS_objIS_AUTO_KONS: TIntegerField;
    ODS_predpr: TOracleDataSet;
    DS_predpr: TDataSource;
    ODS_predprID: TIntegerField;
    ODS_predprSHORT_NAME: TStringField;
    ODS_prod: TOracleDataSet;
    DS_prod: TDataSource;
    ODS_prodID_NPR: TStringField;
    ODS_prodID_KIND_NPR: TStringField;
    ODS_prodID_GROUP_NPR: TStringField;
    ODS_prodNAME_NPR: TStringField;
    ODS_prodLONG_NAME_NPR: TStringField;
    ODS_prodABBR_NPR: TStringField;
    ODS_prodID: TFloatField;
    ODS_prodFLG_ALLOWED: TIntegerField;
    ODS_prodGOST_NPR: TStringField;
    ODS_prodGD_KOD_NPR: TStringField;
    ODS_prodGD_NAME_NPR: TStringField;
    ODS_prodKOD_10: TStringField;
    ODS_prodKOD_OKDP: TStringField;
    ODS_prodKOD_FAS_MSK: TIntegerField;
    ODS_prodED_IZ: TStringField;
    ODS_prodNORMOTGR: TFloatField;
    ODS_prodFASOVKA: TIntegerField;
    ODS_prodVOL_FAS: TFloatField;
    ODS_prodDOR_NALOG: TIntegerField;
    ODS_prodAKCIZ: TIntegerField;
    ODS_prodPROD_NAR_ID: TFloatField;
    ODS_prodPROD_PLAN_ID: TFloatField;
    ODS_prodPROD_GU12_ID: TStringField;
    ODS_prodMOS_GRP_ID: TStringField;
    ODS_prodAZC_PR_GRP_ID: TFloatField;
    ODS_ostatok: TOracleDataSet;
    DS_ostatok: TDataSource;
    ODS_ostatokVOL: TFloatField;
    DS_prod_to: TDataSource;
    ODS_prod_to: TOracleDataSet;
    ODS_prod_toID_NPR: TStringField;
    ODS_prod_toID_KIND_NPR: TStringField;
    ODS_prod_toID_GROUP_NPR: TStringField;
    ODS_prod_toNAME_NPR: TStringField;
    ODS_prod_toLONG_NAME_NPR: TStringField;
    ODS_prod_toABBR_NPR: TStringField;
    ODS_prod_toID: TFloatField;
    ODS_prod_toFLG_ALLOWED: TIntegerField;
    ODS_prod_toGOST_NPR: TStringField;
    ODS_prod_toGD_KOD_NPR: TStringField;
    ODS_prod_toGD_NAME_NPR: TStringField;
    ODS_prod_toKOD_10: TStringField;
    ODS_prod_toKOD_OKDP: TStringField;
    ODS_prod_toKOD_FAS_MSK: TIntegerField;
    ODS_prod_toED_IZ: TStringField;
    ODS_prod_toNORMOTGR: TFloatField;
    ODS_prod_toFASOVKA: TIntegerField;
    ODS_prod_toVOL_FAS: TFloatField;
    ODS_prod_toDOR_NALOG: TIntegerField;
    ODS_prod_toAKCIZ: TIntegerField;
    ODS_prod_toPROD_NAR_ID: TFloatField;
    ODS_prod_toPROD_PLAN_ID: TFloatField;
    ODS_prod_toPROD_GU12_ID: TStringField;
    ODS_prod_toMOS_GRP_ID: TStringField;
    ODS_prod_toAZC_PR_GRP_ID: TFloatField;
    OQ_work: TOracleQuery;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    ODS_ostatokVES: TFloatField;
    ODS_ostatki_: TOracleDataSet;
    DS_ostatki: TDataSource;
    ODS_ostatki_VOL: TFloatField;
    ODS_ostatki_VES: TFloatField;
    Button2: TButton;
    RxLabel5: TRxLabel;
    ODS_locate: TOracleDataSet;
    DS_locate: TDataSource;
    ODS_locateID: TFloatField;
    ODS_locateDATE_OPER: TDateTimeField;
    ODS_locateDENCITY: TFloatField;
    ODS_locateVOLUME: TFloatField;
    ODS_locateVES: TFloatField;
    ODS_locateNOTE: TStringField;
    ODS_locateTYPE_OPER_ID: TFloatField;
    ODS_locatePLACE_SEND_ID: TFloatField;
    ODS_locatePROD_ID_NPR: TStringField;
    ODS_locateSOBSTV_ID: TIntegerField;
    ODS_locateORG_STRU_ID: TFloatField;
    ODS_locateSUMMA: TFloatField;
    ODS_locatePRICE: TFloatField;
    ODS_locateDISCOUNT: TIntegerField;
    ODS_locateDISCOUNT_TYPE: TStringField;
    ODS_locateDATE_INTO: TDateTimeField;
    Panel1: TPanel;
    cacled_ost_ves2: TRxCalcEdit;
    Cacled_ost_vol2: TRxCalcEdit;
    lookup_prod_to: TRxLookupEdit;
    Label4: TLabel;
    Panel2: TPanel;
    lookup_obj: TRxLookupEdit;
    lookup_Sobstv: TRxLookupEdit;
    lookup_product: TRxLookupEdit;
    datee_: TDateEdit;
    CaclEd_ostatok: TRxCalcEdit;
    CaclEd_ostatok_ves: TRxCalcEdit;
    Label5: TLabel;
    Label6: TLabel;
    ODS_prod_group: TOracleDataSet;
    DS_prod_group: TDataSource;
    ODS_prod_groupID: TFloatField;
    ODS_prod_groupNAME_NPR: TStringField;
    ODS_prod_groupAZC_PR_GRP_ID: TFloatField;
    bt_add: TButton;
    bt_delete: TButton;
    ODS_prod_for_gr: TOracleDataSet;
    DS_prod_for_gr: TDataSource;
    ODS_prod_for_grID_NPR: TStringField;
    ODS_prod_for_grID_KIND_NPR: TStringField;
    ODS_prod_for_grID_GROUP_NPR: TStringField;
    ODS_prod_for_grNAME_NPR: TStringField;
    ODS_prod_for_grLONG_NAME_NPR: TStringField;
    ODS_prod_for_grABBR_NPR: TStringField;
    ODS_prod_for_grID: TFloatField;
    ODS_prod_for_grFLG_ALLOWED: TIntegerField;
    ODS_prod_for_grGOST_NPR: TStringField;
    ODS_prod_for_grGD_KOD_NPR: TStringField;
    ODS_prod_for_grGD_NAME_NPR: TStringField;
    ODS_prod_for_grKOD_10: TStringField;
    ODS_prod_for_grKOD_OKDP: TStringField;
    ODS_prod_for_grKOD_FAS_MSK: TIntegerField;
    ODS_prod_for_grED_IZ: TStringField;
    ODS_prod_for_grNORMOTGR: TFloatField;
    ODS_prod_for_grFASOVKA: TIntegerField;
    ODS_prod_for_grVOL_FAS: TFloatField;
    ODS_prod_for_grDOR_NALOG: TIntegerField;
    ODS_prod_for_grAKCIZ: TIntegerField;
    ODS_prod_for_grPROD_NAR_ID: TFloatField;
    ODS_prod_for_grPROD_PLAN_ID: TFloatField;
    ODS_prod_for_grPROD_GU12_ID: TStringField;
    ODS_prod_for_grMOS_GRP_ID: TStringField;
    ODS_prod_for_grAZC_PR_GRP_ID: TFloatField;
    lookup_prod_for_gr: TRxLookupEdit;
    ch_state: TCheckBox;
    ODS_objIS_AUTO_LINK: TIntegerField;
    ODS_objPLAN_REAL: TIntegerField;
    ODS_objCITY_PREFIX_FILE: TStringField;
    ehProd: TDBGridEh;
    mteProd: TMemTableEh;
    dsdProd: TDataSetDriverEh;
    mteProdID: TFloatField;
    mteProdNAME_NPR: TStringField;
    mteProdAZC_PR_GRP_ID: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lookup_objChange(Sender: TObject);
    procedure lookup_SobstvChange(Sender: TObject);
    procedure lookup_productChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure lookup_prod_toCloseUp(Sender: TObject);
    procedure vgDB_tree1Expanded(Sender: TObject; Node: TTreeNode);
    procedure ch_stateClick(Sender: TObject);
    procedure bt_deleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_forAZC_perevod: Tf_forAZC_perevod;
  Node_for: TTreeNode;

implementation

uses main;
{$R *.dfm}

procedure Tf_forAZC_perevod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ODS_obj.Close;
ODS_predpr.Close;
ODS_ostatok.Close;

Self.free;
end;

procedure Tf_forAZC_perevod.FormCreate(Sender: TObject);
var
ODS_:TOracleDataSet;
RxCalc:TRxCalcedit;
begin
  inherited;
ODS_obj.Open;
lookup_obj.LookupValue:=ODS_obj.fieldbyname('NAME').AsString;
ods_predpr.Open;
ODS_prod.open;
datee_.Date:=date;
ODS_predpr.Locate('ID',1,[]);
lookup_sobstv.LookupValue:=ODS_predpr.fieldbyname('SHORT_NAME').AsString;
lookup_product.LookupValue:=ODS_predpr.fieldbyname('SHORT_NAME').AsString;
lookup_product.LookupValue:=ODS_prod.fieldbyname('ABBR_NPR').AsString;
ODS_prod_group.Open;
mteProd.TreeList.Active := True;
mteProd.TreeList.KeyFieldName := 'ID';
mteProd.TreeList.RefParentFieldName := 'AZC_PR_GRP_ID';
mteProd.Open;


With ODS_ostatok  do
  begin
  Close;
  SetVariable(':V_SOBSTV', ODS_predpr.fieldbyname('ID').AsInteger);
  SetVariable(':V_PROD', ODS_prod.fieldbyname('ID_NPR').AsString);
  SetVariable(':V_DATE',datee_.Date);
  SetVariable(':V_OBJ',ODS_obj.fieldbyname('ID').AsInteger);
  open;
end;
ODS_prod_to.Open;
ODS_prod_for_gr.open;


With ODS_ostatki_ do
  begin
  SetVariable(':V_SOBSTV', ODS_predpr.fieldbyname('ID').AsInteger);
  SetVariable(':V_DATE',datee_.Date);
  SetVariable(':V_OBJ',ODS_obj.fieldbyname('ID').AsInteger);
end;
Cacled_ostatok.Text:=ODS_ostatok.fieldbyname('VOL').AsString;
Cacled_ostatok_ves.Text:=ODS_ostatok.fieldbyname('ves').AsString;

end;





procedure Tf_forAZC_perevod.lookup_objChange(Sender: TObject);
begin
  inherited;
ODS_ostatok.Close;
ODS_ostatok.SetVariable(':V_OBJ',ODS_obj.fieldbyname('ID').AsInteger);
ODS_ostatki_.SetVariable(':V_OBJ',ODS_obj.fieldbyname('ID').AsInteger);
ODS_ostatok.Open;
Cacled_ostatok.Text:=ODS_ostatok.fieldbyname('VOL').AsString;
Cacled_ostatok_ves.Text:=ODS_ostatok.fieldbyname('ves').AsString;
end;



procedure Tf_forAZC_perevod.lookup_SobstvChange(Sender: TObject);
begin
  inherited;
ODS_ostatok.Close;
ODS_ostatok.SetVariable(':V_SOBSTV', ODS_predpr.fieldbyname('ID').AsInteger);
ODS_ostatok.Open;
Cacled_ostatok.Text:=ODS_ostatok.fieldbyname('VOL').AsString;
Cacled_ostatok_ves.Text:=ODS_ostatok.fieldbyname('ves').AsString;
end;

procedure Tf_forAZC_perevod.lookup_productChange(Sender: TObject);
begin
  inherited;
ODS_ostatok.Close;
ODS_ostatok.SetVariable(':V_PROD', ODS_prod.fieldbyname('ID_NPR').AsString);
ODS_ostatok.Open;
Cacled_ostatok.Text:=ODS_ostatok.fieldbyname('VOL').AsString;
Cacled_ostatok_ves.Text:=ODS_ostatok.fieldbyname('ves').AsString;
end;



procedure Tf_forAZC_perevod.Button1Click(Sender: TObject);
var
id_from, id_to:integer;
begin_vol, begin_ves, new_vol, new_ves:real;
begin
  inherited;

With ODS_locate  do
  begin
  Close;
  SetVariable(':V_SOBSTV', ODS_predpr.fieldbyname('ID').AsInteger);
  SetVariable(':V_PROD', ODS_prod.fieldbyname('ID_NPR').AsString);
  SetVariable(':V_OBJ',ODS_obj.fieldbyname('ID').AsInteger);
  open;
end;

//проверка записи по остатком продукта from
IF ODS_locate.RecordCount=1 then
   begin
  ODS_locate.Next;
  id_from:=ODS_locate.FieldByName('ID').AsInteger;
  OQ_work.SQL.Clear;
  OQ_work.SQL.Add('update azc_operation');
  OQ_work.SQL.Add(' set note=''переход от'', volume=' + floattostr(ODS_locate.fieldbyname('VOLUME').AsFloat - strtofloat(cacled_ostatok.text))+', ves='+ floattostr(ODS_locate.fieldbyname('ves').AsFloat - strtofloat(cacled_ostatok_ves.text))+' ');
  OQ_work.SQL.Add(' where id='+inttostr(id_from));
  OQ_work.Execute;
  OQ_work.Session.Commit;
   end
   else
   begin
  ShowMessage ('Ќет остатков по данному продукту - есть только добавки?' );
  end;



With ODS_locate  do
  begin
  Close;
  SetVariable(':V_PROD', ODS_prod_to.fieldbyname('ID_NPR').AsString);
  open;
end;
IF ODS_locate.RecordCount=1 then
  begin
    id_to:=ODS_locate.FieldByName('ID').AsInteger;
    ODS_locate.Next;
  OQ_work.SQL.Clear;
  OQ_work.SQL.Add('update azc_operation');
  OQ_work.SQL.Add(' set note=''переход'', volume=' + floattostr(ODS_locate.fieldbyname('VOLUME').AsFloat + strtofloat(cacled_ostatok.text))+', ves='+ floattostr(ODS_locate.fieldbyname('ves').AsFloat + strtofloat(cacled_ostatok_ves.text))+' ');
  OQ_work.SQL.Add(' where id='+inttostr(id_to));
  OQ_work.Execute;
  OQ_work.Session.Commit;
  ShowMEssage(ODS_locate.FieldByName('ID').AsString);
   end
   else
   begin
  ShowMessage ('Ќет остатков по данному продукту,создать запись?' );
  OQ_work.SQL.Clear;
  OQ_work.SQL.Add('insert into azc_operation(date_oper,volume,ves,note,TYPE_OPER_ID,PROD_ID_NPR,SOBSTV_ID,ORG_STRU_ID,place_send_id)');
  OQ_work.SQL.Add('values(  TO_DATE('''+(FormatDateTime('dd.mm.yyyy',date))+''',''dd-mm-yy''),'+ cacled_ostatok.Text+','+cacled_ostatok_ves.Text+', ''перевод от '+inttostr(id_from)+ ''',3,'+ODS_prod_to.fieldbyname('ID_NPR').AsString+','+ODS_predpr.fieldbyname('ID').AsString+','+ODS_obj.fieldbyname('ID').AsString+',1)');
  OQ_work.Execute;
  OQ_work.Session.Commit;
  end;
OQ_work.SQL.Clear;
OQ_work.SQL.Add('insert into test (num_from, num_to, vol,ves,date_) values ('+inttostr(id_from)+','+inttostr(id_to)+','+cacled_ostatok.Text+','+ cacled_ostatok_ves.text+',sysdate)');
OQ_work.Execute;
OQ_work.Session.Commit;


  { }
//проверка записи по остатком продукта to
//-----------------
end;

procedure Tf_forAZC_perevod.lookup_prod_toCloseUp(Sender: TObject);
begin
  inherited;
  ODS_ostatki_.Close;
  ODS_ostatki_.SetVariable(':V_PROD',ODS_prod_to.fieldbyname('ID_NPR').AsString);
  ODS_ostatki_.Open;
  Cacled_ost_vol2.Text:=ODS_ostatki_.fieldbyname('VOL').AsString;
  Cacled_ost_ves2.Text:=ODS_ostatki_.fieldbyname('ves').AsString;
end;

procedure Tf_forAZC_perevod.vgDB_tree1Expanded(Sender: TObject;
  Node: TTreeNode);
  var
  Node_beg:TTreeNode;
  Node_end:TTreeNode;
begin
  inherited;
 Node_beg:=Node.getFirstChild;
 Node_end:=Node.GetLastChild;
 While Node<>node_end do begin
 node:=node.GetNext;
 node.HasChildren:=false;
 end;
end;

procedure Tf_forAZC_perevod.ch_stateClick(Sender: TObject);
begin
  inherited;
IF ch_state.Checked = true then
begin
lookup_prod_for_gr.Enabled:=true;
bt_add.Enabled:=true;
bt_delete.Enabled:=true;
end
else
begin
lookup_prod_for_gr.Enabled:=false;
bt_add.Enabled:=false;
bt_delete.Enabled:=false;
end;

end;

procedure Tf_forAZC_perevod.bt_deleteClick(Sender: TObject);
begin
  inherited;
//ShowMessage('¬ы удл€ете из'+ vgDb_Tree.Selected.Text+' группы');
ShowMessage('¬ы удл€ете из'+ ODS_prod_group.fieldbyname('ID').asstring);
ShowMessage('¬ы удл€ете из'+ ODS_prod_group.fieldbyname('NAME_NPR').asstring);

end;

end.
