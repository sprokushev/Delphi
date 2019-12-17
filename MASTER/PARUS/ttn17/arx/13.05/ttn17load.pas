unit ttn17load;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  XPMan, dateutils, StrUtils, ComCtrls, ImgList, jpeg, vgCtrls, vgDBTree,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP;

type
  TfrmTTN17 = class(TForm)
    oraMain: TOracleSession;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgTTN17_cond: TDBGridEh;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionManager1: TActionManager;
    acFilter: TAction;
    BitBtn1: TBitBtn;
    XPManifest1: TXPManifest;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    OraQuery: TOracleQuery;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    oraQ: TOracleQuery;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Label4: TLabel;
    tvCatalog: TvgDBTreeView;
    oraTTN17_cond: TOracleDataSet;
    oraTTN17_new: TOracleDataSet;
    dsTTN_cond: TDataSource;
    dsTTN17_new: TDataSource;
    Splitter1: TSplitter;
    dbgTTN17_new: TDBGridEh;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    Splitter4: TSplitter;
    mLog: TMemo;
    procedure acFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acLoadExecute(Sender: TObject);
    procedure dbgTTN17_condGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure LoadParus(z: integer);
    procedure dbgTTN17_newGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTTN17: TfrmTTN17;

implementation

uses MAIN;

{$R *.dfm}

procedure TfrmTTN17.acFilterExecute(Sender: TObject);
begin
//oraTTN17.Close;
//oraTTN17.SQL[52]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
//oraTTN17.SQL[53]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
//oraTTN17.Open;
oraTTN17_cond.Close;
oraTTN17_cond.SQL[39]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.SQL[40]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.Open;
oraTTN17_new.Close;
oraTTN17_new.SQL[39]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17_new.SQL[40]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17_new.Open;
end;


procedure TfrmTTN17.FormCreate(Sender: TObject);
begin
deBeg.Date:=date-10;
deEnd.Date:=date-1;
oraMain.Connected:=true;
oraParus.LogonUsername:=frmMain.oraParusMain.LogonUsername;
oraParus.LogonPassword:=frmMain.oraParusMain.LogonPassword;
oraParus.LogonDatabase:=frmMain.oraParusMain.LogonDatabase;
oraParus.Connected:=true;
  oraTTN17_cond.SQL[39]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
  oraTTN17_cond.SQL[40]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
  oraTTN17_cond.Open;
  oraTTN17_new.SQL[39]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
  oraTTN17_new.SQL[40]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
  oraTTN17_new.Open;
  oraCatalog.Open;
  tvCatalog.FullExpand;
end;

procedure TfrmTTN17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//oraTTN17.Close;
oraTTN17_new.Close;
oraTTN17_cond.Close;
oraCatalog.Close;
oraMain.Connected:=false;
oraParus.Connected:=false;
with frmMain.IdMessage do
  begin
    From.Text := 'ttn17';
    Sender.Text := 'ttn17';
    Recipients.EMailAddresses := 'JRomanov@KomiTu.lukoil.com';
    Subject := 'ttn17';
    Body := mLog.Lines;
  end;
  if mLog.Lines.Count>1 then
  with frmMain.IdSMTP do
    begin
      try
      Connect;
      Send(frmMain.IdMessage);
      Disconnect;
      except on E : Exception do
        begin
          if connected then try disconnect; except end;
          ShowMessage(E.Message);
        end;
    end;
  end;
action:=caFree;
end;

procedure TfrmTTN17.acLoadExecute(Sender: TObject);
begin
LoadParus(1);
LoadParus(2);
end;

procedure TfrmTTN17.LoadParus(z: integer);
var
  summ,rn_stan,rn_parti               :string;
  st1,st2,rn_crn                      :string;
  rn_sved,rn_akt                      :string;
  ok                                  :boolean;
  rn_strax                            :string;
  ss                                  :^TOracleDataSet;
begin
tvCatalog.UpdateCursorPos;
rn_crn:=IntToStr(tvcatalog.FieldID.AsInteger);
if z=1 then ss:=@oraTTN17_cond
       else ss:=@oraTTN17_new;
