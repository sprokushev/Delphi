unit Packets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYForm, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask, Placemnt, Buttons, FileCtrl, RXDBCtrl, Menus;

type
  TfmPackets = class(TfmAnyForm)
    paRight: TPanel;
    dnvGuid: TDBNavigator;
    pcGuid: TPageControl;
    tsTable: TTabSheet;
    tsRecord: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
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
    rxgrPackets: TRxDBGrid;
    DBCheckBox2: TDBCheckBox;
    FormPlacement1: TFormPlacement;
    bbClose: TBitBtn;
    procedure buCloseClick(Sender: TObject);
    procedure dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbPathClick(Sender: TObject);
    procedure sbPathFlagClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure rxgrPacketsDblClick(Sender: TObject);
    procedure rxgrPacketsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure bbCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPackets: TfmPackets;
  gUniKey:Integer;
implementation

uses Data;

{$R *.DFM}

procedure TfmPackets.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmPackets.dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbEdit:
      begin
        pcGuid.Pages[1].Caption:='Редактирование записи';
        pcGuid.ActivePage:=tsRecord;
      end;
    nbInsert:
      begin
        pcGuid.Pages[1].Caption:='Создание записи';
        pcGuid.ActivePage:=tsRecord;
      end;
    nbCancel, nbPost:
      begin
        pcGuid.Pages[1].Caption:='Запись';
        pcGuid.ActivePage:=tsTable;
      end;

  end;{case}
end;


procedure TfmPackets.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  with dmData do
  if (taParamPackets.State=dsInsert) or (taParamPackets.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taParamPackets.Post
    else taParamPackets.Cancel;
  pcGuid.Pages[1].Caption:='Запись';
end;

procedure TfmPackets.sbPathClick(Sender: TObject);
begin
  inherited;
  with dmData do
  begin
    if taParamPackets.FieldByName('TIPEVENT').AsInteger = 2 then  // EXE
      odModule.Filter := 'Исполняемые модули|*.BAT;*.COM;*.EXE|Все файлы|*.*'
    else
      odModule.Filter := 'Исполняемые файлы FoxPro|*.APP;*.FXP;*.PRG;*.SPX;*.SPR;*.EXE|Все файлы|*.*';
    odModule.FileName := taParamPackets.FieldByName('MODULE').AsString;
    if odModule.Execute then
    begin
      if not (taParamPackets.State = dsInsert) then taParamPackets.Edit;
      taParamPackets.FieldByName('MODULE').AsString := odModule.FileName;
    end;{if}
  end;
end;

procedure TfmPackets.sbPathFlagClick(Sender: TObject);
var
  pDir: string;
begin
  inherited;
  with dmData do
  begin
    pDir := taParamPackets.FieldByName('FLAGPATH').AsString;
    if SelectDirectory(pDir, [sdAllowCreate, sdPerformCreate, sdPrompt],0) then
    begin
      if not (taParamPackets.State = dsInsert) then taParamPackets.Edit;
      taParamPackets.FieldByName('FLAGPATH').AsString := pDir;
    end;{if}
  end;
end;

procedure TfmPackets.BitBtn1Click(Sender: TObject);
var
  pFlagPath, pFlagName : String;
  pFileFlagHandle : Integer;
begin
  inherited;
  with dmData.taParamPackets do
  begin
    pFlagPath := FieldByName('FLAGPATH').AsString;
    pFlagName := FieldByName('FLAGNAME').AsString;
    pFileFlagHandle := FileCreate(pFlagPath + '\' + pFlagName);
    FileClose(pFileFlagHandle);
  end;{with}
end;

procedure TfmPackets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmData do
  begin
    taParamLock.Close;
    taParamTimeEvn.Close;
    taParamPackets.Close;
  end;
end;

procedure TfmPackets.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmPackets.rxgrPacketsDblClick(Sender: TObject);
begin
  inherited;
  pcGuid.ActivePage:=tsRecord;
end;

procedure TfmPackets.rxgrPacketsGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  with dmData do
  if taParamPackets.FieldByName('RUN').AsBoolean = True then
     AFont.Style := AFont.Style + [fsBold];  { Активный процесс }
end;

procedure TfmPackets.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
