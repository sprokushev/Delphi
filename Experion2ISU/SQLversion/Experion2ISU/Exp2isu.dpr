program Exp2isu;

{$APPTYPE CONSOLE}

uses
  ExceptionLog,
  Windows,
  SysUtils,
  Variants,
  Classes,
  DB,
  ActiveX,
  ADODB,
  IniFiles,
  StrUtils,
  DateUtils,
  DateUtil,
  Math;

var
//    qPoint   : TADOQuery;
    qUpdate  : TADOQuery;
    qInsert  : TADOQuery;
    qSh30DBF  : TADOQuery;
    qForCSV  : TADOQuery;
//    id     : double;
//    xpl,ves,ves1,temper,vzliv,kvit_id:variant;
    dt:TDateTime;
    IsOk:boolean;
//    str:string;
var
  ApplIniName:string;
  ApplIni:TIniFile;
  ArhFrom,SrcFromTable,DstFromConn,DstFromTable:string;
  ArhTo,SrcToConn,DstToTable:string;
  ErrF:TextFile;
  jjj_s,StrF,StrDT:string;

  vNN,vID,vRowID:double;
  vNumOtgr,vFIO,vProd,vTime,vCardID:string;
  i1,i2,jjj,vVzlSert,vNumSec,vCardNum,vStatus:integer;
  vDate:TDateTime;
  llll, ves, xpl, vzliv:double;

{ ������������� ������ � ����� ����  Extended}
function StrToReal(Stroka:string):extended;
var s:string;
    r:extended;
Begin
  s := VarToStr(Stroka);
  s :=StrUtils.AnsiReplaceStr(s,',','.');
  if not TryStrToFloat(s,r) then r:=0;
  StrToReal:=r;
End;

{ ������������� ������ � ����� ����  Integer}
function StrToInteger(Stroka:string):integer;
var s:string;
    i:integer;
Begin
  s := VarToStr(Stroka);
  s :=StrUtils.AnsiReplaceStr(s,',','.');
  if not TryStrToInt(s,i) then i:=0;
  StrToInteger:=i;
End;

  { ����������� ����� }
function SafeCopyFile(FromF:string ;ToF:string):boolean;
var
  f1,f2:String[255];
Begin
  f1:=FromF+#0;
  f2:=ToF+#0;
  Result:=Windows.COPYFILE(@f1[1],@f2[1],False);
End;

function PADL(s:string;len:integer):string;
var i:integer;
Begin
  s:=Trim(s);
  i:=length(s);
  for i:=len downto i+1 do s:='0'+s;
  PADL:=s;
End;

begin
//try
  CoInitialize(nil);
  qUpdate:=TADOQuery.Create(nil);
  qInsert:=TADOQuery.Create(nil);
  qSh30DBF:=TADOQuery.Create(nil);
//  qPoint:=TADOQuery.Create(nil);
  qForCSV:=TADOQuery.Create(nil);

  // 1.��������� �� INI-�����
  ApplIniName:=ExtractFilePath(ParamStr(0))+'exp2isu.ini';
  ApplIni:=TIniFile.Create(ApplIniName);

  // ���� ���-Experion
  ArhFrom:=ApplIni.ReadString('FROM_ISU', 'ARCHIVE', '');
  SrcFromTable:=ApplIni.ReadString('FROM_ISU', 'SRC_TABLE', '');
  DstFromConn:=ApplIni.ReadString('FROM_ISU', 'DST_CONNECTION', '');
  DstFromTable:=ApplIni.ReadString('FROM_ISU', 'DST_TABLE', '');
  // ���� Experion-���
  ArhTo:=ApplIni.ReadString('TO_ISU', 'ARCHIVE', '');
  SrcToConn:=ApplIni.ReadString('TO_ISU', 'SRC_CONNECTION', '');
  DstToTable:=ApplIni.ReadString('TO_ISU', 'DST_TABLE', '');
  WriteLn('Reading INI.');

  // 2.��������� ������ �� ��� � �������� ������ � Experion
  // �������� ���� IS_UPD
  qUpdate.Close;
  qUpdate.SQL.Clear;
  qUpdate.ConnectionString:=DstFromConn;
  qUpdate.CommandTimeout:=30;
  qUpdate.SQL.Add('UPDATE '+DstFromTable+' SET IS_UPD=0');
  qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
  qUpdate.ExecSQL;

  // 2.1 ���������� ��������
  qSh30DBF.Close;
  qSh30DBF.SQL.Clear;
  qSh30DBF.ConnectionString:=DstFromConn;

