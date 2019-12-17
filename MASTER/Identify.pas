unit Identify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, RxLookup, StdCtrls, Buttons;

type
  Tf_identify = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    combo_user: TRxDBLookupCombo;
    q_ApplUsers: TOracleDataSet;
    ds_ApplUsers: TDataSource;
    q_ApplUsersID: TFloatField;
    q_ApplUsersNAME: TStringField;
    q_ApplUsersPASSW: TStringField;
    q_ApplUsersNETNAME: TStringField;
    ed_passw: TEdit;
    bt_ok: TBitBtn;
    q_ApplUsersSNP: TIntegerField;
    q_ApplUsersUNP: TIntegerField;
    q_ApplUsersIS_ADMIN: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure q_ApplUsersBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_identify: Tf_identify;

implementation

uses ForDB,ForSystem, main;

{$R *.dfm}

procedure Tf_identify.FormCreate(Sender: TObject);
begin
  q_ApplUsers.Session:=f_main.ora_Session;
  f_db.ReQuery(q_ApplUsers,false);
  q_ApplUsers.Locate('ID',f_main.UserId,[]);
  if q_ApplUsers.eof then q_ApplUsers.First;
  combo_user.Value:=q_ApplUsers.FieldByName('id').AsString;
end;

procedure Tf_identify.bt_okClick(Sender: TObject);
begin
  if (combo_user.Value<>'') AND (Trim(ed_passw.Text)=q_ApplUsers.FieldByName('passw').AsString) then
  Begin
    ModalResult:=mrOk;
  End
  Else
  Begin
    Application.MessageBox('Выберите пользователя и введите правильно пароль!','Внимание!',MB_OK);
    ed_passw.SelectAll;
    ed_passw.SetFocus;
  End;
end;

procedure Tf_identify.q_ApplUsersBeforeOpen(DataSet: TDataSet);
begin
  q_ApplUsers.SetVariable('NETNAME',F_ForSystem.GetUserName(True));
end;

procedure Tf_identify.FormActivate(Sender: TObject);
begin
  ed_passw.SelectAll;
  ed_passw.SetFocus;
end;

end.
