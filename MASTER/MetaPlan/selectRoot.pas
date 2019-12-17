unit selectRoot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, DB, ADODB,
  RxLookup;

type
  TSelectRootDlg = class(TForm)
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    RxDBLookupList1: TRxDBLookupList;
    Button1: TButton;
    ADOTable1name: TStringField;
    ADOTable1organization_id: TIntegerField;
    ADOTable1master_id: TIntegerField;
    ADOTable1hierarchy_id: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectRootDlg: TSelectRootDlg;

implementation

{$R *.dfm}

procedure TSelectRootDlg.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TSelectRootDlg.FormCreate(Sender: TObject);
begin
  AdoTable1.Open;
end;

end.