// PSV: 20.03.2012. ���� ��������� ������ ������������, ������� � ����� ������ ������
// PSV: 20.03.2012. ���� ������ �� ����������� ID
//  qSh30DBF.SQL.Add('select ID,STATUS from '+DstFromTable+' where (ID=:KVIT_ID OR ((STATUS>0) AND (NP_DATA_O<:DATE_OTGR))) and status<2 ORDER BY status');
  qSh30DBF.SQL.Add('select ID,STATUS from '+DstFromTable+' where ID=:KVIT_ID ORDER BY status');

  qSh30DBF.Parameters.ParseSQL(qSh30DBF.SQL.Text,true);
  qSh30DBF.Parameters.Items[0].DataType:=ftFloat;
//  qSh30DBF.Parameters.Items[1].DataType:=ftDate;
//  dt:= DateOf(Now);
//  qSh30DBF.Parameters.ParamByName('DATE_OTGR').Value:=dt;

  qUpdate.Close;
  qUpdate.SQL.Clear;
  qUpdate.ConnectionString:=DstFromConn;
  qUpdate.SQL.Add('UPDATE '+DstFromTable+' SET ');
  qUpdate.SQL.Add('NN=:NN, ID=:ID, ROWID=:ROWID, NUM_OTGR=:NUM_OTGR, FIO_DRIVER=:FIO_DRIVER, PROD_ABBR2=:PROD_ABBR2, VZL_SERT=:VZL_SERT, NUM_SEC=:NUM_SEC, CARD_ID=:CARD_ID, CARD_NUM=:CARD_NUM, STATUS=:STATUS, NP_DATA_O=:NP_DATA_O, NP_TIMEP=:NP_TIMEP,');
  qUpdate.SQL.Add('VZLIV=0, TEMPER=0, VES=0, XPL=0, KOL_ALL=0, DEFI_MASS=4, IS_UPD=1');
  qUpdate.SQL.Add('WHERE ID=:KVIT_ID');
  qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
  qUpdate.Parameters.Items[0].DataType:=ftFloat;
  qUpdate.Parameters.Items[1].DataType:=ftFloat;
  qUpdate.Parameters.Items[2].DataType:=ftFloat;
  qUpdate.Parameters.Items[3].DataType:=ftString;
  qUpdate.Parameters.Items[4].DataType:=ftString;
  qUpdate.Parameters.Items[5].DataType:=ftString;
  qUpdate.Parameters.Items[6].DataType:=ftFloat;
  qUpdate.Parameters.Items[7].DataType:=ftFloat;
  qUpdate.Parameters.Items[8].DataType:=ftString;
  qUpdate.Parameters.Items[9].DataType:=ftFloat;
  qUpdate.Parameters.Items[10].DataType:=ftFloat;
  qUpdate.Parameters.Items[11].DataType:=ftDateTime;
  qUpdate.Parameters.Items[12].DataType:=ftString;
  qUpdate.Parameters.Items[13].DataType:=ftFloat;

  qInsert.Close;
  qInsert.SQL.Clear;
  qInsert.ConnectionString:=DstFromConn;
  qInsert.SQL.Add('INSERT INTO '+DstFromTable+' (NN, ID, ROWID, PROD_ABBR2, NUM_OTGR, VES, VZLIV, DATE_REMOV, NP_DATA_O, NP_TIMEP, KOL_ALL, TARA_ALL, XPL, PL, TEMPER, DEFI_MASS, FIO_DRIVER, VZL_SERT, STATUS, CARD_ID, CARD_NUM, NUM_SEC, IS_UPD) ');
  qInsert.SQL.Add('VALUES (:NN,:ID,:ROWID,:PROD_ABBR2,:NUM_OTGR,0,0,null,:NP_DATA_O,:NP_TIMEP,0,0,0,0,0,0,:FIO_DRIVER,:VZL_SERT,:STATUS,:CARD_ID,:CARD_NUM,:NUM_SEC,1) ');
  qInsert.Parameters.ParseSQL(qInsert.SQL.Text,true);
  qInsert.Parameters.Items[0].DataType:=ftFloat;
  qInsert.Parameters.Items[1].DataType:=ftFloat;
  qInsert.Parameters.Items[2].DataType:=ftFloat;
  qInsert.Parameters.Items[3].DataType:=ftString;
  qInsert.Parameters.Items[4].DataType:=ftString;
  qInsert.Parameters.Items[5].DataType:=ftDateTime;
  qInsert.Parameters.Items[6].DataType:=ftString;
  qInsert.Parameters.Items[7].DataType:=ftString;
  qInsert.Parameters.Items[8].DataType:=ftFloat;
  qInsert.Parameters.Items[9].DataType:=ftFloat;
  qInsert.Parameters.Items[10].DataType:=ftString;
  qInsert.Parameters.Items[11].DataType:=ftFloat;
  qInsert.Parameters.Items[12].DataType:=ftFloat;

  // 2.2 ������� ������� � ����� SrcFromTable � ������� � DstFromTable
  WriteLn('Start reading from ISU.');
  IF FileExists(SrcFromTable) Then
  Begin
    //�������� ����� SrcFromTable
    {$I-}
    AssignFile(ErrF, SrcFromTable);
    FileMode := 0;
    Reset(ErrF);
    {$I+}
    if (IOResult = 0) then
    Begin
      while not Eof(ErrF) do
      begin
        // ��������� ������
        ReadLn(ErrF, StrF);
        WriteLn(StrF);
        // ��������� ������
        vNN:=0;
        vID:=0;
        vRowID:=0;
        vNumOtgr:='';
        vFIO:='';
        vProd:='';
        vVzlSert:=0;
        vNumSec:=0;
        vCardID:='';
        vCardNum:=0;
        vStatus:=0;
        vDate:=Now;
        DateTimeToString(strDT,'dd.mm.yyyy',Now);
        vTime:='00:00:00';

        jjj:=0;
        jjj_s:='';
        repeat
          i1:=Pos(';',StrF);
          if i1>0 then
          Begin
            jjj_s:=copy(StrF,1,i1-1);
            delete(StrF,1,i1);
          end
          else
          begin
            jjj_s:=StrF;
          end;
          if jjj=0 then
            try
              vNN:=StrToReal(jjj_s);
            except
              vNN:=0;
            end;
          if jjj=1 then
            try
              vID:=StrToReal(jjj_s);
            except
              vID:=0;
            end;
          if jjj=2 then
            try
              vRowID:=StrToReal(jjj_s);
            except
              vRowID:=0;
            end;
          if jjj=3 then
            vNumOtgr:=jjj_s;
          if jjj=4 then
            vFIO:=jjj_s;
          if jjj=5 then
            vProd:=jjj_s;
          if jjj=6 then
            try
              vVzlSert:=StrToInteger(jjj_s);
            except
              vVzlSert:=0;
            end;
          if jjj=7 then
            try
              vNumSec:=StrToInteger(jjj_s);
            except
              vNumSec:=0;
            end;
          if vNumSec=0 then
          begin
            i2:=Pos('-',vNumOtgr);
            if i2>0 then
            try
              vNumSec:=StrToInteger(copy(vNumOtgr,i2+1,1));
            except
              vNumSec:=1;
            end
            else
              vNumSec:=1;
          end;
          if jjj=8 then
            try
              vCardID:=jjj_s;
            except
              vCardID:='';
            end;
          if jjj=9 then
            try
              vCardNum:=StrToInteger(jjj_s);
            except
              vCardNum:=0;
            end;
          if jjj=10 then
            try
              vStatus:=StrToInteger(jjj_s);
            except
              vStatus:=0;
            end;
          if jjj=11 then
            try
              vDate:=StrToDateFmt('dd.mm.yyyy',jjj_s);
              DateTimeToString(strDT,'yyyy-mm-dd'' ''hh:nn:ss',vDate);
              //              strDT:=jjj_s;
            except
              vDate:=Now;
              DateTimeToString(strDT,'yyyy-mm-dd'' ''hh:nn:ss',Now);
            end;
          if jjj=12 then
            try
              vTime:=jjj_s;
            except
              vTime:='00:00:00';
            end;
          inc(jjj);
        until i1=0;

        // ���� ��� ������ � qSh30DBF
        Writeln('Something before connect DBF...');
        qSh30DBF.Close;
        qSh30DBF.Parameters.ParamByName('KVIT_ID').Value:=vID;
        qSh30DBF.Open;
        qSh30DBF.First;
        Writeln('Something after connect DBF...');
        if not qSh30DBF.Eof then
        begin
          llll:=qSh30DBF.FieldByName('ID').Value;
          // ������ �������, ��������� DstFromTable
          if ((qSh30DBF.FieldByName('ID').Value=vID) and (qSh30DBF.FieldByName('STATUS').Value=0)) {or
             ((qSh30DBF.FieldByName('ID').Value<>vID) and (qSh30DBF.FieldByName('STATUS').Value>0))} then
          begin
            qUpdate.Parameters.ParamByName('NN').Value:=vNN;
            qUpdate.Parameters.ParamByName('ID').Value:=vID;
            qUpdate.Parameters.ParamByName('ROWID').Value:=vROWID;
            qUpdate.Parameters.ParamByName('NUM_OTGR').Value:=vNumOtgr;
            qUpdate.Parameters.ParamByName('FIO_DRIVER').Value:=vFIO;
            qUpdate.Parameters.ParamByName('PROD_ABBR2').Value:=vProd;
            qUpdate.Parameters.ParamByName('VZL_SERT').Value:=vVzlSert;
            qUpdate.Parameters.ParamByName('NUM_SEC').Value:=vNumSec;
            qUpdate.Parameters.ParamByName('CARD_ID').Value:=vCardId;//vCardId;
            qUpdate.Parameters.ParamByName('CARD_NUM').Value:=vCardNum;
            qUpdate.Parameters.ParamByName('STATUS').Value:=vStatus;
            qUpdate.Parameters.ParamByName('NP_DATA_O').Value:=vDate;
            qUpdate.Parameters.ParamByName('NP_TIMEP').Value:=vTime;
            qUpdate.Parameters.ParamByName('KVIT_ID').Value:=llll;
            Writeln('Something before upd DBF...');
            qUpdate.ExecSQL;
            WriteLn('Update '+qSh30DBF.FieldByName('ID').AsString+' - set '+floattostr(vID));
          end
          else
          begin
            WriteLn('Skip '+floattostr(vID));
          end;
        end
        else
        begin
          // ������ �� ������� - ��������� DstFromTable
          qInsert.Parameters.ParamByName('NN').Value:=vNN;
          qInsert.Parameters.ParamByName('ID').Value:=vID;
          qInsert.Parameters.ParamByName('ROWID').Value:=vROWID;
          qInsert.Parameters.ParamByName('NUM_OTGR').Value:=vNumOtgr;
          qInsert.Parameters.ParamByName('FIO_DRIVER').Value:=vFIO;
          qInsert.Parameters.ParamByName('PROD_ABBR2').Value:=vProd;
          qInsert.Parameters.ParamByName('VZL_SERT').Value:=vVzlSert;
          qInsert.Parameters.ParamByName('NUM_SEC').Value:=vNumSec;
          qInsert.Parameters.ParamByName('CARD_ID').Value:=vCardId;//vCardId;
          qInsert.Parameters.ParamByName('CARD_NUM').Value:=vCardNum;
          qInsert.Parameters.ParamByName('STATUS').Value:=vStatus;
          qInsert.Parameters.ParamByName('NP_DATA_O').Value:=vDate;
          qInsert.Parameters.ParamByName('NP_TIMEP').Value:=vTime;
          qInsert.ExecSQL;
          WriteLn('Insert '+floattostr(vID));
        end;
      end;
    end;
    CloseFile(ErrF);
  end;

  // ������ ������, ������� ������������� �� �������� �����
  qUpdate.Close;
  qUpdate.SQL.Clear;
  qUpdate.ConnectionString:=DstFromConn;
  qUpdate.SQL.Add('UPDATE '+DstFromTable+' SET STATUS=2 WHERE IS_UPD=0 AND STATUS=0');
  qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
  //qUpdate.ExecSQL;

  // 2.3 ������� ��������� ����� � �����
  SafeCopyFile(SrcFromTable,ArhFrom+FormatDateTime('yyyymmddhhnn',Now)+'.csv');
  DeleteFile(SrcFromTable);

  // 3.��������� ������ �� Experion � �������� ������ � ���
  // 3.1 ���������� ��������
  qUpdate.Close;
  qUpdate.SQL.Clear;
  qUpdate.ConnectionString:=DstFromConn;
  qUpdate.CommandTimeout:=30;
  qUpdate.SQL.Add('UPDATE '+DstFromTable+' SET ');
  qUpdate.SQL.Add('VZLIV=:VZLIV, TEMPER=:TEMPER, VES=:VES, XPL=:XPL, KOL_ALL=TARA_ALL+VES, STATUS=1, DEFI_MASS=4');
  qUpdate.SQL.Add('WHERE ID=:KVIT_ID');
  qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
  qUpdate.Parameters.Items[0].DataType:=ftFloat;
  qUpdate.Parameters.Items[1].DataType:=ftFloat;
  qUpdate.Parameters.Items[2].DataType:=ftFloat;
  qUpdate.Parameters.Items[3].DataType:=ftFloat;
  qUpdate.Parameters.Items[4].DataType:=ftFloat;

  WriteLn('Data transfering to KVIT.');

  // �������� ����� ��� �������� � ���
  try
    FileClose(FileCreate(DstToTable));
    IsOk:=true;
  except
    IsOk:=false;
  end;

  If IsOk then
  Begin
    //�������� ����� ��� �������� � ���
    {$I-}
    AssignFile(ErrF, DstToTable);
    FileMode := 2;
    Rewrite(ErrF);
    {$I+}
    if (IOResult = 0) then
    Begin
      // 3.2 ��������� ������ �� Experion