ss^.First;
while not ss^.Eof do
begin
  mlog.Lines.Add('Çàêà÷êà â Ïàðóñ ñâåäåíèå ¹'+ ss^.fieldbyname('sved_num').AsString+' ¹'+ ss^.fieldbyname('num_cist').AsString);
  ok:=false;
  // Ïàðòèÿ
  summ:=trim(ss^.fieldbyname('cat_cen_id').asString)+'_';
  st1:=trim(inttostr(dayof(ss^.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(monthof(ss^.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=rightstr(inttostr(YearOf(ss^.fieldbyname('date_cen').asdatetime)),2);
  summ:=summ+st1;
  oraQ.SQL.Clear;
  oraQ.SQL.Add('select g.rn from goodsparties g, incomdoc i where g.indoc=i.rn and');
  oraQ.SQL.Add('i.code='''+summ+''' and');
  oraQ.SQL.Add('g.nommodif='+trim(ss^.fieldbyname('parus_rn').asString));
  oraQ.execute;
  if oraQ.RowCount>0 then
  begin
//    rn_parti:=oraQ.FieldAsInteger(0);
    rn_parti:=summ;
    ok:=true;
  end
  else
  begin
    ok:=false;
    mlog.Lines.Add('Íå íàéäåíà ïàðòèÿ â Ïàðóñå:'+summ);
  end;
  oraQ.SQL.Clear;
  //ÆÄ ñòàíöèÿ
  st1:=AnsiUpperCase(leftStr(ss^.fieldbyname('stan_name').asString,1));
  st2:=rightStr(trim(ss^.fieldbyname('stan_name').asString),length(trim(ss^.fieldbyname('stan_name').asString))-1);
  st1:=st1+AnsiLowerCase(st2);
  oraQ.SQL.Clear;
  oraQ.SQL.Add('select rn from NomModif where');
  oraQ.SQL.Add('modif_code='''+st1+'''');
  oraQ.execute;
  if(oraQ.RowCount>0) and ok then
  begin
//    rn_stan:=oraQ.FieldAsInteger(0);
    rn_stan:= st1;
    ok:=true;
  end else
  begin
    ok:=false;
    mlog.Lines.Add('Íå íàéäåíà ñòàíöèÿ â Ïàðóñå: ' +st1);
    mlog.Lines.Add('Çàêà÷êà â Ïàðóñ ñâåäåíèå ¹'+ ss^.fieldbyname('sved_num').AsString+'íå ïðîèçâåäåíà!');
  end;
  oraQ.SQL.Clear;

  if ok then
  begin
{  oraQ.SQL.Clear;
  oraQ.SQL.add('select gen_id as rn from dual');
  oraQ.Execute;
  rn_sved:=oraQ.FieldAsInteger(0);
  oraQ.SQL.Clear;
  oraQ.SQL.add('select gen_barcode as rn from dual');
  oraQ.Execute;
  rn_barcode:=oraQ.FieldAsString(0);
  oraQ.SQL.Clear;  }
  oraInvIns.SetVariable(':nCOMPANY',2);
  oraInvIns.SetVariable(':nCRN',rn_crn);
  oraInvIns.SetVariable(':sJUR_PERS',trim(ss^.fieldbyname('sjur_pers').asString));
  oraInvIns.SetVariable(':sDOCTYPE','ÑÂÅÄ');
  oraInvIns.SetVariable(':sPREF',rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)),2)+'ò-'+trim(ss^.fieldbyname('Sved_num').asString));
  oraInvIns.SetVariable(':sNUMB',trim(ss^.fieldbyname('num_cist').asString));
  oraInvIns.SetVariable(':dDOCDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
  oraInvIns.SetVariable(':dSALEDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
  oraInvIns.SetVariable(':sACCDOC',trim(ss^.fieldbyname('saccdoc').asString));
  oraInvIns.SetVariable(':sACCNUMB',trim(ss^.fieldbyname('saccnumb').asString));
  oraInvIns.SetVariable(':dACCDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('daccdate').asDateTime));
//  oraInvIns.SetVariable(':sDIRDOC',);
//  oraInvIns.SetVariable(':sDIRNUMB',);
//  oraInvIns.SetVariable(':dDIRDATE',);
  oraInvIns.SetVariable(':sSTOPER','ÐÅÀË_ÒÐÀÍÇÈÒ');
  oraInvIns.SetVariable(':sFACEACC',trim(ss^.fieldbyname('sfaceacc').asString));
//  oraInvIns.SetVariable(':sGRAPHPOINT',);
  oraInvIns.SetVariable(':sAGENT',trim(ss^.fieldbyname('sagent').asString));
  oraInvIns.SetVariable(':sTARIF',trim(ss^.fieldbyname('starif').asString));
  oraInvIns.SetVariable(':nSERVACT_SIGN',0);
  oraInvIns.SetVariable(':sSTORE','ÓÕÒÀ_ÖÀ');
  oraInvIns.SetVariable(':sMOL','ÖÅÍÒÐ');
  oraInvIns.SetVariable(':sSHEEPVIEW',trim(ss^.fieldbyname('sship_type').asString));
  oraInvIns.SetVariable(':sPAYTYPE',trim(ss^.fieldbyname('spay_type').asString));
  oraInvIns.SetVariable(':nDISCOUNT',0);
  oraInvIns.SetVariable(':sCURRENCY','Ðóá.');
  oraInvIns.SetVariable(':nCURCOURS',1);
  oraInvIns.SetVariable(':nCURBASE',1);
  oraInvIns.SetVariable(':nFA_COURS',1);
  oraInvIns.SetVariable(':nFA_BASECOURS',1);
  summ:=floattostr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('sum_insure').asFloat);
  oraInvIns.SetVariable(':nSUMM',summ);
  summ:=floattostr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('nds_prod').asFloat+ss^.fieldbyname('sum_insure').asFloat+ss^.fieldbyname('ndc_nal20').asFloat);
  oraInvIns.SetVariable(':nSUMMWITHNDS',summ);
//  oraInvIns.SetVariable(':sRECIPDOC',);
  oraInvIns.SetVariable(':sRECIPNUMB',trim(ss^.fieldbyname('srecipnumb').asString));
//  oraInvIns.SetVariable(':dRECIPDATE',);
  oraInvIns.SetVariable(':sFERRYMAN','ÀÐÊÀ-ÄÎÐÒÐÀÍÑ');
  oraInvIns.SetVariable(':sAGNFIFO',trim(ss^.fieldbyname('agnfifo').asString));
//  oraInvIns.SetVariable(':sFORWARDER',);
//  oraInvIns.SetVariable(':sWAYBLADENUMB',);
//  oraInvIns.SetVariable(':sDRIVER',);
//  oraInvIns.SetVariable(':sCAR',);
//  oraInvIns.SetVariable(':sROUTE',);
//  oraInvIns.SetVariable(':sTRAILER1',);
//  oraInvIns.SetVariable(':sTRAILER2',);
  oraInvIns.SetVariable(':sCOMMENTS',trim(ss^.fieldbyname('num_kvit').asString)+',('+trim(ss^.fieldbyname('num_cist').asString)+'),'+trim(ss^.fieldbyname('sved_num').asString));
  oraInvIns.SetVariable(':sACC_AGENT',trim(ss^.fieldbyname('sacc_agent').asString));
  oraInvIns.SetVariable(':sSUBDIV',trim(ss^.fieldbyname('ssubdiv').asString));
  try begin
  oraInvIns.Execute;
  rn_sved:=oraInvIns.getVariable(':nRN');
//  oraInvIns.SetVariable(':sBARCODE,
//  oraInvIns.SetVariable(':sMSG
{  oraQ.SQL.Add('insert into transinvcust (RN,company,crn,DOCTYPE,PREF,NUMB,DOCDATE,STATUS,');
  oraQ.SQL.Add('WORK_DATE,SALEDATE,ACCDOC,ACCNUMB,ACCDATE,STOPER,FACEACC,AGENT,TARIF,');
  oraQ.SQL.Add('STORE,MOL,SHEEPVIEW,PAYTYPE,DISCOUNT,CURRENCY,CURCOURS,');
  oraQ.SQL.Add('CURBASE,FA_COURS,FA_baseCOURS,SUMM,SUMMWITHNds,RECIPDOC,RECIPNUMB,');
  oraQ.SQL.Add('RECIPDATE,FERRYMAN,AGNFIFO,COMMENTS,SALESREPORTDATE,SUBDIV,JUR_PERS,ServACT_SiGN,barcode)');//ACC_AGENT,
  oraQ.SQL.Add('values (');
  oraQ.SQL.Add(inttostr(rn_sved)+',');//rn
  oraQ.SQL.Add('2,');//company
  oraQ.SQL.Add(rn_crn+ ',');// crn
  oraQ.SQL.Add('138152460,');//doctype ÑÂÅÄ
  oraQ.SQL.Add(''''+rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)),2)+'ò-'+trim(ss^.fieldbyname('Sved_num').asString)+''',');//pref
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('num_cist').asString)+''',');//numb
  oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//docdate
  oraQ.SQL.Add('0,');//status
  oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//workdate
  oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//dSaledate
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('accdoc').asString)+''',');//accdoc
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('saccnumb').asString)+''',');//accnumb
  oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('daccdate').asDateTime)+''',''dd.mm.yyyy''),');//daccdate
  oraQ.SQL.Add('47721237,');//stoper ÐÅÀË_ÒÐÀÍÇÈÒ
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nfaceacc').asString)+''',');//faceacc
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nagent').asString)+''',');//agent
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('ntarif').asString)+''',');//tarif
  oraQ.SQL.Add('140815551,');//store Óõòà_öà
  oraQ.SQL.Add('140815459,');//mol Öåíòð
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nship_type').asString)+''',');//shipview
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('npay_type').asString)+''',');//paytype
  oraQ.SQL.Add('0,'); //discount
//  oraQ.SQL.Add(trim(ss^.fieldbyname('nfa_currency').asString)+',');//currency
  oraQ.SQL.Add('2,');//currency
  oraQ.SQL.Add('1,');//curcours
  oraQ.SQL.Add('1,');//curbase
  oraQ.SQL.Add('1,');//fa_cours
  oraQ.SQL.Add('1,');//fa_basecourse
  summ:=floattostr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('sum_insure').asFloat);
  oraQ.SQL.Add(summ+',');//summ ñóììà
  summ:=floattostr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('nds_prod').asFloat+ss^.fieldbyname('sum_insure').asFloat+ss^.fieldbyname('ndc_nal20').asFloat);
  oraQ.SQL.Add(summ+',');//summwithn ñóììà ñ íàëîãàìè
  oraQ.SQL.Add('null,');//recipdoc
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('srecipnumb').asString)+''',');//recipnumb
  oraQ.SQL.Add('null,');//recipdate
  oraQ.SQL.Add('175777201,');//ferryman ÀÐÊÀ-ÄÎÐÒÐÀÍÑ
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('agnfifo').asString)+''',');//agnfifo
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('num_kvit').asString)+',('+trim(ss^.fieldbyname('num_cist').asString)+'),'+trim(ss^.fieldbyname('sved_num').asString)+''',');//comments
  oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('drptdate').asDateTime)+''',''dd.mm.yyyy''),');//drptdate
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nsubdiv').asString)+''',');
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('njur_pers').asString)+''',');
  oraQ.SQL.Add('0,'''+rn_barcode+''')');
  oraQ.Execute; }
// Ñïåöèôèêàöèÿ
// ïî ïðîäóêòó
{  oraQ.SQL.Clear;
  oraQ.SQL.add('select gen_id as rn from dual');
  oraQ.Execute;
  rn:=oraQ.FieldAsInteger(0);
  oraQ.SQL.Clear; }
  oraInvsIns.SetVariable(':nCOMPANY',2);
  oraInvsIns.SetVariable(':nCRN',rn_crn);
  oraInvsIns.SetVariable(':nPRN',rn_sved);
  oraInvsIns.SetVariable(':sTAXGR',trim(ss^.fieldbyname('taxgr_code').asString));
  summ:=trim(ss^.fieldbyname('cat_cen_id').asString)+'_';
  st1:=trim(inttostr(dayof(ss^.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(monthof(ss^.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=rightstr(inttostr(YearOf(ss^.fieldbyname('date_cen').asdatetime)),2);
  summ:=summ+st1;
  oraInvsIns.SetVariable(':sGOODSPARTY',summ);
  oraInvsIns.SetVariable(':sNOMEN',trim(ss^.fieldbyname('modif').asString));
//  oraInvsIns.SetVariable(':sNOMNMODIFPACK',);
  oraInvsIns.SetVariable(':sNOMMODIF',trim(ss^.fieldbyname('mod_modif').asString));
//  oraInvsIns.SetVariable(':sARTICLE',);
//  oraInvsIns.SetVariable(':sCELL',);
  oraInvsIns.SetVariable(':nPRICE',trim(floatToStr(ss^.fieldbyname('nprice').asFloat)));
  oraInvsIns.SetVariable(':nDISCOUNT',0);
  oraInvsIns.SetVariable(':nQUANT',trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000)));
  oraInvsIns.SetVariable(':nQUANTALT',trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000)));
  oraInvsIns.SetVariable(':nPRICEMEAS',1);
  oraInvsIns.SetVariable(':nSUMM',trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat)));
  oraInvsIns.SetVariable(':nSUMMWITHNDS',trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('nds_prod').asFloat)));
//  oraInvsIns.SetVariable(':dBEGINDATE',);
//  oraInvsIns.SetVariable(':dENDDATE',);
//  oraInvsIns.SetVariable(':sSERNUMB',);
//  oraInvsIns.SetVariable(':sCOUNTRY',);
//  oraInvsIns.SetVariable(':sGTD',);
//  oraInvsIns.SetVariable(':sNOTE',);
//  oraInvsIns.SetVariable(':nRN',);
//  oraInvsIns.SetVariable(':sMSG',);

{
  oraQ.SQL.Add('insert into transinvcustspecs (RN,company,crn,PRN,NOMMODIF,');
  oraQ.SQL.Add('GOODSPARTY,QUANT,QUANTALT,TAXGR,PRICE,PRICEMEAS,DISCOUNT,SUMM,SUMMWITHNds)');
  oraQ.SQL.Add('values (');
  oraQ.SQL.Add(inttostr(rn)+',');//rn
  oraQ.SQL.Add('2,');//company
  oraQ.SQL.Add(rn_crn+ ',');// crn
  oraQ.SQL.Add(IntToStr(rn_sved)+',');//prn
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('parus_rn').asString)+''',');
  oraQ.SQL.Add(inttostr(rn_parti)+',');//goodsparty
  oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000))+',');//quant
  oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('ves').asFloat*1000))+',');//quantalt
  oraQ.SQL.Add(''''+trim(ss^.fieldbyname('taxgr_rn').asString)+''',');//taxgr
  oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('nprice').asFloat))+',');//price
  oraQ.SQL.Add('1,');//pricemeas
  oraQ.SQL.Add('0,');//discount
  oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat))+',');//summ
  oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_prod').asFloat+ss^.fieldbyname('nds_prod').asFloat)));//summwithn
  oraQ.SQL.Add(')');
  oraQ.Execute;}
