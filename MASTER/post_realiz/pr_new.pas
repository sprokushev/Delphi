unit pr_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData, Oracle,
  StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, RxLookup, ComCtrls,MdiForm,DateUtils;

type
  TfrmPRNew = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbPredpr: TRxDBLookupCombo;
    cbProd: TRxDBLookupCombo;
    edAll: TRxCalcEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    oraQIns: TOracleQuery;
    oraTSes: TOracleSession;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    ActionManager1: TActionManager;
    acSave: TAction;
    acExit: TAction;
    oraTip_real: TOracleDataSet;
    dsTip_real: TDataSource;
    oraVid_real: TOracleDataSet;
    dsVid_real: TDataSource;
    oraOrg_kind: TOracleDataSet;
    dsOrg_kind: TDataSource;
    oraOrg_Stru: TOracleDataSet;
    dsOrg_Stru: TDataSource;
    cbTip_real: TRxDBLookupCombo;
    cbVid_Real: TRxDBLookupCombo;
    cbOrg_kind: TRxDBLookupCombo;
    cbOrg_stru: TRxDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    oraQUpd: TOracleQuery;
    edDatePlan: TDateTimePicker;
    ora_Sklad: TOracleDataSet;
    ds_Sklad: TDataSource;
    cb_Sklad: TRxDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    cb_korr: TCheckBox;
    cb_PlanStru: TRxDBLookupCombo;
    oraPlanStru: TOracleDataSet;
    dsPlanStru: TDataSource;
    Label11: TLabel;
    edSumma: TRxCalcEdit;
    Label12: TLabel;
    edFirst: TRxCalcEdit;
    Label13: TLabel;
    cb_from: TRxDBLookupCombo;
    oraFrom: TOracleDataSet;
    dsFrom: TDataSource;
    cb_Uchastok: TRxDBLookupCombo;
    Label14: TLabel;
    ora_Uch: TOracleDataSet;
    ds_Uch: TDataSource;
    procedure acExitExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cbOrg_kindChange(Sender: TObject);
    procedure cbOrg_struChange(Sender: TObject);
    procedure edFirstExit(Sender: TObject);
    procedure edAllExit(Sender: TObject);
    procedure cb_UchastokChange(Sender: TObject);
  private
    { Private declarations }
  public
    EditID:integer;
    IsAdd:boolean;
    ParentDover:TForm;
    { Public declarations }
    gPredprId:integer;
    gProdId:string;
    gDatePlan:TDateTime;
    gTipReal:integer;
    gVidReal:integer;
    gOrgKind:integer;
    gOrgStru:integer;
  end;

var
  frmPRNew: TfrmPRNew;

implementation

uses pr_view, ForDB, KlsMisc2;

{$R *.dfm}

procedure TfrmPRNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmPRNew.acSaveExecute(Sender: TObject);
begin
 if (cbPredpr.Value='0') or (cbProd.Value='0')  or (cbTip_Real.Value='0')then
  application.MessageBox('Не выбран контрагент,продукт или тип реализации!', 'Не хватает реквизитов', mb_OK)
 else
 begin
   If IsAdd Then
   Begin
     oraQIns.ClearVariables;
     oraQIns.SetVariable(':SUPPLIER_ID',cbPredpr.KeyValue);
     oraQIns.SetVariable(':ves',edAll.Value);
     oraQIns.SetVariable(':FIRST_PLAN',edFirst.Value);
     oraQIns.SetVariable(':summa',edSumma.Value);
     oraQIns.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
     oraQIns.SetVariable(':PROD_ID_NPR',cbProd.KeyValue);
     if cbTip_real.Value<>'0' then oraQIns.SetVariable(':tip_real_id',cbTip_Real.KeyValue);
     if cbVid_real.Value<>'0' then oraQIns.SetVariable(':vid_real_id',cbVid_real.KeyValue);
     if cbOrg_kind.Value<>'0' then oraQIns.SetVariable(':org_kind_id',cbOrg_kind.KeyValue);
     if cbOrg_stru.Value<>'0' then oraQIns.SetVariable(':org_stru_id',cbOrg_stru.KeyValue);
     if cb_Sklad.Value<>'0' then oraQIns.SetVariable(':sklad_id',cb_Sklad.KeyValue);
     if cb_PlanStru.Value<>'0' then oraQIns.SetVariable(':PLANSTRU_ID',cb_PlanStru.KeyValue);
     if cb_from.Value<>'0' then oraQIns.SetVariable(':sklad_ID_from',cb_from.KeyValue);
     if cb_korr.Checked then oraQIns.SetVariable(':IS_KORR','1')
     else oraQIns.SetVariable(':IS_KORR','0');
     try
       oraQIns.Execute;
       oraTSes.Commit;
       ModalResult:=mrOk;
