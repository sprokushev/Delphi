unit KlsListLinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, MdiForm, StdCtrls, ComCtrls,
  Buttons, ExtCtrls, ADODB, Grids, DBGrids, DBCtrls, Mask, DBCtrlsEh,
  DBLookupEh,DateUtils;

type
  Tf_KlsListLinks = class(Tf_MDIForm)
    ds_rep: TDataSource;
    q_kls: TOracleDataSet;
    Panel2: TPanel;
    ll_kls: TDBLookupListBox;
    q_klsID: TStringField;
    q_klsCAPTION: TStringField;
    q_klsTABLE_LINK: TStringField;
    q_klsTABLE_LINK_PK: TStringField;
    q_klsTABLE_LINK_TYPE: TStringField;
    q_klsTABLE_LINK_ONE_PK: TStringField;
    q_klsTABLE_ONE: TStringField;
    q_klsTABLE_LINK_TWO_PK: TStringField;
    q_klsTABLE_TWO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ll_klsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_KlsListLinks: Tf_KlsListLinks;

implementation

uses ForReport, OraToDbf, ForFiles, ForDB, ForTemp,SQLReport,
  KlsLinks, ForSystem;

{$R *.dfm}

procedure Tf_KlsListLinks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_kls.Close;
  Action:=caFree;
end;

procedure Tf_KlsListLinks.FormCreate(Sender: TObject);
begin
  q_kls.Close;
  q_kls.Open;
end;

procedure Tf_KlsListLinks.ll_klsDblClick(Sender: TObject);
begin
  inherited;
  If VarToStr(ll_kls.KeyValue)<>'' then
  Begin
    KlsLinks.LINK_ID:=ll_kls.KeyValue;
    klsLinks.AFormStyle:=fsMDIChild;
    with tf_KlsLinks.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
  end;
end;

end.
