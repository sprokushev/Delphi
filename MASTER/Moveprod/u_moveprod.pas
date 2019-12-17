unit u_moveprod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, DateUtils, DB, OracleData, main,
  Grids, DBGridEh, ComCtrls, TabNotBk, ActnList, XPStyleActnCtrls, ActnMan,
  Oracle, ExtCtrls,DBGridEhImpExp,RxShell, Placemnt,MDIForm, TB2Dock,
  TB2Toolbar, TB2Item, PropFilerEh, PropStorageEh, XPMan;

type
//  Tf_move = class(TForm)
    Tf_move = class(Tf_MDIForm)
    q_moveprod: TOracleDataSet;
    ds_moveprod: TDataSource;
    q_ost: TOracleDataSet;
    ds_ost: TDataSource;
    ActionManager1: TActionManager;
    acRefreshQuery: TAction;
    q_ost_calc: TOracleQuery;
    q_otgr_fill: TOracleQuery;
    SaveDialog1: TSaveDialog;
    q_kvit_date_vir: TOracleQuery;
    q_checksum: TOracleQuery;
    q_check: TOracleDataSet;
    ds_check: TDataSource;
    Panel2: TPanel;
    Notebook: TTabbedNotebook;
    Grid_ost: TDBGridEh;
    Grid_otgr: TDBGridEh;
    Grid_check: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem_ost: TTBItem;
    TBItem_ost_xls: TTBItem;
    TBItem_otgr: TTBItem;
    TBItem_otgr_xls: TTBItem;
    TBItem1: TTBItem;
    acOst: TAction;
    acOstXls: TAction;
    acOtgr: TAction;
    acOtgrXls: TAction;
    acKDV: TAction;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBControlItem1: TTBControlItem;
    GroupBox1: TGroupBox;
    c_dbeg: TDBDateTimeEditEh;
    c_dend: TDBDateTimeEditEh;
    k_priormonth: TButton;
    k_nextmonth: TButton;
    XPManifest1: TXPManifest;
    procedure FormActivate(Sender: TObject);
    procedure k_priormonthClick(Sender: TObject);
    procedure k_nextmonthClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acRefreshQueryExecute(Sender: TObject);
    procedure Grid_checkGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acOstExecute(Sender: TObject);
    procedure acOstXlsExecute(Sender: TObject);
    procedure acOtgrExecute(Sender: TObject);
    procedure acOtgrXlsExecute(Sender: TObject);
    procedure acKDVExecute(Sender: TObject);
    procedure TBItem_ostClick(Sender: TObject);
    procedure TBItem_ost_xlsClick(Sender: TObject);
    procedure TBItem_otgrClick(Sender: TObject);
    procedure TBItem_otgr_xlsClick(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_move: Tf_move;
  m_dbeg,m_dend: TDateTime;
  m_grid: string;

implementation

{$R *.dfm}

procedure Tf_move.FormActivate(Sender: TObject);
begin

  m_dbeg:=StartOfTheMonth(StartOfTheMonth(Date)-1);
  m_dend:=EndOfTheMonth(StartOfTheMonth(Date)-1);
  c_dbeg.Value:=m_dbeg;
  c_dend.Value:=m_dend;
  acRefreshQuery.Execute;

end;

procedure Tf_move.k_priormonthClick(Sender: TObject);
begin

  m_dbeg:=StartOfTheMonth(StartOfTheMonth(m_dbeg)-1);
  m_dend:=EndOfTheMonth(StartOfTheMonth(m_dend)-1);
  c_dbeg.Value:=m_dbeg;
  c_dend.Value:=m_dend;
  acRefreshQuery.Execute;
end;

procedure Tf_move.k_nextmonthClick(Sender: TObject);
begin

  m_dbeg:=StartOfTheMonth(EndOfTheMonth(m_dbeg)+1);
  m_dend:=EndOfTheMonth(EndOfTheMonth(m_dend)+1);
  c_dbeg.Value:=m_dbeg;
  c_dend.Value:=m_dend;
  acRefreshQuery.Execute;

end;

procedure Tf_move.FormCreate(Sender: TObject);
begin
  q_ost.Active:=true;
  q_moveprod.Active:=true;
  q_check.Active:=true;
end;

procedure Tf_move.acRefreshQueryExecute(Sender: TObject);
begin
  q_ost.SetVariable('D1',m_dbeg);
  q_ost.Close;
  q_ost.Open;
  q_moveprod.SetVariable('D1',m_dbeg);
  q_moveprod.Close;
  q_moveprod.Open;
  q_check.SetVariable('D1',m_dbeg);
  q_check.Close;
  q_check.Open;
end;

procedure Tf_move.Grid_checkGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
if q_check.FieldValues['naim_value']='разность' then
  begin
    if q_check.FieldValues['summa']=0  then
      Background:=$00DDFFDD;
    if q_check.FieldValues['summa']<>0  then
      Background:=$00DDDDFF;
  end;
if q_check.FieldValues['naim_value']='кол-во разбитых записей' then
      Background:=$00FFDDBB;

end;

procedure Tf_move.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  q_ost.Close;
  q_moveprod.Close;
  q_check.Close;
  Action:=caFree;
end;

procedure Tf_move.acOstExecute(Sender: TObject);
begin
  q_ost_calc.SetVariable('D1',StartOfTheMonth(StartOfTheMonth(m_dbeg)-1));
  q_ost_calc.SetVariable('D2',StartOfTheMonth(m_dbeg));
  try
    q_ost_calc.Execute;
    acRefreshQuery.Execute;
    Notebook.PageIndex:=0;
    showmessage('Остатки рассчитаны успешно.');
  except
    showmessage('Ошибка! Обратитесь к программисту.');
  end;
end;

procedure Tf_move.acOstXlsExecute(Sender: TObject);
begin

if MonthOf(m_dbeg)<10 then
  SaveDialog1.FileName:='ost0'+ VarToStr(MonthOf(m_dbeg))+ VarToStr(YearOf(m_dbeg)) + '.xls'
else
  SaveDialog1.FileName:='ost'+ VarToStr(MonthOf(m_dbeg))+ VarToStr(YearOf(m_dbeg)) + '.xls';

if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,Grid_ost,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,Grid_ost,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

end;

procedure Tf_move.acOtgrExecute(Sender: TObject);
begin
  q_otgr_fill.SetVariable('D1',m_dbeg);
  q_otgr_fill.SetVariable('D2',m_dend);
  try
    q_otgr_fill.Execute;
    acRefreshQuery.Execute;
    Notebook.PageIndex:=1;
    showmessage('отгрузка заполнена успешно.');
  except
    showmessage('Ошибка! Обратитесь к программисту.');
  end;
end;

procedure Tf_move.acOtgrXlsExecute(Sender: TObject);
begin
if MonthOf(m_dbeg)<10 then
    SaveDialog1.FileName:='otgr0'+ VarToStr(MonthOf(m_dbeg))+ VarToStr(YearOf(m_dbeg)) + '.xls'
else
    SaveDialog1.FileName:='otgr'+ VarToStr(MonthOf(m_dbeg))+ VarToStr(YearOf(m_dbeg)) + '.xls';

if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,Grid_otgr,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,Grid_otgr,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

procedure Tf_move.acKDVExecute(Sender: TObject);
begin
  q_kvit_date_vir.SetVariable('D1',m_dbeg);
  q_kvit_date_vir.SetVariable('D2',m_dend);
  try
    q_kvit_date_vir.Execute;
    acRefreshQuery.Execute;
  except
    showmessage('Ошибка при заполнении kvit_date_vir!');
  end;

  q_checksum.SetVariable('D1',m_dbeg);
  q_checksum.SetVariable('D2',m_dend);
  try
    q_checksum.Execute;
    acRefreshQuery.Execute;
    Notebook.PageIndex:=2;
    showmessage('kvit_date_vir заполнена успешно.'+chr(13)+'проверка выполнена.');
  except
    showmessage('Ошибка при заполнении check_vyr_sum!');
  end;
end;

procedure Tf_move.TBItem_ostClick(Sender: TObject);
begin
  acOst.Execute;
end;

procedure Tf_move.TBItem_ost_xlsClick(Sender: TObject);
begin
  acOstXls.Execute;
end;

procedure Tf_move.TBItem_otgrClick(Sender: TObject);
begin
  acOtgr.Execute;
end;

procedure Tf_move.TBItem_otgr_xlsClick(Sender: TObject);
begin
  acOtgrXls.Execute;
end;

procedure Tf_move.TBItem1Click(Sender: TObject);
begin
  acKDV.Execute;
end;

end.
