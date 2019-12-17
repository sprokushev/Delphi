unit SelectableTree;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, imglist;

type
  TSelectionType = (stNone, stPartial, stAll);

  TTVTraverseEvent = procedure(Node: TTreeNode; Info: Pointer) of object;

  TChangeSelectionEvent = procedure(Sender: TTreeNode) of object;

  TSelectableNode = class(TTreeNode)
  private
    FSelectionType : TSelectionType;
    function GetSelectionType: TSelectionType;
    procedure SetSelectionType(Value: TSelectionType);
    procedure UpdateSelection;
  public
    constructor Create(AOwner: TTreeNodes);
    procedure UpdateStateIndex; virtual;
    property SelectionType: TSelectionType read GetSelectionType write SetSelectionType;
  end;

  TCustomSelectableTree = class(TCustomTreeView)
  private
    FOnChangeSelection: TChangeSelectionEvent;
    FDefaultPopupMenu : TPopupMenu;
    FDefaultPopup : Boolean;
    FSelectImages: TCustomImageList;
    FSaveStateImages: TCustomImageList;
    FMultiSelect: Boolean;
    procedure OnSelectAllClick(Sender: TObject);
    procedure OnUnSelectAllClick(Sender: TObject);
    procedure OnInvertSelectionClick(Sender: TObject);
    procedure OnDefaultMenuPopup(Sender: TObject);
    procedure SetGlobalSelection(Value : TSelectionType);
    procedure DoOnChangeSelection(Node: TTreeNode);
    function GetRootNode: TTreeNode;
    procedure SetSelectionType(Node: TTreeNode; Value: TSelectionType);
    procedure SetMultiSelect(Value: Boolean);
  protected
    function CreateNode: TTreeNode; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure SetDefaultPopup(Value : Boolean);
    property DefaultPopup : Boolean read FDefaultPopup write SetDefaultPopup;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure TraverseTree(Node: TTreeNode; OnTraverseNode: TTVTraverseEvent; AInfo: Pointer);
    procedure SelectAll;
    procedure UnSelectAll;
    procedure InvertSelection;
    property RootNode: TTreeNode read GetRootNode;
  published
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property OnChangeSelection: TChangeSelectionEvent read FOnChangeSelection write FOnChangeSelection;
  end;

  TSelectableTree = class(TCustomSelectableTree)
  published
    property DefaultPopup;
    property ShowButtons;
    property BorderStyle;
    property DragCursor;
    property ShowLines;
    property ShowRoot;
    property ReadOnly;
    property RightClickSelect;
    property DragMode;
    property HideSelection;
    property Indent;
    property Items;
    property OnEditing;
    property OnEdited;
    property OnExpanding;
    property OnExpanded;
    property OnCollapsing;
    property OnCompare;
    property OnCollapsed;
    property OnChanging;
    property OnChange;
    property OnDeletion;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property Align;
    property Enabled;
    property Font;
    property Color;
    property ParentColor default False;
    property ParentCtl3D;
    property Ctl3D;
    property SortType;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnDragDrop;
    property OnDragOver;
    property OnStartDrag;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnDblClick;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property PopupMenu;
    property ParentFont;
    property ParentShowHint;
    property ShowHint;
    property Images;
  end;

procedure TraverseTree(TreeView: TCustomTreeView; Node: TTreeNode;
  ATraverseTreeEvent : TTVTraverseEvent; AInfo : Pointer);

implementation

{$R *.RES}

procedure TraverseTree(TreeView: TCustomTreeView; Node: TTreeNode;
  ATraverseTreeEvent : TTVTraverseEvent; AInfo : Pointer);
var
  CNode: TTreeNode;
begin
  if Assigned(ATraverseTreeEvent) then begin
    if Node = nil
      then CNode := TTreeView(TreeView).Items.GetFirstNode
      else CNode := Node;
    repeat
      ATraverseTreeEvent(CNode, AInfo);
      CNode := CNode.GetNext;
    until (CNode = nil) or (not CNode.HasAsParent(Node));
  end;
