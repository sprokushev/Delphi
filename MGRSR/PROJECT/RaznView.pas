unit RaznView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, DBCtrls;

type
  TfmRaznView = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbPrint: TBitBtn;
    bbClose: TBitBtn;
    dbPRN: TDBMemo;
    seFontSize: TSpinEdit;
    procedure bbCloseClick(Sender: TObject);
    procedure seFontSizeChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRaznView: TfmRaznView;

implementation

uses Data, RaznLog;

{$R *.DFM}

procedure TfmRaznView.bbCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRaznView.seFontSizeChange(Sender: TObject);
begin
  dbPRN.Font.Size := seFontSize.Value;
end;

procedure TfmRaznView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fmRaznLog.sbView.Down := False;
end;

end.
