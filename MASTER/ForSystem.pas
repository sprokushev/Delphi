unit ForSystem;

// Набор методов для работы с системой

interface

uses Windows,StrUtils,DateUtil,Variants;

type
  TMasterSysUtils = class(TObject)
  public
    { Имя пользователя }
    function GetUserName(Upper:Boolean):String;
    { Имя компьютера }
    function GetTerminalName(Upper:Boolean):String;
    { Расшифровка строки с формулами-датами }
    function DecodeDateFormula(Formula:string;DefDate:TDateTime):TDateTime;
    { Расшифровка строки с формулами-временем }
    function DecodeTimeFormula(Formula:string):TDateTime;
    // Убрать все пробелы внутри строки
    function FullTrim (s:string):string;
    // Заменить в строке %USERNAME%, %TERMINAL% на имя пользователя и компьютера
    function CheckOnNames(s:string):string;
    // Значение параметра командной строки по имени
    function ParamStrByName(ParamName:string):string;
    // Случайная строка
    function RndStr(len:integer):string;
    // Функция формирования списка присвоения полям из строки Str1 значений из строки Str2
    // Поля и значения отделены символом Symb1.
    // В результирующей строке символ присвоения Symb2 разделяет поле и значение, а пары
    // поле-значение разделены сиволом Symb3
    // Например:
    //   GetAssignList('a,b,c','1,2,3',',','=',',') вернет 'a=1,b=2,c=3'
    //   GetAssignList('a,b,c','1,2,3',',','=',' AND ') вернет 'a=1 AND b=2 AND c=3'
    //   GetAssignList('a,b,c','1,2,3',',','<>',' AND ') вернет 'a<>1 AND b<>2 AND c<>3'
    function GetAssignList(Str1,Str2,Symb1,Symb2,Symb3:string):string;
    { Вернуть дату из строки типа "14 апреля 2004 г." }
    function GetPropisDate(Propis:string):TDateTime;
    { Преобразовать строку в число типа  Extended}
    function StrToReal(Stroka:string):extended;
    { Преобразовать число типа  Extended в строку }
    function RealToStr(Num:extended):string;
    { Преобразовать строку в число типа  Integer}
    function StrToInteger(Stroka:string):Integer;
    { Преобразование в DOS-кодировку }
    function ToDos(AnsiStr:string):string;
  published
  end;

var
  F_ForSystem: TMasterSysUtils;

implementation
uses SysUtils,DateUtils;

// Случайная строка
function TMasterSysUtils.RndStr(len:integer):string;
var d:double;
    i:integer;
Begin
  d:=Time;
  for i:=1 to len do d:=d*10;
  Result:=FloatToStr(Round(d));
End;

// Заменить в строке %USERNAME%, %TERMINAL% на имя пользователя и компьютера
function TMasterSysUtils.CheckOnNames(s:string):string;
var s1:string;
    i1:integer;
Begin
  s1:=AnsiUpperCase(s);
  i1:=Pos('%USERNAME%',s1);
  if i1>0 then
    s1:=StrUtils.AnsiReplaceStr(s1,'%USERNAME%',GetUserName(true));
  i1:=Pos('%TERMINAL%',s1);
  if i1>0 then
    s1:=StrUtils.AnsiReplaceStr(s1,'%TERMINAL%',GetTerminalName(true));
  Result:=s1;
end;


// Убрать все пробелы внутри строки
function TMasterSysUtils.FullTrim(s:string):string;
Begin
  Result:=StrUtils.AnsiReplaceStr(s,' ','');
end;

// Вернуть имя пользователя
function TMasterSysUtils.GetUserName(Upper:Boolean):String;
var
  UserName:String[150];
  Len:DWord;
begin
  FillChar(UserName,150,0);
  Len:=100;
  Windows.GetUserNameA(@UserName[1],Len);
  UserName[0]:=Chr(Len-1);
  Result:=UserName;
  if Upper then
    Result:=ANSIUpperCase(Username);
end;

// Вернуть имя компьютера
function TMasterSysUtils.GetTerminalName(Upper:Boolean):String;
var
  TermName:String[150];
  Len:DWord;
begin
  FillChar(TermName,150,0);
  Len:=100;
  Windows.GetComputerNameA(@TermName[1],Len);
  TermName[0]:=Chr(Len);
  Result:=TermName;
  if Upper then
    Result:=ANSIUpperCase(TermName);
end;

