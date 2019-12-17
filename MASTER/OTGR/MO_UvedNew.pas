unit MO_UvedNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData,
  ComCtrls, StdCtrls, Buttons, ToolWin, ActnCtrls, Grids, DBGridEh, MO_Sved, MO_Uved, DateUtils,
  PropFilerEh, PropStorageEh, TB2Item, Menus,DBGridEhImpExp,RxShell;

type
  Tf_UvedNew = class(TForm)
    GridVagons: TDBGridEh;
    ActionToolBar1: TActionToolBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    btSetNum: TSpeedButton;
    edNum: TEdit;
    edDate: TDateTimePicker;
    q_temp_uved: TOracleDataSet;
    ds_temp_uved: TDataSource;
    pkgFor_uved: TOraclePackage;
    amUved: TActionManager;
    acUvedAdd: TAction;
    acUvedSave: TAction;
    acUvedDel: TAction;
    acExit: TAction;
    pkgFor_documents: TOraclePackage;
    q_temp_uvedUVED_POS: TFloatField;
    q_temp_uvedREESTR_ID: TFloatField;
    q_temp_uvedNOM_ZD: TStringField;
    q_temp_uvedSTAN_NAME: TStringField;
    q_temp_uvedPOLUCH_NAME: TStringField;
    q_temp_uvedNUM_CIST: TStringField;
    q_temp_uvedVAGOWNER_NAME: TStringField;
    q_temp_uvedVES: TFloatField;
    q_temp_uvedDATE_OFORML: TDateTimeField;
    q_temp_uvedPROD_NAME: TStringField;
    q_temp_uvedSVED_NUM: TFloatField;
    q_temp_uvedPOD_NUM: TFloatField;
    q_temp_uvedVETKA_OTP_NAME: TStringField;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edLukoma_num: TEdit;
    edMPS_num: TEdit;
    Label6: TLabel;
    Label5: TLabel;
    edCher_num: TEdit;
    edVetl_num: TEdit;
    q_uved: TOracleDataSet;
    q_uvedID: TFloatField;
    q_uvedUVED_NUM: TFloatField;
    q_uvedUVED_DATE: TDateTimeField;
    q_uvedLOAD_TYPE_ID: TFloatField;
    q_uvedMESTO_ID: TFloatField;
    q_uvedLUKOMA_NUM: TFloatField;
    q_uvedMPS_NUM: TFloatField;
    q_uvedCHER_NUM: TFloatField;
    q_uvedVETL_NUM: TFloatField;
    q_temp_uvedSVED_POS: TFloatField;
    q_temp_uvedSVED_DATE: TDateTimeField;
    q_temp_uvedPASP_NUM: TStringField;
    q_temp_uvedVAG_STATUS: TStringField;
    q_temp_uvedNAKL_NUM: TFloatField;
    q_temp_uvedVES_ALL: TFloatField;
    q_temp_uvedVES_CIST: TFloatField;
    q_temp_uvedVES_UPAK: TFloatField;
    PropStorageEh1: TPropStorageEh;
    PopupVagons: TTBPopupMenu;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem1: TTBItem;
    SaveDialog1: TSaveDialog;
    procedure FormActivate(Sender: TObject);
    procedure acUvedDelExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acUvedSaveExecute(Sender: TObject);
    procedure CheckUvedDate(Sender: TObject);
    procedure btSetNumClick(Sender: TObject);
    procedure acUvedAddExecute(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
  public
    { Public declarations }
    ParentFormName:string;
    ParentFormUved: Tf_Uved;
    ParentFormSved: Tf_Sved;
//Т.к. форма может вызываться из 2х форм и механизм ParentForm не работает, определим собственные переменные и
//новую сессию Oracle
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    EditId:double;
    EditMode:integer; // режим 0-добавление, 1-редактирование, 2-просмотр
  end;

var
  f_UvedNew: Tf_UvedNew;

implementation
uses KlsMisc2, ForSESS, main, ForSystem, MO_NaklAddVagon, ForDB;
{$R *.dfm}

procedure Tf_UvedNew.FormActivate(Sender: TObject);
begin

  ParentFormSved:=Tf_Sved(owner);
  ParentFormUved:=Tf_Uved(owner);

  if ParentFormName='UVED' then
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormUved.ora_Session;
    pkgFOR_UVED.Session:=ParentFormUved.ora_Session;
    q_uved.Session:=ParentFormUved.ora_Session;
    q_temp_uved.Session:=ParentFormUved.ora_Session;
  end
  else
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormSved.ora_Session;
    pkgFOR_UVED.Session:=ParentFormSved.ora_Session;
    q_uved.Session:=ParentFormSved.ora_Session;
    q_temp_uved.Session:=ParentFormSved.ora_Session;
  end;

  // Активация
  if EditMode=0 then
  Begin
    Caption:='Формирование нового уведомления';
    edDate.DateTime:=DateOf(Now);
  end;

  if EditMode=1 then
  Begin
    Caption:='Редактирование уведомления';
    q_uved.Close;
    q_uved.SetVariable('UVED_ID',EditID);
    q_uved.Open;
    edNum.Text:=q_uvedUVED_NUM.AsString;
    edDate.DateTime:=DateOf(q_uvedUVED_DATE.Value);
    edLukoma_num.Text:=q_uvedLukoma_num.AsString;
    edMPS_num.Text:=q_uvedMPS_num.AsString;
    edCher_num.Text:=q_uvedCher_num.AsString;
    edVetl_num.Text:=q_uvedVetl_num.AsString;
  end;

  if EditMode=2 then
  Begin
    Caption:='Просмотр уведомления';
    q_uved.Close;
    q_uved.SetVariable('UVED_ID',EditID);
    q_uved.Open;
    edNum.Text:=q_uvedUVED_NUM.AsString;
    edDate.DateTime:=DateOf(q_uvedUVED_DATE.Value);
    edLukoma_num.Text:=q_uvedLukoma_num.AsString;
    edMPS_num.Text:=q_uvedMPS_num.AsString;
    edCher_num.Text:=q_uvedCher_num.AsString;
    edVetl_num.Text:=q_uvedVetl_num.AsString;
  end;

  // Проверка даты
  CheckUvedDate(Sender);
end;

procedure Tf_UvedNew.acUvedDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      pkgFor_uved.CallProcedure('del_temp_uved',[q_temp_uvedReestr_id.Value]);
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'UvedNew',sesError,E.Message,0,'');
      end;
    end;
    F_DB.ReQuery(q_temp_uved,false);
  end;
