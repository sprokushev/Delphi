unit SutRee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, ADODB, Grids, DBGridEh, ExtCtrls,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Item, Menus, TB2Dock, TB2Toolbar,
  TB2ExtItems, Oracle, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, DateUtils,
  ComCtrls, comObj,OleCtrls,excel2000;

type
  Tf_SutRee = class(TForm)
    q_reports: TOracleDataSet;
    ADOConn: TADOConnection;
    ds_SutRee: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    gridBrowse: TDBGridEh;
    ActionManager1: TActionManager;
    acSutReeLoadXLSUhta: TAction;
    acSutReeNewXLSMoscow: TAction;
    acSutReeToXLS: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem5: TTBItem;
    TBItem3: TTBItem;
    pm_gridBrowse: TTBPopupMenu;
    TBItem6: TTBItem;
    e_FieldFilter: TTBEditItem;
    TBItem1: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem10: TTBItem;
    TBItem2: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    q_tmp: TOracleQuery;
    Label2: TLabel;
    ORAConn: TOracleSession;
    q_SutRee: TOracleDataSet;
    acSutReeNewXLSUhta: TAction;
    Panel3: TPanel;
    sbSutReeRefresh: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    edNumRee: TCurrencyEdit;
    edDateRee: TDateTimePicker;
    Label4: TLabel;
    edDateTo: TDateTimePicker;
    edTimeTo: TDateTimePicker;
    Label5: TLabel;
    edDatePlan: TDateTimePicker;
    edGRAFIK_FROM: TDateTimePicker;
    Label26: TLabel;
    edGRAFIK_TO: TDateTimePicker;
    Label6: TLabel;
    lbStatus: TLabel;
    acSutReeLoadDBF: TAction;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    acSutReeSendDBF: TAction;
    TBItem4: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    Label7: TLabel;
    edDopRee: TCurrencyEdit;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    lbUhtaXLS: TLabel;
    lbMoscowDBF: TLabel;
    q_cmn: TOracleDataSet;
    cbUseGrafik: TCheckBox;
    pkgFOR_REESTR: TOraclePackage;
    OpenDlg: TOpenDialog;
    q_SutReeNOM_ZD: TStringField;
    q_SutReeDATE_RAZN: TStringField;
    q_SutReeTONN_DISTR: TFloatField;
    q_SutReeN_DOG: TStringField;
    q_SutReePLAT_NAME: TStringField;
    q_SutReeK_NPR_LOC: TStringField;
    q_SutReeKOD_NPR_R3: TStringField;
    q_SutReeKOD_NPR_KC: TStringField;
    q_SutReeNAME_NPR: TStringField;
    q_SutReeKOD_POTREB: TStringField;
    q_SutReeINN_POTREB: TStringField;
    q_SutReeNAME_POTR: TStringField;
    q_SutReeKOD_POT_R3: TStringField;
    q_SutReeKOD_POT_KC: TStringField;
    q_SutReeKOD_POLUCH: TStringField;
    q_SutReeKOD_POL_R3: TStringField;
    q_SutReeKOD_POL_KC: TStringField;
    q_SutReeINN_POLUCH: TStringField;
    q_SutReeNAME_POLU: TStringField;
    q_SutReeGDKOD_POLU: TStringField;
    q_SutReeNAME_STAN: TStringField;
    q_SutReePRIORITY: TFloatField;
    q_SutReeTONN_REE: TFloatField;
    q_Priority: TOracleDataSet;
    q_SutReePRIORITY_NAME: TStringField;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    FileCheck: TTimer;
    q_cmn2: TADOQuery;
    q_SutReeTONN_MOS: TFloatField;
    q_cmn1: TADOQuery;
    q_SutReeDEPT: TStringField;
    q_SutReeDATE_ISP: TStringField;
    q_SutReeTONN_REQ: TFloatField;
    q_SutReeTONN_REST: TFloatField;
    q_SutReePRICE: TFloatField;
    q_SutReeN_DOG2: TStringField;
    q_SutReeNAIM_PLAT: TStringField;
    q_SutReeKOD_PL_KC: TStringField;
    q_SutReeNAME_OBL: TStringField;
    q_SutReeKOD_GAI: TStringField;
    q_SutReeOS_OTM: TStringField;
    q_SutReeGDKOD_ST: TStringField;
    q_SutReeTONN_FACT: TFloatField;
    q_SutReeAVAILABLE: TFloatField;
    ora_Package: TOraclePackage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridBrowseColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure gridBrowseSortMarkingChanged(Sender: TObject);
    procedure acSutReeToXLSExecute(Sender: TObject);
    procedure e_FieldFilterAcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem1Click(Sender: TObject);
    procedure q_reportsAfterOpen(DataSet: TDataSet);
    procedure gridBrowseGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure q_SutReeFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edDateReeChange(Sender: TObject);
    procedure acSutReeNewXLSUhtaExecute(Sender: TObject);
    procedure cbUseGrafikClick(Sender: TObject);
    procedure acSutReeLoadXLSUhtaExecute(Sender: TObject);
    procedure q_SutReeBeforeOpen(DataSet: TDataSet);
    procedure sbSutReeRefreshClick(Sender: TObject);
    procedure TBItem14Click(Sender: TObject);
    procedure TBItem15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridBrowseExit(Sender: TObject);
    procedure FileCheckTimer(Sender: TObject);
    procedure acSutReeSendDBFExecute(Sender: TObject);
    procedure acSutReeLoadDBFExecute(Sender: TObject);
    procedure acSutReeNewXLSMoscowExecute(Sender: TObject);
  private
    { Private declarations }
    vStatus:integer;
    filterBrowse:TStringList;
    procedure SetStatus(pStatus:integer;pSave:boolean);
  public
    { Public declarations }
    ReestrID:integer;
    ReportId:integer;

    RepFileName:string;
    EmailDbf:String;
    EmailXls:String;
    Archive:String;
    DbfForDbf:string;
    DbfForXls:string;
    TempDBF:string;
    SendDBF:boolean;
    SendXLS:boolean;
    SendDbfName:string;
    SendXlsName:string;
    ReportFile:string;
  end;

