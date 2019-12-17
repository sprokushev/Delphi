unit Payments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGridEh, OracleData, Oracle,
  StdCtrls, RXSpin, Menus, Placemnt, ComCtrls,
  PrnDbgeh, ToolWin, ActnMan, ActnCtrls, ExtCtrls, ActnList,MDIForm,
  Buttons, TB2Item, TB2Dock, TB2Toolbar,DBGridEhImpExp, XPStyleActnCtrls,DateUtils,
  TB2ExtItems, GridsEh;

type
  Tf_Payments = class(Tf_MDIForm)
    q_Payments: TOracleDataSet;
    grid_pays: TDBGridEh;
    ds_OtpCen: TDataSource;
    q_UpdPayments: TOracleQuery;
    FormStorage1: TFormStorage;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionManager1: TActionManager;
    acPaymentNew: TAction;
    acPaymentEdit: TAction;
    acPaymentFilter: TAction;
    acPaymentOraToDBF: TAction;
    acPaymentCopy: TAction;
    acPaymentDelete: TAction;
    acPaymentPrint: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    e_BeginDate: TDateTimePicker;
    Label4: TLabel;
    e_EndDate: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    SaveDialog1: TSaveDialog;
    acPaymentSaveToXls: TAction;
    TBItem6: TTBItem;
    q_PaymentsID: TFloatField;
    q_PaymentsDOG_ID: TFloatField;
    q_PaymentsBANK_ID: TFloatField;
    q_PaymentsRS: TStringField;
    q_PaymentsSUMMA: TFloatField;
    q_PaymentsNAZN_PLAT: TStringField;
    q_PaymentsOURBANK_ID: TFloatField;
    q_PaymentsDOG_NUMBER: TStringField;
    q_PaymentsDOG_DATE: TDateTimeField;
    q_PaymentsBANK_NAME: TStringField;
    q_PaymentsBANK_ADRESS: TStringField;
    q_PaymentsOURBANK_NAME: TStringField;
    q_PaymentsOURBANK_ADRESS: TStringField;
    q_PaymentsNUM_PLAT: TStringField;
    q_PaymentsDATE_PLAT: TDateTimeField;
    q_PaymentsPLAT_NAME: TStringField;
    acPaymentPayedBills: TAction;
    q_PaymentsSUMMA_PLACED: TFloatField;
    acPaymentPlace: TAction;
    oraFOR_BILLS: TOraclePackage;
    acPaymentsPlace: TAction;
    TBItem7: TTBItem;
    q_PaymentsPAYFORM_ID: TFloatField;
    q_PaymentsPAYFORM_NAME: TStringField;
    q_PaymentsDATE_POST: TDateTimeField;
    TBItem8: TTBItem;
    pm_grid: TTBPopupMenu;
    TBItem48: TTBItem;
    TBEditItem2: TTBEditItem;
    TBItem49: TTBItem;
    TBItem50: TTBItem;
    TBSeparatorItem14: TTBSeparatorItem;
    tbCallOutWinEdit: TTBItem;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    TBItem58: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    TBItem65: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem38: TTBItem;
    TBItem59: TTBItem;
    TBItem60: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    q_cmn: TOracleQuery;
    cb_ToRealiz: TCheckBox;
    oraSes: TOracleSession;
    acPaymentUnPlace: TAction;
    TBItem9: TTBItem;
    q_PaymentsDEST_ID: TFloatField;
    acPaymentUnPlacePeriod: TAction;
    TBItem10: TTBItem;
    q_PaymentsDEST_NAME: TStringField;
    q_PaymentsRS_ID: TFloatField;
    q_PaymentsRS_UNP: TStringField;
    acPaymentAllBills: TAction;
    q_PaymentsPLAT_ID: TIntegerField;
    TBItem11: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    q_CheckPlat: TOracleDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acPaymentNewExecute(Sender: TObject);
    procedure acPaymentEditExecute(Sender: TObject);
    procedure ac_ToDBFExecute(Sender: TObject);
    procedure acPaymentCopyExecute(Sender: TObject);
    procedure grid_paysGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acPaymentDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure grid_paysSortMarkingChanged(Sender: TObject);
    procedure acPaymentSaveToXlsExecute(Sender: TObject);
    procedure acPaymentPayedBillsExecute(Sender: TObject);
    procedure acPaymentPlaceExecute(Sender: TObject);
    procedure acPaymentsPlaceExecute(Sender: TObject);
    procedure q_PaymentsBeforeOpen(DataSet: TDataSet);
    procedure TBEditItem2AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem49Click(Sender: TObject);
    procedure TBItem50Click(Sender: TObject);
    procedure q_PaymentsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure acPaymentUnPlaceExecute(Sender: TObject);
    procedure acPaymentUnPlacePeriodExecute(Sender: TObject);
    procedure acPaymentAllBillsExecute(Sender: TObject);
    procedure tbCallOutWinEditClick(Sender: TObject);
    procedure acPaymentFilterExecute(Sender: TObject);
  private
    { Private declarations }
    Filter2Pays: TStringList; // Фильтр для grid_pays
    ViewLinkMode:integer; // 1-отбор по связям
    ViewLinkFilter:string; // Фильтр для реализации связей
  public
    { Public declarations }
  end;

