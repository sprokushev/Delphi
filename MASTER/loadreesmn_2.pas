unit LoadReeSMN_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, TB2Item, TB2Dock, TB2Toolbar, AxCtrls,
  OleCtrls, VCF1, comObj, excel2000, Oracle, DB, OracleData, Mask, ToolEdit,
  CurrEdit, ComCtrls, StdCtrls;

type
  Tf_LoadReeSMN_2 = class(TForm)
    Panel1: TPanel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    btOpen: TTBItem;
    btLoad: TTBItem;
    Panel2: TPanel;
    OpenDlg: TOpenDialog;
    Grid: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    edDateRee: TDateTimePicker;
    Master: TOracleSession;
    edNumRee: TEdit;
    Panel3: TPanel;
    Label17: TLabel;
    edVes: TCurrencyEdit;
    Label18: TLabel;
    edKol: TCurrencyEdit;
    findPod: TOracleDataSet;
    q_cmn: TOracleQuery;
    q_VagOwner: TOracleDataSet;
    q_VagOwnerID: TFloatField;
    q_VagOwnerDISPLAY_NAME: TStringField;
    q_VagOwnerVAGOWNER_NAME: TStringField;
    q_VagOwnerSHORT_NAME: TStringField;
    q_VagOwnerPREDPR_ID: TIntegerField;
    q_VagOwnerVAGOWN_MOS_ID: TFloatField;
    q_VagOwnerVAGOWN_TYP_ID: TFloatField;
    q_VagOwnerSOBSTV_ID: TFloatField;
    q_VagOwnerOWNER_ID: TFloatField;
    q_VagOwnerSMN_NAME: TStringField;
    procedure btOpenClick(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    filename: string;
    excel:  Variant;  //сервер excelя
    sheet:  Variant;  //лист, с которого читаем
    sheetRez:  Variant;  //лист, с которого читаем номер резервуара
    DatePlan: TDateTime; // Плановый месяц
    AllKol:integer;
    AllVes:integer;
    IsFirst:boolean;
    IsLoadOk:boolean;
    procedure LoadSheet;
    function ReadRow(row: integer): integer;

    procedure UpdatePodRow(Podacha_Id,NUM_CIST, CAPACITY, PLOMBA1, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, ZPU_TYPE1, ZPU_TYPE2:variant);

    function GetCellAsString(aCol, aRow: integer): Variant;
    function GetCellAsFloat(aCol, aRow: integer): Variant;
    function GetCellAsDate(aCol, aRow: integer): Variant;
    function GetCellAsInteger(aCol, aRow: integer): Variant;
    function VarToQuery(v: variant):string;
  public
    PodachaId:integer;
  end;

var
  f_LoadReeSMN_2: Tf_LoadReeSMN_2;

implementation

uses selectSheet, StrUtils, DateUtils, ForEnv, ForSESS, ForSystem,
  ForFiles, main, ForDB;

{$R *.dfm}

procedure Tf_LoadReeSMN_2.LoadSheet;
var
j,i:  integer;
currRow:  integer;
emptyRow: integer;
s:  string;
begin

  // Читаем заголовок
  // Номер реестра
  try
    edNumRee.Text := VarToStr(sheet.Cells[1, 3])+VarToStr(sheet.Cells[1, 4])
  except
    edNumRee.Text := ''
  end;

  if edNumRee.Text='' then
  Begin
    f_main.ApplSession.WriteToLog(amVisual,'Неизвестная структура файла с реестром '+filename,sesError,'',0,'');
    exit;
  end;

  // Дата реестра
  try
    edDateRee.Date := F_ForSystem.GetPropisDate(VarToStr(sheet.Cells[1, 7]));
  except
    edDateRee.Date := Now;
  end;

  Grid.RowCount := 2;

  emptyRow := 1;
  AllKol:=0;
  AllVes:=0;

//делаем гриду шапку
  Grid.ColWidths[0] := 20; Grid.Cells[0, 0] := 'NN';
  Grid.ColWidths[1] := 70; Grid.Cells[1, 0] := '№ вагона';
  Grid.ColWidths[2] := 30; Grid.Cells[2, 0] := 'Тип';
  Grid.ColWidths[3] := 40; Grid.Cells[3, 0] := 'Груз.';
  Grid.ColWidths[4] := 50; Grid.Cells[4, 0] := 'Тара, кг';
  Grid.ColWidths[5] := 80; Grid.Cells[5, 0] := 'Собственник';
  Grid.ColWidths[6] := 80; Grid.Cells[6, 0] := 'Пломба 1';

  Grid.RowHeights[0] := 35;

//бежим по первому столбцу и ищем непустую ячейку
  currRow := 2;
  while currRow < 50 do begin
    s := VarToStr(sheet.Cells[currRow, 1]);
    if s <> '' then begin //нашли непустую ячейку - стопудов шапка
      inc(currRow); //переходим к следующей строке
      break;        //начинаем заниматься более серьезными делами
    end;
    inc(currRow);
  end;

  for i:=currRow to 120 do
  Begin
    ReadRow(i);
  end;

  edKol.Value := AllKol;
  edVes.Value := AllVes;

  Grid.RowCount := Grid.RowCount - 1;

  IsLoadOk:=true;
end;

function Tf_LoadReeSMN_2.ReadRow(row: integer): integer;
//читаем строку и заполняем грид на форме. Если строка пустаю, то возвращаем -1
var
currRow, i:  integer;
vals: array[1..10] of string;
f:  boolean;
s:  string;
begin
  currRow := row;

  //читаем строку с листа
  vals[2] := VarToStr(sheet.Cells[currRow, 2]);

  //проверяем, не пустая ли
  try
    if vals[2]='' then
      i:=0
    else
      i:=StrToInt(vals[2]);
  except
    i:=0;
  end;
  if i=0 then
  Begin
    Result := -1;
    exit;
  end;

  // Читаем дальше
  vals[1] := VarToStr(sheet.Cells[currRow, 1]);
  vals[2] := VarToStr(sheet.Cells[currRow, 2]);
  s := AnsiUpperCase(VarToStr(sheet.Cells[currRow, 3]));
  if s='25A' then s:='25А';
  vals[3]:=s;
  vals[4] := VarToStr(sheet.Cells[currRow, 4]);
  vals[5] := VarToStr(sheet.Cells[currRow, 5]);
  vals[6] := VarToStr(sheet.Cells[currRow, 6]);
  vals[7] := VarToStr(sheet.Cells[currRow, 7]);

  //расширяем грид на 1
  Grid.RowCount := Grid.RowCount + 1;
  currRow := Grid.RowCount - 1;
  //заполняем грид значениями
  for i:=1 to 10 do begin
    Grid.Cells[i-1, currRow - 1] := vals[i];
  end;
  try
    AllKol:=AllKol+1;
    AllVes:=AllVes+StrToInt(vals[5]);
  except
  end;
  Result := row + 1;
end;

procedure Tf_LoadReeSMN_2.btOpenClick(Sender: TObject);
var
i, count:  integer;
BoxArhDir:string;
s,BoxDir:string;
begin
  BoxDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_Env.GetEnv(APPLICATION_NAME,SCHEMA_NAME,'VARI','LOAD_REE_SMN_DIR',Master),false));
  BoxArhDir:=AnsiUpperCase(F_FileUtils.FillFilePath(F_Env.GetEnv(APPLICATION_NAME,SCHEMA_NAME,'VARI','LOAD_REE_SMN_ARH',Master),false));
  OpenDlg.InitialDir:=BoxDir;
  if OpenDlg.Execute = false then
    if IsFirst then begin exit; end
    else exit;
  F_Env.SetEnv(APPLICATION_NAME,SCHEMA_NAME,'VARI','LOAD_REE_SMN_DIR',ExtractFilePath(OpenDlg.FileName),Master);
  filename := AnsiUpperCase(OpenDlg.FileName);