//      qPoint.Close;
//      qPoint.SQL.Clear;
//      qPoint.ConnectionString:=SrcToConn;
//      qPoint.SQL.Add('select dbo.UTCFILETIMEToDateTime(time)as EventTime,source,value,TransactionId,EventId');
//      qPoint.SQL.Add('from ems_vw_EMSEvents');
//      qPoint.SQL.Add('where Source in(''ID11STR'',''ID12STR'',''ID21STR'',''ID22STR'',''STATUS11'',''STATUS12'',');
//      qPoint.SQL.Add('''STATUS21'',''STATUS22'',''VES11'',''VES12'',''VES21'',''VES22'',''VZLIV11'',''VZLIV12'',''VZLIV21'',');
//      qPoint.SQL.Add('''VZLIV22'',''TEMPER11'',''TEMPER12'',''TEMPER21'',''TEMPER22'',''XPL11'',''XPL12'',''XPL21'',''XPL22'')');
//      qPoint.SQL.Add('and (dbo.UTCFILETIMEToDateTime(time)>{ts ''2009-06-06 23:59:59.000''}) and dbo.UTCFILETIMEToDateTime(time)>=:DATE_OTGR');
//      qPoint.SQL.Add('order by TransactionId,Source');

      //������� ���� ������ �������(������� ����)
