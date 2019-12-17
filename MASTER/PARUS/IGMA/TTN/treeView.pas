unit treeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  Tf_treeForm = class(TForm)
    TreeView1: TTreeView;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    nameNode: string;
    rn: integer;
    { Public declarations }
  end;

var
  f_treeForm: Tf_treeForm;

implementation

{$R *.dfm}

procedure Tf_treeForm.BitBtn1Click(Sender: TObject);
var
n:  TTreeNode;
begin
  n := treeView1.Selected;
  nameNode := n.Text;
  rn := integer(n.Data);
end;

end.
