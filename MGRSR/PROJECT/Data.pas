unit Data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ADODB;

type
  TdmData = class(TDataModule)
    taPackets: TTable;
    dsPackets: TDataSource;
    taEvents: TTable;
    dsEvents: TDataSource;
    taTimeEvn: TTable;
    dsTimeEvn: TDataSource;
    taPackets0: TTable;
    dsPackets0: TDataSource;
    taTimeEvnKOD_EVTIME: TSmallintField;
    taTimeEvnKOD_PACKET: TSmallintField;
    taTimeEvnDATERUN: TDateField;
    taTimeEvnFlagPath: TStringField;
    taTimeEvnFlagName: TStringField;
    taTimeEvnRun: TBooleanField;
    taTimeEvnTIME: TStringField;
    taTimeEvnTIMERUN: TStringField;
    taListFiles: TTable;
    dsListFiles: TDataSource;
    taAdminProtokol: TTable;
    taAdminProtokolKOD_SESS: TStringField;
    taAdminProtokolF_DATE_B: TDateField;
    taAdminProtokolF_TIME_B: TStringField;
    taAdminProtokolF_DATE_E: TDateField;
    taAdminProtokolF_TIME_E: TStringField;
    taAdminProtokolF_ER_ROR: TMemoField;
    taAdminProtokolMANAGER: TBooleanField;
    taAdminProtokolACTIVE: TBooleanField;
    taAdminProtokolERROR: TBooleanField;
    taAdminProtokolCurrent: TStringField;
    dsAdminProtokol: TDataSource;
    taAdminEvents: TTable;
    taEventsKOD_SESS: TStringField;
    taEventsKOD_PACKET: TSmallintField;
    taEventsName: TStringField;
    taEventsTip: TStringField;
    taEventsTipEvent: TStringField;
    taEventsDATE: TDateField;
    taEventsTIME_RUN: TStringField;
    taEventsTIME_B: TStringField;
    taEventsTIME_E: TStringField;
    taEventsERROR: TBooleanField;
    taEventsRESULT: TMemoField;
    taEventsINFO: TMemoField;
    dsAdminEvents: TDataSource;
    taViewEvents: TTable;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField1: TDateField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    BooleanField1: TBooleanField;
    MemoField1: TMemoField;
    MemoField2: TMemoField;
    taEventsNameProcess: TStringField;
    dsViewEvents: TDataSource;
    taViewPackets: TTable;
    dsViewPackets: TDataSource;
    taAdminPackets: TTable;
    dsAdminPackets: TDataSource;
    taParamListFiles: TTable;
    dsParamListFiles: TDataSource;
    taProtokol: TTable;
    dsProtokol: TDataSource;
    taParamPackets: TTable;
    taPacketsKOD_PACKET: TSmallintField;
    taPacketsNAME: TStringField;
    taPacketsDESCRIPT: TStringField;
    taPacketsMODULE: TStringField;
    taPacketsFLAGPATH: TStringField;
    taPacketsFLAGNAME: TStringField;
    taPacketsFLAGERASE: TBooleanField;
    taPacketsPARAMS: TStringField;
    taPacketsTIPEVENT: TSmallintField;
    taPacketsRUN: TBooleanField;
    taPacketsINFO: TMemoField;
    taPacketsTip: TStringField;
    dsParamPackets: TDataSource;
    taParamTipEvent: TTable;
    dsParamTipEvent: TDataSource;
    taParamLock: TTable;
    dsParamLock: TDataSource;
    taRaznLog: TTable;
    taRaznLogKOD: TStringField;
    taRaznLogCNTREC: TFloatField;
    taRaznLogCNTREC0: TFloatField;
    taRaznLogCIST: TFloatField;
    taRaznLogCIST0: TFloatField;
    taRaznLogTONN: TFloatField;
    taRaznLogTONN0: TFloatField;
    taRaznLogDATE: TDateField;
    taRaznLogTIME: TStringField;
    taRaznLogDATA_S: TDateField;
    taRaznLogTIME_S: TStringField;
    taRaznLogGD_PRN: TMemoField;
    taRaznLogGDE_PRN: TMemoField;
    taRaznLogW_PRN: TMemoField;
    taRaznLogWE_PRN: TMemoField;
    taRaznLogT_PRN: TMemoField;
    taRaznLogS_PRN: TMemoField;
    dsRaznLog: TDataSource;
    taParamTimeEvn: TTable;
    taTimeEvnName: TStringField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    StringField8: TStringField;
    DateField2: TDateField;
    StringField9: TStringField;
    taTimeEvnDescript: TStringField;
    dsParamTimeEvn: TDataSource;
    taTEPackets: TTable;
    dsTEPackets: TDataSource;
    taTELock: TTable;
    dsTELock: TDataSource;
    taParamPingList: TTable;
    dsParamPingList: TDataSource;
    taPingList: TTable;
    dsPingList: TDataSource;
    taParamLoadTask: TTable;
    dsParamLoadTask: TDataSource;
    taLoadTask: TTable;
    dsLoadTask: TDataSource;
    taLogTask: TTable;
    dsLogTask: TDataSource;
    taParamLoadTaskID: TFloatField;
    taParamLoadTaskID_ORDER: TFloatField;
    taParamLoadTaskFILENAME: TStringField;
    taParamLoadTaskLASTDATE: TDateField;
    taParamLoadTaskLASTTIME: TStringField;
    taParamLoadTaskOWNER_ID: TFloatField;
    taParamLoadTaskLOADER: TStringField;
    taParamLoadTaskTASK: TStringField;
    taParamLoadTaskRUN: TBooleanField;
    taParamLoadTaskMODULE: TStringField;
    taParamLoadTaskPARAMS: TStringField;
    taParamLoadTaskTIPMODULE: TSmallintField;
    taParamLoadTaskTIP: TStringField;
    taListLoadTask: TTable;
    dsListLoadTask: TDataSource;
    taParamLoadTaskFOR_OWNER: TBooleanField;
    dsViewLogTask: TDataSource;
    UHTA_ODBC: TADOConnection;
    UHTA_BDE: TDatabase;
    qViewLogTask: TADOQuery;
    ADOQuery: TADOQuery;
    procedure taEventsAfterPost(DataSet: TDataSet);
    procedure taEventsAfterDelete(DataSet: TDataSet);
    procedure taListFilesAfterDelete(DataSet: TDataSet);
    procedure taListFilesAfterPost(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure taAdminProtokolCalcFields(DataSet: TDataSet);
    procedure taAdminEventsCalcFields(DataSet: TDataSet);
    procedure taViewEventsCalcFields(DataSet: TDataSet);
    procedure dsAdminEventsDataChange(Sender: TObject; Field: TField);
    procedure taProtokolAfterPost(DataSet: TDataSet);
    procedure taProtokolAfterDelete(DataSet: TDataSet);
    procedure taListFilesAfterInsert(DataSet: TDataSet);
    procedure taPacketsAfterPost(DataSet: TDataSet);
    procedure taPacketsAfterDelete(DataSet: TDataSet);
    procedure taTimeEvnAfterDelete(DataSet: TDataSet);
    procedure taTimeEvnAfterPost(DataSet: TDataSet);
    procedure taParamPacketsAfterInsert(DataSet: TDataSet);
    procedure taParamPacketsBeforePost(DataSet: TDataSet);
    procedure taParamPacketsAfterDelete(DataSet: TDataSet);
    procedure taParamPacketsAfterPost(DataSet: TDataSet);
    procedure taParamLockAfterDelete(DataSet: TDataSet);
    procedure taParamLockAfterPost(DataSet: TDataSet);
    procedure dsRaznLogDataChange(Sender: TObject; Field: TField);
    procedure taParamTimeEvnAfterDelete(DataSet: TDataSet);
    procedure taParamTimeEvnAfterPost(DataSet: TDataSet);
    procedure taParamTipEventAfterPost(DataSet: TDataSet);
    procedure taParamTipEventAfterDelete(DataSet: TDataSet);
    procedure taTEPacketsAfterDelete(DataSet: TDataSet);
    procedure taTEPacketsAfterPost(DataSet: TDataSet);
    procedure taParamTimeEvnBeforePost(DataSet: TDataSet);
    procedure taTELockAfterPost(DataSet: TDataSet);
    procedure taTELockAfterDelete(DataSet: TDataSet);
    procedure taLoadTaskAfterDelete(DataSet: TDataSet);
    procedure taLoadTaskAfterPost(DataSet: TDataSet);
    procedure taLoadTaskAfterInsert(DataSet: TDataSet);
    procedure taLoadTaskBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RestoreEvents;
    procedure RestoreProtokol(AddLine:boolean);
    procedure AddProtokol;
    procedure UpdateProtokol;
  end;


var
  dmData: TdmData;

implementation

uses Admin, RaznLog, Main, LoadTask;

{$R *.DFM}

// Процедура восстановления файлов Events.*
// из шаблонов Ev_shab.*
procedure TdmData.RestoreEvents;
var s:string;
begin
  with fmMain do
  begin
    taEvents.Close;
    taViewEvents.Close;
    taAdminEvents.Close;
    s:=FormatDateTime('yymmddhhnnss',Now);
    RenameFile(PChar(gPathEventsDBF+'\events.dbf'),PChar(gPathEventsDBF+'\events'+S+'.dbf'));
    RenameFile(PChar(gPathEventsDBF+'\events.fpt'),PChar(gPathEventsDBF+'\events'+S+'.fpt'));
    RenameFile(PChar(gPathEventsDBF+'\events.cdx'),PChar(gPathEventsDBF+'\events'+S+'.cdx'));
    CopyFile(PChar(gPathEventsDBF+'\ev_shab.dbf'),PChar(gPathEventsDBF+'\events.dbf'),False);
    CopyFile(PChar(gPathEventsDBF+'\ev_shab.fpt'),PChar(gPathEventsDBF+'\events.fpt'),False);
    CopyFile(PChar(gPathEventsDBF+'\ev_shab.cdx'),PChar(gPathEventsDBF+'\events.cdx'),False);
  end;
end;

// Процедура восстановления файлов Protokol.*
// из шаблонов Pr_shab.*
procedure TdmData.RestoreProtokol(AddLine:boolean);
var s:string;
begin
  with fmMain do
  begin
    taProtokol.Close;
    taAdminProtokol.Close;
    s:=FormatDateTime('yymmddhhnnss',Now);
    RenameFile(PChar(gPathEventsDBF+'\protokol.dbf'),PChar(gPathEventsDBF+'\protokol'+S+'.dbf'));
    RenameFile(PChar(gPathEventsDBF+'\protokol.fpt'),PChar(gPathEventsDBF+'\protokol'+S+'.fpt'));
    RenameFile(PChar(gPathEventsDBF+'\protokol.cdx'),PChar(gPathEventsDBF+'\protokol'+S+'.cdx'));
    CopyFile(PChar(gPathEventsDBF+'\pr_shab.dbf'),PChar(gPathEventsDBF+'\protokol.dbf'),False);
    CopyFile(PChar(gPathEventsDBF+'\pr_shab.fpt'),PChar(gPathEventsDBF+'\protokol.fpt'),False);
    CopyFile(PChar(gPathEventsDBF+'\pr_shab.cdx'),PChar(gPathEventsDBF+'\protokol.cdx'),False);
    if gManager And AddLine then
    begin
      try
        taProtokol.Active := True;
        AddProtokol;
      except
        RestoreProtokol(False);
        taProtokol.Active := True;
        AddProtokol;
      end;
      taProtokol.Active := False;
    end;
  end;
end;

procedure TdmData.AddProtokol;
begin
  with dmData.taProtokol do
  begin
    Insert;
    FieldByName('KOD_SESS').AsString := fmMain.gKodSession;
    FieldByName('F_DATE_B').AsString := DateToStr(fmMain.gDateStart);
    FieldByName('F_TIME_B').AsString := TimeToStr(fmMain.gTimeStart);
    FieldByName('MANAGER').AsBoolean := fmMain.gManager;
    FieldByName('ACTIVE').AsBoolean := fmMain.gManager;
    Post;
    gRecNoProtokol := GetBookmark;
  end;
end;

procedure TdmData.UpdateProtokol;
begin
  with dmData.taProtokol do
  begin
    GotoBookmark(gRecNoProtokol);
    Edit;
    FieldByName('F_DATE_E').AsString := DateToStr(Date);
    FieldByName('F_TIME_E').AsString := TimeToStr(Time);
    FieldByName('ACTIVE').AsBoolean := False;
    Post;
  end;
end;

procedure TdmData.taEventsAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taEventsAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taListFilesAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taListFilesAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.DataModuleDestroy(Sender: TObject);
begin
  taEvents.Close;
  taPackets.Close;
  taTimeEvn.Close;
  taPackets0.Close;
  taListFiles.Close;
  taProtokol.Close;
  taRaznLog.Close;
  taAdminProtokol.Close;
  taAdminEvents.Close;
  taAdminPackets.Close;
  taViewEvents.Close;
  taViewPackets.Close;
  taParamListFiles.Close;
  taParamPackets.Close;
  taParamTipEvent.Close;
  taParamLock.Close;
  taParamTimeEvn.Close;
  taTEPackets.Close;
  taTELock.Close;
end;

procedure TdmData.taAdminProtokolCalcFields(DataSet: TDataSet);
begin
if DataSet.FieldByName('ACTIVE').AsBoolean = True then
  DataSet.FieldByName('CURRENT').AsString := 'Текущая'
else
  DataSet.FieldByName('CURRENT').AsString := 'Не активна'
end;

procedure TdmData.taAdminEventsCalcFields(DataSet: TDataSet);
begin
if DataSet.FieldByName('TIPEVENT').AsString = '1' then
  DataSet.FieldByName('TIP').AsString := 'FoxPro'
else
  DataSet.FieldByName('TIP').AsString := 'Исполнимый'
end;

procedure TdmData.taViewEventsCalcFields(DataSet: TDataSet);
begin
(*  lTip := DataSet.FieldByName('TIPEVENT').AsInteger;
  case lTip of
     1: DataSet.FieldByName('TIP').AsString := 'FoxPro';
     2: DataSet.FieldByName('TIP').AsString := 'Исполнимый';
     3: DataSet.FieldByName('TIP').AsString := 'VFP';
  end;{case}*)
end;

procedure TdmData.dsAdminEventsDataChange(Sender: TObject; Field: TField);
begin
  if taAdminEvents.FieldByName('ERROR').AsBoolean = True then
    fmAdmin.sbError.Enabled := True
  else
    fmAdmin.sbError.Enabled := False;
  if not taAdminEvents.FieldByName('INFO').IsNull then
    fmAdmin.sbInfo.Enabled := True
  else
    fmAdmin.sbInfo.Enabled := False;
end;

procedure TdmData.taProtokolAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taProtokolAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taListFilesAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('RUN').AsBoolean := False; //Не активен
end;

procedure TdmData.taPacketsAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taPacketsAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taTimeEvnAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taTimeEvnAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamPacketsAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('TIPEVENT').AsInteger := 1; //FoxPro
  DataSet.FieldByName('RUN').AsBoolean := False; //Не активен
end;

procedure TdmData.taParamPacketsBeforePost(DataSet: TDataSet);
var gUniKey:integer;
begin
  if (DataSet.State=dsInsert) then
  with taParamLock do
  begin
    Active:=True;
    if TTable(DataSet).TableName='PACKETS.DBF'
      then Filter:='GUID=''PACKETS''';
    if FindFirst then
    begin
      gUniKey:=FieldByName('Value').AsInteger;
      Edit;
      FieldByName('Value').AsInteger:=gUniKey+1;
      Post;
      DataSet.FieldByName('KOD_PACKET').AsInteger := gUniKey;
    end
    else
    begin
      MessageDlg('Код не был сгенерирован ! Обратитесь к разработчику.',mtError,[mbOk],0);
      DataSet.Cancel;
    end;{if}
    Active:=False;
  end;{with}
end;

procedure TdmData.taParamPacketsAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamPacketsAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamLockAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamLockAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.dsRaznLogDataChange(Sender: TObject; Field: TField);
begin
  if not taRaznLog.FieldByName('GD_PRN').IsNull then
    fmRaznLog.rbGD.Enabled := True
  else
    fmRaznLog.rbGD.Enabled := False;
  if not taRaznLog.FieldByName('GDE_PRN').IsNull then
    fmRaznLog.rbGDE.Enabled := True
  else
    fmRaznLog.rbGDE.Enabled := False;
  if not taRaznLog.FieldByName('W_PRN').IsNull then
    fmRaznLog.rbW.Enabled := True
  else
    fmRaznLog.rbW.Enabled := False;
  if not taRaznLog.FieldByName('WE_PRN').IsNull then
    fmRaznLog.rbWE.Enabled := True
  else
    fmRaznLog.rbWE.Enabled := False;
  if not taRaznLog.FieldByName('T_PRN').IsNull then
    fmRaznLog.rbT.Enabled := True
  else
    fmRaznLog.rbT.Enabled := False;
  if not taRaznLog.FieldByName('S_PRN').IsNull then
    fmRaznLog.rbS.Enabled := True
  else
    fmRaznLog.rbS.Enabled := False;
end;

procedure TdmData.taParamTimeEvnAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamTimeEvnAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamTipEventAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamTipEventAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taTEPacketsAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taTEPacketsAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taParamTimeEvnBeforePost(DataSet: TDataSet);
var gUniKey:integer;
begin
  if (DataSet.State=dsInsert) then
  with taTELock do
  begin
    Active:=True;
    if TTable(DataSet).TableName='TIMEEVN.DBF' then Filter:='GUID=''TIMEEVN''';
    if FindFirst then
    begin
      gUniKey:=FieldByName('Value').AsInteger;
      Edit;
      FieldByName('Value').AsInteger:=gUniKey+1;
      Post;
      DataSet.FieldByName('KOD_EVTIME').AsInteger:=gUniKey;
    end
    else
    begin
      MessageDlg('Код не был сгенерирован ! Обратитесь к разработчику.',mtError,[mbOk],0);
      DataSet.Cancel;
    end;{if}
    Active:=False;
  end;{with}
  with DataSet do
  begin
    FieldByName('TIMERUN').AsString := '';
    FieldByName('DATERUN').AsString := '';
  end;
end;

procedure TdmData.taTELockAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taTELockAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
end;

procedure TdmData.taLoadTaskAfterDelete(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
  with fmLoadTask do
  If Active then
  Begin
    TaskTree.UpdateNodes(TaskTree.Items[0]);
  end;
end;

procedure TdmData.taLoadTaskAfterPost(DataSet: TDataSet);
begin
  TBDEDataSet(DataSet).FlushBuffers;
  with fmLoadTask do
  If Active then
  Begin
    TaskTree.UpdateNodes(TaskTree.Items[0]);
  end;
end;

procedure TdmData.taLoadTaskAfterInsert(DataSet: TDataSet);
var q:TQuery;
begin
  DataSet.FieldByName('RUN').AsBoolean := False; //Не активен
  try
    q:=TQuery.Create(Self);
    q.DatabaseName:='UHTA_BDE';
    q.SQL.Add('SELECT MAX(ID) AS MAX_ID FROM loadtask');
    q.Open;
    DataSet.FieldByName('ID').AsInteger := q.FieldByName('MAX_ID').AsInteger+1;
    DataSet.FieldByName('ID_ORDER').AsInteger := q.FieldByName('MAX_ID').AsInteger+1;
    q.Close;
    q.SQL.Clear;
    q.Free;
  except
    DataSet.FieldByName('ID').AsInteger := 1;
    DataSet.FieldByName('ID_ORDER').AsInteger := 1;
  end;
end;

procedure TdmData.taLoadTaskBeforeDelete(DataSet: TDataSet);
var q:TQuery;
begin
  try
    q:=TQuery.Create(Self);
    q.DatabaseName:='UHTA_BDE';
    q.SQL.Add('SELECT COUNT(*) AS CNT1 FROM loadtask WHERE owner_id='+DataSet.FieldByName('ID').AsString);
    q.Open;
    IF q.FieldByName('CNT1').AsInteger>0 then
    Begin
      Application.MessageBox('Вначале удалите зависимые записи','Внимание',MB_OK);
      Abort;
    End;
    q.Close;
    q.SQL.Clear;
    q.Free;
  except
    Application.MessageBox('Вначале удалите зависимые записи','Внимание',MB_OK);
    Abort;
  end;
  If Application.MessageBox('Удалить строку?','Внимание',MB_YESNO)=IDNO Then Abort;
end;

procedure TdmData.DataModuleCreate(Sender: TObject);
begin
  UHTA_ODBC.Connected:=true;
  UHTA_BDE.Open;
end;

end.
