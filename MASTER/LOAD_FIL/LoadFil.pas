unit LoadFil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls,
  DBCtrls, OleServer, Excel2000, DateUtil, OleDB, DateUtils, Oracle, FileUtil,
  ExtCtrls, Grids, DBGridEh,StrUtils;

type
  Tf_LoadFil = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lc_Filial: TDBLookupComboBox;
    ed_DateRep: TDateTimePicker;
    ed_Filename: TFilenameEdit;
    lc_RepTypes: TDBLookupComboBox;
    btToBuf: TBitBtn;
    btCancel: TBitBtn;
    btTest: TBitBtn;
    btLoad: TBitBtn;
    btOpen: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    lb_OrgName: TLabel;
    q_FilRepTypes: TOracleDataSet;
    ds_FilRepTypes: TDataSource;
    q_Filials: TOracleDataSet;
    ds_Filials: TDataSource;
    q_tmp: TOracleDataSet;
    pck_Filial: TOraclePackage;
    q_Test: TOracleDataSet;
    ds_test: TDataSource;
    q_TestNAME: TStringField;
    q_TestREAL: TFloatField;
    q_TestOST: TFloatField;
    q_InsertTmp: TOracleQuery;
    procedure btToBufClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_FilenameAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure btTestClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btLoadClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure ed_FilenameChange(Sender: TObject);
    procedure q_TestBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    BoxDir:string;
    BoxArhDir:string;
    IsOrgOk:boolean;
    IsProdOk:boolean;
    procedure TestLoad;
    function LoadToBuf(f_name:string):boolean;
  public
    { Public declarations }
    PeriodId:integer;
  end;

var
  f_LoadFil: Tf_LoadFil;

implementation

uses ForDB, ForFiles, ForEnv, KlsLinks, ForSESS, main;

{$R *.dfm}

procedure Tf_LoadFil.btToBufClick(Sender: TObject);
var s,f_name:String;
    F_Start:boolean;
    IsLoadOk:boolean;
    i:integer;
begin
  inherited;
  IsLoadOk:=false;
  btLoad.Enabled:=false;
  if ed_Filename.Filename='' then
  Begin
    MessageDlg('Выберите файл',mtError,[mbOk],0);
    ModalResult:=mrNone;
    Exit;
  End;
  if VarType(lc_Filial.KeyValue)=varNull then
  Begin
    MessageDlg('Выберите филиал',mtError,[mbOk],0);
    ModalResult:=mrNone;
    Exit;
  End;
  if Application.MessageBox(PChar('Загрузить файл '+ed_Filename.Filename+
    ': '+FormatDateTime('mm.yyyy',ed_DateRep.Date)+
    ' '+q_Filials.FieldByName('NAME').AsString+'?'),'Внимание!',MB_YESNO)=IDYES then
  begin
    Screen.Cursor := crHourGlass;
    // Загрузка файла в буфер
    f_name:=AnsiUpperCase(ed_Filename.FileName);
    if q_FilRepTypes.FieldByName('ID').AsInteger=1 then // реализация
    Begin
      if not LoadToBuf(f_name) then exit;
    end;

    // Выполнить процедуру разбора буфера
    PeriodId:=pck_Filial.CallIntegerFunction('LOAD_FROM_BUF',[]);

    Screen.Cursor := crDefault;

    // Проверить предприятия и продукты
    TestLoad;

    // Загрузка успешная
    IsLoadOk:=true;

    If IsLoadOk and IsOrgOk and IsProdOk then
      Application.MessageBox('Файл успешно загружен в буфер!','Внимание!',MB_OK)
    else
      Application.MessageBox('Файл загружен в буфер НЕ КОРРЕКТНО!','Внимание!',MB_OK);

    if IsLoadOk then
    Begin
      s:=ExtractFileName(f_name);
      i:=pos(')',s);
      if i>0 then s:=system.copy(s,i+1,length(s));
      F_FileUtils.SafeCopyFile(f_name,BoxArhDir+'('+FormatDateTime('yy_mm_dd',Now)+')'+s);
      if AnsiUpperCase(ExtractFilePath(f_name))=BoxDir then
        DeleteFile(f_name);
      If IsLoadOk and IsOrgOk and IsProdOk then
        btLoadClick(Sender);
    End;
    Screen.Cursor := crDefault;
  end;
end;


