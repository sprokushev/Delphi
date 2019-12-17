unit SvodPF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB, ExtCtrls, Grids, DBGrids,variants,
  Oracle, OracleData;

const
	ODBC_ADD_DSN = 1;        // Добавляем источник данных
	ODBC_CONFIG_DSN = 2;     // Конфигурируем (редактируем) источник данных
	ODBC_REMOVE_DSN = 3;     // Удаляем источник данных
	ODBC_ADD_SYS_DSN = 4;    // Добавляем системный DSN
	ODBC_CONFIG_SYS_DSN = 5; // Конфигурируем системный DSN
	ODBC_REMOVE_SYS_DSN = 6; // удаляем системный DSN
{	ProizvText= 'SELECT PROD.KOD,'+
	'Dayly_fact.data,'+
  'Sum(plan.plan) AS Cur_Plan,'+
  'Sum(plan.OperPlan) AS First_Plan,'+
  'Sum(Dayly_fact.graf_nar) as Graf_nar, '+
  'Sum(Dayly_fact.proizv) AS Cur_Fact,'+
  'Sum(Dayly_fact.proizv) - Sum(Dayly_fact.graf_nar) as Otkl_Graf, '+
  'Sum(Dayly_fact.proizv) - Sum(plan.plan) as Otkl_Plan '+
	'FROM plan, PROD_ACC prod, Dayly_fact '+
	'Where plan.kod = Dayly_fact.kod_plan And plan.prod = PROD.KOD ';}


type
  TSQLConfigDataSource = function( hwndParent: HWND;
                                   fRequest: WORD;
                                   lpszDriver: LPCSTR;
																	 lpszAttributes: LPCSTR ) : BOOL; stdcall;

type
  Tf_SvodPF = class(TForm)
    q_cmn: TADOQuery;
    PF_Conn: TADOConnection;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ed_DateBegPlanPost: TDateTimePicker;
    ed_DateBegPlanPererab: TDateTimePicker;
    ed_DateBegPlanGD: TDateTimePicker;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ed_DateBegOst: TDateTimePicker;
    ed_TimeBegOst: TDateTimePicker;
    ed_TimeEndOst: TDateTimePicker;
    ed_DateEndOst: TDateTimePicker;
    GroupBox3: TGroupBox;
    l_date1: TLabel;
    Label1: TLabel;
    ed_DateBegFact: TDateTimePicker;
    ed_DateEndFact: TDateTimePicker;
    ed_TimeBegFact: TDateTimePicker;
    ed_TimeEndFact: TDateTimePicker;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    ed_DateBegFactGD: TDateTimePicker;
    ed_DateEndFactGD: TDateTimePicker;
    ed_TimeBegFactGD: TDateTimePicker;
    ed_TimeEndFactGD: TDateTimePicker;
    ed_DateEndPlanPost: TDateTimePicker;
    Label11: TLabel;
    ed_DateEndPlanPererab: TDateTimePicker;
    Label12: TLabel;
    ed_DateEndPlanGD: TDateTimePicker;
    Label14: TLabel;
    Panel3: TPanel;
    Label17: TLabel;
    ed_DateBeg: TDateTimePicker;
    Label18: TLabel;
    ed_DateEnd: TDateTimePicker;
    ora_Package: TOraclePackage;
    q_resurs_old: TADOQuery;
    q_PlanPererabOil_old: TADOQuery;
    q_FactPererabOil_old: TADOQuery;
    q_Trans: TADOQuery;
    q_cmn2: TADOQuery;
    Button1: TButton;
    Button2: TButton;
    adoProizv: TADODataSet;
    dsProizv: TDataSource;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    q_Proizv: TOracleDataSet;
    q_Resurs: TOracleDataSet;
    q_PlanPererabOil: TOracleDataSet;
    q_FactPererabOil: TOracleDataSet;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_DateBegChange(Sender: TObject);
    procedure ed_DateEndChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    procedure CalculateRep(IsSNP:integer);
  public
    { Public declarations }
  end;

var
  f_SvodPF: Tf_SvodPF;

implementation

uses ForDB,dateutil,strutils,ForFiles,DateUtils,PrichExp, main;

{$R *.DFM}

