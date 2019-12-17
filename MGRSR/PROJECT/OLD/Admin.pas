unit Admin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, DBCtrls, Db, DBTables, RXDBCtrl,
  StdCtrls, Placemnt, RXCtrls, RXLookup, Mask, ToolEdit;

type
  TfmAdmin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    rxdbProtokol: TRxDBGrid;
    dnAdmin: TDBNavigator;
    sbError: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    rxdbEvents: TRxDBGrid;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    FormPlacement1: TFormPlacement;
    sbInfo: TSpeedButton;
    cbFilter: TComboBox;
    Label5: TLabel;
    cbMaster: TCheckBox;
    DBStatusLabel1: TDBStatusLabel;
    procedure sbErrorClick(Sender: TObject);
    procedure rxdbProtokolGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rxdbEventsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rxdbProtokolEnter(Sender: TObject);
    procedure rxdbEventsEnter(Sender: TObject);
    procedure rxdbEventsTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure dnAdminClick(Sender: TObject; Button: TNavigateBtn);
    procedure sbInfoClick(Sender: TObject);
    procedure cbFilterChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbMasterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAdmin: TfmAdmin;

implementation

uses Info, Error, Data;

{$R *.DFM}

procedure TfmAdmin.sbErrorClick(Sender: TObject);
begin
if sbError.Down then fmError.Show
else fmError.Close;
end;

procedure TfmAdmin.sbInfoClick(Sender: TObject);
begin
if sbInfo.Down then fmInfo.Show
else fmInfo.Close;
end;

procedure TfmAdmin.rxdbProtokolGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
if dmData.taAdminProtokol.FieldByName('ACTIVE').AsBoolean = True then
   Background := clLime  { активная сессия менеджера }
end;

procedure TfmAdmin.rxdbEventsGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
if dmData.taAdminEvents.FieldByName('ERROR').AsBoolean = True then
  Background := clRed;  { Ошибочный процесс }
end;

procedure TfmAdmin.rxdbProtokolEnter(Sender: TObject);
begin
  dnAdmin.DataSource := dmData.dsAdminProtokol;
end;

procedure TfmAdmin.rxdbEventsEnter(Sender: TObject);
begin
  dnAdmin.DataSource := dmData.dsAdminEvents;
end;

procedure TfmAdmin.rxdbEventsTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  with dmData do
  begin
    if Field.Name = 'NAME' then
      taAdminEvents.IndexFieldNames := 'KOD_PACKET'
    else
      if Field.Name = 'DATE' then
        taAdminEvents.IndexFieldNames := 'DATE'
      else
        if Field.Name = 'TIME_RUN' then
          taAdminEvents.IndexFieldNames := 'TIME_RUN'
        else
          if Field.Name = 'TIME_B' then
            taAdminEvents.IndexFieldNames := 'TIME_B'
          else
            if Field.Name = 'TIME_E' then
              taAdminEvents.IndexFieldNames := 'TIME_E'
            else
              if Field.Name = 'ERROR' then
                taAdminEvents.IndexFieldNames := 'ERROR'
              else
                taAdminEvents.IndexFieldNames := '';
  end;
end;


procedure TfmAdmin.dnAdminClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbRefresh:
      begin
        dmData.taAdminProtokol.Refresh;
        dmData.taAdminEvents.Refresh;
      end;
  end;{case}
end;

procedure TfmAdmin.cbFilterChange(Sender: TObject);
var
   vBookMark: TBookMark;
begin
  with dmData do
  begin
    vBookmark := taAdminProtokol.GetBookmark;
    case cbFilter.ItemIndex of
    0: begin
        taAdminProtokol.Filter := '';
        taAdminProtokol.Filtered := False;
       end;
    1: begin
        taAdminProtokol.Filter := 'ACTIVE = True';
        taAdminProtokol.Filtered := True;
       end;
    2: begin
        taAdminProtokol.Filter := 'MANAGER = True';
        taAdminProtokol.Filtered := True;
       end;
    end;{case}
    if cbFilter.ItemIndex = 0 then taAdminProtokol.GotoBookmark(vBookmark);
  end;
end;

procedure TfmAdmin.FormActivate(Sender: TObject);
begin
  dnAdminClick(Sender,nbRefresh);
  rxdbEvents.SetFocus;
end;

procedure TfmAdmin.cbMasterClick(Sender: TObject);
begin
  with dmData do
  begin
    if cbMaster.Checked then begin
      taAdminEvents.MasterSource := dmData.dsAdminProtokol;
      taAdminEvents.MasterFields := 'KOD_SESS';
    end
    else
    begin
      taAdminEvents.MasterSource := Nil;
      taAdminEvents.MasterFields := '';
    end;{if}
  end;
end;

procedure TfmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmData do
  begin
    taAdminEvents.Close;
    taAdminProtokol.Close;
    taAdminPackets.Close;
  end;
end;

procedure TfmAdmin.FormCreate(Sender: TObject);
begin
  cbFilter.ItemIndex := 0;  // Фильтр отсутствует
end;

end.
