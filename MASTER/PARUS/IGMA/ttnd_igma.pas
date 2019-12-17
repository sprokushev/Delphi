Unit ttnd_igma;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, OracleData, Oracle, StdCtrls,
  ExtCtrls, Mask, ToolEdit, Buttons, Grids, DBGridEh, ActnList,
  XPStyleActnCtrls, ActnMan, ADODB, StrUtils, DateUtils, PropStorageEh,
  QExport3, QExport3DBF, PropFilerEh, GridsEh;

Type
  TfrmIgmaTTND = Class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    mLog: TMemo;
    oraParus: TOracleSession;
    Panel2: TPanel;
    Splitter2: TSplitter;
    grCord: TDBGridEh;
    grCords: TDBGridEh;
    Splitter3: TSplitter;
    ActionManager1: TActionManager;
    acFilter: TAction;
    edPath: TDirectoryEdit;
    acLoad: TAction;
    adoConn: TADOConnection;
    Label1: TLabel;
    oraAgnFiFo: TOracleDataSet;
    oraAgnFaceAcc: TOracleDataSet;
    BitBtn3: TBitBtn;
    acSpr: TAction;
    acSend: TAction;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    GroupBox2: TGroupBox;
    cbRec: TComboBox;
    BitBtn4: TBitBtn;
    oraNomen: TOracleDataSet;
    docsFull: TOracleDataSet;
    specFull: TOracleDataSet;
    Query1: TADOQuery;
    SetTTNExport: TOracleQuery;
    dsdocs: TDataSource;
    dsSpecs: TDataSource;
    rbIgma: TRadioButton;
    rbKos: TRadioButton;
    rbUC: TRadioButton;
    ex: TQExport3DBF;
    docsFullNRN: TFloatField;
    docsFullNCOMPANY: TFloatField;
    docsFullNCRN: TFloatField;
    docsFullNJUR_PERS: TFloatField;
    docsFullSJUR_PERS: TStringField;
    docsFullSDOCTYPE: TStringField;
    docsFullSPREF: TStringField;
    docsFullSPREF_LTRIM: TStringField;
    docsFullSNUMB: TStringField;
    docsFullSNUMB_LTRIM: TStringField;
    docsFullDDOCDATE: TDateTimeField;
    docsFullNSTATUS: TIntegerField;
    docsFullNIN_STATUS: TIntegerField;
    docsFullDWORK_DATE: TDateTimeField;
    docsFullDIN_WORK_DATE: TDateTimeField;
    docsFullDRESERVDATE: TDateTimeField;
    docsFullSDIRDOC: TStringField;
    docsFullSDIRNUMB: TStringField;
    docsFullDDIRDATE: TDateTimeField;
    docsFullSSTOPER: TStringField;
    docsFullSFACEACC: TStringField;
    docsFullNGRAPHPOINT: TFloatField;
    docsFullSGRAPHPOINT: TStringField;
    docsFullNFACEACCCRN: TFloatField;
    docsFullSFACC_CURRENCY: TStringField;
    docsFullSSTORE: TStringField;
    docsFullNSTORECRN: TFloatField;
    docsFullSMOL: TStringField;
    docsFullSSHEEPVIEW: TStringField;
    docsFullSSUBDIV: TStringField;
    docsFullSCURRENCY: TStringField;
    docsFullNCURCOURS: TFloatField;
    docsFullNCURBASE: TFloatField;
    docsFullNSUMMWITHNDS: TFloatField;
    docsFullNFA_CURCOURS: TFloatField;
    docsFullNFA_CURBASE: TFloatField;
    docsFullSRECIPDOC: TStringField;
    docsFullSRECIPNUMB: TStringField;
    docsFullDRECIPDATE: TDateTimeField;
    docsFullSFERRYMAN: TStringField;
    docsFullNFERRYMAN: TFloatField;
    docsFullSGETCONFIRM: TStringField;
    docsFullSWAYBLADENUMB: TStringField;
    docsFullSDRIVER: TStringField;
    docsFullNDRIVER: TFloatField;
    docsFullSCAR: TStringField;
    docsFullNCAR: TFloatField;
    docsFullSROUTE: TStringField;
    docsFullNROUTE: TFloatField;
    docsFullSTRAILER1: TStringField;
    docsFullNTRAILER1: TFloatField;
    docsFullSTRAILER2: TStringField;
    docsFullNTRAILER2: TFloatField;
    docsFullSIN_STORE: TStringField;
    docsFullNIN_STORECRN: TFloatField;
    docsFullSIN_MOL: TStringField;
    docsFullSIN_STOPER: TStringField;
    docsFullNIN_CURCOURS: TFloatField;
    docsFullNIN_CURBASE: TFloatField;
    docsFullSIN_CURRENCY: TStringField;
    docsFullNVALID_DOCTYPE: TFloatField;
    docsFullSVALID_DOCTYPE: TStringField;
    docsFullSVALID_DOCNUMB: TStringField;
    docsFullDVALID_DOCDATE: TDateTimeField;
    docsFullSCOMMENTS: TStringField;
    docsFullNDOCTYPE: TFloatField;
    docsFullNSTORE: TFloatField;
    docsFullNIN_STORE: TFloatField;
    docsFullNFACEACC: TFloatField;
    docsFullNSTOPER: TFloatField;
    docsFullNSHEEPVIEW: TFloatField;
    docsFullNSUBDIV: TFloatField;
    docsFullNCURRENCY: TFloatField;
    docsFullSOUT_SUBDIV: TStringField;
    docsFullNSTPL_PROCESSED: TFloatField;
    docsFullDTRREP_DATE: TDateTimeField;
    docsFullDINDOC_DATE: TDateTimeField;
    docsFullDOUTDOC_DATE: TDateTimeField;
    docsFullDINVC_DATE: TDateTimeField;
    docsFullEXP: TFloatField;
    specFullNRN: TFloatField;
    specFullNCOMPANY: TFloatField;
    specFullNCRN: TFloatField;
    specFullNPRN: TFloatField;
    specFullNNOMEN: TFloatField;
    specFullNNOMENCRN: TFloatField;
    specFullSNOMEN: TStringField;
    specFullSNOMENNAME: TStringField;
    specFullNNOMEN_TYPE: TFloatField;
    specFullNNOMMODIF: TFloatField;
    specFullSNOMMODIF: TStringField;
    specFullSNOMMODIFNAME: TStringField;
    specFullNNOMNMODIFPACK: TFloatField;
    specFullSNOMNMODIFPACK: TStringField;
    specFullSNOMNMODIFPACKNAME: TStringField;
    specFullNNOMGROUP: TFloatField;
    specFullNARTICLE: TFloatField;
    specFullSARTICLE: TStringField;
    specFullSARTICLENAME: TStringField;
    specFullNCELL: TFloatField;
    specFullSCELL: TStringField;
    specFullNPACK_QUANT: TFloatField;
    specFullNPARTY: TFloatField;
    specFullSGOODSPARTY: TStringField;
    specFullSSERNUMB: TStringField;
    specFullNCOUNTRY: TFloatField;
    specFullSCOUNTRY: TStringField;
    specFullSGTD: TStringField;
    specFullNPRODUCER: TFloatField;
    specFullSPRODUCER: TStringField;
    specFullDEXPIRY_DATE: TDateTimeField;
    specFullSCERTIFICATE: TStringField;
    specFullNPRICE: TFloatField;
    specFullNQUANT: TFloatField;
    specFullNQUANTALT: TFloatField;
    specFullNQUANT_WEIGHT: TFloatField;
    specFullNQUANT_VOLUME: TFloatField;
    specFullNDENSITY: TFloatField;
    specFullNPRICEMEAS: TIntegerField;
    specFullNSUMMWITHNDS: TFloatField;
    specFullDBEGINDATE: TDateTimeField;
    specFullDENDDATE: TDateTimeField;
    specFullNMEAS_MAIN: TFloatField;
    specFullSMEAS_MAIN: TStringField;
    specFullNM_MEAS_CATEGORY: TFloatField;
    specFullNMEAS_ALT: TFloatField;
    specFullSMEAS_ALT: TStringField;
    specFullNMEAS_PACK: TFloatField;
    specFullSMEAS_PACK: TStringField;
    specFullSMEAS_VIEW: TStringField;
    specFullSNOTE: TStringField;
    specFullNEQUAL: TFloatField;
    specFullNWEIGHT: TFloatField;
    specFullNMU_WEIGHT: TFloatField;
    specFullNWIDTH: TFloatField;
    specFullNHEIGHT: TFloatField;
    specFullNLENGTH: TFloatField;
    specFullNMU_SIZE: TFloatField;
    specFullNPRIC_REAL: TFloatField;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure unLoad();
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure acLoadExecute(Sender: TObject);
    Function DateToStr(d1: TDateTime): String;
    Procedure acSprExecute(Sender: TObject);
    Procedure acSendExecute(Sender: TObject);
    Procedure SaveSpecToDBF(rn: integer);
    Function toDos(str: String): String;
    Procedure SaveDeptToDBF();
    { Private declarations }
  public
    NewCatalog: integer;
    { Public declarations }
  End;