function Tf_LoadFil.LoadToBuf(f_name:string):boolean;
var xlLCID:integer;
    UpdateLinks, ReadOnly, Format,
    Password, WriteResPassword,
    IgnoreReadOnlyRecommended,
    Origin, Delimiter, Editable, Notify, Converter, AddToMRU: OleVariant;
    Excel: Excel2000.TExcelApplication;
    Workbook: Excel2000._Workbook;
    Worksheet: Excel2000._Worksheet;
    i,j,k,DD,TipOrg:integer;
    s,NameOrg,ProdTag,ProdName:string;
    OldDateRep,DateRep,NowDate:TDateTime;
    Fact:real;
    IsOst:boolean;
    ApplMode:integer;
Begin
  Result:=true;
  xlLCID:=LOCALE_USER_DEFAULT;

  if Result then
  try
    Excel := TExcelApplication.Create(Self);
    Excel.ConnectKind := ckNewInstance;
    Excel.Connect;
    Excel.Visible[xlLCID]:=false;
    Workbook := Excel.Workbooks.Open(f_name, EmptyParam,
           EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, false, xlLCID);
  except
    Application.MessageBox(PChar('Ошибка открытия файла '+f_name+'! Необходимо разобраться и повторить загрузку'),'Внимание!',MB_OK);
    Result:=false;
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('ROLLBACK');
      ExecSQL;
      Close;
    end;
  end;

  if Result then
  with q_tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('BEGIN');
    SQL.Add('  DELETE FROM LOAD_BUFFER.TMP_FIL_REALIZ WHERE TERMINAL_NAME=For_init.GetCurrTerm AND OSUSER_NAME=For_init.GetCurrUser;');
    SQL.Add('  COMMIT;');
    SQL.Add('END;');
    ExecSQL;
    Close;
  except
    Application.MessageBox(PChar('Ошибка очистки буферных таблиц! Необходимо разобраться и повторить загрузку'),'Внимание!',MB_OK);
    Result:=false;
  End;

  if Result then
  try
    // перебираем страницы
    for i:=1 to Workbook.Worksheets.Count do
    Begin
      Worksheet := Workbook.Worksheets.Item[i] as _Worksheet;
      if Worksheet.Visible[0]=xlSheetVisible then
      Begin
        if AnsiUpperCase(system.copy(Worksheet.Name,1,5))='ИТОГО' then
          // Игнорируем итоговую
        else
        Begin
          ApplMode:=amVisual;
          TipOrg:=0;
          NameOrg:='';
          for j:=17 to 30 do
          Begin
            s:=Trim(AnsiUpperCase(Worksheet.Cells.Item[j,1].Value));
            IF s='TIP_ORG' then
              TipOrg:=StrToInt(Worksheet.Cells.Item[j,5].Value);
            IF s='NAME_ORG' then
            Begin
              NameOrg:=Trim(AnsiUpperCase(Worksheet.Cells.Item[j,5].Value));
              IF NameOrg='НЕФТЕБАЗА ХРАНЕНИЯ' then
                NameOrg:=NameOrg+' '+AnsiUpperCase(Worksheet.Name);
              lb_OrgName.Caption:=NameOrg;
              Refresh;
            End;
          End;
          if (TipOrg<>0) and (NameOrg<>'') then
          Begin
            // Перебираем столбцы
            for j:=3 to 72 do
            Begin
              OldDateRep:=StartOfTheMonth(ed_DateRep.Date)-1;
              ProdTag:=Trim(AnsiUpperCase(Worksheet.Cells.Item[17,j].Value));
              ProdName:=Trim(Worksheet.Cells.Item[27,j].Value);
              if ProdName='' then
                ProdName:=Trim(Worksheet.Cells.Item[27,j-1].Value);
              if ProdName='' then
                ProdName:=Trim(Worksheet.Cells.Item[27,j-2].Value);
              IsOst:=(Copy(ProdTag,length(ProdTag)-3,4)='_OST');
              lb_OrgName.Caption:=Trim(NameOrg)+' '+Trim(ProdTag);
              Refresh;
              // Перебираем строки
              for k:=30 to 70 do
              Begin
                s:=Trim(AnsiUpperCase(Worksheet.Cells.Item[k,2].Value));
                if s='' then s:='0';
                if system.copy(s,1,5)='ВСЕГО' then s:='0';
                try
                  DD:=StrToInt(s);
                  lb_OrgName.Caption:=Trim(NameOrg)+' '+Trim(ProdTag)+' '+s;
                  Refresh;
                except
                  DD:=0;
                end;
                IF DD>0 then
                Begin
                  DateRep:=StartOfTheMonth(ed_DateRep.Date)+DD-1;
                  if (OldDateRep>DateRep) or (DateRep>EndOfTheMonth(ed_DateRep.Date)) {or (DateRep>Date()-1)} then
                  Begin
                    fact:=-1;
    {                f_main.ApplSession.WriteToLog(ApplMode,'LoadFil',sesError,
                      'В таблице после даты '+FormatDateTime('dd.mm.yyyy',OldDateRep)+' идет дата '+
                      FormatDateTime('dd.mm.yyyy',DateRep)+' у подразделения '+NameOrg,0);
                    ApplMode:=amAuto;}
                  end
                  else
                  Begin
                    If MonthOf(ed_DateRep.Date)=MonthOf(DateRep) then
                      try
                        s:=Trim(Worksheet.Cells.Item[k,j].Value);
                        if s='' then Fact:=-1
                        Else Fact:=StrToFloat(s);
                      except
                        fact:=-1;
                      end;
                    If (Fact>=0) then
                      with q_InsertTmp do
                      Begin
                        Close;
                        NowDate:=Now;
                        ClearVariables;
                        SetVariable('FILIAL_ID',lc_Filial.KeyValue);
                        SetVariable('DATE_REPORT',DateRep);
                        SetVariable('FILENAME',f_name);
                        SetVariable('DATE_LOAD',NowDate);
                        SetVariable('TIP_ORG',TipOrg);
                        SetVariable('NAME_ORG',NameOrg);
                        SetVariable('PROD_TAG',ProdTag);
                        SetVariable('PROD_NAME',ProdName);
                        SetVariable('FACT',Fact);
  //                      SQL.SaveToFile('c:\tmp\1.sql');
                        Execute;
                      end;
                  End;
                  OldDateRep:=DateRep;
                End;
              End;
            end;
          end;
        End;
      End;
    end;
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('COMMIT');
      ExecSQL;
      Close;
    end;
  except
    on E: Exception do
    Begin
      f_main.ApplSession.WriteToLog(amDefault,'Tf_LoadFil',sesError,E.Message+#13#10+'Ошибка в структуре файла '+f_name+' ('+lb_OrgName.Caption+')!',0,'');
      Result:=false;
      with q_tmp do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('ROLLBACK');
        ExecSQL;
        Close;
      end;
      Screen.Cursor := crDefault;
    end;
  end;
  Workbook.Close(EmptyParam,EmptyParam,EmptyParam,xlLCID);
  Excel.Quit;
  FreeAndNil(Excel);
  if not(csDestroying in ComponentState) then Self.SetFocus;
  Application.BringToFront;
  lb_OrgName.Caption:='';
End;

// Проверка закачанных данных
procedure Tf_LoadFil.TestLoad;
var cnt:integer;
begin
  // Проверка продуктов
  with q_tmp do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) as cnt1 FROM load_fil_prod WHERE prod_id_npr IS NULL');
    Open;
    cnt:=0;
    if not Eof then cnt:=FieldByName('cnt1').AsInteger;
    if cnt>0 then
    Begin
      Application.MessageBox(PChar('Обнаружен новый нефтепродукт. Необходимо выполнить привязку!'),'Внимание!',MB_OK);
      KlsLinks.LINK_ID:='FIL_PROD-KLS_PROD';
      with tf_KlsLinks.Create(Self) do
      begin
        ShowModal;
        Free;
      end;
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as cnt1 FROM load_fil_prod WHERE prod_id_npr IS NULL');
      Open;
      cnt:=0;
      if not Eof then cnt:=FieldByName('cnt1').AsInteger;
      if cnt>0 then IsProdOk:=false else IsProdOk:=true;
      Close;
    End
    Else IsProdOk:=true;
    Close
  end;

  // Проверка предприятий
  with q_tmp do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) as cnt1 FROM load_fil_org WHERE org_stru_id IS NULL');
    Open;
    cnt:=0;
    if not Eof then cnt:=FieldByName('cnt1').AsInteger;
    if cnt>0 then
    Begin
      Application.MessageBox(PChar('Обнаружено новое подразделение. Необходимо выполнить привязку!'),'Внимание!',MB_OK);
      KlsLinks.LINK_ID:='FIL_ORG-ORG_STRU';
      with tf_KlsLinks.Create(Self) do
      begin
        ShowModal;
        Free;
      end;
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) as cnt1 FROM load_fil_org WHERE org_stru_id IS NULL');
      Open;
      cnt:=0;
      if not Eof then cnt:=FieldByName('cnt1').AsInteger;
      if cnt>0 then IsOrgOk:=false else IsOrgOk:=true;
      Close
    End
    Else IsOrgOk:=true;
    Close;
  end;

  // Обновление статуса отчета
  If IsProdOk and IsOrgOk then
  Begin
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE load_fil_periods SET status=1 WHERE id='+IntToStr(PeriodId));
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('COMMIT');
      ExecSQL;
      Close;
    End;
    btLoad.Enabled:=true;
  End
  else btLoad.Enabled:=false;

  // Отображение информации о закачаных суммах
  try
    q_test.close;
    q_test.open;
  except
  end;
