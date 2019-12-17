Unit cord_igma;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, OracleData, Oracle, StdCtrls,
  ExtCtrls, Mask, ToolEdit, Buttons, Grids, DBGridEh, ActnList,
  XPStyleActnCtrls, ActnMan, ADODB, StrUtils, DateUtils, PropStorageEh, QExport3, QExport3DBF,
  PropFilerEh, MemTableDataEh, DataDriverEh, MemTableEh, GridsEh;

Type
  TfrmIgmaCord = Class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    mLog: TMemo;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    Panel2: TPanel;
    Splitter2: TSplitter;
    grCord: TDBGridEh;
    grCords: TDBGridEh;
    Splitter3: TSplitter;
    oraCord: TOracleDataSet;
    oraCords: TOracleDataSet;
    dsCord: TDataSource;
    dsCords: TDataSource;
    ActionManager1: TActionManager;
    acFilter: TAction;
    edPath: TDirectoryEdit;
    adoCordIns: TADOQuery;
    adoCordsIns: TADOQuery;
    acLoad: TAction;
    adoConn: TADOConnection;
    oraMove: TOracleQuery;
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
    oraCars: TOracleDataSet;
    ex: TQExport3DBF;
    oraCordNRN: TFloatField;
    oraCordSORD_DOCTYPE: TStringField;
    oraCordSORD_PREF: TStringField;
    oraCordSORD_NUMB: TStringField;
    oraCordSAGENT: TStringField;
    oraCordSFACEACC: TStringField;
    oraCordSGRAPHPOINT: TStringField;
    oraCordSCON_DOCTYPE: TStringField;
    oraCordSCON_DOCPREF: TStringField;
    oraCordSCON_DOCNUMB: TStringField;
    oraCordDCON_DOCDATE: TFloatField;
    oraCordDORD_DATE: TDateTimeField;
    oraCordNORD_STATE: TIntegerField;
    oraCordDSTATE_DATE: TDateTimeField;
    oraCordSDISP_TYPE: TStringField;
    oraCordSPAY_TYPE: TStringField;
    oraCordSTARIF: TStringField;
    oraCordSCURRENCY: TStringField;
    oraCordSSTORE: TStringField;
    oraCordSACC_AGENT: TStringField;
    oraCordSSUBDIV: TStringField;
    oraCordDPAY_DATE: TFloatField;
    oraCordDRELEASE_DATE: TFloatField;
    oraCordDPRICE_DATE: TFloatField;
    oraCordNORD_PERIOD: TFloatField;
    oraCordNPERIOD_CORR: TFloatField;
    oraCordNPERIOD_QUANT: TFloatField;
    oraCordNPERIOD_TYPE: TFloatField;
    oraCordNPERIOD_LEN: TFloatField;
    oraCordNATSAMETIME: TFloatField;
    oraCordNPRICE_TYPE: TFloatField;
    oraCordNREDUCTION: TFloatField;
    oraCordSNOTE: TStringField;
    oraCordSAGNFI: TStringField;
    oraCordNPSUMWOTAX: TFloatField;
    oraCordNPSUMWTAX: TFloatField;
    oraCordSJUR_PERS: TStringField;
    Query1: TADOQuery;
    oraCord1: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField2: TFloatField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    DateTimeField2: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField19: TStringField;
    cordForDbf: TOracleDataSet;
    cordsForDBF: TOracleDataSet;
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
    Procedure unLoad();
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure acLoadExecute(Sender: TObject);
    Function DateToStr(d1: TDateTime): String;
    Procedure acSprExecute(Sender: TObject);
    Procedure acSendExecute(Sender: TObject);
    procedure mteCatalogAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    NewCatalog: integer;
    { Public declarations }
  End;

Var
  frmIgmaCord                           : TfrmIgmaCord;

Implementation

Uses MAIN;

{$R *.dfm}

Function TfrmIgmaCord.DateToStr(d1: TDateTime): String;
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

Procedure TfrmIgmaCord.acFilterExecute(Sender: TObject);
Begin
  If oraCords.Active Then
    oraCords.Close;
  If oraCord.Active Then
    oraCord.Close;
  oraCord.SQL[13] := 'and v.DDOCDATE between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[14] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  if bitbtn2.Enabled then
  oraCord.SQL[15] := 'and v.nstatus=1'
  else oraCord.SQL[15] := '';
  oraCord.SQL[16] := 'and v.ncrn=' + mtecatalog.fieldbyname('RN').asstring;
  oraCord.Open;
  oraCords.Open;
  If edPath.Text <> '' Then
    Begin
      If adoConn.Connected Then
        adoConn.Connected := false;
      adoConn.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoConn.Connected := true;
    End;