//присоединяемся к Excelю
  excel := CreateOleObject('Excel.Application');

//определяем список листов
  excel.workBooks.open(fileName);

  count := excel.workBooks[excel.workbooks.count].workSheets.count;

  f_selectSheet:=Tf_selectSheet.Create(Self);
  f_selectSheet.cbList.items.clear;
  f_selectSheet.lbInfo.Caption:='';
  f_selectSheet.edDatePlan.Visible:=false;

  for i:=1 to count do
    f_selectSheet.cbList.Items.Add(Excel.Workbooks[excel.workbooks.count].WorkSheets[i].Name);

  if f_selectSheet.ShowModal <> mrOk then begin
    If IsFirst then begin exit; end
    else exit;
  end;

  DatePlan:=f_selectSheet.edDatePlan.Date;

//качаем данные с выбранного листа
  sheet := excel.WorkBooks[excel.WorkBooks.count].WorkSheets[f_selectSheet.cbList.ItemIndex + 1];

  LoadSheet;
  f_selectSheet.Free;

  try
    excel.WorkBooks[excel.WorkBooks.count].close; //закрываем нашу книгу
    if excel.WorkBooks.count = 0 then //если открытых книг больше нет, то закрываем excel
      excel.quit;
  except
    exit;
  end;

  if IsLoadOk then
  Begin
    s:=ExtractFileName(filename);
    i:=pos(')',s);
    if i>0 then s:=system.copy(s,i+1,length(s));
    F_FileUtils.SafeCopyFile(filename,BoxArhDir+'('+FormatDateTime('yy_mm_dd',Now)+')'+s);
    if ExtractFilePath(filename)=BoxDir then
      DeleteFile(filename);
  End;

  IsFirst:=false;
