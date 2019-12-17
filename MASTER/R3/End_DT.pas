unit End_DT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ToolEdit, RXDBCtrl, Mask, DBCtrls;

type
  Tf_EndDateFOX2R3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ds_End_DT: TDataSource;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    t_End_DT: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_EndDateFOX2R3: Tf_EndDateFOX2R3;

implementation

{$R *.dfm}

procedure Tf_EndDateFOX2R3.FormCreate(Sender: TObject);
begin
  t_End_DT.Open;
end;

procedure Tf_EndDateFOX2R3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  t_End_DT.Close;
end;

procedure Tf_EndDateFOX2R3.BitBtn1Click(Sender: TObject);
begin
  try
    if t_End_DT.State<>dsBrowse then t_End_DT.Post;
    ModalResult:=mrOk;
  except
  end;
end;

procedure Tf_EndDateFOX2R3.BitBtn2Click(Sender: TObject);
begin
  t_End_DT.Cancel;
end;

end.