Var
  frmIgmaTTND                           : TfrmIgmaTTND;

Implementation

Uses MAIN;

{$R *.dfm}

Function TfrmIgmaTTND.DateToStr(d1: TDateTime): String;
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

Procedure TfrmIgmaTTND.acFilterExecute(Sender: TObject);
Begin
  //tvCatalog.UpdateCursorPos;
  If specFull.Active Then
    specFull.Close;
  If docsFull.Active Then
    docsFull.Close;
  docsFull.SQL[4] := 'and v.ddocdate between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  docsFull.SQL[5] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  docsFull.SQL[7] := 'and v.nstatus=1';
  //docsFull.SQL[5]:='and v_transinvdept.ncrn='+tvCatalog.FieldID.AsString;
  If rbIgma.Checked Then
    docsFull.SQL[6] := 'AND ((SIN_STORE LIKE ''%039ф%'') OR (SIN_STORE LIKE ''%040ф%'') OR (SIN_STORE LIKE ''%044ф%''))';
  If rbKos.Checked Then
		docsFull.SQL[6] := 'AND ((SIN_STORE LIKE ''%037ф%'') OR (SIN_STORE LIKE ''%70%''))';
  If rbUC.Checked Then
    docsFull.SQL[6] := 'AND ((SIN_STORE LIKE ''%023ф%'') OR (SIN_STORE LIKE ''%802%''))';
  docsFull.Open;
  specFull.Open;
  If edPath.Text <> '' Then
    Begin
      If adoConn.Connected Then
        adoConn.Connected := false;
      adoConn.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoConn.Connected := true;
    End;
