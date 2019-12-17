unit dlgWindow;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CurrEdit, Mask, ToolEdit, MdiForm;
type
  TfrmDlgWindow = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDB: TDateEdit;
    edPrice: TRxCalcEdit;
    edVes: TRxCalcEdit;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edKol: TRxCalcEdit;
    edSpeedVes: TRxCalcEdit;
    edSpeedKol: TRxCalcEdit;
    procedure edVesChange(Sender: TObject);
    procedure edSpeedVesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vNORMOTGR:double;
  end;

//var
//  frmDlgWindow: TfrmDlgWindow;

implementation

{$R *.dfm}

procedure TfrmDlgWindow.edVesChange(Sender: TObject);
begin
    if (edVes.value>0) and (vNORMOTGR>0) then
    Begin
      if edVes.value<vNORMOTGR then
        edKol.value:=1
      else
        edKol.value:=Round(edVes.value/vNORMOTGR);
    end;
end;

procedure TfrmDlgWindow.edSpeedVesChange(Sender: TObject);
begin
    if (edSpeedVes.value>0) and (vNORMOTGR>0) then
    Begin
      if edSpeedVes.value<vNORMOTGR then
        edSpeedKol.value:=1
      else
        edSpeedKol.value:=Round(edSpeedVes.value/vNORMOTGR);
    end;
end;

procedure TfrmDlgWindow.FormActivate(Sender: TObject);
begin
  edVesChange(Sender);
  edSpeedVesChange(Sender);
end;

end.
