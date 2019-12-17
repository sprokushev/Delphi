unit pp_new;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData, Oracle,
  RxLookup, StdCtrls, ComCtrls, Mask, ToolEdit, CurrEdit, Buttons, DateUtils,
  MdiForm;

type
  TfrmPPNew = class(TForm)
    cbPredpr: TRxDBLookupCombo;
    oraQIns: TOracleQuery;
    oraTSes: TOracleSession;
    oraKls_predpr: TOracleDataSet;
    dsPredpr: TDataSource;
    oraKls_prod: TOracleDataSet;
    dsProd: TDataSource;
    ActionManager1: TActionManager;
    acSave: TAction;
    acExit: TAction;
    cbProd: TRxDBLookupCombo;
    edAll: TRxCalcEdit;
    edHran: TRxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ora_planStru: TOracleDataSet;
    ds_planStru: TDataSource;
    Label6: TLabel;
    cbPlanstru: TRxDBLookupCombo;
    edDatePlan: TDateTimePicker;
    oraQUpd: TOracleQuery;
    cb_korr: TCheckBox;
    procedure acSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acExitExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    EditID:integer;
    ParentDover:TForm;
    { Public declarations }
  end;

var
  frmPPNew: TfrmPPNew;

implementation
uses pp_view, ForDB;
{$R *.dfm}

procedure TfrmPPNew.acSaveExecute(Sender: TObject);
begin
 if (cbPredpr.Value='0') or (cbProd.Value='0') then
  application.MessageBox('Не выбран контрагент или продукт!', 'Не хватает реквизитов', mb_OK)
 else
 begin
   If EditID=0 Then
   Begin
     oraQIns.ClearVariables;
     oraQIns.SetVariable(':SUPPLIER_ID',cbPredpr.KeyValue);
     oraQIns.SetVariable(':hran',edHran.Value);
     oraQIns.SetVariable(':ves',edAll.Value);
     oraQIns.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
     oraQIns.SetVariable(':PROD_ID_NPR',cbProd.KeyValue);
     oraQIns.SetVariable(':PLANSTRU_ID',cbPlanStru.KeyValue);
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
     oraQUpd.SetVariable(':hran',edHran.Value);
     oraQUpd.SetVariable(':ves',edAll.Value);
     oraQUpd.SetVariable(':DATE_PLAN',StartOfTheMonth(edDatePlan.Date));
     oraQUpd.SetVariable(':PROD_ID_NPR',cbProd.KeyValue);
     oraQUpd.SetVariable(':PLANSTRU_ID',cbPlanstru.KeyValue);
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
   End;
 end;

end;

procedure TfrmPPNew.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(oraTSes);
  oraKls_predpr.Open;
  oraKls_prod.Open;
  ora_planStru.Open;
  ParentDover:=TForm(Owner);
end;

procedure TfrmPPNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oraTSes.Connected:=false;
end;

procedure TfrmPPNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmPPNew.FormActivate(Sender: TObject);
begin
  if EditID=0 then
  Begin
    Caption:='Новая запись';
    edDatePlan.Date:=TfrmPPView(ParentDover).edDateFrom.Date;
    cbPredpr.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('PREDPR_ID').AsInteger;
    cbProd.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('ID_NPR').AsString;
    cbPlanstru.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('PLANSTRU_ID').AsInteger;
    edAll.Value:=0;
    edHran.Value:=0;
    cb_korr.Checked:=false;
  End
  Else
    Begin
      Caption:='Изменение записи';
      cbPredpr.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('PREDPR_ID').AsInteger;
      cbProd.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('ID_NPR').AsString;
      cbPlanstru.KeyValue:=TfrmPPView(ParentDover).oraPP.FieldByName('PLANSTRU_ID').AsInteger;
      edDatePlan.Date:=TfrmPPView(ParentDover).oraPP.FieldByName('DATE_PLAN').AsDateTime;
      edAll.Value:=TfrmPPView(ParentDover).oraPP.FieldByName('VES').AsFloat;
      edHran.Value:=TfrmPPView(ParentDover).oraPP.FieldByName('HRAN').AsFloat;
      cb_korr.Checked:=(TfrmPPView(ParentDover).oraPP.FieldByName('IS_KORR').AsInteger=1);
    end;
end;

end.
