unit OneSF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, StdCtrls, DB, OracleData, ComCtrls, DBCtrls, Grids,
  DBGridEh, ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan, Menus, TB2Item,
  TB2Dock, TB2Toolbar;

type
  Tf_OneSF = class(TForm)
    gr_KvitList: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    q_FillTempBillKvit: TOracleQuery;
    ora_Session: TOracleSession;
    t_TempGroupByKvit: TOracleDataSet;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    e_DateKvit: TDateTimePicker;
    op_ForBills: TOraclePackage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBText1: TDBText;
    ds_Rekvizits: TDataSource;
    t_Rekvizits: TOracleDataSet;
    Label2: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DBText5: TDBText;
    Label6: TLabel;
    DBText6: TDBText;
    t_Prices: TOracleDataSet;
    ds_Prices: TDataSource;
    t_PricesCENA: TFloatField;
    t_PricesCENA_OTP: TFloatField;
    t_PricesBEGIN_DATE: TDateTimeField;
    t_PricesEND_DATE: TDateTimeField;
    Label9: TLabel;
    DBText10: TDBText;
    t_RekvizitsDOG_NUMBER: TStringField;
    t_RekvizitsDOG_DATE: TDateTimeField;
    t_RekvizitsPLAT_NAME: TStringField;
    t_RekvizitsPOLUCH_NAME: TStringField;
    t_RekvizitsPOTR_NAME: TStringField;
    t_RekvizitsSTAN_NAME: TStringField;
    t_RekvizitsID_NPR: TStringField;
    t_RekvizitsLONG_NAME_NPR: TStringField;
    t_RekvizitsCAT_CEN_ID: TIntegerField;
    t_RekvizitsUSL_NUMBER: TIntegerField;
    t_RekvizitsCAT_CEN_NAME: TStringField;
    t_RekvizitsNOM_ZD: TStringField;
    Label10: TLabel;
    DBText11: TDBText;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    DBText9: TDBText;
    DBText8: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBGridEh2: TDBGridEh;
    t_TempBillKvit: TOracleDataSet;
    ds_TempBillKvit: TDataSource;
    t_TempBillKvitKVIT_ID: TFloatField;
    t_TempBillKvitNUM_KVIT: TFloatField;
    t_TempBillKvitTERMINAL_NAME: TStringField;
    t_TempBillKvitOSUSER_NAME: TStringField;
    t_TempBillKvitNUM_CIST: TStringField;
    t_TempBillKvitVES: TFloatField;
    t_TempBillKvitTARIF: TFloatField;
    t_TempBillKvitTARIF19: TFloatField;
    t_TempBillKvitSVED_NUM: TIntegerField;
    t_TempBillKvitSUM_PROD: TFloatField;
    t_TempBillKvitSUM_AKCIZ: TFloatField;
    t_TempBillKvitSUM_PROD_NDS: TFloatField;
    t_TempBillKvitTARIF_NDS: TFloatField;
    t_TempBillKvitSUM_VOZN11: TFloatField;
    t_TempBillKvitSUM_VOZN11_NDS: TFloatField;
    t_TempBillKvitSUM_VOZN12: TFloatField;
    t_TempBillKvitSUM_VOZN12_NDS: TFloatField;
    t_TempBillKvitSUM_STRAH: TFloatField;
    t_TempBillKvitCENA: TFloatField;
    t_TempBillKvitCENA_OTP: TFloatField;
    t_TempBillKvitDATE_CENA: TDateTimeField;
    ActionManager1: TActionManager;
    acSFCalc: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    t_TempBillKvitTOTAL_SUM: TFloatField;
    t_PricesID: TIntegerField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    acWriteSF: TAction;
    TBItem2: TTBItem;
    acNewSF: TAction;
    TBItem3: TTBItem;
    Label13: TLabel;
    t_TempBillKvitDATE_KVIT: TDateTimeField;
    t_TempBillKvitPROTO_NUM: TStringField;
    t_TempBillKvitPROTO_DATE: TDateTimeField;
    t_TempBillKvitCENA_VOZN: TFloatField;
    t_TempBillKvitTARIF_GUARD: TFloatField;
    t_TempBillKvitTARIF_GUARD_NDS: TFloatField;
    t_TempBillKvitNACENKA: TFloatField;
    t_TempBillKvitNUM_AKT: TFloatField;
    t_TempBillKvitBILL_POS_ID: TFloatField;
    t_TempBillKvitNO_AKCIZ: TIntegerField;
    t_PricesABBR_NPR: TStringField;
    t_PricesID_NPR: TStringField;
    t_PricesGroup: TOracleDataSet;
    ds_PricesGroup: TDataSource;
    t_PricesGroupID_NPR: TStringField;
    t_PricesGroupABBR_NPR: TStringField;
    DBGridEh3: TDBGridEh;
    Splitter1: TSplitter;
    t_PricesSELECTED: TFloatField;
    t_TempBillKvitNPR_PRICES_ID: TFloatField;
    t_TempBillKvitCAT_CEN_ID: TFloatField;
    t_TempBillKvitID_NPR: TStringField;
    t_TempBillKvitABBR_NPR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure t_PricesBeforeOpen(DataSet: TDataSet);
    procedure acSFCalcExecute(Sender: TObject);
    procedure t_TempBillKvitCalcFields(DataSet: TDataSet);
    procedure acWriteSFExecute(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure acNewSFExecute(Sender: TObject);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure t_PricesGroupAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateSF:TDate;
    EditedNom_dok:Integer;
    CurrNumKvit:String; // Для отслеживания изменений в полях ввода номеров квитанций
  end;

var
  f_OneSF: Tf_OneSF;

implementation

uses ForDB,NewSFAsker,ForReport, main, ForFiles;

{$R *.dfm}

procedure Tf_OneSF.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(ora_Session);
  e_DateKvit.Date:=Date-1;
end;

procedure Tf_OneSF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_session.LogOff;
  Action:=caFree;
end;

procedure Tf_OneSF.Edit1Exit(Sender: TObject);
var
  I,J:Integer;
  S:String[255];
  K:Real;
begin
  TEdit(Sender).Color := clWindow;
  If TEdit(Sender).Text=CurrNumKvit then Exit; // Изменений нет, нечего не делаем
  S:=TEdit(Sender).Text;
  for i:=Length(S) Downto 1 do
    If not (S[i] in ['0'..'9']) then
      Delete(S,i,1);
  TEdit(Sender).Text:=S;
  If not (t_Rekvizits.Active) then // Считаем, что это первая квитанция, заполняем таблицы
    begin
      op_ForBills.CallProcedure('FILL_TEMP_BILL_KVIT',[FormatDateTime('dd.mm.yyyy',e_DateKvit.Date),Edit1.Text,EditedNom_dok]);
      if t_TempGroupByKvit.Active then t_TempGroupByKvit.Close;
      t_TempGroupByKvit.Open;
      if t_Rekvizits.Active then t_Rekvizits.Close;
      t_Rekvizits.Open;
      if t_Rekvizits.RecordCount>0 then
        begin
          if t_Prices.Active then t_Prices.Close;
          t_PricesGroup.Open;
          t_Prices.Open;
          {K:=op_ForBills.CallFloatFunction('GET_VOZN_RST',[t_TempGroupByKvit.FieldByName('kvit_id').AsInteger,S]);
          S:=op_ForBills.GetParameter(1);
          Label12.Caption:=S;
          IF k>=0 then
            begin
              Label11.Caption:=FloatToStr(K)+'руб./тн.';
            end
          else
            begin
              Label11.Caption:=op_ForBills.CallStringFunction('GET_VOZN_OLD',[t_TempGroupByKvit.FieldByName('kvit_id').AsInteger]);
            end;}
          Label11.Caption:=op_ForBills.CallStringFunction('GET_VOZN_OLD',[t_TempGroupByKvit.FieldByName('kvit_id').AsInteger]);
          label13.Caption:='Страховка - '+FloatToStr(op_ForBills.CallFloatFunction('GET_STRH_FOR_A_KVIT',[t_TempGroupByKvit.FieldByName('kvit_id').AsInteger]))+'%';
        end
      else
        begin
          ShowMessage('Квитанция не найдена');
          Edit1.SetFocus;
        end;
      i:=0;
      while not t_TempGroupByKvit.Eof do
        begin
          inc(i);
          for j:=0 to gr_KvitList.ControlCount-1 do
            if gr_KvitList.Controls[j].Name='Edit'+IntToStr(i) then
              begin
                TEdit(gr_KvitList.Controls[j]).Text:=t_TempGroupByKvit.fieldByName('num_kvit').AsString;
                Break;
              end;
          t_TempGroupByKvit.Next;
        end;
      if t_TempBillKvit.Active then t_TempBillKvit.Close;
      t_TempBillKvit.Open;
      DBGridEh2.Visible:=True;
    end
  else // Это не новая квитанция
    begin
      If (StrToIntDef(CurrNumKvit,0)<>0) then // Удаляем квитанцию
        op_ForBills.CallIntegerFunction('DEL_KVIT',[StrToIntDef(CurrNumKvit,0)]);
      If StrToIntDef(TEdit(Sender).Text,0)<>0 then // Добавляем квитанцию
        begin
          if op_ForBills.CallIntegerFunction('ADD_KVIT',[StrToIntDef(TEdit(Sender).Text,0)])=0 then
            begin
              ShowMessage('Квитанция № '+TEdit(Sender).Text+' не найдена');
              TEdit(Sender).Text:='';
            end;
        end;
      f_db.ReQuery(t_TempBillKvit,False);
    end;
end;

procedure Tf_OneSF.t_PricesBeforeOpen(DataSet: TDataSet);
begin
//  t_Prices.SQL[1]:='  npr_prices.CAT_CEN_ID='+t_RekvizitsCAT_CEN_ID.AsString+' and';
  t_Prices.SQL[1]:='WHERE ID_NPR='''+t_PricesGroupID_NPR.AsString+'''';
//  t_Prices.SQL.SaveToFile('c:\tmp\a.txt');
end;

procedure Tf_OneSF.acSFCalcExecute(Sender: TObject);
begin
  op_ForBills.CallProcedure('CALC_TEMP_BILL_KVIT',[t_PricesID.AsInteger]);
  f_db.ReQuery(t_TempBillKvit,False);
  acWriteSF.Enabled:=True;
end;

procedure Tf_OneSF.t_TempBillKvitCalcFields(DataSet: TDataSet);
begin
  t_TempBillKvitTOTAL_SUM.Value:=
     t_TempBillKvitTARIF.Value+
     t_TempBillKvitSUM_PROD.Value+
     t_TempBillKvitSUM_AKCIZ.Value+
     t_TempBillKvitSUM_PROD_NDS.Value+
     t_TempBillKvitTARIF_NDS.Value+
     t_TempBillKvitSUM_VOZN11.Value+
     t_TempBillKvitSUM_VOZN11_NDS.Value+
     t_TempBillKvitSUM_VOZN12.Value+
     t_TempBillKvitSUM_VOZN12_NDS.Value+
     t_TempBillKvitSUM_STRAH.Value+
     t_TempBillKvitTARIF_GUARD.Value+
     t_TempBillKvitTARIF_GUARD_NDS.Value;
end;

procedure Tf_OneSF.acWriteSFExecute(Sender: TObject);
var
  R:Integer;
  Storno:Integer;
  Nom_dok:Integer;
begin
  Storno:=0;
  if EditedNom_dok<>0 then
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
              gr_NomSF.Visible:=True;
              ShowModal;
              if ModalResult=mrOk then
                begin
                  DateSF:=MonthCalendar1.Date;
                  Free
                end
              else
               Free;
            end;
        end;
    end
  else
    with tf_NewSFAsker.Create(Self) do
      begin
        gr_NomSF.Visible:=False;
        ShowModal;
        if ModalResult=mrOk then
          begin
            DateSF:=MonthCalendar1.Date;
            Free
          end
        else
         Free;
      end;
  Nom_dok:=op_ForBills.CallIntegerFunction('NEW_BILL',[FormatDateTime('dd.mm.yyyy',dateSF),FormatDateTime('dd.mm.yyyy',dateSF),EditedNom_dok,Storno]);
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
  acWriteSF.Enabled:=False;
  if EditedNom_dok=0 then
    acNewSF.Execute
  else
    Close;
end;

procedure Tf_OneSF.Edit1Enter(Sender: TObject);
begin
  TEdit(ActiveControl).Color:= clYellow;
  CurrNumKvit:=TEdit(ActiveControl).Text;
  acWriteSF.Enabled:=False;
end;

procedure Tf_OneSF.Edit2Exit(Sender: TObject);
begin
  TEdit(Sender).Color:= clWindow;
//  ShowMessage(Sender.ClassName);
//  If CurrNumKvit=TEdit(ActiveControl).Text;
end;

procedure Tf_OneSF.acNewSFExecute(Sender: TObject);
var
  J:integer;
begin
  ora_Session.LogOff;
  for j:=0 to gr_KvitList.ControlCount-1 do
    if Copy(gr_KvitList.Controls[j].Name,1,4)='Edit' then
      TEdit(gr_KvitList.Controls[j]).Text:='';
  e_DateKvit.SetFocus;
  f_db.LogonMasterSession(ora_Session);
  Label11.Caption:='';
  Label12.Caption:='';
  Label13.Caption:='';
  EditedNom_dok:=0;
end;

procedure Tf_OneSF.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if t_TempBillKvit.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_OneSF.t_PricesGroupAfterScroll(DataSet: TDataSet);
begin
  F_DB.ReQuery(t_Prices,False);
end;

procedure Tf_OneSF.DBGridEh1DblClick(Sender: TObject);
begin
  op_ForBills.CallProcedure('SET_TEMP_BILL_KVIT_PRICE',[t_PricesID_NPR.AsString,t_PricesID.AsInteger]);
  F_DB.ReQuery(t_Prices,False);
  F_DB.ReQuery(t_TempBillKvit,False);
end;

end.
