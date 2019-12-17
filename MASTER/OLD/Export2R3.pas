unit Export2R3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DateUtils, StdCtrls, Mask, DBCtrlsEh, Grids, DBGridEhImpExp, DBGridEh,
  ActnList, DB, XPStyleActnCtrls, ActnMan, OracleData, ToolWin, ActnCtrls,
  ExtCtrls, Oracle, ComCtrls, RxShell, MDIForm;

type
  Tf_Export2R3 = class(Tf_MDIForm)
    DBGridEh1: TDBGridEh;
    qNewKvit: TOracleDataSet;
    amR3: TActionManager;
    dsSource: TDataSource;
    SaveDialog: TSaveDialog;
    acExportTo: TAction;
    ActionToolBar1: TActionToolBar;
    acRefresh: TAction;
    Panel1: TPanel;
    edBegin: TDBDateTimeEditEh;
    edEnd: TDBDateTimeEditEh;
    cbUpload: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    acClose: TAction;
    qPasp: TOracleDataSet;
    qSF: TOracleDataSet;
    acImportRaznar: TAction;
    pkgFOR_R3: TOraclePackage;
    sb1: TStatusBar;
    ora_Session: TOracleSession;
    OpenDlg: TOpenDialog;
    acImportRC: TAction;
    qDeblok: TOracleDataSet;
    Label4: TLabel;
    edNumCist: TEdit;
    qNoRaznar: TOracleDataSet;
    qNoBills: TOracleDataSet;
    qDelKvit: TOracleDataSet;
    acDelID_SAP: TAction;
    qSutRazn: TOracleDataSet;
    procedure acExportToExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure cbUploadChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acImportRaznarExecute(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure acImportRCExecute(Sender: TObject);
    procedure acDelID_SAPExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    PrefixFile:string;
    Fieldves:string;
  public
    { Public declarations }
  end;

var
  f_Export2R3: Tf_Export2R3;

implementation

{$R *.dfm}
uses main,ForSESS,ForDB, ForFiles, Funcs, ForSystem;
const COLUMN_CNT_OD=38;//Количество колонок в файле OD
const COLUMN_CNT_RC=4;//Количество колонок в файле RC

procedure Tf_Export2R3.acExportToExecute(Sender: TObject);
var ExpClass:TDBGridEhExportClass;
    Ext:String;
  BoxOutDir,SendName,TmpFile:string;
  SendOk:boolean;
  NumFile:string;
begin
  if not dsSource.DataSet.Active then acRefreshExecute(Sender);

  BoxOutDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('SAP_BOX_IN'),false));
  SaveDialog.InitialDir:=BoxOutDir;
  SaveDialog.FilterIndex:=5;
  //Определим № файла
  try
    NumFile:=IntToStr(pkgFOR_R3.CallIntegerFunction('GET_SEQ_OF',[]));
  except
    NumFile:='0';
  End;
  SaveDialog.Filename:=PrefixFile+'0005_'+Funcs.PADL(NumFile,8)+'.XLS';

  ExpClass := nil;
  Ext := '';

  if SaveDialog.Execute then
  Begin
    BoxOutDir:=ExtractFilePath(SaveDialog.FileName);
    F_main.SetApplVari('SAP_BOX_IN',BoxOutDir);
    BoxOutDir:=F_FileUtils.FillFilePath(BoxOutDir+'\',True);
//    F_FileUtils.FillFilePath(BoxOutDir+'\SEND\',True);

    try
      case SaveDialog.FilterIndex of
        1: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
        2: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
        3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
        4: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        5: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls';end
        else begin ExpClass := nil; Ext := '';end
      end
    except
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog.FileName,Length(SaveDialog.FileName)-2,3)) <>UpperCase(Ext) then
          SaveDialog.FileName := SaveDialog.FileName + '.' + Ext;
      SaveDBGridEhToExportFile(ExpClass,DBGridEh1,SaveDialog.FileName,True);
      ShowMessage('Сформирован файл '+SaveDialog.Filename);
{      if Application.MessageBox('Очистить № поставок SAP R/3 для удаляемой отгрузки?','Внимание!',MB_YESNO)=IDYES then
      Begin
      End;}
      FileExecute(SaveDialog.FileName,'','',esMaximized);
    end;
  end;
end;

