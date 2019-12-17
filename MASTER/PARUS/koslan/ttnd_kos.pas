Unit ttnd_kos;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, PropStorageEh, PropFilerEh, dbf, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmTTNdKos = Class(TForm)
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
    tTTN1: TADODataSet;
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
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    oraProps: TOracleQuery;
    tttn: TDbf;
    tttnNRN: TFloatField;
    tttnSDOCTYPE: TStringField;
    tttnSPREF: TStringField;
    tttnSNUMB: TStringField;
    tttnDDOCDATE: TDateField;
    tttnNSTATUS: TFloatField;
    tttnNIN_STATUS: TFloatField;
    tttnDWORK_DATE: TDateField;
    tttnDIN_WORK_D: TDateField;
    tttnSDIRDOC: TStringField;
    tttnSDIRNUMB: TStringField;
    tttnDDIRDATE: TDateField;
    tttnSSTOPER: TStringField;
    tttnSFACEACC: TStringField;
    tttnSFACC_CURR: TStringField;
    tttnSSTORE: TStringField;
    tttnSMOL: TStringField;
    tttnSSHEEPVIEW: TStringField;
    tttnSSUBDIV: TStringField;
    tttnSCURRENCY: TStringField;
    tttnNCURCOURS: TFloatField;
    tttnNCURBASE: TFloatField;
    tttnNFA_CURCOU: TFloatField;
    tttnNFA_CURBAS: TFloatField;
    tttnSRECIPDOC: TStringField;
    tttnSRECIPNUMB: TStringField;
    tttnDRECIPDATE: TDateField;
    tttnSFERRYMAN: TStringField;
    tttnSGETCONFIR: TStringField;
    tttnSWAYBLADEN: TStringField;
    tttnSDRIVER: TStringField;
    tttnSCAR: TStringField;
    tttnSROUTE: TStringField;
    tttnSTRAILER1: TStringField;
    tttnSTRAILER2: TStringField;
    tttnSIN_STORE: TStringField;
    tttnSIN_MOL: TStringField;
    tttnSIN_STOPER: TStringField;
    tttnNIN_CURCOU: TFloatField;
    tttnNIN_CURBAS: TFloatField;
    tttnSIN_CURREN: TStringField;
    tttnSCOMMENTS: TStringField;
    tttnSOUT_SUBDI: TStringField;
    tttnSVDOCTYPE: TStringField;
    tttnSVDOCNUMB: TStringField;
    tttnDVDOCDATE: TDateField;
    tttnSGRAPHP: TStringField;
    tttnSJUR_PERS: TStringField;
    tttnNRN_CORD: TFloatField;
    tttnNSUMMWITHN: TFloatField;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    oraIns: TOracleQuery;
    orafindAgent: TOracleQuery;
    oracarins: TOracleQuery;
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
  frmTTNDKos                            : TfrmTTNDKos;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTNDKos.WriteEvent(Tag: String);
Begin
frmMain.WriteEvent(Tag, 'Форма "Загрузка ТТН подразделений в Парус"');
End;

Procedure TfrmTTNDKos.acFilterExecute(Sender: TObject);
Begin
  If edPath.Text <> '' Then
    Begin
      If tTTNspecs.Active Then tTTNspecs.Close;
      If tTTN.Active Then tTTN.Close;
      If adoMain.connected Then adoMain.connected := false;
      adoMain.ConnectionString := 'Provider=MSDASQL;Password="";Persist Security Info=True;Extended Properties="DSN=pf;UID=;PWD=;SourceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoMain.connected := True;
      tttn.FilePathFull:=edPath.Text + '\';
      tttn.TableName:='transinvdept.dbf';
      tttn.Active:=true;
      //tTTN.CommandText := 'select * from "' + edPath.Text + '\transinvdept.dbf"';
      //tTTN.Open;
      tTTNspecs.CommandText := 'select * from "' + edPath.Text + '\transinvdeptspecs.dbf"';
      tTTNspecs.Open;
    End;
End;

Procedure TfrmTTNDKos.FormCreate(Sender: TObject);
Begin
  WriteEvent('Форма открыта');
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.LogOn;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmTTNDKos.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  adoMain.Connected := False;
  WriteEvent('Форма закрыта');
  action := caFree;
End;

Procedure TfrmTTNDKos.acLoadExecute(Sender: TObject);
Begin
  If adoMain.connected Then
    LoadParus(1);
End;

Procedure TfrmTTNDKos.LoadParus(z: integer);
Var
  st2, rn_crn, sNOMpack                 : String;
  rn_sved, rn_lin, rn_lout              : String;
  ss, ss2                               : ^TOracleDataSet;
  pack                                  : double;
  tim,tim1								: string;
  k										: integer;
