unit MO_VedOsmotrNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls, Oracle, MO_VedOsmotr;

type
  Tf_VedOsmotrNew = class(TForm)
    btOk: TBitBtn;
    btCancel: TBitBtn;
    edNum: TEdit;
    edDat: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FromTime: TDateTimePicker;
    Label4: TLabel;
    ToTime: TDateTimePicker;
    ToDate: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edFIO1: TComboEdit;
    edFIO2: TComboEdit;
    edFIO3: TComboEdit;
    edSIGN1: TComboEdit;
    pkgFOR_DOCUMENTS: TOraclePackage;
    btSetNum: TSpeedButton;
    procedure edFIO1ButtonClick(Sender: TObject);
    procedure edFIO2ButtonClick(Sender: TObject);
    procedure edFIO3ButtonClick(Sender: TObject);
    procedure edSIGN1ButtonClick(Sender: TObject);
    procedure CheckTime(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    CurrentFIO1:string;
    CurrentFIO2:string;
    CurrentFIO3:string;
    CurrentSIGN1:string;
  public
    { Public declarations }
    EditID:double;
    IsAdd:boolean;
    ParentForm:Tf_VedOsmotr;
  end;

var
  f_VedOsmotrNew: Tf_VedOsmotrNew;
{  LastFIO1:string;
  LastFIO2:string;
  LastFIO3:string;
  LastSIGN1:string;}

implementation

uses KlsMisc2,DateUtils, ForSESS, main;

{$R *.dfm}

procedure Tf_VedOsmotrNew.edFIO1ButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('VED_OSMOTR_SMENA','CHOOSE',fsNormal,CurrentFIO1,edFIO1.Text);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentFIO1:=KlsMisc2.vIdToSeek;
      edFIO1.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;
end;

procedure Tf_VedOsmotrNew.edFIO2ButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('VED_OSMOTR_SMENA','CHOOSE',fsNormal,CurrentFIO2,edFIO2.Text);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentFIO2:=KlsMisc2.vIdToSeek;
      edFIO2.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;

end;

procedure Tf_VedOsmotrNew.edFIO3ButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('VED_OSMOTR_SMENA','CHOOSE',fsNormal,CurrentFIO3,edFIO3.Text);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentFIO3:=KlsMisc2.vIdToSeek;
      edFIO3.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;

end;

procedure Tf_VedOsmotrNew.edSIGN1ButtonClick(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('VED_OSMOTR_PODPIS','CHOOSE',fsNormal,CurrentSIGN1,edSIGN1.Text);

  with TF_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    begin
      CurrentSIGN1:=KlsMisc2.vIdToSeek;
      edSIGN1.Text:=KlsMisc2.ResultName;
    end;
    Free;
  end;

end;

procedure Tf_VedOsmotrNew.CheckTime(Sender: TObject);
begin
  if (DateOf(ToDate.DateTime)<DateOf(edDat.DateTime)) then
    ToDate.DateTime:=edDat.DateTime;

  if (TimeOf(ToTime.DateTime)<TimeOf(FromTime.DateTime)) and
     (DateOf(ToDate.DateTime)=DateOf(edDat.DateTime)) then
    ToDate.DateTime:=edDat.DateTime+1;

  if IsAdd and (CurrentDate<>DateOf(edDat.DateTime)) then
  try
    // Если документ новый и меняется дата,
    // заново получим номер документа (на случай если номер зависит от даты)
    edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[ParentForm.DocType,ParentForm.DocMestoId,'',DateOf(edDat.DateTime)])
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDat.DateTime);
end;

procedure Tf_VedOsmotrNew.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_VedOsmotr(Owner);
  pkgFOR_DOCUMENTS.Session:=ParentForm.ora_Session;
  CurrentDate:=Now-1;
end;

procedure Tf_VedOsmotrNew.FormActivate(Sender: TObject);
begin
  if IsAdd and (EditId<=0) then
  Begin
    Caption:='Новая ведомость осмотра';

    edDat.DateTime:=DateOf(Now);
    FromTime.DateTime:=RecodeSecond(TimeOf(Now),0);
    ToDate.DateTime:=edDat.DateTime;
    ToTime.DateTime:=FromTime.DateTime;
{    edFIO1.Text:=LastFIO1;
    edFIO2.Text:=LastFIO2;
    edFIO3.Text:=LastFIO3;
    edSIGN1.Text:=LastSIGN1;}

    EditId:=0;
  End;

  if IsAdd and (EditId>0) then
  Begin
    Caption:='Новая ведомость осмотра';