procedure Tf_SvodPF.FormCreate(Sender: TObject);
var
  pFn: TSQLConfigDataSource;
  hLib: LongWord; 
  strDriver: string;
	strAttr: string;
	strFile: string;
	fResult: BOOL;
	srInfo : TSearchRec;
begin
	strFile := 'u:\luk\plan\dbforplan.mdb';   // Тестовая база данных (Axes = Access)
	hLib := LoadLibrary( 'ODBCCP32' );    // загружаем библиотеку (путь по умолчанию)
	if( hLib <> NULL ) then
  begin
    @pFn := GetProcAddress( hLib, 'SQLConfigDataSource' );
    if( @pFn <> nil ) then
		begin
			// начинаем создание DSN
			strDriver := 'Microsoft Access Driver (*.mdb)';
			strAttr := Format( 'DSN=PLAN_ACC'+#0+
												 'DBQ=%s'+#0+
												 'Exclusive=0'+#0+
												 'ReadOnly=1'+#0+
												 'Description=Plan'+#0+#0,
												 [strFile] );
			fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
        if( fResult = false ) then ShowMessage( 'Ошибка создания MDB (файла базы данных) !' );
			end;
	strFile := 'u:\luk\plan\dbforplan.mdb';   // Тестовая база данных (Axes = Access)
  @pFn := GetProcAddress( hLib, 'SQLConfigDataSource' );
    if( @pFn <> nil ) then
		begin
			// начинаем создание DSN
			strDriver := 'Microsoft Access Driver (*.mdb)';
			strAttr := Format( 'DSN=DBFORPLAN_ACC'+#0+
												 'DBQ=%s'+#0+
												 'Exclusive=0'+#0+
												 'ReadOnly=1'+#0+
												 'Description=Plan'+#0+#0,
												 [strFile] );
			fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
        if( fResult = false ) then ShowMessage( 'Ошибка создания MDB (файла базы данных) !' );
			end;
	strFile := 'u:\luk\plan\resurs.mdb';   // Тестовая база данных (Axes = Access)
  @pFn := GetProcAddress( hLib, 'SQLConfigDataSource' );
    if( @pFn <> nil ) then
		begin
			// начинаем создание DSN
			strDriver := 'Microsoft Access Driver (*.mdb)';
			strAttr := Format( 'DSN=RESURS_ACC'+#0+
												 'DBQ=%s'+#0+
												 'Exclusive=0'+#0+
												 'ReadOnly=1'+#0+
												 'Description=Resurs'+#0+#0,
												 [strFile] );
			fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
        if( fResult = false ) then ShowMessage( 'Ошибка создания MDB (файла базы данных) !' );
			end;
	strFile := 'u:\luk\mdb\dispbase.mdb';   // Тестовая база данных (Axes = Access)
  @pFn := GetProcAddress( hLib, 'SQLConfigDataSource' );
    if( @pFn <> nil ) then
		begin
			// начинаем создание DSN
			strDriver := 'Microsoft Access Driver (*.mdb)';
			strAttr := Format( 'DSN=DISPBASE_ACC'+#0+
												 'DBQ=%s'+#0+
												 'Exclusive=0'+#0+
												 'ReadOnly=1'+#0+
												 'Description=Dispbase'+#0+#0,
												 [strFile] );
			fResult := pFn( 0, ODBC_ADD_SYS_DSN, @strDriver[1], @strAttr[1] );
        if( fResult = false ) then ShowMessage( 'Ошибка создания MDB (файла базы данных) !' );
			end;
		FreeLibrary( hLib );
	end
	else
		ShowMessage( 'Невозможно загрузить ODBCCP32.DLL' );

  ed_DateBeg.Date:=StartOfTheMonth(Date);
  ed_DateBegChange(Sender);
  ed_DateEnd.Date:=Date-1;
  ed_DateEndChange(Sender);
  Button1.Enabled:=false;
  Button2.Enabled:=false;
  Button3.Enabled:=false;
  Button4.Enabled:=false;
  Button6.Enabled:=false;
  if f_main.UserSNP then Button3.Enabled:=true;
  if f_main.UserUNP then
  Begin
    Button1.Enabled:=true;
    Button2.Enabled:=true;
    Button4.Enabled:=true;
    Button6.Enabled:=true;
    Button5.Enabled:=true;
  end;
end;

procedure Tf_SvodPF.FormActivate(Sender: TObject);
begin
  ClientHeight:=Button4.Top+Button1.Height+5;
