unit CatCen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, Db, ImgList, Oracle,
  OracleData, ToolWin, ActnMan, ActnCtrls, ActnList,MDIForm, TB2Item,
  TB2Dock, TB2Toolbar, PrnDbgeh, XPStyleActnCtrls;

type
  Tf_CatCen = class(Tf_MDIForm)
    ds_CatCen: TDataSource;
    grid_CatCen: TDBGridEh;
    q_CatCen: TOracleDataSet;
    q_CatCenID: TIntegerField;
    q_CatCenCAT_CEN_NAME: TStringField;
    q_CatCenGROUPDOG_NAME: TStringField;
    q_CatCenPREDPR_NAME: TStringField;
    q_CatCenPREDPR_ID: TIntegerField;
    q_CatCenGROUPDOG_ID: TIntegerField;
    q_UpdateCatCen: TOracleQuery;
    ActionManager1: TActionManager;
    acAddCatCen: TAction;
    acEdCatCen: TAction;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    acCatCenPrint: TAction;
    PrintDBGridEh1: TPrintDBGridEh;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    acCatCenToDBF: TAction;
    TBItem4: TTBItem;
    q_CatCenCAT_CEN_GROUP_NAME: TStringField;
    q_CatCenCAT_CEN_GROUP_ID: TIntegerField;
    TBItem6: TTBItem;
    acCatCenSaveToXls: TAction;
    SaveDialog1: TSaveDialog;
    acCatCenToDBFJK: TAction;
    TBItem5: TTBItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grid_CatCenDblClick(Sender: TObject);
    procedure grid_CatCenGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure grid_CatCenSortMarkingChanged(Sender: TObject);
    procedure acEdCatCenExecute(Sender: TObject);
    procedure acAddCatCenExecute(Sender: TObject);
    procedure acCatCenPrintExecute(Sender: TObject);
    procedure acCatCenToDBFExecute(Sender: TObject);
    procedure acCatCenSaveToXlsExecute(Sender: TObject);
    procedure acCatCenToDBFJKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses ForDB,EdCatCen,OraToDbf,DBGridEhImpExp, main;

{$R *.DFM}

procedure Tf_CatCen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_CatCen.Close;
  Action:=caFree;
end;

procedure Tf_CatCen.FormCreate(Sender: TObject);
begin
  q_CatCen.Session:=f_main.ora_Session;
  q_UpdateCatCen.Session:=f_main.ora_Session;
  q_CatCen.Open;
  f_db.SetUserGrants(ActionManager1);
end;

procedure Tf_CatCen.grid_CatCenDblClick(Sender: TObject);
begin
  acEdCatCenExecute(Self);
end;

procedure Tf_CatCen.grid_CatCenGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_CatCen.RecNo mod 2=0 then
    Background:=clInfoBk;
  if gdSelected in State then
    Background:=clNavy;
end;

procedure Tf_CatCen.grid_CatCenSortMarkingChanged(Sender: TObject);
begin
  f_db.SortInGrid(q_CatCen,10,grid_CatCen);
end;

procedure Tf_CatCen.acEdCatCenExecute(Sender: TObject);
begin
  with TF_EdCatCen.Create(Self) do
    begin
      e_CatCen.text:=q_CatCen.FieldByName('id').AsString;
      e_CatCenName.text:=q_CatCen.FieldByName('cat_cen_name').AsString;
      lc_GroupDog.Value:=IntToStr(q_CatCen.FieldByName('groupdog_id').AsInteger);
      lc_Predpr.Value:=IntToStr(q_CatCen.FieldByName('predpr_id').AsInteger);
      lc_Cat_Cen_Group.Value:=IntToStr(q_CatCen.FieldByName('Cat_Cen_Group_Id').AsInteger);
      if ShowModal=mrOk then
        with q_UpdateCatCen do
          begin
            SQL.Clear;
            SQL.Add(     'UPDATE kls_cat_cen SET '+
                         ' id='+e_CatCen.Text+','+
                         ' cat_cen_name='''+e_CatCenName.Text+''',');
            SQL.Add(' groupdog_id='+lc_GroupDog.Value+','+
                         ' predpr_id='+lc_Predpr.Value+','+
                         ' Cat_Cen_Group_id='+lc_Cat_Cen_Group.Value+
                         ' WHERE id='+q_CatCen.FieldByName('id').AsString);
            q_UpdateCatCen.Execute;
            q_UpdateCatCen.Session.Commit;
            f_db.ReQuery(q_CatCen,True);
          end;
      Free;
    end;
end;

procedure Tf_CatCen.acAddCatCenExecute(Sender: TObject);
begin
  with TF_EdCatCen.Create(Self) do
    begin
      if ShowModal=mrOk then
        with q_UpdateCatCen do
          begin
            SQL.Clear;
            SQL.Add('INSERT INTO kls_cat_cen (id,fox_id,cat_cen_name,groupdog_id,predpr_id,CAT_CEN_GROUP_ID) VALUES ( '+
            e_CatCen.Text+','+IntToStr(StrToInt(e_CatCen.Text)+1000)+','''+e_CatCenName.Text+''',');
            SQL.Add(lc_GroupDog.Value+','+lc_Predpr.Value+','+lc_Cat_Cen_Group.Value+')');
            q_UpdateCatCen.Execute;
            q_UpdateCatCen.Session.Commit;
            f_db.ReQuery(q_CatCen,True);
          end;
      Free;
    end;
end;

procedure Tf_CatCen.acCatCenPrintExecute(Sender: TObject);
begin
  inherited;
  PrintDBGridEh1.Preview;
end;

procedure Tf_CatCen.acCatCenToDBFExecute(Sender: TObject);
begin
  inherited;
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='CAT_CEN';
      DontAsk:=True;
      ShowModal;
    end;
end;

procedure Tf_CatCen.acCatCenSaveToXlsExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_CatCen,SaveDialog1.FileName,True)
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,grid_CatCen,SaveDialog1.FileName,True);
end;

procedure Tf_CatCen.acCatCenToDBFJKExecute(Sender: TObject);
begin
  inherited;
  with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='CAT_CEN_P';
      DontAsk:=True;
      ShowModal;
    end;
end;

end.
