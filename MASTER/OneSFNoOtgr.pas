unit OneSFNoOtgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item, TB2Dock, TB2Toolbar, DB, OracleData, Oracle, StdCtrls,
  Mask, DBCtrls, RxLookup, Grids, DBGridEh, ToolEdit, RXDBCtrl, ComCtrls;

type
  Tf_OneSFNoOtgr = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    GroupBox1: TGroupBox;
    ora_Session: TOracleSession;
    Label1: TLabel;
    t_Dog: TOracleDataSet;
    t_DogID: TIntegerField;
    t_DogDOG_NUMBER: TStringField;
    ds_Dog: TDataSource;
    Label2: TLabel;
    lc_Predpr: TRxDBLookupCombo;
    Label3: TLabel;
    t_Predpr: TOracleDataSet;
    t_PredprID: TIntegerField;
    t_PredprSHORT_NAME: TStringField;
    ds_Predpr: TDataSource;
    lc_Dog: TRxDBLookupCombo;
    t_usl_dog: TOracleDataSet;
    t_usl_dogDOG_ID: TIntegerField;
    t_usl_dogUSL_NUMBER: TIntegerField;
    t_usl_dogNAME_USL: TStringField;
    ds_usl_dog: TDataSource;
    lc_Usl_Dog: TRxDBLookupCombo;
    Label4: TLabel;
    DBGridEh1: TDBGridEh;
    t_Temp_bill_pos: TOracleDataSet;
    ds_Temp_bill_pos: TDataSource;
    t_Temp_bill_posTERMINAL_NAME: TStringField;
    t_Temp_bill_posOSUSER_NAME: TStringField;
    t_Temp_bill_posNOM_DOK: TIntegerField;
    t_Temp_bill_posBILL_POS_ID: TIntegerField;
    t_Temp_bill_posVES: TFloatField;
    t_Temp_bill_posCENA_BN: TFloatField;
    t_Temp_bill_posCENA: TFloatField;
    t_Temp_bill_posSUMMA_BN: TFloatField;
    t_Temp_bill_posSUMMA_AKCIZ: TFloatField;
    t_Temp_bill_posSUMMA_NDS20: TFloatField;
    t_Temp_bill_posSUMMA: TFloatField;
    t_Temp_bill_posPROD_ID_NPR: TStringField;
    t_Prod: TOracleDataSet;
    ds_Prod: TDataSource;
    t_ProdID_NPR: TStringField;
    t_Temp_bill_posPROD_NAME: TStringField;
    Label5: TLabel;
    t_ProdLONG_NAME_NPR: TStringField;
    op_ForBills: TOraclePackage;
    TBItem2: TTBItem;
    e_DateVypSf: TDateTimePicker;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem1: TTBItem;
    procedure t_DogBeforeOpen(DataSet: TDataSet);
    procedure lc_PredprChange(Sender: TObject);
    procedure t_usl_dogBeforeOpen(DataSet: TDataSet);
    procedure lc_DogChange(Sender: TObject);
    procedure t_Temp_bill_posVESChange(Sender: TField);
    procedure t_Temp_bill_posSUMMA_BNChange(Sender: TField);
    procedure TBItem2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateSF:TDateTime;
  end;

var
  f_OneSFNoOtgr: Tf_OneSFNoOtgr;

implementation
USES Fordb,Math,ForReport, main,NewSFAsker, ForFiles;
{$R *.dfm}

procedure Tf_OneSFNoOtgr.t_DogBeforeOpen(DataSet: TDataSet);
begin
  t_Dog.SQL[2]:=' and predpr_id='+t_PredprID.AsString;
end;

procedure Tf_OneSFNoOtgr.lc_PredprChange(Sender: TObject);
begin
  f_DB.Requery(t_Dog,False);
end;

procedure Tf_OneSFNoOtgr.t_usl_dogBeforeOpen(DataSet: TDataSet);
begin
  t_Usl_Dog.SQL[6]:=' and dog_id='+t_DogID.AsString;
end;

procedure Tf_OneSFNoOtgr.lc_DogChange(Sender: TObject);
begin
  f_DB.Requery(t_Usl_Dog,False);
end;