end;

procedure Tf_SvodPF.CalculateRep(IsSNP:integer);
var
  Save_Cursor: TCursor;
  Koef,Norma:double;
  s,ProizvTemp,FactPost,FactPerer,EndOst:string;


  procedure FillProizv (pIsPlanGraf:boolean;pDate:TdateTime; pFileName:string);
  Begin
    // Производство на отчетную дату
{    ProizvTemp:=ProizvText+' and (Dayly_Fact.data<=datevalue('''+FormatDateTime('dd.mm.yyyy', pDate)+''') '+
       'AND Format(Dayly_fact.data,''yyyymm'')=Format(datevalue('''+FormatDateTime('dd.mm.yyyy', pDate)+'''),''yyyymm''))'+
       'GROUP BY PROD.KOD, Dayly_fact.data '+
       'HAVING Dayly_fact.data=datevalue('''+FormatDateTime('dd.mm.yyyy', pDate)+''') '+
       'ORDER BY PROD.KOD';
    adoProizv.CommandText:=ProizvTemp;
    adoProizv.Open;}
    q_Proizv.SetVariable('DATE1',DateOf(pDate));
    q_Proizv.Open;
    while not q_Proizv.Eof do
    Begin
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+pFileName+'" (KOD_NPR,data,First_Plan,Cur_Plan,Cur_Fact,Otkl_Graf) VALUES (');
      if pIsPlanGraf then
        q_cmn.SQL.Add(''''+q_Proizv.FieldByName('KOD').AsString+''','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_Proizv.FieldByName('DATA').AsDateTime)+','+
                    q_Proizv.FieldByName('First_Plan').AsString+','+
                    q_Proizv.FieldByName('Graf_nar').AsString+','+
                    q_Proizv.FieldByName('Cur_Fact').AsString+','+
                    q_Proizv.FieldByName('Otkl_graf').AsString+')')
      else
        q_cmn.SQL.Add(''''+q_Proizv.FieldByName('KOD').AsString+''','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',q_Proizv.FieldByName('DATA').AsDateTime)+','+
                    q_Proizv.FieldByName('First_Plan').AsString+','+
                    q_Proizv.FieldByName('Cur_Plan').AsString+','+
                    q_Proizv.FieldByName('Cur_Fact').AsString+','+
                    q_Proizv.FieldByName('Otkl_graf').AsString+')');
      q_cmn.ExecSQL;
      q_Proizv.Next;
    End;
    q_Proizv.Close;
  End;

  procedure FillNeft(pDate:TdateTime;pFileName:string);
  var s1,s2:string;
  Begin
    Koef:=DayOfTheMonth(pDate)/DaysInMonth(pDate);

