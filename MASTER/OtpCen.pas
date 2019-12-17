unit OtpCen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids,  OracleData, Oracle,
  StdCtrls, RXSpin, Menus, Placemnt, ComCtrls,
  PrnDbgeh, ToolWin, ActnMan, ActnCtrls, ExtCtrls, ActnList,MDIForm,
  Buttons, TB2Item, TB2Dock, TB2Toolbar,DBGrids,DBGridEhImpExp, XPStyleActnCtrls, EhLibDOA,
  PropFilerEh, PropStorageEh, TB2ExtItems, GridsEh, DBGridEh;

type
  Tf_OtpCen = class(Tf_MDIForm)
    q_OtpCen: TOracleDataSet;
    q_OtpCenNAME_NPR: TStringField;
    q_OtpCenCAT_CEN_NAME: TStringField;
    q_OtpCenCENA: TFloatField;
    q_OtpCenAKCIZ: TFloatField;
    q_OtpCenNDS20: TFloatField;
    q_OtpCenNGSM25: TFloatField;
    q_OtpCenCENA_OTP: TFloatField;
    q_OtpCenBEGIN_DATE: TDateTimeField;
    q_OtpCenEND_DATE: TDateTimeField;
    GridBrowse: TDBGridEh;
    ds_OtpCen: TDataSource;
    q_UpdOtpCen: TOracleQuery;
    q_OtpCenID_NPR: TStringField;
    q_OtpCenCAT_CEN_ID: TIntegerField;
    q_OtpCenID: TIntegerField;
    q_OtpCenPROD_ID_NPR: TStringField;
    q_OtpCenOWNERSHIP_ID: TIntegerField;
    q_OtpCenOWNERSHIP_NAME: TStringField;
    q_OtpCenSUPPLIER: TStringField;
    q_OtpCenSUPPLIER_ID: TIntegerField;
    PrintDBGridEh1: TPrintDBGridEh;
    ActionManager1: TActionManager;
    acNewPrice: TAction;
    acEdPrice: TAction;
    acPricesFilter: TAction;
    acPricesOraToDBF: TAction;
    acCopyPrices: TAction;
    acDeletePrices: TAction;
    acPrintPrices: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    e_OneCatCen: TRxSpinEdit;
    Label3: TLabel;
    e_BeginDate: TDateTimePicker;
    Label4: TLabel;
    e_BeginDate2: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    q_OtpCenPROTOKOL_NUM: TStringField;
    q_OtpCenPROTOKOL_DATE: TDateTimeField;
    SaveDialog1: TSaveDialog;
    acPricesSaveToXls: TAction;
    TBItem6: TTBItem;
    q_OtpCenIS_ORIGINAL: TIntegerField;
    cb_IsOriginal: TCheckBox;
    q_OtpCenPROTOKOL_BEGIN_DATE: TDateTimeField;
    cb_ActivePrices: TCheckBox;
    q_OtpCenCENA_NPO: TFloatField;
    q_OtpCenCENA_OTP_NPO: TFloatField;
    q_OtpCenNDS20_NPO: TFloatField;
    cb_CheckPrices: TCheckBox;
    acPricesOraToDBFJK: TAction;
    TBItem7: TTBItem;
    q_OtpCenNO_AKCIZ: TIntegerField;
    q_OtpCenPLAT_ID: TIntegerField;
    q_OtpCenCENA_BN: TFloatField;
    PropStorageEh1: TPropStorageEh;
    TBPopupMenu1: TTBPopupMenu;
    TBItem15: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem14: TTBItem;
    TBItem8: TTBItem;
    TBItem11: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem12: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acNewPriceExecute(Sender: TObject);
    procedure acEdPriceExecute(Sender: TObject);
    procedure GridBrowseDblClick(Sender: TObject);
    procedure ac_OneCatCenExecute(Sender: TObject);
    procedure ac_ToDBFExecute(Sender: TObject);
    procedure acCopyPricesExecute(Sender: TObject);
    procedure GridBrowseGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acDeletePricesExecute(Sender: TObject);
    procedure q_OtpCenBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acPricesSaveToXlsExecute(Sender: TObject);
    procedure cb_ActivePricesClick(Sender: TObject);
    procedure acPricesOraToDBFJKExecute(Sender: TObject);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem17Click(Sender: TObject);
    procedure TBItem18Click(Sender: TObject);
    procedure TBItem21Click(Sender: TObject);
    procedure q_OtpCenAfterOpen(DataSet: TDataSet);
    procedure q_OtpCenFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBItem12Click(Sender: TObject);
  private
    { Private declarations }
    Filter4grid: TStringList; // Фильтр для Grid
  public
    { Public declarations }
  end;

