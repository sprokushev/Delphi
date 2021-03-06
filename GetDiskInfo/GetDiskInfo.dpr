program GetDiskInfo;

{$APPTYPE CONSOLE}
{ ������� ��������� ������ }

uses
  ExceptionLog,
  SysUtils;

var
  freeSpace, totalSpace: int64;
  s,s1: string;
  i:integer;



{ ����� ������ }
Procedure DoHelp(Mes:string);
var F:Text;
    Code,St:string;
Begin
  If Mes<>'' Then
  Begin
    WriteLn('******************************************************************************');
    WriteLn('ERROR!!! '+Mes);
    WriteLn('******************************************************************************');
  End;
  WriteLn('Command line parameters:');
  WriteLn('GetDiskInfo [/?] Disk');
  WriteLn('   /?         - help');
  WriteLn('   Disk     - C:, D:, ...');
  WriteLn;
  Halt;
End;

begin
  If ParamCount=0 Then DoHelp('');

  For i:=1 To ParamCount Do
  Begin
    If (ParamStr(i)='/?') Then DoHelp('');
  End;
  If ParamCount<1 Then DoHelp('Not enough parameters');

  s := ParamStr(1);

  i:=Ord(s[1]) - 64;
  freeSpace  := DiskFree(i);
  totalSpace := DiskSize(i);

  WriteLn('Disk ' + s + ' total space (Gb): '+IntToStr(TotalSpace div (1024*1024*1024)));
  WriteLn('Disk ' + s + ' free space (Gb): '+IntToStr(FreeSpace div (1024*1024*1024)));
end.

