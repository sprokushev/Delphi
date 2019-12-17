unit CSVToDB;
interface
uses Windows,Classes,Contnrs,SysUtils,StrUtils,
//RXLib
     DateUtil
     ;
type

TConvertFunc=function (value:string):string of object;

TConversionClass=class
public
function Convert(value:string):string;virtual;
end;

TConversionClassEx=class(TConversionClass)
protected
ConvertFunc:TConvertFunc;
public
function Convert(value:string):string;override;
constructor create(ConvertFunc:TConvertFunc);
end;

TConversionDateClass=class(TConversionClass)
protected
InFormat,OutFormat:string;
public
function Convert(value:string):string;override;
constructor create(InFormat,OutFormat:string);
end;

TConvertMap=packed record
Idx:DWORD;
ConversionObj:TConversionClass;
end;

TFieldMap=packed record
Idx:DWORD;
FieldName:string;
end;

TFieldsMapping=array of TFieldMap;

TFieldsMap=class
protected
lDelimeter:char;
ConvertMaps:array of TConvertMap;
function EnumMap(Out Mapping:TFieldsMapping):integer;virtual;abstract;
procedure ClearConvertMaps;
function GetConvertObj(Idx:integer):TConversionClass;
public
constructor create(const convertInfo:array of TConvertMap);
destructor destroy;override; 
property ConvertObj[Idx:integer]:TConversionClass read GetConvertObj;
property Delimeter:char read lDelimeter;
end;

TFieldsMapDefault=class(TFieldsMap)
protected
Fields:string;
function EnumMap(Out Mapping:TFieldsMapping):integer;override;
public
constructor create(const convertInfo:array of TConvertMap;Fields:string);overload;
property Delimeter:char read lDelimeter;
end;

TSQLExpressionParamItem=record
ParamName:string;
MappedFieldName:String;
Value:string;
end;

PSQLExpressionParamItem=^TSQLExpressionParamItem;

TSQLExpressionItem=record
TableName:string;
SQLExpression:string;
Parameters:TList;
end;

PSQLExpressionItem=^TSQLExpressionItem;

IInformation=interface
['{48C4C53C-53A0-49B3-B88F-338217EED725}']
procedure Information(Info:string; Error:boolean);
end;

TSQLEXPRESSION=class
protected
SQLExpressionItems:TList;
lInformation:IInformation;
procedure Clear;
function GetCount:integer;
function GetItem(idx:integer):TSQLExpressionItem;
public
constructor create;overload;
constructor create(const Information:IInformation);overload;
destructor destroy;override;
procedure Add(TableName:string;SQLExpression:string;Parameters:Tlist);
procedure Execute;virtual;abstract;
property Item[idx:integer]:TSQLExpressionItem read GetItem;
property Count:integer read GetCount;
property Information:IInformation read lInformation write lInformation;
end;

TCSVToDBMapper=class
protected
TableName:string;
mapObj:TFieldsMap;
lSkipEmptyValues:boolean;
function IsValidMapping(MaxIdx:integer;const Mapping:array of TFieldMap):integer;
public
property SkipEmptyValues:boolean read lSkipEmptyValues write lSkipEmptyValues;
constructor create(const Tablename:string;mapObj:TFieldsMap);
destructor destroy;override;
function MapFile(Filename: string;SQLEXPRESSION:TSQLEXPRESSION;StaticValuesStr:string):integer;
end;

function ParseString(S:string;DeviderSrt:string;strings:TStrings;SkipEmptyString:boolean=false):integer;
function ConvertMap(Idx:DWORD;ConversionObj:TConversionClass):TConvertMap;

implementation

uses SystemConstants,dialogs;

function ParseString(S:string;DeviderSrt:string;strings:TStrings;SkipEmptyString:boolean=false):integer;
var i,j,l:integer;
    Substring:string;
begin
strings.clear;
l:=length(S);
j:=0;
while j<l do
 begin
 i:=j+1;
 j:=PosEx(DeviderSrt,S,i);
 if j=0  then j:=l+1;
 Substring:=MidStr(S,i,j-i);
 if (not SkipEmptyString) or (Substring<>'') then strings.Add(Substring);
 end;
end;

{ TCSVToDBMapper }

constructor TCSVToDBMapper.create(const Tablename: string; mapObj: TFieldsMap);
begin
Self.TableName:=Tablename;
self.mapObj:=mapObj;
SkipEmptyValues:=TRUE;
end;

destructor TCSVToDBMapper.destroy;
begin
mapObj.free;
inherited;
end;

function TCSVToDBMapper.IsValidMapping(MaxIdx: integer;const Mapping: array of TFieldMap): integer;
var i:integer;
begin
try
for I := 0 to length(Mapping)-1 do
  if Mapping[i].Idx>MaxIdx then
            begin
            result:=CONST_NOT;
            exit;
            end;