//      qPoint.Parameters.ParseSQL(qPoint.SQL.Text,true);
//      qPoint.Parameters.Items[0].DataType:=ftDate;
//      dt:= DateOf(Now);//StrToDate('27.03.2007');
//      qPoint.Parameters.ParamByName('DATE_OTGR').Value:=dt;

//     Writeln('Connecting to Experion database...'+qPoint.SQL.Text);

//      str:=qPoint.SQL.Text;
//      str:=str+qPoint.SQL.Text;
//      Writeln(qPoint.SQL.Text);
      //showmessage(qPoint.SQL.Text);

//      Writeln('Something before connect...');
//      qPoint.Active:=True;
//      Writeln('Something after connect...');
    {  while not qPoint.Eof do
      begin
        writeln(qpoint.Fieldbyname('Source').AsString+' '+qpoint.Fieldbyname('EventTime').AsString+' '+qpoint.Fieldbyname('Value').AsString);
        qPoint.Next;
      end;}

      // 3.3 �������� ������ � DBF � ����� ��� �������� � ���
//      qUpdate.Close;
//      qUpdate.SQL.Clear;
//      qUpdate.ConnectionString:=DstFromConn;
//      qUpdate.SQL.Add('UPDATE '+DstFromTable+' SET ');
//      qUpdate.SQL.Add('VZLIV=:VZLIV, TEMPER=:TEMPER, VES=:VES, XPL=:XPL, KOL_ALL=TARA_ALL+VES, STATUS=1, DEFI_MASS=4');
//      qUpdate.SQL.Add('WHERE ID=:KVIT_ID');
//      qUpdate.Parameters.ParseSQL(qUpdate.SQL.Text,true);
//      qUpdate.Parameters.Items[0].DataType:=ftFloat;
//      qUpdate.Parameters.Items[1].DataType:=ftFloat;
//      qUpdate.Parameters.Items[2].DataType:=ftFloat;
//      qUpdate.Parameters.Items[3].DataType:=ftFloat;
//      qUpdate.Parameters.Items[4].DataType:=ftFloat;

