unit MO_MoveVagon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, ActnList, Menus,
  XPStyleActnCtrls, ActnMan, Grids, DBGrids,MO_VedOsmotr, MO_Podacha, MO_SvedNew,
  DBGridEh, StdCtrls, TB2Item, ToolWin, ActnCtrls, TB2ExtItems;

type
  Tf_MoveVagon = class(TForm)
    q_Source: TOracleDataSet;
    ds_Source: TDataSource;
    amMoveVagon: TActionManager;
    acSelDoc: TAction;
    acClose: TAction;
    GridSource: TDBGridEh;
    popMoveVagon: TTBPopupMenu;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    ActionToolBar1: TActionToolBar;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem3: TTBItem;
    TBEditItem1: TTBEditItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure acSelDocExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure GridSourceDblClick(Sender: TObject);
    procedure GridSourceKeyPress(Sender: TObject; var Key: Char);
    procedure GridSourceColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure q_SourceBeforeOpen(DataSet: TDataSet);
    procedure q_SourceAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure q_SourceFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure TBEditItem1AcceptText(Sender: TObject; var NewText: String;
      var Accept: Boolean);
    procedure TBItem4Click(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
  private
    { Private declarations }
    Filter2source: TStringList; // Список для фильтра 
  public
    { Public declarations }
    ParentFormName:string;
    ParentFormPodacha: Tf_Podacha;
    ParentFormVedOsmotr: Tf_VedOsmotr;
    ParentFormSvedNew: Tf_SvedNew;
  end;

var
  f_MoveVagon:Tf_MoveVagon;

implementation
{$R *.dfm}
uses main, ForDB;

procedure Tf_MoveVagon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_Source.Close;
  // Освобождаем память
  try
    filter2source.Clear;
  except
  end;
end;

procedure Tf_MoveVagon.FormActivate(Sender: TObject);
var
  GridCol:TColumnEh;
  i:integer;

begin
  //в соответствие с тем какую форму выбрали заполним грид столбцами
  if ParentFormName='f_Podacha' then
  begin
    ParentFormPodacha:=Tf_Podacha(Owner);
    q_Source.Session:=ParentFormPodacha.ora_Session;
    for i:=1 to ParentFormPodacha.GridTitle.Columns.Count-1 do
    begin
      GridCol:=GridSource.Columns.Add;
      GridCol.Title.Caption:=ParentFormPodacha.GridTitle.Columns[i-1].Title.Caption;
      GridCol.FieldName:=ParentFormPodacha.GridTitle.Columns[i-1].FieldName;
    end;
  end;

  if ParentFormName='f_VedOsmotr' then
  begin
    ParentFormVedOsmotr:=Tf_VedOsmotr(Owner);
    q_Source.Session:=ParentFormVedOsmotr.ora_Session;
    for i:=1 to ParentFormVedOsmotr.GridTitle.Columns.Count-1 do
    begin
      GridCol:=GridSource.Columns.Add;
      GridCol.Title.Caption:=ParentFormVedOsmotr.GridTitle.Columns[i-1].Title.Caption;
      GridCol.FieldName:=ParentFormVedOsmotr.GridTitle.Columns[i-1].FieldName;
    end;
  end;

  //ЕСЛИ ВЫЗВАНА ИЗ нОВОГО СВЕДЕНИЯ
  if ParentFormName='f_SvedNew' then
  begin
    ParentFormSvedNew:=Tf_SvedNew(Owner);
    q_Source.Session:=ParentFormSvedNew.ParentForm.ora_Session;
    Caption:='Выбор паспорта';
    GridCol:=GridSource.Columns.Add;
    GridCol.Title.Caption:='№ док.';
    GridCol.FieldName:='PASP_NUM';
    GridCol:=GridSource.Columns.Add;
    GridCol.Title.Caption:='№ рез.';
    GridCol.FieldName:='REZ_NUM';
    GridCol:=GridSource.Columns.Add;
    GridCol.Title.Caption:='Дата пасп.';
    GridCol.FieldName:='PASP_DATE';
    GridCol:=GridSource.Columns.Add;
    GridCol.Title.Caption:='Дата изг.';
    GridCol.FieldName:='DATE_VIR';
    GridCol:=GridSource.Columns.Add;
    GridCol.Title.Caption:='Нефтепродукт';
    GridCol.FieldName:='NAME_NPR';
  end;
//откроем многострадальный датасет
  q_Source.Open;
end;

procedure Tf_MoveVagon.acSelDocExecute(Sender: TObject);
var id: double;
begin
//передадим в соостветствующую родительскую форму ID
  id:=q_Source.FieldByName('ID').Value;
  if ParentFormName='f_Podacha' then ParentFormPodacha.ReturnID:=id;
  if ParentFormName='f_VedOsmotr' then ParentFormVedOsmotr.ReturnID:=id;
  if ParentFormName='f_SvedNew' then ParentFormSvedNew.ReturnID:=id;
  ModalResult:=mrOk;
end;

procedure Tf_MoveVagon.acCloseExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_MoveVagon.GridSourceDblClick(Sender: TObject);
begin
  acSelDocExecute(Self);//выполним экшен SelDoc
end;

procedure Tf_MoveVagon.GridSourceKeyPress(Sender: TObject; var Key: Char);
begin
 if Key=#13 then acSelDocExecute(Self);//на Enter выполним то же самое что и на ДаблКлик
end;

procedure Tf_MoveVagon.GridSourceColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  try
    Params.Text:=IntToStr(q_Source.RecNo);
  except
    Params.Text:='0';
  end;
end;

procedure Tf_MoveVagon.q_SourceBeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor := crSQLWait;
end;

procedure Tf_MoveVagon.q_SourceAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  Screen.Cursor := crDefault;
  // Подготовка Popup-фильтра
  if filter2source.Count=0 then
    for i:=1 to q_Source.FieldCount+1 do
    Begin
      Filter2source.Add('');
    end;
end;

procedure Tf_MoveVagon.FormCreate(Sender: TObject);
begin
  // Popup-Фильтр
  Filter2source:=TStringList.Create;
  Filter2source.Clear;
end;

procedure Tf_MoveVagon.q_SourceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=f_db.AcceptFilterRecord(gridSource,filter2source);
end;

procedure Tf_MoveVagon.TBEditItem1AcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  f_db.FilterAcceptText(gridSource,filter2source,NewText,Accept);
end;

procedure Tf_MoveVagon.TBItem4Click(Sender: TObject);
begin
  f_db.FilterCurrentValue(gridSource,filter2source);
end;

procedure Tf_MoveVagon.TBItem5Click(Sender: TObject);
begin
  f_db.FilterCLear(gridSource,filter2source);
end;

end.