End;

Procedure TfrmIgmaTTND.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.LogOn;
  //oraParus.Connected:=true;
  //oraCatalog.Open;
  docsFull.SQL[4] := 'and v.ddocdate between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  docsFull.SQL[5] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  //oraCord.SQL[21]:='and v_consumerord.nord_state=1';
  //docsFull.Open;
  //specFull.Open;
End;

Procedure TfrmIgmaTTND.UnLoad();
Var
  Src, Dst                              : String[255];
  vrem                                  : String;
  fileName                              : String;
Begin

  fileName := edPath.Text + '\' + 'trdept.dbf';
  If fileExists(fileName) Then
    DeleteFile(pchar(fileName));
  vrem := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';

  adoConn.ConnectionString := vrem;
  adoConn.Connected := true;
  Query1.SQL.Clear;
  vrem := Trim(ChangeFileExt(extractfilename(fileName), ' '));
  //  query1.sql.Add('CREATE TABLE '+vrem+' (');
  query1.sql.Add('CREATE TABLE trdept (');
  query1.sql.Add('NRN         n(20, 4),');
  query1.sql.Add('SDOCTYPE    c(10),');
  query1.sql.Add('SPREF       c(10),');
  query1.sql.Add('SNUMB       c(10),');
  query1.sql.Add('DDOCDATE    d,');
  query1.sql.Add('NSTATUS     n(20, 4),');
  query1.sql.Add('NIN_STATUS  n(20, 4),');
  query1.sql.Add('DWORK_DATE  d,');
  query1.sql.Add('DIN_WORK_D  d,');
  query1.sql.Add('SDIRDOC     c(10),');
  query1.sql.Add('SDIRNUMB    c(20),');
  query1.sql.Add('DDIRDATE    d,');
  query1.sql.Add('SSTOPER     c(20),');
  query1.sql.Add('SFACEACC    c(20),');
  query1.sql.Add('SFACC_CURR  c(10),');
  query1.sql.Add('SSTORE      c(20),');
  query1.sql.Add('SMOL        c(20),');
  query1.sql.Add('SSHEEPVIEW  c(20),');
  query1.sql.Add('SSUBDIV     c(20),');
  query1.sql.Add('SCURRENCY   c(10),');
  query1.sql.Add('NCURCOURS   n(20, 4),');
  query1.sql.Add('NCURBASE    n(20, 4),');
  query1.sql.Add('NSUMMWITHN  n(20, 4),');
  query1.sql.Add('NFA_CURCOU  n(20, 4),');
  query1.sql.Add('NFA_CURBAS  n(20, 4),');
  query1.sql.Add('SRECIPDOC   c(10),');
  query1.sql.Add('SRECIPNUMB  c(20),');
  query1.sql.Add('DRECIPDATE  d,');
  query1.sql.Add('SFERRYMAN   c(20),');
  query1.sql.Add('SGETCONFIR  c(80),');
  query1.sql.Add('SWAYBLADEN  c(20),');
  query1.sql.Add('SDRIVER     c(20),');
  query1.sql.Add('SCAR        c(20),');
  query1.sql.Add('SROUTE      c(10),');
  query1.sql.Add('STRAILER1   c(20),');
  query1.sql.Add('STRAILER2   c(20),');
  query1.sql.Add('SIN_STORE   c(20),');
  query1.sql.Add('SIN_MOL     c(20),');
  query1.sql.Add('SIN_STOPER  c(20),');
  query1.sql.Add('NIN_CURCOU  n(20, 4),');
  query1.sql.Add('NIN_CURBAS  n(20, 4),');
  query1.sql.Add('SIN_CURREN  c(10),');
  query1.sql.Add('SCOMMENTS   c(160),');
  query1.sql.Add('SOUT_SUBDI  c(20),');
  query1.sql.Add('SVDOCTYPE   c(10),');
  query1.sql.Add('SVDOCNUMB   c(20),');
  query1.sql.Add('DVDOCDATE   d,');
  query1.sql.Add('SGRAPHP     c(20),');
  query1.sql.Add('SJUR_PERS   c(20))');
  //  query1.sql.SaveToFile('d:\11.txt');
  query1.ExecSQL;
  query1.close;

  fileName := edPath.Text + '\' + 'trdepts.dbf';
  If fileExists(fileName) Then
    DeleteFile(pchar(fileName));

  query1.paramcheck := false;
  Query1.SQL.Clear;
  vrem := Trim(ChangeFileExt(extractfilename(fileName), ' '));
  //  query1.sql.Add('CREATE TABLE '+vrem+' (');
  query1.sql.Add('CREATE TABLE trdepts (');
  query1.sql.Add('NRN n(20, 4),');
  query1.sql.Add('NPRN n(20, 4),');
  query1.sql.Add('SNOMEN c(20),');
  query1.sql.Add('NNOMEN_TYP n(20, 4),');
  query1.sql.Add('SNOMMODIF c(20),');
  query1.sql.Add('SNOMPACK c(20),');
  query1.sql.Add('NPACK_QUAN n(20, 4),');
  query1.sql.Add('NPARTY n(20, 4),');
  query1.sql.Add('SGOODSPART c(20),');
  query1.sql.Add('SSERNUMB c(20),');
  query1.sql.Add('SCOUNTRY c(40),');
  query1.sql.Add('SGTD c(40),');
  query1.sql.Add('NPRICE n(20, 4),');
  query1.sql.Add('NQUANT n(20, 4),');
  query1.sql.Add('NQUANTALT n(20, 4),');
  query1.sql.Add('NPRICEMEAS n(20, 4),');
  query1.sql.Add('NSUMMWITHN n(20, 4),');
  query1.sql.Add('DBEGINDATE d,');
  query1.sql.Add('DENDDATE d,');
  query1.sql.Add('SMEAS_MAIN c(10),');
  query1.sql.Add('SMEAS_ALT c(10),');
  query1.sql.Add('SMEAS_PACK c(10),');
  query1.sql.Add('SARTICLE c(20),');
  query1.sql.Add('SNOTE c(240));'); //NUMERIC
  query1.ExecSQL;
  query1.close;
  SaveDeptToDBF();
