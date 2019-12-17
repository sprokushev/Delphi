unit MO_PodachaNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls, Oracle, MO_Podacha,
  CurrEdit, RxLookup, DB, OracleData, DBCtrlsEh;

type
  Tf_PodachaNew = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    pkgFOR_DOCUMENTS: TOraclePackage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbProdName: TLabel;
    lc_Track: TRxDBLookupCombo;
    Label7: TLabel;
    q_Track: TOracleDataSet;
    q_TrackID: TFloatField;
    q_TrackNAME: TStringField;
    ds_Track: TDataSource;
    btSetNum: TSpeedButton;
    Label3: TLabel;
    sbFillTechTime: TSpeedButton;
    edTechTime: TDBDateTimeEditEh;
    edTechDate: TDBDateTimeEditEh;
    edTime: TDBDateTimeEditEh;
    edGotovTime: TDBDateTimeEditEh;
    edBegNalivTime: TDBDateTimeEditEh;
    edEndNalivTime: TDBDateTimeEditEh;
    edGotovDate: TDBDateTimeEditEh;
    edBegNalivDate: TDBDateTimeEditEh;
    edEndNalivDate: TDBDateTimeEditEh;
    sbFillGotovDate: TSpeedButton;
    sbFillBegNalivDate: TSpeedButton;
    sbFillEndNalivDate: TSpeedButton;
    sbEmptyTechTime: TSpeedButton;
    sbEmptyGotovTime: TSpeedButton;
    sbEmptyBegNalivTime: TSpeedButton;
    sbEmptyEndNalivTime: TSpeedButton;
    edDate: TDateTimePicker;
    procedure CheckDate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure sbFillTechTimeClick(Sender: TObject);
    procedure edDateCloseUp(Sender: TObject; Accept: Boolean);
    procedure sbFillGotovDateClick(Sender: TObject);
    procedure sbFillBegNalivDateClick(Sender: TObject);
    procedure sbFillEndNalivDateClick(Sender: TObject);
    procedure sbEmptyTechTimeClick(Sender: TObject);
    procedure sbEmptyGotovTimeClick(Sender: TObject);
    procedure sbEmptyBegNalivTimeClick(Sender: TObject);
    procedure sbEmptyEndNalivTimeClick(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
  public
    { Public declarations }
    EditID:double;
    IsAdd:boolean;
    ParentForm:Tf_Podacha;
  end;

var
  f_PodachaNew: Tf_PodachaNew;

implementation

uses KlsMisc2,DateUtils, ForSESS, main, ForDB;

{$R *.dfm}

procedure Tf_PodachaNew.CheckDate(Sender: TObject);
begin

  if IsAdd and (CurrentDate<>DateOf(edDate.DateTime)) then
  try
    // Если документ новый и меняется дата,
    // заново получим номер документа (на случай если номер зависит от даты)
    edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[ParentForm.DocType,ParentForm.DocMestoId,'',DateOf(edDate.DateTime)])
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDate.DateTime);
end;

procedure Tf_PodachaNew.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Podacha(Owner);
  pkgFOR_DOCUMENTS.Session:=ParentForm.ora_Session;
  q_Track.SetVariable('LOAD_TYPE_ID',ParentForm.DocLoadTypeId);
  q_Track.Session:=ParentForm.ora_Session;
  CurrentDate:=Now-1;
end;

