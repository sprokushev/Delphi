unit Events;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, DBCtrls, Db, DBTables, RXDBCtrl,
  StdCtrls, Placemnt, RXCtrls, RXLookup, Mask, ToolEdit, ComCtrls;

type
  TfmEvents = class(TForm)
    Panel1: TPanel;
    dnAdmin: TDBNavigator;
    Panel3: TPanel;
    Panel4: TPanel;
    rxdbEvents: TRxDBGrid;
    FormPlacement1: TFormPlacement;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel5: TPanel;
    Splitter2: TSplitter;
    slEvents: TStatusBar;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    cbFilter: TComboBox;
    procedure rxdbEventsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure rxdbEventsTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbFilterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dnAdminClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEvents: TfmEvents;

implementation

uses Info, Error, Data;

{$R *.DFM}

procedure TfmEvents.rxdbEventsGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmData.taViewEvents.FieldByName('ERROR').AsBoolean = True then
  begin
    AFont.Style:=AFont.Style+[fsBold];
    AFont.Color := clRed;  { Ошибочный процесс }
  end;
end;

procedure TfmEvents.rxdbEventsTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  with dmData do
  begin
    if Field.Name = 'NAME' then
      taViewEvents.IndexFieldNames := 'KOD_PACKET'
    else
      if Field.Name = 'DATE' then
        taViewEvents.IndexFieldNames := 'DATE'
      else
        if Field.Name = 'TIME_RUN' then
          taViewEvents.IndexFieldNames := 'TIME_RUN'
        else
          if Field.Name = 'TIME_B' then
            taViewEvents.IndexFieldNames := 'TIME_B'
          else
            if Field.Name = 'TIME_E' then
              taViewEvents.IndexFieldNames := 'TIME_E'
            else
              if Field.Name = 'ERROR' then
                taViewEvents.IndexFieldNames := 'ERROR'
              else
                taViewEvents.IndexFieldNames := '';
  end;
end;

procedure TfmEvents.FormCreate(Sender: TObject);
begin
  cbFilter.ItemIndex := 0;
end;

procedure TfmEvents.FormActivate(Sender: TObject);
begin
  dnAdminClick(Sender,nbRefresh);
  rxdbEvents.SetFocus;
end;

procedure TfmEvents.cbFilterChange(Sender: TObject);
var vBookMark: TBookMark;
begin
  with dmData do
  begin
    vBookmark := taViewEvents.GetBookmark;
    case cbFilter.ItemIndex of
    0: begin
         taViewEvents.Filter := '';
         taViewEvents.Filtered := False;
       end;
    1: begin
         taViewEvents.Filter := 'KOD_PACKET = '
            + IntToStr(taViewEvents.FieldByName('KOD_PACKET').AsInteger);
         taViewEvents.Filtered := True;
       end;
    2: begin
         taViewEvents.Filter := 'ERROR = True';
         taViewEvents.Filtered := True;
       end;
    end;{case}
    if cbFilter.ItemIndex <> 2 then taViewEvents.GotoBookmark(vBookmark);
  end; {with}
end;

procedure TfmEvents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with dmData do
  begin
    taViewEvents.Close;
    taViewPackets.Close;
  end;
end;

procedure TfmEvents.dnAdminClick(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
        dmData.taViewEvents.Refresh;
      end;
  end;{case}
end;

end.
