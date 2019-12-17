Unit what;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, StdCtrls, Mask, ToolEdit, ExtCtrls, Grids,
  DBGridEh, Oracle, ActnList, XPStyleActnCtrls, ActnMan, Buttons, ImgList,
  ComCtrls, Menus,EhlibDOA, GridsEh;

Type
  TfrmWhat = Class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Label2: TLabel;
    Label3: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    oraWhat: TOracleDataSet;
    dsWhat: TDataSource;
    oraMain: TOracleSession;
    BitBtn1: TBitBtn;
    ActionManager1: TActionManager;
    acFilter: TAction;
    oraWhatKVIT_ID: TFloatField;
    oraWhatTASK: TStringField;
    oraWhatRN: TFloatField;
    oraWhatSUBTASK: TFloatField;
    oraWhatMONTH_ID: TStringField;
    oraWhatSTATUS: TFloatField;
    oraWhatFACEACC_RN: TFloatField;
    oraWhatAUTHID: TStringField;
    oraWhatID: TFloatField;
    oraWhatSVED_NUM: TFloatField;
    oraWhatDATE_KVIT: TDateTimeField;
    cbTypeDoc: TComboBoxEx;
    mLog: TMemo;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure oraWhatBeforeDelete(DataSet: TDataSet);
    Procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmWhat                               : TfrmWhat;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmWhat.acFilterExecute(Sender: TObject);
Begin
  If oraWhat.Active Then
    oraWhat.Close;
  oraWhat.SQL[4] := 'and date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraWhat.SQL[5] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  Case cbTypeDoc.ItemIndex Of
    2: oraWhat.SQL[6] := 'and task=''IncomingOrders'' and subtask=1';
    3: oraWhat.SQL[6] := 'and task=''IncomingOrders'' and subtask=2';
    0: oraWhat.SQL[6] := 'and task=''DepartmentsOrders'' and subtask=1';
    4: oraWhat.SQL[6] := 'and task=''GoodsTransInvoicesToDepts'' and subtask=1';
    1: oraWhat.SQL[6] := 'and task=''ConsumersOrders'' and subtask=1';
    5: oraWhat.SQL[6] := 'and task=''GoodsTransInvoicesToConsumers'' and subtask=2';
    6: oraWhat.SQL[6] := 'and task=''GoodsTransInvoicesToConsumers'' and subtask=1';
    7: oraWhat.SQL[6] := 'and task=''IncomingOrders'' and (subtask=4 or subtask=5)';
    8: oraWhat.SQL[6] := 'and task=''GoodsTransInvoicesToConsumers'' and subtask=3';
    Else
      oraWhat.SQL[6] := 'and task=''GoodsTransInvoicesTo''';
  End;
  oraWhat.Open;

End;

Procedure TfrmWhat.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
End;

Procedure TfrmWhat.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraWhat.Close;
  oraMain.Connected := false;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := frmmain.oraParusMain.LogonUsername + '@' + frmmain.oraParusMain.LogonDatabase;
      Sender.Text := frmmain.oraParusMain.LogonUsername + '@' + frmmain.oraParusMain.LogonDatabase;
      Subject := 'Special Functions ' + frmmain.oraParusMain.LogonUsername + '@' + frmmain.oraParusMain.LogonDatabase;
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmWhat.oraWhatBeforeDelete(DataSet: TDataSet);
Var
  messageText                           : String;
Begin
  messageText := 'Пользователь ' + frmmain.oraParusMain.LogonUsername + ' удалил запись: ';
  Case cbTypeDoc.ItemIndex Of
    2: messageText := messageText + 'Приходный ордер № ' + oraWhat.fieldByName('kvit_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    3: messageText := messageText + 'Ж\Д ордер № ' + oraWhat.fieldByName('kvit_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    0: messageText := messageText + 'Заявку подразделению № ' + oraWhat.fieldByName('month_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    4: messageText := messageText + 'Накладную подразделению № ' + oraWhat.fieldByName('kvit_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    1: messageText := messageText + 'Заявку потребителя № ' + oraWhat.fieldByName('month_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    5: messageText := messageText + 'Накладную потребителям (ЖД) № ' + oraWhat.fieldByName('kvit_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
    6: messageText := messageText + 'Накладную потребителям (Продукт) № ' + oraWhat.fieldByName('kvit_id').AsString + ' за ' + oraWhat.fieldByName('date_kvit').AsString;
  End;
  mlog.Lines.Add(messageText + #13#10);
End;

Procedure TfrmWhat.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraWhat.RecNo) Then
    background := clMoneyGreen;
End;

End.
