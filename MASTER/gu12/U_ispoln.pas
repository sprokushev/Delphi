unit U_ispoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dateutils;

type
  Tf_ispoln = class(TForm)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_ispoln: Tf_ispoln;

implementation

{$R *.dfm}

uses u_glob_var, ForTemp, main, ShellApi;

procedure Tf_ispoln.FormActivate(Sender: TObject);
begin
    
    TempVari.SetVariDate('DATE_ISP1',m_date_isp1);
    TempVari.SetVariDate('DATE_ISP2',m_date_isp2);

end;

end.
