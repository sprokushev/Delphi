unit ttn17load;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  XPMan, dateutils, StrUtils;

type
  TfrmTTN17 = class(TForm)
    oraMain: TOracleSession;
    oraTTN17: TOracleDataSet;
    oraTTN17_cond: TOracleDataSet;
    dsTTN17: TDataSource;
    dsTTN17_cond: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    dbgTTN17_cond: TDBGridEh;
    dbgTTN17: TDBGridEh;
    Splitter2: TSplitter;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionManager1: TActionManager;
    acFilter: TAction;
    BitBtn1: TBitBtn;
    adoMain: TADOConnection;
    adoTIC: TADOQuery;
    adoTICS: TADOQuery;
    XPManifest1: TXPManifest;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    OraQuery: TOracleQuery;
    oraLogon: TOracleLogon;
    procedure acFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acLoadExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTTN17: TfrmTTN17;

implementation

{$R *.dfm}

procedure TfrmTTN17.acFilterExecute(Sender: TObject);
begin
oraMain.Reconnect;
oraTTN17.Close;
oraTTN17.SQL[48]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17.SQL[49]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17.Open;
oraTTN17_cond.Close;
oraTTN17_cond.SQL[48]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.SQL[49]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.Open;
end;


procedure TfrmTTN17.FormCreate(Sender: TObject);
begin
deBeg.Date:=date-1;
deEnd.Date:=date-1;
oraLogon.Execute;
oraTTN17.SQL[48]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17.SQL[49]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17.Open;
oraTTN17_cond.SQL[48]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.SQL[49]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
oraTTN17_cond.Open;
end;

procedure TfrmTTN17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
oraTTN17.Close;
oraTTN17_cond.Close;
oraMain.Connected:=false;
end;