Begin
  rn_crn := mtecatalog.fieldbyname('RN').AsString;
  ss := @tTTN;
  ss2 := @tTTNspecs;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      WriteEvent('Загрузка в Парус ТТН №' + trim(ss^.fieldbyname('spref').AsString) + '-' + trim(ss^.fieldbyname('snumb').AsString) + ' от ' + datetostr(ss^.fieldbyname('ddocdate').AsDateTime));
      oraInvIns.ClearVariables;
      oraInvIns.SetVariable(':nCOMPANY', 2);
      oraInvIns.SetVariable(':nCRN', StrToInt(rn_crn));
      oraInvIns.SetVariable(':sJUR_PERS', trim(ss^.fieldbyname('sjur_pers').asString));
      oraInvIns.SetVariable(':sDOCTYPE', trim(ss^.fieldbyname('sDOCTYPE').asString));
      oraInvIns.SetVariable(':sPREF', trim(ss^.fieldbyname('sPREF').asString));
      oraInvIns.SetVariable(':snumb', trim(ss^.fieldbyname('snumb').asString));
      oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dDOCDATE').asDateTime));
      oraInvIns.SetVariable(':sDIRDOC', trim(ss^.fieldbyname('sDIRDOC').asString));
      oraInvIns.SetVariable(':sDIRNUMB', trim(ss^.fieldbyname('sDIRNUMB').asString));
      oraInvIns.SetVariable(':dDIRDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dDIRDATE').asDateTime));
      oraFindPack.ClearVariables; // Поиск операции в распоряжении
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ SSTOPER FROM V_SHEEPDIRSDEPT v  WHERE nrn=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('nrn_cord').asString));
      oraFindPack.Execute;
      if oraFindPack.RowCount > 0 then oraInvIns.SetVariable(':sSTOPER', trim(oraFindPack.FieldAsString('SSTOPER'))) else begin ShowMessage('Нет распоряжения'); oraFindPack.Close; exit  end;// добавлено Фроловым А.В. 15.09.2006
      oraInvIns.SetVariable(':sSTOPER', trim(oraFindPack.FieldAsString('SSTOPER')));
      oraFindPack.Close;
      oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
      oraInvIns.SetVariable(':sStore', trim(ss^.fieldbyname('sstore').asString));
      oraFindPack.ClearVariables; // Поиск МОЛ по складу
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ skeeper FROM V_DICSTORE v  WHERE trim(v.snumb)=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('sstore').asString));
      oraFindPack.Execute;
      oraInvIns.SetVariable(':sMOL', trim(oraFindPack.FieldAsString('skeeper')));
      oraFindPack.Close;
			oraFindPack.ClearVariables; // Поиск вида перевозки в распоряжении
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ sSHEEPVIEW FROM V_SHEEPDIRSDEPT v  WHERE nrn=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('nrn_cord').asString));
      oraFindPack.Execute;
      oraInvIns.SetVariable(':sSHEEPVIEW', trim(oraFindPack.FieldAsString('sSHEEPVIEW')));
      oraFindPack.Close;
      oraInvIns.SetVariable(':sCURRENCY', 'Руб.');
      oraInvIns.SetVariable(':nCURCOURS', 1);
      oraInvIns.SetVariable(':nCURBASE', 1);
      oraInvIns.SetVariable(':nSUMMWITHNDS', ss^.fieldbyname('nSUMMWITHN').asFloat);
      oraInvIns.SetVariable(':sIN_STORE', trim(ss^.fieldbyname('sIN_STORE').asString));
      oraFindPack.ClearVariables; // Поиск МОЛ по складу
      oraFindPack.SQL[0] := 'SELECT /*+ RULE */ skeeper FROM V_DICSTORE v  WHERE trim(v.snumb)=:code';
      oraFindPack.SetVariable(':code', trim(ss^.fieldbyname('sIN_STORE').asString));
      oraFindPack.Execute;
      oraInvIns.SetVariable(':sIN_MOL', trim(oraFindPack.FieldAsString('skeeper')));
      oraFindPack.Close;
      oraInvIns.SetVariable(':sIN_STOPER', trim(ss^.fieldbyname('sIN_STOPER').asString)); //? надо вытаскивать
      oraInvIns.SetVariable(':nIN_CURCOURS', 1);
      oraInvIns.SetVariable(':nIN_CURBASE', 1);
      oraInvIns.SetVariable(':nFA_CURCOURS', 1);
      oraInvIns.SetVariable(':nFA_CURBASE', 1);
      oraInvIns.SetVariable(':sFERRYMAN', trim(ss^.fieldbyname('sFERRYMAN').asString));
      if Length(ss^.fieldbyname('sCAR').asString)> 0 then
      begin
       oraFindPack.SQL[0] := 'SELECT v.SCAR_NUMBER FROM V_AGENTCARS v  WHERE upper(Replace(v.SCAR_NUMBER,'' '', '''')) = upper(Replace(:code,'' '', '''')) AND v.SAGENT_CODE= '''+trim(ss^.fieldbyname('sFERRYMAN').asString)+'''';
       oraFindPack.SetVariable(':code', UpperCase(StringReplace(ss^.fieldbyname('sCAR').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));
       oraFindPack.Execute;
       if oraFindPack.RowCount >0 then
       begin
        //oraFindPack.First;
			  oraInvIns.SetVariable(':sCAR', oraFindPack.fieldAsString('SCAR_NUMBER'));
       end
       else
       begin
        oraFindAgent.SetVariable(':code', UpperCase(trim(ss^.fieldbyname('sFERRYMAN').asString)));
        oraFindAgent.Execute;
        if oraFindAgent.RowCount >0 then
        begin
	   		 oracarins.SetVariable(':prn', oraFindAgent.getVariable(':RN'));
         oracarins.SetVariable(':sCAR_NUMBER', UpperCase(StringReplace(ss^.fieldbyname('sCAR').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));
         Try
          oracarins.Execute;
		   	  oraInvIns.SetVariable(':sCAR', UpperCase(StringReplace(ss^.fieldbyname('sCAR').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));
         Except On E: EOracleError Do
          begin
           ShowMessage(E.Message);
           WriteEvent(E.Message);
          end;
         End;
        end
        else oraInvIns.SetVariable(':sCAR', '');
       end;
      end;
      if Length(ss^.fieldbyname('SOUT_SUBDI').asString)> 0 then
      begin
      oraFindPack.SQL[0] := 'SELECT v.SCAR_NUMBER FROM V_AGENTCARS v  WHERE upper(Replace(v.SCAR_NUMBER,'' '', '''')) = upper(Replace(:code,'' '', '''')) AND v.SAGENT_CODE= '''+trim(ss^.fieldbyname('sFERRYMAN').asString)+'''';
      oraFindPack.SetVariable(':code', UpperCase(StringReplace(ss^.fieldbyname('SOUT_SUBDI').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));
      oraFindPack.Execute;
      if oraFindPack.RowCount >0 then
      begin
      //oraFindPack.First;
			oraInvIns.SetVariable(':sTRAILER1', oraFindPack.fieldAsString('SCAR_NUMBER'));
      end
      else
      begin
      oraFindAgent.SetVariable(':code', UpperCase(trim(ss^.fieldbyname('sFERRYMAN').asString)));
      oraFindAgent.Execute;
      if oraFindAgent.RowCount >0 then
       begin
	   		oracarins.SetVariable(':prn', oraFindAgent.getVariable(':RN'));
        oracarins.SetVariable(':sCAR_NUMBER', UpperCase(StringReplace(ss^.fieldbyname('SOUT_SUBDI').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));;
        try
        oracarins.Execute;
		   	oraInvIns.SetVariable(':sTRAILER1', UpperCase(StringReplace(ss^.fieldbyname('SOUT_SUBDI').asString,' ', '', [rfReplaceAll, rfIgnoreCase])));;
        Except On E: EOracleError Do
         begin
          ShowMessage(E.Message);
          WriteEvent(E.Message);
         end;
        End;
       end;
      end;
      end;
			oraInvIns.SetVariable(':sCOMMENTS', trim(ss^.fieldbyname('sCOMMENTS').asString));
      oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
      Try
        Begin //свед 1
					oraInvIns.Execute;
					WriteEvent('Заголовок загружен успешно...');
          rn_sved := oraInvIns.getVariable(':nRN');
          qInS.ClearVariables;
          qIns.SetVariable(':nDOCUMENT', ss^.fieldbyname('nrn_cord').asString);
          qins.Execute;
          rn_lin := qInS.GetVariable(':NResult');
          If rn_lin = '' Then
            Begin
              qLinkIn.ClearVariables;
              qLinkIn.SetVariable(':nCOMPANY', 2);
              qLinkIn.SetVariable(':nDOCUMENT', ss^.fieldbyname('nrn_cord').asString);
              qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
              qLinkIn.SetVariable(':sUNITCODE', 'SheepDirectToDepts');
              qLinkIn.SetVariable(':nSTATUS', 0);
              qLinkIn.SetVariable(':nBREAKUP_KIND', 0);
							qLinkIn.Execute;
              rn_lin := qLinkIn.GetVariable(':NRN');
            End;
          qLinkOut.ClearVariables;
          qLinkOut.SetVariable(':nCOMPANY', 2);
          qLinkOut.SetVariable(':nDOCUMENT', rn_sved);
          qLinkOut.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
					qLinkOut.SetVariable(':sUNITCODE', 'GoodsTransInvoicesToDepts');
          qLinkOut.SetVariable(':nSTATUS', 0);
          qLinkOut.SetVariable(':nBREAKUP_KIND', 0);
          qLinkOut.Execute;
          rn_lout := qLinkOut.GetVariable(':NRN');
          qLink.ClearVariables;
          qLink.SetVariable(':nIN_DOC', rn_lin);
          qLink.SetVariable(':nout_DOC', rn_lout);
          qLink.Execute;
					WriteEvent('Проставлены связи с распоряжением...');
//Время прибытия
					if length(trim(ss^.fieldbyname('sTRAILER1').asString))>0 then
					begin
					tim:='';
					tim1:=trim(ss^.fieldbyname('sTRAILER1').asString);
					for k:=1 to length(tim1) do
					if tim1[k]=':' then tim:=tim+'.' else tim:=tim+tim1[k];
					oraProps.ClearVariables;
					oraProps.SetVariable(':NCOMPANY', 2);
					oraProps.SetVariable(':NRN', rn_sved);
					oraProps.SetVariable(':SUNITCODE', 'GoodsTransInvoicesToDepts');
					oraProps.SetVariable(':SCODE', 'Время прибытия');
					oraProps.SetVariable(':NFORMAT', 1);
					oraProps.SetVariable(':NNUM_VALUE', trim(tim));
					Try
						Begin
							oraProps.Execute;
							WriteEvent('Время прибытия загружено...');
						End;
					Except On E: EOracleError Do
            begin
							ShowMessage(E.Message);
              WriteEvent(E.Message);
            end;
					End;
					end;
//Время убытия
					if length(trim(ss^.fieldbyname('sTRAILER2').asString))>0 then
					begin
					tim:='';
					tim1:=trim(ss^.fieldbyname('sTRAILER2').asString);
					for k:=1 to length(tim1) do
					if tim1[k]=':' then tim:=tim+'.' else tim:=tim+tim1[k];
					oraProps.ClearVariables;
					oraProps.SetVariable(':NCOMPANY', 2);
					oraProps.SetVariable(':NRN', rn_sved);
					oraProps.SetVariable(':SUNITCODE', 'GoodsTransInvoicesToDepts');
					oraProps.SetVariable(':SCODE', 'Время убытия');
					oraProps.SetVariable(':NFORMAT', 1);
					oraProps.SetVariable(':NNUM_VALUE', trim(tim));
					Try
						Begin
							oraProps.Execute;
							WriteEvent('Время убытия загружено...');
						End;
					Except On E: EOracleError Do
            begin
							ShowMessage(E.Message);
              WriteEvent(E.Message);
            end;
					End;
					end;
				End; //закончили проставлять связи
        // Спецификация
        ss2^.First;
        While Not ss2^.Eof Do
          Begin
            oraInvsIns.ClearVariables;
            oraInvsIns.SetVariable(':nCOMPANY', 2);
            oraInvsIns.SetVariable(':nPRN', rn_sved);
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
            oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss2^.fieldbyname('nSUMMWITHN').asFloat)));
            If ss2^.fieldbyname('nQUANT').asFloat / ss2^.fieldbyname('nQUANTALT').asFloat > 10 Then
              oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss2^.fieldbyname('nQUANTALT').asFloat * 1000)))
            Else
              oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss2^.fieldbyname('nQUANTALT').asFloat)));
            If ss2^.fieldbyname('nQUANTALT').asFloat / ss2^.fieldbyname('nQUANT').asFloat > 10 Then
              oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss2^.fieldbyname('nQUANT').asFloat * 1000)))
            Else
              oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss2^.fieldbyname('nQUANT').asFloat)));
            oraInvsIns.SetVariable(':nPRICEMEAS', trim(ss2^.fieldbyname('nPRICEMEAS').asString));
            oraInvsIns.SetVariable(':sNOTE', trim(ss2^.fieldbyname('sNOTE').asString));
            if (trim(ss2^.fieldbyname('sGOODSPART').asString)<>'') and (trim(ss2^.fieldbyname('sGOODSPART').asString)<>'ФИКТ')
            and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'+') and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'-')
            and (leftstr(trim(ss2^.fieldbyname('sGOODSPART').asString),1)<>'0') then
            oraInvsIns.SetVariable(':sGOODSPARTY', '');  //trim(ss2^.fieldbyname('sGOODSPART').asString)
            Try //свед 2
              Begin
                oraInvsIns.Execute;
                WriteEvent('Спецификация загружена успешно...');
                WriteEvent('ТТН на отпуск в подразделение сформирована успешно!');
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
        begin
          ShowMessage(E.Message);
          WriteEvent(E.Message);
        end;
      End; //    свед 1
      oraInvIns.Session.Commit;
      ss^.Next;
    End;
End;

Procedure TfrmTTNDKos.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then node.ImageIndex := 3;
End;

procedure TfrmTTNdKos.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
