unit MO_SvedAddVagonVedPod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, ComCtrls, MO_Sved, Grids, DBGridEh, SelectableTree,
  MemTableDataEh, DataDriverEh, MemTableEh, StdCtrls, ExtCtrls, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, StdStyleActnCtrls,
  ActnMenus, FrameNariad, PropFilerEh, PropStorageEh;

type
  Tf_AddVagonVedPod = class(TForm)
    Splitter1: TSplitter;
    ActionToolBar1: TActionToolBar;
    acmVP: TActionManager;
    acMove: TAction;
    acClose: TAction;
    frmNariad1: TfrmNariad;
    PropStorageEh1: TPropStorageEh;
    procedure VedTreeCreate;//динамически создает дерево ведомостей
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acMoveExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
    pNarLineId:variant;
  public
    { Public declarations }
  end;

var
  f_AddVagonVedPod: Tf_AddVagonVedPod;
  ParentForm :Tf_Sved;
  tr1:TSelectableTree;
implementation
{$R *.dfm}
uses ForDB,ForSess,main;

procedure Tf_AddVagonVedPod.VedTreeCreate;
var
  MyTreeNode1, MyTreeChild: TTreeNode;
  VedId:double;
begin
  tr1:=TSelectableTree.Create(self);
  with tr1 do
  begin
    Parent:=self;
    Images:=f_main.img_Common;
{    top:=DBGridEh1.Height+10;
    Left:=5;
    Width:=730;//DBGridEh1.Width;
    Height:=320;}
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
        if VedId<>q_vedVed_pod_id.Value then
        begin
          MyTreeNode1 := tr1.Items.Add(nil, q_vedTreeNode1.Value); { Add a root node }
          MyTreeNode1.ImageIndex:=48;
          MyTreeNode1.SelectedIndex:=48;
          VedId:=q_vedVed_pod_id.Value;
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

procedure Tf_AddVagonVedPod.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Sved(Owner);
  pNarLineId:=NULL;
  with ParentForm do
  begin
    frmNariad1.DBGridEh1.DataSource:=ds_NarLines;
    q_ved.SetVariable(':LOAD_TYPE_ID',ParentForm.DocLoadTypeId);
    q_ved.SetVariable(':MESTO_ID',ParentForm.DocMestoId);
    q_ved.SetVariable(':PROD_ID_NPR',ParentForm.q_titleSVED_ID_NPR.Value);
    q_ved.Close;
    q_ved.Open;
    q_NarLines.SetVariable(':LOAD_TYPE_ID',DocLoadTypeId);
    q_NarLines.SetVariable(':MESTO_ID',DocMestoId);
    q_NarLines.SetVariable(':PROD_ID_NPR',q_titleSVED_ID_NPR.Value);
    q_NarLines.SetVariable(':SVED_DATE',q_titleSVED_DATE.Value);
    q_NarLines.SetVariable(':NOM_ZD',q_titleSVED_NOM_ZD.Value);
    q_NarLines.Close;
    q_NarLines.Open;
    mteNariad.Active:=false;
    mteNariad.Active:=true;
  end;
  VedTreeCreate;
end;

procedure Tf_AddVagonVedPod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ParentForm.mteNariad.Active:=false;
  ParentForm.q_NarLines.Close;
  ParentForm.q_Ved.Close;
  tr1.Free;
end;

procedure Tf_AddVagonVedPod.acMoveExecute(Sender: TObject);
var Node : TTreeNode;
    i:integer;
    SelectionList:TStrings;
    ParentNodeText,pSvedId:string;
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
//pCOMMIT NUMBER, pVED_POD_ROW_ID NUMBER, pSVED_ID VARCHAR2, pNAR_LINE_ID NUMBER
////если список пуст то прервем процедуру
    if SelectionList.Count=0 then
    begin
      application.MessageBox('Вагонов не выбрано!','Ошибка!');
      exit;
    end;
    pSvedId:=ParentForm.q_title.FieldByName('ID').AsString;
    if not ParentForm.mteNariad.fieldbyname('NARIAD_ID').IsNull then
      pNarLineId:=ParentForm.mteNariad.fieldbyname('NAR_LINE_ID').AsInteger
    else
      pNarLineId:=NULL;

    for i:=0 to SelectionList.Count-1 do
      if ParentForm.q_Ved.Locate('LookUp',SelectionList[i],[]) then
        try
          ParentForm.pkgFOR_SVED.CallIntegerFunction('CopyVedPodRow',[1,ParentForm.q_VedVED_POD_ROW_ID.Value,pSvedid,pNarLineId]);
        except
          on E:Exception do
          Begin
            f_main.ApplSession.WriteToLog(amFull,'Ved_pod',sesError,E.Message,0,'');
          end;
        end;
  finally
    SelectionList.Free;
  end;
    ModalResult := mrOk;
//application.MessageBox(pchar(),'!');
end;

procedure Tf_AddVagonVedPod.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