//      WriteLn('Updating SH30.');
//      qPoint.First;
//      While not qPoint.Eof do
//      begin
      //  WriteLn(qpoint.FieldByName('EventTime').AsString);
{        if Copy(qpoint.FieldByName('Source').AsString,1,6)='STATUS' then
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
            qPoint.Next;//������������ �� ��������� ������
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
               (length(qPoint.FieldByName('Source').AsString)=7) then   // ���� �������� ID??STR
            Begin
              kvit_id:=qPoint.FieldByName('value').Value;
              try
                id:=StrToReal(Copy(VarToStr(kvit_id),2,Length(VarToStr(kvit_id))-1));
              except
                id:=0;
              end;
            end;
            if Copy(qpoint.FieldByName('Source').AsString,1,2)='ID' then break; // ���� ��������� ID - ������� �� �����
            if Copy(qpoint.FieldByName('Source').AsString,1,2)='STATUS' then // ���� ��������� STATUS
            begin
              qPoint.Prior; //������������
              break; // ������� �� �����
            end;
            // ���� ID �� ��������� - ���������� �� �����, ���� �� ��������
          end;
          if (id>0) and (ves1>100) and (vzliv>1) then
          Begin
            try
              xpl:=RoundTo(ves1/vzliv,-4);
            except
              xpl:=0;
            end;
            // ������� ������ ������� ID
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
              WriteLn('kvit_id');
              qUpdate.ExecSQL;
            except
              on E: Exception do WriteLn(E.Message);
            end;

            //��������� ������ ����� ��� �������� � ���
            //  StrF:=padl(floattostr(id),10)+';000010;'+FormatDateTime('ddmmyyyy',Now)+';'+FormatDateTime('hhnn',Now)+';'+inttostr(vzliv)+';'+AnsiReplaceStr(floattostr(xpl),'.',',')+';'+AnsiReplaceStr(floattostr(temper),'.',',')+';'+AnsiReplaceStr(floattostr(ves),'.',',')+';1;';
            //  WriteLn(ErrF,StrF);
          end;
          //Write('.');
        end;
        qPoint.Next;//������������ �� ����. ������
      end;}

      WriteLn('Data transfering to CSV.');

      qForCSV.Close;
      qForCSV.SQL.Clear;
      qForCSV.ConnectionString:=DstFromConn;
      qForCSV.CommandTimeout:=30;
      qForCSV.SQL.Add('select ID,NP_DATA_O,NP_TIMEP,VZLIV,XPL,TEMPER,VES from '+DstFromTable+' where NP_DATA_O=:DATE_OTGR and STATUS=1 ORDER BY id');
      qForCSV.Parameters.ParseSQL(qForCSV.SQL.Text,true);
      qForCSV.Parameters.Items[0].DataType:=ftDate;
      dt:= DateOf(Now);
