unit SayboltSMN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, TB2Item, TB2Dock, TB2Toolbar, AxCtrls,
  OleCtrls, VCF1, comObj, excel97, DB, Mask, ToolEdit,
  CurrEdit, ComCtrls, StdCtrls, ADODB, Oracle, OracleData;

const
  BoxDirDefault = 'C:\IMPORT\';
  BoxArhDirDefault = 'C:\IMPORT\ARCHIVE\';

type
  Tf_LoadSaybolt = class(TForm)
    Panel1: TPanel;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    btOpen: TTBItem;
    btLoad: TTBItem;
    Panel2: TPanel;
    OpenDlg: TOpenDialog;
    Grid: TStringGrid;
    Label1: TLabel;
    edNumPasp: TEdit;
    Label2: TLabel;
    edDateRee: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edTemper: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edPl20: TCurrencyEdit;
    edPl15: TCurrencyEdit;
    edPl: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edWater: TCurrencyEdit;
    edSalt: TCurrencyEdit;
    edDirt: TCurrencyEdit;
    Label14: TLabel;
    Label15: TLabel;
    edSulfur: TCurrencyEdit;
    edDNP: TCurrencyEdit;
    Label16: TLabel;
    edNumRee: TEdit;
    Panel3: TPanel;
    Label17: TLabel;
    edVes: TCurrencyEdit;
    Label18: TLabel;
    edKol: TCurrencyEdit;
    Label19: TLabel;
    edDatePasp: TDateTimePicker;
    Label20: TLabel;
    edNumRez: TEdit;
    findPod: TOracleDataSet;
    q_cmn: TOracleQuery;
    PFConn: TADOConnection;
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
    excel:  Variant;  //������ excel�
    sheet:  Variant;  //����, � �������� ������
    sheetRez:  Variant;  //����, � �������� ������ ����� ����������
    DatePlan: TDateTime; // �������� �����
    AllKol:integer;
    AllVes:integer;
    IsFirst:boolean;
    IsLoadOk:boolean;
    procedure LoadSheet;
    function ReadRow(row: integer): integer;

    function FindPodacha(vetka_otp_id,prod_id_npr,pod_num,pod_date: variant): integer;

    function InsertPodacha(VETKA_OTP_ID,prod_id_npr,pod_num,pod_date,
       KOL, VES, LOAD_TYPE_ID, MESTO_ID,
       PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP:variant):integer;

    procedure InsertPodRow(Podacha_Id,NUM_POS, NUM_KVIT, NUM_CIST, VZLIV, VES, CAPACITY, AXES, PLOMBA1, PLOMBA2, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, NOM_ZD, ZPU_TYPE1, ZPU_TYPE2:variant);

    procedure UpdatePodacha(Podacha_id,
       KOL, VES, LOAD_TYPE_ID, MESTO_ID,
       PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP: variant);

    function GetCellAsString(aCol, aRow: integer): Variant;
    function GetCellAsFloat(aCol, aRow: integer): Variant;
    function GetCellAsDate(aCol, aRow: integer): Variant;
    function GetCellAsInteger(aCol, aRow: integer): Variant;
    function VarToQuery(v: variant):string;
  public
  end;

var
  f_LoadSaybolt: Tf_LoadSaybolt;

implementation

uses selectSheet, StrUtils, DateUtils, ForSystem,  ForFiles;

{$R *.dfm}

procedure Tf_LoadSaybolt.LoadSheet;
var
j,i:  integer;
currRow:  integer;
emptyRow: integer;
s:  string;
begin

  // ������ ���������
  // ����� �������
  try
    s := VarToStr(sheet.Cells[7, 5])
    i1:=Pos(s,'/');
    if i1>0 then
    Begin
      s:=System.copy(s,i1+1,999);
      i1:=Pos(s,'/');
      if i1>0 then s:=System.copy(s,1,i1-1);
    end;
    edNumRee.Text := s;
  except
    edNumRee.Text := ''
  end;

  if edNumRee.Text='' then
  Begin
    Application.MessageDlg('����������� ��������� ����� � �������� '+filename);
    exit;
  end;

  // ���� �������
  try
    edDateRee.Date := F_ForSystem.GetPropisDate(VarToStr(sheet.Cells[8, 5]));
  except
    edDateRee.Date := Now;
  end;

  // ���� ��������
  edDatePasp.Date:=edDateRee.Date;

  // ����� ����������
{  if not VarIsNull(sheetRez) then
  try
    edNumRez.Text := VarToStr(sheetRez.Cells[4, 3]);
  except }
    edNumRez.Text := '?';
{  end;}


  // ����
//  edWater.Value := F_ForSystem.StrToReal(sheet.Cells[4, 8]);

  // ����
//  edSalt.Value := F_ForSystem.StrToReal(sheet.Cells[5, 8]);

  // �������
//  edDirt.Value := F_ForSystem.StrToReal(sheet.Cells[6, 8]);

  // ����
//  edSulfur.Value := F_ForSystem.StrToReal(sheet.Cells[7, 8]);

  // ���
//  edDNP.Value := F_ForSystem.StrToReal(sheet.Cells[8, 8]);

  Grid.RowCount := 2;

  emptyRow := 1;
  AllKol:=0;
  AllVes:=0;

//������ ����� �����
  Grid.ColWidths[0] := 20; Grid.Cells[0, 0] := 'NN';
  Grid.ColWidths[1] := 80; Grid.Cells[1, 0] := '� ���������';
  Grid.ColWidths[2] := 70; Grid.Cells[2, 0] := '� ������';
  Grid.ColWidths[3] := 30; Grid.Cells[3, 0] := '���';
  Grid.ColWidths[4] := 40; Grid.Cells[4, 0] := '�����';
  Grid.ColWidths[5] := 40; Grid.Cells[5, 0] := '���, ��';
  Grid.ColWidths[6] := 40; Grid.Cells[6, 0] := '����.';
  Grid.ColWidths[7] := 40; Grid.Cells[7, 0] := '����';
  Grid.ColWidths[8] := 70; Grid.Cells[8, 0] := '��� ������';
  Grid.ColWidths[9] := 80; Grid.Cells[9, 0] := '������ 1';
  Grid.ColWidths[10] := 80; Grid.Cells[10, 0] := '������ 2';
  Grid.ColWidths[11] := 50; Grid.Cells[11, 0] := '����, ��';
  Grid.ColWidths[12] := 80; Grid.Cells[12, 0] := '�����������';

  Grid.RowHeights[0] := 35;

//����� �� ������� ������� � ���� �������� ������
  currRow := 16;
  while currRow < 50 do begin
    s := VarToStr(sheet.Cells[currRow, 1]);
    if s = '1' then begin //����� ������ 1
      break;        //�������� ���������� ����� ���������� ������
    end;
    inc(currRow);
  end;

  // ��������� ��� 15'�
  s:=sheet.Cells[currRow, 12];
  edPl15.Value := F_ForSystem.StrToReal(s);

  // �����������
  edTemper.Value := F_ForSystem.StrToReal(sheet.Cells[currRow, 11]);

  for i:=currRow to 120 do
  Begin
    ReadRow(i);
  end;

  //����� �� 3-�� ������� � ���� ����� "������ ������"
  currRow := 19;
  while currRow < 200 do begin
    s := VarToStr(sheet.Cells[currRow, 3]);
    if s = '������ ������' then begin //����� ������ ������
      break;        //�������� ���������� ����� ���������� ������
    end;
    inc(currRow);
  end;

  // ����� ��������
  try
    edNumPasp.Text := VarToStr(sheet.Cells[CurrRow+7, 15]);
  except
    edNumPasp.Text := '';
  end;

  // ��������� ��� 20'�
  s:=sheet.Cells[CurrRow+8, 15];
  edPl20.Value := F_ForSystem.StrToReal(s);

  // ��������� �����������
  s:=sheet.Cells[currRow+9, 15];
  edPl.Value := F_ForSystem.StrToReal(s);

  edKol.Value := AllKol;
  edVes.Value := AllVes;

  Grid.RowCount := Grid.RowCount - 1;

  IsLoadOk:=true;
end;