procedure TfrmTTN17.acLoadExecute(Sender: TObject);
var
summ:string;
st1,st2:string;
begin
getdir(0,st2);
st1:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+st2+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
adoMain.ConnectionString:=st1;
adoMain.Connected:=true;
oraTTN17_cond.First;  // проход по ценам с условиями
while not oraTTN17_cond.Eof do
begin
  adoTic.SQL.Clear;
  adoTic.SQL.Add('insert into tic (NRN,SDOCTYPE,SPREF,SNUMB,DDOCDATE,NSTATUS,');
  adoTic.SQL.Add('DWORK_DATE,DSALEDATE,SACCDOC,SACCNUMB,DACCDATE,SDIRDOC,SDIRNUMB,');
  adoTic.SQL.Add('DDIRDATE,SSTOPER,SFACEACC,NAGENTCRN,SAGENT,STARIF,NSTORECRN,');
  adoTic.SQL.Add('SSTORE,SMOL,SSHEEPVIEW,SPAYTYPE,NDISCOUNT,SCURRENCY,NCURCOURS,');
  adoTic.SQL.Add('NCURBASE,NFA_COURS,NFA_COURSB,NSUMM,NSUMMWITHN,SRECIPDOC,SRECIPNUMB,');
  adoTic.SQL.Add('DRECIPDATE,SFERRYMAN,SAGNFIFO,SFORWARDER,SWAYBLADEN,SDRIVER,SCAR,');
  adoTic.SQL.Add('SROUTE,STRAILER1,STRAILER2,SCOMMENTS,NFACEACCCR,SBARCODE,NINCNDS,');
  adoTic.SQL.Add('SGRAPHPNT,DRPTDATE,SACC_AGENT,SSUBDIV,SJUR_PERS,NSACTSGN)');
  adoTic.SQL.Add('values (');
  adoTic.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+1)+',');
  adoTic.SQL.Add('"СВЕД",');
  adoTic.SQL.Add('"'+rightstr(inttostr(yearof(oraTTN17_cond.fieldbyname('dwork_date').asDateTime)),2)+'т-'+trim(oraTTN17_cond.fieldbyname('Sved_num').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('num_cist').asString)+'",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('ddocdate').asString)+'"),');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('dwork_date').asString)+'"),');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('dSaledate').asString)+'"),');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('saccdoc').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('saccnumb').asString)+'",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('daccdate').asString)+'"),');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('ctod(""),');
  adoTic.SQL.Add('"РЕАЛ_ТРАНЗИТ",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sfaceacc').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sagent').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('starif').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"УХТА_ЦА",');
  adoTic.SQL.Add('"ЦЕНТР",');
  adoTic.SQL.Add('"Ж/Д_ТРАНЗ",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('spay_type').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"Руб.",');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  summ:=floattostr(oraTTN17_cond.fieldbyname('d_41').asFloat+oraTTN17_cond.fieldbyname('sum_nacen').asFloat+oraTTN17_cond.fieldbyname('sum_insure').asFloat);
  adoTic.SQL.Add(summ+',');//сумма
  summ:=floattostr(oraTTN17_cond.fieldbyname('d_41').asFloat+oraTTN17_cond.fieldbyname('d_191').asFloat+oraTTN17_cond.fieldbyname('sum_nacen').asFloat+oraTTN17_cond.fieldbyname('ndc_nal20').asFloat+oraTTN17_cond.fieldbyname('sum_insure').asFloat);
  adoTic.SQL.Add(summ+',');//сумма с налогами
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('srecipnumb').asString)+'",');
  adoTic.SQL.Add('ctod(""),');
  adoTic.SQL.Add('"АРКА-ДОРТРАНС",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sagnfifo').asString)+'",');
  adoTic.SQL.Add('"","","","","","","",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('num_kvit').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('drptdate').asString)+'"),');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sacc_agent').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('ssubdiv').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sjur_pers').asString)+'",');
  adoTic.SQL.Add('0)');
  adoTIC.ExecSQL;
//Акт транспортировки
  if oraTTN17_cond.fieldbyname('tarif').asFloat>0 then
  begin
    adoTic.SQL.Clear;
    adoTic.SQL.Add('insert into tic (NRN,SDOCTYPE,SPREF,SNUMB,DDOCDATE,NSTATUS,');
    adoTic.SQL.Add('DWORK_DATE,DSALEDATE,SACCDOC,SACCNUMB,DACCDATE,SDIRDOC,SDIRNUMB,');
    adoTic.SQL.Add('DDIRDATE,SSTOPER,SFACEACC,NAGENTCRN,SAGENT,STARIF,NSTORECRN,');
    adoTic.SQL.Add('SSTORE,SMOL,SSHEEPVIEW,SPAYTYPE,NDISCOUNT,SCURRENCY,NCURCOURS,');
    adoTic.SQL.Add('NCURBASE,NFA_COURS,NFA_COURSB,NSUMM,NSUMMWITHN,SRECIPDOC,SRECIPNUMB,');
    adoTic.SQL.Add('DRECIPDATE,SFERRYMAN,SAGNFIFO,SFORWARDER,SWAYBLADEN,SDRIVER,SCAR,');
    adoTic.SQL.Add('SROUTE,STRAILER1,STRAILER2,SCOMMENTS,NFACEACCCR,SBARCODE,NINCNDS,');
    adoTic.SQL.Add('SGRAPHPNT,DRPTDATE,SACC_AGENT,SSUBDIV,SJUR_PERS,NSACTSGN)');
    adoTic.SQL.Add('values (');
    adoTic.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+2)+',');
    adoTic.SQL.Add('"АКТ_ТРАНСП",');
    adoTic.SQL.Add('"'+rightstr(inttostr(yearof(oraTTN17_cond.fieldbyname('dwork_date').asDateTime)),2)+'к-'+trim(oraTTN17_cond.fieldbyname('Sved_num').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('num_cist').asString)+'",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('ddocdate').asString)+'"),');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('dwork_date').asString)+'"),');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('dSaledate').asString)+'"),');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('saccdoc').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('saccnumb').asString)+'",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('daccdate').asString)+'"),');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('ctod(""),');
    adoTic.SQL.Add('"РЕАЛ_ТРАНЗИТ",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sfaceacc').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sagent').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('starif').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"УХТА_ЦА",');
    adoTic.SQL.Add('"ЦЕНТР",');
    adoTic.SQL.Add('"Ж/Д_ТРАНЗ",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('spay_type').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"Руб.",');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    summ:=floattostr(oraTTN17_cond.fieldbyname('tarif').asFloat);
    adoTic.SQL.Add(summ+',');//сумма
    summ:=floattostr(oraTTN17_cond.fieldbyname('tarif').asFloat+oraTTN17_cond.fieldbyname('tarif_nds').asFloat);
    adoTic.SQL.Add(summ+',');//сумма с налогами
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('srecipnumb').asString)+'",');
    adoTic.SQL.Add('ctod(""),');
    adoTic.SQL.Add('"АРКА-ДОРТРАНС",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sagnfifo').asString)+'",');
    adoTic.SQL.Add('"","","","","","","",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('num_kvit').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('drptdate').asString)+'"),');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sacc_agent').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('ssubdiv').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('sjur_pers').asString)+'",');
    adoTic.SQL.Add('0)');
    adoTIC.ExecSQL;
  end;
// Спецификация
// по продукту
  adoTICS.SQL.Clear;
  adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
  adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
  adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
  adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
  adoTICS.SQL.Add('values (');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+1)+',');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('snomen').asString)+'",');
  adoTICS.SQL.Add('"'+trim(oraTTN17_cond.fieldbyname('snommodif').asString)+'",');
  adoTicS.SQL.Add('"",');
  adoTicS.SQL.Add('"",');
  adoTICS.SQL.Add('1,');
  // SGOODSPART
  summ:=trim(oraTTN17_cond.fieldbyname('cat_cen_id').asString)+'-';
  st1:=trim(inttostr(dayof(oraTTN17_cond.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(monthof(oraTTN17_cond.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(YearOf(oraTTN17_cond.fieldbyname('date_cen').asdatetime)));
  summ:=summ+st1;
  adoTICS.SQL.Add('"'+summ+'",');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('ves').asFloat*1000))+',');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('ves').asFloat*1000))+',');
  adoTICS.SQL.Add('ctod(""),');
  adoTICS.SQL.Add('ctod(""),');
  adoTICS.SQL.Add('"НДС 20%",');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('nprice').asFloat))+',');
  adoTICS.SQL.Add('1,');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('d_41').asFloat))+',');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('d_41').asFloat+oraTTN17_cond.fieldbyname('d_191').asFloat))+',');
  adoTICS.SQL.Add('"л.",');
  adoTICS.SQL.Add('"кг.",');
  adoTICS.SQL.Add('"",0,"","","","")');
  adoTICS.ExecSQL;
