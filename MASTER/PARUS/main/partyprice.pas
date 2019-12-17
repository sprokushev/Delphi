Unit partyprice;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Buttons, Mask, ToolEdit, ActnList, XPStyleActnCtrls, ActnMan, GridsEh;

Type
  TfrmPP = Class(TForm)
    oraPartyPrice: TOracleDataSet;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    dsPP: TDataSource;
    ActionManager1: TActionManager;
    acFilter: TAction;
    Label2: TLabel;
    deBeg: TDateEdit;
    Label3: TLabel;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    oraDetail: TOracleDataSet;
    oraDetailINDOCDATE: TDateTimeField;
    oraDetailINDOCPREF: TStringField;
    oraDetailINDOCNUMB: TStringField;
    oraDetailPLANQUANT: TFloatField;
    oraDetailMODIF_CODE: TStringField;
    dsDetail: TDataSource;
    oraPartyPricePARTY: TFloatField;
    oraPartyPricePRICE: TFloatField;
    oraPartyPricePP: TStringField;
    oraParus: TOracleSession;
    oraPartyPriceNOMMODIF: TFloatField;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmPP                                 : TfrmPP;

Implementation
Uses MAIN;

{$R *.dfm}

Procedure TfrmPP.acFilterExecute(Sender: TObject);
Begin
  If oraPartyPrice.Active Then
    oraPartyPrice.Close;
  If oraDetail.Active Then
    oraDetail.Close;
  oraPartyPrice.SQL[8] := 'and p.entry_date between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'') and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraPartyPrice.Open;
  oraDetail.Open;
End;

Procedure TfrmPP.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 30;
  deEnd.Date := date;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
End;

Procedure TfrmPP.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  If oraPartyPrice.Active Then
    oraPartyPrice.Close;
  If oraDetail.Active Then
    oraDetail.Close;
  oraParus.Connected := false;
  action := caFree;
End;

End.