//       application.MessageBox('Сохранено!', 'Внимание',mb_OK);
     except
       on E:EOracleError do
         ShowMessage(E.Message);
     end;
   end
   else
   Begin
     oraQUpd.ClearVariables;
     oraQUpd.SetVariable(':SUPPLIER_ID',cbPredpr.KeyValue);
     oraQUpd.SetVariable(':ves',edAll.Value);
     oraQUpd.SetVariable(':FIRST_PLAN',edFirst.Value);
     oraQUpd.SetVariable(':summa',edSumma.Value);
     oraQUpd.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
     oraQUpd.SetVariable(':PROD_ID_NPR',cbProd.KeyValue);
     if cbTip_real.Value<>'0' then oraQUpd.SetVariable(':tip_real_id',cbTip_Real.KeyValue);
     if cbVid_real.Value<>'0' then oraQUpd.SetVariable(':vid_real_id',cbVid_real.KeyValue);
     if cbOrg_kind.Value<>'0' then oraQUpd.SetVariable(':org_kind_id',cbOrg_kind.KeyValue);
     if cbOrg_stru.Value<>'0' then oraQUpd.SetVariable(':org_stru_id',cbOrg_stru.KeyValue);
     if cb_Sklad.Value<>'0' then oraQUpd.SetVariable(':sklad_id',cb_Sklad.KeyValue);
     if cb_PlanStru.Value<>'0' then oraQUpd.SetVariable(':PLANSTRU_ID',cb_PlanStru.KeyValue);
     if cb_From.Value<>'0' then oraQUpd.SetVariable(':sklad_ID_from',cb_from.KeyValue);
     if cb_korr.Checked then oraQUpd.SetVariable(':IS_KORR','1')
     else oraQUpd.SetVariable(':IS_KORR','0');
     oraQUpd.SetVariable(':ID',EditID);
     try
       oraQUpd.Execute;
       oraTSes.Commit;
       ModalResult:=mrOk;
     except
       on E:EOracleError do
         ShowMessage(E.Message);
     end;
   end;
  end;
end;

procedure TfrmPRNew.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraTSes);
  oraKls_predpr.Open;
  oraKls_prod.Open;
  oraTip_real.Open;
  oraVid_real.Open;
  oraOrg_kind.Open;
  oraOrg_stru.Open;
  ora_Sklad.Open;
  ora_Uch.Open;
  oraFrom.Open;
  oraPlanStru.Open;
  ParentDover:=TForm(Owner);
end;

procedure TfrmPRNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oraTSes.Connected:=false;
end;