result:=CONST_OK;
except
result:=CONST_EXCEPTION;
end;
end;

function TCSVToDBMapper.MapFile(Filename: string;SQLEXPRESSION:TSQLEXPRESSION;StaticValuesStr:string):integer;
const
    _SQL_INSERT_='insert into $tableName$($Fields$) values($values$)';
    _SQL_DELIMITER_=',';
    _SQL_PARAM_PREFIX_=':param_';
    _STATIC_VALUES_DELIMITER_=';';

var StaticValues,FileList,RowItemsList,FList,VList:TStringList;
    ParamList:Tlist;
    pparam:PSQLExpressionParamItem;
    Mapping:TFieldsMapping;
    i,j:integer;
    BaseSQL,ExecSQL,ItemValue,ParamName:string;
    ConvertObj:TConversionClass;
begin
try
StaticValues:=TStringList.Create;
ParseString(StaticValuesStr,_STATIC_VALUES_DELIMITER_,StaticValues);
for i:=0 to StaticValues.Count-1 do
  begin
  ItemValue:=StaticValues.ValueFromIndex[i];
  if ItemValue='$filename$' then StaticValues.ValueFromIndex[i]:=ExtractFileName(Filename)
     else if ItemValue='$date$' then StaticValues.ValueFromIndex[i]:=DateToStr(Date)+' '+TimeToStr(Time);
  end;
mapObj.EnumMap(Mapping);
if length(Mapping)>0 then
     else
     begin
     result:=CONST_NOT;
     exit;
     end;
FList:=TStringList.Create;
VList:=TStringList.Create;
 BaseSQL:=StringReplace(_SQL_INSERT_,'$tableName$',TableName,[rfIgnoreCase]);
 try
 FList.Delimiter:=_SQL_DELIMITER_;
 VList.Delimiter:=_SQL_DELIMITER_;
 FileList:=TStringList.Create;
    try
    RowItemsList:=TStringList.Create;
      try
       FileList.LoadFromFile(Filename);
       for I := 0 to FileList.Count-1 do
         begin
         ParseString(FileList.Strings[i],mapObj.Delimeter,RowItemsList);
////////////////////////////////////////////////////////////////////////////////
{
Формирование строки $SQLFields$ и $values$
}
         ParamList:=Tlist.Create;

         for j:=0 to length(Mapping)-1 do
             begin
             if Mapping[j].Idx>RowItemsList.Count then
                begin
//                raise Exception.Create('Некорректный Файл');
                end
                else
                begin
                ItemValue:=RowItemsList.Strings[Mapping[j].Idx-1];
                if (ItemValue='') and SkipEmptyValues then
                      else
                         begin
                         FList.Add(Mapping[j].FieldName);
                         ParamName:=_SQL_PARAM_PREFIX_+Mapping[j].FieldName;
                         VList.Add(ParamName);
                         New(pparam);
                         pparam.ParamName:=ParamName;
                         pparam.MappedFieldName:=Mapping[j].FieldName;
                         ConvertObj:=mapObj.ConvertObj[Mapping[j].Idx];
                         if assigned(ConvertObj) then pparam.Value:=ConvertObj.Convert(ItemValue)
                            else pparam.Value:=ItemValue;
                         ParamList.Add(pparam);
                         end;
                end;
             end;
//обработка статических значений
         for j:=0 to StaticValues.Count-1 do
             begin
             FList.Add(StaticValues.Names[j]);
             ParamName:=_SQL_PARAM_PREFIX_+StaticValues.Names[j];
             VList.Add(ParamName);

             New(pparam);
             pparam.ParamName:=ParamName;
             pparam.MappedFieldName:=StaticValues.Names[j];
             pparam.Value:=StaticValues.ValueFromIndex[j];
             ParamList.Add(pparam);
             end;
         ExecSQL:=StringReplace(BaseSQL,'$Fields$',FList.DelimitedText,[rfIgnoreCase]);
         ExecSQL:=StringReplace(ExecSQL,'$values$',VList.DelimitedText,[rfIgnoreCase]);
         SQLEXPRESSION.Add(TableName,ExecSQL,ParamList);
         ParamList:=nil;
         FList.Clear;
         VList.Clear;
////////////////////////////////////////////////////////////////////////////////
         RowItemsList.Clear;
         end;
      finally
      RowItemsList.free;
      end;
    finally
    FileList.free;
    end;
 finally
 VList.free;
 FList.free;
 StaticValues.Free;
 end;
result:=CONST_OK; 
Except
result:=CONST_EXCEPTION;
raise
end;
end;