var
  f_Payments: Tf_Payments;
  gLinkMode:integer; // Режим просмтора: 1-по связям 0-стандартный просмотр
  gLinkFilter:string; // Строка для филтра по связям

implementation

uses EdOtpCen, ORATODBF,DBGrids,Math, ForDB, main, EdPayment,oper_sf_new,StrUtils;
{$R *.DFM}

procedure Tf_Payments.FormCreate(Sender: TObject);
begin
  Filter2pays:=TStringList.Create;
  Filter2pays.Clear;
  f_db.LogonMasterSession(oraSes);

  q_Payments.session:=oraSes;
  q_updpayments.session:=oraSes;
  q_cmn.session:=oraSes;
//  q_Payments.Open;
  f_db.SetUserGrants(ActionManager1);

  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
end;

procedure Tf_Payments.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter2pays.Clear;
  except
  end;

  q_Payments.Close;
  Action:=caFree;
end;

procedure Tf_Payments.acPaymentNewExecute(Sender: TObject);
begin
  with TF_EdPayment.Create(Self) do
  begin
    q_Dog.Session:=oraSes;
    q_Dog.Open;
    q_Banks.Session:=oraSes;
    q_Banks.Open;
    q_RS.Session:=oraSes;
    q_RS.Open;
    q_PayForm.Session:=oraSes;
    q_PayForm.Open;
    q_Payment_BIlls.Session:=oraSes;
    q_Payment_Prod.Session:=oraSes;
    q_PayBillSum.Session:=oraSes;
    q_cmn.Session:=oraSes;
    q_Dest.Session:=oraSes;
    q_Dest.Open;

    IsAdd:=true;
    if ShowModal=mrOk then
      with q_UpdPayments do
      begin
        SQL.Clear;
        SQL.Add('BEGIN ');
        SQL.Add('  SELECT Seq_Payments.NEXTVAL INTO :ID FROM dual;');
        SQL.Add('INSERT INTO Payments (ID,DOG_ID,BANK_ID,RS,SUMMA,NAZN_PLAT,OURBANK_ID,NUM_PLAT,DATE_PLAT,DATE_POST,PAYFORM_ID,DEST_ID,RS_ID) VALUES(:ID,');
        SQL.Add(lc_Dog.Value+','+lc_Bank.Value+','''+eRS.text+''','+eSumma.Text+','''+eNazn_Plat.Text+''','+'null'+',');
        SQL.Add(''''+eNum_Plat.Text+''','+'TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Plat.Date)+''',''dd.mm.yyyy''),'+'TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Post.Date)+''',''dd.mm.yyyy''),'+lc_payform.Value+','+lc_dest.Value+','+lc_RSUNP.Value+');');
        SQL.Add('  INSERT INTO PAYMENTS_TO_BILLS (PAYMENTS_ID,NOM_DOK) SELECT :ID,NOM_DOK FROM V_TEMP_PAYMENTS_TO_BILLS;');
        SQL.Add('END;');
        SQL.SaveToFile('c:\tmp\a.txt');
        Execute;
        Session.Commit;
        EdPaymentId:=GetVariable('ID');
        f_db.ReQuery(q_Payments,false);
        q_payments.Locate('ID',EdPaymentId,[]);
      end
    else oraSes.Rollback;
    Free;
  end;
end;

