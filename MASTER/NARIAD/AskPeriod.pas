unit AskPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit;

type
  TF_AskPeriod = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    e_FromDate: TDateEdit;
    e_ToDate: TDateEdit;
    bt_Ok: TBitBtn;
    bt_Cancel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bt_OkClick(Sender: TObject);
    procedure bt_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FromDate:TDateTime;
    ToDate:TDateTime;
  end;

var
  F_AskPeriod: TF_AskPeriod;

implementation

{$R *.dfm}

procedure TF_AskPeriod.FormActivate(Sender: TObject);
begin
  e_FromDate.Date:=FromDate;
  e_ToDate.Date:=ToDate;
end;

procedure TF_AskPeriod.bt_OkClick(Sender: TObject);
begin
  FromDate:=e_FromDate.Date;
  ToDate:=e_ToDate.Date;
end;

procedure TF_AskPeriod.bt_CancelClick(Sender: TObject);
begin
  e_FromDate.Date:=FromDate;
  e_ToDate.Date:=ToDate;
end;

end.
