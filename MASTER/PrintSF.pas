unit PrintSF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, OracleData, Oracle, RxLookup, ExtCtrls,
  RXSpin, Mask, DBCtrls, DateUtils;

type
  Tf_PrintSF = class(TForm)
    GroupBox2: TGroupBox;
    q_Dog: TOracleDataSet;
    ds_Dog: TDataSource;
    q_DogDOG_NUMBER: TStringField;
    q_DogPREDPR_NAME: TStringField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    e_Date1: TDateTimePicker;
    e_Date2: TDateTimePicker;
    GroupBox4: TGroupBox;
    lc_Dog: TRxDBLookupCombo;
    e_sfNo1: TRxSpinEdit;
    e_sfNo2: TRxSpinEdit;
    t_Signs: TOracleDataSet;
    ds_signs: TDataSource;
    t_SignsBOSS: TStringField;
    t_SignsBLAVBUH: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    e_sfNo3: TRxSpinEdit;
    Label9: TLabel;
    e_sfNo4: TRxSpinEdit;
    rbR3: TRadioButton;
    rbOrig: TRadioButton;
    q_cmn: TOracleQuery;
    GroupBox5: TGroupBox;
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox6: TGroupBox;
    Button5: TButton;
    Button8: TButton;
    Button6: TButton;
    Button7: TButton;
    GroupBox7: TGroupBox;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Label10: TLabel;
    t_Dover: TOracleDataSet;
    ds_Dover: TDataSource;
    t_DoverID: TFloatField;
    t_DoverPOST_COMPANY: TStringField;
    t_DoverPOST_DOLJ: TStringField;
    t_DoverPOST_FIO: TStringField;
    t_DoverPOST_DOVER: TStringField;
    t_DoverPOKUP_COMPANY: TStringField;
    t_DoverPOKUP_DOLJ: TStringField;
    t_DoverPOKUP_FIO: TStringField;
    t_DoverPOKUP_DOVER: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    t_SignsSF_DOVER_ID: TFloatField;
    t_DoverDISPLAY: TStringField;
    t_DoverPOST_DOLJ_SIGN: TStringField;
    t_DoverPOST_FIO_SIGN: TStringField;
    t_DoverPOKUP_DOLJ_SIGN: TStringField;
    t_DoverPOKUP_FIO_SIGN: TStringField;
    GroupBox8: TGroupBox;
    Button13: TButton;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure e_sfNo1Change(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure e_sfNo3Change(Sender: TObject);
    procedure e_sfNo2Change(Sender: TObject);
    procedure e_sfNo4Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure t_DoverCalcFields(DataSet: TDataSet);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure Button13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PrintSF: Tf_PrintSF;

implementation
uses ForReport, main, ForFiles;
{$R *.dfm}

procedure Tf_PrintSF.Button2Click(Sender: TObject);
begin
  If rbR3.Checked then
  Begin
    exit;
  End;
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Акты приемо-передачи по договору комиссии (2003 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('aktSFkomiss.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
        '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.FormCreate(Sender: TObject);
begin
  q_dog.session:=f_main.ora_Session;
  t_signs.session:=f_main.ora_Session;
  t_dover.session:=f_main.ora_Session;
  q_cmn.Session:=f_main.ora_Session;
  q_Dog.Open;
  t_Signs.Open;
  t_dover.open;
  if t_Signs.Eof then
  try
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('BEGIN');
    q_cmn.SQL.Add('  INSERT INTO V_SF_SIGNS (BOSS, BLAVBUH) VALUES('''','''');');
    q_cmn.SQL.Add('  COMMIT;');
    q_cmn.SQL.Add('END;');
    q_cmn.Execute;
    q_cmn.Close;
  finally
    t_Signs.Close;
    t_Signs.Open;
  end;
  e_Date1.Date:=StartOfTheYear(Now);
  e_Date2.Date:=EndOfTheYear(Now);
end;

procedure Tf_PrintSF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_Dog.Close;
  t_Signs.Close;
  Action:=caFree;
end;

procedure Tf_PrintSF.Button4Click(Sender: TObject);
begin
  If rbR3.Checked then
  Begin
    exit;
  End;
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета (2003 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetPredopl.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
        '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button3Click(Sender: TObject);
begin
  If (VarType(lc_Dog.KeyValue)=varNull) AND
     ((rbR3.Checked AND (e_sfNo1.Value=1000000000) AND (e_sfNo2.Value=2000000000)) OR
      (rbOrig.Checked AND (e_sfNo3.Value=100000) AND (e_sfNo4.Value=200000))) then
  Begin
    Application.MessageBox('Выберите договор!','Внимание!',MB_OK);
    exit;
  End;

  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Акты приемо-передачи по договору поставки (2003 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('aktSFPostav.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button1Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета-фактуры (2003 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetFactura.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.e_sfNo1Change(Sender: TObject);
begin
  e_sfNo2.Value:=e_sfNo1.Value;
  rbR3.Checked:=true;
end;

procedure Tf_PrintSF.DBEdit1Exit(Sender: TObject);
begin
  if t_Signs.State=dsEdit then
    begin
      t_Signs.Post;
    end;
end;

procedure Tf_PrintSF.e_sfNo3Change(Sender: TObject);
begin
  e_sfNo4.Value:=e_sfNo3.Value;
  rbOrig.Checked:=true;
end;

procedure Tf_PrintSF.e_sfNo2Change(Sender: TObject);
begin
  rbR3.Checked:=true;
end;

procedure Tf_PrintSF.e_sfNo4Change(Sender: TObject);
begin
  rbOrig.Checked:=true;
end;

procedure Tf_PrintSF.Button5Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета-фактуры (ОТДЕЛЬНАЯ ПОЗИЦИЯ НА ВАГОН/МАШИНУ) (2004 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetFacturaKVIT.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button6Click(Sender: TObject);
begin
  If (VarType(lc_Dog.KeyValue)=varNull) AND
     ((rbR3.Checked AND (e_sfNo1.Value=1000000000) AND (e_sfNo2.Value=2000000000)) OR
      (rbOrig.Checked AND (e_sfNo3.Value=100000) AND (e_sfNo4.Value=200000))) then
  Begin
    Application.MessageBox('Выберите договор!','Внимание!',MB_OK);
    exit;
  End;

  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Акты приемо-передачи по договору поставки (ОТДЕЛЬНАЯ ПОЗИЦИЯ НА ВАГОН/МАШИНУ) (2004 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('aktSFPostavKVIT.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';

      Crpe.Selection.Formula.Text:=
        Crpe.Selection.Formula.Text+
        ' and not ({J#SFPROD_V_QR_SF.KOL}=0 or IsNull({J#SFPROD_V_QR_SF.KOL}))';

      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button7Click(Sender: TObject);
begin
  If (VarType(lc_Dog.KeyValue)=varNull) AND
     ((rbR3.Checked AND (e_sfNo1.Value=1000000000) AND (e_sfNo2.Value=2000000000)) OR
      (rbOrig.Checked AND (e_sfNo3.Value=100000) AND (e_sfNo4.Value=200000))) then
  Begin
    Application.MessageBox('Выберите договор!','Внимание!',MB_OK);
    exit;
  End;

  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Акты приемо-передачи по договору поставки (В КГ) (2004 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('aktSFPostavR3.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';

      Crpe.Selection.Formula.Text:=
        Crpe.Selection.Formula.Text+
        ' and not ({J#SFPROD_V_QR_SF.KOL}=0 or IsNull({J#SFPROD_V_QR_SF.KOL}))';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button8Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета (2004 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetKVIT.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button9Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета-фактуры (2005 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetFacturaKVIT_2005.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button10Click(Sender: TObject);
begin
  If (VarType(lc_Dog.KeyValue)=varNull) AND
     ((rbR3.Checked AND (e_sfNo1.Value=1000000000) AND (e_sfNo2.Value=2000000000)) OR
      (rbOrig.Checked AND (e_sfNo3.Value=100000) AND (e_sfNo4.Value=200000))) then
  Begin
    Application.MessageBox('Выберите договор!','Внимание!',MB_OK);
    exit;
  End;

  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Акты приемо-передачи (2005 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('aktSFPostavKVIT_2005.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';

      Crpe.Selection.Formula.Text:=
        Crpe.Selection.Formula.Text+
        ' and not ({J#SFPROD_V_QR_SF.KOL}=0 or IsNull({J#SFPROD_V_QR_SF.KOL}))';

      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.Button12Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета на услуги (2005 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetKVIT_2005.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
//      Crpe.ParamFields.Retrieve;
//      Crpe.ParamFields[0].CurrentValue := q_oper_reeSVED_NUM.AsString;
//      Crpe.ParamFields[1].CurrentValue := q_oper_reeNOM_ZD.AsString;
//      Crpe.ParamFields[2].CurrentValue := '';
      {Run the Report}
      Crpe.Execute;
    end;

end;

procedure Tf_PrintSF.Button11Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета на предоплату (2005 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetPredopl_2005.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;
      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
      {Run the Report}
      Crpe.Execute;
    end;
end;

procedure Tf_PrintSF.t_DoverCalcFields(DataSet: TDataSet);
begin
  t_DoverDISPLAY.AsString:=Trim(t_DoverPOST_FIO_SIGN.AsString)+' - '+Trim(t_DoverPOKUP_FIO_SIGN.AsString);
end;

procedure Tf_PrintSF.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if t_Signs.State=dsEdit then
    begin
      t_Signs.Post;
    end;
end;

procedure Tf_PrintSF.Button13Click(Sender: TObject);
begin
  with TF_ForReport.Create(f_main) do
    begin
      Caption:='Счета-фактуры (2005 год)';
      Crpe.ReportName:=F_FileUtils.CheckReport('SchetFacturaKVIT_2006.rpt',f_main.TempNetPath);
      Crpe.Selection.Clear;
      if rbR3.Checked then
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.sf_no} >= "'+e_sfNo1.Text+'" and {J#SFPROD_V_QR_SF.sf_no}<="'+e_sfNo2.Text+'" and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End
      Else
      Begin
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.orig_sf_no} >= '+e_sfNo3.Text+' and {J#SFPROD_V_QR_SF.orig_sf_no}<='+e_sfNo4.Text+' and '+
          '{J#SFPROD_V_QR_SF.DATE_OTGR}>=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date1.Date)+'") and {J#SFPROD_V_QR_SF.DATE_OTGR}<=DateValue("'+FormatDateTime('dd.mm.yyyy',e_Date2.Date)+'")';
      End;

      IF lc_Dog.Value<>'#' then
        Crpe.Selection.Formula.Text:=
          Crpe.Selection.Formula.Text+
          ' and {J#SFPROD_V_QR_SF.DOGOVOR}="'+lc_Dog.Value+'"';
      {Run the Report}
      Crpe.Execute;
    end;

end;

end.