{    s1:='WHERE Resurs.DataRes<=DateValue('''+FormatdateTime('dd.mm.yyyy',pDate)+''')';
    s2:='  AND Format(Resurs.DataRes,''yyyymm'')='''+FormatDateTime('yyyymm',pDate)+'''';
    q_FactPererabOil.SQL[6]:=s1;
    q_FactPererabOil.SQL[7]:=s2;}
    q_FactPererabOil.SetVariable('DATE1',DateOf(pDate));
    q_FactPererabOil.Open;

    q_PlanPererabOil.SetVariable('DATE1',DateOf(pDate));
    q_PlanPererabOil.Open;
{    s1:='AND Plan.DataPlan=DateValue('''+FormatdateTime('dd.mm.yyyy',StartOfTheMonth(pDate))+''')';
    q_PlanPererabOil.SQL[10]:=s1;
    q_PlanPererabOil.Open;}

    while not q_PlanPererabOil.Eof do
    Begin
      if q_FactPererabOil.Locate('kod_plan',q_PlanPererabOil.FieldByName('kod_plan').AsInteger,[]) then
      begin
        FactPost:=q_FactPererabOil.FieldByName('FactPost').AsString;
        FactPerer:=q_FactPererabOil.FieldByName('FactPerer').AsString;
        EndOst:=FloatToStr(q_PlanPererabOil.FieldByName('beg_ost').AsFloat+q_FactPererabOil.FieldByName('FactPost').AsFloat-q_FactPererabOil.FieldByName('FactPerer').AsFloat);
      End
      Else
      Begin
        FactPost:='0';
        FactPerer:='0';
        EndOst:=q_PlanPererabOil.FieldByName('beg_ost').AsString;
      End;

      Norma:=Round(Koef*q_PlanPererabOil.FieldByName('PlanPost').AsFloat);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+pFileName+'" (tip_row,group_ord,group_nam,prod_kod,prod_name,date_ost,beg_ost,end_ost,plan,plan_nar,fact) VALUES (');
      if (q_PlanPererabOil.FieldByName('plan_per').AsInteger<>22) and (q_PlanPererabOil.FieldByName('plan_per').AsInteger<>33) then //Переработка
      Begin
        q_cmn.SQL.Add('''ПЕРЕРАБОТКА'','+
                      '1,'+
                      '''ПОСТАВКА НЕФТИ НА ПЕРЕРАБОТКУ'',');
      End
      Else
      Begin
        q_cmn.SQL.Add('''ЭКСПОРТ'','+
                      '1,'+
                      '''ПОСТАВКА НЕФТИ НА ЭКСПОРТ'',');
      End;
      q_cmn.SQL.Add(q_PlanPererabOil.FieldByName('PROD_KOD').AsString+','+
                    ''''+q_PlanPererabOil.FieldByName('PROD_NAME').AsString+''','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',pDate)+','+
                    q_PlanPererabOil.FieldByName('beg_ost').AsString+','+
                    EndOst+','+
                    q_PlanPererabOil.FieldByName('PlanPost').AsString+','+
                    FloatToStr(Norma)+','+
                    FactPost+')');
      q_cmn.ExecSQL;

      Norma:=Round(Koef*q_PlanPererabOil.FieldByName('PlanPerer').AsFloat);
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+pFileName+'" (tip_row,group_ord,group_nam,prod_kod,prod_name,date_ost,beg_ost,end_ost,'+
                          'plan,plan_nar,fact) VALUES (');
      if (q_PlanPererabOil.FieldByName('plan_per').AsInteger<>22) and (q_PlanPererabOil.FieldByName('plan_per').AsInteger<>33) then //Переработка
      Begin
        q_cmn.SQL.Add('''ПЕРЕРАБОТКА'','+
                      '2,'+
                      '''ПЕРЕРАБОТКА'',');
      End
      Else
      Begin
        q_cmn.SQL.Add('''ЭКСПОРТ'','+
                      '2,'+
                      '''ОТГРУЗКА'',');
      End;
      q_cmn.SQL.Add(q_PlanPererabOil.FieldByName('PROD_KOD').AsString+','+
                    ''''+q_PlanPererabOil.FieldByName('PROD_NAME').AsString+''','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',pDate)+','+
                    q_PlanPererabOil.FieldByName('beg_ost').AsString+','+
                    EndOst+','+
                    q_PlanPererabOil.FieldByName('PlanPerer').AsString+','+
                    FloatToStr(Norma)+','+
                    FactPerer+')');
      q_cmn.ExecSQL;

      q_PlanPererabOil.Next;

    end;
    q_FactPererabOil.Close;
    q_PlanPererabOil.Close;
  end;

  procedure FillResu(pIsBeg:boolean;pDate:TDateTime;pDateEnd:TDateTime;pTimeEnd:TDateTime; pFileName:string);
  var s_beg,s_end:string;
  Begin
    q_Resurs.SetVariable('DATE1',DateOf(pDate));
    q_Resurs.Open;
{    q_Resurs.SQL[1]:='WHERE data=#'+FormatdateTime('m"/"d"/"yyyy',pDate)+'#';
    q_Resurs.Open;}
    while not q_Resurs.Eof do
    Begin
      if pIsBeg then
      Begin
        // Остатки на начало периода
        S_beg:=q_resurs.FieldByName('beg_ost').AsString;
        IF S_beg='' THEN s_beg:='0';
        S_End:='0';
      end
      else
      Begin
        // Остатки на конец периода
        S_end:=q_resurs.FieldByName('end_ost').AsString;
        IF S_end='' THEN s_end:='0';
        s_beg:='0';
      End;
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+pFileName+'" (KOD_NPR,date_ost,time_ost,beg_ost,end_ost) VALUES (');
      q_cmn.SQL.Add(''''+q_resurs.FieldByName('KOD_NPR').AsString+''','+
                    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',pDateEnd)+','+
                    ''''+FormatDateTime('hh:nn',pTimeEnd)+''','+
                    s_beg+','+
                    s_end+')');
