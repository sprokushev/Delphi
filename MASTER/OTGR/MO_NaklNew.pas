unit MO_NaklNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MO_Sved, MO_Nakl, DB, OracleData, Grids, DBGridEh, Oracle, StdCtrls,
  Buttons, ComCtrls, DateUtils, ActnList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, TB2Item, Menus, PropFilerEh, PropStorageEh,DBGridEhImpExp,RxShell;

type
  Tf_NaklNew = class(TForm)
    GridVagons: TDBGridEh;
    q_temp_nakl: TOracleDataSet;
    ds_temp_nakl: TDataSource;
    pkgFor_nakl: TOraclePackage;
    q_temp_naklNAKL_POS: TFloatField;
    q_temp_naklREESTR_ID: TFloatField;
    q_temp_naklNOM_ZD: TStringField;
    q_temp_naklSTAN_NAME: TStringField;
    q_temp_naklPOLUCH_NAME: TStringField;
    q_temp_naklNUM_CIST: TStringField;
    q_temp_naklVAGOWNER_NAME: TStringField;
    q_temp_naklVES: TFloatField;
    q_temp_naklDATE_OFORML: TDateTimeField;
    q_temp_naklPROD_NAME: TStringField;
    q_temp_naklSVED_NUM: TFloatField;
    q_temp_naklPOD_NUM: TFloatField;
    q_temp_naklVETKA_OTP_NAME: TStringField;
    amNakl: TActionManager;
    ActionToolBar1: TActionToolBar;
    acNaklDel: TAction;
    acNaklAdd: TAction;
    acNaklSave: TAction;
    GroupBox1: TGroupBox;
    edNum: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    btSetNum: TSpeedButton;
    edDate: TDateTimePicker;
    acExit: TAction;
    pkgFor_documents: TOraclePackage;
    q_nakl: TOracleDataSet;
    q_naklID: TFloatField;
    q_naklMESTO_ID: TFloatField;
    q_naklLOAD_TYPE_ID: TFloatField;
    q_naklNAKL_NUM: TFloatField;
    q_naklNAKL_DATE: TDateTimeField;
    q_naklPROD_GU12_ID: TStringField;
    q_naklFORMNAKL_ID: TFloatField;
    q_naklSHABNAKL_ID: TFloatField;
    q_naklSHABEXP_ID: TFloatField;
    q_naklK_TAR: TStringField;
    q_naklVES_CIST: TFloatField;
    q_naklVES: TFloatField;
    q_naklUPAK_VES: TFloatField;
    q_naklVES_ALL: TFloatField;
    PopupVagons: TTBPopupMenu;
    TBItem1: TTBItem;
    q_reestr: TOracleDataSet;
    q_reestrID: TFloatField;
    q_reestrSVED_ID: TStringField;
    q_reestrSVED_POS: TIntegerField;
    q_reestrVED_POD_ROW_ID: TFloatField;
    q_reestrNUM_CIST: TStringField;
    q_reestrNCISTDOP: TIntegerField;
    q_reestrAXES: TIntegerField;
    q_reestrCAPACITY: TStringField;
    q_reestrWES1: TStringField;
    q_reestrVES_CIST: TFloatField;
    q_reestrVAGONTYPE_ID: TFloatField;
    q_reestrKALIBR_ID: TStringField;
    q_reestrTIP1: TStringField;
    q_reestrVAGOWNER_ID: TFloatField;
    q_reestrVETKA_POD_ID: TFloatField;
    q_reestrVETKA_OTP_ID: TFloatField;
    q_reestrVETKA_NAPR_ID: TFloatField;
    q_reestrVAG_STATUS_ID: TFloatField;
    q_reestrVZLIV: TFloatField;
    q_reestrTEMPER: TFloatField;
    q_reestrFAKT_PL: TFloatField;
    q_reestrVES: TFloatField;
    q_reestrKOL_NET: TFloatField;
    q_reestrVES_ALL: TFloatField;
    q_reestrVES_ED: TFloatField;
    q_reestrKOL_ED: TIntegerField;
    q_reestrUPAK_ID: TFloatField;
    q_reestrUPAK_VES: TFloatField;
    q_reestrUPAK_VES_ED: TFloatField;
    q_reestrPODDONS: TIntegerField;
    q_reestrPODDON_VES: TFloatField;
    q_reestrSHIELDS: TIntegerField;
    q_reestrSHIELD_VES: TFloatField;
    q_reestrZPU_TYPE1: TFloatField;
    q_reestrZPU_TYPE2: TFloatField;
    q_reestrPLOMBA1: TStringField;
    q_reestrPLOMBA2: TStringField;
    q_reestrROSINSPL1: TStringField;
    q_reestrROSINSPL2: TStringField;
    q_reestrNAR_LINE_ID: TFloatField;
    q_reestrNUM_PROP: TIntegerField;
    q_reestrFIO_DRIVER: TStringField;
    q_reestrNAKL_ID: TFloatField;
    q_reestrFORMNAKL_ID: TFloatField;
    q_reestrNUM_KVIT: TStringField;
    q_reestrDATE_KVIT: TDateTimeField;
    q_reestrTARIF: TFloatField;
    q_reestrTARIF_GUARD: TFloatField;
    q_reestrVOLUME: TFloatField;
    q_reestrBAD_NUM: TIntegerField;
    q_reestrGOST_ID: TIntegerField;
    q_reestrCTLV: TFloatField;
    q_reestrVOLUME15: TIntegerField;
    q_reestrNAKL_POS: TIntegerField;
    q_reestrUVED_ID: TFloatField;
    q_reestrUVED_POS: TIntegerField;
    q_reestrIS_AUTO: TIntegerField;
    q_naklNOM_ZD: TStringField;
    q_naklPROD_ID_NPR: TStringField;
    q_temp_naklSVED_POS: TFloatField;
    q_temp_naklPASP_NUM: TStringField;
    q_temp_naklSVED_DATE: TDateTimeField;
    q_temp_naklVAG_STATUS: TStringField;
    PropStorageEh1: TPropStorageEh;
    q_temp_naklVES_ALL: TFloatField;
    q_temp_naklVES_CIST: TFloatField;
    q_temp_naklVES_UPAK: TFloatField;
    SaveDialog1: TSaveDialog;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem2: TTBItem;
    q_reestrNOM_ZD: TStringField;
    q_reestrPROD_ID_NPR: TStringField;
    q_reestrPASP_NUM: TStringField;
    q_reestrIS_EXP: TFloatField;
    q_naklSHABVOZ_ID: TFloatField;
    q_naklIS_EXP: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure acNaklAddExecute(Sender: TObject);
    procedure acNaklDelExecute(Sender: TObject);
    procedure acNaklSaveExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure CheckNaklDate(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    FormNakl:double;
    NomZd:string;
    ProdIdNpr:string;
    IsExp:boolean;
  public
    { Public declarations }
    ParentFormName:string;
    ParentFormNakl: Tf_Nakl;
    ParentFormSved: Tf_Sved;
    //Т.к. форма может вызываться из 2х форм и механизм ParentForm не работает, определим собственные переменные и
    //новую сессию Oracle
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

    EditId:double;
    ReestrId:double;
    EditMode:integer; // режим 0-добавление, 1-редактирование, 2-просмотр
  end;

var
  f_NaklNew: Tf_NaklNew;

implementation

{$R *.dfm}
uses KlsMisc2, ForSESS, main, ForSystem, MO_NaklAddVagon, ForDB;

procedure Tf_NaklNew.FormActivate(Sender: TObject);
begin
  // Сессия
  ParentFormSved:=Tf_Sved(owner);
  ParentFormNakl:=Tf_Nakl(owner);
  if ParentFormName='NAKL' then
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormNakl.ora_Session;
    pkgFOR_NAKL.Session:=ParentFormNakl.ora_Session;
    q_nakl.Session:=ParentFormNakl.ora_Session;
    q_temp_nakl.Session:=ParentFormNakl.ora_Session;
    q_reestr.Session:=ParentFormNakl.ora_Session;
  end
  else
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormSved.ora_Session;
    pkgFOR_NAKL.Session:=ParentFormSved.ora_Session;
    q_nakl.Session:=ParentFormSved.ora_Session;
    q_temp_nakl.Session:=ParentFormSved.ora_Session;
    q_reestr.Session:=ParentFormSved.ora_Session;
  end;
  CurrentDate:=Now-1;

  q_reestr.Close;
  q_reestr.SetVariable('ID',ReestrID);
  q_reestr.Open;

  if not q_reestr.IsEmpty then
  Begin
    IsExp:=(q_reestrIS_EXP.AsInteger=1);
    FormNakl:=q_reestrFORMNAKL_ID.AsFloat;
    NomZd:=q_reestrNOM_ZD.AsString;
    ProdIdNpr:=q_reestrPROD_ID_NPR.AsString;
  end
  else
  begin
    IsExp:=(q_naklIS_EXP.AsInteger=1);
    FormNakl:=q_naklFORMNAKL_ID.AsFloat;
    NomZd:=q_naklNOM_ZD.AsString;
    ProdIdNpr:=q_naklPROD_ID_NPR.AsString;
  end;

  // Активация
  if EditMode=0 then
  Begin
    Caption:='Формирование новой накладной';
    edDate.DateTime:=DateOf(Now);
  end;

  if EditMode=1 then
  Begin
    Caption:='Редактирование накладной';
    q_nakl.Close;
    q_nakl.SetVariable('NAKL_ID',EditID);
    q_nakl.Open;
    edNum.Text:=q_naklNAKL_NUM.AsString;
    edDate.DateTime:=DateOf(q_naklNAKL_DATE.Value);
  end;

  if EditMode=2 then
  Begin
    Caption:='Просмотр накладной';
    q_nakl.Close;
    q_nakl.SetVariable('NAKL_ID',EditID);
    q_nakl.Open;
    edNum.Text:=q_naklNAKL_NUM.AsString;
    edDate.DateTime:=DateOf(q_naklNAKL_DATE.Value);
  end;

  //заполним список вагонов
  q_temp_nakl.Close;
  try
    pkgFor_nakl.CallProcedure('fill_temp_nakl',[EditId,ReestrId,DocMestoId,DocLoadTypeId]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklNew',sesError,E.Message,0,'');
      exit;
    end;
  end;
  q_temp_nakl.Open;

  // Проверка даты
  CheckNaklDate(Sender);
end;

procedure Tf_NaklNew.acNaklAddExecute(Sender: TObject);
begin
  with Tf_NaklAddVagon.Create(self) do
  begin
    ParentFormName:='N';
    q_vag_nakl.Session:=q_nakl.Session;
    if not q_reestr.IsEmpty then
    Begin
      VAGOWNER_ID:=q_reestrVAGOWNER_ID.AsFloat;
    end
    else
    begin
      VAGOWNER_ID:=0;
      NOM_ZD:=q_naklNOM_ZD.AsString;
      PROD_ID_NPR:=q_naklPROD_ID_NPR.AsString;
    end;
    NOM_ZD:=NomZd;
    PROD_ID_NPR:=ProdIdNpr;
    FORMNAKL_ID:=FormNakl;
    LOAD_TYPE_ID:=DocLoadTypeId;
    MESTO_ID:=DocMestoId;
    DOC_ID:=EditId;
    Caption:='Добавить вагоны в накладную';
    ShowModal;
    free;
  end;
  F_DB.ReQuery(q_temp_nakl,true);
end;

procedure Tf_NaklNew.acNaklDelExecute(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      pkgFor_Nakl.CallProcedure('del_temp_nakl',[q_temp_naklReestr_id.Value]);
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'NaklNew',sesError,E.Message,0,'');
      end;
    end;
    F_DB.ReQuery(q_temp_nakl,false);
  end;
end;

procedure Tf_NaklNew.acNaklSaveExecute(Sender: TObject);
var
 pNAKL_NUM,pFORMNAKL_ID:double;
 pNAKL_DATE:TDateTime;
 pIS_EXP:integer;
begin

  // Сохранение номера
  if EditMode=0 then
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[DocType,DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDate.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklNew',sesError,E.Message,0,'');
      if ParentFormName='NAKL' then ParentFormNakl.ora_Session.Rollback
      else ParentFormSved.ora_Session.Rollback;
      exit;
    end;
  End;

  pNAKL_NUM:=F_ForSystem.StrToReal(edNum.text);
  pNAKL_DATE:=DateOf(edDate.DateTime);
  if IsExp then pIS_EXP:=1 else pIS_EXP:=0;
  try
    EditId:=pkgFor_nakl.CallFloatFunction('addtitle',[1,EditId,DocMestoId, DocLoadTypeId,pNAKL_NUM,pNAKL_DATE,FormNakl,NomZd,ProdIdNpr,0,pIS_EXP,0,0,'','']);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklNew',sesError,E.Message,0,'');
      if ParentFormName='NAKL' then ParentFormNakl.ora_Session.Rollback
      else ParentFormSved.ora_Session.Rollback;
      exit;
    end;
  end;
  ModalResult:=mrOk;
end;

procedure Tf_NaklNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_NaklNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[DocType,DocMestoId]);
  except
  End;
  q_temp_nakl.Close;
  q_reestr.Close;
  q_nakl.Close;
end;

procedure Tf_NaklNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckNaklDate(Sender);
end;


procedure Tf_NaklNew.CheckNaklDate(Sender: TObject);
begin
  if (EditMode=0) and (CurrentDate<>DateOf(edDate.DateTime)) then
  try
    // Если документ новый и меняется дата,
    // заново получим номер документа (на случай если номер зависит от даты)
    edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[DocType,DocMestoId,'',DateOf(edDate.DateTime)])
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklNew',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDate.DateTime);
end;

procedure Tf_NaklNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_NaklNew.TBItem1Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,gridVagons,q_temp_nakl.SQL.Text,q_temp_nakl);
end;

procedure Tf_NaklNew.TBItem2Click(Sender: TObject);
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

end.
