unit PingList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYForm, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask, Placemnt, Buttons, FileCtrl, RXDBCtrl, Menus;

type
  TfmPingList = class(TfmAnyForm)
    paRight: TPanel;
    dnvGuid: TDBNavigator;
    pcGuid: TPageControl;
    tsTable: TTabSheet;
    tsRecord: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    sbPathPing1: TSpeedButton;
    sbPathFlag: TSpeedButton;
    DBEdit4: TDBEdit;
    odModule: TOpenDialog;
    rxgrPingList: TRxDBGrid;
    FormPlacement1: TFormPlacement;
    bbClose: TBitBtn;
    GroupBox3: TGroupBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    sbPathNoPing1: TSpeedButton;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    sbPathPing2: TSpeedButton;
    DBEdit5: TDBEdit;
    sbPathNoPing2: TSpeedButton;
    DBEdit6: TDBEdit;
    sbPathPing3: TSpeedButton;
    DBEdit9: TDBEdit;
    sbPathNoPing3: TSpeedButton;
    procedure buCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbPathPing1Click(Sender: TObject);
    procedure sbPathFlagClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure rxgrPingListDblClick(Sender: TObject);
    procedure rxgrPingListGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure bbCloseClick(Sender: TObject);
    procedure sbPathPing2Click(Sender: TObject);
    procedure sbPathPing3Click(Sender: TObject);
    procedure sbPathNoPing1Click(Sender: TObject);
    procedure sbPathNoPing2Click(Sender: TObject);
    procedure sbPathNoPing3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFileBox(DirPath:string):string;
  end;

var
  fmPingList: TfmPingList;
  gUniKey:Integer;
implementation

uses Data;

{$R *.DFM}

procedure TfmPingList.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

function TfmPingList.GetFileBox(DirPath:string):string;
begin
  SelectDirectory(DirPath, [sdAllowCreate, sdPerformCreate, sdPrompt],0);
  GetFileBox:=DirPath;
end;

procedure TfmPingList.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  with dmData do
  if (taParamPingList.State=dsInsert) or (taParamPingList.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taParamPingList.Post
    else taParamPingList.Cancel;
end;

procedure TfmPingList.sbPathPing1Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('PINGDIR1').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('PINGDIR1').AsString := GetFileBox(S);
  end;
end;

procedure TfmPingList.sbPathFlagClick(Sender: TObject);
var
  pDir: string;
begin
  inherited;
  with dmData do
  begin
    pDir := taParamPingList.FieldByName('FLAGPATH').AsString;
    if SelectDirectory(pDir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    begin
      if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
      taParamPingList.FieldByName('FLAGPATH').AsString := pDir;
    end;{if}
  end;
end;

procedure TfmPingList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmData.taParamPingList.Close;
end;

procedure TfmPingList.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmPingList.rxgrPingListDblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmPingList.rxgrPingListGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  with dmData do
  if taParamPingList.FieldByName('RUN').AsBoolean = True then
     AFont.Style := AFont.Style + [fsBold];  { Активный процесс }
end;

procedure TfmPingList.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmPingList.sbPathPing2Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('PINGDIR2').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('PINGDIR2').AsString := GetFileBox(s);
  end;

end;

procedure TfmPingList.sbPathPing3Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('PINGDIR3').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('PINGDIR3').AsString := GetFileBox(s);
  end;

end;

procedure TfmPingList.sbPathNoPing1Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('NOPINGDIR1').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('NOPINGDIR1').AsString := GetFileBox(s);
  end;
end;

procedure TfmPingList.sbPathNoPing2Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('NOPINGDIR2').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('NOPINGDIR2').AsString := GetFileBox(s);
  end;
end;

procedure TfmPingList.sbPathNoPing3Click(Sender: TObject);
var S:string;
begin
  inherited;
  with dmData do
  begin
    s:=taParamPingList.FieldByName('NOPINGDIR3').AsString;
    if not (taParamPingList.State = dsInsert) then taParamPingList.Edit;
    taParamPingList.FieldByName('NOPINGDIR3').AsString := GetFileBox(s);
  end;
end;

end.
