unit MO_SvedNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls, Oracle, MO_Sved,
  CurrEdit, RxLookup, DB, OracleData, RXDBCtrl, DBCtrls, DBCtrlsEh, Grids,
  ValEdit, DBGridEh;

// СВЕДЕНИЯ об отгрузке (добавление/изменение)

const
  EmptyPasp: string = '<БЕЗ ПАСПОРТА>';
  EmptyProd: string = '<НЕ ВЫБРАН>';

type
  Tf_SvedNew = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    pkgFOR_DOCUMENTS: TOraclePackage;
    gbPassport: TGroupBox;
    edPasp_id: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    edRez_num: TEdit;
    Label12: TLabel;
    q_DefiMass: TOracleDataSet;
    q_DefiMassID: TFloatField;
    q_DefiMassNAME: TStringField;
    ds_DefiMass: TDataSource;
    q_Pasp: TOracleDataSet;
    ds_Pasp: TDataSource;
    q_Product: TOracleDataSet;
    lcName_NPR: TRxDBLookupCombo;
    Label17: TLabel;
    ds_Product: TDataSource;
    gbOformlenie: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edPasp_num: TEdit;
    Label5: TLabel;
    q_ValPasp: TOracleDataSet;
    btEmptyPasp: TBitBtn;
    btSelPasp: TBitBtn;
    edPasp_date: TDBDateTimeEditEh;
    q_temp_ValSved: TOracleDataSet;
    ds_temp_ValSved: TDataSource;
    q_temp_ValSvedKODIF_ID: TFloatField;
    q_temp_ValSvedTAG: TStringField;
    q_temp_ValSvedNAME: TStringField;
    q_temp_ValSvedVALUE: TStringField;
    q_temp_ValSvedNORMA: TStringField;
    q_temp_ValSvedFIELD_TYPE: TStringField;
    q_temp_ValSvedFIELD_LEN: TIntegerField;
    q_temp_ValSvedFIELD_DEC: TIntegerField;
    q_temp_ValSvedF_DEL: TIntegerField;
    q_PaspID: TStringField;
    q_PaspPASP_NUM: TStringField;
    q_PaspREZ_NUM: TStringField;
    q_PaspPASP_DATE: TDateTimeField;
    q_PaspINSPEKTOR: TStringField;
    q_PaspPROD_ID_NPR: TStringField;
    q_PaspDATE_VIR: TDateTimeField;
    q_PaspPERER_ID: TFloatField;
    q_PaspNAME_NPR: TStringField;
    gbFeatures: TGroupBox;
    GridPaspValue: TDBGridEh;
    edPl20: TCurrencyEdit;
    edPl15: TCurrencyEdit;
    Label21: TLabel;
    Label20: TLabel;
    gbSved: TGroupBox;
    Label16: TLabel;
    Label14: TLabel;
    lcDefi_mass: TRxDBLookupCombo;
    edNom_zd: TEdit;
    edDat: TDateTimePicker;
    Label2: TLabel;
    edNum: TEdit;
    btSetNum: TSpeedButton;
    Label1: TLabel;
    edTechTime: TDBDateTimeEditEh;
    edTechDate: TDBDateTimeEditEh;
    edPodTime: TDBDateTimeEditEh;
    edPodDate: TDBDateTimeEditEh;
    edGotovTime: TDBDateTimeEditEh;
    edGotovDate: TDBDateTimeEditEh;
    edBegNalivTime: TDBDateTimeEditEh;
    edBegNalivDate: TDBDateTimeEditEh;
    edEndNalivTime: TDBDateTimeEditEh;
    edEndNalivDate: TDBDateTimeEditEh;
    edDateOformTime: TDBDateTimeEditEh;
    edDateOformDate: TDateTimePicker;
    sbEmptyTechTime: TSpeedButton;
    sbFillTechTime: TSpeedButton;
    sbFillGotovDate: TSpeedButton;
    sbEmptyGotovTime: TSpeedButton;
    sbFillBegNalivDate: TSpeedButton;
    sbEmptyBegNalivTime: TSpeedButton;
    sbFillEndNalivDate: TSpeedButton;
    sbEmptyEndNalivTime: TSpeedButton;
    sbFillPodDate: TSpeedButton;
    sbEmptyPodDate: TSpeedButton;
    q_sved: TOracleDataSet;//в отличие от стандартного позволяет сохранять NULL
    procedure CheckSvedDate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure edPasp_idKeyPress(Sender: TObject; var Key: Char);
    procedure edPasp_idChange(Sender: TObject);
    procedure edPasp_idKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_PaspAfterOpen(DataSet: TDataSet);
    procedure q_PaspBeforeOpen(DataSet: TDataSet);
    procedure q_ValPaspBeforeOpen(DataSet: TDataSet);
    procedure q_ValPaspAfterOpen(DataSet: TDataSet);
    procedure btSelPaspClick(Sender: TObject);
    procedure btEmptyPaspClick(Sender: TObject);
    procedure lcName_NPRChange(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure GridPaspValueExit(Sender: TObject);
    procedure sbFillTechTimeClick(Sender: TObject);
    procedure sbEmptyTechTimeClick(Sender: TObject);
    procedure sbFillGotovDateClick(Sender: TObject);
    procedure sbEmptyGotovTimeClick(Sender: TObject);
    procedure sbFillBegNalivDateClick(Sender: TObject);
    procedure sbEmptyBegNalivTimeClick(Sender: TObject);
    procedure sbFillEndNalivDateClick(Sender: TObject);
    procedure sbEmptyEndNalivTimeClick(Sender: TObject);
    procedure sbFillPodDateClick(Sender: TObject);
    procedure sbEmptyPodDateClick(Sender: TObject);
    procedure edNom_zdChange(Sender: TObject);
    procedure CheckDateOforml(Sender: TObject);
    procedure edPl15Change(Sender: TObject);
    procedure edPl20Change(Sender: TObject);
    procedure q_temp_ValSvedAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    procedure SelPasp;
    procedure Open_temp_valsved(pMode:integer;pSved_id,pPasp_id,pNpr_id:string);
  public
    { Public declarations }
    EditID:string;
    EditMode:integer; // EditMode=0 - добавление, EditMode=1 - редактирование, EditMode=2 - просмотр
    ParentForm:Tf_Sved;
    ReturnId:double;
    IsNeedReCalcVes:boolean;
  end;

var
  f_SvedNew: Tf_SvedNew;

implementation

uses KlsMisc2,DateUtils, ForSESS, main, MO_PaspBrowse, ForSystem,MO_MoveVagon;
var
  f_MV: Tf_MoveVagon;

{$R *.dfm}
{==============================================================================}
{процедура для выбора паспорта из списка.Открывает форму f_MoveVagon}
{==============================================================================}
procedure Tf_SvedNew.SelPasp;
var tmp:double;
    i,c:integer;
begin
  inherited;
  with tf_MoveVagon.create(self) do
  Begin
    ReturnID:=-1;
    if lcName_NPR.Value<>'0' then
      q_Pasp.SQL[7]:='AND pr.ID_GROUP_NPR='+QuotedStr(q_Product.FieldByName('ID_GROUP_NPR').AsString)
    else
      q_Pasp.SQL[7]:='AND 1=1';
    q_Pasp.Open;
    q_Source.SQL:=q_Pasp.SQL;
    ParentFormName:=Self.Name;
    if ShowModal=mrOk then
    Begin
      IsNeedReCalcVes:=true;
      q_Pasp.Locate('ID',ReturnId,[]);
      with q_Pasp do
      begin
        lcName_npr.KeyValue:=FieldByName('prod_id_npr').AsString;
        edPasp_id.Text:= FieldByName('ID').AsString;
        edPasp_num.Text:=FieldByName('PASP_NUM').AsString;
        edPasp_date.Value:=FieldByName('PASP_DATE').AsDateTime;
        edRez_num.Text:=FieldByName('REZ_NUM').AsString;
      end;

      with q_ValPasp do
      begin
        Close;
        SetVariable(':pID',q_Pasp.FieldByName('ID').AsString);
        Open;
        //при выборе pasp_id нельзя напрямую редактировать дату, резервуар, номер паспорта
        edPasp_date.Enabled:=false;
        edRez_num.Enabled:=false;
        edPasp_num.Enabled:=false;
        lcName_NPR.Enabled:=false;
        edPl15.Text:=FieldByName('PL15').AsString;
        edPl20.Text:=FieldByName('PL20').AsString;
      end;
      q_Pasp.Close;
    end;
    free;
  end;
end;

procedure Tf_SvedNew.Open_temp_valsved(pMode:integer;pSved_id,pPasp_id,pNpr_id:string);
begin
  q_temp_valsved.Close;
  ParentForm.pkgFOR_SVED.CallProcedure('fill_temp_valsved',[pMode,pSved_id,pPasp_id,pNpr_id]);
  q_temp_valsved.Open;
end;


procedure Tf_SvedNew.CheckSvedDate(Sender: TObject);
begin
  if (EditMode=0) and (CurrentDate<>DateOf(edDat.DateTime)) then
  try
    // Если документ новый и меняется дата,
    // заново получим номер документа (на случай если номер зависит от даты)
    edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[ParentForm.DocType,ParentForm.DocMestoId,'',DateOf(edDat.DateTime)])
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'SvedNew',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDat.DateTime);
end;