//      q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
      q_cmn.ExecSQL;
      q_resurs.Next;
    End;
    q_resurs.Close;
  End;

begin
  PF_Conn.Close;
  PF_Conn.Connected:=True;

  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;

  // План/факт поставок, план/факт перевозок, свободные емкости
  with ora_Package do
  try
    if IsSNP=1 then
    Begin
      CallProcedure('FillSNP', [12,FormatDateTime('dd.mm.yyyy',ed_DateBegPlanPost.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanPost.Date),
      FormatDateTime('hh:nn',ed_TimeBegFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFact.Date),
      FormatDateTime('hh:nn',ed_TimeEndFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFact.Date),
      FormatDateTime('dd.mm.yyyy',ed_DateBegPlanGD.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanGD.Date),
      FormatDateTime('hh:nn',ed_TimeBegFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFactGD.Date),
      FormatDateTime('hh:nn',ed_TimeEndFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFactGD.Date)])
    end;

    if IsSNP=0 then
    Begin
      CallProcedure('FillAll', [2,FormatDateTime('dd.mm.yyyy',ed_DateBegPlanPost.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanPost.Date),
      FormatDateTime('hh:nn',ed_TimeBegFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFact.Date),
      FormatDateTime('hh:nn',ed_TimeEndFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFact.Date),
      FormatDateTime('dd.mm.yyyy',ed_DateBegPlanGD.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanGD.Date),
      FormatDateTime('hh:nn',ed_TimeBegFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFactGD.Date),
      FormatDateTime('hh:nn',ed_TimeEndFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFactGD.Date)]);
    end;

    if IsSNP=2 then
    Begin
      CallProcedure('FillOper', [2,FormatDateTime('dd.mm.yyyy',ed_DateBegPlanPost.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanPost.Date),
      FormatDateTime('hh:nn',ed_TimeBegFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFact.Date),
      FormatDateTime('hh:nn',ed_TimeEndFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFact.Date),
      FormatDateTime('dd.mm.yyyy',ed_DateBegPlanGD.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanGD.Date),
      FormatDateTime('hh:nn',ed_TimeBegFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFactGD.Date),
      FormatDateTime('hh:nn',ed_TimeEndFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFactGD.Date)])
    end;

    if IsSNP=3 then
    Begin
      CallProcedure('FillConf', [2,FormatDateTime('dd.mm.yyyy',ed_DateBegPlanPost.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanPost.Date),
      FormatDateTime('hh:nn',ed_TimeBegFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFact.Date),
      FormatDateTime('hh:nn',ed_TimeEndFact.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFact.Date),
      FormatDateTime('dd.mm.yyyy',ed_DateBegPlanGD.Date),FormatDateTime('dd.mm.yyyy',ed_DateEndPlanGD.Date),
      FormatDateTime('hh:nn',ed_TimeBegFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateBegFactGD.Date),
      FormatDateTime('hh:nn',ed_TimeEndFactGD.Time),FormatDateTime('dd.mm.yyyy',ed_DateEndFactGD.Date)])
    end;
  except
    on E:EOracleError do ShowMessage(E.Message);
  end;

  // Подготовка файлов
  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_resu.DBF',f_main.TempLocalPath+'sPF_resu.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_resu.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_resu.DBF',f_main.TempLocalPath+'sPF_res7.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_res7.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  // Подготовка файлов
  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_przv.DBF',f_main.TempLocalPath+'sPF_przv.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_przv.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_przv.DBF',f_main.TempLocalPath+'sPF_prz7.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_prz7.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  // Подготовка файлов
  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_tran.DBF',f_main.TempLocalPath+'sPF_tran.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_tran.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  // Подготовка файлов
  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_pere.DBF',f_main.TempLocalPath+'sPF_pere.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_pere.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_pere.DBF',f_main.TempLocalPath+'sPF_per7.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_per7.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  if (IsSNP=0) or (IsSNP=3) then
  Begin

    if IsSNP=3 then
    begin
      // Производство на отчетную дату
      FillProizv(true,ed_DateEnd.Date,'sPF_przv.DBF');
      // Производство на отчетную дату-7
      if ed_DateEnd.Date-7>=ed_DateBeg.Date then FillProizv(true,ed_DateEnd.Date-7,'sPF_prz7.DBF');
    end
    else
    begin
      // Производство на отчетную дату
      FillProizv(false,ed_DateEnd.Date,'sPF_przv.DBF');
    end;

    if (IsSNP=0) or (IsSNP=3) then
    begin
      if IsSNP=3 then
      Begin
        // Остатки на конец периода
        FillResu(false,ed_DateEndOst.Date-1,ed_DateEndOst.Date,ed_TimeEndOst.Time,'sPF_resu.DBF');
        if ed_DateEndOst.Date-1-7>=ed_DateBeg.Date then FillResu(false,ed_DateEndOst.Date-1-7,ed_DateEndOst.Date-7,ed_TimeEndOst.Time,'sPF_res7.DBF');
      end
      else
      Begin
        // Остатки на начало периода
        FillResu(true,ed_DateBegOst.Date,ed_DateEndOst.Date,ed_TimeEndOst.Time,'sPF_resu.DBF');
        // Остатки на конец периода
        FillResu(false,ed_DateEndOst.Date-1,ed_DateEndOst.Date,ed_TimeEndOst.Time,'sPF_resu.DBF');
      End;
    end;

    if IsSNP=0 then
    begin
      // Причины невыполнения плана перевозок
      q_Trans.SQL[1]:='WHERE date_send=#'+FormatdateTime('m"/"d"/"yyyy',ed_DateEndFactGD.Date)+'#';
      q_Trans.SQL[2]:='  AND time_send='''+FormatdateTime('hh:nn:ss',ed_TimeEndFactGD.Time)+'''';
      q_Trans.Open;
      while not q_Trans.Eof do
      Begin
        q_cmn2.SQL.Clear;
        q_cmn2.SQL.Add('SELECT * FROM "'+f_main.TempLocalPath+'sPF_tran.DBF" '+
                       'WHERE transport='+q_trans.FieldByName('TRANSPORT').AsString+
                       '  AND kod_gdpl='''+q_trans.FieldByName('KOD_GDPL').AsString+''''+
                       '  AND napr='+q_trans.FieldByName('NAPR').AsString);
        q_cmn2.Open;
        if q_cmn2.Eof then
        Begin
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'sPF_tran.DBF" (TRANSPORT,KOD_GDPL,NAPR,PRICHDAY1,PRICHDAY2,PRICHDAY3) VALUES (');
          q_cmn.SQL.Add(q_trans.FieldByName('TRANSPORT').AsString+','+
                        ''''+q_trans.FieldByName('KOD_GDPL').AsString+''','+
                        q_trans.FieldByName('NAPR').AsString+','+
                        ''''+q_trans.FieldByName('PRICHDAY').AsString+''','' '','' '')');
          q_cmn.ExecSQL;
        End
        Else
        Begin
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'sPF_tran.DBF" SET ');
          if Trim(q_cmn2.FieldByName('PRICHDAY2').AsString)='' then
            q_cmn.SQL.Add('PRICHDAY2='''+q_trans.FieldByName('PRICHDAY').AsString+'''')
          else
            q_cmn.SQL.Add('PRICHDAY3='''+q_trans.FieldByName('PRICHDAY').AsString+'''');
          q_cmn.SQL.Add(
            ' WHERE transport='+q_trans.FieldByName('TRANSPORT').AsString+
            '  AND kod_gdpl='''+q_trans.FieldByName('KOD_GDPL').AsString+''''+
            '  AND napr='+q_trans.FieldByName('NAPR').AsString);
    //      q_cmn.SQL.SaveToFile('c:\tmp\a.txt');
          q_cmn.ExecSQL;
        End;
        q_cmn2.Close;
        q_Trans.Next;
      End;
      q_Trans.Close;
    end;

    // Поставка нефти на переработку
    FillNeft(ed_DateEndPlanPererab.Date,'sPF_pere.DBF');

    if IsSNP=3 then
    begin
      // Поставка нефти на переработку на отчетную дату -7
      FillNeft(ed_DateEndPlanPererab.Date-7,'sPF_per7.DBF');
    end;

  end;

  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'sPF_dat.DBF',f_main.TempLocalPath+'sPF_dat.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'sPF_dat.DBF"');
    q_cmn.ExecSQL;
  except
  end;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'sPF_dat.DBF" (dbeg_plpst,dend_plpst,'+
      'dbeg_plper,dend_plper,dbeg_plgd,dend_plgd,tbeg_ost,dbeg_ost,tend_ost,dend_ost,'+
      'tbeg_fact,dbeg_fact,tend_fact,dend_fact,tbeg_fctgd,dbeg_fctgd,tend_fctgd,dend_fctgd) VALUES (');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanPost.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanPost.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanPererab.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanPererab.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanGD.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanGD.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegOst.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegOst.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndOst.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndOst.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegFact.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegFact.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndFact.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndFact.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegFactGD.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegFactGD.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndFactGD.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndFactGD.Date)+')');
  q_cmn.ExecSQL;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'sPF_dat.DBF" (dbeg_plpst,dend_plpst,'+
      'dbeg_plper,dend_plper,dbeg_plgd,dend_plgd,tbeg_ost,dbeg_ost,tend_ost,dend_ost,'+
      'tbeg_fact,dbeg_fact,tend_fact,dend_fact,tbeg_fctgd,dbeg_fctgd,tend_fctgd,dend_fctgd) VALUES (');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanPost.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanPost.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanPererab.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanPererab.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegPlanGD.Date)+','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndPlanGD.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegOst.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegOst.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndOst.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndOst.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegFact.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegFact.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndFact.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndFact.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeBegFactGD.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateBegFactGD.Date)+','+
                  ''''+FormatDateTime('hh:nn',ed_TimeEndFactGD.Time)+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_DateEndFactGD.Date)+')');
  q_cmn.ExecSQL;

  Screen.Cursor := Save_Cursor;
