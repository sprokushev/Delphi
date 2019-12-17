unit data;

{$define _CHECK}

interface

uses
  SysUtils, Classes, DB, OracleData, Oracle, types,
  OleServer, Outlook8, dialogs, DBTables, windows, ADODB, dateutils;

type
  TDM = class(TDataModule)
    OracleSession1: TOracleSession;
    Docs: TOracleDataSet;
    DocsRN: TFloatField;
    DocsPREF: TStringField;
    DocsNUMB: TStringField;
    DocsDOCDATE: TDateTimeField;
    DocsSUMM: TFloatField;
    DocsIN_STORE: TFloatField;
    DocsSRC: TStringField;
    DocsSRC_MOL: TStringField;
    DocsDEST: TStringField;
    DocsDEST_MOL: TStringField;
    azs_ID: TOracleDataSet;
    azs_IDRN: TFloatField;
    PriceQ: TOracleDataSet;
    LicardCode: TOracleDataSet;
    LicardCodeSTR_VALUE: TStringField;
    LicardCodeGROUP_NAME: TStringField;
    spec: TOracleDataSet;
    specRN: TFloatField;
    specCRN: TFloatField;
    specMAINEI: TFloatField;
    specADDEI: TFloatField;
    specNOMMODIF: TFloatField;
    specMODIF_CODE: TStringField;
    specMODIF_NAME: TStringField;
    specPRICE: TFloatField;
    specSUMM: TFloatField;
    specCOUNT: TFloatField;
    specUNIT: TStringField;
    specrealPrice: TFloatField;
    speclicCodeArr: TStringField;
    speclicCodeStr: TStringField;
    SetTTNExport: TOracleQuery;
    getExportProp: TOracleDataSet;
    outlook: TOutlookApplication;
    getRNTTN: TOracleDataSet;
    DocsBack: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    Query12: TQuery;
    Session1: TSession;
    tempQ: TOracleQuery;
    tempQ2: TOracleQuery;
    tempQ3: TOracleQuery;
    docsFull: TOracleDataSet;
    Database1: TDatabase;
    specFull: TOracleDataSet;
    OracleLogon1: TOracleLogon;
    ADOConnection1: TADOConnection;
    Query1: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure specCalcFields(DataSet: TDataSet);
  private
    function DelChars(str:  string):  string;
  public
    errors: TStrings;
    function toDos(str: string):string;
    procedure CreateDEPTTable(workDir: string);
    procedure CreateDEPTSTable(workDir: string);
    function GetAzsRN(azs_name: string): integer;
    procedure AddError(text: string);
    procedure CreatelistTTN(startDate, endDate: string; dest: integer);
    procedure FillStr(var str: string; count: integer; ch: byte);
    procedure SaveAzsToFile(dir: string);
    procedure SaveAzsToDBF(fileName:  string);
    procedure SaveAzsBackToFile(dir: string);
    function GetLicardCode(str: string): DWORD;
    function GetSection(dw: dword):word;
    procedure Sendmail(mail: string);
    procedure SetTTNExportVal(number: string; val: integer);
    procedure SaveTTNToDBF(workDir: string; catalogList: TList; startDate, endDate: string);
    procedure InsertTTN(fileTTN, dileSpec: string);
    procedure SaveDeptToDBF(workDir: string; rn: integer; startDate, endDate: string);
    procedure SaveSpecToDBF(workDir: string; rn: integer);
    function DateToStr(d1:TDateTime):string;    
  end;

var
  DM: TDM;

implementation

uses StrUtils, progressForm;

{$R *.dfm}

{ TDM }

function TDM.GetAzsRN(azs_name: string): integer;
var
  res:  integer;
begin
  res := -1;
  azs_ID.Close;
  azs_ID.SetVariable(0, azs_name);
  azs_ID.Open;

  if azs_ID.RecordCount > 0 then
    res := azs_ID.FieldValues['rn'];

  GetAzsRN := res;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  errors := TStringList.create;
end;

procedure TDM.AddError(text: string);
begin
  errors.Add(text);
end;

procedure TDM.CreatelistTTN(startDate, endDate: string; dest: integer);
begin
  docs.Close;
  docs.SetVariable(0, dest);
  docs.SetVariable(1, startdate);
  docs.SetVariable(2, endDate);
  docs.Open;

  docsBack.Close;
  docsBack.SetVariable(0, dest);
  docsBack.SetVariable(1, startdate);
  docsBack.SetVariable(2, endDate);
  docsBack.Open;
end;

procedure TDM.SaveAzsToFile(dir: string);
label save1, exit1;
var
id, i, j, res:  integer;
p: ^integer;
f:  file;
s:  string;
ss: string;
int:  WORD;
dw:   DWORD;
d:  double;
number, fileName: string;
reserve:  array[0..255] of byte;
mc: string;
zero: byte;
begin
  zero := 0;
  docs.First;
  for i:=0 to docs.RecordCount - 1 do begin
    id := docs.FieldValues['rn'];
  //проверяем, экспортирован ли уже накладная
    getExportProp.Close;
    getExportProp.SetVariable(0, id);
    getExportprop.Open;

    if getExportProp.RecordCount = 0 then
      goto save1;