//      StrF:=FormatDateTime('ddmmyyyy',dt);
      qForCSV.Parameters.ParamByName('DATE_OTGR').Value:=dt;
      qForCSV.Open;

// 22.03.2012 ������� �.  VES (������ ���) ������ ��������� �� ����� 3-� ������ ����� �������

      qForCSV.First;
      While not qForCSV.Eof do
      begin
        ves:=RoundTo(qForCSV.FieldByName('VES').AsFloat,-3);
        vzliv:=qForCSV.FieldByName('VZLIV').AsFloat;
        if(vzliv<>0) then xpl:=RoundTo(ves*1000/vzliv,-4)
        else   xpl:= RoundTo(qForCSV.FieldByName('XPL').AsFloat,-4);
        StrF:=PADL(trim(qForCSV.FieldByName('ID').AsString),10)+';000010;'+
              FormatDateTime('ddmmyyyy',qForCSV.FieldByName('NP_DATA_O').AsDateTime)+';'+
              copy(qForCSV.FieldByName('NP_TIMEP').AsString,1,2)+copy(qForCSV.FieldByName('NP_TIMEP').AsString,4,2)+';'+
              qForCSV.FieldByName('VZLIV').AsString+';'+
              AnsiReplaceStr(FloatToStr(xpl),'.',',')+';'+
              AnsiReplaceStr(qForCSV.FieldByName('TEMPER').AsString,'.',',')+';'+
              AnsiReplaceStr(FloatToStr(ves),'.',',')+';1;';
        WriteLn(ErrF,StrF);
        qForCSV.Next;//������������ �� ����. ������
      end;

      Writeln;
      Writeln('Data transfer is successful.');
    end;
    CloseFile(ErrF);

    // 3.4 ����������� ����� � �����
    SafeCopyFile(DstToTable,ArhTo+FormatDateTime('yyyymmddhhnn',Now)+'.csv');
  end;

  //finally
  qUpdate.Free;
  qInsert.Free;
  qSH30dbf.Free;
  qForCSV.Free;
//  qPoint.Free;
  CoUnInitialize;
//end;
end.



