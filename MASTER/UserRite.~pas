// ============= раздача прав пользовател€м ================
// ==================== VEV ================================
unit UserRite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, ToolEdit, RxLookup, OracleData, Oracle,
  Grids, DBGridEh, ExtCtrls, TB2Item, TB2Toolbar, TB2Dock, TB2ToolWindow,
  ActnList, ActnMan, XPStyleActnCtrls, ComCtrls, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

type
  Tf_UserRights = class(TForm)
    ora_Session: TOracleSession;
    q_Users: TOracleDataSet;
    ds_users: TDataSource;
    DBGridEh1: TDBGridEh;
    q_Rights: TOracleDataSet;
    ds_Rights: TDataSource;
    q_RightsID: TStringField;
    q_RightsDESCRIPT: TStringField;
    q_cmn: TOracleQuery;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    ActionManager1: TActionManager;
    acUserGrantsCopy: TAction;
    acUserGrantsDelete: TAction;
    q_RightsTree: TOracleDataSet;
    ds_RightsTree: TDataSource;
    q_RightsTreeID: TStringField;
    q_RightsTreeDESCRIPT: TStringField;
    q_RightsTreePARENT_ID: TStringField;
    q_RightsUSERNAME: TStringField;
    q_RightsCHANGEGRANT: TFloatField;
    q_RightsTreeIMAGE_INDEX: TFloatField;
    GroupBox1: TGroupBox;
    cbAllUsers: TCheckBox;
    le_Users: TRxLookupEdit;
    Splitter1: TSplitter;
    cbUserUNP: TCheckBox;
    cbUserSNP: TCheckBox;
    acUserGrantsSave: TAction;
    TBItem3: TTBItem;
    ehRights: TDBGridEh;
    mteRights: TMemTableEh;
    dsdRights: TDataSetDriverEh;
    mteRightsID: TStringField;
    mteRightsDESCRIPT: TStringField;
    mteRightsPARENT_ID: TStringField;
    mteRightsIMAGE_INDEX: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure acUserGrantsCopyExecute(Sender: TObject);
    procedure acUserGrantsDeleteExecute(Sender: TObject);
    procedure q_RightsBeforeOpen(DataSet: TDataSet);
    procedure le_UsersChange(Sender: TObject);
    procedure trRights234Change(Sender: TObject; Node: TTreeNode);
    procedure cbAllUsersClick(Sender: TObject);
    procedure trRights234CreateNode(Sender: TObject; Node: TTreeNode;
      DataSet: TDataSet);
    procedure acUserGrantsSaveExecute(Sender: TObject);
    procedure DBGridEh2Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mteRightsAfterScroll(DataSet: TDataSet);
    procedure ehRightsCellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_UserRights: Tf_UserRights;

implementation
uses ForSystem, ForDB, main, Math;
{$R *.dfm}

procedure Tf_UserRights.FormCreate(Sender: TObject);
begin
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);
  le_Users.Text:=F_ForSystem.GetUserName(True);
  q_RightsTree.Open;
{  mteRights.TreeList.Active := True;
  mteRights.TreeList.KeyFieldName := 'ID';
  mteRights.TreeList.RefParentFieldName := 'PARENT_ID';   }
  mteRights.Open;
  q_Users.Open;
  q_Rights.Open;
end;

procedure Tf_UserRights.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_Users.Close;
  q_Rights.Close;
  q_RightsTree.Close;
  ora_Session.LogOff;
  Action:=caFree;
  if le_Users.Text=F_ForSystem.GetUserName(True) then
    f_db.SetUserGrants(f_main.acManagerMain);
end;

