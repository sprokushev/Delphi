unit SourceTree;

interface
uses classes, ComCtrls, adodb, sysutils, dialogs, oracle, data;

type myNode=record //������ ��������� ���� ������
  rn: integer;
  name: string;
end;

type direction=record //������ ���������� �����������
  path: TList;  //������ �� Node
  rn: integer;  //������� �����������
  number: string;
  need: boolean;  //���� false, �� ������ �� ��������� �� ��������
end;

type TSourceTree=class
  dirList: TList;  //������ ����������� (��������� direction)
protected
  db: TAdoConnection;
  procedure ClearNode(index: integer); //�������� ���� � dirList
  procedure CreatePath(list: TList; rn: integer); //������� ���� �� ����
  function HasChild(node: TTreeNode; name: string; rn: integer): TTreeNode;
public
  procedure Filter;
  procedure FillTree(tree: TTreeView);
  procedure InsertEmployes(tree: TTreeView);
  constructor Create(tree: TTreeView; node: TTreeNode);
  destructor Free;
end;

implementation

{ TSourceTree }

procedure TSourceTree.ClearNode(index: integer);
var
i:  integer;
curr: ^Mynode;
dir:  ^direction;
begin
  dir := dirList.Items[index];
  for i := 0 to dir^.path.Count - 1 do begin  
    curr := dir^.path.Items[i];
    dispose(curr);
  end;

  dir^.path.Clear;
  dir^.path.Free;
end;

constructor TSourceTree.Create(tree: TTreeView; node:TTreeNode);
var
rn: string;
n:  TTreenode;
i:  integer;
resQ: TOracleQuery;
begin
//���� �������� ��� ����
  if node = nil then
    rn := 'is null'
  else
    rn := '=' + IntToStr(integer(node.data));

  resQ := TOracleQuery.Create(nil);
  resQ.Session := DM.OracleSession1;
  resQ.SQL.Clear;
  resQ.SQL.Add('select rn, crn, name from v_acatalog where crn ' +
    rn + ' and unitcode=''GoodsTransInvoicesToDepts'' order by name');
  resQ.Execute;

//��������� ���� � ������
  while not resQ.Eof do begin
  //��������� ���� � ������
    n := tree.Items.AddChild(node, resQ.Field('name'));
    i := resQ.Field('rn');
    n.Data := pointer(i);
  //������ � ��������
    Create(tree, n);
    resQ.Next;
  end;

  resQ.Free;
end;

procedure TSourceTree.CreatePath(list: TList; rn: integer);
var
n:  ^Mynode;
res:  _RecordSet;
par_rn: integer;
begin
  par_rn := rn;
  repeat
  //�������� ��������
    DM.tempQ3.SQL.Clear;
    DM.tempQ3.SQL.Add('select rn, name, crn from v_acatalog where ' +
      'crn = ' + IntToStr(par_rn) );
    DM.tempQ3.Execute;
    if DM.tempQ3.RowCount = 0 then
      break;
    new(n);
    n^.rn := DM.tempQ3.Field('rn').Value;
    n^.name := DM.tempQ3.Field('name').Value;
    list.Add(n);
    par_rn := DM.tempQ3.Field('crn').Value;
  until 1<>1;
end;

procedure TSourceTree.FillTree(tree: TTreeView);
var
root, node: TTreeNode;
i, j:  integer;
currN:  ^Mynode;
currD: ^direction;
begin
//  tree.Items.Clear;
  root := tree.Items.AddChild(nil, '�����������');

  //�������� �� ������ �����������
  for i:=0 to DirList.Count - 1 do begin
    currD := dirList.Items[i];
    //�� ����� ���� �������� 
    node := root;
    for j:=currD.path.Count - 1 downto 0 do begin
      currN := currD.path.Items[j];
      if HasChild(node, currN.name, currN.rn) = nil then begin
      //���� ��� ��� ����� �����, �� ���������
        node := tree.Items.AddChild(node, currN.name);
        node.Data := Pointer(currN.rn);
        node.ImageIndex := 0;
      end
      else
        node := HasChild(node, currN.name, currN.rn);
    end;
  end;

  root.Expanded := true;
end;

procedure TSourceTree.Filter;
//���������
var
curr: ^direction;
i:  integer;  
begin
{  i := 0;
  while i<dirList.Count do begin
    curr := dirList.items[i];
    if f_DirFilter.CanSift(curr^.rn) = false then begin
      dirList.Delete(i);
      continue;
    end;
    inc(i);
  end;}
end;

destructor TSourceTree.Free;
var
i:  integer;
curr: ^direction;
begin
  for i:=0 to dirList.Count - 1 do begin
    curr := dirlist.Items[i];
    ClearNode(i);
    dispose(curr);
  end;

  dirList.Clear;
  dirList.Free;
end;

function TSourceTree.HasChild(node: TTreeNode; name: string;
  rn: integer): TTreeNode;
//������ false, ���� ����� ����� ���� ��� �������.
var
i:  integer;
n:  TTreeNode;
res:  TTreeNode;
begin
  res := nil;
  for i:=0 to node.Count - 1 do begin
    if (node.item[i].Text = name) and
      (integer(node.Item[i].Data) = rn) then begin
      res := node.Item[i];
      break;
    end;
  end;

  HasChild := res;
end;

procedure TSourceTree.InsertEmployes(tree: TTreeView);
label cont1;
//��������� ������ ���������
var
resQ: _RecordSet;
n, newN:  TTreeNode;
rn, subunit_id, i:  integer;
begin

//�������� �� ���� �����
  i := 0;
  repeat
//  for i:=0 to tree.Items.Count - 1 do begin
    n := tree.Items[i];
    if n.Parent = nil then   //��� �������� ������, � ��� ������ �� ������
      goto cont1;
    if n.ImageIndex = 1 then //��� ���� � ����������
      goto cont1;

    //��������� ��� �����������
    subunit_id := integer(n.Data);
    resQ := db.Execute('select rn, fio from employeeOrg where ' +
      'subunit_id=' + IntToStr(subunit_id) + ' order by fio desc');

    while not resQ.EOF do begin
      newN := tree.Items.AddChildFirst(n, resQ.Fields[1].value);
      rn := resQ.Fields[0].Value;
      newN.Data := Pointer(rn);
      newN.ImageIndex := 1;
      newN.SelectedIndex := 1;
      resQ.MoveNext;
    end;
cont1:
    Inc(i);
    if i>(tree.Items.Count - 1) then
      break;
  until 1<>1;

end;

end.

