unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Oracle, ImgList;

type
  Tf_main = class(TForm)
    BitBtn1: TBitBtn;
    ora_Session: TOracleSession;
    pkg_Init: TOraclePackage;
    img_Common: TImageList;
    procedure ora_SessionAfterLogOn(Sender: TOracleSession);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ApplUserSNP:boolean; // Пользователь СНП
    ApplUserUNP:boolean; // Пользователь УНП
  end;

var
  f_main: Tf_main;

implementation

uses U_zayav;

{$R *.dfm}

procedure Tf_main.ora_SessionAfterLogOn(Sender: TOracleSession);
begin
  pkg_init.Session:=Sender;
  pkg_Init.CallProcedure('Init_MASTER',[]);
  ApplUserSNP:=(pkg_init.CallIntegerFunction('AppUserSNP',[])=1);
  ApplUserUNP:=(pkg_init.CallIntegerFunction('AppUserUNP',[])=1);
end;

procedure Tf_main.BitBtn1Click(Sender: TObject);
begin
  f_zayav:=TF_Zayav.Create(Self);
  with f_zayav do
  Begin
    ShowModal;
    Free;
  end;
end;

procedure Tf_main.FormCreate(Sender: TObject);
begin
  ora_Session.LogOn;
end;

end.
