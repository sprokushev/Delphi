unit loader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Placemnt, Menus, ImgList, PrnDbgeh, Oracle, DB, OracleData, ActnList, XPStyleActnCtrls, ActnMan,
  ComCtrls, StdCtrls, Grids, DBGridEh, ToolEdit, Mask, RxLookup, Buttons, ExtCtrls, Dialogs, rxStrUtils,
  DateUtils, PropStorageEh,DBGridEhImpExp,Clipbrd,Commctrl,MdiForm, TB2Item;
type
  Tcb2parus = class(Tf_MDIForm)
    oraDScb: TOracleSession;
    ActionManager1: TActionManager;
    Panel1: TPanel;
    oraACC: TOracleDataSet;
    dsACC: TDataSource;
    acFilter: TAction;
    oraVyp: TOracleDataSet;
    dsVyp: TDataSource;
    oraVypBO_DT: TDateTimeField;
    oraVypBO_INN_R: TStringField;
    oraVypBO_INN_S: TStringField;
    oraVypBO_KS_R: TStringField;
    oraVypBO_KS_S: TStringField;
    oraVypBO_ACC_R: TStringField;
    oraVypBO_ACC_S: TStringField;
    oraVypBO_BIK_R: TStringField;
    oraVypBO_BIK_S: TStringField;
    oraVypBO_SUMM: TFloatField;
    oraVypBO_SENDER: TStringField;
    oraVypBO_RECEIVER: TStringField;
    oraVypBO_NUM: TStringField;
    oraVypBO_NAZN: TStringField;
    oraVypBO_VID: TIntegerField;
    oraVypBO_RN_PARUS: TFloatField;
    oraVypID: TFloatField;
    oraVypACCKEY: TStringField;
    prCB: TPrintDBGridEh;
    acPrint: TAction;
    ImageList1: TImageList;
    TBPopupMenu1: TTBPopupMenu;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Panel4: TPanel;
    grVyp: TDBGridEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lcACC: TRxDBLookupCombo;
    Label2: TLabel;
    edDate: TDateEdit;
    btnFilter: TBitBtn;
    acCopy: TAction;
    acXLS: TAction;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    oraVypDEBET: TFloatField;
    oraVypKREDIT: TFloatField;
    oraVypID_CODE: TFloatField;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    acVypRTF: TAction;
    TBItem9: TTBItem;
    q1: TOracleQuery;
    edDate2: TDateEdit;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    bv_sin: TLabel;
    bv_in: TLabel;
    bv_out: TLabel;
    bv_sout: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acFilterExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure grVypSortMarkingChanged(Sender: TObject);
    procedure oraInsertArrayError(Sender: TOracleQuery; Index,
      ErrorCode: Integer; const ErrorMessage: String;
      var Continue: Boolean);
    procedure acCopyExecute(Sender: TObject);
    procedure acXLSExecute(Sender: TObject);
    procedure acVypRTFExecute(Sender: TObject);
    procedure grVypGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses ForDB, main;

{$R *.dfm}
procedure Tcb2parus.FormCreate(Sender: TObject);
begin
//    f_main.LogonMasterSession(oraDScb);
//    f_main.ReQuery(oraacc,false);
    oraDScb.Connected:=true;
    oraacc.Open;
    edDate.Date:=date()-1;
    edDate2.Date:=date()-1;
end;

procedure Tcb2parus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
oravyp.Close;
oraacc.Close;
oradscb.Commit;
oradscb.Connected:=false;
action:=caFree
end;

