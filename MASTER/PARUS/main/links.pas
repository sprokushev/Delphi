Unit links;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData, Oracle,
  StdCtrls, Mask, ToolEdit, Buttons;

Type
  TfrmLinks = Class(TForm)
    ActionManager1: TActionManager;
    acDepord2ttn17d: TAction;
    acCord2ttn17: TAction;
    OracleQuery1: TOracleQuery;
    oraMainSelect: TOracleDataSet;
    deDateBegin: TDateEdit;
    deDateEnd: TDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    oraMain: TOracleSession;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    acTtn17d2pr17: TAction;
    acTtn172pr17: TAction;
    oraMainInsert: TOracleQuery;
    Procedure acCord2ttn17Execute(Sender: TObject);
    Procedure acDepord2ttn17dExecute(Sender: TObject);
    Procedure acTtn17d2pr17Execute(Sender: TObject);
    Procedure acTtn172pr17Execute(Sender: TObject);
    Procedure ToParus(rn_in, rn_out, id: integer; task_in, task_out: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmLinks                              : TfrmLinks;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmLinks.ToParus(rn_in, rn_out, id: integer; task_in, task_out: String);
Begin
  { oraParusInsert.Lines.Clear;
   oraParusInsert.Lines.Add('P_DOCINPT_BASE_INSERT (');
   oraParusInsert.Lines.Add('2,');//  nCOMPANY
   oraParusInsert.Lines.Add(''''+oraMainSelect.fieldbyName('task_in').AsString +''',');//  sUNITCODE
   oraParusInsert.Lines.Add(oraMainSelect.fieldbyName('rn_in').AsString +',');//  nDOCUMENT
   oraParusInsert.Lines.Add('null,');//  nPRN_DOCUMENT
   oraParusInsert.Lines.Add('sysdate,');//  dIN_DATE
   oraParusInsert.Lines.Add('0,');//  nSTATUS
   oraParusInsert.Lines.Add('1)'); // nBREAKUP_KIND
   oraParusInsert.Execute;
   rn_input:=oraParusInsert.Output.Strings[1];
   oraParusInsert.Lines.Clear;
   oraParusInsert.Lines.Add('P_DOCOUTPT_BASE_INSERT (');
   oraParusInsert.Lines.Add('2,');//  nCOMPANY
   oraParusInsert.Lines.Add(''''+oraMainSelect.fieldbyName('task_out').AsString +''',');//  sUNITCODE
   oraParusInsert.Lines.Add(oraMainSelect.fieldbyName('rn_out').AsString +',');//  nDOCUMENT
   oraParusInsert.Lines.Add('null,');//  nPRN_DOCUMENT
   oraParusInsert.Lines.Add('sysdate,');//  dIN_DATE
   oraParusInsert.Lines.Add('0,');//  nSTATUS
   oraParusInsert.Lines.Add('1)'); // nBREAKUP_KIND
   oraParusInsert.Execute;
   rn_output:=oraParusInsert.Output.Strings[1];
   oraParusInsert.Lines.Clear;
   oraParusInsert.Lines.Add('P_DOCLINKS_INSERT (');
   oraParusInsert.Lines.Add(rn_input+',');// in_doc
   oraParusInsert.Lines.Add(rn_output+')'); // out_doc
   oraParusInsert.Execute;
   oraParusInsert.Lines.Clear;
   oraParusInsert.Session.Commit;
   oraMainInsert.SQL.Clear;
   oraMainInsert.SQL.Add('update parus_fin status=1 where id='+inttostr(id));
   oraMainInsert.Session.Commit;
   oraMainInsert.SQL.Clear;    }
End;

Procedure TfrmLinks.acCord2ttn17Execute(Sender: TObject);
Var
  rn_input, rn_output                   : String;
Begin
  oraMainSelect.close;
  oraMainSelect.sql[2] := 'and pf.TASK=''ConsumersOrders'' and pf2.TASK=''GoodsTransInvoicesToConsumers''';
  oraMainSelect.sql[3] := 'and pf.month_id in (select pf1.MONTH_ID from parus_fin pf1';
  oraMainSelect.sql[4] := 'where pf1.TASK=''GoodsTransInvoicesToConsumers'' and pf1.status=0)';
  oraMainSelect.open;
  oraMainSelect.first;
  While Not oraMainSelect.eof Do
    Begin
      oraMainSelect.Next;
    End;
End;

Procedure TfrmLinks.acDepord2ttn17dExecute(Sender: TObject);
Begin
  oraMainSelect.close;
  oraMainSelect.sql[2] := 'and pf.TASK=''DepartmentsOrders'' and pf2.TASK=''GoodsTransInvoicesToConsumers''';
  oraMainSelect.sql[3] := 'and pf.month_id in (select pf1.MONTH_ID from parus_fin pf1';
  oraMainSelect.sql[4] := 'where pf1.TASK=''GoodsTransInvoicesToConsumers'' and pf1.status=0)';
  oraMainSelect.open
End;

Procedure TfrmLinks.acTtn17d2pr17Execute(Sender: TObject);
Begin
  oraMainSelect.close;
  oraMainSelect.sql[2] := 'and pf.TASK=''GoodsTransInvoicesToConsumers'' and pf2.TASK=''IncomingOrders''';
  oraMainSelect.sql[3] := 'and pf.month_id in (select pf1.MONTH_ID from parus_fin pf1';
  oraMainSelect.sql[4] := 'where pf1.TASK=''IncomingOrders'' and pf1.status=0)';
  oraMainSelect.open
End;

Procedure TfrmLinks.acTtn172pr17Execute(Sender: TObject);
Begin
  oraMainSelect.close;
  oraMainSelect.sql[2] := 'and pf.TASK=''GoodsTransInvoicesToConsumers'' and pf1.TASK=''IncomingOrders''';
  oraMainSelect.sql[3] := 'and pf.month_id in (select pf1.MONTH_ID from parus_fin pf1';
  oraMainSelect.sql[4] := 'where pf1.TASK=''IncomingOrders'' and pf1.status=0)';
  oraMainSelect.open
End;

End.