end;

procedure Tf_UvedNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_UvedNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[DocType,DocMestoId]);
  except
  End;
  q_temp_uved.Close;
  q_uved.Close;
end;

procedure Tf_UvedNew.acUvedSaveExecute(Sender: TObject);
var
 pUVED_NUM, pLUKOMA_NUM,pMPS_NUM,pCHER_NUM, pVETL_NUM:double;
 pMESTO_ID, pLOAD_TYPE_ID:integer;
 pUVED_DATE:TDateTime;
begin
  // Сохранение номера
  if EditMode=0 then
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[DocType,DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDate.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'UvedNew',sesError,E.Message,0,'');
      if ParentFormName='UVED' then ParentFormUved.ora_Session.Rollback
      else ParentFormSved.ora_Session.Rollback;
      exit;
    end;
  End;

  pUVED_NUM:=F_ForSystem.StrToReal(edNum.text);
  pLUKOMA_NUM:=F_ForSystem.StrToReal(edLukoma_num.text);
  pMPS_NUM:=F_ForSystem.StrToReal(edMPS_num.text);
  pCHER_NUM:=F_ForSystem.StrToReal(edCher_num.text);
  pVETL_NUM:=F_ForSystem.StrToReal(edVetl_num.text);
  pMesto_id:=DocMestoId;
  pLoad_type_id:=DocLoadTypeId;
  pUVED_DATE:=DateOf(edDate.DateTime);
  try
    EditId:=pkgFor_uved.CallFloatFunction('addtitle',[1,EditId,pMESTO_ID,pLOAD_TYPE_ID,pUVED_NUM,pUVED_DATE,pLUKOMA_NUM, pMPS_NUM,pCHER_NUM, pVETL_NUM]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'UvedNew',sesError,E.Message,0,'');
      if ParentFormName='UVED' then ParentFormUved.ora_Session.Rollback
      else ParentFormSved.ora_Session.Rollback;
      exit;
    end;
  end;
  ModalResult:=mrOk;

end;

procedure Tf_UvedNew.CheckUvedDate(Sender: TObject);
begin
  if (EditMode=0) and (CurrentDate<>DateOf(edDate.DateTime)) then
  Begin
    //заполним список вагонов
    q_temp_uved.Close;
    try
      pkgFor_uved.CallProcedure('fill_temp_uved',[EditId,DateOf(edDate.DateTime),DocMestoId,DocLoadTypeId]);
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'UvedNew',sesError,E.Message,0,'');
        exit;
      end;
    end;
    q_temp_uved.Open;

    try
      // Если документ новый и меняется дата,
      // заново получим номер документа (на случай если номер зависит от даты)
      edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[DocType,DocMestoId,'',DateOf(edDate.DateTime)]);
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'UvedNew',sesError,E.Message,0,'');
        edNum.Text:='0';
      end;
    End;
  end;

  CurrentDate:=DateOf(edDate.DateTime);
end;

procedure Tf_UvedNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckUvedDate(Sender);
end;

procedure Tf_UvedNew.acUvedAddExecute(Sender: TObject);
begin
  with Tf_NakladdVagon.Create(self) do
  begin
    ParentFormName:='U';
    q_vag_uved.Session:=q_uved.Session;
    LOAD_TYPE_ID:=DocLoadTypeId;
    MESTO_ID:=DocMestoId;
    DOC_ID:=EditId;
    Caption:='Добавить вагоны в уведомление об уборке';
    ShowModal;
    free;
  end;
  F_DB.ReQuery(q_temp_uved,false);
end;

procedure Tf_UvedNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_UvedNew.TBItem2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridVagons,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,GridVagons,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

procedure Tf_UvedNew.TBItem1Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,gridVagons,q_temp_uved.SQL.Text,q_temp_uved);
end;

end.