var
  f_SutRee: Tf_SutRee;

implementation

uses ForTemp, StrUtils, ForSystem,DBGridEhImpExp,RxShell, ForFiles,
  ForDB, RepDbfItogs, RepDbfGrp, main, ForEnv;

{$R *.dfm}

procedure Tf_SutRee.SetStatus(pStatus:integer;pSave:boolean);
Begin
  edDateRee.Enabled:=false;
  edDopRee.Enabled:=false;
  edDatePlan.Enabled:=false;
  edTimeTo.Enabled:=false;
  edDateTo.Enabled:=false;
  cbUseGrafik.Enabled:=false;
  edGRAFIK_FROM.Enabled:=false;
  edGRAFIK_TO.Enabled:=false;
  edNumRee.Enabled:=false;
  acSutReeNewXLSUhta.Enabled:=false;
  acSutReeLoadXLSUhta.Enabled:=false;
  acSutReeSendDBF.Enabled:=false;
  acSutReeLoadDBF.Enabled:=false;
  acSutReeNewXLSMoscow.Enabled:=false;
  gridBrowse.ReadOnly:=true;
  if vStatus<pStatus then vStatus:=pStatus;

  case vStatus of
    0:Begin
        edDateRee.Enabled:=true;
        edDatePlan.Enabled:=true;
        edTimeTo.Enabled:=true;
        edDateTo.Enabled:=true;
        cbUseGrafik.Enabled:=true;
        cbUseGrafikClick(Self);
        acSutReeNewXLSUhta.Enabled:=true;
        lbStatus.Caption:='Не сформирован';
      end;
    1:Begin
        edTimeTo.Enabled:=true;
        edDateTo.Enabled:=true;
        cbUseGrafik.Enabled:=true;
        cbUseGrafikClick(Self);
        acSutReeNewXLSUhta.Enabled:=true;
        acSutReeLoadXLSUhta.Enabled:=true;
        lbStatus.Caption:='Сформирован';
      end;
    2:Begin
        acSutReeNewXLSUhta.Enabled:=true;
        acSutReeLoadXLSUhta.Enabled:=true;
        acSutReeSendDBF.Enabled:=true;
        acSutReeNewXLSMoscow.Enabled:=true;
        gridBrowse.ReadOnly:=false;
        lbStatus.Caption:='Обработан Ухтинский реестр';
      end;
    3:Begin
        acSutReeSendDBF.Enabled:=true;
        acSutReeLoadDBF.Enabled:=true;
        acSutReeNewXLSMoscow.Enabled:=true;
        lbStatus.Caption:='Отправлен на согласование';
        FileCheckTimer(Self);
      end;
    4:Begin
        acSutReeSendDBF.Enabled:=true;
        acSutReeLoadDBF.Enabled:=true;
        acSutReeNewXLSMoscow.Enabled:=true;
        lbStatus.Caption:='Согласован';
        FileCheckTimer(Self);
      end;
  end;
  if pSave then
    // Обновляем статус
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE MONTH_REESTR SET STATUS='+IntToStr(vStatus)+' WHERE ID='+IntToStr(ReestrID));
      Execute;
    end;
End;


procedure Tf_SutRee.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  q_reports.Close;
  q_SutRee.Close;
  q_tmp.close;
  q_cmn.Close;
  q_cmn.DeleteVariables;
  q_cmn.SQL.Clear;
  ADOConn.Close;
  ORAConn.LogOff;

  try
    filterBrowse.Clear;
  except
  end;
  Action:=caFree;
end;

procedure Tf_SutRee.FormShow(Sender: TObject);
var CreateSQL,InsertSQLHeader,InsertSQL:string;
    fsize,i,j: integer;
    s:string;
    Zpt:string;
    ColName:string;
    ColWidth:integer;
    MaxNum:integer;
    DT:TDatetime;
begin
  inherited;