// по ЖД тарифу
  if oraTTN17_cond.fieldbyname('tarif').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+2)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"Ж/Д тариф",');
    st1:=UpperCase(leftStr(oraTTN17_cond.fieldbyname('stan_name').asString,1));
    st1:=st1+LowerCase(rightStr(trim(oraTTN17_cond.fieldbyname('stan_name').asString),length(trim(oraTTN17_cond.fieldbyname('stan_name').asString))-1));
    adoTICS.SQL.Add('"'+st1+'",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('dSaledate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"НДС 20%",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('tarif').asFloat+oraTTN17_cond.fieldbyname('tarif_nds').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('tarif').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('tarif').asFloat+oraTTN17_cond.fieldbyname('tarif_nds').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
// по страховке
  if oraTTN17_cond.fieldbyname('sum_insure').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+1)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"СТРАХОВКА_ГР",');
    adoTICS.SQL.Add('"СТРАХОВКА_ГР_'+trim(oraTTN17_cond.fieldbyname('proc_insure').asString)+'%",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('daccdate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"ПЕРЕМ",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
// за транспортировку
  if oraTTN17_cond.fieldbyname('sum_nacen').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17_cond.fieldbyname('id').asInteger*10+1)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"За транспортировку",');
    adoTICS.SQL.Add('"Вознагр за трансп",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17_cond.fieldbyname('daccdate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"НДС 20%",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_nacen').asFloat+oraTTN17_cond.fieldbyname('ndc_nal20').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_nacen').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17_cond.fieldbyname('sum_nacen').asFloat+oraTTN17_cond.fieldbyname('ndc_nal20').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
  oraQuery.SQL.Clear;
  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task) values (');
  oraQuery.SQL.Add(trim(oraTTN17_cond.fieldbyname('id').AsString)+',');
  oraQuery.SQL.Add('''ttn17'')');
  oraQuery.Execute;
  oraQuery.SQL.Clear;
  oraQuery.SQL.Add('commit');
  oraQuery.Execute;
  oraQuery.SQL.Clear;
  oraTTN17_cond.Next;
end; // прошли по oraTTN17_cond
acFilterExecute(Self);
//*********************************************************************************
oraTTN17.First;  // проход по ценам
while not oraTTN17.Eof do
begin
  adoTic.SQL.Clear;
  adoTic.SQL.Add('insert into tic (NRN,SDOCTYPE,SPREF,SNUMB,DDOCDATE,NSTATUS,');
  adoTic.SQL.Add('DWORK_DATE,DSALEDATE,SACCDOC,SACCNUMB,DACCDATE,SDIRDOC,SDIRNUMB,');
  adoTic.SQL.Add('DDIRDATE,SSTOPER,SFACEACC,NAGENTCRN,SAGENT,STARIF,NSTORECRN,');
  adoTic.SQL.Add('SSTORE,SMOL,SSHEEPVIEW,SPAYTYPE,NDISCOUNT,SCURRENCY,NCURCOURS,');
  adoTic.SQL.Add('NCURBASE,NFA_COURS,NFA_COURSB,NSUMM,NSUMMWITHN,SRECIPDOC,SRECIPNUMB,');
  adoTic.SQL.Add('DRECIPDATE,SFERRYMAN,SAGNFIFO,SFORWARDER,SWAYBLADEN,SDRIVER,SCAR,');
  adoTic.SQL.Add('SROUTE,STRAILER1,STRAILER2,SCOMMENTS,NFACEACCCR,SBARCODE,NINCNDS,');
  adoTic.SQL.Add('SGRAPHPNT,DRPTDATE,SACC_AGENT,SSUBDIV,SJUR_PERS,NSACTSGN)');
  adoTic.SQL.Add('values (');
  adoTic.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+1)+',');
  adoTic.SQL.Add('"СВЕД",');
  adoTic.SQL.Add('"'+rightstr(inttostr(yearof(oraTTN17.fieldbyname('dwork_date').asDateTime)),2)+'т-'+trim(oraTTN17.fieldbyname('Sved_num').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('num_cist').asString)+'",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('ddocdate').asString)+'"),');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('dwork_date').asString)+'"),');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('dSaledate').asString)+'"),');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('saccdoc').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('saccnumb').asString)+'",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('daccdate').asString)+'"),');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('ctod(""),');
  adoTic.SQL.Add('"РЕАЛ_ТРАНЗИТ",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sfaceacc').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sagent').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('starif').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"УХТА_ЦА",');
  adoTic.SQL.Add('"ЦЕНТР",');
  adoTic.SQL.Add('"Ж/Д_ТРАНЗ",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('spay_type').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"Руб.",');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('1,');
  summ:=floattostr(oraTTN17.fieldbyname('d_41').asFloat+oraTTN17.fieldbyname('sum_nacen').asFloat+oraTTN17.fieldbyname('sum_insure').asFloat);
  adoTic.SQL.Add(summ+',');//сумма
  summ:=floattostr(oraTTN17.fieldbyname('d_41').asFloat+oraTTN17.fieldbyname('d_191').asFloat+oraTTN17.fieldbyname('sum_nacen').asFloat+oraTTN17.fieldbyname('ndc_nal20').asFloat+oraTTN17.fieldbyname('sum_insure').asFloat);
  adoTic.SQL.Add(summ+',');//сумма с налогами
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('srecipnumb').asString)+'",');
  adoTic.SQL.Add('ctod(""),');
  adoTic.SQL.Add('"АРКА-ДОРТРАНС",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sagnfifo').asString)+'",');
  adoTic.SQL.Add('"","","","","","","",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('num_kvit').asString)+'",');
  adoTic.SQL.Add('0,');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('1,');
  adoTic.SQL.Add('"",');
  adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('drptdate').asString)+'"),');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sacc_agent').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('ssubdiv').asString)+'",');
  adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sjur_pers').asString)+'",');
  adoTic.SQL.Add('0)');
  adoTIC.ExecSQL;
//Акт транспортировки
  if oraTTN17.fieldbyname('tarif').asFloat>0 then
  begin
    adoTic.SQL.Clear;
    adoTic.SQL.Add('insert into tic (NRN,SDOCTYPE,SPREF,SNUMB,DDOCDATE,NSTATUS,');
    adoTic.SQL.Add('DWORK_DATE,DSALEDATE,SACCDOC,SACCNUMB,DACCDATE,SDIRDOC,SDIRNUMB,');
    adoTic.SQL.Add('DDIRDATE,SSTOPER,SFACEACC,NAGENTCRN,SAGENT,STARIF,NSTORECRN,');
    adoTic.SQL.Add('SSTORE,SMOL,SSHEEPVIEW,SPAYTYPE,NDISCOUNT,SCURRENCY,NCURCOURS,');
    adoTic.SQL.Add('NCURBASE,NFA_COURS,NFA_COURSB,NSUMM,NSUMMWITHN,SRECIPDOC,SRECIPNUMB,');
    adoTic.SQL.Add('DRECIPDATE,SFERRYMAN,SAGNFIFO,SFORWARDER,SWAYBLADEN,SDRIVER,SCAR,');
    adoTic.SQL.Add('SROUTE,STRAILER1,STRAILER2,SCOMMENTS,NFACEACCCR,SBARCODE,NINCNDS,');
    adoTic.SQL.Add('SGRAPHPNT,DRPTDATE,SACC_AGENT,SSUBDIV,SJUR_PERS,NSACTSGN)');
    adoTic.SQL.Add('values (');
    adoTic.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+2)+',');
    adoTic.SQL.Add('"АКТ_ТРАНСП",');
    adoTic.SQL.Add('"'+rightstr(inttostr(yearof(oraTTN17.fieldbyname('dwork_date').asDateTime)),2)+'к-'+trim(oraTTN17.fieldbyname('Sved_num').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('num_cist').asString)+'",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('ddocdate').asString)+'"),');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('dwork_date').asString)+'"),');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('dSaledate').asString)+'"),');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('saccdoc').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('saccnumb').asString)+'",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('daccdate').asString)+'"),');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('ctod(""),');
    adoTic.SQL.Add('"РЕАЛ_ТРАНЗИТ",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sfaceacc').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sagent').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('starif').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"УХТА_ЦА",');
    adoTic.SQL.Add('"ЦЕНТР",');
    adoTic.SQL.Add('"Ж/Д_ТРАНЗ",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('spay_type').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"Руб.",');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('1,');
    summ:=floattostr(oraTTN17.fieldbyname('tarif').asFloat);
    adoTic.SQL.Add(summ+',');//сумма
    summ:=floattostr(oraTTN17.fieldbyname('tarif').asFloat+oraTTN17.fieldbyname('tarif_nds').asFloat);
    adoTic.SQL.Add(summ+',');//сумма с налогами
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('srecipnumb').asString)+'",');
    adoTic.SQL.Add('ctod(""),');
    adoTic.SQL.Add('"АРКА-ДОРТРАНС",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sagnfifo').asString)+'",');
    adoTic.SQL.Add('"","","","","","","",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('num_kvit').asString)+'",');
    adoTic.SQL.Add('0,');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('1,');
    adoTic.SQL.Add('"",');
    adoTic.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('drptdate').asString)+'"),');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sacc_agent').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('ssubdiv').asString)+'",');
    adoTic.SQL.Add('"'+trim(oraTTN17.fieldbyname('sjur_pers').asString)+'",');
    adoTic.SQL.Add('0)');
    adoTIC.ExecSQL;
  end;
// Спецификация
// по продукту
  adoTICS.SQL.Clear;
  adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
  adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
  adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
  adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
  adoTICS.SQL.Add('values (');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+1)+',');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add('"'+trim(oraTTN17.fieldbyname('snomen').asString)+'",');
  adoTICS.SQL.Add('"'+trim(oraTTN17.fieldbyname('snommodif').asString)+'",');
  adoTicS.SQL.Add('"",');
  adoTicS.SQL.Add('"",');
  adoTICS.SQL.Add('1,');
  // SGOODSPART
  summ:=trim(oraTTN17.fieldbyname('cat_cen_id').asString)+'-';
  st1:=trim(inttostr(dayof(oraTTN17.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(monthof(oraTTN17.fieldbyname('date_cen').asdatetime)));
  if length(st1)=1 then st1:='0'+st1;
  summ:=summ+st1;
  st1:=trim(inttostr(YearOf(oraTTN17.fieldbyname('date_cen').asdatetime)));
  summ:=summ+st1;
  adoTICS.SQL.Add('"'+summ+'",');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('ves').asFloat*1000))+',');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('ves').asFloat*1000))+',');
  adoTICS.SQL.Add('ctod(""),');
  adoTICS.SQL.Add('ctod(""),');
  adoTICS.SQL.Add('"НДС 20%",');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('nprice').asFloat))+',');
  adoTICS.SQL.Add('1,');
  adoTICS.SQL.Add('0,');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('d_41').asFloat))+',');
  adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('d_41').asFloat+oraTTN17.fieldbyname('d_191').asFloat))+',');
  adoTICS.SQL.Add('"л.",');
  adoTICS.SQL.Add('"кг.",');
  adoTICS.SQL.Add('"",0,"","","","")');
  adoTICS.ExecSQL;
// по ЖД тарифу
  if oraTTN17.fieldbyname('tarif').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+2)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"Ж/Д тариф",');
    st1:=UpperCase(leftStr(oraTTN17.fieldbyname('stan_name').asString,1));
    st1:=st1+LowerCase(rightStr(trim(oraTTN17.fieldbyname('stan_name').asString),length(trim(oraTTN17.fieldbyname('stan_name').asString))-1));
    adoTICS.SQL.Add('"'+st1+'",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('dSaledate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"НДС 20%",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('tarif').asFloat+oraTTN17.fieldbyname('tarif_nds').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('tarif').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('tarif').asFloat+oraTTN17.fieldbyname('tarif_nds').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
// по страховке
  if oraTTN17.fieldbyname('sum_insure').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+1)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"СТРАХОВКА_ГР",');
    adoTICS.SQL.Add('"СТРАХОВКА_ГР_'+trim(oraTTN17.fieldbyname('proc_insure').asString)+'%",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('daccdate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"ПЕРЕМ",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_insure').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
// за транспортировку
  if oraTTN17.fieldbyname('sum_nacen').asFloat>0 then
  begin
    adoTICS.SQL.Clear;
    adoTICS.SQL.Add('insert into tics (NRN,NPRN,NNOMENCRN,SNOMEN,SNOMMODIF,SNOMPACK,');
    adoTICS.SQL.Add('SARTICLE,NNOMEN_TYP,SGOODSPART,NQUANT,NQUANTALT,DBEGINDATE,');
    adoTICS.SQL.Add('DENDDATE,STAXGR,NPRICE,NPRICEMEAS,NDISCOUNT,NSUMM,NSUMMWITHN,');
    adoTICS.SQL.Add('SMEAS_MAIN,SMEAS_ALT,SMEAS_PACK,NPACK_QUAN,SSERNUMB,SCOUNTRY,SGTD,SNOTE)');
    adoTICS.SQL.Add('values (');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(IntToStr(oraTTN17.fieldbyname('id').asInteger*10+1)+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('"За транспортировку",');
    adoTICS.SQL.Add('"Вознагр за трансп",');
    adoTicS.SQL.Add('"",');
    adoTicS.SQL.Add('"",');
    adoTICS.SQL.Add('2,');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('1,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('ctod("'+trim(oraTTN17.fieldbyname('daccdate').asString)+'"),');
    adoTICS.SQL.Add('ctod(""),');
    adoTICS.SQL.Add('"НДС 20%",');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_nacen').asFloat+oraTTN17.fieldbyname('ndc_nal20').asFloat))+',');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add('0,');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_nacen').asFloat))+',');
    adoTICS.SQL.Add(trim(floatToStr(oraTTN17.fieldbyname('sum_nacen').asFloat+oraTTN17.fieldbyname('ndc_nal20').asFloat))+',');
    adoTICS.SQL.Add('"шт",');
    adoTICS.SQL.Add('"",');
    adoTICS.SQL.Add('"",0,"","","","")');
    adoTICS.ExecSQL;
  end;
  oraQuery.SQL.Clear;
  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task) values (');
  oraQuery.SQL.Add(trim(oraTTN17.fieldbyname('id').AsString)+',');
  oraQuery.SQL.Add('''ttn17'')');
  oraQuery.Execute;
  oraQuery.SQL.Clear;
  oraQuery.SQL.Add('commit');
  oraQuery.Execute;
  oraQuery.SQL.Clear;
  oraTTN17.Next;
end; // прошли по oraTTN17
adoMain.Connected:=false;
adoMain.FreeOnRelease;
acFilterExecute(Self);
end;

end.
