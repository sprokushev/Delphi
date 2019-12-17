unit LoadTask;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYForm, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask, Placemnt, Buttons, FileCtrl, RXDBCtrl, Menus, vgCtrls,
  vgDBTree, RxLookup;

type
  TfmLoadTask = class(TfmAnyForm)
    paRight: TPanel;
    pcGuid: TPageControl;
    tsRecord: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    GroupBox1: TGroupBox;
    sbPath: TSpeedButton;
    DBEdit4: TDBEdit;
    odModule: TOpenDialog;
    FormPlacement1: TFormPlacement;
    bbClose: TBitBtn;
    tsTable: TTabSheet;
    TaskTree: TvgDBTreeView;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    DBNavigator1: TDBNavigator;
    btAdd: TSpeedButton;
    btDel: TSpeedButton;
    btnUp: TSpeedButton;
    btDown: TSpeedButton;
    btLeft: TSpeedButton;
    btRight: TSpeedButton;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton8: TSpeedButton;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBCheckBox2: TDBCheckBox;
    procedure buCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbPathClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbCloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TaskTreeClick(Sender: TObject);
    procedure TaskTreeDblClick(Sender: TObject);
    procedure pcGuidChange(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btDelClick(Sender: TObject);
    procedure btLeftClick(Sender: TObject);
    procedure btRightClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btDownClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OldSel:TTreeNode;
    StartMoving:boolean;
    IDMoving:integer;
  end;

var
  fmLoadTask: TfmLoadTask;
  gUniKey:Integer;
implementation

uses Data;

{$R *.DFM}

procedure TfmLoadTask.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmLoadTask.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  with dmData do
  if (taParamLoadTask.State=dsInsert) or (taParamLoadTask.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taParamLoadTask.Post
    else taParamLoadTask.Cancel;
end;

procedure TfmLoadTask.sbPathClick(Sender: TObject);
begin
inherited;
  with dmData do
  begin
    odModule.Filter := 'DBF-файлы|*.DBF|Все файлы|*.*';
    odModule.FileName := taParamLoadTask.FieldByName('FILENAME').AsString;
    if odModule.Execute then
    begin
      if not (taParamLoadTask.State = dsInsert) then taParamLoadTask.Edit;
      taParamLoadTask.FieldByName('FILENAME').AsString := odModule.FileName;
    end;{if}
  end;
end;

procedure TfmLoadTask.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmData.taParamLoadTask.Close;
end;

procedure TfmLoadTask.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmLoadTask.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with dmData do
  begin
    odModule.Filter := 'EXE-файлы|*.EXE|Все файлы|*.*';
    odModule.FileName := taParamLoadTask.FieldByName('LOADER').AsString;
    if odModule.Execute then
    begin
      if not (taParamLoadTask.State = dsInsert) then taParamLoadTask.Edit;
      taParamLoadTask.FieldByName('LOADER').AsString := odModule.FileName;
    end;{if}
  end;
end;

procedure TfmLoadTask.TaskTreeClick(Sender: TObject);
begin
  inherited;
  TaskTree.UpdateCursorPos;
end;

procedure TfmLoadTask.TaskTreeDblClick(Sender: TObject);
begin
  inherited;
  TaskTree.UpdateCursorPos;
  pcGuid.ActivePage:=tsRecord;
  DBNavigator1.Enabled:=(pcGuid.ActivePage=tsRecord);
end;

procedure TfmLoadTask.pcGuidChange(Sender: TObject);
begin
  inherited;
  with dmData do
  if (taParamLoadTask.State <> dsBrowse) then taParamLoadTask.Post;
  DBNavigator1.Enabled:=(pcGuid.ActivePage=tsRecord);
  TaskTree.FullExpand;
end;

procedure TfmLoadTask.btAddClick(Sender: TObject);
var CurFilename,CurLoader,CurTask:string;
    CurOwner:integer;
begin
  inherited;
  TaskTree.UpdateCursorPos;
  with dmData.taParamLoadTask do
  try
    CurFilename:=ExtractFilePath(FieldByName('FILENAME').AsString)+'new.dbf';
    CurOwner:=FieldByName('ID').AsInteger;
    CurLoader:=FieldByName('LOADER').AsString;
    CurTask:=FieldByName('TASK').AsString;
    Append;
    FieldByName('FILENAME').AsString:=CurFilename;
    FieldByName('OWNER_ID').AsInteger:=CurOwner;
    FieldByName('LOADER').AsString:=CurLoader;
    FieldByName('TASK').AsString:=CurTask;
    pcGuid.ActivePage:=tsRecord;
    DBNavigator1.Enabled:=(pcGuid.ActivePage=tsRecord);
  except
  end;
end;

procedure TfmLoadTask.FormActivate(Sender: TObject);
begin
  inherited;
  TaskTree.FullExpand;
end;

procedure TfmLoadTask.btDelClick(Sender: TObject);
begin
  inherited;
  with dmData.taParamLoadTask do
  If FieldByName('ID').AsInteger<>0 then Delete;
  TaskTree.FullExpand;
end;

procedure TfmLoadTask.btLeftClick(Sender: TObject);
var CurID,CurOwnerID,CurOrderID,NewOwnerID,NewOrderID:integer;
begin
  inherited;
  with dmData do
  try
    taParamLoadTask.DisableControls;
    CurID:=taParamLoadTask.FieldByName('ID').AsInteger;
    CurOwnerID:=taParamLoadTask.FieldByName('OWNER_ID').AsInteger;
    CurOrderID:=taParamLoadTask.FieldByName('ID_ORDER').AsInteger;
    If CurOwnerID>0 then
    Begin
      if taParamLoadTask.Locate('ID',CurOwnerID,[]) then
      Begin
        NewOwnerID:=taParamLoadTask.FieldByName('OWNER_ID').AsInteger;
        NewOrderID:=taParamLoadTask.FieldByName('ID_ORDER').AsInteger+1;
        while taParamLoadTask.Locate('ID_ORDER',NewOrderID,[]) do NewOrderID:=NewOrderID+1;
        taParamLoadTask.Locate('ID',CurID,[]);
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('OWNER_ID').AsInteger:=NewOwnerID;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=NewOrderID;
        taParamLoadTask.Post;
      End;
    End;
  finally
    taParamLoadTask.EnableControls;
    TaskTree.FullExpand;
  end;
end;

procedure TfmLoadTask.btRightClick(Sender: TObject);
var CurID,CurOwnerID,CurOrderID,NewOwnerID,NewOrderID:integer;
    q:TQuery;
begin
  inherited;
  with dmData do
  try
    taParamLoadTask.DisableControls;
    CurID:=taParamLoadTask.FieldByName('ID').AsInteger;
    CurOwnerID:=taParamLoadTask.FieldByName('OWNER_ID').AsInteger;
    CurOrderID:=taParamLoadTask.FieldByName('ID_ORDER').AsInteger;
    If CurID>0 then
    Begin
      q:=TQuery.Create(Self);
      q.DatabaseName:='UHTA_BDE';
      q.SQL.Add('SELECT A.ID,A.ID_ORDER,A.OWNER_ID FROM loadtask A WHERE A.ID_ORDER IN (SELECT MAX(B.ID_ORDER) FROM loadtask B WHERE B.owner_id='+IntToStr(CurOwnerID)+' AND B.id_order<'+IntToStr(CurOrderID)+')');
      q.Open;
      if NOT q.EOF then
      Begin
        NewOwnerID:=q.FieldByName('ID').AsInteger;
        NewOrderID:=1;
        while taParamLoadTask.Locate('ID_ORDER',NewOrderID,[]) do NewOrderID:=NewOrderID+1;
        taParamLoadTask.Locate('ID',CurID,[]);
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('OWNER_ID').AsInteger:=NewOwnerID;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=NewOrderID;
        taParamLoadTask.Post;
      End;
      q.Close;
      q.SQL.Clear;
      q.Free;
    End;
  finally
    taParamLoadTask.EnableControls;
    TaskTree.FullExpand;
  end;
end;

procedure TfmLoadTask.btnUpClick(Sender: TObject);
var CurID,CurOwnerID,CurOrderID,NewID,NewOwnerID,NewOrderID:integer;
    q:TQuery;
begin
  inherited;
  with dmData do
  try
    taParamLoadTask.DisableControls;
    CurID:=taParamLoadTask.FieldByName('ID').AsInteger;
    CurOwnerID:=taParamLoadTask.FieldByName('OWNER_ID').AsInteger;
    CurOrderID:=taParamLoadTask.FieldByName('ID_ORDER').AsInteger;
    If CurID>0 then
    Begin
      q:=TQuery.Create(Self);
      q.DatabaseName:='UHTA_BDE';
      q.SQL.Add('SELECT A.ID,A.ID_ORDER,A.OWNER_ID FROM loadtask A WHERE A.ID_ORDER IN (SELECT MAX(B.ID_ORDER) FROM loadtask B WHERE B.owner_id='+IntToStr(CurOwnerID)+' AND B.id_order<'+IntToStr(CurOrderID)+')');
      q.Open;
      if NOT q.EOF then
      Begin
        NewID:=q.FieldByName('ID').AsInteger;
        NewOrderID:=q.FieldByName('ID_ORDER').AsInteger;
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=NewOrderID;
        taParamLoadTask.Post;
        taParamLoadTask.Locate('ID',NewID,[]);
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=CurOrderID;
        taParamLoadTask.Post;
      End;
      q.Close;
      q.SQL.Clear;
      q.Free;
    End;
  finally
    taParamLoadTask.EnableControls;
    TaskTree.FullExpand;
  end;
end;

procedure TfmLoadTask.btDownClick(Sender: TObject);
var CurID,CurOwnerID,CurOrderID,NewID,NewOwnerID,NewOrderID:integer;
    q:TQuery;
begin
  inherited;
  with dmData do
  try
    taParamLoadTask.DisableControls;
    CurID:=taParamLoadTask.FieldByName('ID').AsInteger;
    CurOwnerID:=taParamLoadTask.FieldByName('OWNER_ID').AsInteger;
    CurOrderID:=taParamLoadTask.FieldByName('ID_ORDER').AsInteger;
    If CurID>0 then
    Begin
      q:=TQuery.Create(Self);
      q.DatabaseName:='UHTA_BDE';
      q.SQL.Add('SELECT A.ID,A.ID_ORDER,A.OWNER_ID FROM loadtask A WHERE A.ID_ORDER IN (SELECT MIN(B.ID_ORDER) FROM loadtask B WHERE B.owner_id='+IntToStr(CurOwnerID)+' AND B.id_order>'+IntToStr(CurOrderID)+')');
      q.Open;
      if NOT q.EOF then
      Begin
        NewID:=q.FieldByName('ID').AsInteger;
        NewOrderID:=q.FieldByName('ID_ORDER').AsInteger;
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=NewOrderID;
        taParamLoadTask.Post;
        taParamLoadTask.Locate('ID',NewID,[]);
        taParamLoadTask.Edit;
        taParamLoadTask.FieldByName('ID_ORDER').AsInteger:=CurOrderID;
        taParamLoadTask.Post;
      End;
      q.Close;
      q.SQL.Clear;
      q.Free;
    End;
  finally
    taParamLoadTask.EnableControls;
    TaskTree.FullExpand;
  end;
end;

procedure TfmLoadTask.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  with dmData do
  begin
    odModule.Filter := 'Исполняемые модули|*.BAT;*.COM;*.EXE|Все файлы|*.*';
    odModule.FileName := taParamLoadTask.FieldByName('MODULE').AsString;
    if odModule.Execute then
    begin
      if not (taParamLoadTask.State = dsInsert) then taParamLoadTask.Edit;
      taParamLoadTask.FieldByName('MODULE').AsString := odModule.FileName;
    end;{if}
  end;
end;

end.
