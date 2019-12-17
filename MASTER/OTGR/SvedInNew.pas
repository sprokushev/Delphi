unit SvedInNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls, Oracle, SvedIn,
  CurrEdit, RxLookup, DB, OracleData, DBCtrlsEh;

type
  Tf_SvedInNew = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    pkgFOR_DOCUMENTS: TOraclePackage;
    q_Prod: TOracleDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Prod: TDataSource;
    gbSved: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edNum: TEdit;
    edDat: TDateTimePicker;
    btSetNum: TSpeedButton;
    gbOformlenie: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    sbFillGotovDate: TSpeedButton;
    sbEmptyGotovTime: TSpeedButton;
    sbFillBegNalivDate: TSpeedButton;
    sbEmptyBegNalivTime: TSpeedButton;
    sbFillEndNalivDate: TSpeedButton;
    sbEmptyEndNalivTime: TSpeedButton;
    edGotovTime: TDBDateTimeEditEh;
    edGotovDate: TDBDateTimeEditEh;
    edBegNalivTime: TDBDateTimeEditEh;
    edBegNalivDate: TDBDateTimeEditEh;
    edEndNalivTime: TDBDateTimeEditEh;
    edEndNalivDate: TDBDateTimeEditEh;
    edDateOformTime: TDBDateTimeEditEh;
    edDateOformDate: TDateTimePicker;
    gbPassport: TGroupBox;
    lbProdName: TLabel;
    lc_Prod: TRxDBLookupCombo;
    Label14: TLabel;
    edPaspNum: TEdit;
    Label15: TLabel;
    edRezNum: TEdit;
    Label16: TLabel;
    edPVod: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edPDirt: TCurrencyEdit;
    Label5: TLabel;
    edMGSol: TCurrencyEdit;
    Label6: TLabel;
    edPSol: TCurrencyEdit;
    Label21: TLabel;
    edPl15: TCurrencyEdit;
    Label9: TLabel;
    edPl20: TCurrencyEdit;
    q_sved: TOracleDataSet;
    edPasp_date: TDBDateTimeEditEh;
    cbPSolTraces: TCheckBox;
    cbPDirtTraces: TCheckBox;
    cbPVodTraces: TCheckBox;
    procedure CheckSvedDate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure sbFillGotovDateClick(Sender: TObject);
    procedure sbEmptyGotovTimeClick(Sender: TObject);
    procedure sbFillBegNalivDateClick(Sender: TObject);
    procedure sbEmptyBegNalivTimeClick(Sender: TObject);
    procedure sbFillEndNalivDateClick(Sender: TObject);
    procedure sbEmptyEndNalivTimeClick(Sender: TObject);
    procedure CheckDateOform(Sender: TObject);
    procedure edPl20Change(Sender: TObject);
    procedure edPl15Change(Sender: TObject);
    procedure edPVodChange(Sender: TObject);
    procedure edPDirtChange(Sender: TObject);
    procedure edPSolChange(Sender: TObject);
    procedure cbPDirtTracesClick(Sender: TObject);
    procedure cbPSolTracesClick(Sender: TObject);
    procedure cbPVodTracesClick(Sender: TObject);
    procedure edEndNalivDateChange(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    OldId:string;
  public
    { Public declarations }
    EditID:string;
    EditMode:integer; // EditMode=0 - добавление, EditMode=1 - редактирование, EditMode=2 - просмотр
    ParentForm:Tf_SvedIn;
    IsNeft:boolean;
    IsNeedReCalcVes:boolean;
  end;

var
  f_SvedInNew: Tf_SvedInNew;

implementation

uses KlsMisc2,DateUtils, ForSESS, main, ForDB;

{$R *.dfm}

procedure Tf_SvedInNew.CheckSvedDate(Sender: TObject);
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
      f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDat.DateTime);
end;

procedure Tf_SvedInNew.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_SvedIn(Owner);
  pkgFOR_DOCUMENTS.Session:=ParentForm.ora_Session;
  q_Prod.Session:=ParentForm.ora_Session;
  q_sved.Session:=ParentForm.ora_Session;
  CurrentDate:=Now-1;
end;

