unit About;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, RXCtrls, ExtCtrls, Animate;

type
  TfmAbout = class(TForm)
    SecretPanel1: TSecretPanel;
    AppIcon: TImage;
    WebLabel: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    OkBtn: TBitBtn;
    Label3: TLabel;
    Bevel1: TBevel;
    lbVersion: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AppIconDblClick(Sender: TObject);
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//procedure GoWebSite;

var
  fmAbout: TfmAbout;

implementation

uses RxConst, ShellAPI;

{$R *.DFM}

procedure GoWebSite;
begin
  ShellExecute(Application.Handle, nil, 'http://rx.demo.ru', nil,
    nil, SW_SHOWNOACTIVATE);
end;

{ TfmAbout }

procedure TfmAbout.FormCreate(Sender: TObject);
begin
(*  pVersion.Create(Application.ExeName);
  if pVersion.Valid then
  begin
    lbVersion.Caption := pVersion.FileVersion;
  end;{if}
  pVersion.Free;
*)  
  AppIcon.Picture.Icon := Application.Icon;
  AppIcon.Cursor := crHand;
end;

procedure TfmAbout.AppIconDblClick(Sender: TObject);
begin
  SecretPanel1.Active := True;
end;

procedure TfmAbout.SecretPanel1DblClick(Sender: TObject);
begin
  SecretPanel1.Active := False;
end;

procedure TfmAbout.LabelMouseEnter(Sender: TObject);
begin
  with Sender as TRxLabel do begin
    if MouseInControl then begin
      Font.Color := clHighlight;
    end
    else begin
      Font.Color := clWindowText;
    end;
  end;
end;

procedure TfmAbout.LabelClick(Sender: TObject);
begin
  //GoWebSite;
  MessageDlg('Sorry ! My Webpage not available.', mtInformation,
      [mbOk], 0);
end;


end.
