unit RepDbf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, ADODB, Grids, DBGridEh, ExtCtrls,
  ActnList, XPStyleActnCtrls, ActnMan, TB2Item, Menus, TB2Dock, TB2Toolbar,
  TB2ExtItems, Oracle, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons,EhLibDOA, DateUtils,
  GridsEh;

type
  Tf_Rep_Dbf = class(Tf_MDIForm)
    q_reports: TOracleDataSet;
    DBFConn: TADOConnection;
    q_DataADO: TADOQuery;
    ds_Browse: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    gridBrowse: TDBGridEh;
    q_cmn: TADOQuery;
    ActionManager1: TActionManager;
    acRepDbfSendDBF: TAction;
    acRepDbfSendXLS: TAction;
    acRepDbfToXLS: TAction;
    acRepDbfPrepareXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    tbSendDBF: TTBItem;
    tbSendXLS: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    pm_gridBrowse: TTBPopupMenu;
    TBItem6: TTBItem;
    e_FieldFilter: TTBEditItem;
    TBItem1: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem10: TTBItem;
    TBItem2: TTBItem;
    TBItem4: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    q_cmn2: TOracleQuery;
    Label1: TLabel;
    edNumRep: TCurrencyEdit;
    Label2: TLabel;
    sbRefresh: TSpeedButton;
    tbiItogs: TTBItem;
    ORAConn: TOracleSession;
    q_DataORA: TOracleDataSet;
    Timer1: TTimer;
    FOR_REPORTS: TOraclePackage;
    tbPrepareXLS: TTBItem;
    t_Browse: TADOTable;
    TBItem3: TTBItem;
    acRepDbfSendCSV: TAction;
    tbSendCSV: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridBrowseColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure acRepDbfToXLSExecute(Sender: TObject);
    procedure e_FieldFilterAcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem1Click(Sender: TObject);
    procedure pm_gridBrowsePopup(Sender: TObject);
    procedure acRepDbfSendDBFExecute(Sender: TObject);
    procedure acRepDbfSendXLSExecute(Sender: TObject);
    procedure acRepDbfPrepareXLSExecute(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
    procedure q_reportsAfterOpen(DataSet: TDataSet);
    procedure tbiItogsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure gridBrowseGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure t_BrowseFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBItem3Click(Sender: TObject);
    procedure acRepDbfSendCSVExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RepFileName:string;
    BeginDate:TDateTime;
    BeginNextDate:TDateTime;
    BeginPrevDate:TDateTime;
    EndDate:TDateTime;
    EndNextDate:TDateTime;
    EndPrevDate:TDateTime;
    BeginTime:string;
    EndTime:string;
    SqlSource:String;
    EmailDbf:String;
    EmailXls:String;
    EmailCsv:String;
    Archive:String;
    DbfForDbf:string;
    DbfForXls:string;
    FieldsNameList:string;
    FieldsSumList:string;
    TempDBF:string;
    FieldsFilter:TStringList;
    FieldsTitles:TStringList;
    FieldsItogs:TStringList;
    FieldsAllList:TStringList;
    SendDBF:boolean;
    SendXLS:boolean;
    SendCSV:boolean;
    PrepareXLS:boolean;
    SendDbfName:string;
    SendXlsName:string;
    SendCSVName:string;
    ReportFile:string;
    q_Data:TDataSet;
    IsFirst:boolean;
    IS_CRT:double;
    function SendFile(TypFile:string; FlagSend:boolean; IsAuto:boolean):boolean;
    function CheckValues(TypeValue:string):boolean;
    procedure GridGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  end;

var
  f_Rep_Dbf: Tf_Rep_Dbf;
  ReportId:integer;
  ReportType:string;
  ReportAuto:boolean;

implementation

uses ForTemp, StrUtils, ForSystem,DBGridEhImpExp,RxShell, ForFiles,
  ForDB, RepDbfItogs, RepDbfGrp, main, EhLibADO;

{$R *.dfm}

procedure Tf_Rep_Dbf.GridGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
Begin
  inherited;
  if EditMode then
  Begin
    Params.Text:=Trim(Params.Text);
  end;
End;

procedure Tf_Rep_Dbf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  q_reports.Close;
  q_DataADO.Close;
  q_DataORA.Close;
  t_Browse.Close;
  q_cmn.close;
  DBFConn.Close;
  ORAConn.LogOff;

  try
    FieldsFilter.Clear;
    FieldsFilter.Free;
    FieldsTitles.Clear;
    FieldsTitles.Free;
    FieldsItogs.Clear;
    FieldsItogs.Free;
    FieldsAllList.Clear;
    FieldsAllList.Free;
    DeleteFile(TempDBF);
  except
  end;

  If ReportAuto then
  Begin
    Halt(0);
  End;
  ReportAuto:=false;
  ReportType:='';
  ReportId:=0;

  Action:=caFree;
end;

procedure Tf_Rep_Dbf.FormShow(Sender: TObject);
var CreateSQL,InsertSQLHeader,InsertSQL:string;
    fsize,i,j: integer;
    s:string;
    Zpt:string;
    ColName:string;
    ColWidth:integer;
begin
  inherited;
  f_db.SetUserGrants(ActionManager1);
  Screen.Cursor := crHourGlass;

  q_reports.SQL[1]:='WHERE id='+IntToStr(ReportId);
  q_reports.Open;

  // ��������� ������
  BeginDate:=DateOf(TempVari.GetAsDate('BEGIN_DATE',APPLICATION_NAME,RepFileName));
  EndDate:=DateOf(TempVari.GetAsDate('END_DATE',APPLICATION_NAME,RepFileName));
  BeginNextDate:=StartOfTheMonth(EndOfTheMonth(EndDate)+1);
  EndNextDate:=EndOfTheMonth(BeginNextDate);
  EndPrevDate:=EndOfTheMonth(StartOfTheMonth(BeginDate)-1);
  BeginPrevDate:=StartOfTheMonth(EndPrevDate);
  IS_CRT:=TempVari.GetAsNum('IS_CRT',APPLICATION_NAME,RepFileName);

  if ReportAuto and (q_reports.FieldByName('PARAM1').AsString='OIL_SPACE') then
  Begin
    BeginDate:=DateOf(TempVari.GetAsDate('BEGIN_DATE',APPLICATION_NAME,RepFileName))-5;
  End;

  BeginTime:=TempVari.GetAsChar('BEGIN_TIME',APPLICATION_NAME,RepFileName);
  if BeginTime='' then BeginTime:='00:00:00';
  EndTime:=TempVari.GetAsChar('END_TIME',APPLICATION_NAME,RepFileName);
  if EndTime='' then EndTime:='00:00:00';
  edNumRep.Value:=FOR_REPORTS.CallIntegerFunction('GetNumRep',[q_reports.FieldByName('ID').AsInteger,BeginDate,EndDate,IS_CRT]);

  // ���������� �������
  DBFConn.Open;
  if q_reports.FieldByName('SQL_SOURCE_TYPE').AsString='ORA' then
  Begin
    if q_reports.FieldByName('SQL_DATABASE').AsString<>'' then ORAConn.LogonDatabase:=q_reports.FieldByName('SQL_DATABASE').AsString;
    if q_reports.FieldByName('SQL_USERNAME').AsString<>'' then ORAConn.LogonUsername:=q_reports.FieldByName('SQL_USERNAME').AsString;
    if q_reports.FieldByName('SQL_PASSWORD').AsString<>'' then ORAConn.LogonPassword:=q_reports.FieldByName('SQL_PASSWORD').AsString;
    ORAConn.LogOn;

    q_DataORA.ClearVariables;
    q_DataORA.SQL.Clear;
    q_DataORA.SQL.Add(SqlSource);
    if Pos(':BEGIN_DATE',SQLSource)<>0 then
    Begin
      q_DataOra.DeclareVariable('BEGIN_DATE',otDate);
      q_DataOra.SetVariable('BEGIN_DATE',BeginDate);
    end;
    if Pos(':END_DATE',SQLSource)<>0 then
    Begin
      q_DataOra.DeclareVariable('END_DATE',otDate);
      q_DataOra.SetVariable('END_DATE',EndDate);
    end;
    if Pos(':BEGIN_TIME',SQLSource)<>0 then
    Begin
      q_DataOra.DeclareVariable('BEGIN_TIME',otString);
      q_DataOra.SetVariable('BEGIN_TIME',BeginTime);
    end;
    if Pos(':END_TIME',SQLSource)<>0 then
    Begin
      q_DataOra.DeclareVariable('END_TIME',otString);
      q_DataOra.SetVariable('END_TIME',EndTime);
    end;
    if Pos(':IS_CRT',SQLSource)<>0 then
    Begin
      q_DataOra.DeclareVariable('IS_CRT',otFloat);
      q_DataOra.SetVariable('IS_CRT',IS_CRT);
    end;

{      SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':BEGIN_DATE','TO_DATE('''+FormatDateTime('dd.mm.yyyyy',BeginDate)+''',''dd.mm.yyyy'')');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':END_DATE','TO_DATE('''+FormatDateTime('dd.mm.yyyyy',EndDate)+''',''dd.mm.yyyy'')');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':BEGIN_TIME',''''+BeginTime+'''');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':END_TIME',''''+EndTime+'''');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':IS_CRT',FloatToStr(IS_CRT));}

    q_DataORA.SQL.SaveToFile('c:\tmp\RepDbf.sql');
    q_DataORA.Open;
    q_Data:=q_DataORA;
  end
  else
  Begin
    if q_reports.FieldByName('SQL_SOURCE_TYPE').AsString='DBF' then
      q_DataADO.Connection:=DBFConn
    else
      q_DataADO.ConnectionString:='Provider=MSDASQL.1;Password="'+Trim(q_reports.FieldByName('SQL_PASSWORD').AsString)+'";Persist Security Info=True;Data Source='+q_reports.FieldByName('SQL_DATABASE').AsString;

    q_DataADO.Parameters.Clear;
    q_DataADO.SQL.Clear;
    q_DataADO.SQL.Add(SqlSource);
    if Pos(':BEGIN_DATE',SQLSource)<>0 then
    Begin
//      q_DataADO.Parameters.CreateParameter('BEGIN_DATE', ftDate, pdInput, 0, BeginDate);
      q_DataADO.Parameters.ParamByName('BEGIN_DATE').Value:=BeginDate
    end;
    if Pos(':END_DATE',SQLSource)<>0 then
    Begin
//      q_DataADO.Parameters.CreateParameter('END_DATE', ftDate, pdInput, 0, EndDate);
      q_DataADO.Parameters.ParamByName('END_DATE').Value:=EndDate
    end;
    if Pos(':BEGIN_TIME',SQLSource)<>0 then
    Begin
      q_DataADO.Parameters.ParamByName('BEGIN_TIME').Value:=BeginTime
    end;
    if Pos(':END_TIME',SQLSource)<>0 then
    Begin
      q_DataADO.Parameters.ParamByName('END_TIME').Value:=EndTime
    end;
    if Pos(':IS_CRT',SQLSource)<>0 then
    Begin
      q_DataADO.Parameters.ParamByName('IS_CRT').Value:=IS_CRT
    end;

//      SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':BEGIN_DATE',FormatDateTime('"{"mm"/"dd"/"yyyy"}"',BeginDate));
//      SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':END_DATE',FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EndDate));
{      SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':BEGIN_TIME','"'+BeginTime+'"');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':END_TIME','"'+EndTime+'"');
    SQLSource:=StrUtils.AnsiReplaceStr(SQLSource,':IS_CRT',FloatToStr(IS_CRT));}

    q_DataADO.SQL.SaveToFile('c:\tmp\RepDbf.sql');
    q_DataADO.Open;
    q_Data:=q_DataADO;
  end;


  // ������� ��������� �������
  TempDBF:=f_main.TempLocalPath+'rep'+F_ForSystem.RndStr(5)+'.dbf';
  CreateSQL:='CREATE TABLE '''+TempDBF+''' (';
  Zpt:='';

  for i:=1 to q_Data.FieldCount do
  Begin
    CreateSQL:=CreateSQL+Zpt+q_data.fields[i-1].FieldName;
    Zpt:=',';
    s:='';
    case q_data.fields[i-1].DataType of
      ftString,ftMemo,ftFmtMemo,ftFixedChar, ftWideString:
      begin
        if q_data.fields[i-1].size>250 then
          FSize:=250
        else
          FSize:=q_data.fields[i-1].size;
        s:=' C('+IntToStr(FSize)+')';
      end;
      ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt:
        s:=' N(17)';
      ftBoolean:
        s:=' L';
      ftBCD,ftCurrency,ftFloat:
        s:=' N(17,7)';
      ftDate,ftTime,ftDateTime:
        s:=' D';
      else
        s:=' ?';
    end;
    CreateSQL:=CreateSQL+s;
  end;
  CreateSQL:=CreateSQL+')';

  // ������� ��������� �������
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add(CreateSQL);
  q_cmn.ExecSQL;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM '''+TempDBF+'''');
  q_cmn.ExecSQL;

  // ��������� ��������� ������� ����������
  F_DB.FillADOTable(DBFConn,q_Data,TempDBF,false,0);

  // ��������� ������ �� �������� ���������� ������
{  q_Browse.Close;
  q_Browse.SQL.Clear;
  q_Browse.SQL.Add('SELECT * FROM '''+TempDBF+'''');
  q_Browse.SQL.Add('');
  q_Browse.Open;}
  t_Browse.Close;
  t_Browse.ConnectionString:='Provider=MSDASQL.1;Password="";Persist Security Info=True;Mode=ReadWrite;Extended Properties="DSN=PF;UID=;PWD=;SourceDB='+
     ExtractFilePath(TempDbf)+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;";Initial Catalog='+
     ExtractFilePath(TempDbf);
  t_Browse.TableName:=ExtractFileName(TempDbf);
  t_Browse.Open;

  // ��������� Browse
  FieldsFilter:=TStringList.Create;
  FieldsFilter.Clear;

  FieldsTitles:=TStringList.Create;
  FieldsTitles.Clear;
  FieldsTitles.QuoteChar:='"';
  FieldsTitles.Delimiter:=';';
  FieldsTitles.DelimitedText:=FieldsNameList;

  FieldsAllList:=TStringList.Create;
  FieldsAllList.Clear;

  for i:=1 to t_Browse.FieldCount do
  Begin
    with gridBrowse.Columns.Add do
    begin
      OnGetCellParams:=GridGetCellParams;
      ColName:=AnsiUpperCase(t_Browse.fields[i-1].FieldName);
      FieldName:=ColName;
      ReadOnly:=False;
      Title.TitleButton:=True;
{      gridBrowse.CalcTitleWidth(Self,ColWidth);
      Width:=ColWidth;}

      // ���������� ������� �������� ����
{      j:=Pos(' '+ColName+' ',FieldsNameList);
      if j=0 then j:=Pos(' '+ColName+'=',FieldsNameList);
      if j=0 then j:=Pos(';'+ColName+' ',FieldsNameList);
      if j=0 then j:=Pos(';'+ColName+'=',FieldsNameList);
      if j=0 then begin j:=Pos(ColName+' ',FieldsNameList); if j>1 then j:=0; end;
      if j=0 then begin j:=Pos(ColName+'=',FieldsNameList); if j>1 then j:=0; end;
      if j>1 then j:=j+1;
      if j>0 then
      Begin
        s:=System.Copy(FieldsNameList,j,999);
        j:=Pos(';',s);
        if j>0 then s:=System.Copy(s,1,j-1);
        j:=Pos('=',s);
        if j>0 then
          Title.Caption:=Trim(System.Copy(s,j+1,999))+' ('+ColName+')';
      End;}
      j:=FieldsTitles.IndexOfName(ColName);
      if j<>-1 then
        Title.Caption:=Trim(FieldsTitles.ValueFromIndex[j])+' ('+ColName+')';

      FieldsAllList.Add(Title.Caption);

      // ���������� ������������� ������
      case t_Browse.fields[i-1].DataType of
        ftAutoInc,ftSmallint,ftInteger,ftWord,ftLargeInt,ftBCD,ftCurrency,ftFloat:
        Begin
          j:=Pos(ColName,FieldsSumList);
          if j>0 then Footer.ValueType:=fvtSum;
        End;
      end;
    End;
    FieldsFilter.Add('');
    gridBrowse.FrozenCols:=1;
  end;
  FieldsFilter.Add('');

  // ���������� ������������� �����
  FieldsItogs:=TStringList.Create;
  FieldsItogs.Clear;
  FieldsItogs.QuoteChar:='"';
  FieldsItogs.Delimiter:=';';
  FieldsItogs.NameValueSeparator:='#';
  FieldsItogs.DelimitedText:=FieldsSumList;

  Screen.Cursor := crDefault;

end;

procedure Tf_Rep_Dbf.gridBrowseColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  Params.Text:=IntToStr(t_Browse.RecNo);
end;

procedure Tf_Rep_Dbf.acRepDbfToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridBrowse,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridBrowse,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end
end;

procedure Tf_Rep_Dbf.e_FieldFilterAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  f_db.FilterAcceptText(gridBrowse,FieldsFilter,NewText,Accept);
end;

procedure Tf_Rep_Dbf.TBItem1Click(Sender: TObject);
begin
  f_db.FilterCLear(gridBrowse,FieldsFilter);
end;

procedure Tf_Rep_Dbf.pm_gridBrowsePopup(Sender: TObject);
begin
  inherited;
  if gridBrowse.Columns[gridBrowse.Col-1].Field.FieldKind=fkLookup then
    e_FieldFilter.Enabled:=False
  else
    e_FieldFilter.Enabled:=True;
  e_FieldFilter.Text:=FieldsFilter[gridBrowse.Col-1];
end;

function Tf_Rep_Dbf.CheckValues(TypeValue:string):boolean;
var f:double;
Begin
  Result:=true;
  if AnsiUpperCase(TypeValue)='OIL_SPACE' then
  Begin
    with t_Browse do
    try
      DisableControls;
      First;
      while not Eof do
      Begin
        if (FieldByName('nomnakl').AsString='0') or (FieldByName('nomnakl').AsString='') then
        Begin
          ShowMessage('�� �������� ����� ���������!');
          Result:=false;
          break;
        end;
        try
          f:=StrToFloat(FieldByName('kod_pol_kc').AsString)
        except
          f:=0;
        end;
        if (FieldByName('kod_pol_kc').AsString='')  or (f<=0) then
        Begin
          ShowMessage('�� �������� ��� ���� ����������!');
          Result:=false;
          break;
        end;
        Next;
      End;
    finally
      EnableControls;
    end;
  End;
End;

procedure Tf_Rep_Dbf.acRepDbfSendDBFExecute(Sender: TObject);
begin
  inherited;
  if CheckValues(q_reports.FieldByName('PARAM1').AsString) then
    SendFile('DBF',true,false);
end;

function Tf_Rep_Dbf.SendFile(TypFile:string; FlagSend:boolean; IsAuto:boolean):boolean;
var SendName,FName,DBF:string;
    ListEMail:TStringList;
    AskOk:boolean;
    SendOk:boolean;
    EMail,NewEMail,s:string;
    i:integer;
    EMailDir:string;
    ZipName,FromName,ToName:string;
begin
  inherited;
  Result:=false;

  f_db.ReQuery(q_reports,true);

  if TypFile='DBF' then
  Begin
    If NOT SendDbf then exit;
    if DbfForDbf='' then exit;
    if SendDbfName='' then exit;
    if FlagSend=false then exit;
    Email:=EmailDbf;
  end
  else
    if TypFile='CSV' then
    Begin
      If NOT SendCsv then exit;
      if SendCsvName='' then exit;
      if FlagSend=false then exit;
      Email:=EmailCsv;
    end
    Else
    Begin
      If NOT (SendXls or PrepareXLS) then exit;
      Email:=EmailXLS;
    End;

  if not IsAuto and FlagSend then
  Begin
    // ��������� ������ EMail
    NewEMail:=inputbox('������ ����������� �����','������ (����� ;) :',EMail);

    // �������� ������
    if NewEMail<>EMail then
    try
      q_cmn2.Close;
      q_cmn2.SQL.Clear;
      if TypFile='DBF' then
        q_cmn2.SQL.Add('UPDATE REPORTS SET EMAIL_DBF='''+NewEMail+''' WHERE ID='+q_reports.FieldByName('ID').AsString)
      else
        if TypFile='CSV' then
          q_cmn2.SQL.Add('UPDATE REPORTS SET EMAIL_CSV='''+NewEMail+''' WHERE ID='+q_reports.FieldByName('ID').AsString)
       else
           q_cmn2.SQL.Add('UPDATE REPORTS SET EMAIL_XLS='''+NewEMail+''' WHERE ID='+q_reports.FieldByName('ID').AsString);
      q_cmn2.Execute;
      q_cmn2.SQL.Clear;
      q_cmn2.SQL.Add('COMMIT');
      q_cmn2.Execute;
      EMail:=NewEMail;
    except
    end;
  end;

  // �������� ������� ��������� �������� (���� ��� - ���������)
  // ������ ������ �������
  ListEMail:=TStringList.Create;
  ListEMail.QuoteChar:='"';
  ListEMail.Delimiter:=';';
  ListEMail.DelimitedText:=EMail;
  for i:=1 to ListEMail.Count do
    if ListEMail[i-1]<>'' then
    Begin
      if pos('@',ListEMail[i-1])<>0 then // ���� ��� ������������� - �������� �����
        EMailDir:=f_main.EMailPath+ListEMail[i-1]
      else
        EMailDir:=ListEMail[i-1];
      EMailDir:=F_FileUtils.FillFilePath(EmailDir+'\',True);
      F_FileUtils.FillFilePath(EmailDir+'\SENT\',True);
    end
    else ListEMail.Delete(i-1);

  // ����������� ����-������
  if TypFile='DBF' then
  Begin
    DBF:=f_main.TempLocalPath+ExtractFileName(DbfForDbf);
    F_FileUtils.SafeCopyFile(DbfForDbf,DBF);
    // �������� ����-������
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM '''+DBF+'''');
      q_cmn.ExecSQL;
    except
    end;
  End;

  // ����������� ����-������
  if TypFile='XLS' then
  Begin
    DBF:=f_main.TempLocalPath+ExtractFileName(DbfForXls);
    F_FileUtils.SafeCopyFile(DbfForXls,DBF);
    // �������� ����-������
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM '''+DBF+'''');
      q_cmn.ExecSQL;
    except
    end;
  End;

  // ����������� � ��������� ��� �����
  if TypFile='DBF' then
    s:=SendDbfName
  else
    if TypFile='CSV' then
      s:=SendCsvName
    else
      s:=SendXlsName;

  s:=AnsiReplaceStr(s,'%END_DATE_DD%',FormatDateTime('DD',EndDate));
  s:=AnsiReplaceStr(s,'%END_DATE_MM%',FormatDateTime('MM',EndDate));
  s:=AnsiReplaceStr(s,'%END_DATE_YY%',FormatDateTime('YY',EndDate));
  s:=AnsiReplaceStr(s,'%END_DATE_YYYY%',FormatDateTime('YYYY',EndDate));
  s:=AnsiReplaceStr(s,'%END_NEXT_DATE_DD%',FormatDateTime('DD',EndNextDate));
  s:=AnsiReplaceStr(s,'%END_NEXT_DATE_MM%',FormatDateTime('MM',EndNextDate));
  s:=AnsiReplaceStr(s,'%END_NEXT_DATE_YY%',FormatDateTime('YY',EndNextDate));
  s:=AnsiReplaceStr(s,'%END_NEXT_DATE_YYYY%',FormatDateTime('YYYY',EndNextDate));
  s:=AnsiReplaceStr(s,'%END_PREV_DATE_DD%',FormatDateTime('DD',EndPrevDate));
  s:=AnsiReplaceStr(s,'%END_PREV_DATE_MM%',FormatDateTime('MM',EndPrevDate));
  s:=AnsiReplaceStr(s,'%END_PREV_DATE_YY%',FormatDateTime('YY',EndPrevDate));
  s:=AnsiReplaceStr(s,'%END_PREV_DATE_YYYY%',FormatDateTime('YYYY',EndPrevDate));
  s:=AnsiReplaceStr(s,'%BEGIN_DATE_DD%',FormatDateTime('DD',BeginDate));
  s:=AnsiReplaceStr(s,'%BEGIN_DATE_MM%',FormatDateTime('MM',BeginDate));
  s:=AnsiReplaceStr(s,'%BEGIN_DATE_YY%',FormatDateTime('YY',BeginDate));
  s:=AnsiReplaceStr(s,'%BEGIN_DATE_YYYY%',FormatDateTime('YYYY',BeginDate));
  s:=AnsiReplaceStr(s,'%BEGIN_NEXT_DATE_DD%',FormatDateTime('DD',BeginNextDate));
  s:=AnsiReplaceStr(s,'%BEGIN_NEXT_DATE_MM%',FormatDateTime('MM',BeginNextDate));
  s:=AnsiReplaceStr(s,'%BEGIN_NEXT_DATE_YY%',FormatDateTime('YY',BeginNextDate));
  s:=AnsiReplaceStr(s,'%BEGIN_NEXT_DATE_YYYY%',FormatDateTime('YYYY',BeginNextDate));
  s:=AnsiReplaceStr(s,'%BEGIN_PREV_DATE_DD%',FormatDateTime('DD',BeginPrevDate));
  s:=AnsiReplaceStr(s,'%BEGIN_PREV_DATE_MM%',FormatDateTime('MM',BeginPrevDate));
  s:=AnsiReplaceStr(s,'%BEGIN_PREV_DATE_YY%',FormatDateTime('YY',BeginPrevDate));
  s:=AnsiReplaceStr(s,'%BEGIN_PREV_DATE_YYYY%',FormatDateTime('YYYY',BeginPrevDate));
  s:=AnsiReplaceStr(s,'%NOW_DD%',FormatDateTime('DD',Now));
  s:=AnsiReplaceStr(s,'%NOW_MM%',FormatDateTime('MM',Now));
  s:=AnsiReplaceStr(s,'%NOW_YY%',FormatDateTime('YY',Now));
  s:=AnsiReplaceStr(s,'%NOW_YYYY%',FormatDateTime('YYYY',Now));
  s:=AnsiReplaceStr(s,'%NUM_REP%',edNumRep.Text);

  if s<>'' then
  Begin
    ZipName:=s+'.ZIP';
    s:=s+'.'+TypFile;
    if not IsAuto and FlagSend then
      s:=InputBox('��������� ����','��� �����:',s);
  end;
  SendName:=s;

  AskOk:=true;
  if not IsAuto and FlagSend then
    AskOk:=(MessageDlg('��������� ���� ' + SendName + ' ��������� '+EMail+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if AskOk then
  Begin
    // ��������� ����� ������
    TempVari.SetVariNum('NUM_REP',edNumRep.Value,APPLICATION_NAME,ReportFile);

    if TypFile='DBF' then
    Begin
      if SendName<>'' then
      Begin
        // ��������� ��������� ������� ���������� (��������� DOS)
        F_DB.FillADOTable(DBFConn,t_Browse,DBF,q_reports.FieldByName('DOS_CODEPAGE').AsInteger=1,edNumRep.Value);

        SendOk:=true;
        if q_reports.FieldByName('ZIP_DBF').AsInteger=1 then // ���� ���� ���������
        Begin
          // ��������
          if not F_FileUtils.SafeCopyFile(DBF,ExtractFilePath(DBF)+SendName) then
          Begin
            ShowMessage('������ �������� ����� '+SendName+' �� ������ '+ListEMail[i-1]);
            SendOk:=false;
          End
          else
          Begin
            // ������� ����
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
          // �������� � �������� �������
          for i:=1 to ListEMail.Count do
          Begin
            if pos('@',ListEMail[i-1])<>0 then // ���� ��� ������������� - �������� �����
              EMailDir:=f_main.EMailPath+ListEMail[i-1]+'\'
            else
              EMailDir:=ListEMail[i-1]+'\';
            if not F_FileUtils.SafeCopyFile(FromName,EMailDir+ToName) then
            Begin
              ShowMessage('������ �������� ����� '+ToName+' �� ������ '+ListEMail[i-1]+' {'+EMailDir+ToName+'}');
              SendOk:=false;
            End;
          end
        end;
        // ������� �����
        try
          DeleteFile(ExtractFilePath(DBF)+SendName);
          DeleteFile(ExtractFilePath(DBF)+ZipName);
        except
        end;
      end
      else SendOk:=false;
    end
    else
      if TypFile='CSV' then
      Begin
        if SendName<>'' then
        Begin
          DBF:=f_main.TempLocalPath+SendName;
          // ��������� ��������� ������� ���������� (��������� DOS)
//          F_DB.FillCSVTable(DBFConn,t_Browse,DBF,true{true-��������� DOS, false-��������� Win},edNumRep.Value);

          SendOk:=true;
          if q_reports.FieldByName('ZIP_CSV').AsInteger=1 then // ���� ���� ���������
          Begin
            // ������� ����
            F_FileUtils.ExecAndWait('U:\MASTER\pkzipc.exe','-add '+ExtractFilePath(DBF)+ZipName+' '+ExtractFilePath(DBF)+SendName,SW_SHOWMINIMIZED,true);
            FromName:=ExtractFilePath(DBF)+ZipName;
            ToName:=ZipName;
          end
          else
          Begin
            FromName:=DBF;
            ToName:=SendName;
          End;

          if SendOk then
          Begin
            // �������� � �������� �������
            for i:=1 to ListEMail.Count do
            Begin
              if pos('@',ListEMail[i-1])<>0 then // ���� ��� ������������� - �������� �����
                EMailDir:=f_main.EMailPath+ListEMail[i-1]+'\'
              else
                EMailDir:=ListEMail[i-1]+'\';
              if not F_FileUtils.SafeCopyFile(FromName,EMailDir+ToName) then
              Begin
                ShowMessage('������ �������� ����� '+ToName+' �� ������ '+ListEMail[i-1]);
                SendOk:=false;
              End;
            end
          end;
          // ������� �����
          try
            DeleteFile(ExtractFilePath(DBF)+SendName);
            DeleteFile(ExtractFilePath(DBF)+ZipName);
          except
          end;
        end
        else SendOk:=false;
      end
      else
        if TypFile='XLS' then
        Begin
          // ��������� ��������� ������� ���������� (��������� Windows)
          F_DB.FillADOTable(DBFConn,t_Browse,DBF,false,edNumRep.Value);

          // �������������� ���������
          if FlagSend then TempVari.SetVariNum('EMAIL_COUNT',ListEMail.Count,APPLICATION_NAME,ReportFile)
          else TempVari.SetVariNum('EMAIL_COUNT',0,APPLICATION_NAME,ReportFile);
          for i:=1 to ListEMail.Count do
          Begin
            TempVari.SetVariChar('EMAIL'+IntToStr(i),ListEMail[i-1],APPLICATION_NAME,ReportFile);
          end;
          TempVari.SetVariChar('SEND_XLS_NAME',SendName,APPLICATION_NAME,ReportFile);
          TempVari.SetVariChar('ARCHIVE',Archive,APPLICATION_NAME,ReportFile);
          TempVari.SetVariNum('SEND_OK',1,APPLICATION_NAME,ReportFile);

          // ��������� Excel
          F_FileUtils.SafeCopyFile(f_main.MasterXLSPath+RepFileName,f_main.TempNetPath+ReportFile);
          if q_reports.FieldByName('COPY_FILE').AsString<>'' then
          begin
            FName:=ExtractFileName(q_reports.FieldByName('COPY_FILE').AsString);
            F_FileUtils.SafeCopyFile(q_reports.FieldByName('COPY_FILE').AsString,f_main.TempNetPath+FName);
          end;

          try
            F_FileUtils.ExecAndWait(f_main.TempNetPath+ReportFile,'',SW_SHOWMAXIMIZED,FlagSend);
          except
          end;

          // ��������� ���� �������� ��������
          SendOk:=(TempVari.GetAsNum('SEND_OK',APPLICATION_NAME,ReportFile)=1);

        End;
  end
  else FlagSend:=false;

  if not IsAuto and FlagSend then
  Begin
    if SendOk then
      ShowMessage('����(�) ���������(�) �������!')
    else
      ShowMessage('��� �������� �����(��) ���� ������!');
  end;

  if FlagSend then
  Begin
    If (TypFile='DBF') OR (TypFile='CSV') then
    Begin
      // �������� ���� � �����
      If Archive<>'' then
      Begin
        F_FileUtils.SafeCopyFile(DBF,Archive+FormatDateTime('YY_MM_DD_HH_NN_',Now)+SendName);
      end;
    end;
  end;

  // ��������� ����� ������
  FOR_REPORTS.CallProcedure('SetNumRep',[q_reports.FieldByName('ID').AsInteger,BeginDate,EndDate,IS_CRT,edNumRep.Value]);

  ListEMail.Clear;
  ListEMail.Free;
End;


procedure Tf_Rep_Dbf.acRepDbfSendXLSExecute(Sender: TObject);
begin
  inherited;
  SendFile('XLS',true,false);
end;

procedure Tf_Rep_Dbf.acRepDbfPrepareXLSExecute(Sender: TObject);
begin
  inherited;
  SendFile('XLS',false,false);
end;

procedure Tf_Rep_Dbf.sbRefreshClick(Sender: TObject);
begin
  inherited;
//  f_db.ReQueryADO(q_Browse,true);
  t_Browse.Close;
  t_Browse.Open;
end;

procedure Tf_Rep_Dbf.q_reportsAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  Caption:=q_reports.FieldByName('REPORT_TITLE').AsString;
  RepFileName:=AnsiUpperCase(Trim(q_reports.FieldByName('REPORT_FILE').AsString));
  SqlSource:=AnsiUpperCase(Trim(q_reports.FieldByName('SQL_SOURCE').AsString));
  FieldsNameList:=AnsiUpperCase(Trim(q_reports.FieldByName('FIELDS_NAME').AsString));
  FieldsSumList:=AnsiUpperCase(Trim(q_reports.FieldByName('FIELDS_SUM').AsString));
  DbfForDbf:=q_reports.FieldByName('DBF_FOR_DBF').AsString;
  DbfForXls:=q_reports.FieldByName('DBF_FOR_XLS').AsString;
  ReportFile:=q_reports.FieldByName('REPORT_FILE').AsString;
  Archive:=F_FileUtils.FillFilePath(q_reports.FieldByName('ARCHIVE').AsString,True);
  SendDBF:=(q_reports.FieldByName('SEND_DBF').AsInteger=1);
  SendCSV:=(q_reports.FieldByName('SEND_CSV').AsInteger=1);
  SendXLS:=(q_reports.FieldByName('SEND_XLS').AsInteger=1);
  PrepareXLS:=(q_reports.FieldByName('PREPARE_XLS').AsInteger=1);
  EmailDbf:=q_reports.FieldByName('EMAIL_DBF').AsString;
  EmailCSV:=q_reports.FieldByName('EMAIL_CSV').AsString;
  EmailXls:=q_reports.FieldByName('EMAIL_XLS').AsString;
  SendDbfName:=ExtractFileName(AnsiUpperCase(Trim(q_reports.FieldByName('SEND_DBF_NAME').AsString)));
  i:=Pos('.',SendDbfName);
  if i>0 then SendDbfName:=System.Copy(SendDbfName,1,i-1); // ������� ����������
  SendXlsName:=ExtractFileName(AnsiUpperCase(Trim(q_reports.FieldByName('SEND_XLS_NAME').AsString)));
  i:=Pos('.',SendXlsName);
  if i>0 then SendXlsName:=System.Copy(SendXlsName,1,i-1); // ������� ����������
  SendCSVName:=ExtractFileName(AnsiUpperCase(Trim(q_reports.FieldByName('SEND_CSV_NAME').AsString)));
  i:=Pos('.',SendCSVName);
  if i>0 then SendCSVName:=System.Copy(SendCSVName,1,i-1); // ������� ����������
  tbPrepareXLS.Enabled:=PrepareXLS;
  tbSendXLS.Enabled:=SendXLS;
  tbSendDBF.Enabled:=SendDBF;
  tbSendCSV.Enabled:=SendCSV;
end;

procedure Tf_Rep_Dbf.tbiItogsClick(Sender: TObject);
var j,i:integer;zpt,s:string;
begin
  inherited;
  with TF_Rep_Dbf_Itogs.Create(Self) do
  Begin
    ListTitles:=FieldsTitles;
    if IsFirst then
    Begin
      if Pos ('#', FieldsSumList) =0 then exit;
      ListItogs:=FieldsItogs;
    End
    Else
    Begin
      ListItogs:=TStringList.Create;
      ListItogs.Clear;
      ListItogs.QuoteChar:='"';
      ListItogs.Delimiter:=';';
      ListItogs.NameValueSeparator:='#';
      with Tf_Rep_Dbf_Grp.Create(Self) do
      Begin
        Grp1.Items:=FieldsAllList;
        Grp2.Items:=FieldsAllList;
        Grp3.Items:=FieldsAllList;
        ShowModal;
        if ModalResult=mrOk then
        Begin
          // �������� ������ ��� ���� "������������� �����"
          s:='';
          zpt:='';
          if Grp1.ItemIndex>=0 then
          begin
            i:=Grp1.ItemIndex;
            s:=s+zpt+t_Browse.Fields[i].FieldName;
            zpt:=',';
          end;
          if Grp2.ItemIndex>=0 then
          begin
            i:=Grp2.ItemIndex;
            s:=s+zpt+t_Browse.Fields[i].FieldName;
            zpt:=',';
          end;
          if Grp3.ItemIndex>=0 then
          begin
            i:=Grp3.ItemIndex;
            s:=s+zpt+t_Browse.Fields[i].FieldName;
            zpt:=',';
          end;
          // ����������� ����
          j:=0;
          for i:=1 to FieldsItogs.Count do
          Begin
            if FieldsItogs.ValueFromIndex[I-1]<>'' then begin j:=i;break; end;
          end;
          if j=0 then
          Begin
            if FieldsItogs.Count>1 then
              ListItogs.Add(s+'#'+FieldsItogs[0])
          end
          else ListItogs.Add(s+'#'+FieldsItogs.ValueFromIndex[j-1])
        End;
      End;
    end;

    FileDBF:=TempDBF;
    q_data:=q_cmn;

    if ListItogs<>nil then
    for I := 0 to ListItogs.Count - 1 do
      if Pos ('#', ListItogs[I]) > 1 then
      Begin
        ShowModal;
        break;
      end;

    If not IsFirst then
    try
      ListItogs.Clear;
      ListItogs.Free;
    except
    end;
    Free;
  End;
end;

procedure Tf_Rep_Dbf.FormActivate(Sender: TObject);
begin
  If IsFirst then
  begin
    Timer1.Enabled:=True;
    if not ReportAuto then tbiItogsClick(Sender);
  end;
  IsFirst:=false;
end;

procedure Tf_Rep_Dbf.FormCreate(Sender: TObject);
begin
  inherited;
  IsFirst:=true;
end;

procedure Tf_Rep_Dbf.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:=False;
  if ReportAuto then
  begin
    if ReportType='DBF' then
    Begin
      SendFile('DBF',true,true);
    End;
    if ReportType='CSV' then
    Begin
      SendFile('CSV',true,true);
    End;
    if ReportType='XLS' then
    Begin
      SendFile('XLS',true,true);
    End;
    Close;
  end;
end;

procedure Tf_Rep_Dbf.gridBrowseGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if Column.Field<>nil then
  if Column.Field.DataType in [ftDate,ftTime,ftDateTime] then
  if Column.Field.AsDateTime=0 then
  Begin
    AFont.Color:=Background
  end;

end;

procedure Tf_Rep_Dbf.t_BrowseFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridBrowse,FieldsFilter);
end;

procedure Tf_Rep_Dbf.TBItem3Click(Sender: TObject);
begin
  inherited;
  f_db.FilterCurrentValue(gridBrowse,FieldsFilter);
end;

procedure Tf_Rep_Dbf.acRepDbfSendCSVExecute(Sender: TObject);
begin
  inherited;
  if CheckValues(q_reports.FieldByName('PARAM1').AsString) then
    SendFile('CSV',true,false);
end;

end.