{ TFieldsMap }

procedure TFieldsMap.ClearConvertMaps;
var i:integer;
begin
for i:=0 to length(ConvertMaps)-1 do ConvertMaps[i].ConversionObj.free;
end;

constructor TFieldsMap.create(const convertInfo: array of TConvertMap);
var i:integer;
begin
setlength(ConvertMaps,length(convertInfo));
for i:=0 to length(ConvertMaps)-1 do ConvertMaps[i]:=convertInfo[i];
end;

destructor TFieldsMap.destroy;
begin
ClearConvertMaps;
inherited;
end;

function TFieldsMap.GetConvertObj(Idx: integer): TConversionClass;
var i:integer;
begin
for i:=0 to length(ConvertMaps)-1 do
     if ConvertMaps[i].Idx=Idx then
           begin
           result:=ConvertMaps[i].ConversionObj;
           exit;
           end;
result:=nil;
end;

{ TFieldsMapDefault }

constructor TFieldsMapDefault.create(const convertInfo:array of TConvertMap;Fields: string);
begin
inherited create(convertInfo);
lDelimeter:=';';
self.Fields:=Fields;
end;

function TFieldsMapDefault.EnumMap(out Mapping: TFieldsMapping): integer;
const _DELIMITER_=';';
var List:TStringList;
    i:integer;
    j:integer;
begin
try
List:=TStringList.Create;
  try
  ParseString(Fields,_DELIMITER_,List);
  SetLength(Mapping,List.Count);
  j:=0;
  for i := 0 to List.Count - 1 do
     if List.Strings[i]='' then
       else
        begin
        Mapping[j].Idx:=i+1;
        Mapping[j].FieldName:=List.Strings[i];
        inc(j);
        end;
  SetLength(Mapping,j);
  finally
  List.free;
  end;
result:=CONST_OK;
except
result:=CONST_EXCEPTION;
end;
end;

{ TSQLEXPRESSION }

procedure TSQLEXPRESSION.Add(TableName, SQLExpression: string;Parameters:TList);
var p:PSQLExpressionItem;
    i:integer;
begin
New(p);
p.TableName:=TableName;
p.SQLExpression:=SQLExpression;
p.Parameters:=Parameters;
SQLExpressionItems.Add(p);
end;

procedure TSQLEXPRESSION.Clear;
var i,j:integer;
    Params:TList;
begin
for i:=0 to SQLExpressionItems.Count-1 do
    begin
    Params:=PSQLExpressionItem(SQLExpressionItems.Items[i])^.Parameters;
    for j:=0 to Params.Count-1 do dispose(PSQLExpressionParamItem(Params.Items[j]));
    Params.free;
    dispose(PSQLExpressionItem(SQLExpressionItems.Items[i]));
    end;
end;

constructor TSQLEXPRESSION.create;
begin
SQLExpressionItems:=TList.Create;
end;

constructor TSQLEXPRESSION.create(const Information:IInformation);
begin
create;
lInformation:=Information;
end;

destructor TSQLEXPRESSION.destroy;
begin
Clear;
SQLExpressionItems.free;
inherited;
end;

function TSQLEXPRESSION.GetCount: integer;
begin
result:=SQLExpressionItems.Count;
end;

function TSQLEXPRESSION.GetItem(idx: integer): TSQLExpressionItem;
begin
if idx<SQLExpressionItems.Count then result:=PSQLExpressionItem(SQLExpressionItems.Items[idx])^
   else
   raise Exception.Create('Idx Violates Bounds');
end;


function ConvertMap(Idx:DWORD;ConversionObj:TConversionClass):TConvertMap;
begin
result.Idx:=Idx;
Result.ConversionObj:=ConversionObj;
end;

{ TConversionClass }

function TConversionClass.Convert(value: string): string;
begin
result:=value;
end;

{ TConversionClassEx }

function TConversionClassEx.Convert(value: string): string;
begin
if assigned(ConvertFunc) then result:=ConvertFunc(value) else result:=inherited Convert(value);
end;

constructor TConversionClassEx.create(ConvertFunc: TConvertFunc);
begin
Self.ConvertFunc:=ConvertFunc;
end;

{ TConversionDateClass }

function TConversionDateClass.Convert(value: string): string;
var format:TFormatSettings;
begin
if (value='') or (value='00000000') then result:=''
//if (value='') then result:=''
      else
      begin
      format.ShortDateFormat:=OutFormat;
      result:=DateToStr(StrToDateFmt(InFormat,value),format);
      end;
end;

constructor TConversionDateClass.create(InFormat, OutFormat: string);
begin
Self.InFormat:=InFormat;
Self.OutFormat:=OutFormat;
end;



end.