procedure TfrmPRNew.FormActivate(Sender: TObject);
begin
  inherited;
  if IsAdd then
  Begin
    Caption:='Новая запись';
    cbPredpr.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('PREDPR_ID').AsInteger;
    cbProd.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ID_NPR').AsString;
    edDatePlan.Date:=TfrmPRView(ParentDover).edDateFrom.Date;
    cbTip_real.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('TIP_REAL_ID').AsInteger;
    cbVid_real.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('VID_REAL_ID').AsInteger;
    cbOrg_kind.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ORG_KIND_ID').AsInteger;
    cbOrg_stru.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ORG_STRU_ID').AsInteger;
    cb_Sklad.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('SKLAD_ID').AsInteger;
    cb_Uchastok.KeyValue:=ora_Sklad.fieldbyname('UCHASTOK_ID').AsInteger;
    cb_Sklad.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('SKLAD_ID').AsInteger;
    cb_PlanStru.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('PLANSTRU_ID').AsInteger;
    cb_From.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('sklad_ID_from').AsInteger;
    cb_korr.Checked:=false;
  End
  Else
    Begin
      Caption:='Изменение записи';
      cbPredpr.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('PREDPR_ID').AsInteger;
      cbProd.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ID_NPR').AsString;
      edDatePlan.Date:=TfrmPRView(ParentDover).oraPP.FieldByName('DATE_PLAN').AsDateTime;
      edAll.Value:=TfrmPRView(ParentDover).oraPP.FieldByName('VES').AsFloat;
      edFirst.Value:=TfrmPRView(ParentDover).oraPP.FieldByName('FIRST_PLAN').AsFloat;
      edSumma.Value:=TfrmPRView(ParentDover).oraPP.FieldByName('SUMMA').AsFloat;
      cbTip_real.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('TIP_REAL_ID').AsInteger;
      cbVid_real.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('VID_REAL_ID').AsInteger;
      cbOrg_kind.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ORG_KIND_ID').AsInteger;
      cbOrg_stru.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('ORG_STRU_ID').AsInteger;
      cb_PlanStru.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('PLANSTRU_ID').AsInteger;
      cb_from.KeyValue:=TfrmPRView(ParentDover).oraPP.FieldByName('SKLAD_ID_FROM').AsInteger;
      cb_Sklad.KeyValue  :=TfrmPRView(ParentDover).oraPP.FieldByName('SKLAD_ID').AsInteger;
      cb_Uchastok.KeyValue:=ora_Sklad.fieldbyname('UCHASTOK_ID').AsInteger;
      cb_Sklad.KeyValue  :=TfrmPRView(ParentDover).oraPP.FieldByName('SKLAD_ID').AsInteger;
      cb_korr.Checked:=(TfrmPRView(ParentDover).oraPP.FieldByName('IS_KORR').AsInteger=1);
    end;

end;

procedure TfrmPRNew.cbOrg_kindChange(Sender: TObject);
begin
  ora_Sklad.Close;
  if cbOrg_kind.Value='1' then
    ora_Sklad.SQl[3]:=' and org_kind_id not in (5,12)'
  else
    if cbOrg_kind.Value='5' then
      ora_Sklad.SQl[3]:=' and org_kind_id in (5,12)'
    else
      ora_Sklad.SQl[3]:=' and 1=1';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';

end;

procedure TfrmPRNew.cbOrg_struChange(Sender: TObject);
begin
  ora_Sklad.Close;
  ora_Uch.Close;
  if cbOrg_stru.Value<>'0' then
  Begin
    ora_Sklad.SQl[2]:='where filial_id='+oraOrg_stru.fieldByName('ID').AsString;
    ora_Uch.SQl[2]:='and org_kind_id in (1,4,11)';
    ora_Uch.SQl[3]:='and filial_id='+oraOrg_stru.fieldByName('ID').AsString;
  end
  else
  Begin
    ora_Sklad.SQl[2]:='where 1=1';
    ora_Uch.SQl[2]:='and 1=0';
    ora_Uch.SQl[3]:='and 1=0';
  end;
  ora_Uch.Open;
  cb_Uchastok.Value:='0';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';
end;

procedure TfrmPRNew.edFirstExit(Sender: TObject);
begin
  if edFirst.Value<>edAll.Value then cb_korr.Checked:=true;
end;

procedure TfrmPRNew.edAllExit(Sender: TObject);
begin
  if IsAdd then edFirst.Value:=edAll.Value;
  if edFirst.Value<>edAll.Value then cb_korr.Checked:=true;
end;

procedure TfrmPRNew.cb_UchastokChange(Sender: TObject);
begin
  ora_Sklad.Close;
  if (cb_Uchastok.Value<>'0') and (cbOrg_stru.Value<>'0') then
    ora_Sklad.SQl[4]:='and UCHASTOK_id='+ora_Uch.fieldByName('ID').AsString
  else
    ora_Sklad.SQl[4]:='and 1=1';
  ora_Sklad.Open;
  cb_Sklad.Value:='0';
end;

end.
