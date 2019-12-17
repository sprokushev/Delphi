program Exp2dbf;

{$APPTYPE CONSOLE}

uses
  ExceptionLog,
  SysUtils,
  Variants,
  Classes,
  DB,
  ActiveX,
  ADODB,
  IniFiles,
  StrUtils,
  DateUtils,
  Math;

var
    qPoint   : TADOQuery;
    qUpdate  : TADOQuery;
    id     : integer;
    xpl,ves,ves1,temper,vzliv,kvit_id:variant;
    dt:TDateTime;
var
  ApplIniName:string;
  ApplIni:TIniFile;
  SrcConn:string;
  DstTable,DstConn:string;

begin
//try
  CoInitialize(nil);

  // Прочитать из INI-файла приложения
  ApplIniName:=ExtractFilePath(ParamStr(0))+'exp2dbf.ini';
  ApplIni:=TIniFile.Create(ApplIniName);
  // подсоединение к БД
  SrcConn:=ApplIni.ReadString('COMMON', 'SRC_CONNECTION', '');
  DstConn:=ApplIni.ReadString('COMMON', 'DST_CONNECTION', '');
  DstTable:=ApplIni.ReadString('COMMON', 'DST_TABLE', '');


  // Прочитать данные из Experion
  qPoint:=TADOQuery.Create(nil);
  qPoint.ConnectionString:=SrcConn;
  qPoint.CommandTimeout:=30;
  qPoint.SQL.Add('select dbo.UTCFILETIMEToDateTime(time)as EventTime,source,value,TransactionId,EventId');
  qPoint.SQL.Add('from ems_vw_EMSEvents');
  qPoint.SQL.Add('where Source in(''ID11STR'',''ID12STR'',''ID21STR'',''ID22STR'',''STATUS11'',''STATUS12'',');
  qPoint.SQL.Add('''STATUS21'',''STATUS22'',''VES11'',''VES12'',''VES21'',''VES22'',''VZLIV11'',''VZLIV12'',''VZLIV21'',');
  qPoint.SQL.Add('''VZLIV22'',''TEMPER11'',''TEMPER12'',''TEMPER21'',''TEMPER22'',''XPL11'',''XPL12'',''XPL21'',''XPL22'')');
  qPoint.SQL.Add('and (dbo.UTCFILETIMEToDateTime(time)>{ts ''2006-09-10 23:59:59.000''}) and dbo.UTCFILETIMEToDateTime(time)>=:DATE_OTGR');
  qPoint.SQL.Add('order by TransactionId,Source');

  //Зададим дату выбора событий(текущая дата)
  qPoint.Parameters.ParseSQL(qPoint.SQL.Text,true);
  qPoint.Parameters.Items[0].DataType:=ftDate;
  dt:= DateOf(Now);//StrToDate('27.03.2007');
  qPoint.Parameters.ParamByName('DATE_OTGR').Value:=dt;

  Writeln('Connecting to Experion database...');

  qPoint.Active:=True;
{  while not qPoint.Eof do
  begin
    writeln(qpoint.Fieldbyname('Source').AsString+' '+qpoint.Fieldbyname('EventTime').AsString+' '+qpoint.Fieldbyname('Value').AsString);
    qPoint.Next;
  end;}