function Tf_LoadSaybolt.ReadRow(row: integer): integer;
//������ ������ � ��������� ���� �� �����. ���� ������ ������, �� ���������� -1
var
currRow, i:  integer;
vals: array[1..14] of string;
f:  boolean;
s:  string;
begin
  currRow := row;

  //������ ������ � �����
  vals[3] := VarToStr(sheet.Cells[currRow, 2]);

  //���������, �� ������ ��
  try
    if vals[3]='' then
      i:=0
    else
      i:=StrToInt(vals[3]);
  except
    i:=0;
  end;
  if i=0 then
  Begin
    Result := -1;
    exit;
  end;

  // ������ ������
  vals[1] := VarToStr(sheet.Cells[currRow, 1]);
  vals[2] := VarToStr(sheet.Cells[currRow, 3]);
  s := AnsiUpperCase(VarToStr(sheet.Cells[currRow, 5]));
  if s='25A' then s:='25�';
  vals[4]:=s;
  vals[5] := VarToStr(sheet.Cells[currRow, 6]);
  vals[6] := VarToStr(sheet.Cells[currRow, 15]);
//  vals[7] := VarToStr(sheet.Cells[currRow, 17]);
//  vals[8] := VarToStr(sheet.Cells[currRow, 18]);
//  vals[10] := VarToStr(sheet.Cells[currRow, 19])+VarToStr(sheet.Cells[currRow, 20]);
//  vals[11] := VarToStr(sheet.Cells[currRow, 47]);

  //��������� ���� �� 1
  Grid.RowCount := Grid.RowCount + 1;
  currRow := Grid.RowCount - 1;
  //��������� ���� ����������
  for i:=1 to 14 do begin
    Grid.Cells[i-1, currRow - 1] := vals[i];
  end;
  try
    AllKol:=AllKol+1;
    AllVes:=AllVes+StrToInt(vals[6]);
  except
  end;
  Result := row + 1;
end;

procedure Tf_LoadSaybolt.btOpenClick(Sender: TObject);
var
i, count:  integer;
BoxArhDir:string;
s,BoxDir:string;
begin
  BoxDir:=AnsiUpperCase(F_FileUtils.FillFilePath(BoxDirDefault,false));
  BoxArhDir:=AnsiUpperCase(F_FileUtils.FillFilePath(BoxArhDirDefault,false));
  OpenDlg.InitialDir:=BoxDir;
  if OpenDlg.Execute = false then
    if IsFirst then begin exit; end
    else exit;
  filename := AnsiUpperCase(OpenDlg.FileName);

//�������������� � Excel�
  excel := CreateOleObject('Excel.Application');

//���������� ������ ������
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

//������ ������ � ���������� �����
  sheet := excel.WorkBooks[excel.WorkBooks.count].WorkSheets[f_selectSheet.cbList.ItemIndex + 1];

  LoadSheet;
  f_selectSheet.Free;

  try
    excel.WorkBooks[excel.WorkBooks.count].close; //��������� ���� �����
    if excel.WorkBooks.count = 0 then //���� �������� ���� ������ ���, �� ��������� excel
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

