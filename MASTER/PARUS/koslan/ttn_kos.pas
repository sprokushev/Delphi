Unit ttn_kos;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, PropStorageEh, PropFilerEh,
  MemTableDataEh, DataDriverEh, MemTableEh, GridsEh;

Type
  TfrmTTNKos = Class(TForm)
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
    oraS: TOracleQuery;
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
    Procedure WriteEvent(Tag: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmTTNKos                             : TfrmTTNKos;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTNKos.WriteEvent(Tag: String);
Begin
frmMain.WriteEvent(Tag, 'Форма "Загрузка ТТН потребителей в Парус"');
End;

Procedure TfrmTTNKos.acFilterExecute(Sender: TObject);
Begin
  If edPath.Text <> '' Then
    Begin
      If tTTNspecs.Active Then tTTNspecs.Close;
      If tTTN.Active Then tTTN.Close;
      If adoMain.connected Then adoMain.connected := false;
      adoMain.ConnectionString := 'Provider=MSDASQL;Password="";Persist Security Info=True;Extended Properties="DSN=pf;UID=;PWD=;SourceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      //adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Extended Properties="DSN=Visual FoxPro Tables;UID=;SourceDB=u:\luk\Dbases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoMain.connected := True;
      tTTN.CommandText := 'select * from "' + edPath.Text + '\transinvcust.dbf"';
      tTTN.Open;
      tTTNspecs.CommandText := 'select * from "' + edPath.Text + '\transinvcustspecs.dbf"';
      tTTNspecs.Open;
    End;
End;

Procedure TfrmTTNKos.FormCreate(Sender: TObject);
Begin
  WriteEvent('Форма открыта');
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.LogOn;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmTTNKos.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  adoMain.Connected := False;
  WriteEvent('Форма закрыта');
  action := caFree;
End;

Procedure TfrmTTNKos.acLoadExecute(Sender: TObject);
Begin
  If adoMain.connected Then
    LoadParus(1);
End;

Procedure TfrmTTNKos.LoadParus(z: integer);
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
      WriteEvent('Загрузка в Парус ТТН №' + trim(ss^.fieldbyname('spref').AsString) + '-' + trim(ss^.fieldbyname('snumb').AsString) + ' от ' + datetostr(ss^.fieldbyname('ddocdate').AsDateTime));
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
      // Номер распоряжения
      oraInvIns.SetVariable(':sDIRDOC', trim(ss^.fieldbyname('sdirdoc').asString));
      oraInvIns.SetVariable(':sDIRNUMB', trim(ss^.fieldbyname('sdirnumb').asString));
      oraInvIns.SetVariable(':dDIRDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('ddirdate').asDateTime));
      oraFindPack.ClearVariables; // Поиск операции в распоряжении
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ SSTOPER FROM V_SHEEPDIRSCUST v  WHERE nrn=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('nrncord').asString));
      oraFindPack.Execute;
      if oraFindPack.RowCount > 0 then oraInvIns.SetVariable(':sSTOPER', trim(oraFindPack.FieldAsString('SSTOPER'))) else begin ShowMessage('Нет распоряжения'); oraFindPack.Close; exit  end;// добавлено Фроловым А.В. 15.09.2006 
      oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
      oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
      oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
      oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
      oraInvIns.SetVariable(':sStore', trim(ss^.fieldbyname('sstore').asString));
      oraFindPack.ClearVariables; // Поиск МОЛ по складу
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ skeeper FROM V_DICSTORE v  WHERE trim(v.snumb)=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('sstore').asString));
      oraFindPack.Execute;
      oraInvIns.SetVariable(':sMOL', trim(oraFindPack.FieldAsString('skeeper')));
      oraFindPack.Close;
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
//      oraInvIns.SetVariable(':sFERRYMAN', trim(ss^.fieldbyname('sFERRYMAN').asString));
//			oraInvIns.SetVariable(':sCAR', trim(ss^.fieldbyname('sCAR').asString));
			oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('sagnfifo').asString));
			oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('sCOMMENTS').asString));
			oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
			oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
      Try
        Begin //свед 1
          oraInvIns.Execute;
          WriteEvent('Заголовок загружен успешно!');

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
              qLinkIn.SetVariable(':sUNITCODE', 'SheepDirectToConsumers');
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
          WriteEvent('Проставлены связи с распоряжением!');
        End; //закончили проставлять связи
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
            oraInvsIns.SetVariable(':SNOMNMODIFPACK', trim(ss2^.fieldbyname('sNOMpack').asString));
            If (ss2^.fieldbyname('nPRICEMEAS').asInteger = 2) Then //фасовка
              Begin
                oraFindPack.ClearVariables;
                oraFindPack.SQL[0] := 'SELECT nquant FROM V_NOMNMODIFPACK v  WHERE trim(v.SMODIF_CODE)=:code';
                oraFindPack.SetVariable(':code', trim(ss2^.fieldbyname('sNOMMODIF').asString));
                oraFindPack.Execute;
                pack := oraFindPack.FieldAsFloat('nquant');
                oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss2^.fieldbyname('nSUMMWITHN').asFloat / (ss2^.fieldbyname('nQUANT').asFloat / pack))));
              End
            Else //налив
              Begin
                if trim(ss2^.fieldbyname('sCELL').asString)<>'' then
                  oraInvsIns.SetVariable(':sCELL', trim(ss2^.fieldbyname('sCELL').asString));
                oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss2^.fieldbyname('nprice').asFloat)));
              End;
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
            if (trim(ss2^.fieldbyname('sGOODSPART').asString)<>'') and (trim(ss2^.fieldbyname('sGOODSPART').asString)<>'ФИКТ')
            and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'+') and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'-')
            and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'0') then
            oraInvsIns.SetVariable(':sGOODSPARTY', trim(ss2^.fieldbyname('sGOODSPART').asString));

            Try //свед 2
              Begin
                oraInvsIns.Execute;
                WriteEvent('Спецификация загружена успешно!');
                WriteEvent('ТТН на отпуск в подразделения сформирована успешно!');
              End;
            Except On E: EOracleError Do
             begin
                ShowMessage(E.Message);
                WriteEvent(E.Message);
             end;
            End; //свед 2
            ss2^.Next;
          End;
        //      End //    свед 1
      Except On E: EOracleError Do
       Begin
          ShowMessage(E.Message);
          WriteEvent(E.Message);
       end;
      End; //    свед 1
      oraInvIns.Session.Commit;
      ss^.Next;
    End;
End;

Procedure TfrmTTNKos.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then node.ImageIndex := 3;
End;

procedure TfrmTTNKos.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