procedure Tcb2parus.acFilterExecute(Sender: TObject);
var
i:integer;
begin
  btnFilter.Cursor:=crSQLWait;
  if oraVyp.Active then oraVyp.Close;

  oraVyp.SQL[12]:='and cb.bo_dt between TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDate.Date)+''',''dd.mm.yyyy'') and TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDate2.Date)+''',''dd.mm.yyyy'')';
  if  lcACC.Value<>'0' then //Все счета или конлретный
  begin
  oraVyp.SQL[13]:='and cb.acckey='''+oraACC.Fieldbyname('bv_acc').asString+'''';
  grVyp.UseMultiTitle:=false;
  for i:=0 to grVyp.Columns.Count-1 do
    if edDate.Date=edDate2.Date then
    grVyp.Columns[i].Title.Caption:='Выписка по счету '+lcACC.DisplayValue+' за '+edDate.text+grVyp.Columns[i].Field.DisplayLabel
    else
    grVyp.Columns[i].Title.Caption:='Выписка по счету '+lcACC.DisplayValue+' c '+edDate.text+' по '+edDate2.text+grVyp.Columns[i].Field.DisplayLabel;
    grVyp.UseMultiTitle:=true;
    q1.SQL.Clear;
    q1.SQL.Add('select /*+ ORDERED*/ bv_sin,bv_in,bv_out,bv_sout from pvz.pvz_bnvyp where');
    q1.SQL.add('bv_date=TO_DATE('''+FormatDateTime('dd.mm.yyyy',edDate.Date)+''',''dd.mm.yyyy'')');
    q1.SQL.Add('and bv_acc='''+oraACC.Fieldbyname('bv_acc').asString+'''');
    q1.Execute;
    if q1.RowCount=1 then
      begin
        bv_sin.Caption:=q1.FieldAsString(0);
        bv_in.Caption:=q1.FieldAsString(1);
        bv_out.Caption:=q1.FieldAsString(2);
        bv_sout.Caption:=q1.FieldAsString(3);
      end else
      begin
        q1.SQL.Clear;
        q1.SQL.Add('select /*+ ORDERED*/ bv_sout from pvz.pvz_bnvyp where');
        q1.SQL.add('bv_date=(select max(bv_date) from pvz.pvz_bnvyp where bv_acc='''+oraACC.Fieldbyname('bv_acc').asString+''')');
        q1.SQL.Add('and bv_acc='''+oraACC.Fieldbyname('bv_acc').asString+'''');
        q1.Execute;
        if q1.RowCount=1 then
        begin
          bv_sin.Caption:=q1.FieldAsString(0);
          bv_sout.Caption:=q1.FieldAsString(0);
        end else
        begin
          bv_sin.Caption:='0';
          bv_sout.Caption:='0';
        end;
        bv_in.Caption:='0';
        bv_out.Caption:='0';
      end;
    q1.SQL.Clear;
    end
  else //Все счета
   begin
    grVyp.UseMultiTitle:=false;
    for i:=0 to grVyp.Columns.Count-1 do
    if edDate.Date=edDate2.Date then
    grVyp.Columns[i].Title.Caption:='Выписка по всем счетам за '+edDate.text+grVyp.Columns[i].Field.DisplayLabel
    else
    grVyp.Columns[i].Title.Caption:='Выписка по всем счетам c '+edDate.text+' по '+edDate2.text+grVyp.Columns[i].Field.DisplayLabel;
    grVyp.UseMultiTitle:=true;
    oraVyp.SQL[13]:=' ';
        bv_sin.Caption:='';
        bv_in.Caption:='';
        bv_out.Caption:='';
        bv_sout.Caption:='';
   end;   //Все счета
    oraVyp.Open;
    btnFilter.Cursor:=crDefault;
end;

procedure Tcb2parus.acPrintExecute(Sender: TObject);
begin
prCB.PageHeader.CenterText.Clear;
prCB.PageHeader.CenterText.Add('По счету '+lcACC.DisplayValue+' за '+edDate.text);
prCB.PageHeader.CenterText.Add('Входящее сальдо '+bv_sin.Caption);
prCB.PageHeader.CenterText.Add('Исходящее сальдо '+bv_sout.Caption);
prCB.Preview;
end;

procedure Tcb2parus.grVypSortMarkingChanged(Sender: TObject);
begin
f_db.SortInGrid(oraVyp,16,grVyp);
end;

procedure Tcb2parus.oraInsertArrayError(Sender: TOracleQuery; Index,
  ErrorCode: Integer; const ErrorMessage: String; var Continue: Boolean);
begin
ShowMessage(ErrorMessage);
end;

procedure Tcb2parus.acCopyExecute(Sender: TObject);
begin
DBGridEh_DoCopyAction(grVyp,False);
end;

procedure Tcb2parus.acXLSExecute(Sender: TObject);
begin
SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grVyp,f_main.TempLocalPath+'Vypiska.xls',False);
ShowMessage('Сформирован файл '+f_main.TempLocalPath+'Vypiska.xls');
end;


procedure Tcb2parus.acVypRTFExecute(Sender: TObject);
begin
SaveDBGridEhToExportFile(TDBGridEhExportAsRTF,grVyp,f_main.TempLocalPath+'Vypiska.rtf',true);
ShowMessage('Сформирован файл '+f_main.TempLocalPath+'Vypiska.rtf');
end;

procedure Tcb2parus.grVypGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if odd(oraVyp.RecNo) then  background:=clInfoBk;
end;

end.