end;

procedure Tf_LoadFil.FormCreate(Sender: TObject);
begin
  inherited;
  pck_Filial.Session:=f_main.ora_Session;
  q_FilRepTypes.Session:=f_main.ora_Session;
  q_FilRepTypes.Open;
  q_Filials.Session:=f_main.ora_Session;
  q_Filials.Open;
  q_Tmp.Session:=f_main.ora_Session;
end;

procedure Tf_LoadFil.ed_FilenameAfterDialog(Sender: TObject; var Name: String;
  var Action: Boolean);
var ii,j,YY,DD,MM,i,xlLCID:integer;
    s,tmp,City_Name,City_XLS,prefix,dd_str,mm_str:string;
    Date_Name:TDateTime;
    Date_XLS:TDateTime;
    DateInXLS,FilialInXLS,FilialInName,DateInName:boolean;
    UpdateLinks, ReadOnly, Format,
    Password, WriteResPassword,
    IgnoreReadOnlyRecommended,
    Origin, Delimiter, Editable, Notify, Converter, AddToMRU: OleVariant;
    Excel: Excel2000.TExcelApplication;
    Workbook: Excel2000._Workbook;
    f_name:WideString;
    Worksheet: Excel2000._Worksheet;
    k,LastDD:integer;
    DateRep:TDateTime;
    Fact:double;
