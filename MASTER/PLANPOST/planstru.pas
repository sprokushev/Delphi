unit planstru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, ComCtrls, StdCtrls,
  Grids, DBGridEh,mdiform, Mask, ExtCtrls,DateUtil, ActnList, ActnMan,
  TB2Item, TB2Dock, TB2Toolbar, TB2ToolWindow, XPStyleActnCtrls;

type
  Tf_PlanStru = class(Tf_MDIForm)
    GroupBox1: TGroupBox;
    q_PlanStru: TOracleDataSet;
    ds_lanstru: TDataSource;
    grid_Stru: TDBGridEh;
    q_PlanStruLEVEL_POS: TIntegerField;
    q_PlanStruBEGIN_DATE: TDateTimeField;
    q_PlanStruEND_DATE: TDateTimeField;
    q_PlanStruNAME: TStringField;
    q_PlanStruINPUT_DATE: TDateTimeField;
    q_PlanStruKOD_SGR: TIntegerField;
    q_PlanStruKOD_SPG: TIntegerField;
    q_PlanStruKOD_RZD: TIntegerField;
    q_PlanStruKOD_PRZ: TIntegerField;
    q_PlanStruKOD_GRP: TIntegerField;
    q_PlanStruKOD_PGR: TIntegerField;
    q_PlanStruAligned_Name: TStringField;
    q_PlanStruID: TFloatField;
    q_PlanStruPARENT_ID: TFloatField;
    q_Tmp: TOracleDataSet;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem2: TTBItem;
    TBItem1: TTBItem;
    TBItem3: TTBItem;
    ActionManager1: TActionManager;
    acNewPlanPostPosition: TAction;
    acEditPlanPostPosition: TAction;
    acDelPlanPostPosition: TAction;
    TBToolWindow1: TTBToolWindow;
    Label1: TLabel;
    e_year: TMaskEdit;
    ud_year: TUpDown;
    acPlanStruToDBF: TAction;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem4: TTBItem;
    q_PlanStruNAZN_OTG_ID: TIntegerField;
    q_PlanStruVIEW_LEVEL: TIntegerField;
    q_PlanStruREGION_ID: TFloatField;
    q_PlanStruORG_KIND_ID: TFloatField;
    q_PlanStruTIP_REAL_ID: TFloatField;
    q_PlanStruFOR_ID: TIntegerField;
    q_PlanStruFOR_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure q_PlanStruBeforePost(DataSet: TDataSet);
    procedure q_PlanStruCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure e_yearChange(Sender: TObject);
    procedure q_PlanStruBeforeDelete(DataSet: TDataSet);
    procedure acDelPlanPostPositionExecute(Sender: TObject);
    procedure acNewPlanPostPositionExecute(Sender: TObject);
    procedure acEditPlanPostPositionExecute(Sender: TObject);
    procedure acPlanStruToDBFExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_PlanStru: Tf_PlanStru;

implementation
uses AddPlanStru,oratodbf,rxStrUtils, ForDB, main;
{$R *.dfm}

procedure Tf_PlanStru.FormCreate(Sender: TObject);
begin
  q_tmp.session:=f_main.ora_Session;
  q_PlanStru.session:=f_main.ora_Session;
  q_PlanStru.Open;
end;

procedure Tf_PlanStru.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_PlanStru.Close;
  Action:=caFree;
end;

procedure Tf_PlanStru.q_PlanStruBeforePost(DataSet: TDataSet);
begin
  if q_PlanStru.FieldByName('input_date').AsString='' then
    q_PlanStru.FieldByName('input_date').AsDateTime:=Now;
end;

procedure Tf_PlanStru.q_PlanStruCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('aligned_name').AsString:=
    copy('                                       ',1,
    DataSet.FieldByName('level_pos').AsInteger*4)+
    DataSet.FieldByName('name').AsString;
end;

procedure Tf_PlanStru.FormShow(Sender: TObject);
begin
  ud_year.Position:=ExtractYear(Now);
end;

