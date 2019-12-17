unit MO_SvedAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameNariad,MO_Sved, Menus, TB2Item, PropFilerEh, ToolWin, ActnMan,
  ActnCtrls, PropStorageEh, ActnList, XPStyleActnCtrls,DBGridEhImpExp,RxShell,DateUtils;

type
  Tf_SvedAddress = class(TForm)
    frmNariad1: TfrmNariad;
    TBPopupMenu1: TTBPopupMenu;
    acmAD: TActionManager;
    acAddr: TAction;
    acClose: TAction;
    PropStorageEh1: TPropStorageEh;
    ActionToolBar1: TActionToolBar;
    acNoAddr: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure frmNariad1DBGridEh1DblClick(Sender: TObject);
    procedure frmNariad1DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure acAddrExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acNoAddrExecute(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
  private
    { Private declarations }
    ParentForm:Tf_Sved;
  public
    { Public declarations }
  end;

var
  f_SvedAddress: Tf_SvedAddress;
implementation

uses DB, ForDB, main;

{$R *.dfm}

procedure Tf_SvedAddress.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Sved(Owner);
  with ParentForm do
  begin
    frmNariad1.DBGridEh1.DataSource:=ds_NarLines;
    q_NarLines.SetVariable(':LOAD_TYPE_ID',ParentForm.DocLoadTypeId);
    q_NarLines.SetVariable(':MESTO_ID',ParentForm.DocMestoId);
    q_NarLines.SetVariable(':PROD_ID_NPR',ParentForm.q_titleSVED_ID_NPR.Value);
    q_NarLines.SetVariable(':SVED_DATE',ParentForm.q_titleSVED_DATE.Value);
    q_NarLines.SetVariable(':NOM_ZD',ParentForm.q_titleSVED_NOM_ZD.Value);
    q_NarLines.Close;;
    q_NarLines.Open;
    mteNariad.Active:=false;
    mteNariad.Active:=true;
  end;
end;

procedure Tf_SvedAddress.frmNariad1DBGridEh1DblClick(Sender: TObject);
begin
  acAddrExecute(Sender);
end;

procedure Tf_SvedAddress.frmNariad1DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then acAddrExecute(Sender);//на Enter выполним то же самое что и на ДаблКлик
end;

procedure Tf_SvedAddress.acAddrExecute(Sender: TObject);
begin
   with ParentForm do
   begin
    if mteNariad.FieldByName('Nariad_id').IsNull then Application.MessageBox('Заявка не выбрана!','Ошибка!')
    else
    begin
      NarLineId:=mteNariad.FieldByName('Nar_line_id').AsInteger;
      Self.ModalResult:=mrOk;
    end;
   end;
end;

procedure Tf_SvedAddress.acCloseExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tf_SvedAddress.acNoAddrExecute(Sender: TObject);
begin
  with ParentForm do
  begin
    NarLineId:=0;
    Self.ModalResult:=mrOk;
  end;
end;

procedure Tf_SvedAddress.TBItem1Click(Sender: TObject);
begin
  F_DB.GridSQL(Self,frmNariad1.DBGridEh1,ParentForm.q_NarLines.SQL.Text,ParentForm.q_NarLines);
end;

procedure Tf_SvedAddress.TBItem2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if not FileExists(SaveDialog1.FileName) then
      begin
        SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,frmNariad1.DBGridEh1,SaveDialog1.FileName,True);
        FileExecute(SaveDialog1.FileName,'','',esMaximized);
      end
    else
      if MessageDlg('Файл уже существует! Переписать?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,frmNariad1.DBGridEh1,SaveDialog1.FileName,True);
          FileExecute(SaveDialog1.FileName,'','',esMaximized);
        end;
end;

end.
