unit ReplDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,ExtCtrls, ActnList, XPStyleActnCtrls, ActnMan, TB2Item,
  TB2Dock, TB2Toolbar, Grids, DBGridEh, DB, OracleData, MdiForm;

type
  Tf_ReplDep = class(TForm)
    ActionManager1: TActionManager;
    acReplDepAdd: TAction;
    acReplDepRefresh: TAction;
    acReplDepEdit: TAction;
    acReplDepDel: TAction;
    acReplDepPost: TAction;
    q_ReplDep: TOracleDataSet;
    ds_ReplDep: TDataSource;
    q_ReplDepID: TFloatField;
    q_ReplDepSORTBY: TFloatField;
    q_ReplDepREPL_PARENT: TFloatField;
    q_ReplDepREPL_CHILD: TFloatField;
    gridReplDep: TDBGridEh;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem1: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem9: TTBItem;
    TBItem2: TTBItem;
    q_Repl: TOracleDataSet;
    ds_Repl: TDataSource;
    q_ReplID: TFloatField;
    q_ReplNAME: TStringField;
    q_ReplTAG: TStringField;
    q_ReplIS_ACTIVE: TIntegerField;
    q_ReplIS_TRACKING: TIntegerField;
    q_ReplLASTDATE: TDateTimeField;
    q_ReplLASTTIME: TStringField;
    q_ReplLASTSIZE: TFloatField;
    q_ReplCHECK_MODE_NAME: TStringField;
    q_ReplDepCHILD_TAG: TStringField;
    q_ReplDepCHILD_NAME: TStringField;
    q_ReplDepIS_ACTIVE: TIntegerField;
    q_ReplDepIS_TRACKING: TIntegerField;
    q_ReplDepLASTDATE: TDateTimeField;
    q_ReplDepLASTTIME: TStringField;
    q_ReplDepLASTSIZE: TFloatField;
    q_ReplDepCHECK_MODE_NAME: TStringField;
    q_ReplDepCnt: TOracleDataSet;
    ds_ReplDepCnt: TDataSource;
    q_ReplDepCntREPL_PARENT: TFloatField;
    q_ReplDepCntCHILD_CNT: TFloatField;
    q_ReplDepCHILD_CNT: TIntegerField;
    procedure acReplDepAddExecute(Sender: TObject);
    procedure q_ReplDepBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure q_ReplDepBeforeOpen(DataSet: TDataSet);
    procedure acReplDepRefreshExecute(Sender: TObject);
    procedure acReplDepDelExecute(Sender: TObject);
    procedure acReplDepPostExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridRSColumns1EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure acReplDepEditExecute(Sender: TObject);
    procedure q_ReplDepAfterInsert(DataSet: TDataSet);
    procedure q_ReplDepBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ParentId:integer;
    ParentName:string;
  end;

var
  f_ReplDep: Tf_ReplDep;

implementation

uses KlsMisc2, ForDB, main;

{$R *.dfm}

procedure Tf_ReplDep.acReplDepAddExecute(Sender: TObject);
begin
  if q_ReplDep.State<>dsBrowse then q_ReplDep.Post;
  q_ReplDep.Append;
end;

procedure Tf_ReplDep.q_ReplDepBeforePost(DataSet: TDataSet);
begin
  inherited;
  q_ReplDepREPL_PARENT.AsInteger:=ParentID;
end;

procedure Tf_ReplDep.FormCreate(Sender: TObject);
begin
  inherited;
  q_ReplDep.Session:=f_main.ora_Session;
  q_Repl.Session:=f_main.ora_Session;
  q_Repl.Open;
end;

procedure Tf_ReplDep.q_ReplDepBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_ReplDep.SQL[4]:='WHERE REPL_DEPENDENCE.REPL_PARENT='+IntToStr(ParentId);
end;

procedure Tf_ReplDep.acReplDepRefreshExecute(Sender: TObject);
begin
  inherited;
  f_db.ReQuery(q_ReplDep,true);
end;

procedure Tf_ReplDep.acReplDepDelExecute(Sender: TObject);
begin
  inherited;
  if q_ReplDep.State<>dsBrowse then q_ReplDep.Post;
  q_ReplDep.Delete;
end;

procedure Tf_ReplDep.acReplDepPostExecute(Sender: TObject);
begin
  inherited;
  if q_ReplDep.State<>dsBrowse then q_ReplDep.Post;
end;

procedure Tf_ReplDep.FormShow(Sender: TObject);
begin
  inherited;
  Caption:='Репликации, от которых зависит "'+ParentName+'"';
  acReplDepRefreshExecute(Sender);
end;

procedure Tf_ReplDep.gridRSColumns1EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  acReplDepEditExecute(Sender);
end;

procedure Tf_ReplDep.acReplDepEditExecute(Sender: TObject);
var vChildId:string;
begin
  if q_ReplDep.Eof then exit;

  vChildId:='';
  KlsMisc2.SetKLSParam('REPL_LIST','CHOOSE',fsNormal,q_ReplDep.FieldByName('REPL_CHILD').AsString,'',true);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      vChildId:=KlsMisc2.vIdToSeek;
    End;
    Free;
  end;

  if vChildId<>'' then
  Begin
    q_ReplDep.Edit;
    q_ReplDepREPL_CHILD.AsString:=vChildID;
    q_ReplDep.Post;
  end;
end;

procedure Tf_ReplDep.q_ReplDepAfterInsert(DataSet: TDataSet);
var vChildId:string;
begin
  vChildId:='';
  KlsMisc2.SetKLSParam('REPL_LIST','CHOOSE',fsNormal,'','',true);
  with tf_KlsMisc.Create(Self) do
  begin
    if ShowModal=mrOk then
    Begin
      vChildId:=KlsMisc2.vIdToSeek;
    End;
    Free;
  end;

  if vChildId<>'' then
  Begin
    q_ReplDepREPL_CHILD.AsString:=vChildID;
    q_ReplDep.Post;
  end
  else
    q_ReplDep.Cancel;
end;

procedure Tf_ReplDep.q_ReplDepBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Удалить запись?','Внимание!',MB_YESNO)=IDNO then
  Begin
    Abort;
    Exit;
  End;
end;

end.
