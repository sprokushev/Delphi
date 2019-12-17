Unit ttn17load;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList,MemTableDataEh, DataDriverEh,
  MemTableEh,EhlibDOA, GridsEh;

Type
  TfrmTTN17 = Class(TForm)
    oraMain: TOracleSession;
    Panel1: TPanel;
    Panel2: TPanel;
    ActionManager1: TActionManager;
    acFilter: TAction;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    OraQuery: TOracleQuery;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    oraQ: TOracleQuery;
    oraTTN17_new: TOracleDataSet;
    dsTTN17_new: TDataSource;
    dbgTTN17_new: TDBGridEh;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    mLog: TMemo;
    qLinkIn: TOracleQuery;
    qLink: TOracleQuery;
    qLinkOut: TOracleQuery;
    qInS: TOracleQuery;
    oraTTN17_newSVED_NUM: TIntegerField;
    oraTTN17_newNUM_CIST: TStringField;
    oraTTN17_newCAT_CEN_ID: TIntegerField;
    oraTTN17_newDATE_CEN: TDateTimeField;
    oraTTN17_newNUM_KVIT: TFloatField;
    oraTTN17_newDATE_KVIT: TDateTimeField;
    oraTTN17_newSACCDOC: TStringField;
    oraTTN17_newSACCNUMB: TStringField;
    oraTTN17_newDACCDATE: TDateTimeField;
    oraTTN17_newSFACEACC: TStringField;
    oraTTN17_newSAGENT: TStringField;
    oraTTN17_newSTARIF: TStringField;
    oraTTN17_newSSHIPVIEW: TStringField;
    oraTTN17_newSPAY_TYPE: TStringField;
    oraTTN17_newVES: TFloatField;
    oraTTN17_newNPRICE: TFloatField;
    oraTTN17_newPROC_INSURE: TFloatField;
    oraTTN17_newGOSPROG_ID: TIntegerField;
    oraTTN17_newSUM_PROD: TFloatField;
    oraTTN17_newUSL_SUM: TFloatField;
    oraTTN17_newFLG_DOP_CIST: TIntegerField;
    oraTTN17_newNDS_PROD: TFloatField;
    oraTTN17_newVOZNAGR: TFloatField;
    oraTTN17_newSUM_INSURE: TFloatField;
    oraTTN17_newTARIF: TFloatField;
    oraTTN17_newTARIF_NDS: TFloatField;
    oraTTN17_newSRECIPNUMB: TStringField;
    oraTTN17_newSAGNFIFO: TStringField;
    oraTTN17_newDRPTDATE: TDateTimeField;
    oraTTN17_newSACC_AGENT: TStringField;
    oraTTN17_newSSUBDIV: TStringField;
    oraTTN17_newSJUR_PERS: TStringField;
    oraTTN17_newID: TIntegerField;
    oraTTN17_newSTAN_NAME: TStringField;
    oraTTN17_newMODIF: TStringField;
    oraTTN17_newMOD_MODIF: TStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    deBeg: TDateEdit;
    Label3: TLabel;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    dsCat: TDataSource;
    mteCatalog: TMemTableEh;
    dsdCatalog: TDataSetDriverEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    rbGD: TRadioButton;
    rbProd: TRadioButton;
    oraTTN17_newTARIF_GUARD: TFloatField;
    oraTTN17_newTARIF_GUARD_NDS: TFloatField;
    oraTTN17_newVALID_DOCNUMB: TStringField;
    oraTTN17_newNOM_ZD: TStringField;
    oraTTN17_newVAGOWN_TYP_ID: TFloatField;
    oraTTN17_newDOGID: TIntegerField;
    oraTTN17_newPRICE_NACEN1: TFloatField;
    oraTTN17_newPRICE_NACEN2: TFloatField;
    oraTTN17_newSUM_NACEN1: TFloatField;
    oraTTN17_newSUM_NACEN2: TFloatField;
    oraTTN17_newTAXGR_CODE: TStringField;
    oraTTN17_newTAXGR_CODE_NEW: TStringField;
    oraTTN17_newNO_AKCIZ: TIntegerField;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure LoadParusProd;
    Procedure LoadParusGD;
    Procedure dbgTTN17_newGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmTTN17                              : TfrmTTN17;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTN17.acFilterExecute(Sender: TObject);
