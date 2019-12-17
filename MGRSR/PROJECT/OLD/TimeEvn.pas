unit TimeEvn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ANYFORM, DBCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, Db,
  DBTables, Mask, Placemnt, Buttons;

type
  TfmTimeEvn = class(TfmAnyForm)
    paRight: TPanel;
    dnvGuid: TDBNavigator;
    pcGuid: TPageControl;
    tsTable: TTabSheet;
    tsRecord: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    FormPlacement1: TFormPlacement;
    bbClose: TBitBtn;
    procedure buCloseClick(Sender: TObject);
    procedure dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTimeEvn: TfmTimeEvn;
  gUniKey:Integer;
implementation

uses Data;

{$R *.DFM}

procedure TfmTimeEvn.buCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmTimeEvn.dnvGuidClick(Sender: TObject; Button: TNavigateBtn);
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
        dmData.taParamTimeEvn.Insert;
      end;
    nbCancel, nbPost:
      begin
        pcGuid.Pages[1].Caption:='Запись';
        pcGuid.ActivePage:=tsTable;
      end;

  end;{case}
end;


procedure TfmTimeEvn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  with dmData do
  if (taParamTimeEvn.State=dsInsert) or (taParamTimeEvn.State=dsEdit) then
    if MessageDlg('Сохранить запись ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      taParamTimeEvn.Post
    else taParamTimeEvn.Cancel;
  pcGuid.Pages[1].Caption:='Запись';
end;

procedure TfmTimeEvn.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmTimeEvn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dmData do
  begin
    taParamTimeEvn.Close;
    taTEPackets.Close;
    taTELock.Close;
  end;
end;

end.