begin
  inherited;
  FilialInName:=false;
  DateInName:=false;
  City_Name:='';
  City_XLS:='';
  DD_str:='';
  MM_str:='';
  YY:=YearOf(Now);
  f_name:=Name;
  xlLCID:=LOCALE_USER_DEFAULT;
  if Action then
  Begin
    // Чтение файла
    s:=ExtractFileName(f_Name);
    i:=pos(')',s);
    if i>0 then s:=system.copy(s,i+1,length(s));
    if q_FilRepTypes.FieldByName('ID').AsInteger=1 then // реализация
    Begin
      i:=pos('_',s);
      if i>0 then
      Begin
        City_Name:=AnsiUpperCase(system.copy(s,1,i-1));
        s:=system.copy(s,i+1,length(s));
        i:=pos('_',s);
        if i>0 then
        Begin
          prefix:=system.copy(s,1,i-1);
          MM_str:=system.copy(s,i+1,2);
        End;
      End;

      FilialInName:=false;
      if City_Name<>'' then
        if q_filials.Locate('CITY_PREFIX_FILE',City_Name,[]) then
        Begin
          FilialInName:=true;
        End;

{      try
        DD:=StrToInt(DD_str);
      except
        DD:=0;
      end;
      try
        MM:=StrToInt(MM_str);
      except
        MM:=0;
      end;

      if (yy>0) and (mm>0) then
      try
        Date_Name:=StrToDateFmt('dd.mm.yyyy','01.'+IntToStr(MM)+'.'+IntToStr(YY));
        DateInName:=true;
      except}
        DateInName:=false;
{      end;}

      // открываем файл
      FilialInXLS:=false;
      DateInXLS:=false;
      try
        Excel := TExcelApplication.Create(Self);
        Excel.ConnectKind := ckNewInstance;
        Excel.Connect;
        Excel.Visible[xlLCID]:=false;
{        if Excel.WindowState[xlLCID] = TOLEEnum(xlMinimized) then
          Excel.WindowState[xlLCID] := TOLEEnum(xlNormal);
        Excel.ScreenUpdating[xlLCID] := true;             }

        Workbook := Excel.Workbooks.Open(f_name, EmptyParam,
           EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, false, xlLCID);

        // первая видимая страница
        for ii:=1 to Workbook.Worksheets.Count do
        Begin
          Worksheet := Workbook.Worksheets.Item[ii] as _Worksheet;
          if Worksheet.Visible[0]=xlSheetVisible then
          Begin
            break;
          end;
        end;

