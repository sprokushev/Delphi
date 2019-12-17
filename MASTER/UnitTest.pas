unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ComCtrls;

type
  TFormTest = class(TForm)
    BitBtn1: TBitBtn;
    EditNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditDate: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNumReserv(cnt_to_bills:integer;DateKvit:TDateTime):integer;
  end;

var
  FormTest: TFormTest;

implementation

uses ForSystem;

{$R *.dfm}

{ Проверить и зарезервировать номера СФ
  cnt_to_bills - сколько номеров зарезервировать
  DateKvit - дата отгрузки
  Возвращает первый из зарезервированных номеров }
function TFormTest.GetNumReserv(cnt_to_bills:integer;DateKvit:TDateTime):integer;
var q_cmn:TADOQuery;
    SelectSQL:string;
    UpdateSQL:string;
    Res:integer;
Begin

  // Подготовить таблицу-назначение
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF;Extended Properties="DSN=PF;UID=;SourceDB=U:\LUK\DBASES\;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';

  // Проверяем на наличие резерва номеров
  SelectSQL:='SELECT start_num,curr_num,range FROM ''U:\luk\BUXGALT\SCHETA\DBF\numbers.dbf'' WHERE ' +
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'>=start_date and '+
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'<=end_date';
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add(SelectSQL);
  Res:=0;
  try
    q_cmn.Open;
  except
    Res:=-1;
  end;
  if Res=0 then
  Begin
    if q_cmn.FieldByName('range').AsInteger-(q_cmn.FieldByName('curr_num').AsInteger-q_cmn.FieldByName('start_num').AsInteger)>=cnt_to_bills then
    begin
      // Резерв номеров достаточен
      Res:=q_cmn.FieldByName('curr_num').AsInteger;
      // Резервируем
      UpdateSQL:='UPDATE ''U:\luk\BUXGALT\SCHETA\DBF\numbers.dbf'' SET curr_num='+IntToStr(q_cmn.FieldByName('curr_num').AsInteger+cnt_to_bills)+' WHERE ' +
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'>=start_date and '+
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'<=end_date';
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add(UpdateSQL);
        q_cmn.ExecSQL;
      except
        Res:=-1;
      end;
    end;
  end;
  q_cmn.Close;;
  q_cmn.SQL.Clear;
  q_cmn.free;
  if Res=0 then
  Begin
    Application.MessageBox(PChar('Необходимо добавить резерв номеров!'),'Внимание!',MB_OK);
  end;
  if Res=-1 then
  Begin
    Application.MessageBox(PChar('Ошибка при резервировании номеров СФ!'),'Внимание!',MB_OK);
  end;
  Result:=res;
End;


procedure TFormTest.BitBtn1Click(Sender: TObject);
var FirstNum,cnt:integer;
begin
  cnt:=F_ForSystem.StrToInteger(EditNum.Text);
  if (cnt>0) then
  Begin
    FirstNum:=GetNumReserv(cnt,EditDate.Date);
    Application.MessageBox(PChar(IntToStr(FirstNum)),'Внимание!',MB_OK);
  end;
end;

end.