End;

Procedure TfrmIgmaCord.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraCatalog.Open;
  mteCatalog.Open;
  oraCord.SQL[13] := 'and v.DDOCDATE between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[14] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[15] := 'and v.nstatus=1';
  oraCord.Open;
  oraCords.Open;
End;

Procedure TfrmIgmaCord.UnLoad();
Var
  Src, Dst                              : String[255];
  vrem                                  : String;
  fileName                              : String;
Begin

{  fileName := edPath.Text + '\' + 'trdept.dbf';
  If fileExists(fileName) Then
    DeleteFile(pchar(fileName));
  Query1.SQL.Clear;
  query1.sql.Add('CREATE TABLE cord (');
  query1.sql.Add('NRN         n(20),');
  query1.sql.Add('NStatus     n(1),');
  query1.sql.Add('SDOCTYPE    c(10),');
  query1.sql.Add('SPREF       c(10),');
  query1.sql.Add('SNUMB       c(10),');
  query1.sql.Add('DDOCDATE    d,');
  query1.sql.Add('SSTORE      c(20),');
  query1.sql.Add('SSTORE_n      c(100),');
  query1.sql.Add('SFACEACC    c(20),');
  query1.sql.Add('V_DTYPE    c(20),');
  query1.sql.Add('V_DNUMB    c(20),');
  query1.sql.Add('V_DDATE    d,');
  query1.sql.Add('agnidnumb    c(20),');
  query1.sql.Add('SAGENT    c(20),');
  query1.sql.Add('SAG_NAME    c(100),');
  query1.sql.Add('SSTOPER     c(20),');
  query1.sql.Add('SSHEEPV  c(20),');
  query1.sql.Add('SPayT        c(20),');
  query1.sql.Add('STARIF        c(20),');
  query1.sql.Add('NSUMM  n(20, 4),');
  query1.sql.Add('NSUMMWN  n(20, 4),');
  query1.sql.Add('SSUBDIV     c(20),');
  query1.sql.Add('a_OKONH     c(20),');
  query1.sql.Add('a_OKPO     c(20),');
  query1.sql.Add('a_COUNTRY     c(20),');
  query1.sql.Add('a_REG     c(20),');
  query1.sql.Add('a_CITY     c(20),');
  query1.sql.Add('a_STREET     c(20),');
  query1.sql.Add('a_HOUSE     c(20),');
  query1.sql.Add('a_POST     c(20),');
  query1.sql.Add('a_PHONE     c(20),');
  query1.sql.Add('j_OKONH     c(20),');
  query1.sql.Add('j_OKPO     c(20),');
  query1.sql.Add('j_COUNTRY     c(20),');
  query1.sql.Add('j_REG     c(20),');
  query1.sql.Add('j_CITY     c(20),');
  query1.sql.Add('j_STREET     c(20),');
  query1.sql.Add('j_HOUSE     c(20),');
  query1.sql.Add('j_POST     c(20),');
  query1.sql.Add('j_PHONE     c(20))');

  //  query1.sql.SaveToFile('d:\11.txt');
  query1.ExecSQL;
  query1.close;

  fileName := edPath.Text + '\' + 'cords.dbf';
  If fileExists(fileName) Then
    DeleteFile(pchar(fileName));

  query1.paramcheck := false;
  Query1.SQL.Clear;
  query1.sql.Add('CREATE TABLE cords (');
  query1.sql.Add('NRN n(20, 4),');
  query1.sql.Add('NPRN n(20, 4),');
  query1.sql.Add('SPARTY c(20),');
  query1.sql.Add('SNOMEN c(20),');
  query1.sql.Add('SNOMenname c(100),');
  query1.sql.Add('SNOMMODif c(20),');
//  query1.sql.Add('SNOMMname c(100),');
  query1.sql.Add('SNOMPACK c(20),');
  query1.sql.Add('NPACK_Q n(20, 4),');
  query1.sql.Add('NP_QUANT n(20, 4),');
  query1.sql.Add('NPRICE n(20, 4),');
  query1.sql.Add('NQUANT n(20, 4),');
  query1.sql.Add('NQUANTAL n(20, 4),');
  query1.sql.Add('NPRMEAS n(20, 4),');
  query1.sql.Add('NSUMM n(20, 4),');
  query1.sql.Add('NSUMMWN n(20, 4),');
  query1.sql.Add('STAXGR c(20),');
  query1.sql.Add('SNOTE c(240),');
  query1.sql.Add('SMeas_MAIN c(10),');
  query1.sql.Add('SMeas_ALT c(10),');
  query1.sql.Add('SMeas_PACK c(10))');
  query1.ExecSQL;
  query1.close;   }
  Src := edPath.Text + '\c.dbf' + #0;
  Dst := edPath.Text + '\cord.dbf' + #0;
  CopyFile(@Src[1], @Dst[1], False);
  Src := edPath.Text + '\cs.dbf' + #0;
  Dst := edPath.Text + '\cords.dbf' + #0;
  CopyFile(@Src[1], @Dst[1], False);
  Src := edPath.Text + '\cs.fpt' + #0;
  Dst := edPath.Text + '\cords.fpt' + #0;
  CopyFile(@Src[1], @Dst[1], False);

  oraCord.First;
  While Not oraCord.Eof Do
    Begin
      adoCordIns.SQL.Clear;
{      adoCordIns.SQL.Add('insert into cord (NRN,nstatus,SDOCTYPE,SPREF,SNUMB,DDOCDATE,SSTORE,SSTORE_n,SFACEACC,');
      adoCordIns.SQL.Add('V_DTYPE,V_DNUMB,V_DDATE,agnidnumb,SAGENT,SAG_NAME,SSTOPER,SSHEEPV,SPayT,STARIF,');
      adoCordIns.SQL.Add('NSUMM,NSUMMWN,SSUBDIV,a_OKONH,a_OKPO,a_COUNTRY,a_REG,a_CITY,a_STREET,a_HOUSE,');
      adoCordIns.SQL.Add('a_POST,a_PHONE,j_OKONH,j_OKPO,j_COUNTRY,j_REG,j_CITY,j_STREET,j_HOUSE,j_POST,j_PHONE)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nSTATUS').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SDOCTYpe').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SNUMB').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('DDOCDATE').AsDateTime)+ '"),');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE_name').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DTYPE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DNUMB').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DDATE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_INN').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SAGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('AGENT_NAME').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTOPER').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSHEEPVIEW').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPayType').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('STARIF').AsString + '",');
      adoCordIns.SQL.Add(oraCord.fieldbyname('NSUMM').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('NSUMMWN').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSUBDIV').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_OKONH').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_OKPO').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_COUNTRY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_REG').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_CITY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_STREET').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_HOUSE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_PHONE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_OKONH').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_OKPO').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_COUNTRY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_REG').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_CITY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_STREET').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_HOUSE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_PHONE').AsString + '")');
}
      adoCordIns.SQL.Add('insert into cord (NRN,Sord_DOCTY,Sord_PREF,Sord_NUMB,SAGENT,SFACEACC,GRPoiNT,');
      adoCordIns.SQL.Add('scndtype,scndpref,scndnumb,dcnddate,Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
      //  adoCordIns.SQL.Add('Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
      adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,dpay_date,drelease_d,dprice_dat,nord_perio,');
      //  adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,nord_perio,');
      adoCordIns.SQL.Add('nperiod_co,nperiod_qu,nperiod_ty,nperiod_le,natsametim,nprice_typ,nreduction,snote,');
      adoCordIns.SQL.Add('sagnfi,npsumwotax,npsumwtax,sjur_pers)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_DOCTYpe').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_PREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_NUMB').AsString + '",');
      adoCordIns.SQL.Add('''' + oraCord.fieldbyname('SAGENT').AsString + ''',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sgraphpoint').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_doctype').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_docpref').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCON_DOCNUMB').AsString + '",');
      //  adoCordIns.SQL.Add('ctod("'+DateToStr(oraCord.fieldbyname('dcon_docdate').AsDateTime)+'"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_state').AsString + ',');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dstate_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sdisp_type').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('spay_type').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('starif').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCURRENCY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sacc_agent').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('ssubdiv').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_period').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_corr').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_quant').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_type').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_len').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('natsametime').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nreduction').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nprice_type').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('snote').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sagnfi').AsString + '",');
      adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwotax').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwtax').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sjur_pers').AsString + '")');
      adoCordIns.ExecSQL;
      mlog.Lines.Add('Экспорт заявки №' + trim(oraCord.fieldbyname('Sord_PREF').AsString) + '-' + trim(oraCord.fieldbyname('Sord_numb').AsString) + ' от ' + SysUtils.datetostr(oraCord.fieldbyname('dord_date').AsDateTime));
      mlog.Lines.Add('Плательщик ' + trim(oraCord.fieldbyname('SAGENT').AsString) + '.');
      oraCords.First;
      While Not oraCords.Eof Do
        Begin
          adoCordsIns.SQL.Clear;
{          adoCordsIns.SQL.Add('insert into cords (NRN,NPRN,SPARTY,SNOMEN,SNOMMODif,');
          adoCordsIns.SQL.Add('SNOMMname,SNOMPACK,NPACK_Q,NP_QUANT,NPRICE,NQUANT,NQUANTAL,NPRMEAS,');
          adoCordsIns.SQL.Add('NSUMM,NSUMMWN,STAXGR,SNOTE,SMeas_MAIN,SMeas_ALT,SMeas_PACK)');
          adoCordsIns.SQL.Add('values (');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nrn').asInteger) + ',');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nprn').asInteger) + ',');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SPARTY').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snomen').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('smodif').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('smodifname').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('smodifpack').AsString + '",');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NQUANT_P').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NP_QUANT').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NPRICE').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NQUANT').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NQUANTALT').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NPRICEMEAS').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NSUMM').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('NSUMM_NDS').AsString + ',');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('staxgr').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SNOTE').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SMeas_MAIN').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SMeas_ALT').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SMeas_PACK').AsString + '")');
}

          adoCordsIns.SQL.Add('insert into cords (NRN,nprn,snomen,snom_pack,snom_modif,snommod_pa,sproduct,');
          adoCordsIns.SQL.Add('stax_group,nexp_price,npr_meas,sstore,nposreduct,snote,ssp_name,dbegin_dat,dend_date,dactpf_dat,');
          adoCordsIns.SQL.Add('nactm_quan,nacta_quan,nactswtax,nactswotax)');
          adoCordsIns.SQL.Add('values (');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nrn').asInteger) + ',');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nprn').asInteger) + ',');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snomen').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snom_pack').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snom_modif').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snommod_pack').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('sumeas_pack').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('stax_group').AsString + '",');
          If oraCords.fieldbyname('npr_meas').AsInteger = 2 Then //цена для фасовки
            adoCordsIns.SQL.Add(floattostr(oraCords.fieldbyname('nexp_price').AsFloat / oraCords.fieldbyname('ninpack').AsFloat / oraCords.fieldbyname('nequal').AsFloat) + ',')
          Else // цена для налива
            adoCordsIns.SQL.Add(oraCords.fieldbyname('nexp_price').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('npr_meas').AsString + ',');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('sstore').AsString + '",');
          If oraCords.fieldbyname('npr_meas').AsInteger = 2 Then // для фасовки
            adoCordsIns.SQL.Add(oraCords.fieldbyname('ninpack').AsString + ',')
          Else //  для налива
            adoCordsIns.SQL.Add('0,');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snote').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('sname').AsString + '",');
          adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dbegin_date').AsDateTime) + '"),');
          adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dend_date').AsDateTime) + '"),');
          adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dbegin_date').AsDateTime) + '"),');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nactm_quan').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nacta_quan').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nactwtax').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nactwotax').AsString + ')');
          //   adoCordsIns.SQL.SaveToFile('d:\11.txt');
          adoCordsIns.ExecSQL;
          mlog.Lines.Add('Продукт: ' + trim(oraCords.fieldbyname('snom_modif').AsString) + '; вес: ' + trim(oraCords.fieldbyname('nactm_quan').AsString) + ' л.');
          oraCords.Next;
        End; //while cords.eof
      oraMove.ClearVariables;
      oraMove.SetVariable(':nCompany', 2);
      oraMove.SetVariable(':nRn', oraCord.fieldbyname('nrn').asInteger);
      oraMove.SetVariable(':nCRN', NewCatalog);
      oraMove.Execute;
      oraCord.Next;
      mlog.Lines.Add('Заявка экспортирована!');
    End; //while cord.eof
  oracord.Session.Commit;
  //Выгрузка закрытых
  oraCords.Close;
  oraCord.Close;
  oraCord.SQL[15] := 'and v.nstatus=2';
  oraCord.SQL[16] := 'and v.ncrn=' + inttostr(NewCatalog);
  oraCord.Open;
  oraCords.Open;
  oraCord.First;
  While Not oraCord.Eof Do
    Begin
      adoCordIns.SQL.Clear;
{      adoCordIns.SQL.Add('insert into cord (NRN,nstatus,SDOCTYPE,SPREF,SNUMB,DDOCDATE,SSTORE,SSTORE_n,SFACEACC,');
      adoCordIns.SQL.Add('V_DTYPE,V_DNUMB,V_DDATE,agnidnumb,SAGENT,SAG_NAME,SSTOPER,SSHEEPV,SPayT,STARIF,');
      adoCordIns.SQL.Add('NSUMM,NSUMMWN,SSUBDIV,a_OKONH,a_OKPO,a_COUNTRY,a_REG,a_CITY,a_STREET,a_HOUSE,');
      adoCordIns.SQL.Add('a_POST,a_PHONE,j_OKONH,j_OKPO,j_COUNTRY,j_REG,j_CITY,j_STREET,j_HOUSE,j_POST,j_PHONE)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nSTATUS').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SDOCTYpe').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SNUMB').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('DDOCDATE').AsDateTime)+ '"),');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE_name').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DTYPE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DNUMB').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('V_DDATE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_INN').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SAGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('AGENT_NAME').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTOPER').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSHEEPVIEW').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPayType').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('STARIF').AsString + '",');
      adoCordIns.SQL.Add(oraCord.fieldbyname('NSUMM').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('NSUMMWN').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSUBDIV').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_OKONH').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_OKPO').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_COUNTRY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_REG').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_CITY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_STREET').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_HOUSE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('a_PHONE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_OKONH').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_OKPO').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_COUNTRY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_REG').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_CITY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_STREET').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_HOUSE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_POST').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('j_PHONE').AsString + '")');
}
      adoCordIns.SQL.Add('insert into cord (NRN,Sord_DOCTY,Sord_PREF,Sord_NUMB,SAGENT,SFACEACC,GRPoiNT,');
      adoCordIns.SQL.Add('scndtype,scndpref,scndnumb,dcnddate,Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
      //  adoCordIns.SQL.Add('Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
      adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,dpay_date,drelease_d,dprice_dat,nord_perio,');
      //  adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,nord_perio,');
      adoCordIns.SQL.Add('nperiod_co,nperiod_qu,nperiod_ty,nperiod_le,natsametim,nprice_typ,nreduction,snote,');
      adoCordIns.SQL.Add('sagnfi,npsumwotax,npsumwtax,sjur_pers)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_DOCTYpe').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_PREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_NUMB').AsString + '",');
      adoCordIns.SQL.Add('''' + oraCord.fieldbyname('SAGENT').AsString + ''',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sgraphpoint').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_doctype').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_docpref').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCON_DOCNUMB').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_state').AsString + ',');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dstate_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sdisp_type').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('spay_type').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('starif').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCURRENCY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sacc_agent').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('ssubdiv').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_period').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_corr').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_quant').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_type').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_len').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('natsametime').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nreduction').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nprice_type').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('snote').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sagnfi').AsString + '",');
      adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwotax').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwtax').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sjur_pers').AsString + '")');
      adoCordIns.ExecSQL;
      mlog.Lines.Add('Экспорт закрытой заявки №' + trim(oraCord.fieldbyname('Sord_PREF').AsString) + '-' + trim(oraCord.fieldbyname('Sord_numb').AsString) + ' от ' + SysUtils.datetostr(oraCord.fieldbyname('dord_date').AsDateTime));
      oraCord.Next;
    End; //while cord.eof
