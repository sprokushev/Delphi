unit EdCatCen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, RxLookup, Db, OracleData;

type
  Tf_EdCatCen = class(TForm)
    e_CatCen: TEdit;
    Label1: TLabel;
    btOk: TBitBtn;
    e_CatCenName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ds_GroupDog: TDataSource;
    ds_Predpr: TDataSource;
    lc_GroupDog: TRxDBLookupCombo;
    Label4: TLabel;
    lc_Predpr: TRxDBLookupCombo;
    q_GroupDog: TOracleDataSet;
    q_Predpr: TOracleDataSet;
    btCancel: TBitBtn;
    Label5: TLabel;
    lc_Cat_Cen_Group: TRxDBLookupCombo;
    q_cat_cen_group: TOracleDataSet;
    ds_cat_cen_group: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_EdCatCen: Tf_EdCatCen;

implementation

uses main;

{$R *.DFM}

procedure Tf_EdCatCen.FormCreate(Sender: TObject);
begin
  q_GroupDog.Session:=f_main.ora_Session;
  q_GroupDog.Open;
  q_Predpr.Session:=f_main.ora_Session;
  q_Predpr.Open;
  q_cat_cen_group.Session:=f_main.ora_Session;
  q_cat_cen_group.Open;
end;

procedure Tf_EdCatCen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_GroupDog.Close;
  q_Predpr.Close;
  q_cat_cen_group.Close;
end;

end.
