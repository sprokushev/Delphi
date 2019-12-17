unit LogTask;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AnyForm, StdCtrls, DBCtrls, Db, Grids, DBGrids, RXDBCtrl, DBTables,
  ExtCtrls, Buttons, Placemnt;

type
  TfmLogTask = class(TfmAnyForm)
    RxDBGrid1: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    bbClose: TBitBtn;
    FormPlacement1: TFormPlacement;
    DBMemo1: TDBMemo;
    btRefresh: TSpeedButton;
    procedure bbCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogTask: TfmLogTask;

implementation

uses RaznView, Data;

{$R *.DFM}

procedure TfmLogTask.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmLogTask.FormActivate(Sender: TObject);
begin
  inherited;
  btRefreshClick(Sender);
  RxDBGrid1.SetFocus;
end;

procedure TfmLogTask.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmData.qViewLogTask.FieldByName('ERROR').AsBoolean = True then
  begin
    AFont.Style:=AFont.Style+[fsBold];
    AFont.Color := clRed;  { Ошибочный процесс }
  end;
end;

procedure TfmLogTask.btRefreshClick(Sender: TObject);
begin
  inherited;
  dmData.qViewLogTask.Close;
  dmData.qViewLogTask.Open;
  dmData.qViewLogTask.Last;
end;

end.