var
  f_OtpCen: Tf_OtpCen;

implementation
uses EdOtpCen, ORATODBF,Math, ForDB, main;
{$R *.DFM}

procedure Tf_OtpCen.FormCreate(Sender: TObject);
begin
  Filter4grid:=TStringList.Create;
  Filter4grid.Clear;
  q_otpcen.session:=f_main.ora_Session;
  q_updotpcen.session:=f_main.ora_Session;
  q_otpcen.Open;
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_OtpCen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    filter4grid.Clear;
  except
  end;
  q_OtpCen.Close;
  Action:=caFree;
end;

procedure Tf_OtpCen.acNewPriceExecute(Sender: TObject);
var
  I:Integer;
begin
  with TF_EdOtpCen.Create(Self) do
    begin
      IsAdd:=true;
      if e_OneCatCen.Value<>-1 then
      Begin
        e_CatCen.Text:=e_OneCatCen.text;
        lc_CatCen.Value:=Trim(e_CatCen.Text);
      end;
      if ShowModal=mrOk then
        with q_UpdOtpCen do
          for i:=0 to grid_Prod.SelectedRows.Count-1 do
            begin
              q_Prod.GotoBookmark(pointer(grid_Prod.SelectedRows.Items[i]));
              SQL.Clear;
              SQL.Add('INSERT INTO npr_prices (CAT_CEN_ID,PROD_ID_NPR,CENA_BN,CENA,NDS20,NGSM25,AKCIZ,CENA_OTP,BEGIN_DATE,end_date,INPUT_DATE,protokol_num,protokol_date,protokol_begin_date,OWNERSHIP_ID,SUPPLIER_ID,IS_ORIGINAL,NO_AKCIZ,cena_npo,nds20_npo,cena_otp_npo) VALUES (');
              SQL.Add(lc_CatCen.Value+',');
              SQL.Add(q_ProdID_NPR.AsString+',');
              SQL.Add(FloatToStr(e_Cena_bn.Value)+',');
              SQL.Add(FloatToStr(e_Cena.Value)+',');
              SQL.Add(e_NDS20.Text+',');
              SQL.Add('0,');
              SQL.Add(e_Akciz.Text+',');
              SQL.Add(e_Cena_Otp.Text+',');
              SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BeginDate.date)+''',''dd.mm.yyyy''),');
              if cb_To.checked AND (e_EndDate.Date > 0) then
                SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_EndDate.date)+''',''dd.mm.yyyy''),')
              else
                SQL.Add('NULL,');
              SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+''',''dd.mm.yyyy hh24:mi:ss''),');
              SQL.Add(''''+e_protokolnum.text+''',');
              SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_protokoldate.date)+''',''dd.mm.yyyy''),');
              SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_protokolbegindate.date)+''',''dd.mm.yyyy''),');
              SQL.Add(lc_sobstv.Value+',');
              SQL.Add(lc_post.Value+',');
              if cb_Original.Checked then
                SQL.Add('1,')
              else
                SQL.Add('0,');
              if cb_NoAkciz.Checked then
                SQL.Add('1,')
              else
                SQL.Add('0,');
              SQL.Add(e_cena_npo.Text+',');
              SQL.Add(e_nds20_npo.Text+',');
              SQL.Add(e_Cena_Otp_npo.Text+')');
              Execute;
            end;
            q_UpdOtpCen.Session.Commit;
            f_db.ReQuery(q_OtpCen,True);
      Free;
    end;
end;

procedure Tf_OtpCen.acEdPriceExecute(Sender: TObject);
begin
  with TF_EdOtpCen.Create(Self) do
    begin
      IsAdd:=false;
      grid_Prod.Options:=grid_Prod.Options-[dgMultiSelect];
      lc_CatCen.Value:=q_OtpCen.FieldByName('cat_cen_id').AsString;