procedure Tf_UserRights.DBGridEh1DblClick(Sender: TObject);
begin
  with q_cmn do
    begin
      SQL.Clear;
      if q_RightsChangeGrant.Value=1 then
        SQL.Add('DELETE FROM User_Rights WHERE UserName='''+q_RightsUSERNAME.Value+
          ''' AND GivenRight='''+q_RightsID.Value+'''')
      else
        SQL.Add('INSERT INTO User_Rights (UserName,GivenRight) VALUES ('''+le_Users.Text+
          ''','''+q_RightsID.Value+''')');
      Execute;
    end;
  ora_Session.Commit;
  f_db.ReQuery(q_Rights,True);
end;

procedure Tf_UserRights.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  f_db.SortInGrid(q_Rights,5,DBGridEh1);
end;

procedure Tf_UserRights.acUserGrantsCopyExecute(Sender: TObject);
var
  S:String;
begin
  S:=InputBox(' опирование пользовател€','Ќовый пользователь','');
  if S<>'' then
  begin
    S:=UpperCase(S);
    q_cmn.SQL.clear;
    q_cmn.SQL.Add('DELETE FROM USER_RIGHTS WHERE USERNAME='''+S+'''');
    q_cmn.Execute;
    q_cmn.SQL.clear;
    q_cmn.SQL.Add('INSERT INTO USER_RIGHTS SELECT givenright,'''+S+''' AS username FROM user_rights WHERE USERNAME='''+le_Users.Text+'''');
    q_cmn.Execute;
    q_cmn.Session.Commit;
    le_UsersChange(Self);
  end;
end;

procedure Tf_UserRights.acUserGrantsDeleteExecute(Sender: TObject);
begin
  if MessageDlg('¬ы действительно хотите удалить права пользовател€ '+le_Users.Text+'?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
    begin
      q_cmn.SQL.clear;
      q_cmn.SQL.Add('DELETE FROM USER_RIGHTS WHERE USERNAME='''+le_Users.Text+'''');
      q_cmn.Execute;
      q_cmn.SQL.clear;
      q_cmn.SQL.Add('DELETE FROM APP_USERS WHERE NETNAME='''+le_Users.Text+'''');
      q_cmn.Execute;
      q_cmn.Session.Commit;
      le_UsersChange(Self);
    end;
end;

procedure Tf_UserRights.q_RightsBeforeOpen(DataSet: TDataSet);
begin
//  if mteRights.fieldbyname('parent_id').asString<>'None' then
//    q_Rights.SQL[4]:='and id in (select id FROM kls_rights connect by prior id=parent_id start with id=(SELECT id FROM kls_rights where descript='''+mteRights.fieldbyname('DESCRIPT').asString+'''))';
    q_Rights.SQL[4]:='and parent_id = (SELECT id FROM kls_rights where descript='''+mteRights.fieldbyname('DESCRIPT').asString+''')';
  if  cbAllUsers.Checked then
    q_Rights.SQL[2]:='(select * from USER_RIGHTS) UR '
  else
    q_Rights.SQL[2]:='(select * from USER_RIGHTS where username='''+le_Users.Text+''') UR ';
end;

procedure Tf_UserRights.le_UsersChange(Sender: TObject);
begin
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('SELECT snp,unp FROM app_users WHERE netname='''+le_Users.Text+'''');
  q_cmn.Execute;
  if not q_cmn.Eof then
    begin
      cbUserSNP.Checked:=q_cmn.Field('SNP')=1;
      cbUserUNP.Checked:=q_cmn.Field('UNP')=1;
    end
  else
    begin
      cbUserUNP.State:=cbGrayed;
      cbUserSNP.State:=cbGrayed;
    end;
  q_cmn.Close;
  f_db.ReQuery(q_Rights,False);
end;

procedure Tf_UserRights.trRights234Change(Sender: TObject; Node: TTreeNode);
begin
  f_db.ReQuery(q_Rights,True);
end;

procedure Tf_UserRights.cbAllUsersClick(Sender: TObject);
begin
  le_Users.Enabled:=not cbAllUsers.Checked;
  le_Users.Visible:=not cbAllUsers.Checked;
  cbUserUNP.Enabled:=not cbAllUsers.Checked;
  cbUserUNP.Visible:=not cbAllUsers.Checked;
  cbUserSNP.Enabled:=not cbAllUsers.Checked;
  cbUserSNP.Visible:=not cbAllUsers.Checked;
  f_db.ReQuery(q_Rights,True);
end;

procedure Tf_UserRights.trRights234CreateNode(Sender: TObject;
  Node: TTreeNode; DataSet: TDataSet);
begin
  Node.ImageIndex:=DataSet.FieldByName('image_index').AsInteger;
  Node.SelectedIndex:=DataSet.FieldByName('image_index').AsInteger;
end;

procedure Tf_UserRights.acUserGrantsSaveExecute(Sender: TObject);
begin
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('INSERT INTO app_users (name,netname) ');
  q_cmn.SQL.Add('SELECT '''+le_Users.Text+''','''+le_Users.Text+''' from dual minus ');
  q_cmn.SQL.Add('SELECT netname,netname from app_users WHERE netname='''+le_Users.Text+'''');
  q_cmn.Execute;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('UPDATE app_users SET snp='+IntToStr(IfThen(cbUserSNP.Checked,1,0))+',');
  q_cmn.SQL.Add('unp='+IntToStr(IfThen(cbUserUNP.Checked,1,0))+' WHERE netname='''+le_Users.Text+'''');
  q_cmn.Execute;
  q_cmn.Session.Commit;
end;

procedure Tf_UserRights.DBGridEh2Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
   params.ImageIndex:=mteRights.fieldbyname('image_index').asInteger;
end;

procedure Tf_UserRights.mteRightsAfterScroll(DataSet: TDataSet);
begin
f_db.ReQuery(q_Rights,True);
end;

procedure Tf_UserRights.ehRightsCellClick(Column: TColumnEh);
begin
f_db.ReQuery(q_Rights,True);
end;

end.
