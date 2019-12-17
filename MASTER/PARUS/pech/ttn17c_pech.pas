Unit ttn17c_pech;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, PropStorageEh, PropFilerEh, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmTTN17c = Class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgTTN17_cond: TDBGridEh;
    ActionManager1: TActionManager;
    acFilter: TAction;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    qLink: TOracleQuery;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    dsTTN: TDataSource;
    dsTTN17specs: TDataSource;
    Splitter1: TSplitter;
    dbgTTN17_new: TDBGridEh;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    Splitter4: TSplitter;
    mLog: TMemo;
    tTTN: TADODataSet;
    tTTNspecs: TADODataSet;
    qLinkIn: TOracleQuery;
    qLinkOut: TOracleQuery;
    qInS: TOracleQuery;
    oraFindPack: TOracleQuery;
    adoMain: TADOConnection;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edPath: TDirectoryEdit;
    BitBtn1: TBitBtn;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure LoadParus(z: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmTTN17c                             : TfrmTTN17c;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTN17c.acFilterExecute(Sender: TObject);
Begin
  If edPath.Text <> '' Then
    Begin
      If tTTNspecs.Active Then
        tTTNspecs.Close;
      If tTTN.Active Then
        tTTN.Close;
      If adoMain.connected Then
        adoMain.connected := false;
      adoMain.ConnectionString := 'Provider=MSDASQL;Password="";Persist Security Info=True;Extended Properties="DSN=pf;UID=;PWD=;SourceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoMain.connected := True;
      tTTN.CommandText := 'select * from "' + edPath.Text + '\transinvcust.dbf"';
      tTTN.Open;
      tTTNspecs.CommandText := 'select * from "' + edPath.Text + '\transinvcustspecs.dbf"';
      tTTNspecs.Open;
    End;
End;

Procedure TfrmTTN17c.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmTTN17c.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  adoMain.Connected := False;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP TTN Pechora';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmTTN17c.acLoadExecute(Sender: TObject);
Begin
  If adoMain.connected Then
    LoadParus(1);
End;

Procedure TfrmTTN17c.LoadParus(z: integer);
Var
  st2, rn_crn, sNOMpack                 : String;
  rn_sved, rn_lin, rn_lout              : String;
  ss, ss2                               : ^TOracleDataSet;
  pack                                  : double;
Begin
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  ss := @tTTN;
  ss2 := @tTTNspecs;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      mlog.Lines.Add('Загрузка в Парус ТТН №' + trim(ss^.fieldbyname('spref').AsString) + '-' + trim(ss^.fieldbyname('snumb').AsString) + ' от ' + datetostr(ss^.fieldbyname('ddocdate').AsDateTime));
      oraInvIns.ClearVariables;
      oraInvIns.SetVariable(':nCOMPANY', 2);
      oraInvIns.SetVariable(':nCRN', rn_crn);
      oraInvIns.SetVariable(':sJUR_PERS', trim(ss^.fieldbyname('sjur_pers').asString));
      oraInvIns.SetVariable(':sDOCTYPE', trim(ss^.fieldbyname('sDOCTYPE').asString));
      oraInvIns.SetVariable(':sPREF', trim(ss^.fieldbyname('sPREF').asString));
      oraInvIns.SetVariable(':snumb', trim(ss^.fieldbyname('snumb').asString));
      oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dDOCDATE').asDateTime));
      oraInvIns.SetVariable(':dSALEDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dSALEDATE').asDateTime));
      oraInvIns.SetVariable(':sACCDOC', trim(ss^.fieldbyname('saccdoc').asString));
      oraInvIns.SetVariable(':sACCNUMB', trim(ss^.fieldbyname('saccnumb').asString));
      oraInvIns.SetVariable(':dACCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('daccdate').asDateTime));
      oraInvIns.SetVariable(':sSTOPER', trim(ss^.fieldbyname('sSTOPER').asString));
      oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
      oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
      oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
      oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
      oraInvIns.SetVariable(':sStore', trim(ss^.fieldbyname('sstore').asString));
      oraInvIns.SetVariable(':sMOL', trim(ss^.fieldbyname('sMOL').asString));
      oraInvIns.SetVariable(':sSHEEPVIEW', trim(ss^.fieldbyname('ssheepview').asString));
      oraInvIns.SetVariable(':sPAYTYPE', trim(ss^.fieldbyname('spaytype').asString));
      oraInvIns.SetVariable(':nDISCOUNT', 0);
      oraInvIns.SetVariable(':sCURRENCY', 'Руб.');
      oraInvIns.SetVariable(':nCURCOURS', 1);
      oraInvIns.SetVariable(':nCURBASE', 1);
      oraInvIns.SetVariable(':nFA_COURS', 1);
      oraInvIns.SetVariable(':nFA_BASECOURS', 1);
//      oraInvIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('nSUMMWITHN').asFloat * 5 / 6)));
			oraInvIns.SetVariable(':nSUMM', trim(floatToStr(ss^.fieldbyname('nSUMM').asFloat)));
			oraInvIns.SetVariable(':nSUMMWITHNDS', trim(ss^.fieldbyname('nSUMMWITHN').asString));
      oraInvIns.SetVariable(':sRECIPNUMB', trim(ss^.fieldbyname('srecipnumb').asString));
      oraInvIns.SetVariable(':sFERRYMAN', trim(ss^.fieldbyname('sFERRYMAN').asString));
      oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('sagnfifo').asString));
      oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('sCOMMENTS').asString));
      oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
      oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
      Try
        Begin //свед 1
          oraInvIns.Execute;
          rn_sved := oraInvIns.getVariable(':nRN');
          qInS.ClearVariables;
          qIns.SetVariable(':nDOCUMENT', ss^.fieldbyname('nrncord').asInteger);
          qins.Execute;
          rn_lin := qInS.GetVariable(':NResult');
          If rn_lin = '' Then
            Begin
              qLinkIn.ClearVariables;
              qLinkIn.SetVariable(':nCOMPANY', 2);
              qLinkIn.SetVariable(':nDOCUMENT', ss^.fieldbyname('nrncord').asInteger);
              qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
              qLinkIn.SetVariable(':sUNITCODE', 'ConsumersOrders');
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
          // Спецификация
          ss2^.First;
          While Not ss2^.Eof Do
            Begin
              oraInvsIns.ClearVariables;
              oraInvsIns.SetVariable(':nCOMPANY', 2);
              oraInvsIns.SetVariable(':nPRN', rn_sved);
              oraInvsIns.SetVariable(':sTAXGR', trim(ss2^.fieldbyname('sTAXGR').asString));
              oraInvsIns.SetVariable(':sNOMEN', trim(ss2^.fieldbyname('sNOMEN').asString));
              oraInvsIns.SetVariable(':sNOMMODIF', trim(ss2^.fieldbyname('sNOMMODIF').asString));
              If ss2^.fieldbyname('nPRICEMEAS').asInteger = 2 Then
                Begin
                  //фасовка
                  oraFindPack.ClearVariables;
                  oraFindPack.SetVariable(':nrn', trim(ss2^.fieldbyname('nrn_cords').asString));
                  oraFindPack.Execute;
                  pack := oraFindPack.FieldAsFloat('nexp_price');
                  sNOMpack := oraFindPack.FieldAsString('snommod_pack');
                  oraInvsIns.SetVariable(':SNOMNMODIFPACK', trim(sNOMpack));
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(pack)));
                End
              Else
                Begin
                  //налив
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'АИ-80' Then
                    oraInvsIns.SetVariable(':sCELL', '1-2');
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'АИ-92' Then
                    oraInvsIns.SetVariable(':sCELL', '1-1');
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'ДЗУ' Then
                    oraInvsIns.SetVariable(':sCELL', '1-4');
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'ДЛУ' Then
                    oraInvsIns.SetVariable(':sCELL', '1-5');
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'Премиум 95' Then
                    oraInvsIns.SetVariable(':sCELL', '1-6');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 9) = 'М-16Г2ЦС' Then
                    oraInvsIns.SetVariable(':sCELL', '1-1');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 7) = 'М-10В2' Then
                    oraInvsIns.SetVariable(':sCELL', '300-4');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 7) = 'М-10Г2' Then
                    oraInvsIns.SetVariable(':sCELL', '300-6');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 8) = 'М-10Г2К' Then
                    oraInvsIns.SetVariable(':sCELL', '300-7');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 7) = 'М-14В2' Then
                    oraInvsIns.SetVariable(':sCELL', '300-5');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 5) = 'М-8В' Then
                    oraInvsIns.SetVariable(':sCELL', '300-3');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 7) = 'М-8Г2К' Then
                    oraInvsIns.SetVariable(':sCELL', '300-9');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 5) = 'МС-20' Then
                    oraInvsIns.SetVariable(':sCELL', '300-2');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 4) = 'ОН/П' Then
                    oraInvsIns.SetVariable(':sCELL', '300-10');
                  If LeftStr(trim(ss2^.fieldbyname('sNOMEN').asString), 6) = 'ТП-22С' Then
                    oraInvsIns.SetVariable(':sCELL', '300-8');
                  If trim(ss2^.fieldbyname('sNOMEN').asString) = 'Трансформаторное' Then
                    oraInvsIns.SetVariable(':sCELL', '300-11');
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss2^.fieldbyname('nprice').asFloat)));
                End;
