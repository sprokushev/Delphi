unit MO_NaklVozNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SvedIn, MO_Nakl, DB, OracleData, Grids, DBGridEh, Oracle, StdCtrls,
  Buttons, ComCtrls, DateUtils, ActnList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, TB2Item, Menus, PropFilerEh, PropStorageEh,DBGridEhImpExp,RxShell,
  RxLookup, EhLibDOA;

type
  Tf_NaklVozNew = class(TForm)
    GridVagons: TDBGridEh;
    q_temp_nakl: TOracleDataSet;
    ds_temp_nakl: TDataSource;
    pkgFor_nakl_voz: TOraclePackage;
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
    acVagDel: TAction;
    acVagAdd: TAction;
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
    Label3: TLabel;
    lc_FormNakl: TRxDBLookupCombo;
    q_FormNakl: TOracleDataSet;
    ds_FormNakl: TDataSource;
    q_FormNaklID: TIntegerField;
    q_FormNaklFORM_NAME: TStringField;
    q_naklSHABVOZ_ID: TFloatField;
    q_naklIS_EXP: TIntegerField;
    q_reestrID: TFloatField;
    q_reestrSVED_IN_ID: TStringField;
    q_reestrMESTO_ID: TIntegerField;
    q_reestrTEX_PD_ID: TFloatField;
    q_reestrGROTP_ID: TFloatField;
    q_reestrSTAN_OTP_ID: TFloatField;
    q_reestrFORMNAKL_ID: TIntegerField;
    q_reestrNUM_KVIT: TFloatField;
    q_reestrDATE_KVIT: TDateTimeField;
    q_reestrPASP_NUM_KVIT: TStringField;
    q_reestrREZ_NUM_KVIT: TStringField;
    q_reestrPASP_DATE_KVIT: TDateTimeField;
    q_reestrVZLIV_KVIT: TIntegerField;
    q_reestrTEMPER_KVIT: TFloatField;
    q_reestrPL_KVIT: TFloatField;
    q_reestrVES_KVIT: TFloatField;
    q_reestrTARIF: TFloatField;
    q_reestrTARIF_GUARD: TFloatField;
    q_reestrDATE_IN_STAN: TDateTimeField;
    q_reestrDATE_OTGR: TDateTimeField;
    q_reestrNUM_CIST: TStringField;
    q_reestrVAGONTYPE_ID: TIntegerField;
    q_reestrKALIBR_ID: TStringField;
    q_reestrVES_CIST: TFloatField;
    q_reestrVAGOWNER_ID: TIntegerField;
    q_reestrCAPACITY: TStringField;
    q_reestrPLOMBA1: TStringField;
    q_reestrPLOMBA2: TStringField;
    q_reestrVZLIV: TIntegerField;
    q_reestrTEMPER: TFloatField;
    q_reestrFAKT_PL: TFloatField;
    q_reestrVES: TFloatField;
    q_reestrVES_NETTO: TFloatField;
    q_reestrDATE_VOZ: TDateTimeField;
    q_reestrKVIT_VOZ: TStringField;
    q_reestrSUM_VOZ: TFloatField;
    q_reestrSTAN_VOZ_ID: TFloatField;
    q_reestrSVED_POS: TIntegerField;
    q_reestrEMPTY_VOZ: TIntegerField;
    q_reestrVOLUME: TFloatField;
    q_reestrVOLUME15: TFloatField;
    q_reestrCTLV: TFloatField;
    q_reestrGOST_ID: TIntegerField;
    q_reestrZPU_TYPE1: TFloatField;
    q_reestrZPU_TYPE2: TFloatField;
    q_reestrBAD_NUM: TIntegerField;
    q_reestrNAKL_ID: TFloatField;
    q_reestrNAKL_POS: TIntegerField;
    q_reestrPROD_ID_NPR: TStringField;
    Label4: TLabel;
    lc_ShabVoz: TRxDBLookupCombo;
    q_operator: TOracleDataSet;
    lc_operator: TRxDBLookupCombo;
    Label5: TLabel;
    ds_operator: TDataSource;
    q_ShabVoz: TOracleDataSet;
    ds_ShabVoz: TDataSource;
    acPrintNaklVoz: TAction;
    acShabVozAdd: TAction;
    SpeedButton1: TSpeedButton;
    q_naklOPERNALIV_ID: TFloatField;
    q_naklDOG_ID: TFloatField;
    q_naklSTAN_ID: TFloatField;
    SpeedButton2: TSpeedButton;
    acMasterPogrAdd: TAction;
    q_reestrOSTAT: TIntegerField;
    q_reestrUVED_ID: TIntegerField;
    q_reestrUVED_POS: TIntegerField;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure acVagAddExecute(Sender: TObject);
    procedure acVagDelExecute(Sender: TObject);
    procedure acNaklSaveExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure CheckNaklDate(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure acPrintNaklVozExecute(Sender: TObject);
    procedure acShabVozAddExecute(Sender: TObject);
    procedure acMasterPogrAddExecute(Sender: TObject);
    procedure q_temp_naklAfterPost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    ProdIdNpr:string;
    IsSaved:boolean;
  public
    { Public declarations }
    ParentFormName:string;
    ParentFormNakl: Tf_Nakl;
    ParentFormSved: Tf_SvedIn;
    DocMestoId:integer; // Место отгрузки
    DocLoadTypeId:integer; // Тип транспортировки
    DocType:integer; // Тип документа
    DocMode:integer; // 1-Первоначальный ввод, 2-Раскредитовывание

    EditId:double;
    ReestrId:double;
    EditMode:integer; // режим 0-добавление, 1-редактирование, 2-просмотр
  end;

var
  f_NaklVozNew: Tf_NaklVozNew;

implementation

{$R *.dfm}
uses KlsMisc2, ForSESS, main, ForSystem, ForFiles, MO_NaklAddVagon, ForDB, MO_ShabVoz,
  ForTemp;

procedure Tf_NaklVozNew.FormActivate(Sender: TObject);
begin
  // Сессия
  ParentFormSved:=Tf_SvedIn(owner);
  ParentFormNakl:=Tf_Nakl(owner);
  if ParentFormName='NAKL' then
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormNakl.ora_Session;
    pkgFOR_NAKL_VOZ.Session:=ParentFormNakl.ora_Session;
    q_nakl.Session:=ParentFormNakl.ora_Session;
    q_temp_nakl.Session:=ParentFormNakl.ora_Session;
    q_reestr.Session:=ParentFormNakl.ora_Session;
    q_FormNakl.Session:=ParentFormNakl.ora_Session;
    q_operator.Session:=ParentFormNakl.ora_Session;
  end
  else
  Begin
    pkgFOR_DOCUMENTS.Session:=ParentFormSved.ora_Session;
    pkgFOR_NAKL_VOZ.Session:=ParentFormSved.ora_Session;
    q_nakl.Session:=ParentFormSved.ora_Session;
    q_temp_nakl.Session:=ParentFormSved.ora_Session;
    q_reestr.Session:=ParentFormSved.ora_Session;
    q_FormNakl.Session:=ParentFormSved.ora_Session;
    q_operator.Session:=ParentFormSved.ora_Session;
  end;
  CurrentDate:=Now-1;
//Открытие датасетов
  f_db.ReQuery(q_operator,false);
  f_db.ReQuery(q_FormNakl,false);
  f_db.ReQuery(q_ShabVoz,false);

  q_reestr.Close;
  q_reestr.SetVariable('ID',ReestrID);
  f_db.ReQuery(q_reestr,false);

  if not q_reestr.IsEmpty then
  Begin
    ProdIdNpr:=q_reestrPROD_ID_NPR.AsString;
  end;

  lc_operator.KeyValue := F_ForSystem.StrToReal(F_main.GetApplVari('LAST_MASTER_POGR'));
  lc_FormNakl.KeyValue:=6;
  lc_ShabVoz.KeyValue:=1;

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
    f_db.ReQuery(q_nakl,false);

    edNum.Text:=q_naklNAKL_NUM.AsString;
    edDate.DateTime:=DateOf(q_naklNAKL_DATE.Value);

    lc_FormNakl.KeyValue:=q_naklFORMNAKL_ID.AsFloat;
    lc_operator.KeyValue:=q_naklOPERNALIV_ID.AsFloat;
    lc_ShabVoz.KeyValue:=q_naklSHABVOZ_ID.AsFloat;;
    ProdIdNpr:=q_naklPROD_ID_NPR.AsString;
  end;

  if EditMode=2 then
  Begin
    Caption:='Просмотр накладной';
    q_nakl.Close;
    q_nakl.SetVariable('NAKL_ID',EditID);
    f_db.ReQuery(q_nakl,false);

    edNum.Text:=q_naklNAKL_NUM.AsString;
    edDate.DateTime:=DateOf(q_naklNAKL_DATE.Value);

    lc_FormNakl.KeyValue:=q_naklFORMNAKL_ID.AsFloat;
    lc_operator.KeyValue:=q_naklOPERNALIV_ID.AsFloat;
    lc_ShabVoz.KeyValue:=q_naklSHABVOZ_ID.AsFloat;;
    ProdIdNpr:=q_naklPROD_ID_NPR.AsString;
  end;

  //заполним список вагонов
  q_temp_nakl.Close;
  try
    pkgFor_nakl_voz.CallProcedure('fill_temp_nakl',[EditId,ReestrId,DocMestoId,DocLoadTypeId]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklVozNew',sesError,E.Message,0,'');
      exit;
    end;
  end;
  f_db.ReQuery(q_temp_nakl,false);

  // Проверка даты
  CheckNaklDate(Sender);

  f_db.SetUserGrants(amNakl);

  IsSaved:=true;
end;

procedure Tf_NaklVozNew.acVagAddExecute(Sender: TObject);
begin
  with Tf_NaklAddVagon.Create(self) do
  begin
    ParentFormName:='V';
    q_vag_voz.Session:=q_nakl.Session;
    LOAD_TYPE_ID:=DocLoadTypeId;
    MESTO_ID:=DocMestoId;
    FORMNAKL_ID:=lc_FormNakl.KeyValue;
    PROD_ID_NPR:=ProdIdNpr;
    DOC_ID:=EditId;
    Caption:='Добавить вагоны в накладную';
    ShowModal;
    free;
    IsSaved:=false;
  end;
  F_DB.ReQuery(q_temp_nakl,true);
end;

procedure Tf_NaklVozNew.acVagDelExecute(Sender: TObject);
var NextId:double;
begin
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      q_temp_nakl.DisableControls;
      pkgFor_Nakl_voz.CallProcedure('del_temp_nakl',[q_temp_naklReestr_id.Value]);
      q_temp_nakl.Next;
      IsSaved:=false;
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'NaklVozNew',sesError,E.Message,0,'');
      end;
    end;
    NextID:=q_temp_nakl.FieldByName('REESTR_ID').AsFloat;
    f_db.ReQuery(q_temp_nakl,false);
    q_temp_nakl.Locate('REESTR_ID',NextId,[]);
    q_temp_nakl.EnableControls;
  end;
end;

procedure Tf_NaklVozNew.acNaklSaveExecute(Sender: TObject);
var
 pNAKL_NUM,pFORMNAKL_ID:double;
 pNAKL_DATE:TDateTime;
begin
  IsSaved:=false;
  // Проверка
  if VarType(lc_ShabVoz.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не выбран шаблон накладной!','Внимание',MB_OK);
    lc_ShabVoz.SetFocus;
    exit;
  End;
  if VarType(lc_FormNakl.KeyValue)=varNull then
  Begin
    Application.MessageBox('Не выбрана форма накладной!','Внимание',MB_OK);
    lc_FormNakl.SetFocus;
    exit;
  End;

  // Сохранение номера
  if EditMode=0 then
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[DocType,DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDate.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklVozNew',sesError,E.Message,0,'');
      q_nakl.Session.Rollback;
      exit;
    end;
  End;

  pNAKL_NUM:=F_ForSystem.StrToReal(edNum.text);
  pNAKL_DATE:=DateOf(edDate.DateTime);
  try
    EditId:=pkgFor_nakl_voz.CallFloatFunction('addtitle',[1,EditId,DocMestoId, DocLoadTypeId,pNAKL_NUM,pNAKL_DATE,lc_FormNakl.KeyValue,lc_ShabVoz.KeyValue,lc_operator.KeyValue,ProdIdNpr]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'NaklVozNew',sesError,E.Message,0,'');
      q_nakl.Session.Rollback;
      exit;
    end;
  end;
  if VarType(lc_operator.KeyValue)<>varNull then
    F_main.SetApplVari('LAST_MASTER_POGR',F_ForSystem.RealToStr(lc_operator.KeyValue))
  else
    F_main.SetApplVari('LAST_MASTER_POGR','0');
  ModalResult:=mrOk;
  IsSaved:=true;
end;

procedure Tf_NaklVozNew.acExitExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_NaklVozNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not IsSaved then
  if Application.MessageBox('Сохранить изменения в накладной?','Внимание!',MB_YESNO)=IDYES then
  Begin
    acNaklSave.Execute;
  end;

  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[DocType,DocMestoId]);
  except
  End;
  q_temp_nakl.Close;
  q_reestr.Close;
  q_nakl.Close;
end;

procedure Tf_NaklVozNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckNaklDate(Sender);
end;


procedure Tf_NaklVozNew.CheckNaklDate(Sender: TObject);
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
      f_main.ApplSession.WriteToLog(amFull,'NaklVozNew',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  CurrentDate:=DateOf(edDate.DateTime);
end;

procedure Tf_NaklVozNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_NaklVozNew.TBItem1Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,gridVagons,q_temp_nakl.SQL.Text,q_temp_nakl);
end;

procedure Tf_NaklVozNew.TBItem2Click(Sender: TObject);
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

procedure Tf_NaklVozNew.acPrintNaklVozExecute(Sender: TObject);
begin
  acNaklSave.Execute;
  if IsSaved then
  Begin
    // сохранить ID накладной
    TempVari.SetVariNum('NAKL_ID', EditId, 'MASTER', 'MO_GU27');
    TempVari.SetVariNum('NAKL_FORMNAKL_ID', lc_FormNakl.KeyValue, 'MASTER', 'MO_GU27');
    TempVari.SetVariNum('NAKL_SHABVOZ_ID', lc_ShabVoz.KeyValue, 'MASTER', 'MO_GU27');
    if VarType(lc_operator.KeyValue)<>varNull then
      TempVari.SetVariNum('NAKL_OPERNALIV_ID', lc_operator.KeyValue, 'MASTER', 'MO_GU27')
    else
      TempVari.SetVariNum('NAKL_OPERNALIV_ID', 0, 'MASTER', 'MO_GU27');

    if lc_FormNakl.KeyValue=6 then
    Begin
      // Групповая
      // скопировать XLS во временный каталог
      F_FileUtils.CheckReport('MO_GU27e_ora.xls',f_main.TempNetPath+'MO_GU27e_ora.xls');
      // Открыть Excel
      F_FileUtils.OpenWorkbook(f_main.TempNetPath+'MO_GU27e_ora.xls','OpenPrintNakl',EditId,1);
    end
    else
    Begin
      // Одиночная
{      // скопировать XLS во временный каталог
      F_FileUtils.CheckReport('MO_GU27_ora.xls',f_main.TempNetPath+'MO_GU27_ora.xls');
      // Открыть Excel
      F_FileUtils.OpenWorkbook(f_main.TempNetPath+'MO_GU27_ora.xls','OpenPrintNakl',EditId,1);}
    End;

  end;
end;

procedure Tf_NaklVozNew.acShabVozAddExecute(Sender: TObject);
begin
  // Добавление шаблона
  with tf_ShabVozNew.create(self) do
  Begin
    if ShowModal=mrOk then
    Begin
    end;
    Free;
  end;

end;

procedure Tf_NaklVozNew.acMasterPogrAddExecute(Sender: TObject);
begin
  KlsMisc2.SetKLSParam('KLS_MASTER_POGR','EDIT',fsNormal,'','',false,0,0,'');
  with TF_KlsMisc.Create(Self) do
  begin
    ShowModal;
    Free;
  end;
  f_db.ReQuery(q_operator,false);
end;

procedure Tf_NaklVozNew.q_temp_naklAfterPost(DataSet: TDataSet);
begin
  IsSaved:=false;
end;

procedure Tf_NaklVozNew.Button1Click(Sender: TObject);
begin
  if q_temp_nakl.Active and (q_temp_nakl.State<>dsBrowse) then q_temp_nakl.Post;
  f_db.ReQuery(q_temp_nakl,true);
end;

end.