End;

Procedure TfrmIgmaCord.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP DirectShip Igma';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmIgmaCord.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

Procedure TfrmIgmaCord.acLoadExecute(Sender: TObject);
Begin
  If adoConn.Connected Then
  if MessageDlg('Выгрузить данные для отправки?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    unload;
End;

Procedure TfrmIgmaCord.acSprExecute(Sender: TObject);
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
	oraCars.Open;
	ex.DataSet := oraCars;
	ex.FileName := edPath.Text + '\cars.dbf';
	ex.Execute;
	oraCars.Close;
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
	iFileHandle := FileOpen(edPath.Text + '\cars.dbf', fmOpenWrite);
	FileSeek(iFileHandle, 29, 0);
	FileWrite(iFileHandle, s, 1);
	fileClose(iFileHandle);
	mlog.Lines.Add('Выгружены справочники.');
End;

Procedure TfrmIgmaCord.acSendExecute(Sender: TObject);
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

procedure TfrmIgmaCord.mteCatalogAfterScroll(DataSet: TDataSet);
Var
  catName                               : String[25];
Begin
  If oraCatalog.Active Then
    Begin
      catName := mtecatalog.fieldbyname('name').asstring;
      catName := leftstr(catName, length(trim(catName)) - 11);
      If oraCatalog.SearchRecord('name', catname, [srFromBeginning]) Then
        Begin
          newCatalog := oraCatalog.FieldByName('rn').AsInteger;
          BitBtn2.Enabled := True;
        End
      Else
        BitBtn2.Enabled := False;
    End;
end;

procedure TfrmIgmaCord.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
