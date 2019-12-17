unit LstFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYForm, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask, Placemnt, Buttons, FileCtrl, RXDBCtrl, Menus;

type
  TfmListFiles = class(TfmAnyForm)
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
    sbPath: TSpeedButton;
    sbPathFlag: TSpeedButton;
    BitBtn1: TBitBtn;
    DBEdit4: TDBEdit;
    odModule: TOpenDialog;
    rxgrListFiles: TRxDBGrid;
    FormPlacement1: TFormPlacement;
    bbClose: TBitBtn;
    procedure buCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbPathClick(Sender: TObject);
    procedure sbPathFlagClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure rxgrListFilesDblClick(Sender: TObject);
    procedure rxgrListFilesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure bbCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmListFiles: TfmListFiles;
  gUniKey:Integer;
implementation

uses Data;

{$R *.DFM}

procedure TfmListFiles.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmListFiles.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  with dmData do
  if (taParamListFiles.State=dsInsert) or (taParamListFiles.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taParamListFiles.Post
    else taParamListFiles.Cancel;
end;

procedure TfmListFiles.sbPathClick(Sender: TObject);
begin
inherited;
  with dmData do
  begin
    odModule.Filter := 'DBF-файлы|*.DBF|Все файлы|*.*';
    odModule.FileName := taParamListFiles.FieldByName('FILENAME').AsString;
    if odModule.Execute then
    begin
      if not (taParamListFiles.State = dsInsert) then taParamListFiles.Edit;
      taParamListFiles.FieldByName('FILENAME').AsString := odModule.FileName;
    end;{if}
  end;
end;

procedure TfmListFiles.sbPathFlagClick(Sender: TObject);
var
  pDir: string;
begin
  inherited;
  with dmData do
  begin
    pDir := taParamListFiles.FieldByName('FLAGPATH').AsString;
    if SelectDirectory(pDir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    begin
      if not (taParamListFiles.State = dsInsert) then taParamListFiles.Edit;
      taParamListFiles.FieldByName('FLAGPATH').AsString := pDir;
    end;{if}
  end;
end;

procedure TfmListFiles.BitBtn1Click(Sender: TObject);
var
  pFlagPath, pFlagName : String;
  pFileFlagHandle : Integer;
begin
  inherited;
  with dmData.taParamListFiles do
  begin
    pFlagPath := FieldByName('FLAGPATH').AsString;
    pFlagName := FieldByName('FLAGNAME').AsString;
    pFileFlagHandle := FileCreate(pFlagPath + '\' + pFlagName);
    FileClose(pFileFlagHandle);
  end;{with}
end;

procedure TfmListFiles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmData.taParamListFiles.Close;
end;

procedure TfmListFiles.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmListFiles.rxgrListFilesDblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmListFiles.rxgrListFilesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  with dmData do
  if taParamListFiles.FieldByName('RUN').AsBoolean = True then
     AFont.Style := AFont.Style + [fsBold];  { Активный процесс }
end;

procedure TfmListFiles.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