End;

Procedure TfrmIgmaTTND.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  //oraCatalog.Close;
  oraParus.Connected := false;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP Request for consummers Pechora';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmIgmaTTND.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

Procedure TfrmIgmaTTND.acLoadExecute(Sender: TObject);
Begin
  If adoConn.Connected Then
  if MessageDlg('Выгрузить данные для отправки?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    unload;
End;

Procedure TfrmIgmaTTND.acSprExecute(Sender: TObject);
Var
  iFileHandle                           : Integer;
  s                                     : char;
Begin
  oraagnfifo.Open;
  ex.DataSet := oraagnfifo;
  ex.FileName := edPath.Text + '\aFiFo_im.dbf';
  ex.Execute;
  oraagnfifo.Close;
  oraAgnFaceAcc.Open;
  ex.DataSet := oraAgnFaceAcc;
  ex.FileName := edPath.Text + '\aFace_im.dbf';
  ex.Execute;
  oraAgnFaceAcc.Close;
  oraNomen.Open;
  ex.DataSet := oraNomen;
  ex.FileName := edPath.Text + '\nom_imp.dbf';
  ex.Execute;
  oraNomen.Close;
  //процедура смены кодовой страницы
  s := chr(201); //кодовая страница 1251 для foxpro
  iFileHandle := FileOpen(edPath.Text + '\aFiFo_im.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  iFileHandle := FileOpen(edPath.Text + '\aFace_im.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  iFileHandle := FileOpen(edPath.Text + '\nom_imp.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  mlog.Lines.Add('Выгружены справочники.');
End;

Procedure TfrmIgmaTTND.acSendExecute(Sender: TObject);
Begin
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Recipients.EMailAddresses := cbRec.Text;
      Subject := 'LUK-SNP (Request for Consumers)';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
End;

Procedure TfrmIgmaTTND.SaveDeptToDBF();
//сохранить ттн в dbf
Var
  i, j                                  : integer;
  dt                                    : TFieldType;
  fileName                              : String;
  s                                     : String;
  v                                     : variant;
Begin
  fileName := edPath.Text + '\' + 'trdept.dbf';
  query1.paramcheck := false;
  //идем по накладным
  ShortDateFormat := 'dd.mm.yyyy';
  docsFull.First;
  While Not docsFull.Eof Do
    Begin
      mlog.Lines.Add('Выгружены ТТН №' + trim(docsFull.FieldByName('spref').AsString) + '-' + trim(docsFull.FieldByName('snumb').AsString) + ' от ' + trim(docsFull.FieldByName('ddocdate').AsString));
      Query1.SQL.Clear;
      Query1.SQL.Add('insert into trdept (NRN, SDOCTYPE, spref, snumb, ddocdate, nstatus, nin_status, ');
      Query1.SQL.Add('DWORK_DATE, DIN_WORK_D, sdirdoc, sdirnumb, ddirdate, sstoper, ');
      Query1.SQL.Add('sfaceacc, sfacc_curr, sstore, smol, ssheepview, scurrency, ');
      Query1.SQL.Add('ssubdiv, ncurcours, ncurbase, nsummwithn, nfa_curcou, nfa_curbas, ');
      Query1.SQL.Add('srecipdoc, srecipnumb, drecipdate, sferryman, sgetconfir, swaybladen, ');
      Query1.SQL.Add('sdriver, scar, sroute, strailer1, strailer2, sin_store, ');
      Query1.SQL.Add('sin_mol, sin_stoper, nin_curcou, nin_curbas, sin_curren, scomments, sout_subdi, ');
      Query1.SQL.Add('svdoctype, svdocnumb, dvdocdate, sgraphp, sjur_pers');
      Query1.SQL.Add(' ) values(');
      Query1.SQL.Add(IntToStr(docsFull.FieldValues['nrn']) + ', ');
      Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sdoctype']) + '", ');
      Query1.SQL.Add('"' + toDos(docsFull.FieldValues['spref']) + '", ');
      Query1.SQL.Add('"' + toDos(docsFull.FieldValues['snumb']) + '", ');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('ddocdate').AsDateTime) + '"),');
      Query1.SQL.Add(IntToStr(docsFull.FieldValues['nstatus']) + ', ');
      Query1.SQL.Add(IntToStr(docsFull.FieldValues['nin_status']) + ', ');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('dwork_date').AsDateTime) + '"),');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('dIN_Work_date').AsDateTime) + '"),');
      If docsFull.FieldByName('sdirdoc').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sdirdoc']) + '", ');
      If docsFull.FieldByName('sdirnumb').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sdirnumb']) + '", ');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('ddirdate').AsDateTime) + '"),');
      Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sstoper']) + '", ');
      If docsFull.FieldByName('sfaceAcc').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + DateToStr(docsFull.FieldValues['cFaceAcc']) + '", ');
      If docsFull.FieldByName('sfacc_currency').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sfacc_currency']) + '",');
      If docsFull.FieldByName('sstore').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sstore']) + '",');
      If docsFull.FieldByName('smol').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['smol']) + '", ');
      If docsFull.FieldByName('ssheepview').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['ssheepview']) + '", ');
      If docsFull.FieldByName('scurrency').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['scurrency']) + '", ');
      If docsFull.FieldByName('ssubdiv').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['ssubdiv']) + '", ');
      Query1.SQL.Add(IntToStr(docsFull.FieldValues['ncurcours']) + ', ');
      Query1.SQL.Add(FloatToStr(docsFull.FieldValues['ncurBase']) + ', ');
      If docsFull.FieldByName('nsummwithnds').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add(FloatToStr(docsFull.FieldValues['nsummwithnds']) + ', ');

      If docsFull.FieldByName('nfa_curcours').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add(FloatToStr(docsFull.FieldValues['nfa_curcours']) + ', ');

      If docsFull.FieldByName('nfa_curbase').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add(FloatToStr(docsFull.FieldValues['nfa_curbase']) + ', ');

      If docsFull.FieldByName('srecipdoc').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['srecipdoc']) + '", ');

      If docsFull.FieldByName('srecipnumb').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['srecipnumb']) + '", ');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('drecipdate').AsDateTime) + '"),');

      If docsFull.FieldByName('sferryman').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sferryman']) + '", ');

      If docsFull.FieldByName('sgetconfirm').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sgetconfirm']) + '", ');

      If docsFull.FieldByName('swaybladenumb').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['swaybladenumb']) + '", ');

      If docsFull.FieldByName('sdriver').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sdriver']) + '", ');

      If docsFull.FieldByName('scar').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['scar']) + '", ');

      If docsFull.FieldByName('sroute').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sroute']) + '", ');

      If docsFull.FieldByName('strailer1').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['strailer1']) + ''', ');

      If docsFull.FieldByName('strailer2').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['strailer2']) + '", ');

      If docsFull.FieldByName('sin_store').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sin_Store']) + '", ');

      If docsFull.FieldByName('sin_mol').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sin_mol']) + '", ');

      If docsFull.FieldByName('sin_stoper').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sin_Stoper']) + '", ');

      If docsFull.FieldByName('nin_curcours').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add(FloatToStr(docsFull.FieldValues['nin_curcours']) + ', ');

      If docsFull.FieldByName('nin_curbase').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add(FloatToStr(docsFull.FieldValues['nin_curbase']) + ', ');

      If docsFull.FieldByName('sin_currency').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sin_currency']) + '", ');

      If docsFull.FieldByName('scomments').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['scomments']) + '", ');

      If docsFull.FieldByName('sout_subdiv').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sout_subdiv']) + '", ');

      If docsFull.FieldByName('svalid_doctype').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['svalid_doctype']) + '", ');

      If docsFull.FieldByName('svalid_docnumb').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['svalid_docnumb']) + '", ');
      Query1.sql.Add('ctod("' + DateToStr(docsFull.fieldbyname('dvalid_docdate').AsDateTime) + '"),');

      If docsFull.FieldByName('sgraphpoint').IsNull Then
        Query1.SQL.Add('null, ')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sgraphpoint']) + '", ');

      If docsFull.FieldByName('sjur_pers').IsNull Then
        Query1.SQL.Add('null')
      Else
        Query1.SQL.Add('"' + toDos(docsFull.FieldValues['sjur_pers']) + '"');

      Query1.SQL.Add(')');
      Query1.ExecSQL;
      Query1.Close;

      //теперь заносим специфик. по этому документу
      SaveSpecToDBF(docsFull.FieldValues['nrn']);

      SetTTNExport.Close;
      SetTTNExport.SetVariable(0, docsFull.FieldValues['nrn']);
      SetTTNExport.SetVariable(2, 1);
      SetTTNExport.Execute;
      mlog.Lines.Add('ТТН выгружена');
      docsFull.Next;
    End;
End;

Function TfrmIgmaTTND.toDos(str: String): String;
Var
  res                                   : String;
Begin
  res := str;
  //  CharToOem(PChar(res), PChar(res));
  //  res := AnsiReplaceStr(res, '"', '''');
  res := trim(res);
  toDos := res;
