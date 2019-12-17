Unit payord;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, ActnList,
  XPStyleActnCtrls, ActnMan, StdCtrls, Buttons, ToolEdit, Mask, StrUtils, DateUtils, ADODB,
  OleServer, ExcelXP, ComObj, PropStorageEh, OracleNavigator, RxLookup,
  PropFilerEh, GridsEh;

Type
  TfrmPayOrd = Class(TForm)
    oraParus: TOracleSession;
    oraPayOrder: TOracleDataSet;
    oraAgnFaceAcc: TOracleDataSet;
    oraPayOrderNFACEACC_RN: TFloatField;
    oraPayOrderSNUMB: TStringField;
    oraPayOrderDDATE: TDateTimeField;
    oraPayOrderNSUMM: TFloatField;
    oraPayOrderNSUMM_EX: TFloatField;
    oraPayOrderNSTATUS: TIntegerField;
    oraPayOrderFaceAcc: TStringField;
    dsPayorder: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    edPath: TDirectoryEdit;
    rbClose: TRadioButton;
    rbAll: TRadioButton;
    ActionManager1: TActionManager;
    acFilter: TAction;
    oraPay_OUT: TOracleDataSet;
    BitBtn2: TBitBtn;
    acUnload: TAction;
    adoCordIns: TADOQuery;
    adoConn: TADOConnection;
    pay_upd: TOracleQuery;
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    OracleNavigator1: TOracleNavigator;
    BitBtn3: TBitBtn;
    acLoad: TAction;
    adoPay: TADODataSet;
    pay_execute: TOracleQuery;
    oraPayOrderSPBE: TStringField;
    mLog: TMemo;
    Splitter1: TSplitter;
    acXLS: TAction;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    rxcbPBE: TComboBox;
    DBGridEh1: TDBGridEh;
    lcAF: TRxDBLookupCombo;
    Label5: TLabel;
    oraAF_Filter: TOracleDataSet;
    dsAF_Filter: TDataSource;
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acFilterExecute(Sender: TObject);
    Procedure acUnloadExecute(Sender: TObject);
    Function DateToStr(d1: TDateTime): String;
    Procedure oraPayOrderBeforePost(DataSet: TDataSet);
    Procedure oraPayOrderBeforeDelete(DataSet: TDataSet);
    Procedure acLoadExecute(Sender: TObject);
    Procedure oraPayOrderAfterInsert(DataSet: TDataSet);
    Procedure xlDrawCell(r1, c1, r2, c2: integer; text: String; border: boolean; fsize: integer);
    Procedure acXLSExecute(Sender: TObject);
    Procedure oraPayOrderBeforeInsert(DataSet: TDataSet);
    Procedure rxcbPBEExit(Sender: TObject);
  private
    { Private declarations }
  public
    excel: variant;
    { Public declarations }
  End;

Var
  frmPayOrd                             : TfrmPayOrd;

Implementation

Uses MAIN;

{$R *.dfm}

Function TfrmPayOrd.DateToStr(d1: TDateTime): String;
Var
  st, st2                               : String;
Begin
  If d1 <> 0 Then
    Begin
      st := IntToStr(monthof(d1));
      If length(trim(st)) = 1 Then
        st := '0' + trim(st)
      Else
        st := trim(st);
      st2 := st;
      st := IntToStr(Dayof(d1));
      If length(trim(st)) = 1 Then
        st := '0' + trim(st)
      Else
        st := trim(st);
      st2 := st2 + '/' + st;
      st2 := st2 + '/' + rightStr(trim(inttostr(yearOf(d1))), 2);
      DateToStr := st2;
    End
  Else
    DateToStr := ' / / '
End;

Procedure TfrmPayOrd.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.LogOn;
  oraAgnFaceAcc.Open;
  oraAF_Filter.Open;
  oraPayOrder.Open;
End;