// Записать данные в DBF
  qUpdate:=TADOQuery.Create(nil);
  qUpdate.ConnectionString:=DstConn;
  qUpdate.CommandTimeout:=30;
  qUpdate.SQL.Add('UPDATE '''+DstTable+''' SET ');
    qUpdate.SQL.Add('VZLIV=:VZLIV, TEMPER=:TEMPER, VES=:VES, XPL=:XPL, FAKT=VES, KOL_ALL=TARA_ALL+VES, STATUS=1, DEFI_MASS=4');
//  qUpdate.SQL.Add('VZLIV_ASN=:VZLIV, TEMPER_ASN=:TEMPER, VES_ASN=:VES, XPL_ASN=:XPL, STATUS=1');
  qUpdate.SQL.Add('WHERE ID=:KVIT_ID AND EMPTY(NAKL_ID) AND DATE_OTGR>={04/01/2007}');
//  qUpdate.SQL.Add('WHERE ID=:KVIT_ID');
  qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
  qUpdate.Parameters.Items[0].DataType:=ftFloat;
  qUpdate.Parameters.Items[1].DataType:=ftFloat;
  qUpdate.Parameters.Items[2].DataType:=ftFloat;
  qUpdate.Parameters.Items[3].DataType:=ftFloat;
  qUpdate.Parameters.Items[4].DataType:=ftFloat;
  WriteLn('Data transfering to KVIT.');
  qPoint.First;
  While not qPoint.Eof do
  begin
  //  WriteLn(qpoint.FieldByName('EventTime').AsString);
    if Copy(qpoint.FieldByName('Source').AsString,1,6)='STATUS' then
    begin
      Temper:=0;
      ves:=0;
      ves1:=0;
      vzliv:=0;
      xpl:=0;
      kvit_id:='';
      id:=0;

      While not qPoint.Eof do
      begin
        qPoint.Next;//Перемещаемся на следующую строку
        if Copy(qPoint.FieldByName('Source').AsString,1,6)='TEMPER' then
        Begin
          temper:=qPoint.FieldByName('value').Value;
        end;
        if Copy(qPoint.FieldByName('Source').AsString,1,3)='VES' then
        try
          ves1:=qPoint.FieldByName('value').Value;
          ves:=ves1/1000;
        except
          ves1:=0;
          ves:=0;
        end;
        if Copy(qPoint.FieldByName('Source').AsString,1,5)='VZLIV' then
        Begin
          vzliv:=qPoint.FieldByName('value').Value;
          //vzliv:=0;
        end;
        if Copy(qPoint.FieldByName('Source').AsString,1,3)='XPL' then
        try
          //xpl:=qPoint.FieldByName('value').Value;
          writeln(ves1/vzliv);
          xpl:=0;
        except
          xpl:=0;
        end;
        if (Copy(qPoint.FieldByName('Source').AsString,1,2)='ID') and
           (length(qPoint.FieldByName('Source').AsString)=7) then   // если встретил ID??STR
        Begin
          kvit_id:=qPoint.FieldByName('value').Value;
          try
            id:=StrToInt(Copy(VarToStr(kvit_id),2,Length(VarToStr(kvit_id))-1));
          except
            id:=0;
          end;
        end;
        if Copy(qpoint.FieldByName('Source').AsString,1,2)='ID' then break; // если встречаем ID - выходим из цикла
        if Copy(qpoint.FieldByName('Source').AsString,1,2)='STATUS' then // если встречаем STATUS
        begin
          qPoint.Prior; //возвращаемся
          break; // выходим из цикла
        end;
        // Если ID не встречаем - перебираем до конца, пока не встретим
      end;
      if id>0 then
      Begin
        try
          xpl:=RoundTo(ves1/vzliv,-4);
        except
          xpl:=0;
        end;
        // Считали заявку имеющую ID
        WriteLn('ID=',id,' VES=',ves,' TEMPER=',temper,' VZLIV=',vzliv,' XPL=',xpl);
        try
          qUpdate.Parameters.ParamByName('TEMPER').Value:=temper;
          //WriteLn('temper');
          qUpdate.Parameters.ParamByName('VZLIV').Value:=vzliv;
          //WriteLn('vzliv');
          qUpdate.Parameters.ParamByName('VES').Value:=ves;
          //WriteLn('ves');
          qUpdate.Parameters.ParamByName('XPL').Value:=XPL;
          //WriteLn('xpl');
          qUpdate.Parameters.ParamByName('KVIT_ID').Value:=id;
          //WriteLn('kvit_id');
          qUpdate.ExecSQL;
        except
          on E: Exception do WriteLn(E.Message);
        end;
      end;
      //Write('.');
    end;
    qPoint.Next;//перемещаемся на след. заявку
  end;
  Writeln;
  Writeln('Data transfer is successful.');
//finally
  qUpdate.Free;
  qPoint.Free;
  CoUnInitialize;
//end;
end.

