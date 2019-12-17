unit MO_FindPasport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxLookup, Mask, DBCtrlsEh, Oracle, DB, ActnList,
  XPStyleActnCtrls, ActnMan, OracleData, Grids, DBGridEh, ToolWin,
  ActnCtrls;

type
  Tf_FindPasp = class(TForm)
    ActionToolBar1: TActionToolBar;
    DBGrid1: TDBGridEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbSearchStr: TComboBox;
    Memo1: TMemo;
    q_Source: TOracleDataSet;
    amFindVagon: TActionManager;
    acStarSearch: TAction;
    acSelPosition: TAction;
    acClose: TAction;
    acToogleParentSQL: TAction;
    q_Structure: TOracleDataSet;
    ds_Source: TDataSource;
    pkgFor_temp_f: TOraclePackage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_FindPasp: Tf_FindPasp;

implementation

{$R *.dfm}

end.
