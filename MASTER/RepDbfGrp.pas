unit RepDbfGrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tf_Rep_Dbf_Grp = class(TForm)
    Label1: TLabel;
    Grp1: TComboBox;
    Grp2: TComboBox;
    Grp3: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_Rep_Dbf_Grp: Tf_Rep_Dbf_Grp;

implementation

{$R *.dfm}

end.
