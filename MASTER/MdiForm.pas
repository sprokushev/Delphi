// ============= MDI форма по умолчанию ====================
// ===== объ€вл€ем наследников от нее (TF_MDIForm) =========
// ==================== VEV ================================
unit MdiForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item;

type
  Tf_MDIForm = class(TForm)
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ATBItem:TTBItem;
    procedure AToolButtonClick(Sender: TObject);
end;

var
  f_MDIForm: Tf_MDIForm;

implementation
uses main;
{$R *.dfm}

constructor Tf_MDIForm.Create(AOwner: TComponent);
begin
  inherited Create(f_main);
end;

destructor TF_MDIForm.Destroy;
begin
  inherited Destroy;
end;

procedure Tf_MDIForm.AToolButtonClick(Sender: TObject);
begin
end;

procedure Tf_MDIForm.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle,GWL_EXSTYLE,GetWindowLong(Handle,GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

end.