//							oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss2^.fieldbyname('nSUMMWITHN').asFloat * 5 / 6)));
							oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss2^.fieldbyname('nSUMM').asFloat)));
							oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss2^.fieldbyname('nSUMMWITHN').asFloat)));
							oraInvsIns.SetVariable(':nDISCOUNT', 0);
              If ss2^.fieldbyname('nQUANT').asFloat / ss2^.fieldbyname('nQUANTALT').asFloat > 10 Then
                oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss2^.fieldbyname('nQUANTALT').asFloat * 1000)))
              Else
                oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss2^.fieldbyname('nQUANTALT').asFloat)));

              If ss2^.fieldbyname('nQUANTALT').asFloat / ss2^.fieldbyname('nQUANT').asFloat > 10 Then
                oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss2^.fieldbyname('nQUANT').asFloat * 1000)))
              Else
                oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss2^.fieldbyname('nQUANT').asFloat)));
              oraInvsIns.SetVariable(':nPRICEMEAS', trim(ss2^.fieldbyname('nPRICEMEAS').asString));
              Try //свед 2
                oraInvsIns.Execute;
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End; //свед 2
              ss2^.Next;
            End;
          mlog.Lines.Add('ТТН загружена успешно!');
        End //    свед 1
      Except On E: EOracleError Do
          ShowMessage(E.Message);
      End; //    свед 1
      ss^.Next;
    End;
  oraInvIns.Session.Commit;
End;

Procedure TfrmTTN17c.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmTTN17c.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
