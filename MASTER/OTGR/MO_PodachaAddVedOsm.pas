unit MO_PodachaAddVedOsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, ComCtrls, MO_Podacha, Grids, DBGridEh, SelectableTree,
  MemTableDataEh, DataDriverEh, MemTableEh, StdCtrls, ExtCtrls, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, StdStyleActnCtrls,
  ActnMenus, FrameNariad, DateUtils, PropFilerEh, PropStorageEh;

type
  Tf_PodachaAddVedOsm = class(TForm)
    ActionToolBar1: TActionToolBar;
    acmVP: TActionManager;
    acMove: TAction;
    acClose: TAction;
    PropStorageEh1: TPropStorageEh;
    procedure VedTreeCreate;//динамически создает дерево ведомостей
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acMoveExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
    ParentForm :Tf_Podacha;
    tr1:TSelectableTree;
  public
    { Public declarations }
  end;

var
  f_PodachaAddVedOsm: Tf_PodachaAddVedOsm;

implementation
{$R *.dfm}
uses ForDB,ForSess,main;

procedure Tf_PodachaAddVedOsm.VedTreeCreate;
var
  MyTreeNode1, MyTreeChild: TTreeNode;
  VedId:double;
begin
  tr1:=TSelectableTree.Create(self);
  with tr1 do
  begin
    Parent:=self;
    Images:=f_main.img_Common;
    Align:=alClient;
    MultiSelect:=True;
    DefaultPopup:=True;
  end;

  if not ParentForm.q_ved.IsEmpty then
    with ParentForm do
    begin
      q_ved.First;
      VedId:=-1;
      while not q_ved.Eof do
      begin
        if VedId<>q_vedVED_OSMOTR_ID.Value then
        begin
          MyTreeNode1 := tr1.Items.Add(nil, q_vedTreeNode1.Value); { Add a root node }
          MyTreeNode1.ImageIndex:=48;
          MyTreeNode1.SelectedIndex:=48;
          VedId:=q_vedVed_osmotr_id.Value;
        end;
        MyTreeChild:=tr1.Items.AddChild(MyTreeNode1,q_vedTreeChild1.Value);
        MyTreeChild.ImageIndex:=49;
        MyTreeChild.SelectedIndex:=49;
        q_ved.Next;
      end;
      tr1.SelectAll;
      tr1.UnSelectAll;
      tr1.FullExpand;
    end
  else
    begin
      tr1.MultiSelect:=false;
      tr1.DefaultPopup:=false;
      tr1.Items.Add(nil, 'Нет записей'); { Add a root node }
    end;
  tr1.Show;
end;

procedure Tf_PodachaAddVedOsm.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Podacha(Owner);
  with ParentForm do
  begin
    q_ved.SetVariable(':LOAD_TYPE_ID',ParentForm.DocLoadTypeId);
    q_ved.SetVariable(':FROM_DATE',StartOfTheMonth(ParentForm.q_title.FieldByName('POD_DATE').AsDateTime));
    q_ved.SetVariable(':POD_DATE',DateOf(ParentForm.q_title.FieldByName('POD_DATE').AsDateTime));
    //q_ved.SQL.SaveToFile('c:\tmp\1.sql');
    q_ved.Open;
  end;
  VedTreeCreate;
end;

procedure Tf_PodachaAddVedOsm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ParentForm.q_Ved.Close;
  tr1.Free;
end;

procedure Tf_PodachaAddVedOsm.acMoveExecute(Sender: TObject);
var Node : TTreeNode;
    i:integer;
    SelectionList:TStrings;
    ParentNodeText:string;
    pVedPodId:double;
begin
  try//try...finally для SelectionList
    SelectionList:=TStringList.Create;
////выберем все помеченные галкой ноды
    Node := tr1.Items.GetFirstNode;
    while Node <> nil do
    begin
      if Node.HasChildren then ParentNodetext:=Node.Text;
      if not Node.HasChildren then with Node as TSelectableNode do
        if SelectionType=stAll then SelectionList.Append(ParentNodetext+Node.Text);
      Node := Node.GetNext;
    end;
////если список пуст то прервем процедуру
    if SelectionList.Count=0 then
    begin
      application.MessageBox('Вагонов не выбрано!','Ошибка!');
      exit;
    end;
    pVedPodId:=ParentForm.q_title.FieldByName('ID').AsFloat;
    for i:=0 to SelectionList.Count-1 do
      if ParentForm.q_Ved.Locate('LookUp',SelectionList[i],[]) then
        try
          ParentForm.pkgFOR_PODACHA.CallIntegerFunction('CopyVedOsmotrRow',[1,ParentForm.q_VedVED_OSMOTR_ROW_ID.Value,pVedPodID]);
        except
          on E:Exception do
          Begin
            f_main.ApplSession.WriteToLog(amFull,'VED_POD',sesError,E.Message,0,'');
          end;
        end;
  finally
    SelectionList.Free;
  end;
    ModalResult := mrOk;
end;

procedure Tf_PodachaAddVedOsm.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
