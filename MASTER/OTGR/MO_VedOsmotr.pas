unit MO_VedOsmotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, Placemnt, ExtCtrls, Grids, DBGridEh, ComCtrls,
  RxLookup, Buttons, StdCtrls, TB2Dock, TB2Toolbar, TB2Item, ActnList,
  XPStyleActnCtrls, ActnMan, TB2ExtItems, Menus, Oracle, DB, OracleData, DBGrids,
  PropFilerEh, PropStorageEh, DateUtils,DBGridEhImpExp,RxShell, GridsEh;

type
  Tf_VedOsmotr = class(Tf_MDIForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Date1: TDateTimePicker;
    Date2: TDateTimePicker;
    GridTitle: TDBGridEh;
    Splitter1: TSplitter;
    gbRows: TGroupBox;
    GridRows: TDBGridEh;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    time1: TDateTimePicker;
    time2: TDateTimePicker;
    ActionManager1: TActionManager;
    acToXLS: TAction;
    bRefresh: TTBItem;
    bRefreshRows: TTBItem;
    PopupTitle: TTBPopupMenu;
    tbTitleFilterTitle: TTBItem;
    acMOVedOsmotrAdd: TAction;
    acMOVedOsmotrEdit: TAction;
    acMOVedOsmotrDel: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    acMOVedOsmotrCopy: TAction;
    TBItem4: TTBItem;
    acMOVedOsmotrRowsAdd: TAction;
    acMOVedOsmotrRowsEdit: TAction;
    acMOVedOsmotrRowsCopy: TAction;
    acMOVedOsmotrRowsDel: TAction;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    acPrint: TAction;
    acFilter: TAction;
    acNoFilter: TAction;
    tbTitleFilterEdit: TTBEditItem;
    tbTitleFilterSelection: TTBItem;
    tbTitleFilterClear: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tbTitleWinEdit: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem9: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    PopupRows: TTBPopupMenu;
    tbRowsFilterTitle: TTBItem;
    tbRowsFilterEdit: TTBEditItem;
    tbRowsFilterSelection: TTBItem;
    tbRowsFilterClear: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    tbRowsWinEdit: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem29: TTBItem;
    ora_Session: TOracleSession;
    q_title: TOracleDataSet;
    ds_title: TDataSource;
    q_rows: TOracleDataSet;
    ds_rows: TDataSource;
    q_titleID: TFloatField;
    q_titleVED_NUM: TFloatField;
    q_titleVED_DATE: TDateTimeField;
    q_titleFROM_DATE: TDateTimeField;
    q_titleTO_DATE: TDateTimeField;
    q_titleFIO1: TStringField;
    q_titleFIO2: TStringField;
    q_titleFIO3: TStringField;
    q_titleSIGN1: TStringField;
    q_rowsID: TFloatField;
    q_rowsVED_ID: TFloatField;
    q_rowsPOD_DATE: TDateTimeField;
    q_rowsNUM_CIST: TStringField;
    q_rowsKALIBR_ID: TStringField;
    q_rowsRAZMET_PER: TStringField;
    q_rowsF_OST: TIntegerField;
    q_rowsPRIM: TStringField;
    q_rowsPOD_POS: TFloatField;
    pkgFOR_VED_OSMOTR: TOraclePackage;
    q_titleMESTO_ID: TFloatField;
    PropStorageEh1: TPropStorageEh;
    q_titleVED_PREFIX: TStringField;
    q_titleLOAD_TYPE_ID: TFloatField;
    pkgFOR_CIST: TOraclePackage;
    q_Prod: TOracleDataSet;
    q_ProdID_NPR: TStringField;
    q_ProdNAME_NPR: TStringField;
    q_VagonType: TOracleDataSet;
    q_VagonTypeID: TIntegerField;
    q_VagonTypeNAME: TStringField;
    q_VagOwner: TOracleDataSet;
    q_VagOwnerID: TFloatField;
    q_VagOwnerNAME: TStringField;
    q_VagOwnerSORTBY: TFloatField;
    q_rowsPROD_ID_NPR: TStringField;
    q_rowsVAGOWNER_ID: TFloatField;
    q_rowsCAPACITY: TStringField;
    q_rowsNCISTDOP: TIntegerField;
    q_rowsAXES: TIntegerField;
    q_rowsVES_CIST: TFloatField;
    q_rowsVAGONTYPE_ID: TFloatField;
    q_rowsBAD_NUM: TIntegerField;
    q_rowsPROD_NAME: TStringField;
    q_rowsVAGOWNER_NAME: TStringField;
    q_rowsVAGONTYPE_NAME: TStringField;
    q_rowsLAST_PROD_NAME: TStringField;
    q_titleKOL: TIntegerField;
    acRowsPost: TAction;
    acRowsCancel: TAction;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    acRowsSprav: TAction;
    TBItem20: TTBItem;
    q_rowsLAST_PROD_ID_NPR: TStringField;
    q_rowsVED_POD_NUM: TStringField;
    SaveDialog1: TSaveDialog;
    q_rowsVED_OSMOTR_NUM: TStringField;
    acVedOsmotrMoveVagon: TAction;
    TBSubmenuItem3: TTBSubmenuItem;
    acReportLastGruz: TAction;
    TBItem22: TTBItem;
    TBItem10: TTBItem;
    acFind: TAction;
    TBDock5: TTBDock;
    TBToolbar5: TTBToolbar;
    TBItem28: TTBItem;
    TBItem32: TTBItem;
    q_cist_deni: TOracleDataSet;
    q_VagStatus: TOracleDataSet;
    q_VagStatusID: TFloatField;
    q_VagStatusNAME: TStringField;
    ds_VagStatus: TDataSource;
    q_rowsVAG_STATUS_ID: TFloatField;
    q_rowsVAG_STATUS_NAME: TStringField;
    q_razmet: TOracleDataSet;
    acLastReis: TAction;
    TBItem21: TTBItem;
    q_rowsGOST1510: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acToXLSExecute(Sender: TObject);
    procedure acMOVedOsmotrAddExecute(Sender: TObject);
    procedure acMOVedOsmotrEditExecute(Sender: TObject);
    procedure acMOVedOsmotrRowsAddExecute(Sender: TObject);
    procedure acMOVedOsmotrRowsEditExecute(Sender: TObject);
    procedure acMOVedOsmotrRowsCopyExecute(Sender: TObject);
    procedure acMOVedOsmotrRowsDelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acFilterExecute(Sender: TObject);
    procedure acNoFilterExecute(Sender: TObject);
    procedure acMOVedOsmotrCopyExecute(Sender: TObject);
    procedure acMOVedOsmotrDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure q_titleAfterScroll(DataSet: TDataSet);
    procedure bRefreshClick(Sender: TObject);
    procedure bRefreshRowsClick(Sender: TObject);
    procedure GridTitleExit(Sender: TObject);
    procedure GridRowsExit(Sender: TObject);
    procedure GridTitleSortMarkingChanged(Sender: TObject);
    procedure GridRowsSortMarkingChanged(Sender: TObject);
    procedure tbTitleFilterEditAcceptText(Sender: TObject;
      var NewText: String; var Accept: Boolean);
    procedure tbTitleFilterSelectionClick(Sender: TObject);
    procedure tbTitleFilterClearClick(Sender: TObject);
    procedure tbTitleWinEditClick(Sender: TObject);
    procedure tbRowsFilterEditAcceptText(Sender: TObject;
      var NewText: String; var Accept: Boolean);
    procedure tbRowsFilterSelectionClick(Sender: TObject);
    procedure tbRowsFilterClearClick(Sender: TObject);
    procedure tbRowsWinEditClick(Sender: TObject);
    procedure q_titleFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_rowsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure q_titleAfterOpen(DataSet: TDataSet);
    procedure q_rowsAfterDelete(DataSet: TDataSet);
    procedure q_rowsAfterPost(DataSet: TDataSet);
    procedure q_rowsAfterInsert(DataSet: TDataSet);
    procedure q_rowsBeforeScroll(DataSet: TDataSet);
    procedure q_titleBeforeOpen(DataSet: TDataSet);
    procedure q_rowsAfterScroll(DataSet: TDataSet);
    procedure q_rowsBeforePost(DataSet: TDataSet);
    procedure GridRowsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_rowsNUM_CISTChange(Sender: TField);
    procedure acRowsPostExecute(Sender: TObject);
    procedure acRowsCancelExecute(Sender: TObject);
    procedure acRowsSpravExecute(Sender: TObject);
    procedure q_rowsBeforeOpen(DataSet: TDataSet);
    procedure acVedOsmotrMoveVagonExecute(Sender: TObject);
    procedure acReportLastGruzExecute(Sender: TObject);
    procedure acFindExecute(Sender: TObject);
    procedure ExecuteSearch();
    procedure CheckTime(Sender: TObject);
    procedure q_rowsRAZMET_PERValidate(Sender: TField);
    procedure acLastReisExecute(Sender: TObject);
    procedure GridRowsGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    // ������
    Filter2title: TStringList; // ������ ��� ������� � GridTitle
    Filter2rows: TStringList; // ������ ��� ������� � GridRows
    ViewLinkMode:integer; // 1-������ �� ������
    ViewLinkFilter:string; // ������ ������� �� ������
    // ��� ����������
    IsRefresh: boolean; // � ������ ������ ���������� ���������� �������
    // �������� ����� ���������� ������
    vNextState:TDataSetState;
    vPrevDate:variant;
    vPrevNumcist:variant;
    vPrevKalibr:variant;
    vPrevRazmetPer:variant;
    vPrevProd:variant;
    vPrevFOst:variant;
    vPrevPrim:variant;
    vPrevVagowner:variant;
    vPrevNcistdop:variant;
  public
    { Public declarations }
    QueryBegin,QueryEnd:TDateTime;
    DocMestoId:integer; // ����� ��������
    DocLoadTypeId:integer; // ��� ���������������
    DocType:integer; // ��� ���������
    DocMode:integer; // 1-�������������� ����, 2-�����������������
    ReturnID:double;//ID ������� ���������� ����� �� ����������� ������� �� 1 ���-�� � ������
    DocTitleID:double;//ID �����. ���-�� ��� ��������� ������
  end;

var
  f_VedOsmotr: Tf_VedOsmotr;
  gLinkMode:integer; // ����� ���������: 1-������ �� ������ 0-����������� ��������
  gLinkFilter:string; // ������ ��� ������� �� ������
  gMesto:integer; // ����� ��������
  gLoadType:integer; // ��� ���������������
  gMode:integer; // 1-�������������� ����, 2-�����������������

implementation

uses main, ForDB, ForSystem, MO_VedOsmotrNew, ForSESS, KlsMisc2, ForTemp, ForFiles,MO_MoveVagon, ForReport,
  MO_Find;

{$R *.dfm}

procedure Tf_VedOsmotr.FormCreate(Sender: TObject);
begin
  inherited;
  // Popup-������
  Filter2title:=TStringList.Create;
  Filter2title.Clear;
  Filter2rows:=TStringList.Create;
  Filter2rows.Clear;
  // ������ �� �����
  Time1.Time:=StrToTime('00:00:00');
  Time2.Time:=StrToTime('23:59:59');
  Date1.Date:=Date-1;
  Date2.Date:=Date+1;
  // ������ �� ������
  ViewLinkMode:=gLinkMode;
  ViewLinkFilter:=gLinkFilter;
  gLinkMode:=0;
  gLinkFilter:='';
  // ����� ��������
  DocMestoId:=gMesto;
  gMesto:=-1;
  DocLoadTypeId:=gLoadType;
  gLoadType:=-1;
  // ��� ���������
  DocType:=1;
  DocMode:=gMode;
  gMode:=-1;

  // ������
  f_db.LogonMasterSession(ora_Session);
  f_db.SetUserGrants(ActionManager1);

  // ��������� �����
  if f_db.CheckGrant('acMOVedOsmotrRowsEdit') then
  Begin
    q_Rows.ReadOnly:=false;
  End
  else
  Begin
    q_Rows.ReadOnly:=true;
  end;

  // ��������
  f_db.ReQuery(q_razmet,false);
  q_rows.SetVariable('MESTO_ID',DocMestoId);
  q_rows.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  q_title.SetVariable('MESTO_ID',DocMestoId);
  q_title.SetVariable('LOAD_TYPE_ID',DocLoadTypeId);
  IsRefresh:=true;
  f_db.ReQuery(q_title,false);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // ����������� ������
  try
    filter2title.Clear;
  except
  end;
  try
    filter2rows.Clear;
  except
  end;
  // ��������� ������
  GridRowsExit(Sender);
  GridTitleExit(Sender);
  ora_Session.Commit;
  ora_Session.Connected:=false;
  // ��������� ����
  Action:=caFree;
end;

procedure Tf_VedOsmotr.bRefreshClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  IsRefresh:=true;
  q_title.SetVariable(':TITLE_ID',0);
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
  // �������� � ������������ ����������� �������
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.bRefreshRowsClick(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
  // ��������� ������
  f_db.ReQuery(q_rows,true);
end;

procedure Tf_VedOsmotr.q_titleAfterScroll(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  if IsRefresh then exit;
  // ��������� �������
  f_db.ReQuery(q_rows,false);
  // ���������� Popup-�������
  if filter2rows.Count=0 then
    for i:=1 to q_rows.FieldCount+1 do
    Begin
      Filter2rows.Add('');
    end;

  if q_title.IsEmpty then exit;

  gbRows.Caption:=' ������� ��������� � '+q_title.FieldByName('VED_NUM').AsString+' ';

  if NOT Active then exit;
  // �������� ������ � �������� �����

end;

procedure Tf_VedOsmotr.acToXLSExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('���� ��� ����������! ����������?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,gridRows,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ���������� ���������
  with tf_VedOsmotrNew.create(self) do
  Begin
    EditId:=0;
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ��������������� �� ����������� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������������� ���������
  with tf_VedOsmotrNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsInteger;
    IsAdd:=false;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // �������������� �� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrRowsAddExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ���������� ������� ���������
  GridRows.SetFocus;
  q_rows.Append;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrRowsEditExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // �������������� ������� ���������
  q_rows.Edit;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrRowsCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;

  // ����������� ������� ���������
  q_rows.Append;
  // ��������� ����������� ����������
  q_rows.FieldByName('POD_DATE').AsVariant:=vPrevDate;
  q_rows.FieldByName('RAZMET_PER').AsVariant:=vPrevRazmetPer;
  q_rows.FieldByName('F_OST').AsVariant:=vPrevFOst;
  q_rows.FieldByName('PRIM').Asvariant:=vPrevPrim;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrRowsDelExecute(Sender: TObject);
var NextId:integer;
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  GridRows.SetFocus;
  
  // �������� ������� ���������
  if Application.MessageBox(PChar('������� ����� '+q_rowsNUM_CIST.AsString+' ?'),'��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Rows.DisableControls;
      pkgFOR_VED_OSMOTR.CallProcedure('DelRow',[1,q_Rows.FieldByName('ID').AsInteger]);
      q_Rows.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ������
    NextID:=q_Rows.FieldByName('ID').AsInteger;
    f_db.ReQuery(q_Rows,false);
    q_Rows.Locate('ID',NextId,[]);
    q_Rows.EnableControls;
    q_rowsAfterDelete(q_rows);
  End;
end;

procedure Tf_VedOsmotr.acPrintExecute(Sender: TObject);
var RepFileName:string;
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  RepFileName:='MO_VED_OSMOTR.XLS';

  with TempVari do
  begin
    SetVariNum('LOAD_TYPE_ID',DocLoadTypeId,APPLICATION_NAME,RepFileName);
    SetVariNum('MESTO_ID',DocMestoId,APPLICATION_NAME,RepFileName);
    SetVariNum('VED_OSMOTR_ID',q_title.FieldByName('ID').AsFloat,APPLICATION_NAME,RepFileName);
  end;

  F_FileUtils.CheckReport(RepFileName,f_main.TempNetPath+RepFileName);
  try
    F_FileUtils.ExecAndWait(f_main.TempNetPath+RepFileName,'',SW_SHOWMAXIMIZED,false);
  except
  end;
end;

procedure Tf_VedOsmotr.acFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

procedure Tf_VedOsmotr.acNoFilterExecute(Sender: TObject);
begin
  inherited;
  {}
end;

procedure Tf_VedOsmotr.acMOVedOsmotrCopyExecute(Sender: TObject);
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ����������� ���������
  with tf_VedOsmotrNew.create(self) do
  Begin
    EditId:=q_title.FieldByName('ID').AsInteger;
    IsAdd:=true;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // ��������������� �� ����������� ��������
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',EditId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    end;
    Free;
  end;
end;

procedure Tf_VedOsmotr.acMOVedOsmotrDelExecute(Sender: TObject);
var NextId:double;
begin
  inherited;
  // ��������
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // �������� ���������
  if Application.MessageBox('������� ������?','��������!',MB_YESNO)=IDYES then
  Begin
    try
      q_Title.DisableControls;
      pkgFOR_VED_OSMOTR.CallProcedure('DelTitle',[1,q_Title.FieldByName('ID').AsInteger]);
      q_Title.Next;
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      end;
    end;
    // ��������������� �� ��������� ��������
    NextID:=q_Title.FieldByName('ID').AsFloat;
    IsRefresh:=true;
    f_db.ReQuery(q_Title,false);
    q_Title.Locate('ID',NextId,[]);
    IsRefresh:=false;
    q_titleAfterScroll(q_title);
    q_Title.EnableControls;
  End;
end;

procedure Tf_VedOsmotr.GridTitleExit(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Post;
end;

procedure Tf_VedOsmotr.GridRowsExit(Sender: TObject);
begin
  inherited;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Post;
end;

procedure Tf_VedOsmotr.GridTitleSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_title,q_title.SQL.Count-1,GridTitle);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.GridRowsSortMarkingChanged(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.SortInGrid(q_rows,q_rows.SQL.Count-1,GridRows);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.tbTitleFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridTitle,filter2title,NewText,Accept);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.tbTitleFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridTitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.tbTitleFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridtitle,filter2title);
  IsRefresh:=false;
  q_titleAfterScroll(q_title);
end;

procedure Tf_VedOsmotr.tbTitleWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridTitle);
end;

procedure Tf_VedOsmotr.tbRowsFilterEditAcceptText(Sender: TObject;
  var NewText: String; var Accept: Boolean);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterAcceptText(gridRows,filter2rows,NewText,Accept);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.tbRowsFilterSelectionClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCurrentValue(gridRows,filter2rows);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.tbRowsFilterClearClick(Sender: TObject);
begin
  inherited;
  IsRefresh:=true;
  f_db.FilterCLear(gridRows,filter2rows);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.tbRowsWinEditClick(Sender: TObject);
begin
  inherited;
  f_db.EditInMemo(gridRows);
end;

procedure Tf_VedOsmotr.q_titleFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridTitle,filter2title);
end;

procedure Tf_VedOsmotr.q_rowsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept:=f_db.AcceptFilterRecord(gridRows,filter2rows);
end;

procedure Tf_VedOsmotr.q_titleAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  inherited;
  // ���������� Popup-�������
  if filter2title.Count=0 then
    for i:=1 to q_title.FieldCount+1 do
    Begin
      Filter2title.Add('');
    end;
end;

procedure Tf_VedOsmotr.q_rowsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.q_rowsAfterPost(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������
  IsRefresh:=true;
  f_db.ReQuery(q_title,true);
  IsRefresh:=false;
end;

procedure Tf_VedOsmotr.q_rowsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // �������� �� ���������
  q_rows.FieldByName('VED_ID').AsInteger:=q_title.FieldByName('ID').AsInteger;
  q_rows.FieldByName('POD_POS').AsFloat:=pkgFOR_VED_OSMOTR.CallFloatFunction('GetMaxNumPos',[q_title.FieldByName('ID').AsInteger]);
  q_rows.FieldByName('POD_DATE').AsDateTime:=q_title.FieldByName('FROM_DATE').AsDateTime;
  q_rows.FieldByName('F_OST').AsInteger:=0;
  q_rows.FieldByName('VAG_STATUS_ID').AsInteger:=0;
  if VarType(vPrevDate)<>varNull then
    q_rows.FieldByName('POD_DATE').AsDateTime:=vPrevDate;

  GridRows.SelectedField:=q_Rows.FieldByName('NUM_CIST');
end;

procedure Tf_VedOsmotr.q_rowsBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  // �������� ���������� ������
  vPrevDate:=q_rows.FieldByName('POD_DATE').AsVariant;
  vPrevNumcist:=q_rows.FieldByName('NUM_CIST').AsVariant;
  vPrevKalibr:=q_rows.FieldByName('KALIBR_ID').AsVariant;
  vPrevRazmetPer:=q_rows.FieldByName('RAZMET_PER').AsVariant;
  vPrevFOst:=q_rows.FieldByName('F_OST').AsVariant;
  vPrevPrim:=q_rows.FieldByName('PRIM').AsVariant;
  vPrevVagowner:=q_rows.FieldByName('VAGOWNER_ID').AsVariant;
  vPrevProd:=q_rows.FieldByName('PROD_ID_NPR').AsVariant;
  vPrevNcistdop:=q_rows.FieldByName('NCISTDOP').AsVariant;
end;

procedure Tf_VedOsmotr.q_titleBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // ��������� ������ �� �����
  q_title.SQL[6]:=' AND a.ved_date>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date1.Date)+' '+FormatDateTime('hh:mm',time1.Time)+':00'',''dd.mm.yyyy hh24:mi:ss'')';
  q_title.SQL[7]:=' AND a.ved_date<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',Date2.Date)+' '+FormatDateTime('hh:mm',time2.Time)+':59'',''dd.mm.yyyy hh24:mi:ss'')';
end;

procedure Tf_VedOsmotr.q_rowsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (vNextState=dsEdit) and (q_rows.State=dsBrowse) then
  Begin
    // �������� � ������ �������������� ��������� ���� ��������� �� ������ ����
    vNextState:=dsBrowse;
    q_rows.Edit;
    if GridRows.Columns[GridRows.Col-1].FieldName='POD_DATE' then
      if q_rows.FieldByName('POD_DATE').IsNull then
        q_rows.FieldByName('POD_DATE').AsVariant:=vPrevDate;
{    if GridRows.Columns[GridRows.Col-1].FieldName='RAZMET_PER' then
      if q_rows.FieldByName('RAZMET_PER').IsNull then
        q_rows.FieldByName('RAZMET_PER').AsVariant:=vPrevRazmetPer;}
    if GridRows.Columns[GridRows.Col-1].FieldName='NCISTDOP' then
      if q_rows.FieldByName('NCISTDOP').IsNull then
        q_rows.FieldByName('NCISTDOP').AsVariant:=vPrevNcistdop;
{    if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
      if q_rows.FieldByName('VAGOWNER_ID').IsNull then
        q_rows.FieldByName('VAGOWNER_ID').AsVariant:=vPrevVagowner;}
{    if GridRows.Columns[GridRows.Col-1].FieldName='PROD_NAME' then
      if q_rows.FieldByName('PROD_ID_NPR').IsNull then
        q_rows.FieldByName('PROD_ID_NPR').AsVariant:=vPrevProd;}
  End;
end;

procedure Tf_VedOsmotr.q_rowsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if q_rows.Active and (q_rows.FieldByName('NUM_CIST').AsString='') then
    q_rows.Cancel;
  if q_rows.Active then
    q_rowsPOD_DATE.AsDateTime:=TimeOf(q_rowsPOD_DATE.AsDateTime);
end;

procedure Tf_VedOsmotr.GridRowsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;
  if q_rows.IsEmpty then exit;

  if (Key=VK_DOWN) and (q_rows.State<>dsBrowse) then
  begin
    // ������ ������ "����" � ������ � ���� ������ ��������� � ������ ��������������,
    // ������ ����� ����� �������� �� ��������� ������, ����� ������� � ����� ��������������
    // � ��������� ���� ���������� �� ������� ������ (���� ��� ������)
    vNextState:=dsEdit;
  end
  else
  begin
    vNextState:=dsBrowse;
  end;
end;

procedure Tf_VedOsmotr.q_rowsNUM_CISTChange(Sender: TField);
var str:string;
begin
  inherited;
  if not q_title.Active then exit;
  if not q_rows.Active then exit;

  if (q_rows.State<>dsBrowse) then
  Begin
    // ������� ���������� �������
    try
      // 1.���������� ��� ������
      q_rows.FieldByName('VAGONTYPE_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGONTYPE',[Sender.Value,DocLoadTypeId]);
      // 2. ��������� ����� ������
      IF pkgFOR_CIST.CallIntegerFunction('CHECK_NUM_CIST',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat])=0 then
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,'�������� ����� ������: '+Sender.Value+' !',0,'');
      End;
      // 3.���������� ��������� ������
      q_rows.FieldByName('KALIBR_ID').AsString:=pkgFOR_CIST.CallStringFunction('GET_KALIBR',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('NCISTDOP').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_NCISTDOP',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VES_CIST').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VES_CIST',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('VAGOWNER_ID').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_VAGOWNER',[Sender.Value,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('CAPACITY').AsString:=pkgFOR_CIST.CallStringFunction('GET_CAPACITY',[Sender.Value,q_rows.FieldByName('KALIBR_ID').AsString,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('AXES').AsFloat:=pkgFOR_CIST.CallFloatFunction('GET_AXES',[Sender.Value,q_rows.FieldByName('KALIBR_ID').AsString,0,DocLoadTypeId,q_rows.FieldByName('VAGONTYPE_ID').AsFloat]);
      q_rows.FieldByName('PROD_ID_NPR').AsString:=pkgFOR_CIST.CallFloatFunction('GET_ID_NPR',[Sender.Value,DocLoadTypeId]);
    except
      on E:Exception do
      Begin
        f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,E.Message,0,'');
      end;
    end;

    // �������� ������ ������������� �������
    IF q_rowsVAGOWNER_ID.AsFloat=0 then
    Begin
      GridRows.SelectedField:=q_Rows.FieldByName('VAGOWNER_NAME');
      acRowsSpravExecute(Self);
    end;

    q_Rows.Post;
    q_Rows.Edit;

    // ����������, ��� ����� ������� ��������
    IF q_rowsLAST_PROD_ID_NPR.AsString<>'' then
    Begin
      q_rowsPROD_ID_NPR.AsString:=q_rowsLAST_PROD_ID_NPR.AsString;
      if (q_rowsLAST_PROD_ID_NPR.AsString='23950') or
         (q_rowsLAST_PROD_ID_NPR.AsString='23951') or
         (q_rowsLAST_PROD_ID_NPR.AsString='23971') then
      begin
        q_rowsPROD_ID_NPR.AsString:='11516';
      end;
    end;
//������� �������������� �� ������ ���� ��� ����
    q_cist_deni.SetVariable(':NUM_CIST',q_rowsNum_cist.Value);
    f_db.ReQuery(q_cist_deni,false);
    while not q_cist_deni.Eof do
    begin
      str:=str+q_cist_deni.FieldByName('num_cist').AsString+' '+q_cist_deni.FieldByName('beg_deni').AsString+' '+q_cist_deni.FieldByName('prim').AsString+#13#10;
      q_cist_deni.Next;
    end;
    if not q_cist_deni.IsEmpty then
    begin
        Application.MessageBox(Pchar(str),'��������!');
    end;
    q_cist_deni.Close;

  end;

end;

procedure Tf_VedOsmotr.acRowsPostExecute(Sender: TObject);
begin
  inherited;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);
end;

procedure Tf_VedOsmotr.acRowsCancelExecute(Sender: TObject);
begin
  inherited;
  if q_title.Active and (q_title.State<>dsBrowse) then q_title.Cancel;
  if q_rows.Active and (q_rows.State<>dsBrowse) then q_rows.Cancel;
end;

procedure Tf_VedOsmotr.acRowsSpravExecute(Sender: TObject);
var NewProd:string;
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  if q_title.IsEmpty then exit;

  // ��������� ���������
  GridTitleExit(Sender);
  if (q_rows.State = dsBrowse) and (acMOVedOsmotrRowsEdit.Enabled) and not q_rows.IsEmpty then q_rows.Edit;

  if GridRows.Columns[GridRows.Col-1].FieldName='VAGOWNER_NAME' then
  Begin
    // �������� ������ ������������� �������
    KlsMisc2.SetKLSParam('KLS_VAGOWNER_VED_OSMOTR','CHOOSE',fsNormal,q_rows.FieldByName('VAGOWNER_ID').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('VAGOWNER_ID').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

  if GridRows.Columns[GridRows.Col-1].FieldName='PROD_NAME' then
  Begin

    if q_rows.FieldByName('PROD_ID_NPR').AsString='' then
      NewProd:=q_rows.FieldByName('LAST_PROD_ID_NPR').AsString
    else
      NewProd:=q_rows.FieldByName('PROD_ID_NPR').AsString;

    // �������� ������ ���������
    KlsMisc2.SetKLSParam('KLS_PROD_VED_OSMOTR','CHOOSE',fsNormal,NewProd,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('PROD_ID_NPR').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;

  if GridRows.Columns[GridRows.Col-1].FieldName='NUM_CIST' then
  Begin
    // �������� ������ �������
    KlsMisc2.SetKLSParam('KLS_CIST_VED_OSMOTR','CHOOSE',fsNormal,q_rows.FieldByName('NUM_CIST').AsString,'',true);
    with TF_KlsMisc.Create(Self) do
    begin
      if ShowModal=mrOk then
      if (q_rows.State <> dsBrowse) then
      begin
        q_rows.FieldByName('NUM_CIST').AsString:=KlsMisc2.vIdToSeek;
      end;
      Free;
    end;
  end;
end;

procedure Tf_VedOsmotr.q_rowsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  q_rows.SetVariable('VED_DATE',q_titleVED_DATE.AsDateTime);
  q_rows.SetVariable('VED_NUM',q_titleVED_NUM.AsFloat);
end;

procedure Tf_VedOsmotr.acVedOsmotrMoveVagonExecute(Sender: TObject);
var ExceptId,tmp:double;
    i,c:integer;
begin
  inherited;
  // ��������
  if not q_rows.Active then exit;
  if q_title.IsEmpty then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  // ������� ����� ��� �������������� � �����
  with tf_MoveVagon.create(self) do
  Begin
    ReturnID:=-1;
    q_Source.Session:=ora_Session;
    q_Source.SQL:=q_Title.SQL;
    ExceptId:=q_Titleid.Value;
    c:=-1;
    for i:=0 to q_Source.SQL.Count-1 do
      if Trim(q_Source.SQL[i])='AND 1=1' then c:=i;
    if c<>-1 then q_Source.SQL[c]:='AND ID<>'+F_ForSystem.RealToStr(ExceptId);
    q_Source.DeclareVariable(':MESTO_ID',otInteger);
    q_Source.DeclareVariable(':LOAD_TYPE_ID',otInteger);
    q_Source.DeclareVariable(':TITLE_ID',otInteger);
    q_Source.SetVariable(':MESTO_ID',DocMestoID);
    q_Source.SetVariable(':LOAD_TYPE_ID',DocLoadTypeID);
    q_Source.SetVariable(':TITLE_ID',DocTitleID);
    ParentFormName:=Self.Name;
    Caption:='����������� ������ '+q_RowsNUM_CIST.AsString+' � ������ ��������� ���������������� �������';
    ShowModal;
    if ModalResult=mrOk then
    try
      q_title.DisableControls;
      tmp:=pkgFOR_VED_OSMOTR.CallFloatFunction('MoveRow',[1,q_rowsID.Value,ReturnId]);
      IsRefresh:=true;
      f_db.ReQuery(q_Title,false);
      q_Title.Locate('ID',ReturnId,[]);
      IsRefresh:=false;
      // �������� � ������������ ����������� �������
      q_titleAfterScroll(q_title);
    finally
      q_Title.EnableControls;
    end;
    free;
  end;
  //���������� ������������� ������

end;

procedure Tf_VedOsmotr.acReportLastGruzExecute(Sender: TObject);
begin
  inherited;
  if q_Title.IsEmpty or q_Title.IsEmpty then exit;
  with TF_ForReport.Create(f_main) do
  begin
      Caption:='�������� � ��������� ����� �� '+FormatDateTime('hh:mm',Time())+' '+FormatDateTime('dd.mm.yyyy',Date());
      Crpe.ReportName:=F_FileUtils.CheckReport('ved_osmotr_last_gruz.rpt',f_main.TempNetPath);
      Crpe.ParamFields[0].CurrentValue := q_titleId.AsVariant;
      Crpe.Execute;
  end;
end;

procedure Tf_VedOsmotr.ExecuteSearch();
begin
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:=0;
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_VED_OSMOTR');
    memo1.Lines:=q_title.SQL;
    ShowModal;
    if ModalResult=mrOk then
    Begin
      // �������������� �� ��������� ��������
      DocTitleid:=TempVari.GetAsNum('TITLE_ID_FIND');
      //�� ��������� ������� �������� ���������� ���������� ��������� �.�. ��� ����� ��������� 1 ���� � ����
      TempVari.SetVariNum('TITLE_ID_FIND',-1);
      try
        q_Title.DisableControls;
        q_Title.SetVariable(':TITLE_ID',DocTitleId);
        IsRefresh:=true;
        f_db.ReQuery(q_Title,false);
        q_title.Locate('ID',DocTitleID,[loCaseInsensitive]);
        IsRefresh:=false;
        // �������� � ������������ ����������� �������
        q_titleAfterScroll(q_title);
      finally
        q_Title.EnableControls;
      end;
    end;
    Free;
  end;
end;

procedure Tf_VedOsmotr.acFindExecute(Sender: TObject);
begin
  inherited;
  if not q_rows.Active then exit;
  if not q_title.Active then exit;
  // ��������� ���������
  GridTitleExit(Sender);
  GridRowsExit(Sender);

  ExecuteSearch;
end;

procedure Tf_VedOsmotr.CheckTime(Sender: TObject);
begin
  inherited;
  if (DateOf(Date2.DateTime)<DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime;

  if (TimeOf(Time2.DateTime)<TimeOf(Time1.DateTime)) and
     (DateOf(Date2.DateTime)=DateOf(Date1.DateTime)) then
    Date2.DateTime:=Date1.DateTime+1;
end;

procedure Tf_VedOsmotr.q_rowsRAZMET_PERValidate(Sender: TField);
begin
  inherited;
  if q_razmet.Locate('RAZMET',ANSIUpperCase(Trim(q_rowsRazmet_per.AsString)),[loCaseInsensitive]) AND
    (Trim(q_razmet.FieldByName('PROD_ID_NPR').AsString)<>'')
  then q_rowsPROD_ID_NPR.Value:=q_razmet.FieldByName('PROD_ID_NPR').AsString;
end;

procedure Tf_VedOsmotr.acLastReisExecute(Sender: TObject);
begin
  inherited;
  with tf_FindVagon.create(self) do
  Begin
    DocTitleID:=0;
    q_Source.Session:=ora_Session;
    q_Structure.Session:=ora_Session;
    q_Structure.SetVariable(':STRUCTURE','FIND_LAST_REIS');
    acSelPosition.Enabled:=false;
    acSelPosition.Visible:=false;
    memo1.Lines:=q_title.SQL;
    cbSearchStr.text:=q_rowsNUM_CIST.AsString;
    ShowModal;
    Free;
  end;

end;

procedure Tf_VedOsmotr.GridRowsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if q_rowsBad_num.Value=1 then Background:=clRed
  else if q_rowsVAG_STATUS_ID.Value<>0 then Background:=clSilver;
end;

end.