//  f_db.SetUserGrants(ActionManager1);
  Screen.Cursor := crHourGlass;

  f_db.LogonMasterSession(ORAConn);

  q_reports.SQL[1]:='WHERE id='+IntToStr(ReportId);
  q_reports.Open;

  If ReestrID=0 then
  Begin
    // Новый
    // Параметры отчета
    edDateRee.Date:=DateOf(TempVari.GetAsDate('DATE_REE',APPLICATION_NAME,RepFileName));
    edDateReeChange(Sender);
    edDateRee.Enabled:=true;
    edDateTo.Date:=DateOf(TempVari.GetAsDate('END_DATE',APPLICATION_NAME,RepFileName));
    edDateTo.Enabled:=true;
    s:=TempVari.GetAsChar('END_TIME',APPLICATION_NAME,RepFileName);
    if s='' then s:='00:00:00';
    edTimeTo.Time:=StrToTime(s);
    edTimeTo.Enabled:=true;
    cbUseGrafik.Checked:=true;
    cbUseGrafikClick(Sender);
    edGRAFIK_FROM.Date:=DateOf(TempVari.GetAsDate('GRAFIK_FROM',APPLICATION_NAME,RepFileName));
    edGRAFIK_TO.Date:=DateOf(TempVari.GetAsDate('GRAFIK_TO',APPLICATION_NAME,RepFileName));
    with q_cmn do
    Begin
      Close;
      DeleteVariables;
      SQL.Clear;
      SQL.Add('SELECT NVL(MAX(NUM_REE),0) as NUM_REE FROM MONTH_REESTR');
      Open;
      IF not eof then
        MaxNum:=FieldByName('NUM_REE').AsInteger
      else
        MaxNum:=0;
    end;
    edNumRee.Value:=MaxNum+1;
    SetStatus(0,false);
  end
  else
  Begin
    // Редактировать
    with q_cmn do
    Begin
      Close;
      DeleteVariables;
      SQL.Clear;
      SQL.Add('SELECT a.*,kls_status.name as status_name FROM '+SCHEMA_NAME+'.MONTH_REESTR a,kls_status_month_reestr kls_status WHERE a.status=kls_status.id AND a.ID='+IntToStr(ReestrID));
      Open;
      edDopRee.value:=FieldByName('DOP_REE').AsInteger;
      DT:=FieldByName('DATE_TO').AsDatetime;
      edDateTo.Date:=DateOf(DT);
      edTimeTo.Time:=TimeOf(DT);
      edGRAFIK_FROM.Date:=DateOf(FieldByName('GRAFIK_DATE_FROM').AsDatetime);
      edGRAFIK_TO.Date:=DateOf(FieldByName('GRAFIK_DATE_TO').AsDatetime);
      cbUseGrafik.Checked:=FieldByName('USE_GRAFIK').AsInteger=1;
      cbUseGrafikClick(Sender);
{      cbUseGrafik.Enabled:=false;
      edGRAFIK_FROM.Enabled:=false;
      edGRAFIK_TO.Enabled:=false;}
      edNumRee.value:=FieldByName('NUM_REE').AsInteger;
      vStatus:=FieldByName('STATUS').AsInteger;
      lbStatus.Caption:=FieldByName('STATUS_NAME').AsString;
      lbUhtaXLS.Caption:=FieldByName('UHTA_XLS_NAME').AsString;
      lbMoscowDBF.Caption:=FieldByName('MOS_DBF_NAME').AsString;

      edDateRee.Date:=DateOf(FieldByName('DATE_REE').AsDatetime);
      edDateReeChange(Sender);
      SetStatus(vStatus,false);
    end;
  End;

  f_db.ReQuery(q_SutRee,true);
  for i:=1 to q_SutRee.FieldCount do
  Begin
    FilterBrowse.Add('');
  end;
  Screen.Cursor := crDefault;

end;

procedure Tf_SutRee.gridBrowseColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  Params.Text:=IntToStr(q_SutRee.RecNo);
end;

procedure Tf_SutRee.gridBrowseSortMarkingChanged(Sender: TObject);
begin
  inherited;
  f_db.SortInGrid(q_SutRee,q_SutRee.SQL.Count-1,gridBrowse);
end;

procedure Tf_SutRee.acSutReeToXLSExecute(Sender: TObject);
begin
  inherited;
{  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridBrowse,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridBrowse,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end}
end;

procedure Tf_SutRee.e_FieldFilterAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridBrowse,filterBrowse,NewText,Accept);
end;

procedure Tf_SutRee.TBItem1Click(Sender: TObject);
begin
  f_db.FilterCLear(gridBrowse,filterBrowse);
end;

procedure Tf_SutRee.q_reportsAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  RepFileName:=AnsiUpperCase(Trim(q_reports.FieldByName('REPORT_FILE').AsString));
  DbfForDbf:=q_reports.FieldByName('DBF_FOR_DBF').AsString;
  DbfForXls:=q_reports.FieldByName('DBF_FOR_XLS').AsString;
  ReportFile:=q_reports.FieldByName('REPORT_FILE').AsString;
  Archive:=F_FileUtils.FillFilePath(q_reports.FieldByName('ARCHIVE').AsString,True);
  SendDBF:=(q_reports.FieldByName('SEND_DBF').AsInteger=1);
  SendXLS:=(q_reports.FieldByName('SEND_XLS').AsInteger=1);
  EmailDbf:=q_reports.FieldByName('EMAIL_DBF').AsString;
  EmailXls:=q_reports.FieldByName('EMAIL_XLS').AsString;
  SendDbfName:=ExtractFileName(AnsiUpperCase(Trim(q_reports.FieldByName('SEND_DBF_NAME').AsString)));
  i:=Pos('.',SendDbfName);
  if i>0 then SendDbfName:=System.Copy(SendDbfName,1,i-1); // Удаляем расширение
  SendXlsName:=ExtractFileName(AnsiUpperCase(Trim(q_reports.FieldByName('SEND_XLS_NAME').AsString)));
  i:=Pos('.',SendXlsName);
  if i>0 then SendXlsName:=System.Copy(SendXlsName,1,i-1); // Удаляем расширение
end;

procedure Tf_SutRee.gridBrowseGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

  if q_SutRee.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;

  if Column.Field<>nil then
  if Column.Field.DataType in [ftDate,ftTime,ftDateTime] then
  if Column.Field.AsDateTime=0 then
  Begin
    AFont.Color:=Background
  end;

end;

procedure Tf_SutRee.q_SutReeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridBrowse,filterBrowse);
end;

procedure Tf_SutRee.edDateReeChange(Sender: TObject);
var MaxNum:integer;
begin
  If ReestrID=0 then
  Begin
    with q_cmn do
    Begin
      Close;
      DeleteVariables;
      SQL.Clear;
      SQL.Add('SELECT NVL(MAX(DOP_REE),-1) as DOP_REE FROM MONTH_REESTR WHERE DATE_REE=:DATE_REE');
      DeclareVariable('DATE_REE',otDate);
      SetVariable('DATE_REE',DateOf(edDateRee.Date));
      Open;
      IF not eof then
        MaxNum:=FieldByName('DOP_REE').AsInteger
      else
        MaxNum:=-1;
    end;
    edDopRee.Value:=MaxNum+1;
  end;
  edDatePlan.Date:=StartOfTheMonth(edDateRee.Date);