end;

procedure Tf_LoadReeSMN_2.GridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
backCol: TColor;
i, x, y: integer;
flag: Cardinal;
p:  ^TPoint;
begin
  if gdSelected in state then begin
    Grid.Canvas.Brush.Color := clNavy;
    SetTextColor(Grid.Canvas.Handle, clWhite);
    Grid.Canvas.FillRect(Rect);
  end
  else begin
    Grid.Canvas.Brush.Color := clWindow;
    SetTextColor(Grid.Canvas.Handle, clBlack);
    Grid.Canvas.FillRect(Rect);
  end;

  if aRow > 0 then begin //если это не заголовок, то прост
    SetTextAlign(Grid.Canvas.Handle, TA_LEFT);
    x := rect.Left + 2;
    y := rect.Top;
{    case aCol of  //определим выравнивание текста
    1,2,5:  begin
          SetTextAlign(Grid.Canvas.Handle, TA_CENTER);
          x := Round(rect.Left/2 + rect.Right/2);
//          y := rect.Top;
        end;
    8,9:  begin
          SetTextAlign(Grid.Canvas.Handle, TA_RIGHT);
          x := rect.Right - 2;
//          y := rect.Top;
        end;
    end;}
    Grid.Canvas.TextOut(x, y, Grid.Cells[aCol, aRow]);
  end;

  if aRow = 0 then begin  //рисуем заголовок
    Grid.Canvas.Brush.Color := clBtnFace;
    Grid.Canvas.FillRect(rect);
    Grid.Canvas.Font.Color := clBlack;
    flag := DT_CENTER or DT_VCENTER;
    if AnsiContainsText(Grid.Cells[aCol, aRow], Chr(13) + Chr(10)) = false then begin
      //если несколько строк, то пересчитываем флаги
      flag := flag or DT_SINGLELINE;
    end;
    DrawText( Grid.Canvas.Handle,
      PChar(Grid.Cells[aCol, aRow]), Length(Grid.Cells[aCol, aRow]),
      rect, flag);
  end;
end;

procedure Tf_LoadReeSMN_2.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(Master);
  excel := null;
  IsFirst:=true;
  IsLoadOk:=false;;
end;

procedure Tf_LoadReeSMN_2.btLoadClick(Sender: TObject);
//загружаем в Master
var
  i:  integer;
  //необходимые данные
  s,NUM_CIST, CAPACITY, PLOMBA1,KALIBR_ID: string;
  ZPU_TYPE1, ZPU_TYPE2:integer;
  VAGOWNER_ID:variant;
  VES_CIST: variant;
begin

  // Обновляем позиции реестра
  for i := 1 to Grid.RowCount - 1 do
  begin
    Grid.Row := i;

    // N вагона
    num_cist := AnsiUpperCase(GetCellAsString(1, i));

    // Тип вагона
    kalibr_id := AnsiUpperCase(GetCellAsString(2, i));

    // Грузоподъемность вагона
    capacity := AnsiUpperCase(GetCellAsString(3, i));

    // Вес вагонв
    s:=GetCellAsString(4, i);
    ves_cist := F_ForSystem.StrToInteger(s)/1000;

    // Собственник вагона из реестра
    s:=AnsiUpperCase(GetCellAsString(5, i));
    if q_vagowner.Locate('SMN_NAME',s,[]) then
      VAGOWNER_ID:=q_vagownerID.AsInteger
    else
      VAGOWNER_ID:=Null;