procedure Tf_Payments.acPaymentEditExecute(Sender: TObject);
begin
  with TF_EdPayment.Create(Self) do
  begin
    q_Dog.Session:=oraSes;
    q_Dog.Open;
    q_Banks.Session:=oraSes;
    q_Banks.Open;
    q_rs.Session:=oraSes;
    q_rs.Open;
    q_PayForm.Session:=oraSes;
    q_PayForm.Open;
    q_Payment_BIlls.Session:=oraSes;
    q_Payment_Prod.Session:=oraSes;
    q_PayBillSum.Session:=oraSes;
    q_cmn.Session:=oraSes;
    q_Dest.Session:=oraSes;
    q_Dest.Open;

    IsAdd:=false;
    EdPaymentId:=q_Payments.FieldByName('ID').AsInteger;
    lc_Dog.Value:=q_Payments.FieldByName('DOG_ID').AsString;
    if q_Payments.FieldByName('Summa_placed').AsFloat=0 then
        lc_Dog.Enabled:=True
    else
        lc_Dog.Enabled:=False;
    eNum_plat.Text:=q_Payments.FieldByName('num_plat').AsString;
    eDate_Plat.Date:=q_Payments.FieldByName('date_plat').AsDateTime;
    eDate_Post.Date:=q_Payments.FieldByName('date_post').AsDateTime;
    eNazn_Plat.Text:=q_Payments.FieldByName('nazn_plat').AsString;
    eSumma.Value:=q_Payments.FieldByName('Summa').AsFloat;
    eRS.Text:=q_Payments.FieldByName('RS').AsString;
    lc_Bank.Value:=q_Payments.FieldByName('bank_id').AsString;
    lc_RSUNP.Value:=q_Payments.FieldByName('rs_id').AsString;
    lc_payform.Value:=q_Payments.FieldByName('payform_id').AsString;
    lc_Dest.Value:=q_Payments.FieldByName('dest_id').AsString;
    if ShowModal=mrOk then
      with q_UpdPayments do
        begin
          SQL.Clear;
          SQL.Add('UPDATE payments SET ');
          SQL.Add('num_plat='''+eNum_plat.Text+''',');
          SQL.Add('date_plat=TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Plat.Date)+''',''dd.mm.yyyy''),');
          SQL.Add('date_post=TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Post.Date)+''',''dd.mm.yyyy''),');
          SQL.Add('nazn_plat='''+eNazn_plat.Text+''',');
          SQL.Add('summa='+FloatToStr(eSumma.Value)+',');
          SQL.Add('RS='''+eRS.Text+''',');
          SQL.Add('bank_id='+lc_Bank.Value+',');
          SQL.Add('payform_id='+lc_payform.Value+',');
          SQL.Add('dest_id='+lc_dest.Value+',');
          SQL.Add('rs_id='+lc_RSUNP.Value+' ');
          SQL.Add('WHERE id=:ID');
          SetVariable('ID',EdPaymentId);
          //SQL.SaveToFile('c:\tmp\a.txt');
          Execute;
          Session.Commit;
          f_db.ReQuery(q_Payments,True);
        end
    else oraSes.Rollback;
    Free;
  end;

end;

procedure Tf_Payments.ac_ToDBFExecute(Sender: TObject);
begin
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='OPL';
      ShowModal;
    end;
end;

procedure Tf_Payments.acPaymentCopyExecute(Sender: TObject);
begin
  with TF_EdPayment.Create(Self) do
  begin
    EdPaymentId:=0;
    q_Dog.Session:=oraSes;
    q_Dog.Open;
    q_Banks.Session:=oraSes;
    q_Banks.Open;
    q_rs.Session:=oraSes;
    q_rs.Open;
    q_PayForm.Session:=oraSes;
    q_PayForm.Open;
    q_Payment_BIlls.Session:=oraSes;
    q_Payment_Prod.Session:=oraSes;
    q_PayBillSum.Session:=oraSes;
    q_cmn.Session:=oraSes;
    q_Dest.Session:=oraSes;
    q_Dest.Open;

    lc_Dog.Value:=q_Payments.FieldByName('DOG_ID').AsString;
    lc_Dog.Enabled:=true;
    eNum_plat.Text:='';
    eDate_Plat.Date:=q_Payments.FieldByName('date_plat').AsDateTime;
    eDate_Post.Date:=q_Payments.FieldByName('date_post').AsDateTime;
    eNazn_Plat.Text:=q_Payments.FieldByName('nazn_plat').AsString;
    eSumma.Value:=0;
    eRS.Text:=q_Payments.FieldByName('RS').AsString;
    lc_Bank.Value:=q_Payments.FieldByName('bank_id').AsString;
    lc_RSUNP.Value:=q_Payments.FieldByName('rs_id').AsString;
    lc_payform.Value:=q_Payments.FieldByName('payform_id').AsString;
    lc_dest.Value:=q_Payments.FieldByName('dest_id').AsString;
    IsAdd:=true;
    if ShowModal=mrOk then
      with q_UpdPayments do
        begin
          SQL.Clear;
          SQL.Add('BEGIN ');
          SQL.Add('  SELECT Seq_Payments.NEXTVAL INTO :ID FROM dual;');
          SQL.Add('INSERT INTO Payments (ID,DOG_ID,BANK_ID,RS,SUMMA,NAZN_PLAT,OURBANK_ID,NUM_PLAT,DATE_PLAT,DATE_POST,PAYFORM_ID,DEST_ID,RS_ID) VALUES(:ID,');
          SQL.Add(lc_Dog.Value+','+lc_Bank.Value+','''+eRS.text+''','+eSumma.Text+','''+eNazn_Plat.Text+''','+'null'+',');
          SQL.Add(''''+eNum_Plat.Text+''','+'TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Plat.Date)+''',''dd.mm.yyyy''),'+'TO_DATE('''+FormatDateTime('dd.mm.yyyy',eDate_Post.Date)+''',''dd.mm.yyyy''),'+lc_payform.Value+','+lc_dest.Value+','+lc_RSUNP.Value+');');
          SQL.Add('  INSERT INTO PAYMENTS_TO_BILLS (PAYMENTS_ID,NOM_DOK) SELECT :ID,NOM_DOK FROM V_TEMP_PAYMENTS_TO_BILLS;');
          SQL.Add('END;');
          //SQL.SaveToFile('c:\tmp\a.txt');
          Execute;
          Session.Commit;
          EdPaymentId:=GetVariable('ID');
          f_db.ReQuery(q_Payments,false);
          q_payments.Locate('ID',EdPaymentId,[]);
        end
    else oraSes.Rollback;
    Free;
  end;

end;

procedure Tf_Payments.grid_paysGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_Payments.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_Payments.acPaymentDeleteExecute(Sender: TObject);
var
  I:Integer;
begin

if (grid_pays.SelectedRows.Count>0) then
  if MessageDlg('Вы действительно хотите удалить платеж?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
  Begin
    for i:=0 to grid_pays.SelectedRows.Count-1 do
      begin
        q_Payments.GotoBookmark(pointer(grid_pays.SelectedRows.Items[i]));
        with q_UpdPayments do
          begin
            SQL.Clear;
            SQL.Add('DELETE FROM payments ');
            SQL.Add('WHERE id=:ID');
            SetVariable('ID',q_Payments.FieldByName('id').AsString);
            Execute;
            Session.Commit;
          end;
      end;
    q_Payments.Prior;
    f_db.ReQuery(q_Payments,true);
  end;
end;

procedure Tf_Payments.FormShow(Sender: TObject);
var i:integer;
begin
  e_BeginDate.Date:=StartOfTheMonth(Now);
  e_EndDate.Date:=EndOfTheMonth(Now);
  q_Payments.Open;
  if filter2pays.Count=0 then
  for i:=1 to q_Payments.FieldCount do
  Begin
    Filter2pays.Add('');
  end;
  if not f_db.CheckGrant('acPayments') then
  Begin
    ShowMessage('Вы не имеете права на просмотр платежей!');
    Close;
  end;
end;

procedure Tf_Payments.acPrintExecute(Sender: TObject);
begin
  with PrintDBGridEh1 do
    begin
      Title.Clear;
      Title.Add('Платежи');
      Title.Add('c '+FormatDateTime('dd.mm.yyyy',e_BeginDate.Date)+'г.');
      Title.Add('по '+FormatDateTime('dd.mm.yyyy',e_EndDate.Date)+'г.');
      Preview;
    end;
end;

procedure Tf_Payments.grid_paysSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_Payments,q_Payments.SQL.Count-1,grid_pays);
end;

procedure Tf_Payments.acPaymentSaveToXlsExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_pays,SaveDialog1.FileName,True)
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_pays,SaveDialog1.FileName,True);
end;

procedure Tf_Payments.acPaymentPayedBillsExecute(Sender: TObject);
begin
  inherited;
  if not q_Payments.eof then
  Begin
    oper_sf_new.gLinkMode:=1;
    oper_sf_new.gLinkFilter:='(v_sf.dog_id='+IntToStr(Round(q_PaymentsDOG_ID.Value))+' AND v_sf.nom_dok in (SELECT nom_dok FROM payments_on_bills WHERE payments_id='+IntToStr(Round(q_PaymentsID.Value))+'))';
    oper_sf_new.gSFPlatID:=Round(q_PaymentsPLAT_ID.Value);
    with Tf_Oper_SF.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;
//  f_db.ReQuery(q_Payments,true);
end;

procedure Tf_Payments.acPaymentPlaceExecute(Sender: TObject);
var
  S:String;
  NewS: string;
  ClickedOK: Boolean;
  vDateRealiz: TDateTime;
begin
{  NewS := FormatDateTime('dd.mm.yyyy',date);
  repeat
    ClickedOK := InputQuery('Внимание', 'Дата реализации:', NewS);
    if ClickedOK then
    try
      vDateRealiz:=StrToDate(NewS);
    except
      vDateRealiz:=0;
    end
    else exit;
  until vDateRealiz<>0;}

  // Проверка
  with q_CheckPlat do
  Begin
    Close;
    SetVariable('DOG_ID',q_PaymentsDOG_ID.Value);
    SetVariable('DATE_POST',q_PaymentsDATE_POST.Value);
    Open;
    if not IsEmpty then
    Begin
      application.MessageBox(PChar('Остался не разнесенным платеж № '+
        FieldByName('NUM_PLAT').AsString+' от '+
        FormatDateTime('dd.mm.yyyy',FieldByName('DATE_PLAT').AsDateTime)+' !'),'Внимание!',mb_ok);
      exit;
    end;
  end;

  repeat
{    if DateOf(vDateRealiz)<DateOf(q_paymentsDATE_POST.AsDateTime) then
    Begin
      application.MessageBox(PChar('Дата реализации ранее даны поступления платежа! Платеж '+q_Payments.FieldByName('NUM_PLAT').AsString+' от '+ FormatDateTime('dd.mm.yyyy',q_Payments.FieldByName('DATE_PLAT').AsDateTime)+' не будет разнесен.'),'Внимание!',mb_ok);
      s:='ERROR';
    end
    else
    Begin}
      s:=oraFOR_BILLS.CallStringFunction('Place_Payments_on_Bills',[q_PaymentsDOG_ID.Value,0,q_PaymentsID.Value,Now{FormatDateTime('dd.mm.yyyy',vDateRealiz)}]);
      s:=LeftStr(s,2);
{    end}
  until s<>'OK';
  f_db.ReQuery(q_Payments,true);
end;

procedure Tf_Payments.acPaymentsPlaceExecute(Sender: TObject);
var
  S:String;
  NewS: string;
  ClickedOK: Boolean;
  vDateRealiz: TDateTime;
begin
{  NewS := FormatDateTime('dd.mm.yyyy',date);
  repeat
    ClickedOK := InputQuery('Внимание', 'Дата реализации:', NewS);
    if ClickedOK then
    try
      vDateRealiz:=StrToDate(NewS);
    except
      vDateRealiz:=0;
    end
    else exit;
  until vDateRealiz<>0;}
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('SELECT dog_id,id,dog_number,MAX(DATE_POST)as DATE_POST FROM V_PAYMENTS_UNUSED WHERE summa<>0 GROUP BY dog_id,id,dog_number ORDER BY dog_id,id,dog_number');
  q_cmn.Execute;
  while not q_cmn.Eof do
    begin
      repeat
{        if DateOf(vDateRealiz)<DateOf(q_cmn.FieldAsDate('DATE_POST')) then
        Begin
          application.MessageBox(PChar('Дата реализации ранее даты поступления последнего нераспределенного платежа по договору '+q_cmn.FieldAsString('DOG_NUMBER')+' ! Платежи за эту дату необходимо разносить поодиночке!'),'Внимание!',mb_ok);
          s:='ERROR';
        end
        else
        Begin}
          s:=oraFOR_BILLS.CallStringFunction('Place_Payments_on_Bills',[q_cmn.FieldAsInteger('DOG_ID'),0,q_cmn.FieldAsInteger('ID'),FormatDateTime('dd.mm.yyyy',vDateRealiz)]);
          s:=LeftStr(s,2);
//        end;
      until s<>'OK';
      q_cmn.Next;
    end;
  q_cmn.Close;
  f_db.ReQuery(q_Payments,true);
end;

procedure Tf_Payments.q_PaymentsBeforeOpen(DataSet: TDataSet);
var s:string;
begin
  inherited;
  s:='';
  If ViewLinkMode=1 Then
  Begin
    e_BeginDate.Date:=EncodeDateDay(2005,1);
    If ViewLinkFilter<>'' Then
    begin
        s:=s+' AND '+ViewLinkFilter;
    end;
  end
  else
  begin
    if cb_ToRealiz.Checked then  s:=s+' AND SUMMA>NVL(SUMMA_PLACED,0) ';
  end;
  q_Payments.SQL[3]:=s;
  q_Payments.SetVariable('BEG_DATE',DateOf(e_BeginDate.Date));
  q_Payments.SetVariable('END_DATE',DateOf(e_EndDate.Date));
end;

procedure Tf_Payments.TBEditItem2AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterAcceptText(grid_pays,filter2pays,NewText,Accept);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_Payments.TBItem49Click(Sender: TObject);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterCurrentValue(grid_pays,filter2pays);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_Payments.TBItem50Click(Sender: TObject);
begin
  inherited;
  //IsRefresh:=true;
  f_db.FilterCLear(grid_pays,filter2pays);
  //IsRefresh:=false;
  //q_PaymentsAfterScroll(q_Payments);
end;

procedure Tf_Payments.q_PaymentsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(grid_pays,filter2pays);
end;

procedure Tf_Payments.acPaymentUnPlaceExecute(Sender: TObject);
var
  I:Integer;
begin

if (grid_pays.SelectedRows.Count>0) then
  if MessageDlg('Вы действительно хотите снять разнесение с выделенных платежей?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
  Begin
    for i:=0 to grid_pays.SelectedRows.Count-1 do
      begin
        q_Payments.GotoBookmark(pointer(grid_pays.SelectedRows.Items[i]));
        with q_UpdPayments do
          begin
            SQL.Clear;
            SQL.Add('DELETE FROM payments_on_bills ');
            SQL.Add('WHERE payments_id=:ID');
            SetVariable('ID',q_Payments.FieldByName('id').AsString);
            Execute;
            Session.Commit;
          end;
      end;
    q_Payments.Prior;
    f_db.ReQuery(q_Payments,true);
  end;
end;

procedure Tf_Payments.acPaymentUnPlacePeriodExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Вы действительно хотите снять разнесение с платежей за период '+
    FormatDateTime('dd.mm.yyyy',e_BeginDate.Date)+'-'+FormatDateTime('dd.mm.yyyy',e_EndDate.Date)+'?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
    begin
      oraFOR_BILLS.CallStringFunction('Del_Payments_from_Bill_Period',[FormatDateTime('dd.mm.yyyy',e_BeginDate.Date),FormatDateTime('dd.mm.yyyy',e_EndDate.Date)]);
    end;
end;

procedure Tf_Payments.acPaymentAllBillsExecute(Sender: TObject);
begin
  inherited;
  if not q_Payments.eof then
  Begin
    oper_sf_new.gLinkMode:=1;
    oper_sf_new.gLinkFilter:='(v_sf.dog_id='+IntToStr(Round(q_PaymentsDOG_ID.Value))+')';
    oper_sf_new.gSFPlatID:=Round(q_PaymentsPLAT_ID.Value);
    with Tf_Oper_SF.Create(Self) do
      begin
        FormStyle:=fsMDIChild;
      end;
  end;    
end;

procedure Tf_Payments.tbCallOutWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(grid_pays);
end;

procedure Tf_Payments.acPaymentFilterExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_Payments,false);
end;

end.

