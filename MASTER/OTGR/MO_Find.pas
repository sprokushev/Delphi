unit MO_Find;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, DB, OracleData, StdCtrls,
  Grids, DBGridEh, ToolWin, ActnCtrls, Oracle,StrUtils,DBGridEhImpExp,RxShell,
  TB2Item, Menus;

type
  Tf_FindVagon = class(TForm)
    ActionToolBar1: TActionToolBar;
    DBGrid1: TDBGridEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    q_Source: TOracleDataSet;
    amFindVagon: TActionManager;
    acStarSearch: TAction;
    acSelPosition: TAction;
    acClose: TAction;
    q_Structure: TOracleDataSet;
    cbSearchStr: TComboBox;
    ds_Source: TDataSource;
    acToogleParentSQL: TAction;
    Memo1: TMemo;
    pkgFor_temp_f: TOraclePackage;
    PopupTitle: TTBPopupMenu;
    acToXLS: TAction;
    SaveDialog1: TSaveDialog;
    TBItem1: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem2: TTBItem;
    procedure acCloseExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acStarSearchExecute(Sender: TObject);
    procedure acSelPositionExecute(Sender: TObject);
    function CheckType(str:string):string;
    procedure acToogleParentSQLExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure acToXLSExecute(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_FindVagon: Tf_FindVagon;

implementation

{$R *.dfm}
uses main,forSess, ForTemp, ForDB;

procedure Tf_FindVagon.acCloseExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_FindVagon.FormActivate(Sender: TObject);
var
  GridCol:TColumnEh;

begin
  f_db.ReQuery(q_Structure,false);
  While not q_Structure.Eof do
  begin
    GridCol:=dbGrid1.Columns.Add;
    GridCol.Title.Caption:=q_Structure.FieldByName('field_caption').AsString;
    GridCol.FieldName:=q_Structure.FieldByName('field_name').AsString;
    q_Structure.Next;
  end;
  acSelPosition.Enabled:=false;
end;
{==============================================================================}
{Функция получает строку с типом, пробует конверт, если неудачно возвращает С  }
{==============================================================================}
function Tf_FindVagon.CheckType(str:string):string;
var res:string;
    DT:TDateTime;
    D:double;
begin
  if TryStrToDate(str,DT) then
    Res:='D'
  else
    if TryStrToFloat(str,D) then
      Res:='N'
    else
      Res:='C';
  CheckType:=Res;
end;

procedure Tf_FindVagon.acStarSearchExecute(Sender: TObject);
var
  WhereStr:string;
  s:string;
  f_type:string;//строка для проверки типа введенного значения
begin
  if cbSearchStr.Text='' then exit;
  if q_Structure.IsEmpty then exit;
  q_Source.SQL.Clear;
  q_Source.SQL.Add(q_Structure.FieldByName('QUERY').AsString);
  //формирование строки WHERE
  f_type:=CheckType(cbSearchStr.Text);

  with q_Structure do
  begin
    First;
    While not Eof do
    begin
      // Символьный тип
      if FieldByName('FIELD_TYPE').AsString='C' then
      Begin
        if FieldByName('REL_OPER').AsString='=' then
        Begin
          s:=Trim(cbSearchStr.Text);
          s:=StrUtils.AnsiReplaceStr(s,';',',');
          s:=StrUtils.AnsiReplaceStr(s,',',''',''');
          WhereStr:=WhereStr+FieldByName('FIELD_NAME').AsString+' IN ('''+s+''') OR '
        end
        else
          WhereStr:=WhereStr+FieldByName('FIELD_NAME').AsString+' LIKE ''%'+Trim(cbSearchStr.Text)+'%'' OR ';
      end;

      // Прочие типы
      if UpperCase(FieldByName('FIELD_TYPE').AsString)=f_type then
      begin
        if UpperCase(f_type)='N' then
          WhereStr:=WhereStr+FieldByName('FIELD_NAME').AsString+' IN ('+Trim(cbSearchStr.Text)+') OR ';
        if UpperCase(f_type)='D' then
            WhereStr:=WhereStr+FieldByName('FIELD_NAME').AsString+'=TO_DATE('+QuotedStr(Trim(cbSearchStr.Text))+',''dd.mm.yyyy'') OR ';
      end;//if

      Next;
    end;//while
    WhereStr:='WHERE '+LeftStr(WhereStr,Length(WhereStr)-4);
  end;//with
//  application.MessageBox(pchar(wherestr),'!');
  q_Source.SQL.Add(WhereStr);
  q_structure.First;
  q_Source.SQL.Add('ORDER BY '+q_Structure.FieldByName('START_ORDER').AsString);
  memo1.lines:=q_Source.SQL;
  q_Source.Close;
  try
    f_db.ReQuery(q_Source,false);
  except
    on E:Exception do
    Begin
      f_main.ApplSession.WriteToLog(amFull,'MO_Find',sesError,E.Message,0,'');
    end;
  end;
  if q_Source.IsEmpty then acSelPosition.Enabled:=false
  else acSelPosition.Enabled:=true;
  DBGrid1.SetFocus;
end;

procedure Tf_FindVagon.acSelPositionExecute(Sender: TObject);
begin
  if q_Source.IsEmpty then exit;
//установка значения переменной TITLE_ID_FIND
//SET_VARI(pVariName VARCHAR2, PVariValue VARCHAR2, pAppName VARCHAR2:='', pUnitName VARCHAR2:='', pTime NUMBER := 1) RETURN NUMBER
  TempVari.SetVariNum('TITLE_ID_FIND',q_Source.FieldByName('TITLE_ID').value);
  ModalResult:=mrOk;
end;

procedure Tf_FindVagon.acToogleParentSQLExecute(Sender: TObject);
begin
  memo1.Visible:=not memo1.Visible;
end;

procedure Tf_FindVagon.DBGrid1DblClick(Sender: TObject);
begin
  if acSelPosition.Enabled AND acSelPosition.Visible then acSelPositionExecute(Self);
end;

procedure Tf_FindVagon.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     if acSelPosition.Enabled AND acSelPosition.Visible then acSelPositionExecute(Self);
end;

procedure Tf_FindVagon.DBGrid1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  try
    Params.Text:=IntToStr(q_Source.RecNo);
  except
    Params.Text:='0';
  end;
end;

procedure Tf_FindVagon.acToXLSExecute(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGrid1,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGrid1,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;

end;

procedure Tf_FindVagon.TBItem2Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,DBGrid1,q_Source.SQL.Text,q_source);
end;

end.
