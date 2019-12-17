unit tarif_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, main, MdiForm, DB, OracleData, Oracle, StdCtrls;

type
  Tf_MDIForm1 = class(Tf_MDIForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OQ_: TOracleQuery;
    DS_postav: TDataSource;
    ODS_postav: TOracleDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_MDIForm1: Tf_MDIForm1;

implementation

{$R *.dfm}

end.