Begin
  oraTTN17_new.Close;
  if rbGD.Checked then
    begin
     oraTTN17_new.SQL[36] := 'and k.tarif > 0 and not exists (select kvit_id from parus_fin where k.id = parus_fin.kvit_id and task = ''GoodsTransInvoicesToConsumers'' and subtask=2)';
//     oraTTN17_new.SQL[37] := 'and exists (select kvit_id from parus_fin where k.id = parus_fin.kvit_id and task = ''IncomingOrders'' and subtask=2)';
//     oraTTN17_new.SQL[39] :=' ';
    end;
  if rbProd.Checked then
    begin
     oraTTN17_new.SQL[36] := 'and not exists (select kvit_id from parus_fin where k.id = parus_fin.kvit_id and task = ''GoodsTransInvoicesToConsumers'' and subtask=1)';
//     oraTTN17_new.SQL[39] := 'and exists (select kvit_id from parus_fin where m.nom_zd = parus_fin.month_id and task = ''ConsumersOrders'')';
     oraTTN17_new.SQL[37] := 'and exists (select kvit_id from parus_fin where k.id = parus_fin.kvit_id and task = ''IncomingOrders'' and subtask=1) and exists (select kvit_id from parus_fin where k.id = parus_fin.kvit_id and task = ''IncomingOrders'' and subtask=4)';
    end;
  oraTTN17_new.SQL[38] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraTTN17_new.SQL[39] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
//  oraTTN17_new.SQL.SaveToFile('d:\1.txt');
  oraTTN17_new.Open;
End;

Procedure TfrmTTN17.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 1;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraTTN17_new.SQL[38] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraTTN17_new.SQL[39] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmTTN17.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  //oraTTN17.Close;
  oraTTN17_new.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Recipients.EMailAddresses := 'JRomanov@KomiTu.lukoil.com';
      Subject := 'GoodsTransInvoicesToConsumers ' + oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Body := mLog.Lines;
    End;
  If mLog.Lines.Count > 1 Then
    With frmMain.IdSMTP Do
      Begin
        Try
          Connect;
          Send(frmMain.IdMessage);
          Disconnect;
        Except On E: Exception Do
            Begin
              If connected Then
                Try
                  disconnect;
                Except
                End;
              ShowMessage(E.Message);
            End;
        End;
      End;
  action := caFree;
End;

Procedure TfrmTTN17.acLoadExecute(Sender: TObject);
Begin
  if rbGD.Checked then  LoadParusGD;
  if rbProd.Checked then  LoadParusProd;
End;

Procedure TfrmTTN17.LoadParusProd;
Var
  summ, rn_stan, rn_parti               : String;
  st1, st2, rn_crn                      : String;
  rn_sved, rn_akt                       : String;
  ok                                    : boolean;
  rn_strax                              : String;
  ss                                    : ^TOracleDataSet;
  rn_lin,rn_lout,rn_l                   : string;
