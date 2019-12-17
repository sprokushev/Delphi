unit MO_TablPok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Oracle, DB, OracleData, ExtCtrls, Grids, DBGridEh, ToolWin,
  ActnMan, ActnCtrls, XPStyleActnCtrls, ActnList, DBCtrls, RxLookup,
  PropFilerEh, PropStorageEh;

type
  Tf_TablPok = class(TForm)
    amTablPok: TActionManager;
    GridTitle: TDBGridEh;
    gridRows: TDBGridEh;
    Splitter1: TSplitter;
    q_title: TOracleDataSet;
    q_rows: TOracleDataSet;
    ds_title: TDataSource;
    ds_rows: TDataSource;
    ora_Session: TOracleSession;
    q_titleID_NPR: TStringField;
    q_titleNAME_NPR: TStringField;
    q_rowsPROD_ID_NPR: TStringField;
    q_rowsKODIF_ID: TIntegerField;
    q_rowsNPP: TIntegerField;
    q_rowsSORTBY: TIntegerField;
    q_rowsNORMTU: TStringField;
    q_rowsDATEUPLOAD: TDateTimeField;
    q_rowsNAME: TStringField;
    q_kodif: TOracleDataSet;
    ds_kodif: TDataSource;
    acLastRecord: TAction;
    acFirstRecord: TAction;
    acNextRecord: TAction;
    acPrevRecord: TAction;
    acDelRecord: TAction;
    acPostTablPok: TAction;
    acAddRecord: TAction;
    ActionToolBar1: TActionToolBar;
    lcCopyProd: TRxDBLookupCombo;
    q_prod: TOracleDataSet;
    ds_prod: TDataSource;
    q_copy: TOracleDataSet;
    PropStorageEh1: TPropStorageEh;
    procedure FormCreate(Sender: TObject);
    procedure q_titleAfterScroll(DataSet: TDataSet);
    procedure q_rowsAfterInsert(DataSet: TDataSet);
    procedure gridRowsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_rowsAfterScroll(DataSet: TDataSet);
    procedure acFirstRecordExecute(Sender: TObject);
    procedure GridTitleEnter(Sender: TObject);
    procedure gridRowsEnter(Sender: TObject);
    procedure acLastRecordExecute(Sender: TObject);
    procedure acNextRecordExecute(Sender: TObject);
    procedure acPrevRecordExecute(Sender: TObject);
    procedure acAddRecordExecute(Sender: TObject);
    procedure acDelRecordExecute(Sender: TObject);
    procedure acUpdateRecordExecute(Sender: TObject);
    procedure acPostTablPokExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcCopyProdChange(Sender: TObject);
  private
    { Private declarations }
    IsRefresh:boolean;
    // Значения полей предыдущей записи
    vNextState:TDataSetState;
    ActiveGrid:char;
  public
    { Public declarations }
  end;

var
  f_TablPok: Tf_TablPok;

implementation

{$R *.dfm}

uses ForDB,ForSess, Main;
procedure Tf_TablPok.FormCreate(Sender: TObject);
begin
  // Сессия
  f_db.LogonMasterSession(ora_Session);
  IsRefresh:=true;
  q_title.Open;
  IsRefresh:=false;
  IsRefresh:=true;
  q_rows.Open;
  IsRefresh:=false;
  q_prod.Open;
end;

procedure Tf_TablPok.q_titleAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if IsRefresh then exit;
  // обновляем позиции
  f_db.ReQuery(q_rows,false);

end;

procedure Tf_TablPok.q_rowsAfterInsert(DataSet: TDataSet);
begin
 q_rowsKodif_id.Value:=0;
 q_rowsProd_id_npr.AsString:=q_titleID_NPR.AsString;
 q_rowsDATEUPLOAD.Value:=Date;
end;

procedure Tf_TablPok.gridRowsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Проверка
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  if (Key=VK_DOWN) and (q_rows.State<>dsBrowse) then
  begin
    // Нажата кнопка "Вниз" а запись в этот момент находится в режиме редактирования,
    // значит нужно после перехода на следующую запись, также перейти в режим редактирования
    // и заполнить поля значениями из текущей записи (если они пустые)
    vNextState:=dsEdit;
  end
  else
  begin
    vNextState:=dsBrowse;
  end;

end;

procedure Tf_TablPok.q_rowsAfterScroll(DataSet: TDataSet);
begin
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // Находясь в режиме редактирования заполнить поле значением из строки выше
    vNextState:=dsBrowse;
    q_rows.Edit;
  end;
end;

procedure Tf_TablPok.acDelRecordExecute(Sender: TObject);
begin
  q_Rows.Delete;
end;

procedure Tf_TablPok.acUpdateRecordExecute(Sender: TObject);
begin
  q_rows.UpdateRecord;
end;

procedure Tf_TablPok.acAddRecordExecute(Sender: TObject);
begin
  q_rows.Append;
end;

procedure Tf_TablPok.acPostTablPokExecute(Sender: TObject);
begin
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

//Экшены движения по датасету
procedure Tf_TablPok.acFirstRecordExecute(Sender: TObject);
begin
  if ActiveGrid='r' then q_rows.First;
  if ActiveGrid='t' then q_title.First;
end;

procedure Tf_TablPok.GridTitleEnter(Sender: TObject);
begin
  ActiveGrid:='t';
end;

procedure Tf_TablPok.gridRowsEnter(Sender: TObject);
begin
  ActiveGrid:='r';
end;

procedure Tf_TablPok.acLastRecordExecute(Sender: TObject);
begin
  if ActiveGrid='r' then q_rows.Last;
  if ActiveGrid='t' then q_title.Last;
end;

procedure Tf_TablPok.acNextRecordExecute(Sender: TObject);
begin
  if ActiveGrid='r' then q_rows.Next;
  if ActiveGrid='t' then q_title.Next;
end;

procedure Tf_TablPok.acPrevRecordExecute(Sender: TObject);
begin
  if ActiveGrid='r' then q_rows.Prior;
  if ActiveGrid='t' then q_title.Prior;
end;


procedure Tf_TablPok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем сессию
  ora_Session.Commit;
  ora_Session.Connected:=false;
  // Закрываем окно
  Action:=caFree;
end;

procedure Tf_TablPok.lcCopyProdChange(Sender: TObject);
begin
  q_copy.Close;
  q_copy.SetVariable(':ID_NPR',lcCopyProd.KeyValue);
  q_copy.Open;
  q_rows.DisableControls;
  while not q_copy.Eof do
  begin
    q_rows.Append;
    q_rowsKodif_id.Value:=q_copy.FieldByName('kodif_id').AsInteger;
    q_rowsNORMTU.Value:=q_copy.FieldByName('NORMTU').AsString;
    q_rowsNPP.Value:=q_copy.FieldByName('NPP').AsInteger;
    q_rowsSORTBY.Value:=q_copy.FieldByName('SORTBY').AsInteger;
    q_copy.Next;
  end;
  q_rows.EnableControls;
end;

end.
