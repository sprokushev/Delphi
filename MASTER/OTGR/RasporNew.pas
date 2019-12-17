unit RasporNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ComCtrls, Oracle, Raspor,
  CurrEdit, RxLookup, DB, OracleData, RXDBCtrl, DBCtrls, DBCtrlsEh, Grids,
  DBGridEh, ExtCtrls, PropFilerEh, PropStorageEh, Menus, Math;

// РАЗРЕШЕНИЕ на отгрузку (добавление/изменение)

type
  Tf_RasporNew = class(TForm)
    pkgFOR_DOCUMENTS: TOraclePackage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btSetNum: TSpeedButton;
    edNum: TEdit;
    edDat: TDateTimePicker;
    Label3: TLabel;
    edEnd: TDateTimePicker;
    Panel2: TPanel;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    GridRows: TDBGridEh;
    q_rows: TOracleDataSet;
    edBeg: TDateTimePicker;
    Label4: TLabel;
    edTime: TDateTimePicker;
    q_rowsNOM_ZD: TStringField;
    q_rowsKOL: TIntegerField;
    q_rowsVES: TFloatField;
    q_rowsFACT_KOL: TIntegerField;
    q_rowsFACT_VES: TFloatField;
    q_rowsMON_KOL: TIntegerField;
    q_rowsMON_VES: TFloatField;
    q_rowsMON_FACT_KOL: TIntegerField;
    q_rowsMON_FACT_VES: TFloatField;
    q_rowsSTAN_NAME: TStringField;
    q_rowsPROD_NAME: TStringField;
    q_rowsPOLUCH_NAME: TStringField;
    q_rowsTONN_REE: TFloatField;
    q_rowsOST_KOL: TFloatField;
    q_rowsOST_VES: TFloatField;
    q_rowsOST_MON_KOL: TFloatField;
    q_rowsOST_MON_VES: TFloatField;
    q_rowsOST_REE: TFloatField;
    ds_rows: TDataSource;
    Label5: TLabel;
    edFilter: TEdit;
    PropStorageEh1: TPropStorageEh;
    q_rowsNORMOTGR: TFloatField;
    btRefresh: TButton;//в отличие от стандартного позволяет сохранять NULL
    procedure CheckDate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSetNumClick(Sender: TObject);
    procedure q_rowsCalcFields(DataSet: TDataSet);
    procedure edFilterChange(Sender: TObject);
    procedure GridRowsExit(Sender: TObject);
    procedure GridRowsSortMarkingChanged(Sender: TObject);
    procedure q_rowsKOLChange(Sender: TField);
    procedure q_rowsVESChange(Sender: TField);
    procedure q_rowsKOLSetText(Sender: TField; const Text: String);
    procedure q_rowsVESSetText(Sender: TField; const Text: String);
    procedure btRefreshClick(Sender: TObject);
  private
    { Private declarations }
    CurrentDate:TDateTime;
    CurrentBegDate:TDateTime;
    CurrentEndDate:TDateTime;
    Save_Cursor:TCursor;
  public
    { Public declarations }
    EditID:double;
    IsAdd:boolean;
    ParentForm:Tf_Raspor;
  end;

var
  f_RasporNew: Tf_RasporNew;

implementation

uses KlsMisc2,DateUtils, ForSESS, main, ForDB;

{$R *.dfm}

procedure Tf_RasporNew.CheckDate(Sender: TObject);
begin
  if (DateOf(edEnd.DateTime)<DateOf(edBeg.DateTime)) then
    edEnd.DateTime:=edBeg.DateTime;

  if (CurrentDate<>DateOf(edDat.DateTime)) then
  try
    edBeg.DateTime:=ParentForm.pkgFOR_RASPOR.CallDateFunction('GetDATE_BEG',[DateOf(edDat.DateTime),ParentForm.DocMestoId,ParentForm.DocLoadTypeId]);
  except
  End;

  if IsAdd and (CurrentDate<>DateOf(edDat.DateTime)) then
  try
    // Если документ новый и меняется дата,
    // заново получим номер документа (на случай если номер зависит от даты)
    edNum.Text:=pkgFOR_DOCUMENTS.CallFloatFunction('GET_NEXT_NUM',[ParentForm.DocType,ParentForm.DocMestoId,'',DateOf(edDat.DateTime)])
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'RASPOR',sesError,E.Message,0,'');
      edNum.Text:='0';
    end;
  End;

  if (CurrentBegDate<>DateOf(edBeg.DateTime)) then
  try
    edEnd.DateTime:=ParentForm.pkgFOR_RASPOR.CallDateFunction('GetDATE_END',[DateOf(edBeg.DateTime),ParentForm.DocMestoId,ParentForm.DocLoadTypeId]);
  except
  End;

  if (CurrentBegDate<>DateOf(edBeg.DateTime)) or (CurrentEndDate<>DateOf(edEnd.DateTime)) then
  try
    ParentForm.pkgFOR_RASPOR.CallProcedure('FILL_TEMPNL',[EditID,DateOf(edBeg.Date),DateOf(edEnd.Date),ParentForm.DocLoadTypeId]);
    q_rows.Close;
    q_rows.Open;
  except
  End;

  CurrentDate:=DateOf(edDat.DateTime);
  CurrentBegDate:=DateOf(edBeg.DateTime);
  CurrentEndDate:=DateOf(edEnd.DateTime);