end;

{ TSelectableNode }

constructor TSelectableNode.Create(AOwner: TTreeNodes);
begin
     inherited Create(AOwner);
     FSelectionType := stNone;
     UpdateStateIndex;
end;

function TSelectableNode.GetSelectionType: TSelectionType;
begin
     Result := FSelectionType;
     if not HasChildren and (Result > stNone) then Result := stAll;
end;

procedure TSelectableNode.SetSelectionType(Value: TSelectionType);
var Node: TSelectableNode;
begin
     if not HasChildren and (Value <> stNone) then Value := stAll;
     if Value <> SelectionType then
     begin
          if Value in [stNone, stAll] then
          begin
               Node := Self;
               repeat
                    Node.FSelectionType := Value;
                    Node.UpdateStateIndex;
                    Node := Node.GetNext as TSelectableNode;
               until (Node = nil) or (not Node.HasAsParent(Self));
          end;
          if Parent <> nil then TSelectableNode(Parent).UpdateSelection;
          (TreeView as TCustomSelectableTree).DoOnChangeSelection(Self);
     end;
end;

procedure TSelectableNode.UpdateStateIndex;
begin
  if TCustomSelectableTree(TreeView).FMultiSelect
    then StateIndex := Succ(Ord(FSelectionType))
    else StateIndex := -1;
end;

procedure TSelectableNode.UpdateSelection;
var Node: TTreeNode;
    NoneCount: Integer;
    AllCount: Integer;
begin
     NoneCount := 0;
     AllCount := 0;
     Node := GetFirstChild;
     while Node <> nil do
     begin
          case TSelectableNode(Node).SelectionType of
            stNone: Inc(NoneCount);
            stAll: Inc(AllCount);
          end;
          Node := GetNextChild(Node);
     end;
     if AllCount = Count then FSelectionType := stAll
     else if NoneCount = Count then FSelectionType := stNone
     else FSelectionType := stPartial;
     UpdateStateIndex;
     if Parent <> nil then TSelectableNode(Parent).UpdateSelection;
end;

// TCustomSelectableTree

constructor TCustomSelectableTree.Create(AOwner: TComponent);
begin
     inherited Create(AOwner);
     FSelectImages := TImageList.Create(Self);
     FSelectImages.ResourceLoad(rtBitmap, 'SELECTIONIMAGES', clOlive);
     StateImages := FSelectImages;
     FDefaultPopup := False;
     FDefaultPopupMenu := TPopupMenu.Create(Self);
     FDefaultPopupMenu.Items.Add(NewItem('Отметить все', 0, False, True, OnSelectAllClick, 0, 'SelectAllMenuItem'));
     FDefaultPopupMenu.Items.Add(NewItem('Снять все пометки', 0, False, True, OnUnSelectAllClick, 0, 'UnSelectAllMenuItem'));
     FDefaultPopupMenu.Items.Add(NewLine);
     FDefaultPopupMenu.Items.Add(NewItem('Инверсия выделения', 0, False, True, OnInvertSelectionClick, 0, 'InvertSelectionMenuItem'));
     FDefaultPopupMenu.OnPopup := OnDefaultMenuPopup;
end;

procedure TCustomSelectableTree.Loaded;
begin
     inherited Loaded;
     if DefaultPopup then PopupMenu := FDefaultPopupMenu;
end;

procedure TCustomSelectableTree.OnDefaultMenuPopup(Sender: TObject);
var Node : TTreeNode;
    SelType : TSelectionType;
begin
     FDefaultPopupMenu.Items[0].Enabled := False;
     FDefaultPopupMenu.Items[1].Enabled := False;
     Node := Items.GetFirstNode;
     while Node <> nil do
     begin
          SelType := (Node as TSelectableNode).SelectionType;
          if SelType <> stAll then FDefaultPopupMenu.Items[0].Enabled := True;
          if SelType <> stNone then FDefaultPopupMenu.Items[1].Enabled := True;
          Node := Node.GetNextSibling;
     end;
