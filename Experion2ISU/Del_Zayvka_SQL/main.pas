unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOSelectDoc: TADOQuery;
    ADODeleteDoc: TADOQuery;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 ADODeleteDoc.Parameters.ParamByName('pId').Value:=ADOSelectDoc.FieldByName('nn').AsFloat;
 ADODeleteDoc.ExecSQL;
 ADOSelectDoc.Close;
 ADOSelectDoc.Open;
end;

end.