{$ifdef _CHECK }
    if getExportProp.FieldValues['num_value'] = 1 then begin
    //накладная уже экспортирована, идем на следующую
      docs.Next;
      continue;
    end;
{$endif}

save1:
    s := docs.FieldValues['pref'];
    s := DelChars(s);
    if length(s) < 2 then
      filename := '#'
    else
      filename := '#' + s[length(s) - 1] + s[length(s)];

    s := Trim(docs.fieldValues['numb']);
    for j:=0 to 4 - length(s) do
      fileName := fileName + '0';

    for j:=1 to length(s) do
      filename := filename + s[j];

    filename := filename + '.' +
      AnsiMidStr(docs.FieldValues['dest'], 1, 3);

    spec.close;
    spec.SetVariable(0, id);
    spec.SetVariable(1, id);
    spec.Open;

    AssignFile(f, dir + fileName);
    Rewrite(f, 1);

    //в заголовок пишем номер накладной
    ss := Trim(docs.FieldValues['pref']) + '-' +
      Trim(docs.FieldValues['numb']); //ListView1.Items[i].Caption;
//    CharToOEM(PChar(ss), PChar(ss));
    BlockWrite(f, ss[1], length(ss));
    BlockWrite(f, reserve, 15 - length(ss));
    number := ss;

//пишем спецификацию
    while not spec.eof do begin
      BlockWrite(f, int, 2);  //Код продукта
      BlockWrite(f, reserve, 30); //штрих-код
      //полное наименование
//      Setlength(ss, 80);
      FillStr(ss, 80, 0);

      ss := spec.fieldValues['modif_code'];
      try
        BlockWrite(f, ss[1], length(ss), res);
        BlockWrite(f, reserve, 80 - length(ss), res);
      except
        ShowMessage(SysErrorMessage(GetLastError));
      end;
      //Сокращенное наименование
//      Setlength(ss, 20);
      FillStr(ss, 20, 0);
      ss := spec.fieldValues['modif_code'];
      BlockWrite(f, ss[1], length(ss));
      BlockWrite(f, reserve, 20 - length(ss));
      //единица измерения
//      Setlength(ss, 10);
      FillStr(ss, 10, 0);
      ss := spec.fieldValues['unit'];
      BlockWrite(f, ss[1], length(ss));
      BlockWrite(f, reserve, 10 - length(ss));
      //цена продукта
      d := specRealPrice.Value;
      if d = -1 then begin
        AddError('В накладной ' + number + ' не указана цена для ' +
        spec.fieldValues['modif_code']);
        close(f);
        deleteFile(Pchar(fileName));
        goto exit1;
      end;
      BlockWrite(f, d, 8);
      //резерв
      int := 0;
      BlockWrite(f, int, 2);
      //штрих-код (пока пропустим)
      BlockWrite(f, reserve[0], 30);
      //количество товаров
      dw := spec.FieldValues['count']*1000;
      BlockWrite(f, dw, 4);
      //Цена продукта в коп.
      dw := Round(specRealPrice.value*100); //Round(spec.FieldValues['price']*100);
      BlockWrite(f, dw, 4);
      //не используется
      d := 0;
      BlockWrite(f, d, 8);
      BlockWrite(f, d, 8);
      BlockWrite(f, d, 8);
      BlockWrite(f, int, 2);
      //КОды для кард Ликарда
      if speclicCodeArr.Value = '' then begin
        AddError('В накладной ' + ss + ' не указан код Ликарда для ' +
        spec.fieldValues['modif_code']);
        close(f);
        deleteFile(pchar(fileName));
        goto exit1;
      end;
      dw := GetLicardCode(speclicCodeArr.Value);
      BlockWrite(f, dw, 4);
      //код секции товара
      int := GetSection(dw);
      BlockWrite(f, int, 2);
      //резерв
      int := 0;
      BlockWrite(f, int, 2);
      //Цена продукта в коп, для ЛИКАРДА
      dw := Round(specRealPrice.value*100); //Round(spec.FieldValues['price']*100);
      BlockWrite(f, dw, 4);
      //резерв
      BlockWrite(f, reserve, 22);
      spec.Next;
    end;
    CloseFile(f);
    //отмечаем, что эту ТТН мы скинули
    SetTTNExport.Close;
    SetTTNExport.SetVariable(0, DocsRN.Value);
    SetTTNExport.SetVariable(2, 1);
    SetTTNExport.Execute;
exit1:
    docs.Next;
  end;
end;

procedure TDM.FillStr(var str: string; count: integer; ch: byte);
var
i: integer;
begin
  str := '';
  for i:=1 to count do
    str := str + Chr(ch);
end;

procedure TDM.specCalcFields(DataSet: TDataSet);
begin
//определяем код ликарда
  LicardCode.Close;
  licardCode.SetVariable(0, specRN.Value);
  licardCode.Open;
  if licardCode.RecordCount > 0 then begin
    speclicCodeArr.Value := licardCode.FieldValues['str_value'];
    speclicCodeStr.Value := licardCode.FieldValues['group_name'];
  end
  else begin
    speclicCodeStr.Value := '';
    speclicCodeArr.Value := '';
  end;

