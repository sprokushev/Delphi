unit MemoEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, StdCtrls, Buttons,
  ComCtrls, ExtCtrls;

type
  Tf_MemoEdit = class(TForm)
    Panel2: TPanel;
    RichEdit: TRichEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EditDescription:string;
    EditValue:string;
  end;

var
  f_MemoEdit: Tf_MemoEdit;

implementation

uses main;

{$R *.dfm}

procedure Tf_MemoEdit.FormShow(Sender: TObject);
begin
  Caption:=EditDescription;
  RichEdit.Text:=EditValue;
end;

procedure Tf_MemoEdit.SpeedButton1Click(Sender: TObject);
begin
  EditValue:=RichEdit.Text;
  ModalResult:=mrOk;
end;

procedure Tf_MemoEdit.SpeedButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