procedure Tf_OneSFNoOtgr.t_Temp_bill_posVESChange(Sender: TField);
begin
  if t_Temp_bill_pos.State in [dsInsert,dsEdit] then
    begin
      if (t_Temp_bill_posVES.Value<>0) and (t_Temp_bill_posCENA_BN.Value<>0) then
        t_Temp_bill_posSUMMA_BN.Value:=RoundTo(t_Temp_bill_posVES.Value*t_Temp_bill_posCENA_BN.Value,-2);
//      t_Temp_bill_posSUMMA_NDS20.Value:=RoundTo(t_Temp_bill_posSUMMA_BN.Value*0.18,2);
//      t_Temp_bill_posSUMMA.Value:=t_Temp_bill_posSUMMA_NDS20.Value+t_Temp_bill_posSUMMA_BN.Value;
    end;
end;

procedure Tf_OneSFNoOtgr.t_Temp_bill_posSUMMA_BNChange(Sender: TField);
begin
  if t_Temp_bill_pos.State in [dsInsert,dsEdit] then
    begin
      t_Temp_bill_posSUMMA_NDS20.Value:=RoundTo(t_Temp_bill_posSUMMA_BN.Value*0.18,-2);
      t_Temp_bill_posSUMMA.Value:=t_Temp_bill_posSUMMA_NDS20.Value+t_Temp_bill_posSUMMA_BN.Value;
    end;
end;

procedure Tf_OneSFNoOtgr.TBItem2Click(Sender: TObject);
var
  nom_dok:integer;
  storno:Integer;
  R:Integer;
begin
  if t_Temp_bill_pos.State=dsEdit then
    t_Temp_bill_pos.Post;

  Storno:=0;
  if f_main.EditedNom_dok<>0 then
    begin
      R:=MessageDlg('Снять с минусом и завести новую платежку?'+#13+
         #13+'<Да> - снять с минусом и завести новую'+
         #13+'<Нет> - корректировка без снятия'+
         #13+'<Отмена> - Я еще подумаю!',mtConfirmation , [mbCancel,mbYes,mbNo],0);
      if R=mrCANCEL then Exit;
      if R=mrNO then Storno:=0;
      if R=mrYES then
        begin
          Storno:=1;
          with tf_NewSFAsker.Create(Self) do
            begin
              gr_NomSF.Visible:=False;
              ShowModal;
              if ModalResult=mrOk then
                begin
                  e_DateVypSf.Date:=MonthCalendar1.Date;
                  Free
                end
              else
               Free;
            end;
        end;
    end;
  nom_dok:=op_ForBills.CallIntegerFunction('NEW_BILL_NO_OTGR',
    [FormatDateTime('dd.mm.yyyy',e_DateVypSf.Date),StrToInt(lc_Dog.Value),StrToInt(lc_Usl_Dog.Value),f_main.EditedNom_dok,Storno]);
  if nom_dok<>0 then
    with TF_ForReport.Create(f_main) do
      begin
        Caption:='Счета-фактуры (2005 год)';
        Crpe.ReportName:=F_FileUtils.CheckReport('SchetFacturaKVIT_2005.rpt',f_main.TempNetPath);
        Crpe.Selection.Clear;
        Crpe.Selection.Formula.Text := '{J#SFPROD_V_QR_SF.kod_prod} ='+IntToStr(nom_dok);
        {Run the Report}
        Crpe.Execute;
      end;
  Close;
end;

procedure Tf_OneSFNoOtgr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ora_Session.LogOff;
  Action:=caFree;
end;

procedure Tf_OneSFNoOtgr.FormCreate(Sender: TObject);
begin
  ora_Session.Connected:=False;
  f_db.LogonMasterSession(ora_Session);
  op_ForBills.CallProcedure('CLEAR_TEMP_BILL_POS',[f_main.EditedNom_dok]);
  t_Predpr.Open;
  t_Dog.Open;
  t_usl_dog.Open;
  t_Prod.Open;
  t_Temp_bill_pos.Open;
end;

procedure Tf_OneSFNoOtgr.TBItem1Click(Sender: TObject);
begin
  op_ForBills.CallProcedure('FILL_TEMP_BILL_POS',
    [FormatDateTime('dd.mm.yyyy',e_DateVypSf.Date),StrToInt(lc_Dog.Value),StrToInt(lc_Usl_Dog.Value),1]);
  f_DB.Requery(t_Temp_bill_pos,False);
end;

end.