//определяем цену
  priceQ.Close;
  priceQ.SetVariable(0, specNOMMODIF.Value);
  priceQ.Open;
  if priceQ.RecordCount >0 then
    specRealPrice.Value := priceQ.Fieldvalues['price']
  else
    specRealPrice.Value := -1;

end;

function TDM.GetLicardCode(str: string): DWORD;
var
res:  dword;
i:    integer;
s:     string;
begin
  if str = '' then begin
    GetLicardCode := 0;
    exit;
  end;

  res := 0;

  for i:=1 to 12 do begin
    s := s + str[i];

    if (i mod 3) = 0 then begin
      res := res shr 8;
      res := res or (StrToInt(s) shl 24);
      s := '';
    end;
  end;

  GetLicardCode := res;
end;

function TDM.GetSection(dw: dword): word;
//получить код товара, услуги
var
res:  WORD;
begin
  res := dw and $000000ff;

  GetSection := res
end;

procedure TDM.Sendmail(mail: string);
var
i:  integer;
begin
  if errors.Count = 0 then
    exit;
  with outlook.CreateItem(olMailItem) as mailitem do begin
    To_ := mail;
    cc := mail;
    Subject := 'ошибка по генерации накладных';
    Body := '';    
    for i:=0 to errors.Count - 1 do
      Body := Body + errors[i] + Chr(13) + Chr(10);
    Send;
  end;
end;

procedure TDM.SetTTNExportVal(number: string; val: integer);
//ставим у накладной свойство экспорта
var
newVal, oldval, rn: integer;
pref, numb: string;
begin
//узнаем rn накладной
  pref := AnsiMidStr(number, 1, AnsiPos('-', number) - 1);  
  numb := AnsiMidStr(number, Ansipos('-', number) + 1, 100);
  getRNTTN.Close;
  getRNTTN.SetVariable(0, pref);
  getRNTTN.SetVariable(1, numb);
  getRNTTN.Open;
  rn := getRNTTN.FieldValues['rn'];

  getExportProp.Close;
  getExportProp.SetVariable(0, rn);
  getExportprop.Open;
  oldVal := getExportProp.FieldValues['num_value'];

  case oldVal of
  1: newVal := 2;
  0: begin
    newVal := 0;
    AddError('Есть возвращенная накладная с кодом экспорта 0 (' + number + ')');
    end;
  2:begin
    newVal := 0;
    AddError('Есть возвращенная накладная с кодом экспорта 2 (' + number + ')');
    end;
  end;
  
  SetTTNExport.Close;
  SetTTNExport.SetVariable(0, rn);
  SetTTNExport.SetVariable(2, newval);
  SetTTNExport.Execute;
end;

procedure TDM.SaveAzsBackToFile(dir: string);
label save1, exit1;
var
id, i, j:  integer;
p: ^integer;
f:  file of byte;
s:  string;
ss: string;
int:  WORD;
dw:   DWORD;
kol:  integer;
d:  double;
number, fileName: string;
reserve:  array[0..255] of byte;
mc: string;
begin
  docsBack.First;
  for i:=0 to docsBack.RecordCount - 1 do begin
    id := docsBack.FieldValues['rn'];
  //проверяем, экспортирован ли уже накладная
    getExportProp.Close;
    getExportProp.SetVariable(0, id);
    getExportprop.Open;

    if getExportProp.RecordCount = 0 then
      goto save1;

{$ifdef _CHECK } 
    if getExportProp.FieldValues['num_value'] = 1 then begin
    //накладная уже экспортирована, идем на следующую
      docs.Next;
      continue;
    end;
{$endif}
save1:
    s := docsBack.FieldValues['pref'];
    s := DelChars(s);
    if length(s) < 2 then
      filename := '#'
    else
      filename := '#' + s[length(s) - 1] + s[length(s)];
    
    s := Trim(docsBack.fieldValues['numb']);
    for j:=0 to 4 - length(s) do
      fileName := fileName + '0';
      
    for j:=1 to length(s) do
      filename := filename + s[j];

    filename := filename + '.' +
      AnsiMidStr(docsBack.FieldValues['src'], 1, 3);

    spec.close;
    spec.SetVariable(0, id);
    spec.SetVariable(1, id);
    spec.Open;

    AssignFile(f, dir + fileName);
    Rewrite(f);

    //в заголовок пишем номер накладной
    ss := Trim(docsBack.FieldValues['pref']) + '-' +
      Trim(docsBack.FieldValues['numb']); //ListView1.Items[i].Caption;
//    CharToOEM(PChar(ss), PChar(ss));
    BlockWrite(f, ss[1], length(ss));
    BlockWrite(f, reserve, 15 - length(ss));
    number := ss;

//пишем спецификацию
    while not spec.eof do begin
      BlockWrite(f, int, 2);  //Код продукта
      BlockWrite(f, reserve, 30); //штрих-код
      //полное наименование
//      Setlength(ss, 80);
//      FillStr(ss, 80, 0);

      ss := spec.fieldValues['modif_code'];
      try
        BlockWrite(f, ss[1], length(ss));
        BlockWrite(f, reserve, 80 - length(ss));
      except
        ShowMessage(SysErrorMessage(GetLastError));
      end;
      //Сокращенное наименование