procedure Tf_Export2R3.acRefreshExecute(Sender: TObject);
var SumVes:double;
begin
  cbUploadChange(Sender);
  dsSource.DataSet.Close;
  dsSource.DataSet.Open;
  try
    F_main.SetApplVari('SAP_OF_BEGIN_DATE',DateToStr(edBegin.Value));
  except
  end;
  try
    F_main.SetApplVari('SAP_OF_END_DATE',DateToStr(edEnd.Value));
  except
  end;

  if FieldVes<>'' then
  Begin
    with TOracleDataSet(dsSource.DataSet) do
    try
      First;
      DisableControls;
      SumVes:=0;
      while not eof do
      Begin
        SumVes:=SumVes+FieldByName(FieldVes).AsFloat;
        Next;
      end;
      First;
    finally
      EnableControls;
    end;
    ShowMessage('Записей: '+FloatToStr(dsSource.DataSet.RecordCount)+', вес: '+FloatToStr(SumVes));
  end;
end;

procedure Tf_Export2R3.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure Tf_Export2R3.cbUploadChange(Sender: TObject);
begin
  case cbUpload.ItemIndex of
    0:begin
        qNoRaznar.Close;
        qNoRaznar.SetVariable('BegDate',edBegin.Value);
        qNoRaznar.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qNoRaznar.SQL[14]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qNoRaznar.SQL[14]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qNoRaznar;
        PrefixFile:='';
        FieldVes:='VES_BRUTTO';
      end;
    1:begin
        qNoBills.Close;
        qNoBills.SetVariable('BegDate',edBegin.Value);
        qNoBills.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qNoBills.SQL[14]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qNoBills.SQL[14]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qNoBills;
        PrefixFile:='';
        FieldVes:='VES_BRUTTO';
      end;
    2:begin
        qSutRazn.Close;
        qSutRazn.SetVariable('BegDate',edBegin.Value);
        qSutRazn.SetVariable('EndDate',edEnd.Value);
        dsSource.DataSet:=qSutRazn;
        PrefixFile:='';
        FieldVes:='';
      end;
    3:begin
        qNewKvit.Close;
        qNewKvit.SetVariable('BegDate',edBegin.Value);
        qNewKvit.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qNewKvit.SQL[51]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qNewKvit.SQL[51]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qNewKvit;
        PrefixFile:='OF';
        FieldVes:='LFIMG';
      end;
    4:begin
        qPasp.Close;
        qPasp.SetVariable('BegDate',edBegin.Value);
        qPasp.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qPasp.SQL[7]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
          qPasp.SQL[14]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
          qPasp.SQL[22]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
          qPasp.SQL[36]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qPasp.SQL[7]:='and kvit.NUM_CIST LIKE ''%''';
          qPasp.SQL[14]:='and kvit.NUM_CIST LIKE ''%''';
          qPasp.SQL[22]:='and kvit.NUM_CIST LIKE ''%''';
          qPasp.SQL[36]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qPasp;
        PrefixFile:='QQ';
        FieldVes:='';
      end;
    5:begin
        qDeblok.Close;
        qDeblok.SetVariable('BegDate',edBegin.Value);
        qDeblok.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qDeblok.SQL[51]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qDeblok.SQL[51]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qDeblok;
        PrefixFile:='OF';
        FieldVes:='LFIMG';
      end;
    6:begin
        qDelKvit.Close;
        qDelKvit.SetVariable('BegDate',edBegin.Value);
        qDelKvit.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qDelKvit.SQL[51]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qDelKvit.SQL[51]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qDelKvit;
        PrefixFile:='OF';
        FieldVes:='LFIMG';
      end;
    7:begin
        qSF.Close;
        qSF.SetVariable('BegDate',edBegin.Value);
        qSF.SetVariable('EndDate',edEnd.Value);
        if edNumCist.Text<>'' then
        Begin
          qSF.SQL[18]:='and kvit.NUM_CIST LIKE '''+edNumCist.Text+'%''';
        End
        else
        Begin
          qSF.SQL[18]:='and kvit.NUM_CIST LIKE ''%''';
        End;
        dsSource.DataSet:=qSF;
        PrefixFile:='OS';
        FieldVes:='LFIMG';
      end;
  end;
end;

procedure Tf_Export2R3.FormActivate(Sender: TObject);
begin
  try
    edBegin.Value:=DateOf(StrToDate(F_main.GetApplVari('SAP_OF_BEGIN_DATE')));
  except
    edBegin.Value:=DateOf(Now);
  end;
  try
    edEnd.Value:=DateOf(StrToDate(F_main.GetApplVari('SAP_OF_END_DATE')));
  except
    edEnd.Value:=dateOf(Now);
  end;
  f_db.LogonMasterSession(ora_Session);
  cbUploadChange(Sender);