//      ll_Prod.Value:=q_OtpCen.FieldByName('id_npr').AsString;
      q_Prod.Locate('ID_NPR',q_OtpCen.FieldByName('id_npr').AsString,[]);
      lc_Sobstv.Value:=q_OtpCen.FieldByName('ownership_id').AsString;
      lc_Post.Value:=q_OtpCen.FieldByName('supplier_id').AsString;
      e_Cena_bn.Value:=q_OtpCen.FieldByName('cena_bn').AsFloat;
      e_Cena.Value:=q_OtpCen.FieldByName('cena').AsFloat;
      e_NDS20.Text:=q_OtpCen.FieldByName('nds20').AsString;
      e_Akciz.Text:=q_OtpCen.FieldByName('akciz').AsString;
      e_Cena_Otp.Text:=q_OtpCen.FieldByName('Cena_Otp').AsString;
      e_BeginDate.DateTime:=q_OtpCen.FieldByName('Begin_Date').AsDateTime;
      e_EndDate.DateTime:=q_OtpCen.FieldByName('End_Date').AsDateTime;
      if q_OtpCen.FieldByName('End_Date').IsNull then
        cb_To.Checked:=false
      else
        cb_To.Checked:=true;
      cb_NoAkciz.Checked:=(q_OtpCen.FieldByName('NO_AKCIZ').AsInteger=1);
      e_protokolnum.Text:=q_OtpCen.FieldByName('protokol_num').AsString;
      e_protokoldate.Date:=q_OtpCen.FieldByName('protokol_date').AsDateTime;
      e_protokolbegindate.Date:=q_OtpCen.FieldByName('protokol_begin_date').AsDateTime;
      e_Cena_npo.Value:=q_OtpCen.FieldByName('cena_npo').AsFloat;
      e_NDS20_npo.Text:=q_OtpCen.FieldByName('nds20_npo').AsString;
      e_Cena_Otp_npo.Text:=q_OtpCen.FieldByName('Cena_Otp_npo').AsString;
      if q_OtpCen.FieldByName('is_original').AsInteger=1 then
        cb_Original.Checked:=True;
      if ShowModal=mrOk then
        with q_UpdOtpCen do
          begin
            SQL.Clear;
            SQL.Add('UPDATE npr_prices SET ');
            //(CAT_CEN_ID,PROD_ID_NPR,CENA,NDS20,NGSM25,AKCIZ,CENA_OTP,BEGIN_DATE,END_DATE,INPUT_DATE) VALUES (');
            SQL.Add('CAT_CEN_ID='+lc_CatCen.Value+',');
            SQL.Add('PROD_ID_NPR='+q_ProdID_NPR.AsString+',');
            SQL.Add('CENA_BN='+FloatToStr(e_Cena_bn.Value)+',');
            SQL.Add('CENA='+FloatToStr(e_Cena.Value)+',');
            SQL.Add('NDS20='+e_NDS20.Text+',');
            SQL.Add('AKCIZ='+e_Akciz.Text+',');
            SQL.Add('CENA_OTP='+e_Cena_Otp.Text+',');
            SQL.Add('CENA_NPO='+e_Cena_npo.Text+',');
            SQL.Add('NDS20_NPO='+e_NDS20_npo.Text+',');
            SQL.Add('CENA_OTP_NPO='+e_Cena_Otp_npo.Text+',');
            SQL.Add('BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BeginDate.date)+''',''dd.mm.yyyy''),');
            if cb_To.Checked then
              SQL.Add('end_date=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_EndDate.date)+''',''dd.mm.yyyy''),')
            else
              SQL.Add('end_date=null,');
            SQL.Add('protokol_num='''+e_protokolnum.text+''',');
            SQL.Add('protokol_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_protokoldate.date)+''',''dd.mm.yyyy''),');
            SQL.Add('protokol_begin_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_protokolbegindate.date)+''',''dd.mm.yyyy''),');
            SQL.Add('ownership_id='+lc_sobstv.Value+',');
            SQL.Add('supplier_id='+lc_post.Value+',');
            if cb_Original.Checked then
              SQL.Add('is_original=1,')
            else
              SQL.Add('is_original=0,');
            if cb_NoAkciz.Checked then
              SQL.Add('no_akciz=1')
            else
              SQL.Add('no_akciz=0');
            SQL.Add('WHERE id='+q_OtpCen.FieldByName('id').AsString);
