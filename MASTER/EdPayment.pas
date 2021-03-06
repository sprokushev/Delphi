unit EdPayment;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ComCtrls, RxLookup, StdCtrls,
  ToolEdit, CurrEdit, Buttons, Mask, Grids, DBGridEh, ExtCtrls, Oracle,
  DBCtrls, RXCtrls, variants, TB2ExtItems, TB2Item, Menus, GridsEh;

type
  Tf_EdPayment = class(TForm)
    q_Dog: TOracleDataSet;
    ds_Dog: TDataSource;
    Panel1: TPanel;
    q_DogID: TIntegerField;
    q_DogDOG_NUMBER: TStringField;
    q_DogPREDPR_NAME: TStringField;
    q_Banks: TOracleDataSet;
    ds_Banks: TDataSource;
    q_BanksID: TFloatField;
    q_BanksKORS: TStringField;
    q_BanksBIK: TStringField;
    q_BanksBANK_NAME: TStringField;
    q_BanksPOSTINDEX: TStringField;
    q_BanksADDRESS: TStringField;
    q_Payment_BIlls: TOracleDataSet;
    ds_Payment_BIlls: TDataSource;
    q_Payment_BIllsCHECKED: TFloatField;
    q_Payment_BIllsNOM_SF: TIntegerField;
    q_Payment_BIllsDATE_VYP_SF: TDateTimeField;
    q_cmn: TOracleQuery;
    q_Payment_BIllsSUMMA_DOK: TFloatField;
    q_PayBillSum: TOracleDataSet;
    ds_PayBillSum: TDataSource;
    q_PayBillSumSUMMA_DOK: TFloatField;
    q_PayForm: TOracleDataSet;
    dsPayForm: TDataSource;
    q_PayFormID: TIntegerField;
    q_PayFormPAYFORM_NAME: TStringField;
    q_PayFormPAYFORM_GR_ID: TFloatField;
    Panel2: TPanel;
    gbRekv: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    eNum_plat: TEdit;
    eDate_Plat: TDateTimePicker;
    eSumma: TCurrencyEdit;
    lc_payform: TRxDBLookupCombo;
    eDate_Post: TDateTimePicker;
    q_DogBANKS_ID: TFloatField;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    sb_Bank: TRxSpeedButton;
    eRS: TEdit;
    lc_Bank: TRxDBLookupCombo;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    eNazn_Plat: TEdit;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    lc_Dog: TRxDBLookupCombo;
    q_DogRS: TStringField;
    DBText3: TDBText;
    pm_grBills: TTBPopupMenu;
    TBItem48: TTBItem;
    TBEditItem2: TTBEditItem;
    TBItem49: TTBItem;
    TBItem50: TTBItem;
    GroupBox5: TGroupBox;
    q_Dest: TOracleDataSet;
    ds_Dest: TDataSource;
    lc_Dest: TRxDBLookupCombo;
    q_Payment_BIllsPROD_NAME: TStringField;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    lc_RSUNP: TRxDBLookupCombo;
    ds_RS: TDataSource;
    q_RS: TOracleDataSet;
    q_RSID: TFloatField;
    q_RSRS: TStringField;
    q_RSRS_NAME: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Label7: TLabel;
    DBText2: TDBText;
    grBills: TDBGridEh;
    TabSheet2: TTabSheet;
    q_Payment_Prod: TOracleDataSet;
    q_Payment_ProdCHECKED: TFloatField;
    q_Payment_ProdPROD_NAME: TStringField;
    ds_Payment_Prod: TDataSource;
    q_Payment_ProdPROD_ID_NPR: TStringField;
    grProd: TDBGridEh;
    pm_grProd: TTBPopupMenu;
    TBItem1: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    q_PayOnBillSum: TOracleDataSet;
    q_PayOnBillSumSUMMA: TFloatField;
    q_Payment_BIllsNOM_DOK: TFloatField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure q_Payment_BIllsBeforeOpen(DataSet: TDataSet);
    procedure grBillsDblClick(Sender: TObject);
    procedure grBillsSortMarkingChanged(Sender: TObject);
    procedure q_PayBillSumBeforeOpen(DataSet: TDataSet);
    procedure sb_BankClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TBEditItem2AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem49Click(Sender: TObject);
    procedure TBItem50Click(Sender: TObject);
    procedure q_Payment_BIllsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure lc_DogChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lc_DestChange(Sender: TObject);
    procedure q_Payment_ProdBeforeOpen(DataSet: TDataSet);
    procedure grProdDblClick(Sender: TObject);
    procedure grProdSortMarkingChanged(Sender: TObject);
    procedure q_Payment_ProdFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure q_PayOnBillSumAfterOpen(DataSet: TDataSet);
    procedure q_PayOnBillSumBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    TablePayToBills:string;
    TablePayProd:string;
    Filter2SF: TStringList; // ������ ��� grBills
    Filter2Prod: TStringList; // ������ ��� grProd
  public
    { Public declarations }
    IsAdd: boolean;
    EdPaymentId:Integer;
  end;