//      Setlength(ss, 20);
//      FillStr(ss, 20, 0);
      ss := spec.fieldValues['modif_code'];
      BlockWrite(f, ss[1], length(ss));
      BlockWrite(f, reserve, 20 - length(ss));      
      //единица измерения
//      Setlength(ss, 10);
//      FillStr(ss, 10, 0);
      ss := spec.fieldValues['unit'];
      BlockWrite(f, ss[1], length(ss));
      BlockWrite(f, reserve, 10 - length(ss));      
      //цена продукта
      d := specRealPrice.Value;
      if d = -1 then begin
        AddError('В накладной ' + number + ' не указана цена для ' +
        spec.fieldValues['modif_code']);
        close(f);
        deleteFile(pchar(fileName));
        goto exit1;
      end;
      BlockWrite(f, d, 8);
      //резерв
      int := 0;
      BlockWrite(f, int, 2);
      //штрих-код (пока пропустим)
      BlockWrite(f, reserve[0], 30);
      //количество товаров
      kol := -spec.FieldValues['count']*1000;
      BlockWrite(f, kol, 4);
      //Цена продукта в коп.
      dw := Round(specRealPrice.value*100); //Round(spec.FieldValues['price']*100);
      BlockWrite(f, dw, 4);
      //не используется
      d := 0;
      BlockWrite(f, d, 8);
      BlockWrite(f, d, 8);
      BlockWrite(f, d, 8);
      BlockWrite(f, int, 2);
      //КОды для кард Ликарда
      if speclicCodeArr.Value = '' then begin
        AddError('В накладной ' + ss + ' не указан код Ликарда для ' +
        spec.fieldValues['modif_code']);
        close(f);
        deleteFile(pchar(fileName));
        goto exit1;
      end;
      dw := GetLicardCode(speclicCodeArr.Value);
      BlockWrite(f, dw, 4);
      //код секции товара
      int := GetSection(dw);
      BlockWrite(f, int, 2);
      //резерв
      int := 0;
      BlockWrite(f, int, 2);
      //Цена продукта в коп, для ЛИКАРДА
      dw := Round(specRealPrice.value*100); //Round(spec.FieldValues['price']*100);
      BlockWrite(f, dw, 4);
      //резерв
      BlockWrite(f, reserve, 22);
      spec.Next;
    end;
    CloseFile(f);
    //отмечаем, что эту ТТН мы скинули
    SetTTNExport.Close;
    SetTTNExport.SetVariable(0, DocsRN.Value);
    SetTTNExport.SetVariable(2, 1);
    SetTTNExport.Execute;
exit1:
    docsBack.Next;
  end;
end;