procedure Tf_SvedInNew.FormActivate(Sender: TObject);
begin
  if IsNeft then
  Begin
    q_Prod.SQL[4]:=' AND ID_NPR BETWEEN ''90000'' AND ''90099''';
    lbProdName.Caption:='Вид нефти:';
  end
  else
  Begin
    q_Prod.SQL[4]:=' AND NOT (ID_NPR BETWEEN ''90000'' AND ''90099'')';
    lbProdName.Caption:='Груз:';
  end;
  f_db.ReQuery(q_Prod,false);

  OldId:=EditId;
  
  if (EditMode=0) and (EditId='') then
  Begin
    if IsNeft then
      Caption:='Новое сведение о сливе нефти'
    else
      Caption:='Новое сведение о разгрузке';

    edDat.DateTime:=DateOf(Now);
    edGotovTime.Value:=null;
    edGotovDate.Value:=DateOf(Now);
    edBegNalivTime.Value:=null;
    edBegNalivDate.Value:=DateOf(Now);
    edEndNalivTime.Value:=null;
    edEndNalivDate.Value:=DateOf(Now);
    edDateOformTime.Value:=TimeOf(Now);
    edDateOformDate.DateTime:=DateOf(Now);

    EditId:='';
    edGotovTime.SetFocus;
  End;

  if (EditMode=0) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_IN_ID',EditID);
    f_db.ReQuery(q_sved,false);

    if IsNeft then
      Caption:='Новое сведение о сливе нефти'
    else
      Caption:='Новое сведение о разгрузке';

    edDat.DateTime:=DateOf(Now);
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
    edDateOformTime.Value:=TimeOf(Now);
    edDateOformDate.DateTime:=DateOf(Now);
    lc_Prod.KeyValue:=q_Sved.FieldByName('PROD_ID_NPR').AsString;
    edPaspNum.Text:=q_Sved.FieldByName('PASP_NUM').AsString;
    edRezNum.Text:=q_Sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    edPl20.Value:=q_Sved.FieldByName('PL').AsFloat;
    edPl15.Value:=q_Sved.FieldByName('PL15').AsFloat;
    if q_Sved.FieldByName('P_VOD').AsFloat<0 then
    Begin
      cbPVodTraces.Checked:=true;
    end
    else
    begin
      cbPVodTraces.Checked:=false;;
      edPVod.Value:=q_Sved.FieldByName('P_VOD').AsFloat;
    end;
    if q_Sved.FieldByName('P_DIRT').AsFloat<0 then
    Begin
      cbPDirtTraces.Checked:=true;
    End
    else
    begin
      cbPDirtTraces.Checked:=false;;
      edPDirt.Value:=q_Sved.FieldByName('P_DIRT').AsFloat;
    end;
    edMGSol.Value:=q_Sved.FieldByName('MG_SOL').AsFloat;
    if q_Sved.FieldByName('P_SOL').AsFloat<0 then
    Begin
      cbPSolTraces.Checked:=true;
    End
    else
    begin
      cbPSolTraces.Checked:=false;;
      edPSol.Value:=q_Sved.FieldByName('P_SOL').AsFloat;
    end;

    EditId:='';
    q_sved.Close;
    edGotovTime.SetFocus;
  end;

  if (EditMode=1) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_IN_ID',EditID);
    f_db.ReQuery(q_sved,false);

    if IsNeft then
      Caption:='Редактирование сведения о сливе нефти'
    else
      Caption:='Редактирование сведения о разгрузке';

    edNum.Text:=q_Sved.FieldByName('SVED_NUM').AsString;
    edDat.DateTime:=DateOf(q_Sved.FieldByName('SVED_DATE').AsDateTime);
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
    edDateOformDate.DateTime:=DateOf(Now);
    edDateOformTime.Value:=TimeOf(Now);
    lc_Prod.KeyValue:=q_Sved.FieldByName('PROD_ID_NPR').AsString;
    edPaspNum.Text:=q_Sved.FieldByName('PASP_NUM').AsString;
    edRezNum.Text:=q_Sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    edPl20.Value:=q_Sved.FieldByName('PL').AsFloat;
    edPl15.Value:=q_Sved.FieldByName('PL15').AsFloat;
    if q_Sved.FieldByName('P_VOD').AsFloat<0 then
    Begin
      cbPVodTraces.Checked:=true;
    end
    else
    begin
      cbPVodTraces.Checked:=false;;
      edPVod.Value:=q_Sved.FieldByName('P_VOD').AsFloat;
    end;
    if q_Sved.FieldByName('P_DIRT').AsFloat<0 then
    Begin
      cbPDirtTraces.Checked:=true;
    End
    else
    begin
      cbPDirtTraces.Checked:=false;;
      edPDirt.Value:=q_Sved.FieldByName('P_DIRT').AsFloat;
    end;
    edMGSol.Value:=q_Sved.FieldByName('MG_SOL').AsFloat;
    if q_Sved.FieldByName('P_SOL').AsFloat<0 then
    Begin
      cbPSolTraces.Checked:=true;
    End
    else
    begin
      cbPSolTraces.Checked:=false;;
      edPSol.Value:=q_Sved.FieldByName('P_SOL').AsFloat;
    end;
    edPl15.SetFocus;
  end;

  if (EditMode=2) and (EditId<>'') then
  Begin
    q_sved.Close;
    q_sved.SetVariable('SVED_IN_ID',EditID);
    f_db.ReQuery(q_sved,false);

    if IsNeft then
      Caption:='Просмотр сведения о сливе нефти'
    else
      Caption:='Просмотр сведения о разгрузке';

    edNum.Text:=q_Sved.FieldByName('SVED_NUM').AsString;
    edDat.DateTime:=DateOf(q_Sved.FieldByName('SVED_DATE').AsDateTime);
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
    edDateOformDate.DateTime:=DateOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
    edDateOformTime.Value:=TimeOf(q_sved.FieldByName('DATE_OFORML').AsDateTime);
    lc_Prod.KeyValue:=q_Sved.FieldByName('PROD_ID_NPR').AsString;
    edPaspNum.Text:=q_Sved.FieldByName('PASP_NUM').AsString;
    edRezNum.Text:=q_Sved.FieldByName('REZ_NUM').AsString;
    if q_sved.FieldByName('PASP_DATE').AsDateTime>0 then
    Begin
      edPasp_date.Value:=q_sved.FieldByName('PASP_DATE').AsDateTime;
    end
    else
    begin
      edPasp_date.Value:=null;
    end;
    edPl20.Value:=q_Sved.FieldByName('PL').AsFloat;
    edPl15.Value:=q_Sved.FieldByName('PL15').AsFloat;
    if q_Sved.FieldByName('P_VOD').AsFloat<0 then
    Begin
      cbPVodTraces.Checked:=true;
    end
    else
    begin
      cbPVodTraces.Checked:=false;;
      edPVod.Value:=q_Sved.FieldByName('P_VOD').AsFloat;
    end;
    if q_Sved.FieldByName('P_DIRT').AsFloat<0 then
    Begin
      cbPDirtTraces.Checked:=true;
    End
    else
    begin
      cbPDirtTraces.Checked:=false;;
      edPDirt.Value:=q_Sved.FieldByName('P_DIRT').AsFloat;
    end;
    edMGSol.Value:=q_Sved.FieldByName('MG_SOL').AsFloat;
    if q_Sved.FieldByName('P_SOL').AsFloat<0 then
    Begin
      cbPSolTraces.Checked:=true;
    End
    else
    begin
      cbPSolTraces.Checked:=false;;
      edPSol.Value:=q_Sved.FieldByName('P_SOL').AsFloat;
    end;
    gbSved.Enabled:=false;
    gbOformlenie.Enabled:=false;
    gbPassport.Enabled:=false;
    btOk.Enabled:=false;
  end;

  CheckSvedDate(Sender);
  IsNeedReCalcVes:=false;