end;

procedure Tf_SutRee.acSutReeNewXLSUhtaExecute(Sender: TObject);
var i:integer;
    DT:TDateTime;
begin
  if cbUseGrafik.Checked then i:=1 else i:=0;
  DT:=DateOf(edDateTo.Date)+TimeOf(edTimeTo.Time);

  TempVari.SetVariNum('USE_GRAFIK',i,APPLICATION_NAME,ReportFile);
  TempVari.SetVariChar('DATE_REE',FormatDateTime('dd.mm.yyyy',DateOf(edDateRee.Date)),APPLICATION_NAME,RepFileName);
  TempVari.SetVariChar('DATE_PLAN',FormatDateTime('dd.mm.yyyy',DateOf(edDatePlan.Date)),APPLICATION_NAME,RepFileName);
  TempVari.SetVariChar('GRAFIK_FROM',FormatDateTime('dd.mm.yyyy',DateOf(edGRAFIK_FROM.Date)),APPLICATION_NAME,RepFileName);
  TempVari.SetVariChar('GRAFIK_TO',FormatDateTime('dd.mm.yyyy',DateOf(edGRAFIK_TO.Date)),APPLICATION_NAME,RepFileName);
  TempVari.SetVariDate('END_DATE',DateOf(edDateTo.Date),APPLICATION_NAME,RepFileName);  // По дату
  TempVari.SetVariChar('END_TIME',FormatDateTime('hh:nn',edTimeTo.Time),APPLICATION_NAME,RepFileName);  // По дату

  // Перенос параметров в специальную таблицу MASTER_REPORTS
  ora_package.PackageName:='FOR_TEMP';
  ora_package.CallProcedure('SET_REPORT_PARAM_VALUE',['pREP_ID',ReportId]);

  try
    SetStatus(1,true);
    ReestrID:=pkgFOR_REESTR.CallFloatFunction('AddReestr',[ReestrID,edNumRee.Value,DateOf(edDateRee.Date),
              DT,DateOf(edDatePlan.Date),i,
              DateOf(edGRAFIK_FROM.Date),DateOf(edGRAFIK_TO.Date),vStatus,edDopRee.Value]);
    oraConn.Commit;
    F_FileUtils.SafeCopyFile(f_main.MasterXLSPath+RepFileName,f_main.TempNetPath+RepFileName);
    F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
  except
    on E:Exception do
    Begin
      ShowMessage(E.Message);
      SetStatus(1,true);
    end;
  end;

  f_db.ReQuery(q_SutRee,true);
end;

procedure Tf_SutRee.cbUseGrafikClick(Sender: TObject);
begin
  edGRAFIK_FROM.Enabled:=cbUseGrafik.Checked;
  edGRAFIK_TO.Enabled:=cbUseGrafik.Checked;
end;

procedure Tf_SutRee.acSutReeLoadXLSUhtaExecute(Sender: TObject);
var
  excel:  Variant;  //сервер excelя
  sheet:  Variant;  //лист, с которого читаем
  BoxDir: string;
  s:string;
  i:integer;
  filename:string;
  FNamePos:integer;
  colNom_zd:integer;
  colMos_zd:integer;
  colDop_zd:integer;
  colVal_zd:integer;
  colPrizn:integer;
  colPLAN_MON:integer;
  colFact_otgr:integer;
  colKind_npr:integer;
  Kod_npr:string;
  EmptyCount:integer;
  WasDog:boolean;
  Days:integer;
  f1,f2,OtklValue:extended;
  s1,s2,val_zad:string;
  FileDateRee:TDateTime;