{
Функция разбора формул для дат.
Формат формулы:
ФОРМУЛА=КОДОВОЕ_СЛОВО [+|-NN]

Список кодовых слов:
START_PREV_YEAR - начало предыдущего года
END_PREV_YEAR - окончание предыдущего года
START_YEAR - начало текущего года
END_YEAR - окончание текущего года
START_NEXT_YEAR - начало следующего года
END_NEXT_YEAR - окончание следующего года
START_PREV_MON - начало предыдущего месяца
END_PREV_MON - окончание предыдущего месяца
START_MON - начало текущего месяца
END_MON - окончание текущего месяца
START_NEXT_MON - начало следующего месяца
END_NEXT_MON - окончание следующего месяца
PREV - предыдущий день
NOW - текущий день
NEXT - следующий день
FIRSTxxDAY - если текущий день <= xx - начало предыдущего месяца, если > xx - начало текущего

Сдвиг даты: +|-NN
Предыдущему значению даты прибавляется(+) или вычитается(-) NN дней
Например: NOW+2 - Текущий день+2

}

function TMasterSysUtils.DecodeDateFormula(Formula:string;DefDate:TDateTime):TDateTime;
var vFormula,s1:string;
    vKeyword,vSign,vValue:string;
    vDays,i1,i2,sign:integer;
    vNow:TDateTime;
Begin
  vFormula:=AnsiUpperCase(FullTrim(Formula));
  vNow:=DefDate;
  if DefDate=0 then vNow:=Date;

  if Length(vFormula)=0 then
  Begin
    // Пустая формула
    Result:=vNow;
    exit;
  End;

  // Выделяем ключевое слово
  i1:=Pos('+',vFormula); //+
  if i1=0 then
    i1:=Pos('-',vFormula); //-
  if i1<>0 then
  Begin
    vKeyword:=copy(vFormula,1,i1-1);
    vSign:=copy(vFormula,i1,1);
    vValue:=copy(vFormula,i1+1,length(vFormula));
  End
  else
  Begin
    vKeyword:=vFormula;
    vSign:='';
    vValue:='';
  End;

  Result:=0;

  // Анализируем ключевое слово
  if vKeyword='START_PREV_YEAR' then  Result:=StartOfTheYear(StartOfTheYear(Date)-1);
  if vKeyword='START_YEAR'      then  Result:=StartOfTheYear(vNow);
  if vKeyword='START_NEXT_YEAR' then  Result:=StartOfTheYear(EndOfTheYear(Date)+1);
  if vKeyword='END_PREV_YEAR'   then  Result:=EndOfTheYear(StartOfTheYear(Date)-1);
  if vKeyword='END_YEAR'        then  Result:=EndOfTheYear(vNow);
  if vKeyword='END_NEXT_YEAR'   then  Result:=EndOfTheYear(EndOfTheYear(Date)+1);
  if vKeyword='START_PREV_MON'  then  Result:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  if vKeyword='START_MON'       then  Result:=StartOfTheMonth(vNow);
  if vKeyword='START_NEXT_MON'  then  Result:=StartOfTheMonth(EndOfTheMonth(Date)+1);
  if vKeyword='END_PREV_MON'    then  Result:=EndOfTheMonth(StartOfTheMonth(Date)-1);
  if vKeyword='END_MON'         then  Result:=EndOfTheMonth(vNow);
  if vKeyword='END_NEXT_MON'    then  Result:=EndOfTheMonth(EndOfTheMonth(Date)+1);
  if vKeyword='PREV'            then  Result:=Date-1;
  if vKeyword='NOW'             then  Result:=Date;
  if vKeyword='NEXT'            then  Result:=Date+1;

  // Выделяем ключевое слово FIRSTxxDAY
  if result=0 then
  Begin
    i1:=Pos('FIRST',vFormula);
    if i1=1 then
    Begin
      i2:=Pos('DAY',vFormula);
      if (i2=7) or (i2=8) then
      Begin
        try
          vDays:=StrToInt(System.Copy(vFormula,6,i2-6));
        except
          vDays:=0;
        end;
        if DayOfTheMonth(vNow)<=vDays then
          Result:=StartOfTheMonth(StartOfTheMonth(vNow)-1)
        else
          Result:=StartOfTheMonth(vNow);
      end;
    end;
  end;

  // Если ключевое слово не найдено - возможно это дата в в формате dd.mm.yyyy
  if Result=0 then
  try
    Result:=StrToDateFmt('dd.mm.yyyy',vFormula);
  except
    Result:=vNow;
  end;

  // Добавляем сдвиг даты
  if Result<>0 then
  Begin
    if vValue<>'' then
      try
        vDays:=StrToInt(vValue);
      except
        vDays:=0;
      end
    else vDays:=0;
    if vDays<>0 then
    Begin
      if vSign='-' then
        Result:=Result-vDays;
      if vSign='+' then
        Result:=Result+vDays;
    End
  End
  Else Result:=vNow;
End;