end;

procedure Tf_RasporNew.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Raspor(Owner);
  pkgFOR_DOCUMENTS.Session:=ParentForm.ora_Session;
  q_Rows.Session:=ParentForm.ora_Session;
  CurrentDate:=Now-1;
  CurrentBegDate:=Now-1;
  CurrentEndDate:=Now-1;
end;

procedure Tf_RasporNew.FormActivate(Sender: TObject);
begin
  if IsAdd and (EditId=0) then
  Begin
    Caption:='Новое разрешение';

    edDat.DateTime:=DateOf(Now);
    edTime.DateTime:=TimeOf(Now);
    edBeg.DateTime:=DateOf(edDat.DateTime);
    edEnd.DateTime:=ParentForm.pkgFOR_RASPOR.CallDateFunction('GetDATE_END',[DateOf(edBeg.DateTime),ParentForm.DocMestoId,ParentForm.DocLoadTypeId]);

    EditId:=0;
  End;

  if IsAdd and (EditId<>0) then
  Begin
    Caption:='Новое разрешение';

    edDat.DateTime:=DateOf(Now);
    edTime.DateTime:=TimeOf(Now);
    edBeg.DateTime:=DateOf(ParentForm.q_Title.FieldByName('DATE_BEG').AsDateTime);
    edEnd.DateTime:=DateOf(ParentForm.q_Title.FieldByName('DATE_END').AsDateTime);

    EditId:=0;
  end;

  if not IsAdd and (EditId<>0) then
  Begin
    Caption:='Редактирование разрешения';

    edNum.Text:=ParentForm.q_Title.FieldByName('NUM_NAR').AsString;
    edDat.DateTime:=DateOf(ParentForm.q_Title.FieldByName('DATE_NAR').AsDateTime);
    edTime.DateTime:=TimeOf(ParentForm.q_Title.FieldByName('DATE_NAR').AsDateTime);
    edBeg.DateTime:=DateOf(ParentForm.q_Title.FieldByName('DATE_BEG').AsDateTime);
    edEnd.DateTime:=DateOf(ParentForm.q_Title.FieldByName('DATE_END').AsDateTime);

    CurrentDate:=DateOf(edDat.DateTime);
    CurrentBegDate:=DateOf(edBeg.DateTime);
    CurrentEndDate:=DateOf(edEnd.DateTime);
    try
      ParentForm.pkgFOR_RASPOR.CallProcedure('FILL_TEMPNL',[EditID,DateOf(edBeg.Date),DateOf(edEnd.Date),ParentForm.DocLoadTypeId]);
      q_rows.Close;
      q_rows.Open;
    except
    End;
  end;

  CheckDate(Sender);
end;

procedure Tf_RasporNew.btOkClick(Sender: TObject);
var
  vNum:double;
  vDat:TDateTime;
  vBegDate:TDateTime;
  vEndDate:TDateTime;
