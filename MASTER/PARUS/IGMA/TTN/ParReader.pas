unit ParReader;
//Юнит для чтения файла с параметрами
interface
uses strutils, classes;

procedure SalGetProfileString(razdel, parName: string; var result: string; fileName: string); overload;
function FindParameter(fileName: string; parName: string): string;
function GetIntegerParameter(fileName:string; parName:string): integer;
function GetStringParameter(fileName:string; parName:string):string;
procedure SalStrTokenize( str: string; ch: string; var aArr: array of string);
function GetCountToken(s, t: string): integer;
function GetMultiEndingOfHG(header: string; FileName: string): TStrings;

implementation

uses SysUtils;

//определяет, есть ли этот параметр в файле
function FindParameter(fileName:string; parName:string): string;
var
ff: TextFile;
i:  integer;
s:  string;
st, en: integer;
subS:   string;
f:  boolean; //признак того, что мы нашли нужный параметр
begin
  AssignFile(ff, fileName);
  Reset(ff);
  i := 0;
  f := FALSE;
  while not eof(ff) do begin
    Readln(ff, s);
    st := PosEx(ParName, s);// (PChar(s), PChar(parName));
    en := PosEx('=', s);
    subs := AnsiMidStr(s, st, en - st - 1);
    if subS = parName then begin
      f := TRUE;
      break;
    end;
    Inc(i);
  end;
  if f = FALSE then s := '';
  close(ff);
  FindParameter := s;
end;

function GetIntegerParameter(fileName:string; parName:string): integer;
var
res:  integer;
s:    string;
begin
  s := FindParameter(fileName, parName);
  if s <> '' then
    s := AnsiStrRScan(PChar(s), '=') + 1
  else
    s := '-1';

  GetIntegerParameter := StrToInt(s);
end;

function GetStringParameter(fileName:string; parName:string):string;
var
res:  integer;
s:    string;
begin
  s := FindParameter(fileName, parName);
  if s <> '' then
    s := AnsiStrRScan(PChar(s), '=') + 1;

  GetStringParameter := s;
end;


procedure SalGetProfileString(razdel, parName: string; var result: string; fileName: string);
var
ff: TextFile;
i:  integer;
s:  string;
st, en: integer;
subS:   string;
f:  boolean; //признак того, что мы нашли нужный параметр
fR: boolean; //признак того, что мы нашли нужный раздел
begin
  AssignFile(ff, fileName);
  Reset(ff);
  fR := FALSE;
  i := 0;
  f := FALSE;
  while not eof(ff) do begin  //идем по всем строкам файла
    Readln(ff, s);    //читаем строку
    s := Trim(s);
    if Length(s) = 0 then //если строка пустая, то идем дальше
      continue;
    if s[1] = ';' then  //если это компентарий, то идем дальше
      continue;
    if (s[1] = '[') and (fR <> TRUE )then begin//если это начало раздела, то
    //вычленяем название раздела
      st := 2;
      en := PosEx(']', s);
      subs := AnsiMidStr(s, st, en - st);
      if subs = razdel then begin //если это нужный нам раздел, то
        fR := TRUE;   //выставляем флаг
        continue;     //и идем к следующей строке
      end;
    end;
    if (s[1] = '[') and (fR = TRUE) then//если текущий раздел кончился, то
      fR := FALSE;
    if fR = TRUE then begin   //если мы идем по нужному разделу, то
      st := PosEx(ParName, s);
      en := PosEx('=', s);
      subs := AnsiMidStr(s, st, en - st);
      if (subS = parName) and (st=1) then begin
        f := TRUE;
        break;
      end;
    end;
  end;
  if f = FALSE then s := '';
  close(ff);

  if f <> FALSE then begin
    result := AnsiStrRScan(PChar(s), '=') + 1;
    if result[1] = '''' then delete(result, 1, 1);
    if result[Length(result)] = '''' then delete(result, Length(result), 1);
  end
  else
    result := '';

end;

//заполняем массив строк лексемами
procedure SalStrTokenize( str: string; ch: string; var aArr: array of string);
var
i, j: integer;
ss:   string;
begin
  ss := '';
  j := 0;
  for i:=1 to Length(str) do begin
    if (str[i] = ch) then begin
      aArr[j] := ss;
      Inc(j);
      ss := '';
    end
    else begin
      ss := ss + str[i]
    end;
  end;
  aArr[j] := ss;
end;


//считаем сколько лексем в строке
function GetCountToken(s, t: string): integer;
var
i:  integer;
res:  integer;
begin
  res := 1;
  for i:=1 to length(s) do
    if s[i] = t then
      inc(res);
  GetCountToken := res;
end;

//читаем множество окончаний по какому-то заголовку
function GetMultiEndingOfHG(header: string; FileName: string):TStrings;
var
endingS:  string;
res: TStrings;
ff: TextFile;
i:  integer;
s:  string;
st, en: integer;
subS:   string;
f:  boolean; //признак того, что мы нашли нужный параметр
fR: boolean; //признак того, что мы нашли нужный раздел
begin
  res := TStringList.Create;
  endingS := '';
  AssignFile(ff, fileName);
  Reset(ff);
  fR := FALSE;
  i := 0;
  f := FALSE;
  //считаем количество записей в файле
  while not eof(ff) do begin  //идем по всем строкам файла
    Readln(ff, s);    //читаем строку
    s := Trim(s);
    if Length(s) = 0 then //если строка пустая, то идем дальше
      continue;
    if s[1] = ';' then  //если это компентарий, то идем дальше
      continue;
    if s[1] <> '[' then
      continue; //это не название раздела, идем дальше
    if AnsiContainsStr(s, header) then begin //строка содержит нужную подстроку
      //убираем квадратные скобки
      delete(s, 1, 1);
      delete(s, Length(s), 1);
      //убираем искомую подстроку
      delete(s, 1, length(header));
      res.Add(s);
//      endingS := endingS + s + ',';
      Inc(i);
      f := TRUE;
    end;
  end;
//  delete(endingS, length(endingS), 1);  //удаляем последнюю запятую
  close(ff);

//  SetLength(res, i);

  GetMultiEndingOfHG := res;
end;

end.