End;

Procedure TfrmIgmaTTND.SaveSpecToDBF(rn: integer);
Begin
  specFull.Close;
  specFull.SetVariable(0, rn);
  specFull.Open;

  While Not specFull.Eof Do
    Begin
      With query1.SQL Do
        Begin
          clear;
          Add('insert into trdepts(nrn, nprn, snomen, nnomen_typ, ');
          Add('snommodif, snompack, npack_quan, nparty, sgoodspart, ');
          Add('ssernumb, scountry, sgtd, nprice, nquant, nquantalt, npricemeas, ');
          Add('nsummwithn, dbegindate, denddate, smeas_main, smeas_alt, smeas_pack, sarticle, snote');
          Add(') ');
          Add('values(');
          Add(IntToStr(specFull.FieldValues['nrn']) + ', ');
          Add(intToStr(specFull.FieldValues['nprn']) + ', ');
          //      Add('"' + toDos(specFull.FieldValues['snomen']) + '", ');
          Add('''' + toDos(specFull.FieldValues['snomen']) + ''', ');
          Add(FloatToStr(specFull.FieldValues['nnomen_type']) + ', ');
          If specFull.FieldByName('snommodif').IsNull Then
            Add('null, ')
          Else
            //        Add('"' + toDos(specFull.FieldValues['snommodif']) + '", ');
            Add('''' + toDos(specFull.FieldValues['snommodif']) + ''', ');
          If specFull.FieldByName('snomnmodifpackname').IsNull Then
            Add('null, ')
          Else
            Add('''' + toDos(specFull.FieldValues['snomnmodifpackname']) + ''', ');
          //        Add('"' + toDos(specFull.FieldValues['snomnmodifpackname']) + '", ');
          If specFull.FieldByName('npack_quant').IsNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['npack_quant']) + ', ');
          If specFull.FieldByName('nparty').isNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['nparty']) + ', ');
          If specFull.FieldByName('sgoodsparty').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['sgoodsparty']) + '", ');
          If specFull.FieldByName('ssernumb').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['ssernumb']) + '", ');
          If specFull.FieldByName('scountry').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['scountry']) + '", ');
          If specFull.FieldByName('sgtd').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['sgtd']) + '", ');
          If specFull.FieldByName('nprice').isNull Then
            Add('null, ')
          Else
            If specFull.FieldByName('npricemeas').AsInteger = 2 Then //фасовка
              If specFull.FieldValues['nquantAlt'] <> 0 Then // в штуках ?
                Add(FloatToStr(specFull.FieldValues['nsummwithnds'] / specFull.FieldValues['nquantAlt']) + ', ') // нет
              Else
                Add(FloatToStr(specFull.FieldValues['nsummwithnds'] / specFull.FieldValues['nquant']) + ', ') // только штуки!
            Else
              Add(FloatToStr(specFull.FieldValues['nprice']) + ', '); // не фасовка
          If specFull.FieldByName('nquant').isNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['nquant']) + ', ');
          If specFull.FieldByName('nquantAlt').isNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['nquantalt']) + ', ');
          If specFull.FieldByName('npricemeas').isNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['npricemeas']) + ', ');
          If specFull.FieldByName('nsummwithnds').isNull Then
            Add('null, ')
          Else
            Add(FloatToStr(specFull.FieldValues['nsummwithnds']) + ', ');
          Query1.sql.Add('ctod("' + DateToStr(specFull.fieldbyname('dbegindate').AsDateTime) + '"),');
          Query1.sql.Add('ctod("' + DateToStr(specFull.fieldbyname('denddate').AsDateTime) + '"),');
          If specFull.FieldByName('smeas_main').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['smeas_main']) + '", ');
          If specFull.FieldByName('smeas_alt').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['smeas_alt']) + '", ');
          If specFull.FieldByName('smeas_pack').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['smeas_pack']) + '", ');
          If specFull.FieldByName('sarticle').IsNull Then
            Add('null, ')
          Else
            Add('"' + toDos(specFull.FieldValues['sarticle']) + '", ');
          If specFull.FieldByName('snote').IsNull Then
            Add('null')
          Else
            Add('"' + toDos(specFull.FieldValues['snote']) + '"');

          Add(')');
        End;
      query1.ExecSQL;
      query1.Close;
      specFull.Next;
    End;
End;

End.