{    // Собственник вагона из справочника вагонов
    if q_vagowner.Locate('SMN_NAME',s,[]) then
      VAGOWNER_ID:=q_vagownerID.AsInteger
    else
      VAGOWNER_ID:=Null;}

    // Пломба 1
    PLOMBA1 := Trim(AnsiUpperCase(GetCellAsString(6, i)));

    // Тип пломбы
    s:=system.copy(PLOMBA1,1,3);
    ZPU_Type1:=5;;
    if s='(2)' then ZPU_Type1:=3;
    if s='(3)' then ZPU_Type1:=4;
    if s='(4)' then ZPU_Type1:=5;
    ZPU_Type2:=ZPU_Type1;

    UpdatePodRow(PodachaId,NUM_CIST,CAPACITY, PLOMBA1, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, ZPU_TYPE1, ZPU_TYPE2);
  end;

  master.Commit;
  close;
end;

procedure Tf_LoadReeSMN_2.UpdatePodRow(Podacha_Id,NUM_CIST, CAPACITY, PLOMBA1, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, ZPU_TYPE1, ZPU_TYPE2:variant);
var
p:  PVarData;
s:  string;
begin
  with q_cmn do
  begin
     Close;
     SQL.Clear;
     SQL.Add('update podacha_rows set ');
     SQL.Add('capacity=' + VarToQuery(capacity) + ',');
     SQL.Add('plomba1=' + VarToQuery(plomba1) + ',');
     SQL.Add('kalibr_id=' + VarToQuery(kalibr_id) + ',');
     SQL.Add('vagowner_id=' + VarToQuery(vagowner_id) + ',');
     SQL.Add('ves_cist=' + VarToQuery(ves_cist) + ',');
     SQL.Add('zpu_type1=' + VarToQuery(zpu_type1) + ',');
     SQL.Add('zpu_type2=' + VarToQuery(zpu_type2) + ' ');
     SQL.Add('WHERE PODACHA_ID=' + VarToQuery(PODACHA_ID));
     SQL.Add('  AND NUM_CIST=' + VarToQuery(num_cist));

//     SQL.SaveToFile('c:\tmp\1.sql');

     Execute;
   end;
end;

function Tf_LoadReeSMN_2.GetCellAsDate(aCol, aRow: integer): Variant;
var s:string;
begin
  ShortDateFormat := 'dd.mm.yyyy';
  try
    s:=Grid.Cells[aCol, aRow];
    Result := StrToDate(s);
  except
    Result := null;
  end;
end;

function Tf_LoadReeSMN_2.GetCellAsFloat(aCol, aRow: integer): Variant;
var
s:  string;
begin
  //разберемся с возможным разделителем дробной части
  s := Grid.Cells[aCol, aRow];
  s := AnsiReplaceStr(s, '.', DecimalSeparator);
  s := AnsiReplaceStr(s, ',', DecimalSeparator);
  try
    Result := StrToFloat(s);
  except
    Result := null;
  end;
end;

function Tf_LoadReeSMN_2.GetCellAsInteger(aCol, aRow: integer): Variant;
begin
  try
    Result := StrToInt(Grid.Cells[aCol, aRow]);
  except
    Result := null;
  end;
end;

function Tf_LoadReeSMN_2.GetCellAsString(aCol, aRow: integer): Variant;
begin
  try
    Result := Grid.Cells[aCol, aRow];
  except
    Result := NULL;
  end;
end;

function Tf_LoadReeSMN_2.VarToQuery(v: variant): string;
//преобразует тип variant в строку пригодную для вставки в текст запроса
var
p:  PVarData;
begin
  p := FindVarData(v);
  case p^.VType of
  varNull:    Result := 'null';
  varInteger: Result := IntToStr(v);
  varString:  Result := '''' + VarToStr(v) + '''';
  varDouble:  Result := FloatToStr(p^.VDouble);
  varDate:    Result := 'TO_DATE(''' + FormatDateTime('dd.mm.yyyy',VarToDateTime(v)) + ''',''dd.mm.yyyy'')';
  end;
end;


procedure Tf_LoadReeSMN_2.FormShow(Sender: TObject);
begin
  btOpen.Click;
end;

end.

