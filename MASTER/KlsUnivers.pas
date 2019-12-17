unit KlsUnivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, MdiForm, StdCtrls, ComCtrls,
  Buttons, ExtCtrls, ADODB, Grids, DBGrids, DBCtrls, Mask, DBCtrlsEh,
  DBLookupEh,DateUtils;

type
  Tf_KlsUnivers = class(Tf_MDIForm)
    ds_rep: TDataSource;
    q_kls: TOracleDataSet;
    Panel2: TPanel;
    ll_kls: TDBLookupListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ll_klsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_KlsUnivers: Tf_KlsUnivers;

implementation

uses ForReport, OraToDbf, ForFiles, ForDB, ForTemp,SQLReport,
  KlsMisc2, ForSystem;

{$R *.dfm}

procedure Tf_KlsUnivers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_kls.Close;
  Action:=caFree;
end;

procedure Tf_KlsUnivers.FormCreate(Sender: TObject);
begin
  q_kls.Close;
  q_kls.SQL[4]:=' AND B.Username='''+F_ForSystem.GetUserName(True)+'''';
  q_kls.Open;
end;

procedure Tf_KlsUnivers.ll_klsDblClick(Sender: TObject);
begin
  inherited;
  If VarToStr(ll_kls.KeyValue)<>'' then
  Begin
    KlsMisc2.SetKLSParam(ll_kls.KeyValue,'EDIT',fsMDIChild);
    with tf_KlsMisc.Create(Self) do
    begin
      FormStyle:=fsMDIChild;
    end;
  end;
end;

end.
