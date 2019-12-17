unit EdOtpCen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, ComCtrls, RxLookup, StdCtrls,
  ToolEdit, CurrEdit, Buttons, Mask, Grids,  ExtCtrls, Oracle,
  DBCtrls,DateUtils, DBGrids,DBGridEh,GridsEh;

type
  Tf_EdOtpCen = class(TForm)
    q_Prod: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdLONG_NAME_NPR: TStringField;
    ds_prod: TDataSource;
    q_CatCen: TOracleDataSet;
    ds_CatCen: TDataSource;
    q_CatCenID: TIntegerField;
    q_CatCenCAT_CEN_NAME: TStringField;
    q_sobstv: TOracleDataSet;
    q_sobstvID: TIntegerField;
    q_sobstvOWNERSHIP_NAME: TStringField;
    ds_sobstv: TDataSource;
    q_post: TOracleDataSet;
    ds_post: TDataSource;
    q_postPREDPR_ID: TIntegerField;
    q_postSHORT_NAME: TStringField;
    grid_Prod: TDBGridEh;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    e_CatCen: TEdit;
    lc_CatCen: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    lbCena: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    e_Cena: TCurrencyEdit;
    e_Akciz: TCurrencyEdit;
    e_nds20: TCurrencyEdit;
    e_Cena_otp: TCurrencyEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    e_BeginDate: TDateTimePicker;
    e_EndDate: TDateTimePicker;
    cb_To: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox4: TGroupBox;
    e_sobstv: TEdit;
    lc_Sobstv: TRxDBLookupCombo;
    GroupBox5: TGroupBox;
    e_post: TEdit;
    lc_post: TRxDBLookupCombo;
    GroupBox6: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    e_protokolnum: TEdit;
    e_protokoldate: TDateTimePicker;
    cb_Original: TCheckBox;
    e_protokolbegindate: TDateTimePicker;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    e_Cena_NPO: TCurrencyEdit;
    e_nds20_npo: TCurrencyEdit;
    e_Cena_otp_npo: TCurrencyEdit;
    q_CatCenPLAT_ID: TIntegerField;
    q_ProdAKCIZ: TIntegerField;
    q_PredprAkciz: TOracleDataSet;
    ds_PredprAkciz: TDataSource;
    q_PredprAkcizID: TFloatField;
    q_PredprAkcizPLAT_ID: TFloatField;
    q_PredprAkcizDATE_BEG: TDateTimeField;
    q_PredprAkcizDATE_END: TDateTimeField;
    q_CatCenEX_SVID: TFloatField;
    q_PredprAkcizEX_SVID: TFloatField;
    q_PredprAkcizEX_SVID_PREF: TStringField;
    q_PredprAkcizEX_SVID_NUMB: TStringField;
    q_PredprAkcizDATE_CANCEL: TDateTimeField;
    q_PredprAkcizDATE_GIVE: TDateTimeField;
    q_PredprAkcizIS_OPT: TIntegerField;
    q_PredprAkcizIS_ROZN: TIntegerField;
    q_PredprAkcizPROD_GROUPS_ID: TFloatField;
    pckBILLS: TOraclePackage;
    lbCenaBN: TLabel;
    e_cena_bn: TCurrencyEdit;
    cb_NoAkciz: TCheckBox;
    Label11: TLabel;
    q_PredprAkcizSVID_NUMB: TStringField;
    DBText1: TDBText;
    q_ProdPROD_GROUPS_ID: TFloatField;
    q_ProdAKCIZ_VALUE: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure lc_CatCenChange(Sender: TObject);
    procedure e_CatCenExit(Sender: TObject);
    procedure e_BeginDateChange(Sender: TObject);
    procedure e_CenaChange(Sender: TObject);
    procedure cb_ToClick(Sender: TObject);
    procedure e_sobstvExit(Sender: TObject);
    procedure lc_SobstvChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lc_postChange(Sender: TObject);
    procedure e_postExit(Sender: TObject);
    procedure e_nds20Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure e_Cena_NPOChange(Sender: TObject);
    procedure e_nds20_npoChange(Sender: TObject);
    procedure e_Cena_otp_npoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure e_EndDateChange(Sender: TObject);
    procedure q_ProdAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    IsSetNoAkciz:boolean;
    NDSValue:double;
    procedure SetNoAkciz(Plat_ID:integer; AKCIZ_PLAT_DEFAULT:integer; AKCIZ_PROD:integer; PROD_GROUPS_ID:integer; dBeg:TDateTime; dEnd:TDateTime);
  public
    { Public declarations }
    IsAdd: boolean;
  end;

var
  f_EdOtpCen: Tf_EdOtpCen;

implementation
uses DateUtil,Math, main, ForDB;
{$R *.DFM}