end;

procedure Tf_SvodPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PF_Conn.Close;
end;

procedure Tf_SvodPF.ed_DateBegChange(Sender: TObject);
begin
  ed_DateBegPlanPost.Date:=ed_DateBeg.Date;
  ed_DateBegPlanPererab.Date:=ed_DateBeg.Date;
  ed_DateBegPlanGD.Date:=ed_DateBeg.Date;
  ed_DateBegOst.Date:=ed_DateBeg.Date;
  ed_DateBegFact.Date:=ed_DateBeg.Date;
  ed_DateBegFactGD.Date:=ed_DateBeg.Date-1;
end;

procedure Tf_SvodPF.ed_DateEndChange(Sender: TObject);
begin
  ed_DateEndPlanPost.Date:=ed_DateEnd.Date;
  ed_DateEndPlanPererab.Date:=ed_DateEnd.Date;
  ed_DateEndPlanGD.Date:=ed_DateEnd.Date;
  ed_DateEndOst.Date:=ed_DateEnd.Date+1;
  ed_DateEndFact.Date:=ed_DateEnd.Date+1;
  ed_DateEndFactGD.Date:=ed_DateEnd.Date;
end;

procedure Tf_SvodPF.Button1Click(Sender: TObject);
begin
  CalculateRep(0);
  F_FileUtils.CheckReport('sPF_post.xls',f_main.TempNetPath+'sPF_post.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_post.xls','',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_SvodPF.Button2Click(Sender: TObject);
begin
  CalculateRep(0);
  F_FileUtils.CheckReport('sPF_pere.xls',f_main.TempNetPath+'sPF_pere.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_pere.xls','',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_SvodPF.Button3Click(Sender: TObject);
begin
  CalculateRep(1);
  F_FileUtils.CheckReport('sPF_post.xls',f_main.TempNetPath+'sPF_postSNP.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_postSNP.xls','',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_SvodPF.Button4Click(Sender: TObject);
begin
  CalculateRep(2);
  F_FileUtils.CheckReport('sPF_post.xls',f_main.TempNetPath+'sPF_oper.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_oper.xls','',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_SvodPF.Button5Click(Sender: TObject);
begin
  CalculateRep(3);
  F_FileUtils.CheckReport('sPF_conf.xls',f_main.TempNetPath+'sPF_conf.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_conf.xls','',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_SvodPF.Button6Click(Sender: TObject);
begin
  CalculateRep(2);
  F_FileUtils.CheckReport('sPF_dec.xls',f_main.TempNetPath+'sPF_dec.xls');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'sPF_dec.xls','',SW_SHOWMAXIMIZED,false);
end;

end.