// ïî ñòðàõîâêå
  if ss^.fieldbyname('sum_insure').asFloat>0 then
  begin
{
    if length(trim(ss^.fieldbyname('PROC_INSURE').asString))=1 then st2:=trim(ss^.fieldbyname('PROC_INSURE').asString)+'.0'
    else st2:=trim(ss^.fieldbyname('PROC_INSURE').asString);
    st1:='ÑÒÐÀÕÎÂÊÀ_ÃÐ_'+st2+'%';
    oraQ.SQL.Clear;
    oraQ.SQL.Add('select rn from NomModif where');
    oraQ.SQL.Add('modif_code='''+st1+'''');
    oraQ.execute;
    rn_strax:=oraQ.FieldAsInteger(0);
    oraQ.SQL.Clear;
    oraQ.SQL.add('select gen_id as rn from dual');
    oraQ.Execute;
    rn:=oraQ.FieldAsInteger(0);
    oraQ.SQL.Clear;   }
  oraInvsIns.SetVariable(':nCOMPANY',2);
  oraInvsIns.SetVariable(':nPRN',rn_sved);
  oraInvsIns.SetVariable(':nCRN',rn_crn);
  oraInvsIns.SetVariable(':sTAXGR','ÏÅÐÅÌ');
//  oraInvsIns.SetVariable(':sGOODSPARTY',summ);
  oraInvsIns.SetVariable(':sNOMEN','ÑÒÐÀÕÎÂÊÀ_ÃÐ');
//  oraInvsIns.SetVariable(':sNOMNMODIFPACK',);
  if length(trim(ss^.fieldbyname('PROC_INSURE').asString))=1 then st2:=trim(ss^.fieldbyname('PROC_INSURE').asString)+'.0'
     else st2:=trim(ss^.fieldbyname('PROC_INSURE').asString);
    st1:='ÑÒÐÀÕÎÂÊÀ_ÃÐ_'+st2+'%';
  oraInvsIns.SetVariable(':sNOMMODIF',st1);
//  oraInvsIns.SetVariable(':sARTICLE',);
//  oraInvsIns.SetVariable(':sCELL',);
  oraInvsIns.SetVariable(':nPRICE',trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
  oraInvsIns.SetVariable(':nDISCOUNT',0);
  oraInvsIns.SetVariable(':nQUANT',1);
  oraInvsIns.SetVariable(':nQUANTALT',0);
  oraInvsIns.SetVariable(':nPRICEMEAS',0);
  oraInvsIns.SetVariable(':nSUMM',trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
  oraInvsIns.SetVariable(':nSUMMWITHNDS',trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));
  oraInvsIns.SetVariable(':dBEGINDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
//  oraInvsIns.SetVariable(':dENDDATE',);
//  oraInvsIns.SetVariable(':sSERNUMB',);
//  oraInvsIns.SetVariable(':sCOUNTRY',);
//  oraInvsIns.SetVariable(':sGTD',);
//  oraInvsIns.SetVariable(':sNOTE',);
//  oraInvsIns.SetVariable(':nRN',);
//  oraInvsIns.SetVariable(':sMSG',);
{
    oraQ.SQL.Add('insert into transinvcustspecs (RN,company,crn,PRN,NOMMODIF,BEGINDATE,');
    oraQ.SQL.Add('QUANT,QUANTALT,TAXGR,PRICE,PRICEMEAS,DISCOUNT,SUMM,SUMMWITHNds)');
    oraQ.SQL.Add('values (');
    oraQ.SQL.Add(inttostr(rn)+',');//rn
    oraQ.SQL.Add('2,');//company
    oraQ.SQL.Add(rn_crn+ ',');// crn
    oraQ.SQL.Add(IntToStr(rn_sved)+',');//prn
    oraQ.SQL.Add(inttostr(rn_strax)+',');//nommodif
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//dSaledate
    oraQ.SQL.Add('1,');//quant
    oraQ.SQL.Add('0,');//quantalt
    oraQ.SQL.Add('709522,');//taxgr ÏÅÐÅÌ
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat))+',');//price
    oraQ.SQL.Add('0,');//pricemeas
    oraQ.SQL.Add('0,');//discount
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat))+',');//summ
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_insure').asFloat)));//summwithnds
    oraQ.SQL.Add(')');
    oraQ.Execute;  }
  end;
// çà òðàíñïîðòèðîâêó
  if ss^.fieldbyname('sum_nacen').asFloat>0 then
  begin
 {   oraQ.SQL.Clear;
    oraQ.SQL.add('select gen_id as rn from dual');
    oraQ.Execute;
    rn:=oraQ.FieldAsInteger(0);
    oraQ.SQL.Clear;  }

  oraInvsIns.SetVariable(':nCOMPANY',2);
  oraInvsIns.SetVariable(':nPRN',rn_sved);
  oraInvsIns.SetVariable(':nCRN',rn_crn);
  oraInvsIns.SetVariable(':sTAXGR','ÍÄÑ 20%');
//  oraInvsIns.SetVariable(':sGOODSPARTY',summ);
  oraInvsIns.SetVariable(':sNOMEN','Çà òðàíñïîðòèðîâêó');
//  oraInvsIns.SetVariable(':sNOMNMODIFPACK',);
  oraInvsIns.SetVariable(':sNOMMODIF','Çà òðàíñïîðòèðîâêó');
//  oraInvsIns.SetVariable(':sARTICLE',);
//  oraInvsIns.SetVariable(':sCELL',);
  oraInvsIns.SetVariable(':nPRICE',trim(floatToStr(ss^.fieldbyname('price_nacen').asFloat)));
  oraInvsIns.SetVariable(':nDISCOUNT',0);
  oraInvsIns.SetVariable(':nQUANT',trim(floatToStr(ss^.fieldbyname('ves').asFloat)));
  oraInvsIns.SetVariable(':nQUANTALT',0);
  oraInvsIns.SetVariable(':nPRICEMEAS',0);
  oraInvsIns.SetVariable(':nSUMM',trim(floatToStr(ss^.fieldbyname('sum_nacen').asFloat)));
  oraInvsIns.SetVariable(':nSUMMWITHNDS',trim(floatToStr(ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('ndc_nal20').asFloat)));
  oraInvsIns.SetVariable(':dBEGINDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
//  oraInvsIns.SetVariable(':dENDDATE',);
//  oraInvsIns.SetVariable(':sSERNUMB',);
//  oraInvsIns.SetVariable(':sCOUNTRY',);
//  oraInvsIns.SetVariable(':sGTD',);
//  oraInvsIns.SetVariable(':sNOTE',);
//  oraInvsIns.SetVariable(':nRN',);
//  oraInvsIns.SetVariable(':sMSG',);
{
    oraQ.SQL.Add('insert into transinvcustspecs (RN,company,crn,PRN,NOMMODIF,BEGINDATE,');
    oraQ.SQL.Add('QUANT,QUANTALT,TAXGR,PRICE,PRICEMEAS,DISCOUNT,SUMM,SUMMWITHNds)');
    oraQ.SQL.Add('values (');
    oraQ.SQL.Add(inttostr(rn)+',');//rn
    oraQ.SQL.Add('2,');//company
    oraQ.SQL.Add(rn_crn+ ',');// crn
    oraQ.SQL.Add(IntToStr(rn_sved)+',');//prn
    oraQ.SQL.Add('138347155,');//nommodif
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//dSaledate
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('ves').asFloat))+',');//quant
    oraQ.SQL.Add('0,');//quantalt
    oraQ.SQL.Add('399239,');//taxgr ÍÄÑ 20%
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('price_nacen').asFloat))+',');//price
    oraQ.SQL.Add('0,');//pricemeas
    oraQ.SQL.Add('0,');//discount
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_nacen').asFloat))+',');//summ
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('sum_nacen').asFloat+ss^.fieldbyname('ndc_nal20').asFloat)));//summwithnds
    oraQ.SQL.Add(')');
    oraQ.Execute;}

//Àêò òðàíñïîðòèðîâêè
  if ss^.fieldbyname('tarif').asFloat>0 then
  begin
  {  oraQ.SQL.Clear;
    oraQ.SQL.add('select gen_id as rn from dual');
    oraQ.Execute;
    rn_akt:=oraQ.FieldAsInteger(0);
    oraQ.SQL.Clear;
    oraQ.SQL.add('select gen_barcode as rn from dual');
    oraQ.Execute;
    rn_barcode:=oraQ.FieldAsString(0);
    oraQ.SQL.Clear;    }
    oraInvIns.SetVariable(':nCOMPANY',2);
    oraInvIns.SetVariable(':nCRN',rn_crn);
    oraInvIns.SetVariable(':sJUR_PERS',trim(ss^.fieldbyname('sjur_pers').asString));
    oraInvIns.SetVariable(':sDOCTYPE','rn_akt');
    oraInvIns.SetVariable(':sPREF',rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)),2)+'ò-'+trim(ss^.fieldbyname('Sved_num').asString));
    oraInvIns.SetVariable(':sNUMB',trim(ss^.fieldbyname('num_cist').asString));
    oraInvIns.SetVariable(':dDOCDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
    oraInvIns.SetVariable(':dSALEDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
    oraInvIns.SetVariable(':sACCDOC',trim(ss^.fieldbyname('saccdoc').asString));
    oraInvIns.SetVariable(':sACCNUMB',trim(ss^.fieldbyname('saccnumb').asString));
    oraInvIns.SetVariable(':dACCDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('daccdate').asDateTime));
//  oraInvIns.SetVariable(':sDIRDOC',);
//  oraInvIns.SetVariable(':sDIRNUMB',);
//  oraInvIns.SetVariable(':dDIRDATE',);
    oraInvIns.SetVariable(':sSTOPER','ÐÅÀË_ÒÐÀÍÇÈÒ');
    oraInvIns.SetVariable(':sFACEACC',trim(ss^.fieldbyname('sfaceacc').asString));
//  oraInvIns.SetVariable(':sGRAPHPOINT',);
    oraInvIns.SetVariable(':sAGENT',trim(ss^.fieldbyname('sagent').asString));
    oraInvIns.SetVariable(':sTARIF',trim(ss^.fieldbyname('starif').asString));
    oraInvIns.SetVariable(':nSERVACT_SIGN',0);
    oraInvIns.SetVariable(':sSTORE','ÓÕÒÀ_ÖÀ');
    oraInvIns.SetVariable(':sMOL','ÖÅÍÒÐ');
    oraInvIns.SetVariable(':sSHEEPVIEW',trim(ss^.fieldbyname('sship_type').asString));
    oraInvIns.SetVariable(':sPAYTYPE',trim(ss^.fieldbyname('spay_type').asString));
    oraInvIns.SetVariable(':nDISCOUNT',0);
    oraInvIns.SetVariable(':sCURRENCY','Ðóá.');
    oraInvIns.SetVariable(':nCURCOURS',1);
    oraInvIns.SetVariable(':nCURBASE',1);
    oraInvIns.SetVariable(':nFA_COURS',1);
    oraInvIns.SetVariable(':nFA_BASECOURS',1);
    summ:=floattostr(ss^.fieldbyname('tarif').asFloat);
    oraInvIns.SetVariable(':nSUMM',summ);
    summ:=floattostr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat);
    oraInvIns.SetVariable(':nSUMMWITHNDS',summ);
//  oraInvIns.SetVariable(':sRECIPDOC',);
    oraInvIns.SetVariable(':sRECIPNUMB',trim(ss^.fieldbyname('srecipnumb').asString));
//  oraInvIns.SetVariable(':dRECIPDATE',);
    oraInvIns.SetVariable(':sFERRYMAN','ÀÐÊÀ-ÄÎÐÒÐÀÍÑ');
    oraInvIns.SetVariable(':sAGNFIFO',trim(ss^.fieldbyname('agnfifo').asString));
//  oraInvIns.SetVariable(':sFORWARDER',);
//  oraInvIns.SetVariable(':sWAYBLADENUMB',);
//  oraInvIns.SetVariable(':sDRIVER',);
//  oraInvIns.SetVariable(':sCAR',);
//  oraInvIns.SetVariable(':sROUTE',);
//  oraInvIns.SetVariable(':sTRAILER1',);
//  oraInvIns.SetVariable(':sTRAILER2',);
    oraInvIns.SetVariable(':sCOMMENTS',trim(ss^.fieldbyname('num_kvit').asString)+',('+trim(ss^.fieldbyname('num_cist').asString)+'),'+trim(ss^.fieldbyname('sved_num').asString));
    oraInvIns.SetVariable(':sACC_AGENT',trim(ss^.fieldbyname('sacc_agent').asString));
    oraInvIns.SetVariable(':sSUBDIV',trim(ss^.fieldbyname('ssubdiv').asString));
    try begin
    rn_akt:=oraInvIns.getVariable(':nRN');
//  oraInvIns.SetVariable(':sBARCODE,
//  oraInvIns.SetVariable(':sMSG

{    oraQ.SQL.Add('insert into transinvcust (RN,company,crn,DOCTYPE,PREF,NUMB,DOCDATE,STATUS,');
    oraQ.SQL.Add('WORK_DATE,SALEDATE,ACCDOC,ACCNUMB,ACCDATE,STOPER,FACEACC,AGENT,TARIF,');
    oraQ.SQL.Add('STORE,MOL,SHEEPVIEW,PAYTYPE,DISCOUNT,CURRENCY,CURCOURS,');
    oraQ.SQL.Add('CURBASE,FA_COURS,FA_baseCOURS,SUMM,SUMMWITHNds,RECIPDOC,RECIPNUMB,');
    oraQ.SQL.Add('RECIPDATE,FERRYMAN,AGNFIFO,COMMENTS,SALESREPORTDATE,SUBDIV,JUR_PERS,ServACT_SiGN,barcode)');
    oraQ.SQL.Add('values (');
    oraQ.SQL.Add(inttostr(rn_akt)+',');//rn
    oraQ.SQL.Add('2,');//company
    oraQ.SQL.Add(rn_crn+ ',');// crn
    oraQ.SQL.Add('70206057,');//daoctype rn_akt
    oraQ.SQL.Add(''''+rightstr(inttostr(yearof(ss^.fieldbyname('date_kvit').asDateTime)),2)+'ò-'+trim(ss^.fieldbyname('Sved_num').asString)+''',');//pref
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('num_cist').asString)+''',');//numb
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//docdate
    oraQ.SQL.Add('0,');//status
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//workdate
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//dSaledate
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('accdoc').asString)+''',');//accdoc
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('saccnumb').asString)+''',');//accnumb
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('daccdate').asDateTime)+''',''dd.mm.yyyy''),');//daccdate
    oraQ.SQL.Add('47721237,');//stoper ÐÅÀË_ÒÐÀÍÇÈÒ
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nfaceacc').asString)+''',');//faceacc
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nagent').asString)+''',');//agent
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('ntarif').asString)+''',');//tarif
    oraQ.SQL.Add('140815551,');//store  Óõòà_öà
    oraQ.SQL.Add('140815459,');//mol Öåíòð
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nship_type').asString)+''',');//shipview
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('npay_type').asString)+''',');//paytype
    oraQ.SQL.Add('0,'); //discount
    oraQ.SQL.Add('2,');//currency
    oraQ.SQL.Add('1,');//curcours
    oraQ.SQL.Add('1,');//curbase
    oraQ.SQL.Add('1,');//fa_cours
    oraQ.SQL.Add('1,');//fa_basecourse
    summ:=floattostr(ss^.fieldbyname('tarif').asFloat);
    oraQ.SQL.Add(summ+',');//ñóììà
    summ:=floattostr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat);
    oraQ.SQL.Add(summ+',');//ñóììà ñ íàëîãàìè
    oraQ.SQL.Add('null,');//recipdoc
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('srecipnumb').asString)+''',');//recipnumb
    oraQ.SQL.Add('null,');//recipdate
    oraQ.SQL.Add('175777201,');//ferryman ÀÐÊÀ-ÄÎÐÒÐÀÍÑ
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('agnfifo').asString)+''',');//agnfifo
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('num_kvit').asString)+',('+trim(ss^.fieldbyname('num_cist').asString)+'),'+trim(ss^.fieldbyname('sved_num').asString)+''',');//comments
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('drptdate').asDateTime)+''',''dd.mm.yyyy''),');//drptdate
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('nsubdiv').asString)+''',');
    oraQ.SQL.Add(''''+trim(ss^.fieldbyname('njur_pers').asString)+''',');
    oraQ.SQL.Add('0,'''+rn_barcode+''')');
    oraQ.Execute;  }
  end;
// ïî ÆÄ òàðèôó
  if rn_akt>0 then
  begin
{    oraQ.SQL.Clear;
    oraQ.SQL.add('select gen_id as rn from dual');
    oraQ.Execute;
    rn:=oraQ.FieldAsInteger(0);
    oraQ.SQL.Clear;        }

  oraInvsIns.SetVariable(':nCOMPANY',2);
  oraInvsIns.SetVariable(':nPRN',rn_akt);
  oraInvsIns.SetVariable(':nCRN',rn_crn);
  oraInvsIns.SetVariable(':sTAXGR','ÍÄÑ 20%');
//  oraInvsIns.SetVariable(':sGOODSPARTY',summ);
  oraInvsIns.SetVariable(':sNOMEN','Æ/Ä òàðèô');
//  oraInvsIns.SetVariable(':sNOMNMODIFPACK',);
  st1:=AnsiUpperCase(leftStr(ss^.fieldbyname('stan_name').asString,1));
  st2:=rightStr(trim(ss^.fieldbyname('stan_name').asString),length(trim(ss^.fieldbyname('stan_name').asString))-1);
  st1:=st1+AnsiLowerCase(st2);
  oraInvsIns.SetVariable(':sNOMMODIF',st1);
//  oraInvsIns.SetVariable(':sARTICLE',);
//  oraInvsIns.SetVariable(':sCELL',);
  oraInvsIns.SetVariable(':nPRICE',trim(floatToStr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat)));
  oraInvsIns.SetVariable(':nDISCOUNT',0);
  oraInvsIns.SetVariable(':nQUANT',1);
  oraInvsIns.SetVariable(':nQUANTALT',0);
  oraInvsIns.SetVariable(':nPRICEMEAS',0);
  oraInvsIns.SetVariable(':nSUMM',trim(floatToStr(ss^.fieldbyname('tarif').asFloat)));
  oraInvsIns.SetVariable(':nSUMMWITHNDS',trim(floatToStr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat)));
  oraInvsIns.SetVariable(':dBEGINDATE',FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime));
//  oraInvsIns.SetVariable(':dENDDATE',);
//  oraInvsIns.SetVariable(':sSERNUMB',);
//  oraInvsIns.SetVariable(':sCOUNTRY',);
//  oraInvsIns.SetVariable(':sGTD',);
//  oraInvsIns.SetVariable(':sNOTE',);
//  oraInvsIns.SetVariable(':nRN',);
//  oraInvsIns.SetVariable(':sMSG',);
{
    oraQ.SQL.Add('insert into transinvcustspecs (RN,company,crn,PRN,NOMMODIF,BEGINDATE,');
    oraQ.SQL.Add('QUANT,QUANTALT,TAXGR,PRICE,PRICEMEAS,DISCOUNT,SUMM,SUMMWITHNds)');
    oraQ.SQL.Add('values (');
    oraQ.SQL.Add(inttostr(rn)+',');//rn
    oraQ.SQL.Add('2,');//company
    oraQ.SQL.Add(rn_crn+ ',');// crn
    oraQ.SQL.Add(IntToStr(rn_akt)+',');//prn
    oraQ.SQL.Add(inttostr(rn_stan)+',');//nommodif
    oraQ.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').asDateTime)+''',''dd.mm.yyyy''),');//dSaledate
    oraQ.SQL.Add('1,');//quant
    oraQ.SQL.Add('0,');//quantalt
    oraQ.SQL.Add('399239,');//taxgr ÍÄÑ 20%
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat))+',');
    oraQ.SQL.Add('0,');//pricemeas
    oraQ.SQL.Add('0,');//discount
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('tarif').asFloat))+',');//summ
    oraQ.SQL.Add(trim(floatToStr(ss^.fieldbyname('tarif').asFloat+ss^.fieldbyname('tarif_nds').asFloat)));//summwithnds
    oraQ.SQL.Add(')');
    oraQ.Execute; }
  end;
  end;
  oraQuery.SQL.Clear;
  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
  oraQuery.SQL.Add(trim(ss^.fieldbyname('id').AsString)+',');
  oraQuery.SQL.Add('''GoodsTransInvoicesToConsumers'',');
  oraQuery.SQL.Add(inttostr(rn_sved)+',');
  oraQuery.SQL.Add('1,');
  oraQuery.SQL.Add(''''+trim(ss^.fieldbyname('srecipnumb').AsString)+''',');
  oraQuery.SQL.Add(''''+oraParus.LogonUsername+''',');
  oraQuery.SQL.Add(trim(ss^.fieldbyname('Sved_num').asString)+',');
  oraQuery.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').AsDateTime)+''',''dd.mm.yyyy''))');
  oraQuery.Execute;
  oraQuery.SQL.Clear;
  if rn_akt>0 then
  begin
    oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
    oraQuery.SQL.Add(trim(ss^.fieldbyname('id').AsString)+',');
    oraQuery.SQL.Add('''GoodsTransInvoicesToConsumers'',');
    oraQuery.SQL.Add(inttostr(rn_akt)+',');
    oraQuery.SQL.Add('2,');
    oraQuery.SQL.Add(''''+trim(ss^.fieldbyname('srecipnumb').AsString)+''',');
    oraQuery.SQL.Add(''''+oraParus.LogonUsername+''',');
    oraQuery.SQL.Add(trim(ss^.fieldbyname('Sved_num').asString)+',');
    oraQuery.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',ss^.fieldbyname('date_kvit').AsDateTime)+''',''dd.mm.yyyy''))');
    oraQuery.Execute;
    oraQuery.SQL.Clear;
  end;
  oraQuery.Session.Commit;
  oraQ.Session.Commit;
  oraQ.SQL.Clear;
  end;
  ss^.Next;
end;
acFilterExecute(Self);
end;

procedure TfrmTTN17.dbgTTN17_condGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if odd(oraTTN17_cond.RecNo) then
   background:=clMoneyGreen;
end;

procedure TfrmTTN17.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
if node.HasChildren then node.ImageIndex:=1
else node.ImageIndex:=0;
end;

procedure TfrmTTN17.dbgTTN17_newGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if odd(oraTTN17_new.RecNo) then
   background:=clMoneyGreen;
end;

end.