procedure Tf_EdOtpCen.FormCreate(Sender: TObject);
begin
  IsSetNoAkciz:=false; // по умолчанию - признак не менять
  q_sobstv.Session:=f_main.ora_Session;
  q_Prod.Session:=f_main.ora_Session;
  q_CatCen.Session:=f_main.ora_Session;
  q_post.Session:=f_main.ora_Session;
  q_PredprAkciz.Session:=f_main.ora_Session;
  pckBILLS.Session:=f_main.ora_Session;

  q_sobstv.Open;
  q_Prod.Open;
  q_CatCen.Open;
  q_post.open;
  lc_CatCen.Value:='0';
  e_Cena.Text:='0';
  e_NDS20.Text:='0';
  e_Akciz.Text:='0';
  e_Cena_Otp.Text:='0';
  e_BeginDate.DateTime:=Date;
  e_BeginDateChange(Sender);
  e_EndDate.DateTime:=FirstDayOfNextMonth-1;
  e_protokoldate.DateTime:=Date;
  e_protokolbegindate.DateTime:=Date;
  e_sobstv.Text:='1';
  lc_sobstv.Value:=Trim(e_sobstv.Text);
  e_post.Text:='1';
  lc_post.Value:=Trim(e_post.Text);

end;

procedure Tf_EdOtpCen.lc_CatCenChange(Sender: TObject);
begin
  e_CatCen.Text:=lc_CatCen.Value;
  SetNoAkciz(q_CatCen.FieldByName('PLAT_ID').AsInteger,q_CatCen.FieldByName('EX_SVID').AsInteger,q_Prod.FieldByName('AKCIZ').AsInteger,q_Prod.FieldByName('PROD_GROUPS_ID').AsInteger,e_BeginDate.Date,e_EndDate.Date);
end;

procedure Tf_EdOtpCen.e_CatCenExit(Sender: TObject);
begin
  lc_CatCen.Value:=Trim(e_CatCen.Text);
end;

procedure Tf_EdOtpCen.e_BeginDateChange(Sender: TObject);
var s:string;
begin
  s:=FormatDateTime('dd.mm.yyyy',e_BeginDate.Date);
  NDSValue:=pckBILLS.CallFloatFunction('GetNDSValueSTR',[s]);
  e_EndDate.DateTime:=e_BeginDate.DateTime;
  q_Prod.SetVariable('FROM_DATE',DateOf(e_BeginDate.Date));
  f_db.ReQuery(q_Prod,true);
  SetNoAkciz(q_CatCen.FieldByName('PLAT_ID').AsInteger,q_CatCen.FieldByName('EX_SVID').AsInteger,q_Prod.FieldByName('AKCIZ').AsInteger,q_Prod.FieldByName('PROD_GROUPS_ID').AsInteger,e_BeginDate.Date,e_EndDate.Date);
  e_CenaChange(Sender);
  e_Cena_NPOChange(Sender);
end;

procedure Tf_EdOtpCen.e_CenaChange(Sender: TObject);
begin
  if cb_NoAkciz.Checked then
  Begin
    e_Akciz.Value:=0;
    lbCena.Caption:='Цена без налогов';
    lbCenaBN.Caption:='Цена без налогов';
  end
  else
  Begin
    e_Akciz.Value:=q_Prod.FieldByName('AKCIZ_VALUE').AsFloat;
    lbCena.Caption:='Цена вкл.акциз';
    lbCenaBN.Caption:='Цена без налогов';
  end;
  e_Cena_Bn.Value:=e_Cena.Value-e_Akciz.Value;
  e_nds20.Value:=Int(e_Cena.Value*NDSValue+0.5)/100;
  e_Cena_otp.Value:=e_Cena.Value+e_nds20.Value;
end;

procedure Tf_EdOtpCen.cb_ToClick(Sender: TObject);
begin
  if cb_To.Checked then
    e_EndDate.Enabled:=True
  else
    e_EndDate.Enabled:=False;
  e_EndDateChange(Sender);
end;

procedure Tf_EdOtpCen.e_sobstvExit(Sender: TObject);
begin
  lc_Sobstv.Value:=Trim(e_Sobstv.Text);
end;

procedure Tf_EdOtpCen.lc_SobstvChange(Sender: TObject);
begin
  e_Sobstv.Text:=lc_Sobstv.Value;
end;

procedure Tf_EdOtpCen.BitBtn1Click(Sender: TObject);
begin
  if (Grid_Prod.SelectedRows.Count=0) and (dgMultiSelect in grid_Prod.Options) then
    if MessageDlg('Не выделен ни один продукт! Это нормально?',mtConfirmation,[mbYes, mbNo],0)=mrNo then
      begin
        ModalResult:=mrNone;
        Exit;
      end;
{  if ll_Prod.Value='' then
    begin
      MessageDlg('А какой продукт?',mtError,[mbOk],0);
      ModalResult:=mrNone;
      Exit;
    end;}
  if lc_Sobstv.Value='' then
    begin
      MessageDlg('А какая собственность?',mtError,[mbOk],0);
      ModalResult:=mrNone;
      Exit;
    end;
  if lc_CatCen.Value='' then
    begin
      MessageDlg('А какая КАТЕГОРИЯ цены?',mtError,[mbOk],0);
      ModalResult:=mrNone;
      Exit;
    end;
  if lc_Post.Value='' then
    begin
      MessageDlg('А кто поставщик?',mtError,[mbOk],0);
      ModalResult:=mrNone;
      Exit;
    end;