//            SQL.SaveToFile('c:\tmp\a.txt');
            Execute;
            Session.Commit;
            f_db.ReQuery(q_OtpCen,True);
          end;
      Free;
    end;
end;

procedure Tf_OtpCen.GridBrowseDblClick(Sender: TObject);
begin
  acEdPrice.Execute;
end;

procedure Tf_OtpCen.ac_OneCatCenExecute(Sender: TObject);
begin
  f_db.ReQuery(q_OtpCen,False);
end;

procedure Tf_OtpCen.ac_ToDBFExecute(Sender: TObject);
begin
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='NPR_PRICES';
      ShowModal;
    end;
end;

procedure Tf_OtpCen.acCopyPricesExecute(Sender: TObject);
var
  i:integer;
  S:String;
  NewDate:TDateTime;
begin
  if (GridBrowse.SelectedRows.Count>0) then
    begin
      S:=DateToStr(date);
      if InputQuery('Копирование цены','Введите дату начала действия цены',S) then
        begin
          NewDate:=StrTodate(S);
          for i:=0 to GridBrowse.SelectedRows.Count-1 do
            begin
              q_OtpCen.GotoBookmark(pointer(GridBrowse.SelectedRows.Items[i]));
              with q_UpdOtpCen do
                begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO npr_prices (CAT_CEN_ID,PROD_ID_NPR,CENA,NDS20,NGSM25,AKCIZ,CENA_OTP,BEGIN_DATE,INPUT_DATE,OWNERSHIP_ID,SUPPLIER_ID,PROTOKOL_DATE,PROTOKOL_BEGIN_DATE,PROTOKOL_NUM,IS_ORIGINAL) VALUES (');
                  SQL.Add(q_OtpCen.FieldByName('cat_cen_id').AsString+',');
                  SQL.Add(''''+q_OtpCen.FieldByName('prod_id_npr').AsString+''',');
                  SQL.Add(q_OtpCen.FieldByName('cena').AsString+',');
                  SQL.Add(q_OtpCen.FieldByName('nds20').AsString+',');
                  SQL.Add(q_OtpCen.FieldByName('ngsm25').AsString+',');
                  SQL.Add(q_OtpCen.FieldByName('akciz').AsString+',');
                  SQL.Add(q_OtpCen.FieldByName('cena_otp').AsString+',');
                  SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',NewDate)+''',''dd.mm.yyyy''),');
                  SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy hh:nn:ss',Now)+''',''dd.mm.yyyy hh24:mi:ss''),');
                  SQL.Add(q_OtpCen.FieldByName('ownership_id').AsString+',');
                  SQL.Add(q_OtpCen.FieldByName('supplier_id').AsString+',');
                  SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy hh:nn:ss',q_OtpCen.FieldByName('protokol_date').AsDateTime)+''',''dd.mm.yyyy hh24:mi:ss''),');
                  SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy hh:nn:ss',q_OtpCen.FieldByName('protokol_begin_date').AsDateTime)+''',''dd.mm.yyyy hh24:mi:ss''),');
                  SQL.Add(''''+q_OtpCen.FieldByName('protokol_num').AsString+''',0)');
                  Execute;
                  SQL.Clear;
                  SQL.Add('UPDATE npr_prices SET END_DATE=');
                  SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',NewDate-1)+''',''dd.mm.yyyy'')');
                  SQL.Add('WHERE id='+q_OtpCen.FieldByName('id').AsString);
                  Execute;
                  Session.Commit;
                end;
            end;
        end;
    end;
  f_db.ReQuery(q_OtpCen,True);
end;

procedure Tf_OtpCen.GridBrowseGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (q_OtpCen.FieldByName('end_date').AsDateTime<date) and
     (q_OtpCen.FieldByName('end_date').AsDateTime<>0) then
    AFont.Style:=AFont.Style+[fsStrikeout];
end;

procedure Tf_OtpCen.acDeletePricesExecute(Sender: TObject);
var
  I:Integer;
begin