procedure Tf_LoadSaybolt.GridDrawCell(Sender: TObject; ACol,
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

  if aRow > 0 then begin //���� ��� �� ���������, �� �����
    SetTextAlign(Grid.Canvas.Handle, TA_LEFT);
    x := rect.Left + 2;
    y := rect.Top;
{    case aCol of  //��������� ������������ ������
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

  if aRow = 0 then begin  //������ ���������
    Grid.Canvas.Brush.Color := clBtnFace;
    Grid.Canvas.FillRect(rect);
    Grid.Canvas.Font.Color := clBlack;
    flag := DT_CENTER or DT_VCENTER;
    if AnsiContainsText(Grid.Cells[aCol, aRow], Chr(13) + Chr(10)) = false then begin
      //���� ��������� �����, �� ������������� �����
      flag := flag or DT_SINGLELINE;
    end;
    DrawText( Grid.Canvas.Handle,
      PChar(Grid.Cells[aCol, aRow]), Length(Grid.Cells[aCol, aRow]),
      rect, flag);
  end;
end;

procedure Tf_LoadSaybolt.FormCreate(Sender: TObject);
begin
  PFConn.Open;
  excel := null;
  IsFirst:=true;
  IsLoadOk:=false;
  CreateDir(BoxDirDefault);
  CreateDir(BoxArhDirDefault);
end;

procedure Tf_LoadSaybolt.btLoadClick(Sender: TObject);
//��������� � Master
var
  i:  integer;
  //����������� ������
  PodId, LOAD_TYPE_ID, VETKA_OTP_ID, MESTO_ID,
  NUM_POS, AXES, PODACHA_ID, ZPU_TYPE1, ZPU_TYPE2:integer;

  PL, TEMPER, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP,KOL, VES: real;

  s,POD_NUM, PASP_NUM, REZ_NUM, PROD_ID_NPR,
  NUM_CIST, CAPACITY, PLOMBA1, PLOMBA2, KALIBR_ID,NOM_ZD: string;

  Pod_date,pasp_date:TDateTime;

  VZLIV, VAGOWNER_ID, num_kvit:variant;
  VES_CIST: variant;
begin

  POD_NUM:=edNumRee.Text;
  POD_DATE:=edDateRee.Date;
  KOL:=AllKol;
  VES:=AllVes;
  LOAD_TYPE_ID:=1;
  VETKA_OTP_ID:=10;
  MESTO_ID:=0;
  PROD_ID_NPR:='90000';
  PL:=edPl.Value;
  TEMPER:=edTemper.Value;
  PASP_NUM:=edNumPasp.Text;

  if PASP_NUM='' then
    Application.MessageDlg('����������� ��������� ����� � �������� '+filename);

  PASP_DATE:=edDatePasp.Date;
  REZ_NUM:=edNumRez.Text;
  PL15:=edPl15.Value;
  PL20:=edPl20.Value;
  WATER:=edWater.Value;
  SALT:=edSalt.Value;
  DIRT:=edDirt.Value;
  SULFUR:=edSulfur.Value;
  DNP:=edDNP.Value;


  // ���� �������
  PaspId:=FindPodacha(VETKA_OTP_ID,PROD_ID_NPR,POD_NUM,POD_DATE);

  // ���� ������
  PodId:=FindPodacha(VETKA_OTP_ID,PROD_ID_NPR,POD_NUM,POD_DATE);
  if PodId<>0 then
  Begin
    // ������ ������ - ������� ��� �������
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('delete from podacha_rows where podacha_id='+IntToStr(PodId));
      q_cmn.Execute;
    except
    end;

    // ��������� ����� �������
    UpdatePodacha(PodId,KOL, VES, LOAD_TYPE_ID, MESTO_ID,
      PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP);
  end
  else
  Begin
    // ��������� ����� �������
    PodId:=InsertPodacha(VETKA_OTP_ID,PROD_ID_NPR,POD_NUM,POD_DATE,
       KOL, VES, LOAD_TYPE_ID, MESTO_ID,
       PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP);

//    PodId:=FindPodacha(VETKA_OTP_ID,PROD_ID_NPR,POD_NUM,POD_DATE);
  End;

  // ��������� ������� �������
  for i := 1 to Grid.RowCount - 1 do
  begin
    Grid.Row := i;

    // N �������
{    s:=GetCellAsString(0, i);
    num_pos := F_ForSystem.StrToInteger(s);
    if num_pos=0 then num_pos:=i;}
    num_pos:=i;

    // N ���������
    s:=GetCellAsString(1, i);
    num_kvit := F_ForSystem.StrToInteger(s);
    if num_kvit=0 then num_kvit:=Null;

    // N ������
    num_cist := AnsiUpperCase(GetCellAsString(2, i));

    // ��� ������
    kalibr_id := AnsiUpperCase(GetCellAsString(3, i));

    // �����
    s:=GetCellAsString(4, i);
    vzliv := F_ForSystem.StrToInteger(s);

    // ���
    s:=GetCellAsString(5, i);
    ves := F_ForSystem.StrToInteger(s)/1000;

    // ���������������� ������
    capacity := AnsiUpperCase(GetCellAsString(6, i));

    // ����
    s:=GetCellAsString(7, i);
    axes := F_ForSystem.StrToInteger(s);
    if axes=0 then axes:=4;

    // ������ 1
    PLOMBA1 := AnsiUpperCase(GetCellAsString(9, i));

    // ������ 2
    PLOMBA2 := AnsiUpperCase(GetCellAsString(10, i));

    // ��� ������
    // ZPU_Type := AnsiUpperCase(GetCellAsString(8, i));
    ZPU_Type1:=-1;
    ZPU_Type2:=-1;

    // ��� ������
    s:=GetCellAsString(11, i);
    ves_cist := F_ForSystem.StrToInteger(s)/1000;

    // ����������� ������
    VAGOWNER_ID:=Null;

    InsertPodRow(PodId,NUM_POS, NUM_KVIT, NUM_CIST, VZLIV, VES, CAPACITY, AXES, PLOMBA1, PLOMBA2, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, NOM_ZD, ZPU_TYPE1, ZPU_TYPE2);
  end;

  master.Commit;
  close;
end;

function Tf_LoadSaybolt.InsertPodacha(VETKA_OTP_ID,prod_id_npr,pod_num,pod_date,
       KOL, VES, LOAD_TYPE_ID, MESTO_ID,
       PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP:variant):integer;
var
p:  PVarData;
s:  string;
begin
  with q_cmn do
  begin
     Close;
     SQL.Clear;
     SQL.Add('insert into master.podacha(POD_NUM, POD_DATE, KOL, VES, LOAD_TYPE_ID, VETKA_OTP_ID, MESTO_ID, PROD_ID_NPR, ');
     SQL.Add('PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP) ');
     SQL.Add('values(' + VarToQuery(pod_num) + ', ' +
                         VarToQuery(pod_date) + ', ' +
                         VarToQuery(kol) + ', ' +
                         VarToQuery(ves) + ', ' +
                         VarToQuery(load_type_id) + ', ' +
                         VarToQuery(vetka_otp_id) + ', ' +
                         VarToQuery(mesto_id) + ', ' +
                         VarToQuery(prod_id_npr) + ', ' +
                         VarToQuery(pl) + ', ' +
                         VarToQuery(temper) + ', ' +
                         VarToQuery(pasp_num) + ', ' +
                         VarToQuery(pasp_date) + ', ' +
                         VarToQuery(rez_num) + ', ' +
                         VarToQuery(pl15) + ', ' +
                         VarToQuery(pl20) + ', ' +
                         VarToQuery(water) + ', ' +
                         VarToQuery(salt) + ', ' +
                         VarToQuery(dirt) + ', ' +
                         VarToQuery(sulfur) + ', ' +
                         VarToQuery(dnp) + ') RETURNING ID INTO :ID');
     DeclareVariable('ID',otInteger);
//     SQL.SaveToFile('c:\1.sql');
     Execute;
     Result:=GetVariable('ID');
     Close;
     DeleteVariables;
   end;
end;

procedure Tf_LoadSaybolt.InsertPodRow(Podacha_Id,NUM_POS, NUM_KVIT, NUM_CIST, VZLIV, VES, CAPACITY, AXES, PLOMBA1, PLOMBA2, KALIBR_ID,
                 VAGOWNER_ID, VES_CIST, NOM_ZD, ZPU_TYPE1, ZPU_TYPE2:variant);
var
p:  PVarData;
s:  string;
begin
  with q_cmn do
  begin
     Close;
     SQL.Clear;
     SQL.Add('insert into podacha_rows (NUM_POS, NUM_KVIT, NUM_CIST, VZLIV, VES, CAPACITY, AXES, PLOMBA1, PLOMBA2, KALIBR_ID, PODACHA_ID, VAGOWNER_ID, VES_CIST, NOM_ZD, ZPU_TYPE1, ZPU_TYPE2) ');
     SQL.Add('values(' + VarToQuery(num_pos) + ',' +
                         VarToQuery(num_kvit) + ',' +
                         VarToQuery(num_cist) + ',' +
                         VarToQuery(vzliv) + ',' +
                         VarToQuery(ves) + ',' +
                         VarToQuery(capacity) + ',' +
                         VarToQuery(axes) + ',' +
                         VarToQuery(plomba1) + ',' +
                         VarToQuery(plomba2) + ',' +
                         VarToQuery(kalibr_id) + ',' +
                         VarToQuery(Podacha_id) + ',' +
                         VarToQuery(vagowner_id) + ',' +
                         VarToQuery(ves_cist) + ',' +
                         VarToQuery(nom_zd) + ',' +
                         VarToQuery(zpu_type1) + ',' +
                         VarToQuery(zpu_type2) + ')');

//     SQL.SaveToFile('c:\1.sql');

     Execute;
   end;
end;

function Tf_LoadSaybolt.GetCellAsDate(aCol, aRow: integer): Variant;
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

function Tf_LoadSaybolt.GetCellAsFloat(aCol, aRow: integer): Variant;
var
s:  string;
begin
  //���������� � ��������� ������������ ������� �����
  s := Grid.Cells[aCol, aRow];
  s := AnsiReplaceStr(s, '.', DecimalSeparator);
  s := AnsiReplaceStr(s, ',', DecimalSeparator);
  try
    Result := StrToFloat(s);
  except
    Result := null;
  end;
end;

function Tf_LoadSaybolt.GetCellAsInteger(aCol, aRow: integer): Variant;
begin
  try
    Result := StrToInt(Grid.Cells[aCol, aRow]);
  except
    Result := null;
  end;
end;

function Tf_LoadSaybolt.GetCellAsString(aCol, aRow: integer): Variant;
begin
  try
    Result := Grid.Cells[aCol, aRow];
  except
    Result := NULL;
  end;
end;

function Tf_LoadSaybolt.VarToQuery(v: variant): string;
//����������� ��� variant � ������ ��������� ��� ������� � ����� �������
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

function Tf_LoadSaybolt.FindPodacha(vetka_otp_id,prod_id_npr,pod_num,pod_date: variant): integer;
begin
  Result := 0;
  with FindPod do
  try
    SetVariable(0, pod_num);
    SetVariable(1, pod_date);
    SetVariable(2, prod_id_npr);
    SetVariable(3, vetka_otp_id);
    Open;
    First;
    if not Eof then
      Result := FieldByName('ID').AsInteger;
  except
  end;
end;

procedure Tf_LoadSaybolt.UpdatePodacha(Podacha_id,
       KOL, VES, LOAD_TYPE_ID, MESTO_ID,
       PL, TEMPER, PASP_NUM, PASP_DATE, REZ_NUM, PL15, PL20, WATER, SALT, DIRT, SULFUR, DNP: variant);
var
p:  PVarData;
s:  string;
begin

  with q_cmn do
  begin
     Close;
     SQL.Clear;
     SQL.Add('update master.podacha set ');
     SQL.Add('KOL='+VarToQuery(kol) + ', ');
     SQL.Add('VES='+VarToQuery(ves) + ', ');
     SQL.Add('LOAD_TYPE_ID='+VarToQuery(load_type_id) + ', ');
     SQL.Add('MESTO_ID='+VarToQuery(mesto_id) + ', ');
     SQL.Add('PL='+VarToQuery(pl) + ', ');
     SQL.Add('TEMPER='+VarToQuery(temper) + ', ');
     SQL.Add('PASP_NUM='+VarToQuery(pasp_num) + ', ');
     SQL.Add('PASP_DATE='+VarToQuery(pasp_date) + ', ');
     SQL.Add('REZ_NUM='+VarToQuery(rez_num) + ', ');
     SQL.Add('PL15='+VarToQuery(pl15) + ', ');
     SQL.Add('PL20='+VarToQuery(pl20) + ', ');
     SQL.Add('WATER='+VarToQuery(water) + ', ');
     SQL.Add('SALT='+VarToQuery(salt) + ', ');
     SQL.Add('DIRT='+VarToQuery(dirt) + ', ');
     SQL.Add('SULFUR='+VarToQuery(sulfur) + ', ');
     SQL.Add('DNP='+VarToQuery(dnp));
     SQL.Add('WHERE ID=' + VarToQuery(PODACHA_ID));
//     SQL.SaveToFile('c:\1.sql');
     Execute;
   end;
end;

procedure Tf_LoadSaybolt.FormShow(Sender: TObject);
begin
  btOpen.Click;
end;

end.