end;

procedure Tf_EdOtpCen.lc_postChange(Sender: TObject);
begin
  e_Post.Text:=lc_Post.Value;
end;

procedure Tf_EdOtpCen.e_postExit(Sender: TObject);
begin
  lc_Post.Value:=e_Post.Text;
end;

procedure Tf_EdOtpCen.e_nds20Change(Sender: TObject);
begin
  e_Cena_otp.Value:=e_Cena.Value+e_nds20.Value;
end;

procedure Tf_EdOtpCen.FormDestroy(Sender: TObject);
begin
  q_Prod.Close;
  q_CatCen.Close;
  q_sobstv.Close;
  q_post.Close;
  q_PredprAkciz.Close;
end;

procedure Tf_EdOtpCen.e_Cena_NPOChange(Sender: TObject);
begin
  e_nds20_npo.Value:=RoundTo(e_Cena_npo.Value*(NDSValue/100),-2);
  e_Cena_otp_npo.Value:=e_Cena_npo.Value+e_nds20_npo.Value;
end;

procedure Tf_EdOtpCen.e_nds20_npoChange(Sender: TObject);
begin
  e_Cena_otp_npo.Value:=e_Cena_npo.Value+e_nds20_npo.Value;
end;

procedure Tf_EdOtpCen.e_Cena_otp_npoExit(Sender: TObject);
begin
  e_Cena_npo.Value:=RoundTo(e_Cena_otp_npo.Value/((100+NDSValue)/100),-2);
  e_nds20_npo.Value:=e_Cena_otp_npo.Value-e_Cena_npo.Value;
end;

procedure Tf_EdOtpCen.FormShow(Sender: TObject);
var s:string;
begin
  IsSetNoAkciz:=true;
  SetNoAkciz(q_CatCen.FieldByName('PLAT_ID').AsInteger,q_CatCen.FieldByName('EX_SVID').AsInteger,q_Prod.FieldByName('AKCIZ').AsInteger,q_Prod.FieldByName('PROD_GROUPS_ID').AsInteger,e_BeginDate.Date,e_EndDate.Date);
  s:=FormatDateTime('dd.mm.yyyy',e_BeginDate.Date);
  NDSValue:=pckBILLS.CallFloatFunction('GetNDSValueSTR',[s]);
end;

procedure Tf_EdOtpCen.e_EndDateChange(Sender: TObject);
begin
  SetNoAkciz(q_CatCen.FieldByName('PLAT_ID').AsInteger,q_CatCen.FieldByName('EX_SVID').AsInteger,q_Prod.FieldByName('AKCIZ').AsInteger,q_Prod.FieldByName('PROD_GROUPS_ID').AsInteger,e_BeginDate.Date,e_EndDate.Date);
end;

procedure Tf_EdOtpCen.q_ProdAfterScroll(DataSet: TDataSet);
begin
  SetNoAkciz(q_CatCen.FieldByName('PLAT_ID').AsInteger,q_CatCen.FieldByName('EX_SVID').AsInteger,q_Prod.FieldByName('AKCIZ').AsInteger,q_Prod.FieldByName('PROD_GROUPS_ID').AsInteger,e_BeginDate.Date,e_EndDate.Date);
end;

procedure Tf_EdOtpCen.SetNoAkciz(Plat_ID:integer; AKCIZ_PLAT_DEFAULT:integer; AKCIZ_PROD:integer; PROD_GROUPS_ID:integer; dBeg:TDateTime;dEnd:TDateTime);
var NoAkciz:boolean;
    FoundPeriod:boolean;
begin
  noAkciz:=false;
  FoundPeriod:=false;
  if IsSetNoAkciz then
  if AKCIZ_PROD=1 then // Подакцизный товар
  Begin
    // Ищем периоды наличия свидетельства в заданном периоде
    with q_PredprAkciz do
    try
      Close;
      SetVariable('PLAT_ID',Plat_ID);
      SetVariable('PROD_GROUPS_ID',PROD_GROUPS_ID);
      SetVariable('DATE_BEG',DateOf(dBeg));
      if (DateOf(dEnd)=0) or not cb_To.Checked then
        SetVariable('DATE_END',DateOf(EndOfTheYear(EndOfTheYear(Now)+1)))
      else
        SetVariable('DATE_END',DateOf(dEnd));
      Open;
      FoundPeriod:=not eof;
    except
    end;
    if FoundPeriod then
      NoAkciz:=(q_PredprAkciz.FieldByName('EX_SVID').AsInteger=1)
    else
      NoAkciz:=FoundPeriod;
  End;
  if Active then
  Begin
    cb_NoAkciz.Checked:=NoAkciz;
    e_CenaChange(Self);
  end;
end;

end.