var
  f_EdPayment: Tf_EdPayment;

implementation
uses DateUtil,Math,DBGrids, main, ForDB, Payments, KlsMisc2;
{$R *.DFM}

procedure Tf_EdPayment.FormDestroy(Sender: TObject);
begin
  try
    filter2SF.Clear;
  except
  end;
  try
    filter2prod.Clear;
  except
  end;
  q_Dog.Close;
  q_Banks.Close;
  q_RS.Close;
  q_PayForm.Close;
  q_Dest.Close;
  q_Payment_Bills.Close;
  q_Payment_Prod.Close;
  q_PayBillSum.Close;
  q_PayOnBillSum.Close;
end;

procedure Tf_EdPayment.FormShow(Sender: TObject);
var i:integer;
begin
  If IsAdd then
  Begin
    Caption:='����� ������';
//    grBills.Enabled:=false;
    eDate_Plat.Date:=Now;
    eDate_Post.Date:=Now;
    lc_payform.KeyValue:=10;
    TablePayToBills:='V_TEMP_PAYMENTS_TO_BILLS';
    TablePayProd:='V_TEMP_PAYMENTS_PROD';
    lc_Dest.KeyValue:=1;
  end
  else
  begin
    Caption:='������ � '+eNum_Plat.Text+' �� '+FormatDateTime('dd.mm.yyyy',eDate_Plat.Date);
//    grBills.Enabled:=true;
    TablePayToBills:='PAYMENTS_TO_BILLS';
    TablePayProd:='PAYMENTS_PROD';
  end;
  q_Payment_Bills.SQL[7]:='(SELECT * FROM '+TablePayToBills+' WHERE PAYMENTS_ID='+intTostr(EdPaymentId)+') A ';
  q_Payment_Prod.SQL[5]:='(SELECT * FROM '+TablePayProd+' WHERE PAYMENTS_ID='+intTostr(EdPaymentId)+') A ';
  q_PayBillSum.SQL[3]:=TablePayToBills+' A ';
  lc_DogChange(Sender);
  if filter2SF.Count=0 then
  for i:=1 to q_Payment_Bills.FieldCount do
  Begin
    Filter2SF.Add('');
  end;
  if filter2prod.Count=0 then
  for i:=1 to q_Payment_Prod.FieldCount do
  Begin
    Filter2Prod.Add('');
  end;
  q_PayOnBillSum.Close;
  q_PayOnBillSum.Open;
end;

procedure Tf_EdPayment.q_Payment_BIllsBeforeOpen(DataSet: TDataSet);
begin
//  q_Payment_BIlls.SQL[1]:='  DECODE(A.NOM_DOK,null,0,DECODE(A.PAYMENTS_ID,'+intTostr(EdPaymentId)+',1,0)) AS checked,';
  if (q_DogID.AsString<>'') AND (lc_Dog.Value<>'') then
    q_Payment_Bills.SQL[9]:='and b.dog_id='+q_DogID.AsString
  else
    q_Payment_Bills.SQL[9]:='and b.dog_id=99999';

  if (lc_Dest.Value='0') or (lc_Dest.Value='') then
    q_Payment_Bills.SQL[10]:='and 1=1'
  else
    if (lc_Dest.Value='1') then
      q_Payment_Bills.SQL[10]:='and (c.id_npr>=''10100'' or c.id_npr=''10080'')'
    else
      if (lc_Dest.Value='21') then
        q_Payment_Bills.SQL[10]:='and c.bill_pos in (10,11,12,13)'
      else
        q_Payment_Bills.SQL[10]:='and c.bill_pos='+lc_Dest.Value;
  q_Payment_Bills.SQL.SaveToFile('c:\tmp\1.sql');