end;

procedure Tf_SvedInNew.btOkClick(Sender: TObject);
var
  vNum:double;
  vDat:TDateTime;
  vGotov:string;
  vBegNaliv:string;
  vEndNaliv:string;
  vDate_Oform:TDateTime;
  vProdId:string;
  vPaspNum:string;
  vRezNum:string;
  vPasp_Date:variant;
  vPl20:double;
  vPl15:double;
  vPVod:double;
  vPDirt:double;
  vMGSol:double;
  vPSol:double;
  vD:TDateTime;
begin
  // Только в режиме добавления или редактирования
  if (EditMode>=2) then exit;

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
  if VarType(lc_Prod.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не выбран груз!','Внимание',MB_OK);
    lc_Prod.SetFocus;
    exit;
  End;
{  if (DateOf(edDat.DateTime)<>DateOf(edDateOformDate.DateTime)) then
  Begin
    Application.MessageBox('Дата сведения и дата окончания оформления не совпадают!','Внимание!',MB_OK);
    edDat.SetFocus;
    exit;
  End;}

  // Сохранение номера
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[ParentForm.DocType,ParentForm.DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDat.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  // Сохранение документа
  try
    vNum:=StrToFloat(edNum.Text);
    vDat:=DateOf(edDat.DateTime);
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
    vProdId:=lc_prod.KeyValue;
    vPaspNum:=edPaspNum.Text;
    vRezNum:=edRezNum.Text;
    if not (edPasp_date.Value=NULL) then
      vPasp_date:=DateOf(edPasp_date.Value)
    else
      vPasp_date:=edPasp_date.Value;
    vPl20:=edPl20.Value;
    vPl15:=edPl15.Value;
    if cbPVodTraces.Checked then
      vPVod:=-1
    else
      vPVod:=edPVod.Value;
    if cbPDirtTraces.Checked then
      vPDirt:=-1
    else
      vPDirt:=edPDirt.Value;
    vMGSol:=edMGSol.Value;
    if cbPSolTraces.Checked then
      vPSol:=-1
    else
      vPSol:=edPSol.Value;

    // Добавляем сведение
    EditId:=ParentForm.pkgFOR_SVED_IN.CallStringFunction('AddTitle',[0,EditId,ParentForm.DocMestoId,vNum,
          vDat,vGotov,vBegNaliv,vEndNaliv,vDate_Oform,vProdId,vPaspNum,vRezNum,
          vPasp_Date,vPl20,vPl15,vPVod,vPDirt,vMGSol,vPSol]);

    If (EditMode=0) and (OldId<>'') then
    Begin
      // Копируем вагоны
      if Application.MessageBox('Скопировать вагоны?','Внимание!',MB_YESNO)=IDYES then
      Begin
        ParentForm.pkgFOR_SVED_IN.CallProcedure('CopySvedRow',[0,OldId,EditId]);
      end;
    end;

  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'SVED_IN',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;
end;

procedure Tf_SvedInNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_SvedInNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[ParentForm.DocType,ParentForm.DocMestoId]);
  except
  End;
end;

procedure Tf_SvedInNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckSvedDate(Sender);
end;

procedure Tf_SvedInNew.sbFillGotovDateClick(Sender: TObject);
begin
  edGotovTime.Value:=Now;
  edGotovDate.Value:=Now;
end;

procedure Tf_SvedInNew.sbEmptyGotovTimeClick(Sender: TObject);
begin
  edGotovTime.Value:=null;
  edGotovDate.Value:=null;
end;

procedure Tf_SvedInNew.sbFillBegNalivDateClick(Sender: TObject);
begin
  edBegNalivTime.Value:=Now;
  edBegNalivDate.Value:=Now;
end;

procedure Tf_SvedInNew.sbEmptyBegNalivTimeClick(Sender: TObject);
begin
  edBegNalivTime.Value:=null;
  edBegNalivDate.Value:=null;
end;

procedure Tf_SvedInNew.sbFillEndNalivDateClick(Sender: TObject);
begin
  edEndNalivTime.Value:=Now;
  edEndNalivDate.Value:=Now;
end;

procedure Tf_SvedInNew.sbEmptyEndNalivTimeClick(Sender: TObject);
begin
  edEndNalivTime.Value:=null;
  edEndNalivDate.Value:=null;
end;

procedure Tf_SvedInNew.CheckDateOform(Sender: TObject);
begin
  if (DateOf(edDateOformDate.DateTime)<DateOf(edDat.DateTime)) then
    edDateOformDate.DateTime:=DateOf(edDat.DateTime);
end;

procedure Tf_SvedInNew.edPl20Change(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedInNew.edPl15Change(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedInNew.edPVodChange(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedInNew.edPDirtChange(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedInNew.edPSolChange(Sender: TObject);
begin
  IsNeedReCalcVes:=true;
end;

procedure Tf_SvedInNew.cbPDirtTracesClick(Sender: TObject);
begin
  if cbPDirtTraces.Checked then
  Begin
    edPDirt.Value:=0;
    edPDirt.Enabled:=false;
  end
  else
  begin
    edPDirt.Value:=0;
    edPDirt.Enabled:=true;
  end;
end;

procedure Tf_SvedInNew.cbPSolTracesClick(Sender: TObject);
begin
  if cbPSolTraces.Checked then
  Begin
    edPSol.Value:=0;
    edPSol.Enabled:=false;
  end
  else
  begin
    edPSol.Value:=0;
    edPSol.Enabled:=true;
  end;

end;

procedure Tf_SvedInNew.cbPVodTracesClick(Sender: TObject);
begin
  if cbPVodTraces.Checked then
  Begin
    edPVod.Value:=0;
    edPVod.Enabled:=false;
  end
  else
  begin
    edPVod.Value:=0;
    edPVod.Enabled:=true;
  end;
end;

procedure Tf_SvedInNew.edEndNalivDateChange(Sender: TObject);
begin
  try
    edDat.DateTime:=DateOf(edEndNalivDate.Value);
  except
  end;  
end;

end.