end;

procedure TCustomSelectableTree.OnSelectAllClick(Sender: TObject);
begin
     SelectAll;
end;

procedure TCustomSelectableTree.OnUnSelectAllClick(Sender: TObject);
begin
     UnSelectAll;
end;

procedure TCustomSelectableTree.OnInvertSelectionClick(Sender: TObject);
begin
     InvertSelection;
end;

procedure TCustomSelectableTree.SetDefaultPopup(Value : Boolean);
begin
     FDefaultPopup := Value;
     if (not (csDesigning in ComponentState)) and FDefaultPopup then
        PopupMenu := FDefaultPopupMenu;
end;

procedure TCustomSelectableTree.InvertSelection;
var Node : TTreeNode;
begin
     Node := Items.GetFirstNode;
     while Node <> nil do
     begin
          if not Node.HasChildren then with Node as TSelectableNode do
             case SelectionType of
                stAll : SelectionType := stNone;
                stNone : SelectionType := stAll;
             end;
          Node := Node.GetNext;
     end;
end;

procedure TCustomSelectableTree.SelectAll;
begin
     SetGlobalSelection(stAll);
end;

procedure TCustomSelectableTree.UnSelectAll;
begin
     SetGlobalSelection(stNone);
end;

procedure TCustomSelectableTree.SetGlobalSelection(Value : TSelectionType);
var Node : TTreeNode;
begin
     Node := Items.GetFirstNode;
     while Node <> nil do
     begin
          (Node as TSelectableNode).SelectionType := Value;
          Node := Node.GetNextSibling;
     end;
end;

function TCustomSelectableTree.CreateNode: TTreeNode;
begin
  Result := TSelectableNode.Create(Items);
end;

procedure TCustomSelectableTree.DoOnChangeSelection(Node: TTreeNode);
begin
  if Assigned(FOnChangeSelection) then FOnChangeSelection(Node);
end;

function TCustomSelectableTree.GetRootNode: TTreeNode;
begin
  Result := Items.GetFirstNode;
end;

procedure TCustomSelectableTree.SetMultiSelect(Value: Boolean);
var
  Node: TSelectableNode;
begin
  if Value <> FMultiSelect then begin
    FMultiSelect := Value;
    if not Value
      then StateImages := FSaveStateImages
      else begin
        FSaveStateImages := StateImages;
        StateImages := FSelectImages;
      end;

    Items.BeginUpdate;
    try
      Node := TSelectableNode(Items.GetFirstNode);
      while Node <> nil do begin
        Node.UpdateStateIndex;
        Node := TSelectableNode(Node.GetNext);
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TCustomSelectableTree.SetSelectionType(Node: TTreeNode; Value: TSelectionType);
begin
  if TSelectableNode(Node).SelectionType <> Value
    then begin
      TSelectableNode(Node).SelectionType := Value;
      DoOnChangeSelection(Node);
    end;
end;

procedure TCustomSelectableTree.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  HitTest : THitTests;
  Node: TTreeNode;
begin
  inherited MouseDown(Button, Shift, X, Y);
  HitTest := GetHitTestInfoAt(X,Y);
  if htOnStateIcon in HitTest then begin
    Node := GetNodeAt(X, Y);
    if Assigned(Node) then
      with TSelectableNode(Node) do
        if SelectionType = stAll
          then SelectionType := stNone
          else SelectionType := stAll
  end;
end;

procedure TCustomSelectableTree.TraverseTree(Node: TTreeNode;
  OnTraverseNode: TTVTraverseEvent; AInfo: Pointer);
begin
  SelectableTree.TraverseTree(Self, Node, OnTraverseNode, AInfo);
end;

end.
