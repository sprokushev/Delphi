unit AddPlPst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxLookup, StdCtrls, Oracle, OracleData, Grids, DBGridEh,
  ExtCtrls, Buttons, Mask, ToolEdit, CurrEdit, DateUtils;

type
  TF_AddPlanPost = class(TForm)
    q_Tmp: TOracleDataSet;
    q_Prod: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    ds_Prod: TDataSource;
    q_PlanStru: TOracleDataSet;
    ds_PlanStru: TDataSource;
    q_Dogs: TOracleDataSet;
    ds_Dogs: TDataSource;
    pInfo: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lc_Prod: TRxDBLookupCombo;
    lc_PlanStru: TRxDBLookupCombo;
    e_dog: TEdit;
    lc_Dogs: TRxDBLookupCombo;
    Panel3: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    lb_PlanPer: TLabel;
    Label5: TLabel;
    lb_Plan: TLabel;
    q_PlanStruID: TFloatField;
    q_PlanStruNAME: TStringField;
    q_DogsID: TIntegerField;
    q_DogsDOG_NUMBER: TStringField;
    ora_Package: TOraclePackage;
    q_Refinery: TOracleDataSet;
    ds_Refinery: TDataSource;
    q_RefineryID: TIntegerField;
    q_RefineryPREDPR_NAME: TStringField;
    lc_Refinery: TRxDBLookupCombo;
    Label6: TLabel;
    q_Row: TOracleDataSet;
    q_PayForm: TOracleDataSet;
    ds_PayForm: TDataSource;
    q_PayFormID: TIntegerField;
    q_PayFormPAYFORM_NAME: TStringField;
    q_PayFormPAYFORM_GR_ID: TFloatField;
    q_PayFormMOSCOW_ID: TFloatField;
    Label8: TLabel;
    lc_PayForm: TRxDBLookupCombo;
    Label15: TLabel;
    edPrice: TRxCalcEdit;
    Label23: TLabel;
    edVes: TRxCalcEdit;
    Label21: TLabel;
    Label7: TLabel;
    q_orgstru: TOracleDataSet;
    ds_orgstru: TDataSource;
    q_orgstruID: TFloatField;
    q_orgstruNAME: TStringField;
    q_orgstruFILIAL_ID: TFloatField;
    lc_orgstru: TRxDBLookupCombo;
    Label9: TLabel;
    q_price: TOracleDataSet;
    q_pricePRICE_ID: TFloatField;
    q_priceCAT_CEN_ID: TFloatField;
    q_priceDATE_CENA: TDateTimeField;
    q_pricePLAN_CENA: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure e_dogChange(Sender: TObject);
    procedure lc_DogsChange(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure lc_ProdChange(Sender: TObject);
    procedure lc_DogsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lc_PlanStruKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lc_ProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure e_dogKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edVesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    OldId:double;
    CatCenId:double;
    DateCena:TDateTime;
    procedure RefreshPrices;
  public
    { Public declarations }
    PlanId:integer;
    PlanName:string;
    PlanPerId:integer;
    PlanPerName:string;
    BegDate:TDateTime;
    EndDate:TDateTime;
    EditMode:integer;
    EditId:double;
    OnlySNP:boolean;
    OnlyUNP:boolean;
  end;

var
  F_AddPlanPost: TF_AddPlanPost;

implementation

uses ForSystem, ForDB, main;

{$R *.dfm}

procedure TF_AddPlanPost.FormShow(Sender: TObject);
var DogId:double;
begin
  lb_Plan.Caption:=PlanName;
  lb_PlanPer.Caption:=PlanPerName;

  // Открываем таблицы
  f_db.ReQuery(q_Refinery,false);
  f_db.ReQuery(q_Prod,false);
  f_db.ReQuery(q_orgstru,false);
  f_db.ReQuery(q_payform,false);

  with q_PlanStru do
  try
    DisableControls;
    Close;
    try
      q_PlanStru.SQL[2]:='WHERE BEGIN_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
      q_PlanStru.SQL[3]:='  AND END_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BegDate)+''',''dd.mm.yyyy'')-1';
      if OnlySNP then
        q_PlanStru.SQL[5]:='  AND IS_SNP=1';
      if OnlyUNP then
        q_PlanStru.SQL[5]:='  AND POS_PREDPR_ID=8';
      f_db.ReQuery(q_PlanStru,false);
    except
      SQL[2]:=' WHERE 1 = 1 ';
      SQL[3]:='   AND 1 = 1 ';
      SQL[5]:='   AND 1 = 1 ';
      f_db.ReQuery(q_PlanStru,false);
    end;
  finally
    EnableControls;
  End;

  with q_Dogs do
  try
    DisableControls;
    Close;
    try
      SQL[2]:=' WHERE KLS_DOG.DOG_END_DATE>TO_DATE('''+FormatDateTime('dd.mm.yyyy',BegDate)+''',''dd.mm.yyyy'')-1';
      SQL[3]:='   AND KLS_DOG.DOG_BEGIN_DATE<TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndDate)+''',''dd.mm.yyyy'')+1';
      f_db.ReQuery(q_Dogs,false);
    except
      SQL[2]:=' WHERE 1 = 1 ';
      SQL[3]:='   AND 1 = 1 ';
      f_db.ReQuery(q_Dogs,false);
    end;
  finally
    EnableControls;
  End;

  OldId:=EditId;

  // Добавление
  If (EditMode=0) and (EditId=0) Then
  Begin
    Caption:='Добавление позиции плана';

    lc_Refinery.KeyValue:=8;
    lc_PayForm.KeyValue:=10;

    if OnlySNP then
    try
      if YearOf(EndDate)>=2005 then
      Begin
        DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('SNP2005_DEFAULT_DOGOVOR_ID'));
      end
      else
      Begin
        DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('SNP_DEFAULT_DOGOVOR_ID'));
      End;
    except
    end;

    if OnlyUNP then
    try
      DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('UNP_DEFAULT_DOGOVOR_ID'));
    except
      DogId:=0;
    end;

    if OnlyUNP then lc_PlanStru.KeyValue:=13;
  end;

  // Копирование
  If (EditMode=0) and (EditId<>0) Then
  Begin
    Caption:='Добавление позиции плана';
    q_row.close;
    q_row.SetVariable('ID',EditId);
    f_db.ReQuery(q_row,false);

    if NOT q_row.EOF then
    Begin
      lc_Prod.KeyValue:=q_row.FieldByName('PROD_ID_NPR').AsString;
      lc_PlanStru.KeyValue:=q_row.FieldByName('PLANSTRU_ID').AsFloat;
      DogId:=q_row.FieldByName('DOG_ID').AsFloat;
      lc_Refinery.KeyValue:=q_row.FieldByName('REFINERY_ID').AsFloat;
      lc_OrgStru.KeyValue:=q_row.FieldByName('ORGSTRU_ID').AsFloat;
      lc_PayForm.KeyValue:=q_row.FieldByName('PAYFORM_ID').AsFloat;
    end
    else
    begin
      lc_Refinery.KeyValue:=8;
      lc_PayForm.KeyValue:=10;

      if OnlySNP then
      try
        if YearOf(EndDate)>=2005 then
        Begin
          DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('SNP2005_DEFAULT_DOGOVOR_ID'));
        end
        else
        Begin
          DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('SNP_DEFAULT_DOGOVOR_ID'));
        End;
      except
      end;

      if OnlyUNP then
      try
        DogId:=F_ForSystem.StrToReal(F_main.GetApplVari('UNP_DEFAULT_DOGOVOR_ID'));
      except
        DogId:=0;
      end;

      if OnlyUNP then lc_PlanStru.KeyValue:=13;
    End;

    q_row.close;
    EditId:=0;
  end;


  // Редактирование
  If (EditMode=1) and (EditId<>0) Then
  Begin
    Caption:='Редактирование позиции плана';
    q_row.close;
    q_row.SetVariable('ID',EditId);
    f_db.ReQuery(q_row,false);

    if NOT q_row.EOF then
    Begin
      lc_Prod.KeyValue:=q_row.FieldByName('PROD_ID_NPR').AsString;
      lc_PlanStru.KeyValue:=q_row.FieldByName('PLANSTRU_ID').AsFloat;
      DogId:=q_row.FieldByName('DOG_ID').AsFloat;
      lc_Refinery.KeyValue:=q_row.FieldByName('REFINERY_ID').AsFloat;
      lc_OrgStru.KeyValue:=q_row.FieldByName('ORGSTRU_ID').AsFloat;
      lc_PayForm.KeyValue:=q_row.FieldByName('PAYFORM_ID').AsFloat;
      edPrice.Value:=q_row.FieldByName('PLAN_CENA').AsFloat;
      edVes.Value:=q_row.FieldByName('PLAN_VES').AsFloat;
    end
    else
    begin
      pInfo.Enabled:=false;
    End;

    q_row.close;
  end;


  if q_Dogs.Locate('ID',DogId,[]) then
  begin
    lc_Dogs.KeyValue:=q_Dogs.FieldByName('ID').AsInteger;
    e_dog.Text:=q_Dogs.FieldByName('DOG_NUMBER').AsString;
  end
  Else
  Begin
    e_dog.Text:='';
  End;