{    edDat.DateTime:=ParentForm.q_Title.FieldByName('VED_DATE').AsDateTime;
    FromTime.DateTime:=TimeOf(ParentForm.q_Title.FieldByName('FROM_DATE').AsDateTime);
    ToDate.DateTime:=DateOf(ParentForm.q_Title.FieldByName('TO_DATE').AsDateTime);
    ToTime.DateTime:=TimeOf(ParentForm.q_Title.FieldByName('TO_DATE').AsDateTime);}
    edDat.DateTime:=DateOf(Now);
    FromTime.DateTime:=RecodeSecond(TimeOf(Now),0);
    ToDate.DateTime:=edDat.DateTime;
    ToTime.DateTime:=FromTime.DateTime;
    edFIO1.Text:=ParentForm.q_Title.FieldByName('FIO1').AsString;
    edFIO2.Text:=ParentForm.q_Title.FieldByName('FIO2').AsString;
    edFIO3.Text:=ParentForm.q_Title.FieldByName('FIO3').AsString;
    edSIGN1.Text:=ParentForm.q_Title.FieldByName('SIGN1').AsString;

    EditId:=0;
  end;

  if not IsAdd and (EditId>0) then
  Begin
    Caption:='Редактирование ведомости осмотра';

    edNum.Text:=ParentForm.q_Title.FieldByName('VED_NUM').AsString;
    edDat.DateTime:=ParentForm.q_Title.FieldByName('VED_DATE').AsDateTime;
    FromTime.DateTime:=TimeOf(ParentForm.q_Title.FieldByName('FROM_DATE').AsDateTime);
    ToDate.DateTime:=DateOf(ParentForm.q_Title.FieldByName('TO_DATE').AsDateTime);
    ToTime.DateTime:=TimeOf(ParentForm.q_Title.FieldByName('TO_DATE').AsDateTime);
    edFIO1.Text:=ParentForm.q_Title.FieldByName('FIO1').AsString;
    edFIO2.Text:=ParentForm.q_Title.FieldByName('FIO2').AsString;
    edFIO3.Text:=ParentForm.q_Title.FieldByName('FIO3').AsString;
    edSIGN1.Text:=ParentForm.q_Title.FieldByName('SIGN1').AsString;
  end;

  CheckTime(Sender);
end;

procedure Tf_VedOsmotrNew.btOkClick(Sender: TObject);
var
  vNum:double;
  vDat:TDateTime;
  vFromDate:TDateTime;
  vToDate:TDateTime;
  vFIO1:string;
  vFIO2:string;
  vFIO3:string;
  vSIGN1:string;
begin
  // Проверка реквизитов
  if (edNum.text='0') or (edNum.text='') then
  Begin
    Application.MessageBox('Не заполнен номер документа!','Внимание',MB_OK);
    edNum.SetFocus;
    exit;
  End;

  // Сохранение номера
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[ParentForm.DocType,ParentForm.DocMestoId,FloatToStr(EditId),'',StrToInt(edNum.Text),DateOf(edDat.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  // Сохранение документа
  try
    vNum:=StrToFloat(edNum.Text);
    vDat:=DateOf(edDat.DateTime)+TimeOf(FromTime.DateTime);
    vFromDate:=DateOf(edDat.DateTime)+TimeOf(FromTime.DateTime);
    vToDate:=DateOf(ToDate.DateTime)+TimeOf(ToTime.DateTime);
    vFIO1:=edFIO1.Text;
    vFIO2:=edFIO2.Text;
    vFIO3:=edFIO3.Text;
    vSIGN1:=edSIGN1.Text;

    EditId:=ParentForm.pkgFOR_VED_OSMOTR.CallFloatFunction('AddTitle',[1,EditId,ParentForm.DocMestoId,ParentForm.DocLoadTypeId,vNum,vDat,
      vFromDate,vToDate,vFIO1,vFIO2,vFIO3,vSIGN1]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

{  LastFIO1:=edFIO1.Text;
  LastFIO2:=edFIO2.Text;
  LastFIO3:=edFIO3.Text;
  LastSIGN1:=edSIGN1.Text;}

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;
end;

procedure Tf_VedOsmotrNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_VedOsmotrNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[ParentForm.DocType,ParentForm.DocMestoId]);
  except
  End;
end;

procedure Tf_VedOsmotrNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckTime(Sender);
end;

end.
