unit catalogSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, sourceTree, oracle;

type
  Tf_filter = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    CheckBox1: TCheckBox;
    procedure ComboBox1DropDown(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure AddSubCatalog(list: TList; rn: integer);

  public
    catalog:  integer;
    startDate, endDate: string;
    catalogList:  TList;  //список каталогов (типа integer)
  end;

var
  f_filter: Tf_filter;

implementation

uses data, treeView;

{$R *.dfm}

procedure Tf_filter.ComboBox1DropDown(Sender: TObject);
var
p:  TPoint;
sourceTree: TSourceTree;
n:  TTreeNode;
begin
  DM.tempQ2.SQL.Clear;
  DM.tempQ2.SQL.Add('select rn, name from v_acatalog where crn is null and ' +
    ' unitcode=''GoodsTransInvoicesToDepts''');
  DM.tempQ2.Execute;

  p := ClientToScreen(Point(combobox1.Left, combobox1.Top));
  f_treeForm := TF_treeForm.Create(Application);
//  n := f_treeForm.TreeView1.Items.Add(nil, DM.tempQ2.Field('name'));
  
  sourceTree := TSourceTree.Create(f_treeForm.TreeView1, nil);
{  f_treeForm.TreeView1.Items.Clear;
  sourceTree.FillTree(f_treeForm.TreeView1);}
  f_treeForm.Top := p.y;
  f_treeForm.Left := p.x;
  f_treeForm.ShowModal;
  combobox1.Text := f_treeForm.nameNode;
  catalog := f_treeForm.rn;
  f_treeForm.Free;
  update;
end;

procedure Tf_filter.DateTimePicker1Change(Sender: TObject);
begin
  startDate := DateToStr(DateTimePicker1.Date);
end;

procedure Tf_filter.DateTimePicker2Change(Sender: TObject);
begin
  endDate := DateToStr(DateTimePicker2.Date);
end;

procedure Tf_filter.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := date;
  DateTimePicker2.Date := date;  
end;

procedure Tf_filter.FormCreate(Sender: TObject);
begin
  catalogList := TList.Create;
end;

procedure Tf_filter.BitBtn1Click(Sender: TObject);
var
newC: ^integer;
begin
  new(newC);
  newC^ := catalog;
  catalogList.Add(newC);

  startDate := DateToStr(DateTimePicker1.date);
  endDate := DateToStr(DateTimePicker2.date);  

  if checkbox1.Checked = true then //создаем список подкаталогов выбранного каталога
    AddSubCatalog(catalogList, catalog);

end;

procedure Tf_filter.AddSubCatalog(list: TList; rn: integer);
//добавляем в список подкаталоги
var
resQ: TOracleQuery;
newI: ^integer;
i:  integer;
begin
  resQ := TOracleQuery.Create(nil);
  resQ.Session := DM.OracleSession1;

  resQ.SQL.Clear;
  resQ.SQL.Add('select rn from v_acatalog where crn=' +
    IntToStr(rn));
  resQ.Execute;

//  new(newI);
//  newI^ := rn;
//  list.Add(newI);
  
  while not resQ.Eof do begin
    new(newI);
    newI^ := resQ.Field('rn');
    list.Add(newI);
    //входим в рекурсию
    AddSubCatalog(list, newI^);
  
    resQ.Next;
  end;
  
  resQ.Free;
end;

end.
