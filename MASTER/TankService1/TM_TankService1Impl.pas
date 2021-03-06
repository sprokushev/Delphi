{ Invokable implementation File for TTM_TankService1 which implements ITM_TankService1 }

unit TM_TankService1Impl;

interface

uses InvokeRegistry, Types, XSBuiltIns, TM_TankService1Intf, DM1, StrUtils, SysUtils, Oracle, DB, OracleData, DateUtils;

type

  { TTM_TankService1 }
  TTM_TankService1 = class(TInvokableClass, ITM_TankService1)
  public
    function GetTanksData (dt: string): OleVariant; stdcall;
  end;

implementation

function MakeXmlStr (node, value: String): String;
begin
  Result := '<' + node + '>' + value + '</' + node + '>';
end;

function FieldsToXml (rootName: string; data: TOracleDataSet): string;
var
  i: Integer;
begin
  Result := '<' + rootName + '>' + sLineBreak;;
  for i := 0 to data.FieldCount - 1 do
    Result := Result + '  ' + MakeXmlStr(AnsiUpperCase(data.Fields[i].FieldName),
      data.Fields[i].AsString) + sLineBreak;
  Result := Result + '</' + rootName + '>' + sLineBreak;;
end;

function TTM_TankService1.GetTanksData(dt: String): OleVariant;
var
  strHeader,strRows,strTimeStamp: string;

begin
  dm:=TDataModule1.Create (nil);
  dm.ora_Session.LogonUsername:= 'MASTER';
  dm.ora_Session.LogonPassword:= 'master';
  dm.ora_Session.LogonDataBase:='BUH';
  dm.ora_Session.LogOn;
  dm.q_tank.SetVariable(':TimeStamp',LeftStr(dt,10));
  try
      dm.q_tank.open;
      while not dm.q_tank.Eof do
      begin
        strRows:=strRows+FieldsToXml ('ROW',dm.q_tank);
        dm.q_tank.Next;
      end;
  finally
      dm.Free;
  end;
  DateTimeToString(strTimeStamp,'yyyy-mm-dd''T''hh:nn:ss',Now);
  strHeader:=strHeader + '<DESCRIPTION>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '<DOC_CODE><TYPE>��������� �����������</TYPE> '+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<CODE/>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<INDEX_STATUS INDEX_STATUS_ID="9">����������� ������</INDEX_STATUS>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<CREATE_DATE>'+strTimeStamp+'</CREATE_DATE>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '</DOC_CODE>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '<DOC_PERIOD>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<START_DATE>'+LeftStr(dt,10)+'T00:00:00'+'</START_DATE>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<LENGTH>0</LENGTH>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<PERIODICITY PERIODICITY_ID="1">�������� ������</PERIODICITY>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '</DOC_PERIOD>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '<INTERFACE>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<NAME>TankData</NAME>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<SENDER><SYSTEM>NPZ</SYSTEM>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<DEPARTMENT>UNP</DEPARTMENT>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<PERSON_NAME>���������� �.�.</PERSON_NAME>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '</SENDER>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '  ' + '<RECEIVER><SYSTEM>ALL</SYSTEM></RECEIVER>'+ sLineBreak;
  strHeader:=strHeader + '  ' + '</INTERFACE>'+ sLineBreak;
  strHeader:=strHeader + '</DESCRIPTION>'+ sLineBreak;

  result:=strHeader+strRows;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TTM_TankService1);

end.