if (GridBrowse.SelectedRows.Count>0) then
  if MessageDlg('Вы действительно хотите удалить выделенные цены?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
    for i:=0 to GridBrowse.SelectedRows.Count-1 do
      begin
        q_OtpCen.GotoBookmark(pointer(GridBrowse.SelectedRows.Items[i]));
        with q_UpdOtpCen do
          begin
            SQL.Clear;
            SQL.Add('DELETE FROM npr_prices ');
            SQL.Add('WHERE id='+q_OtpCen.FieldByName('id').AsString);
            Execute;
            Session.Commit;
          end;
        f_db.ReQuery(q_OtpCen,False);
      end;
end;

procedure Tf_OtpCen.q_OtpCenBeforeOpen(DataSet: TDataSet);
begin
  with q_OtpCen do
    begin
      SQL[1]:='WHERE 1=1 ';
      if e_oneCatCen.Value<>-1 then
        SQL[1]:=SQL[1]+' AND CAT_CEN_ID='+FloatToStr(e_oneCatCen.Value);
      IF (cb_IsOriginal.Checked) and (not cb_CheckPrices.Checked) then
        SQL[1]:=SQL[1]+' AND is_original=1';
      IF cb_ActivePrices.Checked then
        SQL[1]:=SQL[1]+' AND end_date is null';
      if not (cb_ActivePrices.Checked or cb_CheckPrices.Checked) then
        begin
          SQL[1]:=SQL[1]+' AND begin_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BeginDate.Date)+''',''dd.mm.yyyy'')';
          SQL[1]:=SQL[1]+' AND begin_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BeginDate2.Date)+''',''dd.mm.yyyy'')';
        end;
      if cb_CheckPrices.Checked then
        begin
          SQL[1]:=SQL[1]+' AND id in (select a.id from npr_prices a,npr_prices b where a.id<>b.id '+
            ' AND a.begin_date<=nvl(b.END_DATE,TO_DATE(''31.12.2200'',''dd.mm.yyyy'')) and nvl(a.END_DATE,TO_DATE(''31.12.2200'',''dd.mm.yyyy''))>=b.begin_date and a.CAT_CEN_ID=b.CAT_CEN_ID and a.PROD_ID_NPR=b.PROD_ID_NPR)';
        end;
      SQL.SaveToFile('c:\tmp\a.txt');
    end;
end;

procedure Tf_OtpCen.FormShow(Sender: TObject);
begin
  q_OtpCen.Open;
end;

procedure Tf_OtpCen.acPrintExecute(Sender: TObject);
begin
  with PrintDBGridEh1 do
    begin
      Title.Clear;
      Title.Add('Отпускные цены на нефтепродукты');
      Title.Add('c '+FormatDateTime('dd.mm.yyyy',e_BeginDate.Date)+'г.');
      if e_OneCatCen.Value<>-1 then
        Title.Add('Категория цены: '+FloatToStr(e_OneCatCen.Value));
      Preview;
    end;
end;

procedure Tf_OtpCen.acPricesSaveToXlsExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridBrowse,SaveDialog1.FileName,True)
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridBrowse,SaveDialog1.FileName,True);
end;
procedure Tf_OtpCen.cb_ActivePricesClick(Sender: TObject);
begin
  inherited;
  e_BeginDate.Enabled:=not cb_ActivePrices.Checked;
  e_BeginDate2.Enabled:=not cb_ActivePrices.Checked;
end;

procedure Tf_OtpCen.acPricesOraToDBFJKExecute(Sender: TObject);
begin
  inherited;
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='NPR_PRICES_P';
      ShowModal;
    end;
end;

procedure Tf_OtpCen.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(GridBrowse,filter4grid,NewText,Accept);
end;

procedure Tf_OtpCen.TBItem17Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(GridBrowse,filter4grid);
end;

procedure Tf_OtpCen.TBItem18Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCLear(GridBrowse,filter4grid);
end;

procedure Tf_OtpCen.TBItem21Click(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(GridBrowse);
end;

procedure Tf_OtpCen.q_OtpCenAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if filter4grid.Count=0 then
  for i:=1 to q_OtpCen.FieldCount do
  Begin
    Filter4grid.Add('');
  end;
end;

procedure Tf_OtpCen.q_OtpCenFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(GridBrowse,filter4grid);
end;

procedure Tf_OtpCen.TBItem12Click(Sender: TObject);
begin
  inherited;
  F_DB.GridSQL(Self,GridBrowse,q_OtpCen.SQL.Text,q_OtpCen);
end;

end.

