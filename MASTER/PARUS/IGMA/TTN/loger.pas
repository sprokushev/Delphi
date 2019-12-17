unit loger;

interface

procedure InitLogFile(f: string);
procedure WriteToLog(s: string);
procedure WriteToLogStay(s: string);

implementation

uses SysUtils;
var
logFile: textFile;


procedure InitLogFile(f: string);
var
ff: integer;
begin
  if not FileExists(f) then begin
    ff := FileCreate(f);
    FileClose(ff);
  end;
  AssignFile(logFile, f);
  Rewrite(logFile);
  CloseFile(logFile);
end;

procedure WriteToLog(s: string);
var
t: TDateTime;
begin
  t := GetTime;
  Append(logFile);
  Writeln(logFile, TimeToStr(t) + ': ' + s);
  CloseFile(logFile);
end;

procedure WriteToLogStay(s: string);
var
t: TDateTime;
begin
  t := GetTime;
  Append(logFile);
  Write(logFile, TimeToStr(t) + ': ' + s);
  CloseFile(logFile);
end;


end.
 