procedure Tf_SvedNew.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Sved(Owner);
  pkgFOR_DOCUMENTS.Session:=ParentForm.ora_Session;
  q_sved.Session:=ParentForm.ora_Session;
  q_DefiMass.Session:=ParentForm.ora_Session;
  q_Product.Session:=ParentForm.ora_Session;
  q_Pasp.Session:=ParentForm.ora_Session;
  q_valPasp.Session:=ParentForm.ora_Session;
  q_temp_ValSved.Session:=ParentForm.ora_Session;
  CurrentDate:=Now-1;
end;

procedure Tf_SvedNew.FormActivate(Sender: TObject);
var vPasp_Id:string;
    vProd_Id:string;
begin
  // Очистим временную таблицу
  ParentForm.pkgFOR_SVED.CallProcedure('empty_temp_valsved',[]);

  if (EditMode=0) and (EditId='') then
  Begin
    Caption:='Новое сведение';

    edDat.DateTime:=DateOf(Now);
    edPodTime.Value:=null;
    edPodDate.Value:=null;
    edTechTime.Value:=null;
    edTechDate.Value:=null;
    edGotovTime.Value:=null;
    edGotovDate.Value:=null;
    edBegNalivTime.Value:=null;
    edBegNalivDate.Value:=null;
    edEndNalivTime.Value:=null;
    edEndNalivDate.Value:=null;
    edDateOformTime.Value:=TimeOf(Now);
    edDateOformDate.DateTime:=DateOf(Now);
    lcDefi_mass.KeyValue:=1;

    EditId:='';
  End;


  if (EditMode=0) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_ID',EditID);
    q_sved.Open;

    Caption:='Новое сведение';

    edDat.DateTime:=DateOf(Now);
    edPodTime.Value:=null;
    edPodDate.Value:=null;
    edTechTime.Value:=null;
    edTechDate.Value:=null;
    edGotovTime.Value:=null;
    edGotovDate.Value:=null;
    edBegNalivTime.Value:=null;
    edBegNalivDate.Value:=null;
    edEndNalivTime.Value:=null;
    edEndNalivDate.Value:=null;
    edDateOformTime.Value:=TimeOf(Now);
    edDateOformDate.DateTime:=DateOf(Now);
    edPasp_Num.Text:=q_sved.FieldByName('PASP_NUM').AsString;
    edRez_num.Text:=q_sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    lcName_NPR.KeyValue:=q_sved.FieldByName('PROD_ID_NPR').AsString;
    if q_sved.FieldByName('PASP_ID').AsString<>'' then
      begin
        edPasp_id.Text:=q_sved.FieldByName('PASP_ID').AsString;
        edPasp_date.Enabled:=false;
        edPasp_num.Enabled:=false;
        lcName_NPR.Enabled:=false;
        edRez_num.Enabled:=false;
      end;
    edPL15.Text:=q_sved.FieldByName('PL15').AsString;
    edPL20.Text:=q_sved.FieldByName('PL20').AsString;
    lcDefi_mass.KeyValue:=q_sved.FieldByName('DEFI_MASS_ID').AsInteger;

    EditId:='';
  end;

  if (EditMode=1) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_ID',EditID);
    q_sved.Open;

    Caption:='Редактирование сведения';
    edNum.Text:=q_sved.FieldByName('SVED_NUM').AsString;
    edDat.DateTime:=DateOf(q_sved.FieldByName('SVED_DATE').AsDateTime);
    if q_sved.FieldByName('POD_DATE').AsDateTime>0 then
    Begin
      edPodTime.Value:=TimeOf(q_sved.FieldByName('POD_DATE').AsDateTime);
      edPodDate.Value:=DateOf(q_sved.FieldByName('POD_DATE').AsDateTime);
    end
    else
    begin
      edPodTime.Value:=null;
      edPodDate.Value:=null;
    end;
    if q_sved.FieldByName('TECH_TIME').AsDateTime>0 then
    Begin
      edTechTime.Value:=TimeOf(q_sved.FieldByName('TECH_TIME').AsDateTime);
      edTechDate.Value:=DateOf(q_sved.FieldByName('TECH_TIME').AsDateTime);
    end
    else
    begin
      edTechTime.Value:=null;
      edTechDate.Value:=null;
    end;
    if q_sved.FieldByName('GOTOV_TIME').AsDateTime>0 then
    Begin
      edGotovTime.Value:=TimeOf(q_sved.FieldByName('GOTOV_TIME').AsDateTime);
      edGotovDate.Value:=DateOf(q_sved.FieldByName('GOTOV_TIME').AsDateTime);
    end
    else
    begin
      edGotovTime.Value:=null;
      edGotovDate.Value:=null;
    end;
    if q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime>0 then
    Begin
      edBegNalivTime.Value:=TimeOf(q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime);
      edBegNalivDate.Value:=DateOf(q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edBegNalivTime.Value:=null;
      edBegNalivDate.Value:=null;
    end;
    if q_sved.FieldByName('END_NALIV_TIME').AsDateTime>0 then
    Begin
      edEndNalivTime.Value:=TimeOf(q_sved.FieldByName('END_NALIV_TIME').AsDateTime);
      edEndNalivDate.Value:=DateOf(q_sved.FieldByName('END_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edEndNalivTime.Value:=null;
      edEndNalivDate.Value:=null;
    end;
    edPasp_Num.Text:=q_sved.FieldByName('PASP_NUM').AsString;
    edRez_num.Text:=q_sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    lcName_NPR.KeyValue:=q_sved.FieldByName('PROD_ID_NPR').AsString;
    if q_sved.FieldByName('PASP_ID').AsString<>'' then
      begin
        edPasp_id.Text:=q_sved.FieldByName('PASP_ID').AsString;
        edPasp_date.Enabled:=false;
        edPasp_num.Enabled:=false;
        lcName_NPR.Enabled:=false;
        edRez_num.Enabled:=false;
      end;
    edPL15.Text:=q_sved.FieldByName('PL15').AsString;
    edPL20.Text:=q_sved.FieldByName('PL20').AsString;
    lcDefi_mass.KeyValue:=q_sved.FieldByName('DEFI_MASS_ID').AsInteger;
    if q_sved.FieldByName('NOM_ZD').AsString<>'' then
    begin
      edNom_zd.Text:=q_sved.FieldByName('NOM_ZD').AsString;
    end;

    if (edNom_Zd.Text='') or
       (edPasp_id.Text='') or
       (edPasp_id.Text=EmptyPasp) then
    Begin
      edDateOformDate.DateTime:=DateOf(Now);
      edDateOformTime.Value:=TimeOf(Now);
    End
    else
    Begin
      edDateOformDate.DateTime:=DateOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
      edDateOformTime.Value:=TimeOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
    end;
  end;

  if (EditMode=2) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_ID',EditID);
    q_sved.Open;

    Caption:='Просмотр сведения';
    edNum.Text:=q_sved.FieldByName('SVED_NUM').AsString;
    edDat.DateTime:=DateOf(q_sved.FieldByName('SVED_DATE').AsDateTime);
    if q_sved.FieldByName('POD_DATE').AsDateTime>0 then
    Begin
      edPodTime.Value:=TimeOf(q_sved.FieldByName('POD_DATE').AsDateTime);
      edPodDate.Value:=DateOf(q_sved.FieldByName('POD_DATE').AsDateTime);
    end
    else
    begin
      edPodTime.Value:=null;
      edPodDate.Value:=null;
    end;
    if q_sved.FieldByName('TECH_TIME').AsDateTime>0 then
    Begin
      edTechTime.Value:=TimeOf(q_sved.FieldByName('TECH_TIME').AsDateTime);
      edTechDate.Value:=DateOf(q_sved.FieldByName('TECH_TIME').AsDateTime);
    end
    else
    begin
      edTechTime.Value:=null;
      edTechDate.Value:=null;
    end;
    if q_sved.FieldByName('GOTOV_TIME').AsDateTime>0 then
    Begin
      edGotovTime.Value:=TimeOf(q_sved.FieldByName('GOTOV_TIME').AsDateTime);
      edGotovDate.Value:=DateOf(q_sved.FieldByName('GOTOV_TIME').AsDateTime);
    end
    else
    begin
      edGotovTime.Value:=null;
      edGotovDate.Value:=null;
    end;
    if q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime>0 then
    Begin
      edBegNalivTime.Value:=TimeOf(q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime);
      edBegNalivDate.Value:=DateOf(q_sved.FieldByName('BEG_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edBegNalivTime.Value:=null;
      edBegNalivDate.Value:=null;
    end;
    if q_sved.FieldByName('END_NALIV_TIME').AsDateTime>0 then
    Begin
      edEndNalivTime.Value:=TimeOf(q_sved.FieldByName('END_NALIV_TIME').AsDateTime);
      edEndNalivDate.Value:=DateOf(q_sved.FieldByName('END_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edEndNalivTime.Value:=null;
      edEndNalivDate.Value:=null;
    end;
    edPasp_Num.Text:=q_sved.FieldByName('PASP_NUM').AsString;
    edRez_num.Text:=q_sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    lcName_NPR.KeyValue:=q_sved.FieldByName('PROD_ID_NPR').AsString;
    if q_sved.FieldByName('PASP_ID').AsString<>'' then
      begin
        edPasp_id.Text:=q_sved.FieldByName('PASP_ID').AsString;
        edPasp_date.Enabled:=false;
        edPasp_num.Enabled:=false;
        lcName_NPR.Enabled:=false;
        edRez_num.Enabled:=false;
      end;
    edPL15.Text:=q_sved.FieldByName('PL15').AsString;
    edPL20.Text:=q_sved.FieldByName('PL20').AsString;
    lcDefi_mass.KeyValue:=q_sved.FieldByName('DEFI_MASS_ID').AsInteger;
    if q_sved.FieldByName('NOM_ZD').AsString<>'' then
    begin
      edNom_zd.Text:=q_sved.FieldByName('NOM_ZD').AsString;
    end;

    edDateOformDate.DateTime:=DateOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
    edDateOformTime.Value:=TimeOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
    gbSved.Enabled:=false;
    gbOformlenie.Enabled:=false;
    gbPassport.Enabled:=false;
    gbFeatures.Enabled:=false;
    btOk.Enabled:=false;
  end;

  // Первоначальное заполнение временной таблицы
  if edPasp_id.text<>EmptyPasp then vPasp_id:=edPasp_id.text
  else vPasp_id:='';
  if VarType(lcName_NPR.KeyValue)<>varNull then vProd_Id:=lcname_NPR.KeyValue
  else vProd_id:='';
  Open_temp_valsved(1,EditId,vPasp_id,vProd_Id);

  // Проверка даты
  CheckSvedDate(Sender);
  IsNeedReCalcVes:=false;
end;

procedure Tf_SvedNew.btOkClick(Sender: TObject);
var
  vNum:double;
  vDat:TDateTime;
  vPod:string;
  vTech:string;
  vGotov:string;
  vBegNaliv:string;
  vEndNaliv:string;
  vDate_oform:TDateTime;
  vDefi_mass:integer;
  vPasp_id:string;
  vProd_id_NPR:string;
  vPasp_num:string;
  vRez_num:string;
  vPasp_Date:variant;
  vPL15:string;
  vPL20:string;
  vD:TDateTime;

begin
  // Только в режиме добавления или редактирования
  if (EditMode>=2) then exit;

  // Фиксируем изменения
  GridPaspValueExit(Sender);

  // Проверка реквизитов
  if (edNum.text='0') or (edNum.text='') then
  Begin
    Application.MessageBox('Не заполнен номер документа!','Внимание',MB_OK);
    edNum.SetFocus;
    exit;
  End;
  if (edDat.DateTime=0) then
  Begin
    Application.MessageBox('Не заполнена дата документа!','Внимание',MB_OK);
    edDat.SetFocus;
    exit;
  End;
  if (edDateOformDate.DateTime=0) then
  Begin
    Application.MessageBox('Не заполнена дата окончания оформления документа!','Внимание',MB_OK);
    edDateOformDate.SetFocus;
    exit;
  End;
  if (edDateOformTime.Value=null) then
  Begin
    Application.MessageBox('Не заполнено время окончания оформления документа!','Внимание',MB_OK);
    edDateOformTime.SetFocus;
    exit;
  End;
  if VarType(lcDefi_mass.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не заполнен метод замера массы!','Внимание',MB_OK);
    lcDefi_mass.SetFocus;
    exit;
  End;
  if VarType(lcName_NPR.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не выбран нефтепродукт!','Внимание',MB_OK);
    lcName_NPR.SetFocus;
    exit;
  End;
  if (DateOf(edDat.DateTime)<>DateOf(edDateOformDate.DateTime)) then
  Begin
    Application.MessageBox('Дата сведения и дата окончания оформления не совпадают!','Внимание!',MB_OK);
    edDat.SetFocus;
    exit;
  End;

  // Сохранение номера
  if (EditMode=0) then
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[ParentForm.DocType,ParentForm.DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDat.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'SvedNew',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  // Сохранение документа
  try
    vNum:=StrToFloat(edNum.Text);
    vDat:=DateOf(edDat.DateTime);
    if TryStrToDate(edPodDate.Text,vD) and
       TryStrToTime(edPodTime.Text,vD) then
      vPod:=Trim(edPodDate.Text)+' '+Trim(edPodTime.Text)
    else
      vPod:='';
    if TryStrToDate(edTechDate.Text,vD) and
       TryStrToTime(edTechTime.Text,vD) then
      vTech:=Trim(edTechDate.Text)+' '+Trim(edTechTime.Text)
    else
      vTech:='';
    if TryStrToDate(edGotovDate.Text,vD) and
       TryStrToTime(edGotovTime.Text,vD) then
      vGotov:=Trim(edGotovDate.Text)+' '+Trim(edGotovTime.Text)
    else
      vGotov:='';
    if TryStrToDate(edBegNalivDate.Text,vD) and
       TryStrToTime(edBegNalivTime.Text,vD) then
      vBegNaliv:=Trim(edBegNalivDate.Text)+' '+Trim(edBegNalivTime.Text)
    else
      vBegNaliv:='';
    if TryStrToDate(edEndNalivDate.Text,vD) and
       TryStrToTime(edEndNalivTime.Text,vD) then
      vEndNaliv:=Trim(edEndNalivDate.Text)+' '+Trim(edEndNalivTime.Text)
    else
      vEndNaliv:='';

    vDate_oform:=DateOf(edDateOformDate.DateTime)+TimeOf(edDateOformTime.Value);
    vDefi_mass:=lcDefi_Mass.KeyValue;
    if edPasp_id.text<>EmptyPasp then vPasp_id:=edPasp_id.text;
    vProd_id_NPR:=lcName_NPR.KeyValue;
    vPasp_num:=edPasp_num.Text;
    vRez_num:=edRez_num.Text;
    if not (edPasp_date.Value=NULL) then
      vPasp_date:=DateOf(edPasp_date.Value)
    else
      vPasp_date:=edPasp_date.Value;

    EditId:=ParentForm.pkgFOR_SVED.CallFloatFunction('AddTitle',[1,EditId,ParentForm.DocMestoId,ParentForm.DocLoadTypeId,
          vNum,vDat,vPod,vTech,vGotov,vBegNaliv,vEndNaliv,vDate_Oform,
          vDefi_mass,vPasp_id,vProd_id_NPR,vPasp_num,vRez_num,vPasp_date,
          Null,Null,Null]);
//    ParentForm.pkgFOR_SVED.CallProcedure('save_temp_valsved',[EditId]);
//pl15 и pl20 обязательно сохранять после основной таблицы иначе затирает нах
    vPL15:=F_ForSystem.RealToStr(edPL15.Value);
    vPL20:=F_ForSystem.RealToStr(edPL20.Value);
    ParentForm.pkgFOR_SVED.CallProcedure('set_pasp_value',[EditId,602,null,vPL15]);
    ParentForm.pkgFOR_SVED.CallProcedure('set_pasp_value',[EditId,1,null,vPL20]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'SvedNew',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;
end;

procedure Tf_SvedNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_SvedNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[ParentForm.DocType,ParentForm.DocMestoId]);
  except
  End;
end;

procedure Tf_SvedNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckSvedDate(Sender);
end;

procedure Tf_SvedNew.edPasp_idKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then Tf_PaspBrowse.Create(self).ShowModal;
end;

procedure Tf_SvedNew.edPasp_idChange(Sender: TObject);
var vPasp_Id:string;
    vProd_Id:string;
begin
  If Active then
  Begin
    IsNeedReCalcVes:=true;
    if edPasp_id.Text=EmptyPasp then
    begin
      edPasp_num.Text:='';
      edRez_num.Text:='';
      edPasp_date.Value:=NULL;
      edPasp_num.Enabled:=True;
      edPasp_date.Enabled:=True;
      edRez_num.Enabled:=True;
      lcName_NPR.Enabled:=(edNom_zd.Text='');
      lcName_NPRChange(Sender);
    end
    else
    Begin
      vPasp_id:=edPasp_id.text;
      if VarType(lcName_NPR.KeyValue)<>varNull then vProd_Id:=lcname_NPR.KeyValue
      else vProd_id:='';
      Open_temp_valsved(2,EditId,vPasp_id,vProd_Id);
    End;
  end;
end;

procedure Tf_SvedNew.edPasp_idKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_DELETE then
    if edPasp_id.Text<>EmptyPasp then edPasp_id.Text:=EmptyPasp;
end;

procedure Tf_SvedNew.q_PaspAfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crDefault;
end;

procedure Tf_SvedNew.q_PaspBeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crSQLWait;    { Show SQL cursor }
end;

procedure Tf_SvedNew.q_ValPaspBeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crSQLWait;    { Show SQL cursor }
end;

procedure Tf_SvedNew.q_ValPaspAfterOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crDefault;
end;

procedure Tf_SvedNew.btSelPaspClick(Sender: TObject);
begin
  SelPasp;
end;

procedure Tf_SvedNew.btEmptyPaspClick(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
  edPasp_id.Text:=EmptyPasp;
  edPasp_id.SetFocus;
end;

procedure Tf_SvedNew.lcName_NPRChange(Sender: TObject);
var vPasp_Id:string;
    vProd_Id:string;
begin
  if Active then
  Begin
    if (edPasp_id.text=EmptyPasp) and (VarType(lcName_NPR.KeyValue)<>varNull) then
    Begin
      vPasp_id:='';
      vProd_Id:=lcname_NPR.KeyValue;
      Open_temp_valsved(3,EditId,vPasp_id,vProd_Id);
    end;
  end;
end;

procedure Tf_SvedNew.btCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel
end;

procedure Tf_SvedNew.GridPaspValueExit(Sender: TObject);
begin
  if q_temp_ValSved.Active and (q_temp_ValSved.State<>dsBrowse) then q_temp_ValSved.Post;
end;

procedure Tf_SvedNew.sbFillTechTimeClick(Sender: TObject);
begin
  edTechTime.Value:=Now;
  edTechDate.Value:=Now;
end;

procedure Tf_SvedNew.sbEmptyTechTimeClick(Sender: TObject);
begin
  edTechTime.Value:=null;
  edTechDate.Value:=null;
end;

procedure Tf_SvedNew.sbFillGotovDateClick(Sender: TObject);
begin
  edGotovTime.Value:=Now;
  edGotovDate.Value:=Now;
end;

procedure Tf_SvedNew.sbEmptyGotovTimeClick(Sender: TObject);
begin
  edGotovTime.Value:=null;
  edGotovDate.Value:=null;
end;

procedure Tf_SvedNew.sbFillBegNalivDateClick(Sender: TObject);
begin
  edBegNalivTime.Value:=Now;
  edBegNalivDate.Value:=Now;
end;

procedure Tf_SvedNew.sbEmptyBegNalivTimeClick(Sender: TObject);
begin
  edBegNalivTime.Value:=null;
  edBegNalivDate.Value:=null;
end;

procedure Tf_SvedNew.sbFillEndNalivDateClick(Sender: TObject);
begin
  edEndNalivTime.Value:=Now;
  edEndNalivDate.Value:=Now;
end;

procedure Tf_SvedNew.sbEmptyEndNalivTimeClick(Sender: TObject);
begin
  edEndNalivTime.Value:=null;
  edEndNalivDate.Value:=null;
end;

procedure Tf_SvedNew.sbFillPodDateClick(Sender: TObject);
begin
  edPodTime.Value:=Now;
  edPodDate.Value:=Now;
end;

procedure Tf_SvedNew.sbEmptyPodDateClick(Sender: TObject);
begin
  edPodTime.Value:=null;
  edPodDate.Value:=null;
end;

procedure Tf_SvedNew.edNom_zdChange(Sender: TObject);
begin
  lcName_NPR.Enabled:=(edNom_zd.Text='');
end;

procedure Tf_SvedNew.CheckDateOforml(Sender: TObject);
begin
  if (DateOf(edDateOformDate.DateTime)<DateOf(edDat.DateTime)) then
    edDateOformDate.DateTime:=DateOf(edDat.DateTime);
end;

procedure Tf_SvedNew.edPl15Change(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedNew.edPl20Change(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedNew.q_temp_ValSvedAfterPost(DataSet: TDataSet);
begin
  IsNeedReCalcVes:=true;
end;

end.