//        Worksheet := Workbook.Worksheets.Item[1] as _Worksheet;
        for j:=17 to 30 do
        Begin
          s:=Trim(AnsiUpperCase(Worksheet.Cells.Item[j,1].Value));
          if s='NAME_ORG' then
          try
            tmp:=Worksheet.Cells.Item[j,5].Value;
          except
          end;
          if s='YEAR_REP' then
          try
            YY:=StrToInt(Worksheet.Cells.Item[j,5].Value);
          except
            YY:=YearOf(Now);
          end;
          if s='MON_REP' then
          try
            tmp:=Worksheet.Cells.Item[j,5].Value;
            MM:=StrToInt(Trim(AnsiUpperCase(tmp)));
          except
            MM:=MonthOf(Now);
          end;
          if s='FILIAL' then
          try
            City_XLS:=Trim(AnsiUpperCase(Worksheet.Cells.Item[j,5].Value));
            If City_XLS<>'' then FilialInXLS:=true;
          except
            City_XLS:='';
          end;
        End;

        try
          Date_XLS:=StrToDateFmt('dd.mm.yyyy','01.'+IntToStr(MM)+'.'+IntToStr(YY));
          DateInXLS:=true;
        except
          DateInXLS:=false;
        end;

        // Проверка корректности заполнения факта
        // Перебираем строки
        for k:=30 to 70 do
        Begin
          s:=Trim(AnsiUpperCase(Worksheet.Cells.Item[k,2].Value));
          if s='' then s:='0';
          if system.copy(s,1,5)='ВСЕГО' then s:='0';
          try
            DD:=StrToInt(s);
          except
            DD:=0;
          end;
          IF DD>0 then
          Begin
            DateRep:=StartOfTheMonth(ed_DateRep.Date)+DD-1;
            If MonthOf(ed_DateRep.Date)=MonthOf(DateRep) then
            try
              s:=Trim(Worksheet.Cells.Item[k,3].Value);
              if s='' then s:='0';
              Fact:=StrToFloat(s);
            except
              fact:=0;
            end;
            If (Fact>0) then
            Begin
              LastDD:=DD
            End;
          End;
        end;
        If lastDD>DayOfTheMonth(Now) then
        Begin
{          Application.MessageBox(PChar('В полученном файле есть реализация после текущей даты!'),'Внимание!',MB_OK);}
        End;

        Workbook.Close(EmptyParam,EmptyParam,EmptyParam,xlLCID);
        Excel.Quit;
        FreeAndNil(Excel);

        if not(csDestroying in ComponentState) then Self.SetFocus;
        Application.BringToFront;
      except
      end;

      lc_Filial.KeyValue:=varNull;

      if FilialInName then // Если в имени файла есть название филиала
      Begin
        if FilialInXLS then // Если в файле есть название филиала
        Begin
          if (City_XLS=City_Name) then // Если они равны
          Begin
            lc_Filial.KeyValue:=q_filials.FieldByName('ID').AsInteger;
          End
          Else // Если не равны - предупреждение
          Begin
            Application.MessageBox(PChar('Филиал в ИМЕНИ файла "'+City_name+'"'+
              ' отличается от филиала В файле "'+City_XLS+'" !'),'Внимание!',MB_OK);
            lc_Filial.KeyValue:=q_filials.FieldByName('ID').AsInteger;
          End
        End
        Else
        Begin // Если в файле нет названия филиала - берем из имени файла
          lc_Filial.KeyValue:=q_filials.FieldByName('ID').AsInteger;
        End
      End
      Else // Если в имени файла нет названия филиала
      Begin
        if FilialInXLS then // Если в файле есть название филиала - берем из файла
        Begin
          if q_filials.Locate('CITY_IN_XLS',City_XLS,[]) then
          Begin
            lc_Filial.KeyValue:=q_filials.FieldByName('ID').AsInteger;
          End;
        End
        Else // Если в файле нет названия филиала
        Begin
        End
      End;

      if DateInName then // Если в имени файла есть дата
      Begin
        if DateInXLS then // Если в файле есть дата
        Begin
          if (Date_XLS=Date_Name) then // Если они равны - берем из имени файла
          Begin
            ed_DateRep.Date:=Date_Name;
          End
          Else // Если не равны - предупреждение
          Begin
{            Application.MessageBox(PChar('Дата в ИМЕНИ файла '+FormatDateTime('mm.yyyy',Date_Name)+
              ' отличается от даты В файле '+FormatDateTime('mm.yyyy',Date_XLS)+'!'),'Внимание!',MB_OK);}
            If Date_XLS>Date_Name then
              ed_DateRep.Date:=Date_XLS
            else
              ed_DateRep.Date:=Date_Name;
          End;
        End
        Else // Если в файле нет даты
        Begin
          ed_DateRep.Date:=Date_Name;
        End
      End
      Else // Если в имени нет даты
      Begin
        if DateInXLS then // Если в файле есть дата
        Begin
          ed_DateRep.Date:=Date_XLS;
        End
        Else // Если в файле нет даты
        Begin
        End
      end;
    end;
  End;