procedure Tf_PodachaNew.FormActivate(Sender: TObject);
begin
  f_db.ReQuery(q_Track,false);

  if IsAdd and (EditId=0) then
  Begin
    Caption:='Новая ведомость подачи';

    edDate.DateTime:=DateOf(Now);
    edTime.Value:=TimeOf(Now);
    edTechTime.Value:=null;
    edTechDate.Value:=null;
    edGotovTime.Value:=null;
    edGotovDate.Value:=null;
    edBegNalivTime.Value:=null;
    edBegNalivDate.Value:=null;
    edEndNalivTime.Value:=null;
    edEndNalivDate.Value:=null;

    EditId:=0;
  End;

  if IsAdd and (EditId>0) then
  Begin
    Caption:='Новая ведомость подачи';

    edDate.DateTime:=DateOf(Now);
    edTime.Value:=TimeOf(Now);
    edTechTime.Value:=null;
    edTechDate.Value:=null;
    edGotovTime.Value:=null;
    edGotovDate.Value:=null;
    edBegNalivTime.Value:=null;
    edBegNalivDate.Value:=null;
    edEndNalivTime.Value:=null;
    edEndNalivDate.Value:=null;
    lc_Track.KeyValue:=ParentForm.q_Title.FieldByName('VETKA_OTP_ID').AsInteger;

    EditId:=0;
  end;

  if not IsAdd and (EditId>0) then
  Begin
    Caption:='Редактирование ведомости подачи';

    edNum.Text:=ParentForm.q_Title.FieldByName('POD_NUM').AsString;
    edDate.DateTime:=DateOf(ParentForm.q_Title.FieldByName('POD_DATE').AsDateTime);
    edTime.Value:=TimeOf(ParentForm.q_Title.FieldByName('POD_DATE').AsDateTime);
    if ParentForm.q_Title.FieldByName('TECH_TIME').AsDateTime>0 then
    Begin
      edTechTime.Value:=TimeOf(ParentForm.q_Title.FieldByName('TECH_TIME').AsDateTime);
      edTechDate.Value:=DateOf(ParentForm.q_Title.FieldByName('TECH_TIME').AsDateTime);
    end
    else
    begin
      edTechTime.Value:=null;
      edTechDate.Value:=null;
    end;
    if ParentForm.q_Title.FieldByName('GOTOV_TIME').AsDateTime>0 then
    Begin
      edGotovTime.Value:=TimeOf(ParentForm.q_Title.FieldByName('GOTOV_TIME').AsDateTime);
      edGotovDate.Value:=DateOf(ParentForm.q_Title.FieldByName('GOTOV_TIME').AsDateTime);
    end
    else
    begin
      edGotovTime.Value:=null;
      edGotovDate.Value:=null;
    end;
    if ParentForm.q_Title.FieldByName('BEG_NALIV_TIME').AsDateTime>0 then
    Begin
      edBegNalivTime.Value:=TimeOf(ParentForm.q_Title.FieldByName('BEG_NALIV_TIME').AsDateTime);
      edBegNalivDate.Value:=DateOf(ParentForm.q_Title.FieldByName('BEG_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edBegNalivTime.Value:=null;
      edBegNalivDate.Value:=null;
    end;
    if ParentForm.q_Title.FieldByName('END_NALIV_TIME').AsDateTime>0 then
    Begin
      edEndNalivTime.Value:=TimeOf(ParentForm.q_Title.FieldByName('END_NALIV_TIME').AsDateTime);
      edEndNalivDate.Value:=DateOf(ParentForm.q_Title.FieldByName('END_NALIV_TIME').AsDateTime);
    end
    else
    begin
      edEndNalivTime.Value:=null;
      edEndNalivDate.Value:=null;
    end;
    lc_Track.KeyValue:=ParentForm.q_Title.FieldByName('VETKA_OTP_ID').AsInteger;
  end;

  CheckDate(Sender);
end;

procedure Tf_PodachaNew.btOkClick(Sender: TObject);
var
  vNum: double;
  vDat: TDateTime;
  vTech: string;
  vGotov: string;
  vBegNaliv: string;
  vEndNaliv: string;
  vTrack: integer;
  vD:TDateTime;
begin
  // Проверка реквизитов
  if (edNum.text='0') or (edNum.text='') then
  Begin
    Application.MessageBox('Не заполнен номер документа!','Внимание',MB_OK);
    edNum.SetFocus;
    exit;
  End;
  if (edTime.Value=null) then
  Begin
    Application.MessageBox('Не заполнено время документа!','Внимание',MB_OK);
    edTime.SetFocus;
    exit;
  End;
  if (edDate.DateTime=0) then
  Begin
    Application.MessageBox('Не заполнена дата документа!','Внимание',MB_OK);
    edDate.SetFocus;
    exit;
  End;
  if VarType(lc_Track.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не выбран путь погрузки!','Внимание',MB_OK);
    lc_Track.SetFocus;
    exit;
  End;

  // Сохранение номера
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[ParentForm.DocType,ParentForm.DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDate.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  // Сохранение документа
  try
    vNum:=StrToFloat(edNum.Text);
    vDat:=DateOf(edDate.DateTime)+TimeOf(edTime.Value);
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
    vTrack:=lc_Track.KeyValue;

    EditId:=ParentForm.pkgFOR_PODACHA.CallFloatFunction('AddTitle',[1,EditId,ParentForm.DocMestoId,ParentForm.DocLoadTypeId,
          vNum,vDat,vTech,vGotov,vBegNaliv,vEndNaliv,vTrack]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;
end;

procedure Tf_PodachaNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_PodachaNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[ParentForm.DocType,ParentForm.DocMestoId]);
  except
  End;
end;

procedure Tf_PodachaNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckDate(Sender);
end;

procedure Tf_PodachaNew.sbFillTechTimeClick(Sender: TObject);
begin
  edTechTime.Value:=Now;
  edTechDate.Value:=Now;
end;

procedure Tf_PodachaNew.edDateCloseUp(Sender: TObject;
  Accept: Boolean);
begin
  CheckDate(Sender);
end;

procedure Tf_PodachaNew.sbFillGotovDateClick(Sender: TObject);
begin
  edGotovTime.Value:=Now;
  edGotovDate.Value:=Now;
end;

procedure Tf_PodachaNew.sbFillBegNalivDateClick(Sender: TObject);
begin
  edBegNalivTime.Value:=Now;
  edBegNalivDate.Value:=Now;
end;

procedure Tf_PodachaNew.sbFillEndNalivDateClick(Sender: TObject);
begin
  edEndNalivTime.Value:=Now;
  edEndNalivDate.Value:=Now;
end;

procedure Tf_PodachaNew.sbEmptyTechTimeClick(Sender: TObject);
begin
  edTechTime.Value:=null;
  edTechDate.Value:=null;
end;

procedure Tf_PodachaNew.sbEmptyGotovTimeClick(Sender: TObject);
begin
  edGotovTime.Value:=null;
  edGotovDate.Value:=null;
end;

procedure Tf_PodachaNew.sbEmptyBegNalivTimeClick(Sender: TObject);
begin
  edBegNalivTime.Value:=null;
  edBegNalivDate.Value:=null;
end;

procedure Tf_PodachaNew.sbEmptyEndNalivTimeClick(Sender: TObject);
begin
  edEndNalivTime.Value:=null;
  edEndNalivDate.Value:=null;
end;

end.