end;

procedure Tf_EdPayment.grBillsDblClick(Sender: TObject);
begin
  q_cmn.SQL.Clear;
  if q_Payment_BIllsCHECKED.Value=0 then
    begin
      q_cmn.SQL.Add('INSERT INTO '+TablePayToBills+' (payments_id,nom_dok) VALUES (');
      q_cmn.SQL.Add(FloatToStr(EdPaymentId)+','+q_Payment_BillsNOM_DOK.AsString+')');
    end
  else
    begin
      q_cmn.SQL.Add('DELETE FROM '+TablePayToBills+' WHERE payments_id='+FloatToStr(EdPaymentId)+' and nom_dok='+q_Payment_BillsNOM_DOK.AsString);
    end;
  q_cmn.Execute;
//  q_cmn.Session.Commit;
  f_db.ReQuery(q_Payment_Bills,True);
  f_db.ReQuery(q_PayBillSum,False);
end;

procedure Tf_EdPayment.grBillsSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Payment_BIlls,11,grBills);
end;

procedure Tf_EdPayment.q_PayBillSumBeforeOpen(DataSet: TDataSet);
begin
  if lc_Dog.Value<>'' then
    q_PayBillSum.SQL[5]:='and A.payments_id='+intTostr(EdPaymentId)
  else
    q_PayBillSum.SQL[5]:='and A.payments_id=999999999';
end;

procedure Tf_EdPayment.sb_BankClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_BANKS','CHOOSE',fsNormal,VarToStr(lc_Bank.KeyValue),'',true,0,0,'');

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      lc_Bank.KeyValue:=KlsMisc2.vIdToSeek;
    end;
    Free;
  end;
end;

procedure Tf_EdPayment.BitBtn1Click(Sender: TObject);
begin
  If lc_Dog.Text='' then
  Begin
    application.MessageBox('�������� �������!','��������!',mb_ok);
    lc_Dog.SetFocus;
    exit;
  end;

  If eNum_Plat.Text='' then
  Begin
    application.MessageBox('������� ����� ���������� ���������!','��������!',mb_ok);
    eNum_Plat.SetFocus;
    exit;
  end;

  If lc_payform.Text='' then
  Begin
    application.MessageBox('������� ����� ������!','��������!',mb_ok);
    lc_payform.SetFocus;
    exit;
  end;

  If lc_RSUNP.Text='' then
  Begin
    application.MessageBox('�������� ��������� ���� ����������!','��������!',mb_ok);
    lc_payform.SetFocus;
    exit;
  end;

  If eRS.Text='' then
  Begin
    application.MessageBox('������� ��������� ���� �����������!','��������!',mb_ok);
    eRS.SetFocus;
    exit;
  end;

  If lc_Bank.Text='' then
  Begin
    application.MessageBox('������� ���� �����������!','��������!',mb_ok);
    lc_Bank.SetFocus;
    exit;
  end;

  If (eSumma.Value=0) and IsAdd then
  Begin
    application.MessageBox('������� ����� �������!','��������!',mb_ok);
    eSumma.SetFocus;
    exit;
  end;

  ModalResult:=mrOk;
end;

procedure Tf_EdPayment.TBEditItem2AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  //IsRefresh:=true;
  f_db.FilterAcceptText(grBills,filter2SF,NewText,Accept);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.TBItem49Click(Sender: TObject);
begin
  //IsRefresh:=true;
  f_db.FilterCurrentValue(grBills,filter2SF);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.TBItem50Click(Sender: TObject);
begin
  //IsRefresh:=true;
  f_db.FilterCLear(grBills,filter2SF);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.q_Payment_BIllsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(grBills,filter2SF);
end;

procedure Tf_EdPayment.lc_DogChange(Sender: TObject);
begin
  with q_cmn do
  begin
    Close;
    SQL.Clear;
    SQL.Add('BEGIN');
    SQL.Add('  DELETE FROM V_TEMP_PAYMENTS_TO_BILLS;');
    SQL.Add('END;');
    Execute;
  end;
  with q_cmn do
  begin
    Close;
    SQL.Clear;
    SQL.Add('BEGIN');
    SQL.Add('  DELETE FROM V_TEMP_PAYMENTS_PROD;');
    SQL.Add('END;');
    Execute;
  end;
  q_Payment_Bills.Close;
  q_Payment_Bills.Open;
  q_Payment_Prod.Close;
  q_Payment_Prod.Open;
  q_PayBillSum.Close;
  q_PayBillSum.Open;
  lc_Bank.KeyValue:=q_DogBANKS_ID.AsInteger;
  eRS.Text:=q_DogRS.AsString;