procedure Tf_PlanStru.e_yearChange(Sender: TObject);
begin
  If q_PlanStru.Active then
  with q_PlanStru do
  try
    DisableControls;
    Close;
    try
      SQL[2]:=' WHERE TO_CHAR(BEGIN_DATE,''YYYY'')<='''+IntToStr(ud_year.Position)+'''';
      SQL[3]:='   AND TO_CHAR(END_DATE,''YYYY'')>='''+IntToStr(ud_year.Position)+'''';
      Open;
    except
      SQL[2]:=' WHERE 1 = 1 ';
      SQL[3]:='   AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;
end;

procedure Tf_PlanStru.q_PlanStruBeforeDelete(DataSet: TDataSet);
var IsAbort:boolean;
begin
  IsAbort:=false;
  If q_PlanStru.FieldByName('ID').AsInteger=99999 Then Abort;
  if Application.MessageBox('Удалить позицию плана поставок?','Запрос',MB_YESNO)=IDYES Then
  with q_Tmp do
  try
    Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) AS cnt1 FROM KLS_PLANSTRU WHERE PARENT_ID='+q_PlanStru.FieldByName('ID').AsString);
    Open;
    If (not Eof) AND (FieldByName('cnt1').AsInteger>0) Then
    Begin
      Application.MessageBox('Удалите все дочерние позиции плана!','Внимание');
      grid_Stru.SetFocus;
      IsAbort:=true;
    End;
    If NOT IsAbort Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS cnt1 FROM MONTH WHERE PLANSTRU_ID='+q_PlanStru.FieldByName('ID').AsString);
      Open;
      If (not Eof) AND (FieldByName('cnt1').AsInteger>0) Then
      Begin
        Application.MessageBox('Удалите все заявки ссылающиеся на данную позицию плана!','Внимание');
        grid_Stru.SetFocus;
       IsAbort:=true;
      End;
    End;
    If NOT IsAbort Then
    Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS cnt1 FROM PLAN_POST WHERE PLANSTRU_ID='+q_PlanStru.FieldByName('ID').AsString);
      Open;
      If (not Eof) AND (FieldByName('cnt1').AsInteger>0) Then
      Begin
        Application.MessageBox('Удалите все договора, ссылающиеся на данную позицию плана!','Внимание');
        grid_Stru.SetFocus;
       IsAbort:=true;
      End;
    End;
  finally;
    Close;
  End
  else IsAbort:=true;
  If IsAbort Then Abort;
end;

procedure Tf_PlanStru.acDelPlanPostPositionExecute(Sender: TObject);
begin
  q_PlanStru.Delete;
end;

procedure Tf_PlanStru.acNewPlanPostPositionExecute(Sender: TObject);
begin
  inherited;
  F_AddPlanStru:=TF_AddPlanStru.Create(Self);
  F_AddPlanStru.PlanYear:=ud_year.Position;
  F_AddPlanStru.IsAdd:=True;
  F_AddPlanStru.ParentStruId:=q_PlanStruID.AsInteger;
  if F_AddPlanStru.ShowModal=mrOk then
  Begin
    q_Tmp.SQL.Clear;
    q_tmp.SQL.Add('INSERT INTO kls_planstru (BEGIN_DATE,END_DATE,NAME,LEVEL_POS,INPUT_DATE,KOD_SGR,KOD_SPG,KOD_RZD,KOD_PRZ,KOD_GRP,KOD_PGR,FOR_ID,FOR_NAME,PARENT_ID,NAZN_OTG_ID) VALUES(');
    q_tmp.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_AddPlanStru.e_BegDate.Date)+''',''dd.mm.yyyy''),');
    q_tmp.SQL.Add('TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_AddPlanStru.e_EndDate.Date)+''',''dd.mm.yyyy''),');
    q_tmp.SQL.Add(''''+F_AddPlanStru.e_name.Text+''',');
    q_tmp.SQL.Add(F_AddPlanStru.e_Level.Text+',');
    q_tmp.SQL.Add('SYSDATE,');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_sgr.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_spg.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_rzd.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_prz.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_grp.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_kod_pgr.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_for_id.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.e_for_name.Text+',');
    q_tmp.SQL.Add(F_AddPlanStru.lc_ParentStru.Value+',');
    q_tmp.SQL.Add(F_AddPlanStru.lc_Nazn_Otg.Value+')');

//    q_Tmp.SQL.SaveToFile('c:\tmp\a.txt');
    q_Tmp.ExecSQL;
    q_Tmp.Session.Commit;
    f_db.ReQuery(q_PlanStru,True);
  end;
  F_AddPlanStru.Free;
end;