{
Функция разбора формул для времени.
Формат формулы:
ФОРМУЛА=КОДОВОЕ_СЛОВО [+|-NN]

Список кодовых слов:
NOW - текущее время

Сдвиг даты: +|-NN
Предыдущему значению времени прибавляется(+) или вычитается(-) NN часов
Например: NOW+2 - Текущее время+2 часа

}

function TMasterSysUtils.DecodeTimeFormula(Formula:string):TDateTime;
var vFormula,s1:string;
    vKeyword,vSign,vValue:string;
    vHours,i1,i2,sign:integer;
Begin
  vFormula:=AnsiUpperCase(FullTrim(Formula));

  if Length(vFormula)=0 then
  Begin
    // Пустая формула
    Result:=0;
    exit;
  End;

  // Выделяем ключевое слово
  i1:=Pos('+',vFormula); //+
  if i1=0 then
    i1:=Pos('-',vFormula); //-
  if i1<>0 then
  Begin
    vKeyword:=copy(vFormula,1,i1-1);
    vSign:=copy(vFormula,i1,1);
    vValue:=copy(vFormula,i1+1,length(vFormula));
  End
  else
  Begin
    vKeyword:=vFormula;
    vSign:='';
    vValue:='';
  End;

  Result:=0;

  // Анализируем ключевое слово
  if vKeyword='NOW' then  Result:=Time;

  // Если ключевое слово не найдено - возможно это время в формате hh:mi:ss
  if Result=0 then
  try
    Result:=StrToTime(vFormula);
  except
    Result:=0;
  end;

  // Добавляем сдвиг времени
  if Result<>0 then
  Begin
    if vValue<>'' then
      try
        vHours:=StrToInt(vValue);
      except
        vHours:=0;
      end
    else vHours:=0;
    if vHours<>0 then
    Begin
      if vSign='-' then
        Result:=Result-vHours/24;
      if vSign='+' then
        Result:=Result+vHours/24;
    End
  End;
End;

function TMasterSysUtils.ParamStrByName(ParamName:string):string;
var
  i,j: Integer;
  s: string;