end;

procedure Tf_LoadFil.btTestClick(Sender: TObject);
begin
  // Проверить предприятия и продукты
  TestLoad;
  If IsOrgOk and IsProdOk then
  Begin
{    Application.MessageBox('Файл успешно загружен в буфер!','Внимание!',MB_OK)}
  end
  else
    Application.MessageBox('Файл загружен в буфер НЕ КОРРЕКТНО!','Внимание!',MB_OK);
end;

procedure Tf_LoadFil.FormActivate(Sender: TObject);
var Status:integer;
begin
  lb_OrgName.Caption:='';
  BoxDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('FilialImportPath'),false));
  BoxArhDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_main.GetApplVari('FilialImpArhPath'),false));
  if PeriodId=0 then
  Begin
    lc_RepTypes.KeyValue:=1;
    ed_Filename.InitialDir:=BoxDir;
  End
  Else
  Begin
    with q_tmp do
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM load_fil_periods where ID='+IntToStr(PeriodId));
      Open;
      lc_RepTypes.KeyValue:=FieldByName('REP_TYPE_ID').AsInteger;
      ed_Filename.FileName:=FieldByName('FILENAME').AsString;
      lc_Filial.KeyValue:=FieldByName('FILIAL_ID').AsInteger;
      ed_DateRep.Date:=FieldByName('DATE_REPORT').AsDateTime;
      Status:=FieldByName('STATUS').AsInteger;
      if Status=0 then btLoad.Enabled:=false
      else btLoad.Enabled:=true;
    End;
  End;
end;

procedure Tf_LoadFil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_tmp.SQL.Clear;
end;

procedure Tf_LoadFil.btLoadClick(Sender: TObject);
begin
  // Выполнить процедуру переноса в AZC_OPERATION
  try
    Screen.Cursor := crHourGlass;
    pck_Filial.CallProcedure('MOVE_TO_AZC_OPER',[PeriodId]);
    Application.MessageBox(PChar('Данные успешно загружены!'),'Внимание!',MB_OK);
    Screen.Cursor := crDefault;
    ModalResult:=mrOk;
  except
    Screen.Cursor := crDefault;
    raise;
  end;
end;

procedure Tf_LoadFil.btOpenClick(Sender: TObject);
begin
{  F_FileUtils.SafeCopyFile(ed_Filename.Filename,f_main.TempLocalPath+ExtractFileName(ed_Filename.Filename));
  F_FileUtils.ExecAndWait(f_main.TempLocalPath+ExtractFileName(ed_Filename.Filename),'',SW_SHOWMAXIMIZED,false);}
  F_FileUtils.ExecAndWait(ed_Filename.Filename,'',SW_SHOWMAXIMIZED,false);
end;

procedure Tf_LoadFil.ed_FilenameChange(Sender: TObject);
begin
  if ed_Filename.Filename<>'' then btOpen.Enabled:=true;
end;

procedure Tf_LoadFil.q_TestBeforeOpen(DataSet: TDataSet);
begin
  q_Test.SQL[12]:='AND A.FILIAL_ID='+VarToStr(lc_Filial.KeyValue);
  q_test.SQL[13]:='AND A.FIL_PERIOD_ID='+IntToStr(periodId);
end;

end.
