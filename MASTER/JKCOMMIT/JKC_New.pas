unit JKC_New;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,mdiform, TB2Item, ActnList, ActnMan, ExtCtrls, TB2Dock,
  TB2Toolbar, Oracle, DB, OracleData, RxLookup, StdCtrls, Grids, DBGridEh,
  XPStyleActnCtrls;

type
  TF_JKCommit = class(TF_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    Panel1: TPanel;
    ActionManager1: TActionManager;
    acJKC_History: TAction;
    TBItem1: TTBItem;
    q_Tmp: TOracleDataSet;
    q_JKCommit: TOracleDataSet;
    Label1: TLabel;
    lc_Mesto: TRxDBLookupCombo;
    q_Mesto: TOracleDataSet;
    ds_Mesto: TDataSource;
    q_JKCommitMESTO_ID: TIntegerField;
    q_JKCommitFLG_COMMIT: TIntegerField;
    q_JKCommitSVED_NUM: TIntegerField;
    q_JKCommitSVED_DATE: TDateTimeField;
    q_JKCommitDATE_OFORML: TDateTimeField;
    q_JKCommitDATE_EDIT: TDateTimeField;
    q_JKCommitSVED_CNT: TIntegerField;
    q_JKCommitSVED_VES: TFloatField;
    q_JKCommitSVED_ID: TStringField;
    q_JKCommitNOM_ZD: TStringField;
    q_JKCommitPROD_NAME: TStringField;
    q_JKCommitNOM_ZD_COMMIT: TIntegerField;
    grid_JKC: TDBGridEh;
    ds_JKCommit: TDataSource;
    cb_OnlyNoCommit: TCheckBox;
    acJKC_FillList: TAction;
    TBItem2: TTBItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lc_MestoChange(Sender: TObject);
    procedure cb_OnlyNoCommitClick(Sender: TObject);
    procedure acJKC_FillListExecute(Sender: TObject);
  private
    { Private declarations }
    JKTable:string;
  public
    { Public declarations }
  end;

var
  F_JKCommit: TF_JKCommit;

implementation

uses ForDB,ForSystem, main;

{$R *.dfm}

procedure TF_JKCommit.FormShow(Sender: TObject);
begin
  Caption:='Подтверждение сведений';

  q_Tmp.Session:=f_main.ora_Session;
  q_Mesto.Session:=f_main.ora_Session;
  q_JKCommit.Session:=f_main.ora_Session;

  JKTable:='JKCOMMIT_'+F_ForSystem.GetUserName(True);

  if Application.MessageBox('Продолжить подтверждение, начатое ранее?','Запрос',MB_YESNO)=IDNO Then
  with q_Tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('TRUNCATE TABLE '+JKTable);
    ExecSQL;
    SQL.Clear;
    SQL.Add('COMMIT');
    ExecSQL;
  finally;
    Close;
  End;

  q_JKCommit.SQL[1]:='FROM '+JKTable+' A';
  q_Mesto.Open;
  q_Mesto.Locate('ID',1,[]);
  lc_Mesto.KeyValue:=q_Mesto.FieldByName('ID').AsInteger;
end;

procedure TF_JKCommit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_Tmp.SQL.Clear;
  Action:=caFree;
end;

procedure TF_JKCommit.lc_MestoChange(Sender: TObject);
begin
  with q_JKCommit do
  try
    DisableControls;
    Close;
    try
      SQL[2]:=' WHERE A.MESTO_ID='+VarToStr(lc_Mesto.KeyValue);
      Open;
    except
      SQL[2]:=' WHERE 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure TF_JKCommit.cb_OnlyNoCommitClick(Sender: TObject);
begin
  with q_JKCommit do
  try
    DisableControls;
    Close;
    try
      IF cb_OnlyNoCommit.Checked Then
        SQL[3]:=' AND A.FLG_COMMIT=0'
      Else
        SQL[3]:=' AND 1 = 1 ';
      Open;
    except
      SQL[3]:=' AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure TF_JKCommit.acJKC_FillListExecute(Sender: TObject);
begin
  inherited;
{  with q_Tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('TRUNCATE TABLE '+JKTable);
    ExecSQL;
    ora_Session.Commit;
    SQL.Clear;
  finally;
    Close;
  End;}


end;

end.
