unit MetaPlanMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, DB, ADODB, TB2Dock, TB2Toolbar,
  TB2Item, ActnList, Menus, mdiForm;

type
  Tf_MetaPlanSetup = class(TF_MDIForm)
    StatusBar1: TStatusBar;
    DB: TADOConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    oTree: TTreeView;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    ActionList1: TActionList;
    ReFreshOrganization: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    zTree: TTreeView;
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    ReFreshExpense: TAction;
    procedure FormShow(Sender: TObject);
    procedure ReFreshOrganizationExecute(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure ReFreshExpenseExecute(Sender: TObject);
    procedure TBItem4Click(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure TBItem6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function GetID: integer;
    function GetIDexpense: integer;
    procedure CreateTreeOrganization(node: TTreeNode);
    procedure CreateTreeExpense(node: TTreeNode);
  end;

var
  f_MetaPlanSetup: Tf_MetaPlanSetup;

implementation

uses selectRoot;

{$R *.dfm}

procedure Tf_MetaPlanSetup.CreateTreeExpense(node: TTreeNode);
//создать дерево затрат
var
n:  TTreeNode;
r:  _RecordSet;
id: ^integer;
begin
  id := node.Data;
  r := DB.Execute('select * from expense_line where master_id=' +
    IntToStr(id^));

  if r.RecordCount = 0 then
    exit;
  r.MoveFirst;
  while not r.EOF do begin
    //вставляем родителя
    n := zTree.Items.AddChild(node, r.Fields[1].Value);
    new(id);
    id^ := r.Fields[0].Value;
    n.Data := id;
    //теперь создаем ветку внутри
    CreateTreeExpense(n);
    r.MoveNext;
  end;

end;

procedure Tf_MetaPlanSetup.CreateTreeOrganization(node: TTreeNode);
//строим структуру организаций
var
n:  TTreeNode;
r:  _RecordSet;
id: ^integer;
begin
  id := node.Data;
  r := DB.Execute('select * from organization where master_id=' +
    IntToStr(id^));

  if r.RecordCount = 0 then
    exit;
  r.MoveFirst;
  while not r.EOF do begin
    //вставляем родителя
    n := oTree.Items.AddChild(node, r.Fields[1].Value);
    new(id);
    id^ := r.Fields[0].Value;
    n.Data := id;
    //теперь создаем ветку внутри
    CreateTreeOrganization(n);
    r.MoveNext;
  end;
  
end;

procedure Tf_MetaPlanSetup.FormShow(Sender: TObject);
begin
//  SelectRootDlg := TSelectRootDlg.Create(Self);
  Application.CreateForm(TSelectRootDlg, SelectRootDlg);
  SelectRootDlg.ShowModal;

  ReFreshOrganization.Execute;
  ReFreshExpense.Execute;
end;

function Tf_MetaPlanSetup.GetID: integer;
//получаем уникальный ИДЕ для организации
var
r:  _RecordSet;
res:  integer;
begin
  r := DB.Execute('select max(organization_id) from organization');

  res := r.Fields[0].Value;

  getID := res + 1;
end;

procedure Tf_MetaPlanSetup.ReFreshOrganizationExecute(Sender: TObject);
var
n:    TTreeNode;
id:   ^integer;
begin
  oTree.Items.Clear;
  n := oTree.Items.AddChild(nil, SelectRootDlg.ADOTable1.FieldValues['name']);
  new(id);
  id^ := SelectRootDlg.ADOTable1.FieldValues['organization_id'];
  n.Data := id;
  CreateTreeOrganization(n);
end;

procedure Tf_MetaPlanSetup.TBItem1Click(Sender: TObject);
//добавить потомка
var
n:    TTreeNode;
par:  TTreeNode;
idPar, id:   ^integer;
name: string;
q:    string;
r:    _RecordSet;
begin
  par := oTree.Selected;

  idPar := par.Data;

//есть ли издержки по этому подразделению
  r := DB.Execute('select * from expense where organization_id=' + intToStr(idPar^));
  if r.RecordCount > 0 then begin
    ShowMessage('Это подразделение нельзя разбить, по нему есть затраты.');
    exit;
  end;

  name := InputBox('', 'Введите имя организации', '');
  if name <> '' then begin
    n := oTree.Items.AddChildFirst(par, name);
    new(id);
    id^ := GetID;
    n.Data := id;
    q := 'insert into organization(organization_id, name, master_id, hierarchy_id) values('
      + IntToStr(id^) + ', ''' + name + ''', ' + IntToStr(idPar^) + ', ' +
      intToStr( SelectRootDlg.ADOTable1.FieldValues['hierarchy_id'] ) + ')';
    DB.Execute(q);
  end;
end;

procedure Tf_MetaPlanSetup.TBItem2Click(Sender: TObject);
//удаляем потомка
var
id:   ^integer;
n:    TTreeNode;
r:  _RecordSet;
begin
  n := oTree.Selected;
  id := n.Data;

  r := DB.Execute('select * from expense where organization_id=' + intToStr(id^));
  if r.RecordCount > 0 then begin
    ShowMessage('Это подразделение нельзя удалить, по нему есть затраты.');
    exit;
  end;

  if n.HasChildren = true then begin
    ShowMessage('Вы не можете удалить целую группу');
//    If Application.MessageBox('Будут удалены все подразделения, относящиеся к этому элементу! Продолжить?',
//      'Внимание', MB_YESNO) = IDYES then begin
//      ShowMessage('удаляем группу');
//    end
  end
  else begin
    DB.Execute('delete from organization where organization_id = ' +
      IntToStr(id^));
    oTree.Items.Delete(n);
  end;
end;

procedure Tf_MetaPlanSetup.TBItem3Click(Sender: TObject);
var
id:   ^integer;
n:    TTreeNode;
name: string;
begin
  n := oTree.Selected;
  id := n.Data;
  name := n.Text;

  name := inputBox('', 'Введите новое имя', name);

  n.Text := name;

  DB.Execute('update organization set name = ''' + name +
    ''' where organization_id = ' + IntToStr(id^));
end;

procedure Tf_MetaPlanSetup.ReFreshExpenseExecute(Sender: TObject);
var
r:  _recordSet;
n:  TTreeNode;
id: ^integer;
begin
  r := DB.Execute('select * from expense_line where master_id is null');

  if r.RecordCount = 0 then begin
    ShowMessage('В дереве затрат отсутствует корневой элемент');
    exit;
  end;

  zTree.Items.Clear;
  r.MoveFirst;
  while not r.EOF do begin
    n := zTree.Items.AddChild(nil, r.Fields[1].value);
    new(id);
    id^ := r.Fields[0].Value;
    n.Data := id;
    CreateTreeExpense(n);
    r.MoveNext;
  end;
end;

procedure Tf_MetaPlanSetup.TBItem4Click(Sender: TObject);
//добавить затрату
var
n:    TTreeNode;
par:  TTreeNode;
idPar, id:   ^integer;
name: string;
q:    string;
begin
  par := zTree.Selected;

  name := InputBox('', 'Введите наименование затраты', '');
  n := zTree.Items.AddChildFirst(par, name);

  new(id);
  id^ := GetIDexpense;
  n.Data := id;

  idPar := par.Data;

  q := 'insert into expense_line(expense_line_id, name, master_id) values('
    + IntToStr(id^) + ', ''' + name + ''', ' + IntToStr(idPar^) + ')';
  DB.Execute(q);
end;

function Tf_MetaPlanSetup.GetIDexpense: integer;
//получаем уникальный ИДЕ для затраты
var
r:  _RecordSet;
res:  integer;
begin
  r := DB.Execute('select max(expense_line_id) from expense_line');

  res := r.Fields[0].Value;

  getIDexpense := res + 1;
end;

procedure Tf_MetaPlanSetup.TBItem5Click(Sender: TObject);
//удаляем затрату
var
id:   ^integer;
n:    TTreeNode;
begin
  n := zTree.Selected;
  id := n.Data;
  if n.HasChildren = true then begin
    ShowMessage('Вы не можете удалить целую группу');
  end
  else begin
    DB.Execute('delete from expense_line where expense_line_id = ' +
      IntToStr(id^));
    zTree.Items.Delete(n);
  end;
end;

procedure Tf_MetaPlanSetup.TBItem6Click(Sender: TObject);
//переименовать затрату
var
id:   ^integer;
n:    TTreeNode;
name: string;
begin
  n := zTree.Selected;
  id := n.Data;
  name := n.Text;

  name := inputBox('', 'Введите новое имя', name);

  n.Text := name;

  DB.Execute('update expense_line set name = ''' + name +
    ''' where expense_line_id = ' + IntToStr(id^));
end;

procedure Tf_MetaPlanSetup.FormCreate(Sender: TObject);
begin
  DB.Connected := true;
end;

procedure Tf_MetaPlanSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

end.