procedure TDM.SaveAzsToDBF(fileName: string);
var
vrem: string;
begin
{with Session1 do
begin
exit;
  active := true;
    ConfigMode := cmSession;
  try
   AddStandardAlias('TEMPDB', fileName, 'FOXPRO'); //FOXPRO
  finally
      ConfigMode := cmAll;
  end;
end;
 with database1 do
 begin
   databasename:='tst';
   LoginPrompt := False;
   Params.Values['PATH'] := extractfilepath(filename);
   DriverName:='Microsoft FoxPro Driver (*.dbf)';
   AliasName:='TEMPDB';
 end;
 query1.paramcheck := false;
// Query1.DatabaseName := 'tst';
 Query1.SQL.Clear;
 vrem:=Trim(ChangeFileExt(extractfilename(fileName),' '));
 query1.sql.Add('CREATE TABLE '''+vrem+''' (');
 query1.sql.Add('last_name CHAR(20),');
 query1.sql.Add('first_name CHAR(15),');
 query1.sql.Add('salary DECIMAL(10,2));');  //NUMERIC
 query1.ExecSQL;
 query1.close;

 session1.Active := false;
 session1.DeleteAlias('TEMPDB');      }
end;

procedure TDM.CreateDEPTTable(workDir: string);
var
vrem: string;
fileName: string;
begin
  fileName := workDir + '\' + 'trdept.dbf';
  if fileExists(fileName) then
    DeleteFile(pchar(fileName));

//  vrem := 'Provider=MSDASQL.1;Persist Security Info=False;' +
//    'Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='''+WorkDir + ''';SourceType=DBF;' +
//    'Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes';

  vrem:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB='+workdir+';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
    
  adoConnection1.ConnectionString := vrem;
  adoConnection1.Connected:=true;


{
  with Session1 do begin
    active := true;
    ConfigMode := cmSession;
    try
      AddStandardAlias('TEMPDB', fileName, 'FOXPRO'); //FOXPRO
    finally
      ConfigMode := cmAll;
    end;
  end;
   with database1 do begin
     databasename:='tst';
     LoginPrompt := False;
     Params.Values['PATH'] := extractfilepath(filename);
     DriverName:='Microsoft FoxPro Driver (*.dbf)';
     AliasName:='TEMPDB';
  end;
}  
//  query1.paramcheck := false;
//  Query1.DatabaseName := 'tst';
  Query1.SQL.Clear;
  vrem:=Trim(ChangeFileExt(extractfilename(fileName),' '));
  query1.sql.Add('CREATE TABLE '+vrem+' (');
  query1.sql.Add('NRN         n(20, 4),');
  query1.sql.Add('SDOCTYPE    c(10),');
  query1.sql.Add('SPREF       c(10),');
  query1.sql.Add('SNUMB       c(10),');
  query1.sql.Add('DDOCDATE    d,');
  query1.sql.Add('NSTATUS     n(20, 4),');
  query1.sql.Add('NIN_STATUS  n(20, 4),');
  query1.sql.Add('DWORK_DATE  d,');
  query1.sql.Add('DIN_WORK_D  d,');
  query1.sql.Add('SDIRDOC     c(10),');
  query1.sql.Add('SDIRNUMB    c(20),');
  query1.sql.Add('DDIRDATE    d,');
  query1.sql.Add('SSTOPER     c(20),');
  query1.sql.Add('SFACEACC    c(20),');
  query1.sql.Add('SFACC_CURR  c(10),');
  query1.sql.Add('SSTORE      c(20),');
  query1.sql.Add('SMOL        c(20),');
  query1.sql.Add('SSHEEPVIEW  c(20),');
  query1.sql.Add('SSUBDIV     c(20),');
  query1.sql.Add('SCURRENCY   c(10),');
  query1.sql.Add('NCURCOURS   n(20, 4),');
  query1.sql.Add('NCURBASE    n(20, 4),');
  query1.sql.Add('NSUMMWITHN  n(20, 4),');
  query1.sql.Add('NFA_CURCOU  n(20, 4),');
  query1.sql.Add('NFA_CURBAS  n(20, 4),');
  query1.sql.Add('SRECIPDOC   c(10),');
  query1.sql.Add('SRECIPNUMB  c(20),');
  query1.sql.Add('DRECIPDATE  d,');
  query1.sql.Add('SFERRYMAN   c(20),');
  query1.sql.Add('SGETCONFIR  c(80),');
  query1.sql.Add('SWAYBLADEN  c(20),');
  query1.sql.Add('SDRIVER     c(20),');
  query1.sql.Add('SCAR        c(20),');
  query1.sql.Add('SROUTE      c(10),');
  query1.sql.Add('STRAILER1   c(20),');
  query1.sql.Add('STRAILER2   c(20),');
  query1.sql.Add('SIN_STORE   c(20),');
  query1.sql.Add('SIN_MOL     c(20),');
  query1.sql.Add('SIN_STOPER  c(20),');
  query1.sql.Add('NIN_CURCOU  n(20, 4),');
  query1.sql.Add('NIN_CURBAS  n(20, 4),');
  query1.sql.Add('SIN_CURREN  c(10),');
  query1.sql.Add('SCOMMENTS   c(160),');
  query1.sql.Add('SOUT_SUBDI  c(20),');
  query1.sql.Add('SVDOCTYPE   c(10),');
  query1.sql.Add('SVDOCNUMB   c(20),');
  query1.sql.Add('DVDOCDATE   d,');
  query1.sql.Add('SGRAPHP     c(20),');
  query1.sql.Add('SJUR_PERS   c(20))');
//  query1.SQL.SaveToFile('query1');
  query1.ExecSQL;
  query1.close;

//  session1.DeleteAlias('TEMPDB');
//  session1.Active := false;
 
end;

procedure TDM.CreateDEPTSTable(workDir: string);
var
vrem: string;
fileName: string;
begin
  fileName := workDir + '\' + 'trdepts.dbf';
  if fileExists(fileName) then
    DeleteFile(pchar(fileName));

{  with Session1 do begin
    active := true;
    ConfigMode := cmSession;
    try
      AddStandardAlias('TEMPDB', fileName, 'FOXPRO'); //FOXPRO
    finally
      ConfigMode := cmAll;
    end;
  end;
   with database1 do begin
     databasename:='tst';
     LoginPrompt := False;
     Params.Values['PATH'] := extractfilepath(filename);
     DriverName:='Microsoft FoxPro Driver (*.dbf)';
     AliasName:='TEMPDB';
  end;
}  
  query1.paramcheck := false;
//  Query1.DatabaseName := 'tst';
  Query1.SQL.Clear;
  vrem:=Trim(ChangeFileExt(extractfilename(fileName),' '));
  query1.sql.Add('CREATE TABLE '+vrem+' (');
  query1.sql.Add('NRN n(20, 4),');
  query1.sql.Add('NPRN n(20, 4),');
  query1.sql.Add('SNOMEN c(20),');
  query1.sql.Add('NNOMEN_TYP n(20, 4),');
  query1.sql.Add('SNOMMODIF c(20),');
  query1.sql.Add('SNOMPACK c(20),');
  query1.sql.Add('NPACK_QUAN n(20, 4),');
  query1.sql.Add('NPARTY n(20, 4),');
  query1.sql.Add('SGOODSPART c(20),');
  query1.sql.Add('SSERNUMB c(20),');
  query1.sql.Add('SCOUNTRY c(40),');
  query1.sql.Add('SGTD c(40),');
  query1.sql.Add('NPRICE n(20, 4),');
  query1.sql.Add('NQUANT n(20, 4),');
  query1.sql.Add('NQUANTALT n(20, 4),');
  query1.sql.Add('NPRICEMEAS n(20, 4),');
  query1.sql.Add('NSUMMWITHN n(20, 4),');
  query1.sql.Add('DBEGINDATE d,');
  query1.sql.Add('DENDDATE d,');
  query1.sql.Add('SMEAS_MAIN c(10),');
  query1.sql.Add('SMEAS_ALT c(10),');
  query1.sql.Add('SMEAS_PACK c(10),');
  query1.sql.Add('SARTICLE c(20),');
  query1.sql.Add('SNOTE c(240));');  //NUMERIC
  query1.ExecSQL;
  query1.close;

//  session1.DeleteAlias('TEMPDB');
//  session1.Active := false;
end;

procedure TDM.SaveTTNToDBF(workDir: string; catalogList: TList;
  startDate, enddate: string);
//сохраняем все накладные в файл
var
f:  textFile;
catalog:  ^integer;
i:    integer;
begin
//  AssignFile(f, workDir + '\catalogs.log');
//  Rewrite(f);

  f_progress.ProgressBar1.Max := catalogList.Count;
  f_progress.ProgressBar1.Position := 0;

  for i:=0 to catalogList.Count - 1 do begin
    catalog := catalogList.Items[i];

    DM.tempQ.SQL.Clear;
    DM.tempQ.SQL.Add('select name from v_acatalog where rn=' +
      IntToStr(catalog^));
    DM.tempQ.Execute;
    if DM.tempQ.RowCount > 0 then
      f_progress.Label1.Caption := 'Каталог: ' +  DM.tempQ.Field('name');

    SaveDeptToDbf(workDir, catalog^, startDate, endDate);

    f_progress.ProgressBar1.StepBy(1);
  end;
//  CloseFile(f);
end;

procedure TDM.InsertTTN(fileTTN, dileSpec: string);
//сохраняем информацию о ТТН в одну таблицу и спец. к ней в другую
begin

end;

function TDM.DelChars(str: string): string;
//удаляем из строки все, кроме цифр
var
res:  string;
i:  integer;
begin
  res := '';
  for i:=0 to length(str) do
    if (str[i] >= '0') and (str[i] <= '9') then
      res := res + str[i];
  DelChars := res;
end;

procedure TDM.SaveDeptToDBF(workDir: string; rn: integer; startDate, endDate:string);
//сохранить ттн в dbf
var
i, j:  integer;
dt: TFieldType;
fileName: string;
s:  string;
v:  variant;
begin
  fileName := workDir + '\' + 'trdept.dbf';

{  with Session1 do begin
    active := true;
    ConfigMode := cmSession;
    try
      AddStandardAlias('TEMPDB', fileName, 'FOXPRO'); //FOXPRO
    finally
      ConfigMode := cmAll;
    end;
  end;
   with database1 do begin
     databasename:='tst';
     LoginPrompt := False;
     Params.Values['PATH'] := extractfilepath(filename);
     DriverName:='Microsoft FoxPro Driver (*.dbf)';
     AliasName:='TEMPDB';
  end;}
  query1.paramcheck := false;
//  Query1.DatabaseName := 'tst';

//выбираем ттн
  DM.docsFull.Close;
  DM.docsFull.SetVariable(0, rn);
  DM.docsFull.SetVariable(1, startDate);
  DM.docsFull.SetVariable(2, endDate);
  DM.docsFull.Open;

//идем по накладным
  f_progress.ProgressBar2.Position := 0;
  f_progress.ProgressBar2.Max := docsFull.RecordCount;
  ShortDateFormat := 'dd.mm.yyyy';
  while not DM.docsFull.Eof do begin
    f_progress.Label2.Caption := 'Документ: ' + Trim(docsFull.FieldValues['spref']) +
      '-' + Trim(docsFull.FieldValues['snumb']);
    Query1.SQL.Clear;
    Query1.SQL.Add('insert into trdept (NRN, SDOCTYPE, spref, snumb, ddocdate, nstatus, nin_status, ');
    Query1.SQL.Add('DWORK_DATE, DIN_WORK_D, sdirdoc, sdirnumb, ddirdate, sstoper, ');
    Query1.SQL.Add('sfaceacc, sfacc_curr, sstore, smol, ssheepview, scurrency, ');
    Query1.SQL.Add('ssubdiv, ncurcours, ncurbase, nsummwithn, nfa_curcou, nfa_curbas, ');
    Query1.SQL.Add('srecipdoc, srecipnumb, drecipdate, sferryman, sgetconfir, swaybladen, ');
    Query1.SQL.Add('sdriver, scar, sroute, strailer1, strailer2, sin_store, ');
    Query1.SQL.Add('sin_mol, sin_stoper, nin_curcou, nin_curbas, sin_curren, scomments, sout_subdi, ');
    Query1.SQL.Add('svdoctype, svdocnumb, dvdocdate, sgraphp, sjur_pers');
    Query1.SQL.Add(' ) values(');
    Query1.SQL.Add(IntToStr(DM.docsFull.FieldValues['nrn']) + ', ');
    Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sdoctype']) + '", ');
    Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['spref']) + '", ');
    Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['snumb']) + '", ');
    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('ddocdate').AsDateTime)+'"),');
//    Query1.SQL.Add('"' + DateToStr(DM.docsFull.FieldValues['ddocdate']) + '",');
    Query1.SQL.Add(IntToStr(DM.docsFull.FieldValues['nstatus']) + ', ');
    Query1.SQL.Add(IntToStr(DM.docsFull.FieldValues['nin_status']) + ', ');
//    Query1.SQL.Add('"' + DateToStr(DM.docsFull.FieldValues['dwork_date']) + '", ');
    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('dwork_date').AsDateTime)+'"),');

    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('dIN_Work_date').AsDateTime)+'"),');    
{    if DM.docsFull.FieldByName('din_WORK_Date').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + DateToStr(DM.docsFull.FieldValues['dIN_work_date']) + '",');}

    if DM.docsFull.FieldByName('sdirdoc').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sdirdoc']) + '", ');

    if DM.docsFull.FieldByName('sdirnumb').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sdirnumb']) + '", ');

{    if DM.docsFull.FieldByName('ddirDate').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + DateToStr(DM.docsFull.FieldValues['ddirdate']) + '", ');}
    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('ddirdate').AsDateTime)+'"),');      

    Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sstoper']) + '", ');

    if DM.docsFull.FieldByName('sfaceAcc').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + DateToStr(DM.docsFull.FieldValues['cFaceAcc']) + '", ');

    if  DM.docsFull.FieldByName('sfacc_currency').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sfacc_currency']) + '",');

    if DM.docsFull.FieldByName('sstore').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sstore']) + '",');

    if DM.docsFull.FieldByName('smol').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['smol']) + '", ');

    if DM.docsFull.FieldByName('ssheepview').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['ssheepview']) + '", ');

    if DM.docsFull.FieldByName('scurrency').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['scurrency']) + '", ');

    if DM.docsFull.FieldByName('ssubdiv').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['ssubdiv']) + '", ');

    Query1.SQL.Add(IntToStr(DM.docsFull.FieldValues['ncurcours']) + ', ');

    Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['ncurBase']) + ', ');

    if DM.docsFull.FieldByName('nsummwithnds').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['nsummwithnds']) + ', ');

    if DM.docsFull.FieldByName('nfa_curcours').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['nfa_curcours']) + ', ');

    if DM.docsFull.FieldByName('nfa_curbase').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['nfa_curbase']) + ', ');

    if DM.docsFull.FieldByName('srecipdoc').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['srecipdoc']) + '", ');

    if DM.docsFull.FieldByName('srecipnumb').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['srecipnumb']) + '", ');

{    if DM.docsFull.FieldByName('drecipdate').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('''' + DateToStr(DM.docsFull.FieldValues['drecipdate']) + ''', ');}
    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('drecipdate').AsDateTime)+'"),');

    if DM.docsFull.FieldByName('sferryman').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sferryman']) + '", ');

    if DM.docsFull.FieldByName('sgetconfirm').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sgetconfirm']) + '", ');

    if DM.docsFull.FieldByName('swaybladenumb').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['swaybladenumb']) + '", ');

    if DM.docsFull.FieldByName('sdriver').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sdriver']) + '", ');

    if DM.docsFull.FieldByName('scar').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['scar']) + '", ');

    if DM.docsFull.FieldByName('sroute').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sroute']) + '", ');

    if DM.docsFull.FieldByName('strailer1').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['strailer1']) + ''', ');

    if DM.docsFull.FieldByName('strailer2').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['strailer2']) + '", ');

    if DM.docsFull.FieldByName('sin_store').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sin_Store']) + '", ');

    if DM.docsFull.FieldByName('sin_mol').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sin_mol']) + '", ');

    if DM.docsFull.FieldByName('sin_stoper').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sin_Stoper']) + '", ');

    if DM.docsFull.FieldByName('nin_curcours').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['nin_curcours']) + ', ');

    if DM.docsFull.FieldByName('nin_curbase').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add(FloatToStr(DM.docsFull.FieldValues['nin_curbase']) + ', ');

    if DM.docsFull.FieldByName('sin_currency').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sin_currency']) + '", ');

    if DM.docsFull.FieldByName('scomments').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['scomments']) + '", ');

    if DM.docsFull.FieldByName('sout_subdiv').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sout_subdiv']) + '", ');

    if DM.docsFull.FieldByName('svalid_doctype').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['svalid_doctype']) + '", ');

    if DM.docsFull.FieldByName('svalid_docnumb').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['svalid_docnumb']) + '", ');

{    if DM.docsFull.FieldByName('dvalid_docdate').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('''' + DateToStr(DM.docsFull.FieldValues['dvalid_docdate']) + '", ');}
    Query1.sql.Add('ctod("'+DateToStr(docsFull.fieldbyname('dvalid_docdate').AsDateTime)+'"),');      

    if DM.docsFull.FieldByName('sgraphpoint').IsNull then
      Query1.SQL.Add('null, ')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sgraphpoint']) + '", ');

    if DM.docsFull.FieldByName('sjur_pers').IsNull then
      Query1.SQL.Add('null')
    else
      Query1.SQL.Add('"' + toDos(DM.docsFull.FieldValues['sjur_pers']) + '"');

    Query1.SQL.Add(')');
    Query1.ExecSQL;
    Query1.Close;