begin
  // Сохраняем изменения
  GridRowsExit(Sender);

  // Проверка реквизитов
  if (edNum.text='0') or (edNum.text='') then
  Begin
    Application.MessageBox('Не заполнен номер документа!','Внимание',MB_OK);
    edNum.SetFocus;
    exit;
  End;
  if (edDat.DateTime=0) then
  Begin
    Application.MessageBox('Не заполнена дата документа!','Внимание',MB_OK);
    edDat.SetFocus;
    exit;
  End;

  // Сохранение номера
  try
    pkgFOR_DOCUMENTS.CallProcedure('SET_NUM',[ParentForm.DocType,ParentForm.DocMestoId,EditId,'',StrToInt(edNum.Text),DateOf(edDat.DateTime)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'RASPOR',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  // Сохранение документа
  try
    vNum:=StrToFloat(edNum.Text);
    vDat:=DateOf(edDat.DateTime)+TimeOf(edTime.DateTime);
    vBegDate:=DateOf(edBeg.DateTime);
    vEndDate:=DateOf(edEnd.DateTime);

    EditId:=ParentForm.pkgFOR_RASPOR.CallFloatFunction('AddTitle',[1,EditId,ParentForm.DocMestoId,ParentForm.DocLoadTypeId,
          vNum,vDat,vBegDate,vEndDate]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'RASPOR',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;
end;

procedure Tf_RasporNew.edNumChange(Sender: TObject);
begin
  // Номер только числовой
  try
    edNum.Text:=IntToStr(StrToInt(edNum.Text));
  except
    edNum.Text:='0';
  end;
end;

procedure Tf_RasporNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    // Очищаем список резервирования номеров текущего пользователя
    pkgFOR_DOCUMENTS.CallProcedure('CLEAR_RESERV',[ParentForm.DocType,ParentForm.DocMestoId]);
  except
  End;
end;

procedure Tf_RasporNew.btSetNumClick(Sender: TObject);
begin
  CurrentDate:=CurrentDate-1;
  CheckDate(Sender);
end;

procedure Tf_RasporNew.q_rowsCalcFields(DataSet: TDataSet);
begin
  q_rows.FieldByName('OST_KOL').AsFloat:=q_rows.FieldByName('KOL').AsFloat-q_rows.FieldByName('FACT_KOL').AsFloat;
  q_rows.FieldByName('OST_VES').AsFloat:=q_rows.FieldByName('VES').AsFloat-q_rows.FieldByName('FACT_VES').AsFloat;
  q_rows.FieldByName('OST_MON_KOL').AsFloat:=q_rows.FieldByName('MON_KOL').AsFloat-q_rows.FieldByName('MON_FACT_KOL').AsFloat;
  q_rows.FieldByName('OST_MON_VES').AsFloat:=q_rows.FieldByName('MON_VES').AsFloat-q_rows.FieldByName('MON_FACT_VES').AsFloat;
  q_rows.FieldByName('OST_REE').AsFloat:=q_rows.FieldByName('TONN_REE').AsFloat-q_rows.FieldByName('FACT_VES').AsFloat;
end;

procedure Tf_RasporNew.edFilterChange(Sender: TObject);
begin
  try
    if edFilter.Text<>'' then
      q_rows.SQL[3]:=' WHERE a.NOM_ZD LIKE ''%'+Trim(edFilter.Text)+'%'''
    else
      q_rows.SQL[3]:=' WHERE 1=1';
    f_db.ReQuery(q_rows,true);  
  except
  end;
end;

procedure Tf_RasporNew.GridRowsExit(Sender: TObject);
begin
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

procedure Tf_RasporNew.GridRowsSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
end;

procedure Tf_RasporNew.q_rowsKOLChange(Sender: TField);
begin
  IF (q_rowsVES.AsFloat=0) and (q_rowsKOL.AsFloat<>0) AND (q_rowsNORMOTGR.AsFloat<>0) THEN
    q_rowsVES.AsFloat:=RoundTo(q_rowsKOL.AsFloat * q_rowsNORMOTGR.AsFloat,-3);
end;

procedure Tf_RasporNew.q_rowsVESChange(Sender: TField);
begin
  IF (q_rowsKOL.AsFloat=0) and (q_rowsVES.AsFloat<>0) AND (q_rowsNORMOTGR.AsFloat<>0) THEN
    q_rowsKOL.AsFloat:=Int(q_rowsVES.AsFloat / q_rowsNORMOTGR.AsFloat+0.5);
end;

procedure Tf_RasporNew.q_rowsKOLSetText(Sender: TField;
  const Text: String);
begin
  if Text='' then Sender.AsFloat:=0
  else Sender.AsString:=Text;
end;

procedure Tf_RasporNew.q_rowsVESSetText(Sender: TField;
  const Text: String);
begin
  if Text='' then Sender.AsFloat:=0
  else Sender.AsString:=Text;
end;

procedure Tf_RasporNew.btRefreshClick(Sender: TObject);
begin
  GridRowsExit(Sender);
  f_db.ReQuery(q_rows,true);
end;

end.