begin
  try
    BoxDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('UHTA_REESTR_DIR'),false));
    OpenDlg.InitialDir:=BoxDir;
    OpenDlg.Filter:='Файлы Excel|*.XLS';
    OpenDlg.Filename:='';
    if OpenDlg.Execute then
    Begin
      F_main.SetApplVari('UHTA_REESTR_DIR',ExtractFilePath(OpenDlg.FileName));
      filename := AnsiUpperCase(OpenDlg.FileName);

      FNamePos := Pos('U_',ExtractFilename(Filename));
      If FNamePos <>1 Then
      Begin
        ShowMessage('Имя файла не корректно!');
        exit;
      end;

      //присоединяемся к Excelю
      excel := CreateOleObject('Excel.Application');
      excel.workBooks.open(fileName);
      sheet := excel.WorkBooks[excel.workbooks.count].WorkSheets[1];

      // Проверка даты
      s:=VarToStr(sheet.Cells[8, 11]);
      FileDateRee:=StrToDate(s);
      If Copy(ExtractFilename(Filename), FNamePos + 2, 8) <> FormatDateTime('yyyymmdd',FileDateRee) Then
      if MessageDlg('Дата реестра и имя файла различны. Продолжить обработку?',
           mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Begin
        try
          excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
          if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
            excel.quit;
        except
        end;
        exit;
      end;

      If DateOf(edDateRee.Date) <> DateOf(FileDateRee) Then
      Begin
        ShowMessage('Дата в файле не соответствует дате реестра!');
       try
          excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
          if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
            excel.quit;
        except
        end;
        exit;
      end;

      // Очистить таблицу MONTH_REESTR_POS
      with q_tmp do
      Begin
        Close;
        DeleteVariables;
        SQL.Clear;
        SQL.Add('DELETE FROM MONTH_REESTR_POS WHERE MONTH_REESTR_ID='+IntToStr(ReestrID));
        Execute;
      end;

      // Очистить таблицу UHTA_REE.DBF
      with q_cmn2 do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM ''U:\LUK\REESTR\PREPARE\UHTA_REE.DBF'' WHERE DATE_REE='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateOf(edDateRee.Date))+' AND DOP_REE='+FloatToStr(edDopRee.Value));
        ExecSQL;
      end;

      // Подготовка к чтению
      colNom_zd := 0;
      colMos_zd := 0;
      colDop_zd := 0;
      colVal_zd := 0;
      colPrizn := 0;
      colPLAN_MON := 0;
      colFact_otgr := 0;
      colKind_npr := 0;
      Kod_npr := '';
      // Заполнение переменных, обозначающих столбцы с данными
      For i := 1 To 60 do
      Begin
        S:=VarToStr(sheet.Cells[13, i]);
        if s = 'nom_zd' then colNom_zd := i;
        if s = 'mos_zd' then colMos_zd := i;
        if s = 'dop_zd' then colDop_zd := i;
        if s = 'val_zd' then colVal_zd := i;
        if s = 'prizn' then colPrizn := i;
        if s = 'plan_mon' then colPLAN_MON := i;
        if s = 'fact_otgr' then colFact_otgr := i;
        if s = 'kind_npr' then colKind_npr := i;
      end;
      If (colNom_zd = 0) Or (colVal_zd = 0) Or (colPrizn = 0) Or (colPLAN_MON = 0) Or (colfact_otgr = 0) Or (colKind_npr = 0) Then
        ShowMessage('Не найден один или несколько столбцов с данными, обратитесь к программисту!');


      // Перебор записей и заполнение MONTH_REESTR_POS
      i := 13;
      EmptyCount := 0;
      WasDog := False;
      Days := DayOf(EndOfTheMonth(edDateRee.Date))-DayOf(DateOf(edDateRee.Date))+1;
      DecimalSeparator:='.';
      While EmptyCount < 30 do
      Begin
        s:=VarToStr(sheet.Cells[i, colPrizn]);

        if s = 'D' Then
        Begin
          WasDog := True;
          s1:=VarToStr(sheet.Cells[i, colFact_otgr]);
          s2:=VarToStr(sheet.Cells[i, colPLAN_MON]);
          f1:=StrToFloat(s1);
          f2:=StrToFloat(s2);
          OtklValue := f1-f2 ;
        End;
        If s = 'P' Then kod_npr := VarToStr(sheet.Cells[i, colkind_npr]);

    {     If (xlApp.Cells(i, 1) = "Оптовые поставки") And (Not cb_DopRee.Value) Then
          'MsgBox "Оптовые поставки " & kod_npr
          OtklOpt = xlApp.Cells(i, fact_otgr).Value - xlApp.Cells(i, PLAN_MON).Value
          qdf2.Parameters(0) = xlApp.Cells(8, 11)
          qdf2.Parameters(1) = kod_npr
          If OtklOpt < 0 Then
            qdf2.Parameters(2) = -OtklOpt / Days
          Else
            qdf2.Parameters(2) = 0
          End If
          qdf2.Execute
          qdf2.Close
        End If }
        s:=Trim(VarToStr(sheet.Cells[i, colNom_zd]));
        If copy(s, 5, 1) = '-' Then
        Begin
          lbStatus.Caption := 'Обработка задания ' + s;
          val_zad := VarToStr(sheet.Cells[i, colVal_zd]);
          with q_tmp do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO MONTH_REESTR_POS (MONTH_REESTR_ID,NOM_ZD,TONN_REE,PRIORITY) '+
                    ' VALUES ('+IntToStr(ReestrID)+','''+s+''','+val_zad+',0)');
            Execute;
          end;

          // Заполнение UHTA_REE.DBF
          with q_cmn2 do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO ''U:\LUK\REESTR\PREPARE\UHTA_REE.DBF'' (DATE_REE,DOP_REE,NOM_ZD,VAL_ZD,SUT_ZD,FILENAME) '+
                    ' VALUES ('+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateOf(edDateRee.Date))+
                                ','+FloatToStr(edDopRee.Value)+
                                ','''+s+''''+
                                ','+val_zad+
                                ',0,'''+ExtractFileName(Filename)+''')');
            ExecSQL;
          end;

{          If WasDog Then
            ' Задание в цистернах только по договору
            WasDog = False
            If (OtklValue < 0) And (Not cb_DopRee.Value) Then
              qdf.SQL = qdf.SQL & Str(-OtklValue / Days) & ",'')"
              'qdf.Parameters(4) = -OtklValue / Days
            Else
              qdf.SQL = qdf.SQL & "0,'')"
              'qdf.Parameters(4) = 0
            End If
          Else
            qdf.SQL = qdf.SQL & "0,'')"
          End If}
          EmptyCount := 0;
        end
        Else EmptyCount := EmptyCount + 1;
        i := i + 1;
      end; {while }

      try
        excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
        if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
          excel.quit;
      except
      end;

      SetStatus(2,true);
      lbUhtaXLS.Caption:=ExtractFileName(filename);

      // Обновляем имя файла
      with q_tmp do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE MONTH_REESTR SET UHTA_XLS_NAME='''+ExtractFileName(filename)+''' WHERE ID='+IntToStr(ReestrID));
        Execute;
      end;

      oraConn.Commit;
    end;
  except
    on E:Exception do
       ShowMessage(E.Message);
  end;
  f_db.ReQuery(q_SutRee,true);
end;

procedure Tf_SutRee.q_SutReeBeforeOpen(DataSet: TDataSet);
begin
  q_SutRee.SetVariable('REESTR_ID',ReestrId);
end;

procedure Tf_SutRee.sbSutReeRefreshClick(Sender: TObject);
begin
  f_db.ReQuery(q_SutRee,true);
end;

procedure Tf_SutRee.TBItem14Click(Sender: TObject);
begin
  f_db.FilterCurrentValue(gridBrowse,filterBrowse);
end;

procedure Tf_SutRee.TBItem15Click(Sender: TObject);
begin
  f_db.EditInMemo(gridBrowse);
end;

procedure Tf_SutRee.FormCreate(Sender: TObject);
begin
  FilterBrowse:=TStringList.Create;
  FilterBrowse.Clear;
end;

procedure Tf_SutRee.gridBrowseExit(Sender: TObject);
begin
  if q_SutRee.State=dsEdit then q_SutRee.Post;
end;

procedure Tf_SutRee.FileCheckTimer(Sender: TObject);
var BoxOutDir,BoxInDir:string;
begin
  BoxOutDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('MOSCOW_REESTR_BOX_OUT'),false));
  BoxInDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('MOSCOW_REESTR_BOX_IN'),false));
  if vStatus>=3 then
  Begin
    if FileExists(BoxOutDir+lbMoscowDBF.Caption) then
      lbStatus.Caption:='Отправляется на согласование! Ждите ...'
    else
      if FileExists(BoxInDir+lbMoscowDBF.Caption) then
        lbStatus.Caption:='Поступил с согласования. Необходимо загрузить!'
      else
      Begin
        if vStatus=3 then lbStatus.Caption:='Отправлен на согласование';
        if vStatus=4 then lbStatus.Caption:='Согласован';
      end;
  end;
end;

procedure Tf_SutRee.acSutReeSendDBFExecute(Sender: TObject);
var FName,DBF:string;
    SendOk:boolean;
    SendName,EmailDir,s:string;
    i:integer;
    ZipName,FromName,ToName:string;
begin
  inherited;
  f_db.ReQuery(q_reports,true);

  EmailDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('MOSCOW_REESTR_BOX_OUT'),false));
  EMailDir:=F_FileUtils.FillFilePath(EmailDir+'\',True);
  F_FileUtils.FillFilePath(EmailDir+'\SENT\',True);

  // Скопировать файл-шаблон
  DBF:=f_main.TempLocalPath+ExtractFileName(DbfForDbf);
  F_FileUtils.SafeCopyFile(DbfForDbf,DBF);

  // Очистить файл-шаблон
  try
    q_cmn2.Close;
    q_cmn2.SQL.Clear;
    q_cmn2.SQL.Add('DELETE FROM '''+DBF+'''');
    q_cmn2.ExecSQL;
  except
  end;

  s:=SendDbfName;
  s:=AnsiReplaceStr(s,'%END_DATE_DD%',FormatDateTime('DD',edDateTo.Date));
  s:=AnsiReplaceStr(s,'%END_DATE_MM%',FormatDateTime('MM',edDateTo.Date));
  s:=AnsiReplaceStr(s,'%END_DATE_YY%',FormatDateTime('YY',edDateTo.Date));
  s:=AnsiReplaceStr(s,'%END_DATE_YYYY%',FormatDateTime('YYYY',edDateTo.Date));
  s:=AnsiReplaceStr(s,'%DATE_REE_DD%',FormatDateTime('DD',edDateRee.Date));
  s:=AnsiReplaceStr(s,'%DATE_REE_MM%',FormatDateTime('MM',edDateRee.Date));
  s:=AnsiReplaceStr(s,'%DATE_REE_YY%',FormatDateTime('YY',edDateRee.Date));
  s:=AnsiReplaceStr(s,'%DATE_REE_YYYY%',FormatDateTime('YYYY',edDateRee.Date));
  if s<>'' then
  Begin
//    s:=InputBox('Отправить файл','Имя файла:',s);
    ZipName:=s+'.ZIP';
    s:=s+'.DBF';
  end;
  SendName:=s;

  SendOk:=false;
  if SendName<>'' then
  if (MessageDlg('Отправить файл ' + SendName + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  Begin
    // Заполняем временную таблицу содержимым (кодировка DOS)
    F_DB.FillADOTable(ADOConn,q_SutRee,DBF,true,0);
    SendOk:=true;
    if q_reports.FieldByName('ZIP_DBF').AsInteger=1 then // Если надо упаковать
    Begin
      // Копируем
      if not F_FileUtils.SafeCopyFile(DBF,ExtractFilePath(DBF)+SendName) then
      Begin
        ShowMessage('Ошибка отправки файла '+SendName);
        SendOk:=false;
      End
      else
      Begin
        // Упакуем файл
        F_FileUtils.ExecAndWait('U:\MASTER\pkzipc.exe','-add '+ExtractFilePath(DBF)+ZipName+' '+ExtractFilePath(DBF)+SendName,SW_SHOWMINIMIZED,true);
        FromName:=ExtractFilePath(DBF)+ZipName;
        ToName:=ZipName;
      end
    end
    else
    Begin
      FromName:=DBF;
      ToName:=SendName;
    End;

    if SendOk then
    Begin
      if FileExists(EMailDir+ToName) then
      Begin
        ShowMessage('Файл ' + SendName + ' уже находится в каталоге отправки. Подождите, пока он не отправится!');
        SendOk:=false;
      end
      else
        // Копируем в почтовый каталог
        if not F_FileUtils.SafeCopyFile(FromName,EMailDir+ToName) then
        Begin
          ShowMessage('Ошибка отправки файла '+ToName);
          SendOk:=false;
        End;
    end;

    // Удаляем файлы
    try
      DeleteFile(ExtractFilePath(DBF)+SendName);
      DeleteFile(ExtractFilePath(DBF)+ZipName);
    except
    end;
  end;

  if SendOk then
  Begin
    ShowMessage('Файл отправлен успешно!');
    SetStatus(3,true);
    lbMoscowDBF.Caption:=ExtractFileName(SendName);
    // Обновляем имя файла
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE MONTH_REESTR SET MOS_DBF_NAME='''+ExtractFileName(SendName)+''' WHERE ID='+IntToStr(ReestrID));
      Execute;
      oraConn.Commit;
    end;
  end
  else
    ShowMessage('При отправке файла были ошибки!');

  if SendOk then
  Begin
    // Копируем файл в архив
    If Archive<>'' then
    Begin
      F_FileUtils.SafeCopyFile(DBF,Archive+FormatDateTime('YY_MM_DD_HH_NN_',Now)+SendName);
    end;
  end;
end;

procedure Tf_SutRee.acSutReeLoadDBFExecute(Sender: TObject);
var FName,DBF:string;
    ReceiveOk:boolean;
    ReceiveName,BoxInDir,s:string;
    i:integer;
begin
  inherited;
  f_db.ReQuery(q_reports,true);

  BoxInDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('MOSCOW_REESTR_BOX_IN'),false));
  OpenDlg.InitialDir:=BoxInDir;
  OpenDlg.Filter:='Файлы DBF|*.DBF';
  OpenDlg.Filename:='';
  if OpenDlg.Execute then
  Begin
    BoxInDir:=ExtractFilePath(OpenDlg.FileName);
    F_main.SetApplVari('MOSCOW_REESTR_BOX_IN',BoxInDir);
    BoxInDir:=F_FileUtils.FillFilePath(BoxInDir+'\',True);
    F_FileUtils.FillFilePath(BoxInDir+'\RECEIVE\',True);

    ReceiveName:=AnsiUpperCase(ExtractFileName(OpenDlg.FileName));
    if not FileExists(BoxInDir+ReceiveName) then
    begin
      ShowMessage('Файл '+ReceiveName+' с подтверждениями отсутствует в каталоге приема!');
      exit;
    end;

    if ReceiveName<>AnsiUppercase(lbMoscowDBF.Caption) then
    Begin
      if (MessageDlg('Имя файла с подтверждениями '+ReceiveName+' не соответствует имени отправленного на согласование файла '+lbMoscowDBF.Caption+'. Загрузить файл ' + ReceiveName + ' ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        exit;
    end
    else
    Begin
      if (MessageDlg('Загрузить файл  ' + ReceiveName + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        exit;
    end;

    ReceiveOk:=false;
    try
      // Скопировать полученный файл
      DBF:=f_main.TempLocalPath+ReceiveName;
      F_FileUtils.SafeCopyFile(BoxInDir+ReceiveName,DBF);

      // Сбрасываем состояние позиций реестра
      q_tmp.Close;
      q_tmp.SQL.Clear;
      q_tmp.SQL.Add('UPDATE MONTH_REESTR_POS SET PRIORITY=0,TONN_MOS=0 WHERE MONTH_REESTR_ID='+IntToStr(ReestrID));
      q_tmp.Execute;

      if edDopRee.Value=0 then
      Begin
        // Очистить таблицу MOSC_REE.DBF
        with q_cmn2 do
        Begin
          Close;
          SQL.Clear;
          SQL.Add('DELETE FROM ''U:\LUK\REESTR\PREPARE\MOSC_REE.DBF'' WHERE DATE_REE='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateOf(edDateRee.Date)));
          ExecSQL;
        end;
      end;

      // перебираем записи из файла
      q_cmn1.Close;
      q_cmn1.SQL.Clear;
      q_cmn1.SQL.Add('SELECT NOM_ZD,TONN_DISTR,PRIORITY FROM '''+DBF+'''');
      q_cmn1.Open;
      q_cmn1.First;
      while not q_cmn1.Eof do
      Begin
        q_tmp.Close;
        q_tmp.SQL.Clear;
        q_tmp.SQL.Add('UPDATE MONTH_REESTR_POS SET PRIORITY='+q_cmn1.FieldByName('PRIORITY').AsString+',TONN_MOS='+
            q_cmn1.FieldByName('TONN_DISTR').AsString+' WHERE MONTH_REESTR_ID='+IntToStr(ReestrID)+' AND NOM_ZD='''+
            Trim(q_cmn1.FieldByName('NOM_ZD').AsString)+'''');
        q_tmp.Execute;

        if edDopRee.Value=0 then
        Begin
          // Заполнение MOSC_REE.DBF
          with q_cmn2 do
          Begin
            Close;
            SQL.Clear;
            SQL.Add('INSERT INTO ''U:\LUK\REESTR\PREPARE\MOSC_REE.DBF'' (DATE_REE,NOM_ZD,VAL_ZD,DOP_ZD) '+
                    ' VALUES ('+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateOf(edDateRee.Date))+
                                ','''+Trim(q_cmn1.FieldByName('NOM_ZD').AsString)+''''+
                                ','+q_cmn1.FieldByName('TONN_DISTR').AsString+
                                ',0)');
            ExecSQL;
          end;
        end;

        q_cmn1.Next;
      end;
      ReceiveOk:=true;
      DeleteFile(BoxInDir+ReceiveName);
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
    f_db.ReQuery(q_SutRee,true);

    if ReceiveOk then
    Begin
      ShowMessage('Файл загружен успешно!');
      SetStatus(4,true);
      oraConn.Commit;
      try
        F_FileUtils.SafeCopyFile(DBF,BoxInDir+'\RECEIVE\'+FormatDateTime('YY_MM_DD_HH_NN_',Now)+ReceiveName);
        DeleteFile(DBF);
      except
      end;
    end
    else
    Begin
      ShowMessage('При отправке файла были ошибки!');
      oraConn.Rollback;
    end;
  end;
end;

procedure Tf_SutRee.acSutReeNewXLSMoscowExecute(Sender: TObject);
var
  excel:  Variant;  //сервер excelя
  sheet:  Variant;  //лист, с которого читаем
  BoxDir: string;
  s:string;
  i:integer;
  filename:string;
  FNamePos:integer;
  colNom_zd:integer;
  colMos_zd:integer;
  colDop_zd:integer;
  colVal_zd:integer;
  colPrizn:integer;
  colPLAN_MON:integer;
  colFact_otgr:integer;
  colKind_npr:integer;
  Kod_npr:string;
  EmptyCount:integer;
  WasDog:boolean;
  Days:integer;
  f1,f2,OtklValue:extended;
  s1,s2,val_zad:string;
  FileDateRee:TDateTime;
begin
  try
    BoxDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('UHTA_REESTR_DIR'),false));
    OpenDlg.InitialDir:=BoxDir;
    OpenDlg.Filter:='Файлы Excel|*.XLS';
    OpenDlg.Filename:='';
    if OpenDlg.Execute then
    Begin
      filename := AnsiUpperCase(OpenDlg.FileName);

      FNamePos := Pos('U_',ExtractFilename(Filename));
      If FNamePos <>1 Then
      Begin
        FNamePos := Pos('M_',ExtractFilename(Filename));
        If FNamePos <>1 Then
        Begin
          ShowMessage('Имя файла не корректно!');
          exit;
        end;
      end;

      //присоединяемся к Excelю
      excel := CreateOleObject('Excel.Application');
      excel.Visible:=true;
      excel.workBooks.open(fileName);
      sheet := excel.WorkBooks[excel.workbooks.count].WorkSheets[1];

      // Проверка даты
      s:=VarToStr(sheet.Cells[8, 11]);
      FileDateRee:=StrToDate(s);
      If Copy(ExtractFilename(Filename), FNamePos + 2, 8) <> FormatDateTime('yyyymmdd',FileDateRee) Then
      if MessageDlg('Дата реестра и имя файла различны. Продолжить обработку?',
           mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Begin
        try
          excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
          if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
            excel.quit;
        except
        end;
        exit;
      end;

      If DateOf(edDateRee.Date) <> DateOf(FileDateRee) Then
      Begin
        ShowMessage('Дата в файле не соответствует дате реестра!');
       try
          excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
          if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
            excel.quit;
        except
        end;
        exit;
      end;

      // Подготовка к чтению
      colNom_zd := 0;
      colMos_zd := 0;
      colDop_zd := 0;
      colVal_zd := 0;
      colPrizn := 0;
      colPLAN_MON := 0;
      colFact_otgr := 0;
      colKind_npr := 0;
      Kod_npr := '';
      // Заполнение переменных, обозначающих столбцы с данными
      For i := 1 To 60 do
      Begin
        S:=VarToStr(sheet.Cells[13, i]);
        if s = 'nom_zd' then colNom_zd := i;
        if s = 'mos_zd' then colMos_zd := i;
        if s = 'dop_zd' then colDop_zd := i;
        if s = 'val_zd' then colVal_zd := i;
        if s = 'prizn' then colPrizn := i;
        if s = 'plan_mon' then colPLAN_MON := i;
        if s = 'fact_otgr' then colFact_otgr := i;
        if s = 'kind_npr' then colKind_npr := i;
      end;
      If (colNom_zd = 0) Or (colVal_zd = 0) Or (colPrizn = 0) Or (colPLAN_MON = 0) Or (colfact_otgr = 0) Or (colKind_npr = 0) Then
        ShowMessage('Не найден один или несколько столбцов с данными, обратитесь к программисту!');

      // Перебор записей
      i := 13;
      EmptyCount := 0;
      WasDog := False;
      Days := DayOf(EndOfTheMonth(edDateRee.Date))-DayOf(DateOf(edDateRee.Date))+1;
      DecimalSeparator:='.';
      While EmptyCount < 30 do
      Begin
        s:=Trim(VarToStr(sheet.Cells[i, colNom_zd]));
        If copy(s, 5, 1) = '-' Then
        Begin
          lbStatus.Caption := 'Обработка задания ' + s;
          with q_cmn do
          Begin
            Close;
            DeleteVariables;
            SQL.Clear;
            SQL.Add('SELECT TONN_MOS,PRIORITY FROM MONTH_REESTR_POS '+
                    ' WHERE MONTH_REESTR_ID='+IntToStr(ReestrID)+' AND NOM_ZD='''+s+'''');
            Open;
            if not eof then
            Begin
              case FieldByName('PRIORITY').AsInteger of
                -1: sheet.Cells[i, 2]:='ЗАПРЕТ';
                1: sheet.Cells[i, 2]:='Низкий';
                2: sheet.Cells[i, 2]:='Обычный';
                3: sheet.Cells[i, 2]:='Высокий';
              end;
              sheet.Cells[i, colMos_zd]:=FieldByName('TONN_MOS').AsString;
            end;
          end;
          EmptyCount := 0;
        end
        Else EmptyCount := EmptyCount + 1;
        i := i + 1;
      end; {while }

{      try
        excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
        if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
          excel.quit;
      except
      end;}

      //F_FileUtils.ExecAndWait(fileName,'',SW_SHOWMAXIMIZED,false);
    end;
  except
    on E:Exception do
       ShowMessage(E.Message);
  end;
end;

end.
