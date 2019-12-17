unit RaznLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AnyForm, StdCtrls, DBCtrls, Db, Grids, DBGrids, RXDBCtrl, DBTables,
  ExtCtrls, Buttons, Placemnt;

type
  TfmRaznLog = class(TfmAnyForm)
    RxDBGrid1: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    bbClose: TBitBtn;
    rbGD: TRadioButton;
    rbGDE: TRadioButton;
    rbW: TRadioButton;
    rbWE: TRadioButton;
    rbS: TRadioButton;
    rbT: TRadioButton;
    sbView: TSpeedButton;
    FormPlacement1: TFormPlacement;
    procedure bbCloseClick(Sender: TObject);
    procedure sbViewClick(Sender: TObject);
    procedure rbGDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRaznLog: TfmRaznLog;

implementation

uses RaznView, Data;

{$R *.DFM}

procedure TfmRaznLog.bbCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmRaznLog.sbViewClick(Sender: TObject);
begin
  inherited;
  if sbView.Down then fmRaznView.Show
  else fmRaznView.Close;
end;

procedure TfmRaznLog.rbGDClick(Sender: TObject);
begin
 inherited;
 with fmRaznView do begin
  if rbGD.Checked then begin
    dbPRN.DataField := 'GD_PRN';
    Caption := 'Просмотр. Разнарядка по ж/д (Россия)'
  end;
  if rbGDE.Checked then begin
    dbPRN.DataField := 'GDE_PRN';
    Caption := 'Просмотр. Разнарядка по ж/д (Экспорт)'
  end;
  if rbW.Checked then begin
    fmRaznView.dbPRN.DataField := 'W_PRN';
    Caption := 'Просмотр. Разнарядка по воде (Россия)'
  end;
  if rbWE.Checked then begin
    fmRaznView.dbPRN.DataField := 'WE_PRN';
    Caption := 'Просмотр. Разнарядка по воде (Экспорт)'
  end;
  if rbS.Checked then begin
    fmRaznView.dbPRN.DataField := 'S_PRN';
    Caption := 'Просмотр. Разнарядка на самовывоз'
  end;
  if rbT.Checked then begin
    fmRaznView.dbPRN.DataField := 'T_PRN';
    Caption := 'Просмотр. Разнарядка по трубопроводу'
  end;{if}
 end;{with}
end;

procedure TfmRaznLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  fmRaznView.Close;
end;

procedure TfmRaznLog.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if (Field.FieldName = 'CNTREC0')
     or (Field.FieldName = 'CIST0')
     or (Field.FieldName = 'TONN0') then
     AFont.Style := AFont.Style + [fsBold]
end;

procedure TfmRaznLog.FormActivate(Sender: TObject);
begin
  inherited;
  DBNavigator1Click(Sender,nbRefresh);
  RxDBGrid1.SetFocus;
end;

procedure TfmRaznLog.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  case Button of
    nbRefresh:
      begin
        dmData.taRaznLog.Refresh;
      end;
  end;{case}
end;

end.