Begin
  Result:='';
  for i := 1 to ParamCount do
  begin
    s:=LowerCase(ParamStr(i));
    if length(s)>0 then
    Begin
      if (s[1]='/') or (s[1]='\') then s:=System.copy(s,2,999);
      if Pos(LowerCase(ParamName)+'=',s) =  1 then
      Begin
        j:=Length(ParamName)+2;
        Result:=Copy(s,j,999);
        exit;
      End;
    end;
  end;
End;

// Функция формирования списка присвоения полям из строки Str1 значений из строки Str2
// Поля и значения отделены символом Symb1.
// В результирующей строке символ присвоения Symb2 разделяет поле и значение, а пары
// поле-значение разделены сиволом Symb3
// Например:
//   GetAssignList('a,b,c','1,2,3',',','=',',') вернет 'a=1 , b=2 , c=3'
//   GetAssignList('a,b,c','1,2,3',',','=','AND') вернет 'a=1 AND b=2 AND c=3'
//   GetAssignList('a,b,c','1,2',',','<>',' AND ') вернет 'a<>1 AND b<>2'
function TMasterSysUtils.GetAssignList(Str1,Str2,Symb1,Symb2,Symb3:string):string;
var i1,i2:integer;
    s1,s2:string;
    res,zpt:string;
Begin
  res:='';
  zpt:='';
  repeat
    i1:=Pos(Symb1,Str1); // Поиск разделителя в строке 1
    i2:=Pos(Symb1,Str2); // Поиск разделителя в строке 2
    // Значение из строки 1
    if (i1>0) then s1:=Copy(Str1,1,i1-1) else s1:=Str1; // Значение из строки 1
    if (i2>0) then s2:=Copy(Str2,1,i2-1) else s2:=Str2; // Значение из строки 1
    if (s1='') or (s2='') then break;
    res:=res+zpt+s1+Symb2+s2;
    zpt:=' '+Trim(Symb3)+' ';
  until false;
  Result:=res;
End;

// Вернуть дату из строки типа "14 апреля 2004 г."
function TMasterSysUtils.GetPropisDate(Propis:string):TDateTime;
var i,j,DD,MM,YY:integer;
    s,s2:string;
Begin
  s:=AnsiUpperCase(Propis);
  repeat
    i:=Pos('ЯНВАРЬ',s);
    if i>0 then begin MM:=1;j:=i+6;break end;
    i:=Pos('ЯНВАРЯ',s);
    if i>0 then begin MM:=1;j:=i+6;break end;
    i:=Pos('ФЕВРАЛЬ',s);
    if i>0 then begin MM:=2;j:=i+7;break end;
    i:=Pos('ФЕВРАЛЯ',s);
    if i>0 then begin MM:=2;j:=i+7;break end;
    i:=Pos('МАРТ',s);
    if i>0 then begin MM:=3;j:=i+4;break end;
    i:=Pos('МАРТА',s);
    if i>0 then begin MM:=3;j:=i+5;break end;
    i:=Pos('АПРЕЛЬ',s);
    if i>0 then begin MM:=4;j:=i+6;break end;
    i:=Pos('АПРЕЛЯ',s);
    if i>0 then begin MM:=4;j:=i+6;break end;
    i:=Pos('МАЙ',s);
    if i>0 then begin MM:=5;j:=i+3;break end;
    i:=Pos('МАЯ',s);
    if i>0 then begin MM:=5;j:=i+3;break end;
    i:=Pos('ИЮНЬ',s);
    if i>0 then begin MM:=6;j:=i+4;break end;
    i:=Pos('ИЮНЯ',s);
    if i>0 then begin MM:=6;j:=i+4;break end;
    i:=Pos('ИЮЛЬ',s);
    if i>0 then begin MM:=7;j:=i+4;break end;
    i:=Pos('ИЮЛЯ',s);
    if i>0 then begin MM:=7;j:=i+4;break end;
    i:=Pos('АВГУСТ',s);
    if i>0 then begin MM:=8;j:=i+6;break end;
    i:=Pos('АВГУСТА',s);
    if i>0 then begin MM:=8;j:=i+7;break end;
    i:=Pos('СЕНТЯБРЬ',s);
    if i>0 then begin MM:=9;j:=i+8;break end;
    i:=Pos('СЕНТЯБРЯ',s);
    if i>0 then begin MM:=9;j:=i+8;break end;
    i:=Pos('ОКТЯБРЬ',s);
    if i>0 then begin MM:=10;j:=i+7;break end;
    i:=Pos('ОКТЯБРЯ',s);
    if i>0 then begin MM:=10;j:=i+7;break end;
    i:=Pos('НОЯБРЬ',s);
    if i>0 then begin MM:=11;j:=i+6;break end;
    i:=Pos('НОЯБРЯ',s);
    if i>0 then begin MM:=11;j:=i+6;break end;
    i:=Pos('ДЕКАБРЬ',s);
    if i>0 then begin MM:=12;j:=i+7;break end;
    i:=Pos('ДЕКАБРЯ',s);
    if i>0 then begin MM:=12;j:=i+7;break end;
  until true;

  if i=0 then
  Begin
    s2:=s;
    i:=Pos('.',s2);
    if i=0 then
    Begin
      GetPropisDate:=0;
      exit;
    end;
    s2:=System.Copy(s2,i+1,999);
    j:=Pos('.',s2);
    if j=0 then
    Begin
      GetPropisDate:=0;
      exit;
    end;
    j:=j+1;
    s2:=System.Copy(s2,i+1,j-i);
    if s2='' then
    Begin
      GetPropisDate:=0;
      exit;
    end;
    try
      MM:=StrToInt(Trim(s2));
    except
      GetPropisDate:=0;
      exit;
    end;
  end;

  if i=1 then DD:=1
  else
  try
    DD:=StrToInt(Trim(system.copy(s,1,i-1)));
  except
    DD:=1;
  end;

  try
    YY:=StrToInt(Trim(system.copy(s,j,999)));
  except
    YY:=YearOf(Now);
  end;

  GetPropisDate:=EncodeDate(YY,MM,DD);
End;

{ Преобразовать строку в число типа  Extended}
function TMasterSysUtils.StrToReal(Stroka:string):extended;
var s:string;
    r:extended;
Begin
  s := VarToStr(Stroka);
  s :=StrUtils.AnsiReplaceStr(s,',','.');
  if not TryStrToFloat(s,r) then r:=0;
  StrToReal:=r;
End;

{ Преобразовать число типа  Extended в строку }
function TMasterSysUtils.RealToStr(Num:extended):string;
var s:string;
begin
  RealToStr:=FloatToStr(Num);
end;

{ Преобразовать строку в число типа  Integer}
function TMasterSysUtils.StrToInteger(Stroka:string):integer;
var s:string;
    i:integer;
Begin
  s := VarToStr(Stroka);
  s :=StrUtils.AnsiReplaceStr(s,',','.');
  if not TryStrToInt(s,i) then i:=0;
  StrToInteger:=i;
End;

function TMasterSysUtils.ToDos(AnsiStr:string):string;
begin
  SetLength(Result, Length(AnsiStr));
  if Length(Result) > 0 then
    CharToOem(PChar(AnsiStr), PChar(Result));
end;

end.