end;

procedure Tf_Export2R3.acImportRaznarExecute(Sender: TObject);
var
  raznar_txt:TextFile;//текстовый файл с выгруженными из  SAP разнарядками
  raznar_ln :string;//строка из файла
//  pId       :string;
  columns   :array [1..COLUMN_CNT_OD] of String;//массив под значениея колонок
  ln_length :integer;//длина считанной строки разнарядки
  i,j       :integer;
  record_cnt:integer;//количество загруженных записей
  BoxInDir,ReceiveName,TmpFile:string;
  ReceiveOk:boolean;
begin
  BoxInDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('SAP_BOX_OUT'),false));
  OpenDlg.InitialDir:=BoxInDir;
  OpenDlg.Filter:='Файлы разнарядок|OD*.INF';
  OpenDlg.Filename:='OD*.INF';
  if OpenDlg.Execute then
  Begin
    BoxInDir:=ExtractFilePath(OpenDlg.FileName);
    F_main.SetApplVari('SAP_BOX_OUT',BoxInDir);
    BoxInDir:=F_FileUtils.FillFilePath(BoxInDir+'\',True);
    F_FileUtils.FillFilePath(BoxInDir+'\ARCHIVE\',True);

    ReceiveName:=AnsiUpperCase(ExtractFileName(OpenDlg.FileName));
    if not FileExists(BoxInDir+ReceiveName) then
    begin
      ShowMessage('Файл '+ReceiveName+' с ежесуточными разнарядками отсутствует в каталоге приема!');
      exit;
    end;

    ReceiveOk:=false;
    try
      // Скопировать полученный файл
      TmpFile:=f_main.TempLocalPath+ReceiveName;
      F_FileUtils.SafeCopyFile(BoxInDir+ReceiveName,TmpFile);

      // Загрузить
      AssignFile(raznar_txt,TmpFile);
      Reset(raznar_txt);
      try
        {работа с текстовиком}
        //ReadLN(raznar_txt,raznar_ln);//считаем первую строку с заголовком
        //обработка файла
        while not Eof(raznar_txt) do
        begin
          ReadLN(raznar_txt,raznar_ln);
          ln_length:=length(raznar_ln);
          j:=1; //счетчик колонок
          //разбиение слов по колонкам
          for i:=1 to ln_length do
          Begin
            if raznar_ln[i]<>#9 then columns[j]:=columns[j]+raznar_ln[i]
            else j:=j+1;
          end;
          inc(record_cnt);

          //внесем записи в Oracle
          try
            pkgFOR_R3.CallProcedure('AddVbakRow',[1,columns[1],columns[2],columns[3],columns[4],columns[5],
              columns[6],columns[7],columns[8],columns[9],columns[10],columns[11],columns[12],columns[13],columns[14],
              columns[15],columns[16],columns[17],columns[18],columns[19],columns[20],columns[21],columns[22],columns[23],
              columns[24],columns[25],columns[26],columns[27],columns[28],columns[29],columns[30],columns[31],columns[32],
              columns[33],columns[34],columns[35],columns[36],columns[37],columns[38]]);
          except
            on E: Exception do
            Begin
              // Отобразим ошибку
              f_main.ApplSession.WriteToLog(amFull,'Export2R3',sesError,E.Message,0,'');
              ora_Session.Rollback;
              exit;
            end;
          End;
          //очистка массива под след. строку
          for i:=1 to COLUMN_CNT_OD do columns[i]:='';
        end;
        sb1.SimpleText:='Загружено '+IntToStr(record_cnt)+' записей';
        ReceiveOk:=true;
        // Переносим в архив
        F_FileUtils.SafeCopyFile(TmpFile,BoxInDir+'\ARCHIVE\'+FormatDateTime('YY_MM_DD_HH_NN_',Now)+ReceiveName);
        // удаляем полученный файл
        DeleteFile(BoxInDir+ReceiveName);
        // удаляем временный файл
        DeleteFile(TmpFile);
        ShowMessage('Файл загружен успешно!');
      finally
        CloseFile(raznar_txt);
        ora_Session.Commit;
      end;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

procedure Tf_Export2R3.DBGridEh1Enter(Sender: TObject);
begin
  sb1.SimpleText:='';
end;

procedure Tf_Export2R3.acImportRCExecute(Sender: TObject);
var
  rc_txt:TextFile;//текстовый файл с выгруженными из  SAP соответствиями поставок
  rc_ln :string;//строка из файла
  columns   :array [1..COLUMN_CNT_RC] of String;//массив под значениея колонок
  ln_length :integer;//длина считанной строки разнарядки
  i,j       :integer;
  record_cnt:integer;//количество загруженных записей
  BoxInDir,ReceiveName,TmpFile:string;
  ReceiveOk:boolean;
begin
  BoxInDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('SAP_BOX_OUT'),false));
  OpenDlg.InitialDir:=BoxInDir;
  OpenDlg.Filter:='Файлы соответствия поставок|RC*.TXT';
  OpenDlg.Filename:='RC*.TXT';
  if OpenDlg.Execute then
  Begin
    BoxInDir:=ExtractFilePath(OpenDlg.FileName);
    F_main.SetApplVari('SAP_BOX_OUT',BoxInDir);
    BoxInDir:=F_FileUtils.FillFilePath(BoxInDir+'\',True);
    F_FileUtils.FillFilePath(BoxInDir+'\ARCHIVE\',True);

    ReceiveName:=AnsiUpperCase(ExtractFileName(OpenDlg.FileName));
    if not FileExists(BoxInDir+ReceiveName) then
    begin
      ShowMessage('Файл '+ReceiveName+' с соответствиями поставок отсутствует в каталоге приема!');
      exit;
    end;

    ReceiveOk:=false;
    try
      // Скопировать полученный файл
      TmpFile:=f_main.TempLocalPath+ReceiveName;
      F_FileUtils.SafeCopyFile(BoxInDir+ReceiveName,TmpFile);

      // Загрузить
      AssignFile(rc_txt,TmpFile);
      Reset(rc_txt);
      try
        {работа с текстовиком}
        ReadLN(rc_txt,rc_ln);//считаем первую строку с заголовком
        //обработка файла
        while not Eof(rc_txt) do
        begin
          ReadLN(rc_txt,rc_ln);
          ln_length:=length(rc_ln);
          j:=1; //счетчик колонок
          //разбиение слов по колонкам
          for i:=1 to ln_length do
          Begin
            if rc_ln[i]<>#9 then columns[j]:=columns[j]+rc_ln[i]
            else j:=j+1;
          end;
          inc(record_cnt);

          //внесем записи в Oracle
          try
            pkgFOR_R3.CallProcedure('AddRCRow',[1,columns[1],columns[2],columns[3],columns[4]]);
          except
            on E: Exception do
            Begin
              // Отобразим ошибку
              f_main.ApplSession.WriteToLog(amFull,'Export2R3',sesError,E.Message,0,'');
              ora_Session.Rollback;
              exit;
            end;
          End;
          //очистка массива под след. строку
          for i:=1 to COLUMN_CNT_RC do columns[i]:='';
        end;
        sb1.SimpleText:='Загружено '+IntToStr(record_cnt)+' записей';
        ReceiveOk:=true;
        // Переносим в архив
        F_FileUtils.SafeCopyFile(TmpFile,BoxInDir+'\ARCHIVE\'+FormatDateTime('YY_MM_DD_HH_NN_',Now)+ReceiveName);
        // удаляем полученный файл
        DeleteFile(BoxInDir+ReceiveName);
        // удаляем временный файл
        DeleteFile(TmpFile);
        ShowMessage('Файл загружен успешно!');
      finally
        CloseFile(rc_txt);
        ora_Session.Commit;
      end;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

procedure Tf_Export2R3.acDelID_SAPExecute(Sender: TObject);
begin
  if Application.MessageBox(PChar('Очистить № поставки SAP R/3 '+qDelKvit.FieldByName('ID_SAP').AsString+' у вагона '+qDelKvit.FieldByName('TRAID').AsString+' ?'),'Внимание!',MB_YESNO)=IDYES then
  Begin
    try
      pkgFOR_R3.CallProcedure('DelRCRow',[1,qDelKvit.FieldByName('ID_SAP').AsString]);
    except
      on E: Exception do
      Begin
        // Отобразим ошибку
        f_main.ApplSession.WriteToLog(amFull,'Export2R3',sesError,E.Message,0,'');
        ora_Session.Rollback;
        exit;
      end;
    End;
  End;
end;

procedure Tf_Export2R3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