end;

procedure Tf_EdPayment.FormCreate(Sender: TObject);
begin
  Filter2SF:=TStringList.Create;
  Filter2SF.Clear;
  Filter2prod:=TStringList.Create;
  Filter2prod.Clear;
end;

procedure Tf_EdPayment.lc_DestChange(Sender: TObject);
begin
  q_Payment_Bills.Close;
  q_Payment_Bills.Open;
  q_Payment_Prod.Close;
  q_Payment_Prod.Open;
  q_PayBillSum.Close;
  q_PayBillSum.Open;
end;

procedure Tf_EdPayment.q_Payment_ProdBeforeOpen(DataSet: TDataSet);
begin
//  q_Payment_Prod.SQL[1]:='  DECODE(A.PROD_ID_NPR,null,0,DECODE(A.PAYMENTS_ID,'+intTostr(EdPaymentId)+',1,0)) AS checked,';
  if (lc_Dest.Value='0') or (lc_Dest.Value='') then
    q_Payment_Prod.SQL[7]:='and 1=1'
  else
    if (lc_Dest.Value='1') then
      q_Payment_Prod.SQL[7]:='and c.id_npr>=''10100'''
    else
      if (lc_Dest.Value='21') then
        q_Payment_Prod.SQL[7]:='and c.bill_pos in (10,11,12,13)'
      else
        q_Payment_Prod.SQL[7]:='and c.bill_pos='+lc_Dest.Value;
  q_Payment_Prod.SQL.SaveToFile('c:\tmp\2.sql');
end;

procedure Tf_EdPayment.grProdDblClick(Sender: TObject);
begin
  q_cmn.SQL.Clear;
  if q_Payment_ProdCHECKED.Value=0 then
    begin
      q_cmn.SQL.Add('INSERT INTO '+TablePayProd+' (payments_id,prod_id_npr) VALUES (');
      q_cmn.SQL.Add(FloatToStr(EdPaymentId)+','''+q_Payment_ProdPROD_ID_NPR.AsString+''')');
    end
  else
    begin
      q_cmn.SQL.Add('DELETE FROM '+TablePayProd+' WHERE payments_id='+FloatToStr(EdPaymentId)+' and prod_id_npr='''+q_Payment_ProdPROD_ID_NPR.AsString+'''');
    end;
  q_cmn.Execute;
  f_db.ReQuery(q_Payment_Prod,True);
end;

procedure Tf_EdPayment.grProdSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Payment_Prod,8,grProd);
end;

procedure Tf_EdPayment.q_Payment_ProdFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(grProd,filter2Prod);
end;

procedure Tf_EdPayment.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  //IsRefresh:=true;
  f_db.FilterAcceptText(grProd,filter2prod,NewText,Accept);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.TBItem2Click(Sender: TObject);
begin
  //IsRefresh:=true;
  f_db.FilterCurrentValue(grProd,filter2prod);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.TBItem3Click(Sender: TObject);
begin
  //IsRefresh:=true;
  f_db.FilterCLear(grProd,filter2prod);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_EdPayment.q_PayOnBillSumAfterOpen(DataSet: TDataSet);
begin
  eNum_plat.Enabled:=(q_PayOnBillSumSUMMA.AsFloat=0);
  eDate_plat.Enabled:=(q_PayOnBillSumSUMMA.AsFloat=0);
  eDate_post.Enabled:=(q_PayOnBillSumSUMMA.AsFloat=0);
  eSumma.Enabled:=(q_PayOnBillSumSUMMA.AsFloat=0);
end;

procedure Tf_EdPayment.q_PayOnBillSumBeforeOpen(DataSet: TDataSet);
begin
  try
    q_PayOnBillSum.SQL[3]:='WHERE A.payments_id='+intTostr(EdPaymentId);
  except
    q_PayOnBillSum.SQL[3]:='WHERE A.payments_id=0';
  end;
end;

end.
