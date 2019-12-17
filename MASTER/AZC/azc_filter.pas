unit azc_filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,azc, StdCtrls, Strutils, ExtCtrls, RxLookup, Oracle,main, DB,
  OracleData, Mask, ToolEdit;

type
  Tf_azc_filter = class(TForm)
    Button1: TButton;
    ODS_query: TOracleDataSet;
    DS_query: TDataSource;
    procedure FormCreate(dataset_u:TOracleDataSet ;tstr_filter:TStringList); reintroduce;
    procedure Button1Click(Sender: TObject);
  private
    function change_name(for_change: string): string;
    procedure create_obj(flag: string);
    procedure OnEventCheckbx(Sender: TOBject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_azc_filter: Tf_azc_filter;
  Checkbx:TCheckBox;
  lookup :TRxLookUpEdit;
  edit:TEdit;
  ODS: TORacleDataSet;
  DS: TDataSource;
  edit_date:TDateEdit;
  begin_index:boolean;
  tstr_filter_:TStringList;
  dataset_u_:TOracleDataSet;




  i:integer;
  str_sql_addon:string;
implementation


{$R *.dfm}
procedure Tf_azc_filter.FormCreate(dataset_u:TOracleDataSet;tstr_filter:TStringList);
var
a,b:integer;
begin
tstr_filter_:=TStringList.Create;
tstr_filter_:=tstr_filter;
dataset_u_:=TOracleDataSet.Create(self);
dataset_u_:=dataset_u;
begin_index:=false;
ODS_query.SQL.Clear;
ODS_query.SQL.Add('select * ');
ODS_query.SQL.Add('from azc_sys_comm A , azc_sys_fields B , azc_sys_page C');
ODS_query.SQL.Add('where A.ID_FIELD = B.ID');
ODS_query.SQL.Add('and A.ID_PAGE = C.ID');
ODS_query.SQL.Add('and C.NAME ='''+  azc.vs_TAbSheet+'''');
ODS_query.SQL.Add('ORDER BY B.QUERY_, A.ORDER_');
ODS_query.Open;
ODS_query.First;

str_sql_addon:='';
SELF.Height:= (ODS_Query.RecordCount+2)*30;
Button1.Top:=(ODS_Query.RecordCount)*30;

for i:= 0 to ODS_QUERY.RecordCount-1 do
begin

Create_obj(ODS_QUERY.FieldByName('TYPE_OBJ').AsString);
ODS_query.Next;
end;


a:=(Self.ControlCount -1) div 2;

If tstr_filter_.Count>0 then
for i:=0 to tstr_filter_.Count-1 do
begin
A:=strtoint (tstr_filter_.Strings[i]);
TCheckBox(Controls[a-1]).Checked :=true;
self.Controls[strtoint(tstr_filter_.Strings[i])].Enabled:=true;
end;
begin_index:=true;
end;


procedure Tf_azc_filter.Button1Click(Sender: TObject);
var
ch_name:string;
begin
tstr_filter_.Clear;
str_sql_addon:= '';
for i:=0 to Self.ControlCount - 1 do
begin
IF (Self.Controls[i].ClassName=TRxLookupEdit.ClassName) and (Self.Controls[i].enabled=true) then
begin
ch_name:=TRxLookupEdit(Controls[i]).LookupField;
str_sql_addon:= str_sql_addon + ' and '+TRxLookupEdit(Controls[i]).Hint + '='''+ TRxLookupEdit(Controls[i]).LookupSource.DataSet.fieldByNAME (ch_name).AsString+'''';
tstr_filter_.Add(inttostr(i));
end;

IF (Self.Controls[i].ClassName=TEdit.ClassName) and (Self.Controls[i].enabled=true) then
begin
str_sql_addon:= str_sql_addon + ' and '+TEdit(Controls[i]).Hint + '='+TEdit(Controls[i]).Text;
tstr_filter_.Add(inttostr(i));
end;

IF (Self.Controls[i].ClassName=TDateEdit.ClassName) and (Self.Controls[i].enabled=true) then
begin
str_sql_addon:= str_sql_addon + ' and  trunc('+TDateEdit(Controls[i]).Hint + ') = to_date ('''+TDateEdit(Controls[i]).Text+ ''', ''dd-mm-yy'')';
tstr_filter_.Add(inttostr(i));
end;


end;
ODS.Close;
dataset_u_.Close;
dataset_u_.SQL[8]:=str_sql_addon;
dataset_u_.open;
dataset_u_:=nil;
dataset_u_.free;
tstr_filter_:=nil;
tstr_filter_.Free;
self.Close;
end;


// ф-ия для замены name as....  так как нек-ые поля одноименны - для исключений
Function TF_azc_filter.change_name(for_change:string):string;
begin
end;



procedure TF_azc_filter.OnEventCheckbx (Sender:TOBject);
begin
If begin_index=true then
begin
If TCheckBox(Sender).Checked = true then
For i:=0 to Self.ControlCount -1 do
begin
IF Self.Controls[i].Name = 'lookup_'+ TCheckBox(Sender).Name then
self.Controls[i].Enabled:=true;
end
else
For i:=0 to Self.ControlCount -1 do
begin
IF Self.Controls[i].Name = 'lookup_'+ TCheckBox(Sender).Name then
self.Controls[i].Enabled:=false;
end
end;
end;


procedure TF_azc_filter.create_obj(flag:string);
var
s_var:string;
j:integer;
begin


CheckBx:=TCheckBox.Create(self);
Checkbx.Parent:= self;
Checkbx.Left:=10;
//NAME - название таблицы и поля - для зарпоса
//ALIAS_- навзание испольхуемое в гридах
//NoTE - навзание лейблов
//TYPE_OBJ - тип объекта (edit, lookup)
Checkbx.name:= ODS_query.fieldbyname('ALIAS_').AsString;
Checkbx.Caption:=ODS_query.fieldbyname('NOTE').AsString;
Checkbx.Top:=i * 30;
Checkbx.Width:=153;
Checkbx.OnClick:= OnEventCheckbx;


IF Flag='LOOKUP' then begin
lookup:=TRxLookupedit.Create(self);
lookup.Parent:=self;
lookup.Name:='lookup_'+ODS_query.fieldbyname('ALIAS_').AsString;
lookup.top:=30*(i);
lookup.Left:=130;
lookup.Text:='';
ODS:=TOracleDataSet.Create(self);
ODS.Name:='ODS_'+ODS_query.fieldbyname('ALIAS_').AsString;
ODS.SQL.Add(ODS_query.fieldbyname('QUERY_').AsString);
ODS.Session:=f_main.ora_Session;
DS:=TDataSource.Create(self);
DS.Name:='DS_'+ ODS_query.fieldbyname('ALIAS_').AsString;
DS.DataSet:=ODS;
s_var:=ODS_query.fieldbyname('NAME').AsString;
lookup.LookupSource:=DS;
lookup.Hint:=ODS_query.fieldbyname('NAME').AsString;
lookup.LookupField:=AnsiMidStr( s_var, AnsiPos('.',s_var)+1, Length(s_var)-AnsiPos('.',s_var));
lookup.LookupDisplay:=AnsiMidStr( s_var, AnsiPos('.',s_var)+1, Length(s_var)-AnsiPos('.',s_var));
lookup.Width:=153;
ODS.Open;
s_var:=AnsiMidStr( s_var, AnsiPos('.',s_var)+1, Length(s_var)-AnsiPos('.',s_var));
IF ODS.Locate(s_var,dataset_u_.fieldbyname(ODS_query.fieldbyname('ALIAS_').AsString).AsString,[])
then ODS.UpdateCursorPos;
Lookup.LookupValue:=ODS.fieldbyname(s_var).AsString ;
Lookup.Enabled:=false;
end;
IF FLAG='EDIT' THEN
begin
edit:=TEdit.Create(self);
edit.Parent:=self;
edit.Name:='lookup_'+ ODS_query.fieldbyname('ALIAS_').AsString;
edit.top:=30*(i);
edit.Left:=130;
edit.Hint:= ODS_query.fieldbyname('NAME').AsString;
Edit.Text:= dataset_u_.fieldbyname(ODS_query.fieldbyname('ALIAS_').AsString).AsString;
Edit.Enabled:=false;
edit.Width:= 153;
end;
IF FLAG = 'DATE' THEN
begin
edit_date:=TDateEdit.Create(self);
edit_date.Parent:=self;
edit_date.Name:='lookup_'+ ODS_query.fieldbyname('ALIAS_').AsString;
edit_date.top:=30*(i);
edit_date.Left:=130;
edit_date.CalendarStyle:=csDialog;
edit_date.Hint:= ODS_query.fieldbyname('NAME').AsString;
edit_date.Date := dataset_u_.fieldbyname(ODS_query.fieldbyname('ALIAS_').AsString).AsDateTime;
edit_date.Enabled:=false;
end;
end;



end.