end;

procedure TF_AddPlanPost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_Refinery.Close;
  q_Tmp.Close;
  q_Prod.Close;
  q_PlanStru.Close;
  q_Dogs.Close;
  q_PayForm.Close;
  q_Tmp.SQL.Clear;
end;

procedure TF_AddPlanPost.e_dogChange(Sender: TObject);
begin
  If Trim(e_dog.Text)<>'' Then
  with q_Tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID FROM KLS_DOG WHERE DOG_NUMBER='''+Trim(e_dog.Text)+''' OR SHORT_NUMBER='''+Trim(e_dog.Text)+'''');
    Open;
    If Eof Then
    Begin
      lc_dogs.KeyValue:=0;
    End
    Else
    Begin
      lc_dogs.KeyValue:=FieldByName('ID').AsInteger;
    End;
  finally;
    Close;
  End;

end;

procedure TF_AddPlanPost.lc_DogsChange(Sender: TObject);
begin
  if lc_Dogs.Focused then
    e_dog.Text:=q_Dogs.FieldByName('DOG_NUMBER').AsString;
  RefreshPrices;
end;


procedure TF_AddPlanPost.RefreshPrices;
var ProdId:string;
    DogId:double;
Begin
  If (VarType(lc_Prod.KeyValue) <> varNull) AND (lc_Prod.KeyValue<>'00000')
     AND (VarType(lc_Dogs.KeyValue) <> varNull) AND (lc_Dogs.KeyValue<>0) AND NOT OnlySNP Then
  with ora_Package do
  try
    ProdId:=lc_Prod.KeyValue;
    DogId:=lc_Dogs.KeyValue;
    CallProcedure('FillTempPrices', [PlanPerId,ProdId,DogId]);
    f_db.ReQuery(q_price,false);
    edPrice.Value:=q_price.FieldByName('PLAN_CENA').AsFloat;
    CatCenId:=q_price.FieldByName('CAT_CEN_ID').AsFloat;
    DateCena:=q_price.FieldByName('DATE_CENA').AsDateTime;
  except
    on E:EOracleError do ShowMessage(E.Message);
  End;