Begin
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  ss := @oraTTN17_new;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      mlog.Lines.Add('Закачка в Парус сведение №' + ss^.fieldbyname('sved_num').AsString + ' №' + ss^.fieldbyname('num_cist').AsString);
      ok := false;
      // Партия
      summ := trim(ss^.fieldbyname('cat_cen_id').asString) + '_';
      st1 := trim(inttostr(dayof(ss^.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then
        st1 := '0' + st1;
      summ := summ + st1;
      st1 := trim(inttostr(monthof(ss^.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then
        st1 := '0' + st1;
      summ := summ + st1;
      st1 := rightstr(inttostr(YearOf(ss^.fieldbyname('date_cen').asdatetime)), 2);
      summ := summ + st1;
      rn_parti := summ;
      ok := true;
      If ok Then
        Begin
          oraInvIns.ClearVariables;
          oraInvIns.SetVariable(':nCOMPANY', 2);
          oraInvIns.SetVariable(':nCRN', rn_crn);
          oraInvIns.SetVariable(':sJUR_PERS', trim(ss^.fieldbyname('sjur_pers').asString));
          oraInvIns.SetVariable(':sDOCTYPE', 'СВЕД');
          oraInvIns.SetVariable(':sPREF', rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)), 2) + 'т-' + trim(ss^.fieldbyname('Sved_num').asString));
          oraInvIns.SetVariable(':sNUMB', trim(ss^.fieldbyname('num_cist').asString));
          oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':dSALEDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':sACCDOC', trim(ss^.fieldbyname('saccdoc').asString));
          oraInvIns.SetVariable(':sACCNUMB', trim(ss^.fieldbyname('valid_docnumb').asString));
          oraInvIns.SetVariable(':dACCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('daccdate').asDateTime));
          if  copy(trim(ss^.fieldbyname('saccdoc').asString),5,2)='03' then oraInvIns.SetVariable(':sSTOPER', 'РЕАЛ_ТРАНЗИТ_СТ')
          else oraInvIns.SetVariable(':sSTOPER', 'РЕАЛ_ТРАНЗИТ');
          oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
          oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
          oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
          oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
          oraInvIns.SetVariable(':sSTORE', 'УХТА_ЦА');
          oraInvIns.SetVariable(':sMOL', 'ЦЕНТР');
          oraInvIns.SetVariable(':sSHEEPVIEW', trim(ss^.fieldbyname('sshipview').asString));
          oraInvIns.SetVariable(':sPAYTYPE', trim(ss^.fieldbyname('spay_type').asString));
          oraInvIns.SetVariable(':nDISCOUNT', 0);
          oraInvIns.SetVariable(':sCURRENCY', 'Руб.');
          oraInvIns.SetVariable(':nCURCOURS', 1);
          oraInvIns.SetVariable(':nCURBASE', 1);
          oraInvIns.SetVariable(':nFA_COURS', 1);
          oraInvIns.SetVariable(':nFA_BASECOURS', 1);
          summ := floattostr(ss^.fieldbyname('sum_prod').asFloat-ss^.fieldbyname('nds_prod').asFloat + ss^.fieldbyname('sum_insure').asFloat);
//          summ:='0';
          oraInvIns.SetVariable(':nSUMM', summ);
          summ := floattostr(ss^.fieldbyname('sum_prod').asFloat + ss^.fieldbyname('nds_prod').asFloat + ss^.fieldbyname('sum_insure').asFloat );
          oraInvIns.SetVariable(':nSUMMWITHNDS', summ);
          oraInvIns.SetVariable(':sRECIPNUMB', trim(ss^.fieldbyname('srecipnumb').asString));
          //oraInvIns.SetVariable(':sFERRYMAN', 'АРКА-ДОРТРАНС');
          oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('sagnfifo').asString));
          oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('num_kvit').asString) + ',(' + trim(ss^.fieldbyname('num_cist').asString) + '),' + trim(ss^.fieldbyname('sved_num').asString));
          oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
          oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
          Try
            Begin //свед 1
              oraInvIns.Execute;
              mlog.Lines.Add('Заголовок загружен...');
              rn_sved := oraInvIns.getVariable(':nRN');
              // Спецификация  по продукту
              oraInvsIns.ClearVariables;
              oraInvsIns.SetVariable(':nCOMPANY', 2);
              oraInvsIns.SetVariable(':nPRN', rn_sved);
          if (ss^.fieldbyname('date_kvit').asDateTime >= StrToDate('01.01.2006')) and (ss^.fieldbyname('no_akciz').AsInteger=1) then
    					oraInvsIns.SetVariable(':sTAXGR', trim(ss^.fieldbyname('taxgr_code_new').asString))
          else
    					oraInvsIns.SetVariable(':sTAXGR', trim(ss^.fieldbyname('taxgr_code').asString));
              oraInvsIns.SetVariable(':sGOODSPARTY', rn_parti);
              oraInvsIns.SetVariable(':sNOMEN', trim(ss^.fieldbyname('modif').asString));
              oraInvsIns.SetVariable(':sNOMMODIF', trim(ss^.fieldbyname('mod_modif').asString));
              oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('nprice').asFloat)));
              oraInvsIns.SetVariable(':nDISCOUNT', 0);
              oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss^.fieldbyname('ves').asFloat * 1000)));
              oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss^.fieldbyname('ves').asFloat * 1000)));
              oraInvsIns.SetVariable(':nPRICEMEAS', 1);
              oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat-ss^.fieldbyname('nds_prod').asFloat)));
              oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat )));
              Try //свед 2
              begin
                oraInvsIns.Execute;
                mlog.Lines.Add('Спецификация продукта загружена...');
              end;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  exit;
               end;   
              End; //свед 2
              // по страховке
              If ss^.fieldbyname('sum_insure').asFloat > 0 Then
                Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
                  oraInvsIns.SetVariable(':sTAXGR', 'ПЕРЕМ');
                  oraInvsIns.SetVariable(':sNOMEN', 'СТРАХОВКА_ГР');
                  If length(trim(ss^.fieldbyname('PROC_INSURE').asString)) = 1 Then
                    st2 := trim(ss^.fieldbyname('PROC_INSURE').asString) + '.0'
                  Else
                    st2 := trim(ss^.fieldbyname('PROC_INSURE').asString);
                  st1 := 'СТРАХОВКА_ГР_' + st2 + '%';
                  oraInvsIns.SetVariable(':sNOMMODIF', st1);
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':nQUANT', 1);
                  oraInvsIns.SetVariable(':nQUANTALT', 0);
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try //свед 3
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('СТраховка загружена...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End; //свед 3
// Вознаграждение за срочность
               If ss^.fieldbyname('sum_nacen2').asFloat> 0 Then
                Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
			    			  oraInvsIns.SetVariable(':sTAXGR', 'НДС 18%');
                  oraInvsIns.SetVariable(':sNOMEN', 'Вознаграждение');
                  oraInvsIns.SetVariable(':sNOMMODIF', 'Усл. Срочность');
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('price_nacen2').asFloat)));
                  oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss^.fieldbyname('ves').asFloat * 1000)));
                  oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss^.fieldbyname('ves').asFloat * 1000)));
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('sum_nacen2').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('sum_nacen2').asFloat)));
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try //свед 4
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('Вознаграждение за срочность загружено...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End; //свед 4
                end;
                End;
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(ss^.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''GoodsTransInvoicesToConsumers'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('1,');
              oraQuery.SQL.Add('''' + trim(ss^.fieldbyname('srecipnumb').AsString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(ss^.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
            End //    свед 1
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          //  end;
          mlog.Lines.Add('Проставляем связи...');
 //  проставляем связи
          oraQuery.SQL.Add('select rn from parus_fin where task=''ConsumersOrders'' and month_id='''+ trim(ss^.fieldbyname('srecipnumb').AsString) + '''');
          oraQuery.Execute;
          rn_l:=oraQuery.FieldAsString('rn');
          oraQuery.Close;
          oraQuery.Clear;
              qInS.ClearVariables;
              qIns.SetVariable(':sunitcode', 'ConsumersOrders');
              qIns.SetVariable(':nDOCUMENT', rn_l);
              try
              begin
              qins.Execute;
              rn_lin := qInS.GetVariable(':NResult');
              If rn_lin = '' Then
                Begin
                  qLinkIn.ClearVariables;
                  qLinkIn.SetVariable(':nCOMPANY', 2);
                  qLinkIn.SetVariable(':nDOCUMENT', rn_l);
                  qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
                  qLinkIn.SetVariable(':sUNITCODE', 'ConsumersOrders');
                  qLinkIn.SetVariable(':nSTATUS', 0);
                  qLinkIn.SetVariable(':nBREAKUP_KIND', 0);
                  qLinkIn.Execute;
                  rn_lin := qLinkIn.GetVariable(':NRN');
                End;
              qInS.ClearVariables;
              qIns.SetVariable(':sunitcode', 'GoodsTransInvoicesToConsumers');
              qIns.SetVariable(':nDOCUMENT', rn_sved);
              qins.Execute;
              rn_lout := qInS.GetVariable(':NResult');
              If rn_lout = '' Then
                Begin
                qLinkOut.ClearVariables;
                qLinkOut.SetVariable(':nCOMPANY', 2);
                qLinkOut.SetVariable(':nDOCUMENT', rn_sved);
                qLinkOut.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
                qLinkOut.SetVariable(':sUNITCODE', 'GoodsTransInvoicesToConsumers');
                qLinkOut.SetVariable(':nSTATUS', 0);
                qLinkOut.SetVariable(':nBREAKUP_KIND', 0);
                qLinkOut.Execute;
                rn_lout := qLinkOut.GetVariable(':NRN');
              end;
              qLink.ClearVariables;
              qLink.SetVariable(':nIN_DOC', rn_lin);
              qLink.SetVariable(':nout_DOC', rn_lout);
              try
              qLink.Execute;
              Except On E: EOracleError Do
                      ShowMessage(E.Message);
              end;
              end;
                            Except On E: EOracleError Do
                      ShowMessage(E.Message);
              end;

 //закончили проставлять связи
               mlog.Lines.Add('Связи проставлены...');
          oraQuery.Session.Commit;
          oraQ.Session.Commit;
          oraQ.SQL.Clear;
          oraQuery.SQL.Clear;
//      mlog.Lines.Add('Все загружено!');
        End;
// за Вознаграждение
        If ss^.fieldbyname('sum_nacen1').asFloat+ ss^.fieldbyname('voznagr').asFloat > 0 Then
         Begin
          oraInvIns.ClearVariables;
          oraInvIns.SetVariable(':nCOMPANY', 2);
          oraInvIns.SetVariable(':nCRN', rn_crn);
          oraInvIns.SetVariable(':sJUR_PERS', trim(ss^.fieldbyname('sjur_pers').asString));
          oraInvIns.SetVariable(':sDOCTYPE', 'АКТ_ВОЗН');
          oraInvIns.SetVariable(':sPREF', rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)), 2) + 'т-' + trim(ss^.fieldbyname('Sved_num').asString));
          oraInvIns.SetVariable(':sNUMB', trim(ss^.fieldbyname('num_cist').asString));
          oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':dSALEDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':sACCDOC', trim(ss^.fieldbyname('saccdoc').asString));
          oraInvIns.SetVariable(':sACCNUMB', trim(ss^.fieldbyname('valid_docnumb').asString));
          oraInvIns.SetVariable(':dACCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('daccdate').asDateTime));
          oraInvIns.SetVariable(':sSTOPER', 'ТРАНСП_УСЛУГИ');
          oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
          oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
          oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
          oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
          oraInvIns.SetVariable(':sSTORE', 'УХТА_ЦА');
          oraInvIns.SetVariable(':sMOL', 'ЦЕНТР');
          oraInvIns.SetVariable(':sSHEEPVIEW', trim(ss^.fieldbyname('sshipview').asString));
          oraInvIns.SetVariable(':sPAYTYPE', trim(ss^.fieldbyname('spay_type').asString));
          oraInvIns.SetVariable(':nDISCOUNT', 0);
          oraInvIns.SetVariable(':sCURRENCY', 'Руб.');
          oraInvIns.SetVariable(':nCURCOURS', 1);
          oraInvIns.SetVariable(':nCURBASE', 1);
          oraInvIns.SetVariable(':nFA_COURS', 1);
          oraInvIns.SetVariable(':nFA_BASECOURS', 1);
          summ := floattostr(ss^.fieldbyname('sum_nacen1').asFloat + ss^.fieldbyname('voznagr').asFloat*1.18);
          oraInvIns.SetVariable(':nSUMM', summ);
          summ := floattostr(ss^.fieldbyname('sum_nacen1').asFloat + ss^.fieldbyname('voznagr').asFloat*1.18);
          oraInvIns.SetVariable(':nSUMMWITHNDS', summ);
          oraInvIns.SetVariable(':sRECIPNUMB', trim(ss^.fieldbyname('srecipnumb').asString));
          oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('sagnfifo').asString));
          oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('num_kvit').asString) + ',(' + trim(ss^.fieldbyname('num_cist').asString) + '),' + trim(ss^.fieldbyname('sved_num').asString));
          oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
          oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
          Try
            Begin //свед 1
              oraInvIns.Execute;
              //mlog.Lines.Add('Заголовок загружен...');
              rn_sved := oraInvIns.getVariable(':nRN');
//Вознаграждение
              If ss^.fieldbyname('sum_nacen1').asFloat> 0 Then
               Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
			    			  oraInvsIns.SetVariable(':sTAXGR', 'НДС 18%');
                  oraInvsIns.SetVariable(':sNOMEN', 'Вознаграждение');
                  oraInvsIns.SetVariable(':sNOMMODIF', 'Усл.трансп-ки');
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('price_nacen1').asFloat/1000)));
                  oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000)));
                  oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000)));
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('sum_nacen1').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('sum_nacen1').asFloat)));
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try //свед 4
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('Вознаграждение загружено...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End; //свед 4
               end;
//Аренда
              If ss^.fieldbyname('voznagr').asFloat > 0 Then
               Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
			    			  oraInvsIns.SetVariable(':sTAXGR', 'НДС 18%');
                  case ss^.fieldbyname('vagown_typ_id').AsInteger of
                  0: begin
                   oraInvsIns.SetVariable(':sNOMEN', 'Вознаграждение');
                   oraInvsIns.SetVariable(':sNOMMODIF', 'цистерны МПС');
                     end;
                  else begin
                    oraInvsIns.SetVariable(':sNOMEN', 'Вознаграждение');
                    oraInvsIns.SetVariable(':sNOMMODIF', 'Усл.трансп-ки Аренда');
                       end;
                  end;
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('voznagr').asFloat)));
                  oraInvsIns.SetVariable(':nQUANT', 1);
                  oraInvsIns.SetVariable(':nQUANTALT', 0);
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('voznagr').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('voznagr').asFloat)));
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try //свед 4
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('Вознаграждение за аренду загружено...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End; //свед 4
               end;
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(ss^.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''GoodsTransInvoicesToConsumers'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('3,');
              oraQuery.SQL.Add('''' + trim(ss^.fieldbyname('srecipnumb').AsString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(ss^.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
            End //    свед 1
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          mlog.Lines.Add('Проставляем связи...');
 //  проставляем связи
          oraQuery.SQL.Add('select rn from parus_fin where task=''IncomingOrders'' and subtask=4 and kvit_id='''+ trim(ss^.fieldbyname('id').AsString) + '''');
          oraQuery.SQL.Add('and sved_num='''+trim(ss^.fieldbyname('Sved_num').asString)+'''');
          oraQuery.Execute;
          rn_l:=oraQuery.FieldAsString('rn');
          oraQuery.Close;
          oraQuery.Clear;
              qInS.ClearVariables;
              qIns.SetVariable(':sunitcode', 'IncomingOrders');
              qIns.SetVariable(':nDOCUMENT', rn_l);
              qins.Execute;
              rn_lin := qInS.GetVariable(':NResult');
              If rn_lin = '' Then
                Begin
                  qLinkIn.ClearVariables;
                  qLinkIn.SetVariable(':nCOMPANY', 2);
                  qLinkIn.SetVariable(':nDOCUMENT', rn_l);
                  qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
                  qLinkIn.SetVariable(':sUNITCODE', 'IncomingOrders');
                  qLinkIn.SetVariable(':nSTATUS', 0);
                  qLinkIn.SetVariable(':nBREAKUP_KIND', 0);
                  qLinkIn.Execute;
                  rn_lin := qLinkIn.GetVariable(':NRN');
                End;
              qLinkOut.ClearVariables;
              qLinkOut.SetVariable(':nCOMPANY', 2);
              qLinkOut.SetVariable(':nDOCUMENT', rn_sved);
              qLinkOut.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
              qLinkOut.SetVariable(':sUNITCODE', 'GoodsTransInvoicesToConsumers');
              qLinkOut.SetVariable(':nSTATUS', 0);
              qLinkOut.SetVariable(':nBREAKUP_KIND', 0);
              qLinkOut.Execute;
              rn_lout := qLinkOut.GetVariable(':NRN');
              qLink.ClearVariables;
              qLink.SetVariable(':nIN_DOC', rn_lin);
              qLink.SetVariable(':nout_DOC', rn_lout);
              qLink.Execute;
 //закончили проставлять связи
               mlog.Lines.Add('Связи проставлены...');
          oraQuery.Session.Commit;
          oraQ.Session.Commit;
          oraQ.SQL.Clear;
          oraQuery.SQL.Clear;
          mlog.Lines.Add('Все загружено!');
        End;
      ss^.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmTTN17.LoadParusGD;
Var
  summ, rn_stan                         : String;
  st1, st2, rn_crn                      : String;
  rn_akt                                : String;
  ok                                    : boolean;
  rn_strax                              : String;
  ss                                    : ^TOracleDataSet;
  rn_lin,rn_lout,rn_l                   : string;
Begin
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  ss := @oraTTN17_new;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      mlog.Lines.Add('Закачка в Парус сведение №' + ss^.fieldbyname('sved_num').AsString + ' №' + ss^.fieldbyname('num_cist').AsString);
      ok := false;
      ok := true;
      oraQ.SQL.Clear;
      //ЖД станция
      st1 := AnsiUpperCase(leftStr(ss^.fieldbyname('stan_name').asString, 1));
      st2 := rightStr(trim(ss^.fieldbyname('stan_name').asString), length(trim(ss^.fieldbyname('stan_name').asString)) - 1);
      st1 := leftstr(st1 + AnsiLowerCase(st2),20);
      oraQ.SQL.Clear;
      oraQ.SQL.Add('select rn from NomModif where');
      oraQ.SQL.Add('modif_code=''' + st1 + '''');
      oraQ.execute;
      If (oraQ.RowCount > 0) And ok Then
        Begin
          rn_stan := st1;
          ok := true;
        End
      Else
        Begin
          ok := false;
          mlog.Lines.Add('Не найдена станция в Парусе: ' + st1);
          mlog.Lines.Add('Закачка в Парус сведение №' + ss^.fieldbyname('sved_num').AsString + 'не произведена!');
        End;
      oraQ.SQL.Clear;
      If ok Then
        Begin
          //Акт транспортировки
          If ss^.fieldbyname('tarif').asFloat > 0 Then
            Begin
              mlog.Lines.Add('Загрузка акта транспортировки...');
              oraInvIns.ClearVariables;
              oraInvIns.SetVariable(':nCOMPANY', 2);
              oraInvIns.SetVariable(':nCRN', rn_crn);
              oraInvIns.SetVariable(':sJUR_PERS', trim(ss^.fieldbyname('sjur_pers').asString));
              oraInvIns.SetVariable(':sDOCTYPE', 'АКТ_ТРАНСП');
              oraInvIns.SetVariable(':sPREF', rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)), 2) + 'т-' + trim(ss^.fieldbyname('Sved_num').asString));
              oraInvIns.SetVariable(':sNUMB', trim(ss^.fieldbyname('num_cist').asString));
              oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
              oraInvIns.SetVariable(':dSALEDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
              oraInvIns.SetVariable(':sACCDOC', trim(ss^.fieldbyname('saccdoc').asString));
              oraInvIns.SetVariable(':sACCNUMB', trim(ss^.fieldbyname('valid_docnumb').asString));
              oraInvIns.SetVariable(':dACCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('daccdate').asDateTime));
              oraInvIns.SetVariable(':sSTOPER', 'ТРАНСП_УСЛУГИ');
              oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
              oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
              oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
              oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
              oraInvIns.SetVariable(':sSTORE', 'УХТА_ЦА');
              oraInvIns.SetVariable(':sMOL', 'ЦЕНТР');
              oraInvIns.SetVariable(':sSHEEPVIEW', trim(ss^.fieldbyname('sshipview').asString));
              oraInvIns.SetVariable(':sPAYTYPE', trim(ss^.fieldbyname('spay_type').asString));
              oraInvIns.SetVariable(':nDISCOUNT', 0);
              oraInvIns.SetVariable(':sCURRENCY', 'Руб.');
              oraInvIns.SetVariable(':nCURCOURS', 1);
              oraInvIns.SetVariable(':nCURBASE', 1);
              oraInvIns.SetVariable(':nFA_COURS', 1);
              oraInvIns.SetVariable(':nFA_BASECOURS', 1);
              summ := floattostr(ss^.fieldbyname('tarif').asFloat);
              oraInvIns.SetVariable(':nSUMM', summ);
              summ := floattostr(ss^.fieldbyname('tarif').asFloat + ss^.fieldbyname('tarif_nds').asFloat);
              oraInvIns.SetVariable(':nSUMMWITHNDS', summ);
              oraInvIns.SetVariable(':sRECIPNUMB', trim(ss^.fieldbyname('srecipnumb').asString));
              //oraInvIns.SetVariable(':sFERRYMAN', 'АРКА-ДОРТРАНС');
              oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('sagnfifo').asString));
              oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('num_kvit').asString) + ',(' + trim(ss^.fieldbyname('num_cist').asString) + '),' + trim(ss^.fieldbyname('sved_num').asString));
              oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
              oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
              Try
                Begin
                  oraInvIns.Execute;
                  mlog.Lines.Add('Заголовок загружен...');
                  rn_akt := oraInvIns.getVariable(':nRN');
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_akt);
                  oraInvsIns.SetVariable(':sTAXGR', 'НДС 18%');
                  oraInvsIns.SetVariable(':sNOMEN', 'Ж/Д тариф');
                  oraInvsIns.SetVariable(':sNOMMODIF', rn_stan);
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('tarif').asFloat + ss^.fieldbyname('tarif_nds').asFloat)));
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':nQUANT', 1);
                  oraInvsIns.SetVariable(':nQUANTALT', 0);
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('tarif').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('tarif').asFloat + ss^.fieldbyname('tarif_nds').asFloat)));
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('Тариф загружен...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End;
                  if ss^.fieldbyname('tarif_guard').asFloat>0 then
                  begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_akt);
                  oraInvsIns.SetVariable(':sTAXGR', 'НДС 18%');
                  oraInvsIns.SetVariable(':sNOMEN', 'Ж/Д охрана');
                  oraInvsIns.SetVariable(':sNOMMODIF', 'Ж/Д охрана');
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss^.fieldbyname('tarif_guard').asFloat + ss^.fieldbyname('tarif_guard_nds').asFloat)));
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':nQUANT', 1);
                  oraInvsIns.SetVariable(':nQUANTALT', 0);
                  oraInvsIns.SetVariable(':nPRICEMEAS', 0);
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('tarif_guard').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss^.fieldbyname('tarif_guard').asFloat + ss^.fieldbyname('tarif_guard_nds').asFloat)));
                  oraInvsIns.SetVariable(':dBEGINDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').asDateTime));
                  Try
                  begin
                    oraInvsIns.Execute;
                    mlog.Lines.Add('Охрана загружена...');
                  end;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End;
                  end;
                  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
                  oraQuery.SQL.Add(trim(ss^.fieldbyname('id').AsString) + ',');
                  oraQuery.SQL.Add('''GoodsTransInvoicesToConsumers'',');
                  oraQuery.SQL.Add((rn_akt) + ',');
                  oraQuery.SQL.Add('2,');
                  oraQuery.SQL.Add('''' + trim(ss^.fieldbyname('srecipnumb').AsString) + ''',');
                  oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
                  oraQuery.SQL.Add(trim(ss^.fieldbyname('Sved_num').asString) + ',');
                  oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
                  oraQuery.Execute;
                  oraQuery.Close;
                  oraQuery.SQL.Clear;
                End;
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End;
            End;
          mlog.Lines.Add('Проставляем связи...');
 //  проставляем связи
          oraQuery.SQL.Add('select rn from parus_fin where task=''IncomingOrders'' and subtask=2 and kvit_id='''+ trim(ss^.fieldbyname('id').AsString) + '''');
          oraQuery.Execute;
          rn_l:=oraQuery.FieldAsString('rn');
          oraQuery.Close;
          oraQuery.Clear;
              qInS.ClearVariables;
              qIns.SetVariable(':sunitcode', 'IncomingOrders');
              qIns.SetVariable(':nDOCUMENT', rn_l);
              qins.Execute;
              rn_lin := qInS.GetVariable(':NResult');
              If rn_lin = '' Then
                Begin
                  qLinkIn.ClearVariables;
                  qLinkIn.SetVariable(':nCOMPANY', 2);
                  qLinkIn.SetVariable(':nDOCUMENT', rn_l);
                  qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
                  qLinkIn.SetVariable(':sUNITCODE', 'IncomingOrders');
                  qLinkIn.SetVariable(':nSTATUS', 0);
                  qLinkIn.SetVariable(':nBREAKUP_KIND', 0);
                  qLinkIn.Execute;
                  rn_lin := qLinkIn.GetVariable(':NRN');
                End;
              qLinkOut.ClearVariables;
              qLinkOut.SetVariable(':nCOMPANY', 2);
              qLinkOut.SetVariable(':nDOCUMENT', rn_akt);
              qLinkOut.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
              qLinkOut.SetVariable(':sUNITCODE', 'GoodsTransInvoicesToConsumers');
              qLinkOut.SetVariable(':nSTATUS', 0);
              qLinkOut.SetVariable(':nBREAKUP_KIND', 0);
              qLinkOut.Execute;
              rn_lout := qLinkOut.GetVariable(':NRN');
              qLink.ClearVariables;
              qLink.SetVariable(':nIN_DOC', rn_lin);
              qLink.SetVariable(':nout_DOC', rn_lout);
              qLink.Execute;
 //закончили проставлять связи
               mlog.Lines.Add('Связи проставлены...');
          oraQuery.Session.Commit;
          oraQ.Session.Commit;
          oraQ.SQL.Clear;
          oraQuery.SQL.Clear;
          mlog.Lines.Add('Все загружено!');
        End;
      ss^.Next;
    End;
  acFilterExecute(Self);
End;


Procedure TfrmTTN17.dbgTTN17_newGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraTTN17_new.RecNo) Then
    background := clMoneyGreen;
End;

procedure TfrmTTN17.DBGridEh1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 if mteCatalog.TreeNodeExpanded  then
   params.ImageIndex:=1
 else
  if mteCatalog.TreeNodeHasChildren then
   params.ImageIndex:=2
  else
   params.ImageIndex:=3;
end;

End.
