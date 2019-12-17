unit ForFiles;

// Набор методов для работы с файлами

interface

uses Windows,Classes,Forms,SysUtils,ComObj,variants;

type
  TMasterFileUtils = class(TObject)
  public
    { Запустить приложение }
    function ExecAndWait(const FileName, Params: ShortString; const WinState: Word;IsWait:boolean): boolean; export;
    { Дополнить маршрут к файлу и проверить его существование; если нет - создать}
    function FillFilePath(f_name:string; IsCheck:boolean):string;
    { Копирование файла }
    function SafeCopyFile(FromF:string; ToF:string):boolean;
    { Подготовка отчета - возвращает путь к файлу отчета
      По расширению определяется тип отчета (XLS, RPT)
      Проверяется, не изменился ли файл отчета
      Копируется в файл с новым именем new_name }
    function CheckReport(fname:string;new_name:string):string;
    { Открытие Excel }
    procedure OpenWorkbook(StrPath:string);overload;
    procedure OpenWorkbook(StrPath:string;Arg:OleVariant);overload;
    procedure OpenWorkbook(StrPath,Macro:string;Arg:OleVariant);overload;
    procedure OpenWorkbook(StrPath,Macro:string;Arg1,Arg2:OleVariant);overload;

  published
  end;

var
  F_FileUtils: TMasterFileUtils;

implementation

uses ShellApi,ForSystem, main;

{ Запустить приложение }
function TMasterFileUtils.ExecAndWait(const FileName, Params: ShortString; const WinState: Word;IsWait:boolean): boolean; export;
var
  StartInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: String;
  sExt:string;
  vExitCode:dword;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(StartInfo, SizeOf(StartInfo), #0);
  with StartInfo do
  begin
    cb := SizeOf(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  sExt:=UpperCase(Copy(Trim(FileName),length(FileName)-3,4));
  If (sExt='.EXE') OR (sExt='.BAT') OR (sExt='.CMD') Then
  Begin
//    Application.MessageBox(PChar(String(CmdLine)),'Внимание!',MB_OK);
    Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo);
    { Ожидаем завершения приложения }
    if Result AND IsWait then
    begin
      WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcInfo.hProcess,vExitCode);
      Result:=(vExitCode=0);
      { Free the Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
  End
  Else
  Begin
    ShellExecute(Application.Handle,'open',PChar( String( '"'+Filename+'"') ),PChar(String(Params)),PChar(ExtractFilePath(String(Filename))),WinState);
    Result:=true;
  end;
end;

{ Дополнить маршрут к файлу }
function TMasterFileUtils.FillFilePath(f_name:string; IsCheck:boolean):string;
var i:integer;
Begin
  if f_name='' then
    Result:=''
  else
  Begin
    { Подставить имя пользователя }
    i:=Pos('%USERNAME%',AnsiUpperCase(f_name));
    If i>0 Then
    Begin
      System.Delete(f_name,i,10);
      System.Insert(F_ForSystem.GetUserName(True),f_name,i);
    End;
    if f_name[Length(f_name)]<>'\' then f_name:=f_name+'\';
    If IsCheck Then
    Begin
      {Проверить наличие и создать каталог}
      CreateDir(f_name);
    End;
    Result:=f_name;
  end;
End;

{ Копирование файла }
function TMasterFileUtils.SafeCopyFile(FromF:string ;ToF:string):boolean;
var
  f1,f2:String[255];
Begin
  f1:=FromF+#0;
  f2:=ToF+#0;
  Result:=Windows.COPYFILE(@f1[1],@f2[1],False);
End;

{ Подготовка отчета - возвращает путь к файлу отчета
  По расширению определяется тип отчета (XLS, RPT)
  Проверяется, не изменился ли файл отчета
  Копируется в файл с новым именем new_name }
function TMasterFileUtils.CheckReport(fname:string;new_name:string):string;
var
  SrcName,DstName,RepFileExt,SrcPath,DstPath:String;
  SRS,SRD:TSearchRec;
Begin
  SrcName:=ExtractFileName(AnsiUpperCase(Trim(fname)));
  RepFileExt:=ExtractFileExt(SrcName);
  DstName:=ExtractFileName(AnsiUpperCase(Trim(new_name)));
  if DstName='' then DstName:=SrcName;
  DstPath:=ExtractFilePath(AnsiUpperCase(Trim(new_name)));
  if DstPath='' then DstPath:=ExtractFilePath(AnsiUpperCase(ParamStr(0)));

  If RepFileExt='.RPT' Then
    SrcPath:=f_main.MasterRPTPath
  else
    If RepFileExt='.XLS' Then
      SrcPath:=f_main.MasterXLSPath
    else
    Begin
      CheckReport:=fname;
      exit;
    end;

  if FindFirst(SrcPath+SrcName,faAnyFile,SRS)=0 then
  begin
    if (FindFirst(DstPath+DstName,faAnyFile,SRD)<>0) or
       (SRS.Time<>SRD.Time) or
       (SRS.Size<>SRD.Size) then
    begin
      SafeCopyFile(SrcPath+SrcName,DstPath+DstName);
    end;
    FindClose(SRD);
  end;
  FindClose(SRS);
  CheckReport:=DstPath+DstName;
End;

{ Открытие Excel }
procedure TMasterFileUtils.OpenWorkbook(StrPath:string);
var
  ExcelApp:variant;
begin
  // открытие Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // Запуск макроса
  try
    ExcelApp.Run('OpenPrintSved');
  except
  end;
  //Освобождение переменной
  ExcelApp := UnAssigned;
end;

{ Открытие Excel }
procedure TMasterFileUtils.OpenWorkbook(StrPath:string;Arg:OleVariant);
var
  ExcelApp:variant;
begin
  // открытие Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // Запуск макроса
  try
    ExcelApp.Run('OpenPrintSved',Arg);
  except
  end;
  //Освобождение переменной
  ExcelApp := UnAssigned;
end;

//Перегруженная функция для вызова различных макросов, а не только OpenPrintSved
//arg - аргумент макроса, id накладной
procedure TMasterFileUtils.OpenWorkbook(StrPath,Macro:string;Arg:OleVariant);
var
  ExcelApp:variant;
begin
  // открытие Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // Запуск макроса
  try
    ExcelApp.Run(Macro,Arg);
  except
  end;
  //Освобождение переменной
  ExcelApp := UnAssigned;
end;
//Перегруженная функция для вызова различных макросов c двумя аргументами
//arg1,arg2 - аргументы макроса, arg1 - id накладной,
//так как шаблон 1, то надо как-то различать какую накладную печатать,
//arg2=1 - накладная на возврат,arg2=0 - обычная накладная
procedure TMasterFileUtils.OpenWorkbook(StrPath,Macro:string;Arg1,Arg2:OleVariant);
var
  ExcelApp:variant;
begin
  // открытие Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Workbooks.Open(StrPath);
  ExcelApp.Visible:=true;
  // Запуск макроса
  try
    ExcelApp.Run(Macro,Arg1,Arg2);
  except
  end;
  //Освобождение переменной
  ExcelApp := UnAssigned;
end;
end.