end;

procedure TF_AddPlanPost.btOkClick(Sender: TObject);
begin
  If (VarType(lc_Prod.KeyValue) = varNull) OR
     (VarType(lc_PlanStru.KeyValue) = varNull) OR
     (VarType(lc_Refinery.KeyValue) = varNull) OR
     (VarType(lc_PayForm.KeyValue) = varNull) OR
     (VarType(lc_Dogs.KeyValue) = varNull) Then
  Begin
    Application.MessageBox('Не все реквизиты заполнены!','Внимание',MB_OK);
    exit;
  End
  else
  Begin
    with ora_Package do
    try
      EditId:=CallFloatFunction('AddPlanPost', [EditId,PlanId,PlanPerId,lc_Prod.KeyValue,
        lc_PlanStru.KeyValue,lc_Dogs.KeyValue,lc_Refinery.KeyValue,lc_orgstru.KeyValue,
        lc_PayForm.KeyValue,edPrice.Value,edVes.Value,CatCenId,DateCena]);
      ModalResult:=mrOk;
    except
      on E:EOracleError do ShowMessage(E.Message);
    End;
  end;
end;

procedure TF_AddPlanPost.lc_ProdChange(Sender: TObject);
begin
  RefreshPrices;
end;

procedure TF_AddPlanPost.lc_DogsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_RETURN) AND (ssCtrl IN Shift) then btOk.Click;
end;

procedure TF_AddPlanPost.lc_PlanStruKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_RETURN) AND (ssCtrl IN Shift) then btOk.Click;
end;

procedure TF_AddPlanPost.lc_ProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_RETURN) AND (ssCtrl IN Shift) then btOk.Click;
end;

procedure TF_AddPlanPost.e_dogKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_RETURN) AND (ssCtrl IN Shift) then btOk.Click;
end;

procedure TF_AddPlanPost.edVesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Key=VK_RETURN) AND (ssCtrl IN Shift) then btOk.Click;
end;

end.