Procedure TfrmPayOrd.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraParus.LogOff;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP PayOrders Igma';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmPayOrd.acFilterExecute(Sender: TObject);
Begin
  If oraPayOrder.Active Then
    oraPayOrder.Close;
  oraPayOrder.SQL[2] := 'and rui_payorder.ddate between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPayOrder.SQL[3] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbClose.Checked Then
    oraPayOrder.SQL[4] := 'and rui_payorder.nstatus=1'
  Else
    oraPayOrder.SQL[4] := '';
  If lcAF.Value <> '0' Then
    oraPayOrder.SQL[5] := 'and rui_payorder.NFACEACC_RN=' + lcAF.value
  Else
    oraPayOrder.SQL[5] := '';

  If rxcbPBE.Text <> '' Then
    oraPayOrder.SQL[6] := 'and rui_payorder.SPBE=''' + rxcbPBE.Text + ''''
  Else
    oraPayOrder.SQL[6] := '';

  oraPayOrder.Open;
  If edPath.Text <> '' Then
    Begin
      If adoConn.Connected Then
        adoConn.Connected := false;
      adoConn.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoConn.Connected := true;
    End;
End;

Procedure TfrmPayOrd.acUnloadExecute(Sender: TObject);
Var
  Src, Dst                              : String[255];
Begin
  If edPath.Text <> '' Then
    Begin
      If adoConn.Connected Then
        adoConn.Connected := false;
      adoConn.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoConn.Connected := true;

      If oraPay_OUT.Active Then
        oraPay_OUT.Close;
      oraPay_OUT.SQL[2] := 'and rui_payorder.ddate between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
      oraPay_OUT.SQL[3] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
      oraPay_OUT.SQL[4] := 'and rui_payorder.nstate=0';
      oraPay_OUT.SQL[6] := 'and rui_payorder.SPBE=''' + rxcbPBE.Text + '''';
      //			oraPay_OUT.SQL[5] := 'and rui_payorder.NFACEACC_RN='+lcAF.Value;
      oraPay_OUT.Open;

      Src := edPath.Text + '\p.dbf' + #0;
      Dst := edPath.Text + '\payord.dbf' + #0;
      CopyFile(@Src[1], @Dst[1], False);
      While Not oraPay_OUT.Eof Do
        Begin
          adoCordIns.SQL.Clear;
          adoCordIns.SQL.Add('insert into payord (NRN,ddate,snumb,nsum,nsum_ex,faceacc,nstatus)');
          adoCordIns.SQL.Add('values (');
          adoCordIns.SQL.Add(IntToStr(oraPay_OUT.fieldbyname('nrn').asInteger) + ',');
          adoCordIns.SQL.Add('ctod("' + DateToStr(oraPay_OUT.fieldbyname('ddate').AsDateTime) + '"),');
          adoCordIns.SQL.Add('"' + oraPay_OUT.fieldbyname('snumb').AsString + '",');
          adoCordIns.SQL.Add(oraPay_OUT.fieldbyname('nsumm').AsString + ',');
          adoCordIns.SQL.Add(oraPay_OUT.fieldbyname('nsumm_ex').AsString + ',');
          adoCordIns.SQL.Add(oraPay_OUT.fieldbyname('nfaceacc_rn').AsString + ',');
          adoCordIns.SQL.Add(oraPay_OUT.fieldbyname('nstatus').AsString + ')');
          //adoCordIns.SQL.SaveToFile('d:\11.txt');
          adoCordIns.ExecSQL;
          pay_upd.ClearVariables;
          pay_upd.SetVariable(':nRn1', oraPay_OUT.fieldbyname('nrn').asInteger);
          pay_upd.Execute;
          mlog.Lines.Add('Выгружена запись ' + trim(oraPay_OUT.fieldbyname('snumb').AsString) + ' от ' + datetostr(oraPay_OUT.fieldbyname('ddate').AsDateTime));
          oraPay_OUT.Next;
        End;
      oraPay_OUT.Session.Commit;
    End;
End;

Procedure TfrmPayOrd.oraPayOrderBeforePost(DataSet: TDataSet);
Begin
  If MessageDlg('Сохранить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    {   oraPayOrder.Post;
    else}
    oraPayOrder.Cancel
  Else
    mlog.Lines.Add('Сохранена запись ' + trim(oraPayOrder.fieldbyname('snumb').AsString) + ' от ' + sysutils.datetostr(oraPayOrder.fieldbyname('ddate').AsDateTime));
End;

Procedure TfrmPayOrd.oraPayOrderBeforeDelete(DataSet: TDataSet);
Begin
  If MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    oraPayOrder.Cancel
  Else
    mlog.Lines.Add('Удалена запись ' + trim(oraPayOrder.fieldbyname('snumb').AsString) + ' от ' + datetostr(oraPayOrder.fieldbyname('ddate').AsDateTime));
End;

Procedure TfrmPayOrd.acLoadExecute(Sender: TObject);
Begin
  adoPay.CommandText := 'select * from pay';
  adoPay.Open;
  adopay.First;
  While Not adoPay.Eof Do
    Begin
      pay_execute.ClearVariables;
      pay_execute.SetVariable(':nrn1', adopay.fieldbyname('nrn').AsInteger);
      pay_execute.SetVariable(':ex', adopay.fieldbyname('nsum_ex').AsFloat);
      pay_execute.Execute;
      mlog.Lines.Add('Обновлена запись ' + trim(adoPay.fieldbyname('snumb').AsString) + ' от ' + datetostr(adoPay.fieldbyname('ddate').AsDateTime));
      adoPay.Next;
    End;
End;

Procedure TfrmPayOrd.oraPayOrderAfterInsert(DataSet: TDataSet);
Begin
  oraPayOrder.FieldByName('SPBE').AsString := rxcbPBE.Text;
End;

Procedure TfrmPayOrd.xlDrawCell(r1, c1, r2, c2: integer; text: String; border: boolean; fsize: integer);
//r1 row1;c1 column1;r2 row2;c2 column2;text text; border
Var
  sheet                                 : variant;
  str1, str2                            : String;
Begin
  sheet := excel.workbooks[1].sheets[1];

  str1 := chr(ord('a') + c1 - 1) + IntToStr(r1);
  str2 := Chr(ord('a') + c2 - 1) + IntToStr(r2);

  sheet.range[str1, str2].merge;
  sheet.range[str1, str2] := text;
  sheet.range[str1, str2].HorizontalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].VerticalAlignment := $FFFFEFF4;
  sheet.range[str1, str2].WrapText := true;
  sheet.range[str1, str2].font.size := fsize;

  If border = true Then
    Begin
      //правая граница
      sheet.range[str1, str2].Borders[$FFFFEFC8].linestyle := 1;
      sheet.range[str1, str2].Borders[$FFFFEFC8].Weight := 2;
      sheet.range[str1, str2].Borders[$FFFFEFC8].colorindex := $FFFFEFF7;
      //левая
      sheet.range[str1, str2].Borders[$FFFFEFDD].linestyle := 1;
      sheet.range[str1, str2].Borders[$FFFFEFDD].Weight := 2;
      sheet.range[str1, str2].Borders[$FFFFEFDD].colorindex := $FFFFEFF7;
      //верхняя
      sheet.range[str1, str2].Borders[$FFFFEFC0].linestyle := 1;
      sheet.range[str1, str2].Borders[$FFFFEFC0].Weight := 2;
      sheet.range[str1, str2].Borders[$FFFFEFC0].colorindex := $FFFFEFF7;
      //нижняя
      sheet.range[str1, str2].Borders[$FFFFEFF5].linestyle := 1;
      sheet.range[str1, str2].Borders[$FFFFEFF5].Weight := 2;
      sheet.range[str1, str2].Borders[$FFFFEFF5].colorindex := $FFFFEFF7;
    End;

End;

Procedure TfrmPayOrd.acXLSExecute(Sender: TObject);
Var
  i, k                                  : integer;
  sheet                                 : variant;
Begin
  Inherited;
  //SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,'c:\temp\Svod.xls',True);
  //ShowMessage('Сформирован файл c:\temp\Svod.xls');
  excel := CreateOleObject('excel.application.8');
  excel.workBooks.add;
  sheet := excel.workBooks[1].sheets[1];
  //сохраняем в Excel
  //заголовок таблицы
  sheet.Columns['A'].ColumnWidth := 6;
  sheet.Columns['b'].ColumnWidth := 9;
  sheet.Columns['c'].ColumnWidth := 10;
  sheet.Columns['d'].ColumnWidth := 27;
  sheet.Columns['e'].ColumnWidth := 13;
  sheet.Columns['f'].ColumnWidth := 20;
  sheet.Columns['g'].ColumnWidth := 23;
  sheet.Columns['h'].ColumnWidth := 6;
  sheet.Columns['i'].ColumnWidth := 21;
  sheet.Columns['j'].ColumnWidth := 27;
  sheet.Columns['k'].ColumnWidth := 27;
  sheet.Columns['l'].ColumnWidth := 13;
  sheet.Columns['m'].ColumnWidth := 50;

  //создаем заголовок
  xlDrawCell(1, 1, 1, 13, 'Телефонограмма', False, 12);
  xlDrawCell(2, 3, 2, 3, 'За период', False, 10);
  //  xlDrawCell(2, 4, 2, 4, 'с '+FormatDateTime('dd.mm.yyyy',edDateFrom.Date)+' по '+FormatDateTime('dd.mm.yyyy',edDateTo.Date), False,10);
  xlDrawCell(2, 5, 2, 6, 'на ' + DateTimeToStr(now()), False, 10);

  xlDrawCell(4, 1, 4, 1, 'Утверждено', true, 8);
  xlDrawCell(4, 2, 4, 2, '№ рег-ии заявки', true, 8);
  xlDrawCell(4, 3, 4, 3, 'Дата рег-ии заявки', true, 8);
  xlDrawCell(4, 4, 4, 4, 'Платильщик по договору', true, 8);
  xlDrawCell(4, 5, 4, 5, '№ договора', true, 8);
  xlDrawCell(4, 6, 4, 6, 'Условия оплаты', true, 8);
  xlDrawCell(4, 7, 4, 7, 'Наименование продукта', true, 8);
  xlDrawCell(4, 8, 4, 8, 'Кол. Тн.', true, 8);
  xlDrawCell(4, 9, 4, 9, 'Станция дороги назначения', true, 8);
  xlDrawCell(4, 10, 4, 10, 'Грузополучатель', true, 8);
  xlDrawCell(4, 11, 4, 11, 'Потребитель', true, 8);
  xlDrawCell(4, 12, 4, 12, 'Заявленная цена покупателем', true, 8);
  xlDrawCell(4, 13, 4, 13, 'Примечание', true, 8);
  //заполняем таблицу
  i := 5;
  k := 5;
  { with oraMonth_all do begin
   First;
   while not eof do
   begin
          if oraMonth_allIS_WORK.Value=0 then xlDrawCell(i,1,i,1,'Нет',true,8) else xlDrawCell(i,1,i,1,'Да',true,8);
          xlDrawCell(i,2,i,2,oraMonth_allINPUT_NUMBER.AsString,true,8);
          xlDrawCell(i,3,i,3,oraMonth_allINPUT_DATE.AsString,true,8);
          xlDrawCell(i,4,i,4,oraMonth_allPlat.AsString,true,8);
          xlDrawCell(i,5,i,5,oraMonth_allDog.AsString,true,8);
          xlDrawCell(i,6,i,6,oraMonth_allUslOpl.AsString,true,8);
          xlDrawCell(i,7,i,7,oraMonth_allprod.AsString,true,8);
          xlDrawCell(i,8,i,8,oraMonth_allREQUEST.AsString,true,8);
          xlDrawCell(i,9,i,9,oraMonth_allStan.AsString,true,8);
          if oraMonth_allpoluch.AsString='' then xlDrawCell(i,10,i,10,oraMonth_allPOLUCH_NAME.AsString,true,8) else xlDrawCell(i,10,i,10,oraMonth_allpoluch.AsString,true,8);
          if oraMonth_allpotreb.AsString='' then xlDrawCell(i,11,i,11,oraMonth_allpotreb_name.AsString,true,8) else xlDrawCell(i,11,i,11,oraMonth_allpotreb.AsString,true,8);
          xlDrawCell(i,12,i,12,oraMonth_allPRICE.AsString,true,8);
          xlDrawCell(i,13,i,13,oraMonth_allPRICH.AsString,true,8);
          next;
          i:=i+1;
     end;
   end; }
  xlDrawCell(i, 1, i, 1, '', true, 8);
  xlDrawCell(i, 2, i, 2, '', true, 8);
  xlDrawCell(i, 3, i, 3, '', true, 8);
  xlDrawCell(i, 4, i, 4, '', true, 8);
  xlDrawCell(i, 5, i, 5, '', true, 8);
  xlDrawCell(i, 6, i, 6, '', true, 8);
  xlDrawCell(i, 7, i, 7, '', true, 8);
  xlDrawCell(i, 8, i, 8, '=SUM(R[-' + Trim(inttoStr(i - k)) + ']C[0]:R[-1]C[0])', true, 8);
  xlDrawCell(i, 9, i, 9, '', true, 8);
  xlDrawCell(i, 10, i, 10, '', true, 8);
  xlDrawCell(i, 11, i, 11, '', true, 8);
  xlDrawCell(i, 12, i, 12, '', true, 8);
  xlDrawCell(i, 13, i, 13, '', true, 8);

  excel.workbooks[1].sheets[1].name := 'sheet1';
  excel.visible := true;
  excel := null;
End;

Procedure TfrmPayOrd.oraPayOrderBeforeInsert(DataSet: TDataSet);
Begin
  If rxcbPBE.Text = '' Then
    Begin
      showmessage('Не выбрано ПБЕ!');
      exit;
    End;
End;

Procedure TfrmPayOrd.rxcbPBEExit(Sender: TObject);
Begin
  oraAgnFaceAcc.Close;
  oraAgnFaceAcc.SQL[7] := 'AND fa.cRN IN (SELECT rn FROM acatalog c CONNECT BY PRIOR rn=crn START WITH trim(c.NAME)=''' + trim(rxcbPBE.Text) + ''')';
  oraAgnFaceAcc.Open;
End;

End.