procedure Tf_PlanStru.acEditPlanPostPositionExecute(Sender: TObject);
begin
  inherited;
  F_AddPlanStru:=TF_AddPlanStru.Create(Self);
  F_AddPlanStru.PlanYear:=ud_year.Position;
  F_AddPlanStru.StruId:=q_PlanStruID.AsInteger;
  F_AddPlanStru.ParentStruId:=q_PlanStruPARENT_ID.AsInteger;
  F_AddPlanStru.IsAdd:=False;
  F_AddPlanStru.e_Level.Text:=q_PlanStruLEVEL_POS.AsString;
  F_AddPlanStru.KOD_SGR:=q_PlanStruKOD_SGR.AsString;
  F_AddPlanStru.KOD_SPG:=q_PlanStruKOD_SPG.AsString;
  F_AddPlanStru.KOD_RZD:=q_PlanStruKOD_RZD.AsString;
  F_AddPlanStru.KOD_PRZ:=q_PlanStruKOD_PRZ.AsString;
  F_AddPlanStru.KOD_GRP:=q_PlanStruKOD_GRP.AsString;
  F_AddPlanStru.KOD_PGR:=q_PlanStruKOD_PGR.AsString;
  F_AddPlanStru.PosName:=q_PlanStruNAME.AsString;
  F_AddPlanStru.BegDate:=q_PlanStruBEGIN_DATE.AsDateTime;
  F_AddPlanStru.EndDate:=q_PlanStruEND_DATE.AsDateTime;
  F_AddPlanStru.lc_Nazn_Otg.Value:=q_PlanStruNAZN_OTG_ID.AsString;
  F_AddPlanStru.e_for_id.Text:=q_PlanStruFOR_ID.AsString;
  F_AddPlanStru.e_for_name.Text:=q_PlanStruFOR_NAME.AsString;
  if F_AddPlanStru.ShowModal=mrOk then
  Begin
    q_Tmp.SQL.Clear;
    q_tmp.SQL.Add('UPDATE kls_planstru SET ');
    q_tmp.SQL.Add('BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_AddPlanStru.e_BegDate.Date)+''',''dd.mm.yyyy''),');
    q_tmp.SQL.Add('END_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',F_AddPlanStru.e_EndDate.Date)+''',''dd.mm.yyyy''),');
    q_tmp.SQL.Add('NAME='''+F_AddPlanStru.e_name.Text+''',');
    q_tmp.SQL.Add('LEVEL_POS='+F_AddPlanStru.e_Level.Text+',');
    q_tmp.SQL.Add('KOD_SGR='+F_AddPlanStru.e_kod_sgr.Text+',');
    q_tmp.SQL.Add('KOD_SPG='+F_AddPlanStru.e_kod_spg.Text+',');
    q_tmp.SQL.Add('KOD_RZD='+F_AddPlanStru.e_kod_rzd.Text+',');
    q_tmp.SQL.Add('KOD_PRZ='+F_AddPlanStru.e_kod_prz.Text+',');
    q_tmp.SQL.Add('KOD_GRP='+F_AddPlanStru.e_kod_grp.Text+',');
    q_tmp.SQL.Add('KOD_PGR='+F_AddPlanStru.e_kod_pgr.Text+',');
    q_tmp.SQL.Add('FOR_ID='+F_AddPlanStru.e_for_id.Text+',');
    q_tmp.SQL.Add('FOR_NAME='''+F_AddPlanStru.e_for_name.Text+''',');
    q_tmp.SQL.Add('NAZN_OTG_ID='+F_AddPlanStru.lc_Nazn_Otg.Value+',');
    q_tmp.SQL.Add('PARENT_ID='+F_AddPlanStru.lc_ParentStru.Value);
    q_tmp.SQL.Add(' WHERE id='+q_PlanStruID.AsString);
//    q_Tmp.SQL.SaveToFile('c:\tmp\a.txt');
    q_Tmp.ExecSQL;
    q_Tmp.Session.Commit;
    f_db.ReQuery(q_PlanStru,True);
  end;
  F_AddPlanStru.Free;

end;

procedure Tf_PlanStru.acPlanStruToDBFExecute(Sender: TObject);
var
  i,j:Integer;
begin
  inherited;
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='PLAN_STRU';
      DontAsk:=True;
      ShowModal;
      for i:=0 to 5 do
        for j:=1 to 12 do
          if DirectoryExists('U:\luk\DOGOVOR\PLANM\pl'+AddChar('0',IntToStr(i),2)+'_'+AddChar('0',IntToStr(j),2)) then
            begin
              CopyFile('U:\luk\DOGOVOR\PLANM\DBF\gr_real.DBF','c:\temp\fr_real2.dbf',False);
              CopyFile('U:\luk\DOGOVOR\PLANM\DBF\gr_real.CDX','c:\temp\fr_real2.cdx',False);
            end;
    end;
end;

end.