//теперь занисим специфик. по этому документу
    SaveSpecToDBF(workDir, DM.docsFull.FieldValues['nrn']);

    f_progress.ProgressBar2.StepBy(1);
    f_progress.Update;
    DM.docsFull.Next;
  end;
//  session1.DeleteAlias('TEMPDB');
//  session1.Active := false;
end;

function TDM.toDos(str: string): string;
var
res:  string;
begin
  res := str;
  CharToOem(PChar(res), PChar(res));

  res := AnsiReplaceStr(res, '"', '''');

  res := trim(res);
  toDos := res;
end;

procedure TDM.SaveSpecToDBF(workDir: string; rn: integer);
begin
  specFull.Close;
  specFull.SetVariable(0, rn);
  specFull.Open;

  while not specFull.Eof do begin

    with query1.SQL do begin
      clear;
      Add('insert into trdepts(nrn, nprn, snomen, nnomen_typ, ');
      Add('snommodif, snompack, npack_quan, nparty, sgoodspart, ');
      Add('ssernumb, scountry, sgtd, nprice, nquant, nquantalt, npricemeas, ');
      Add('nsummwithn, dbegindate, denddate, smeas_main, smeas_alt, smeas_pack, sarticle, snote');
      Add(') ');
      Add('values(');
      Add(IntToStr(specFull.FieldValues['nrn']) + ', ');
      Add(intToStr(specFull.FieldValues['nprn']) + ', ');
      Add('"' + toDos(specFull.FieldValues['snomen']) + '", ');
      Add(FloatToStr(specFull.FieldValues['nnomen_type']) + ', ');

      if specFull.FieldByName('snommodif').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['snommodif']) + '", ');

      if specFull.FieldByName('snomnmodifpackname').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['snomnmodifpackname']) + '", ');

      if specFull.FieldByName('npack_quant').IsNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['npack_quant']) + ', ');

      if specFull.FieldByName('nparty').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['nparty']) + ', ');

      if specFull.FieldByName('sgoodsparty').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['sgoodsparty']) + '", ');

      if specFull.FieldByName('ssernumb').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['ssernumb']) + '", ');

      if specFull.FieldByName('scountry').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['scountry']) + '", ');

      if specFull.FieldByName('sgtd').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['sgtd']) + '", ');

      if specFull.FieldByName('nprice').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['nprice']) + ', ');

      if specFull.FieldByName('nquant').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['nquant']) + ', ');

      if specFull.FieldByName('nquantAlt').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['nquantalt']) + ', ');

      if specFull.FieldByName('npricemeas').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['npricemeas']) + ', ');

      if specFull.FieldByName('nsummwithnds').isNull then
        Add('null, ')
      else
        Add(FloatToStr(specFull.FieldValues['nsummwithnds']) + ', ');

{      if specFull.FieldByName('dbegindate').isNull then
        Add('null, ')
      else
        Add('''' + DateToStr(specFull.FieldValues['dbegindate']) + ''', ');}

    Query1.sql.Add('ctod("'+DateToStr(specFull.fieldbyname('dbegindate').AsDateTime)+'"),');


{      if specFull.FieldByName('denddate').isNull then
        Add('null, ')
      else
        Add('''' + DateToStr(specFull.FieldValues['dbegindate']) + ''', ');}
    Query1.sql.Add('ctod("'+DateToStr(specFull.fieldbyname('denddate').AsDateTime)+'"),');


      if specFull.FieldByName('smeas_main').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['smeas_main']) + '", ');

      if specFull.FieldByName('smeas_alt').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['smeas_alt']) + '", ');

      if specFull.FieldByName('smeas_pack').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['smeas_pack']) + '", ');

      if specFull.FieldByName('sarticle').IsNull then
        Add('null, ')
      else
        Add('"' + toDos(specFull.FieldValues['sarticle']) + '", ');

      if specFull.FieldByName('snote').IsNull then
        Add('null')
      else
        Add('"' + toDos(specFull.FieldValues['snote']) + '"');


      Add(')');
    end;
//    query1.SQL.SaveToFile('query1');
    query1.ExecSQL;
    query1.Close;
    specFull.Next;
  end;
end;

function TDM.DateToStr(d1: TDateTime): string;
var
st, st2 :string;
begin
if d1 <>0 then begin
  st:=IntToStr(monthof(d1));
  if length(trim(st))=1 then
    st:='0'+trim(st)
  else
    st:=trim(st);
  st2:=st;
  st:=IntToStr(Dayof(d1));
  if length(trim(st))=1 then
    st:='0'+trim(st)
  else
    st:=trim(st);
  st2:=st2+'/'+st;
  st2:=st2+'/'+rightStr(trim(inttostr(yearOf(d1))),2);
  DateToStr:=st2;
end
else
  DateToStr:=' / / ';
    
end;

end.
