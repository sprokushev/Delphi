unit NarToDBF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit;

type
  TF_NarToDbf = class(TForm)
    Label1: TLabel;
    edBegDate: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edEndDate: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_NarToDbf: TF_NarToDbf;

implementation

uses DateUtil, OraToDbf;

{$R *.DFM}

procedure TF_NarToDbf.BitBtn1Click(Sender: TObject);
begin
  If (edBegDate.Text='  .  .    ') then
  Begin
    Application.MessageBox('Введите правильную дату','Внимание!',MB_OK);
    edBegDate.SetFocus;
    exit;
  end;
  If (edEndDate.Text='  .  .    ') then
  Begin
    Application.MessageBox('Введите правильную дату','Внимание!',MB_OK);
    edEndDate.SetFocus;
    exit;
  end;
  try
    with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='DOVER';
      DontAsk:=True;
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edBegDate.Date)+''',''dd.mm.yyyy'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edEndDate.Date)+''',''dd.mm.yyyy'')';
      ShowModal;
    end;
    with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='DOV_LINE';
      DontAsk:=True;
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edBegDate.Date)+''',''dd.mm.yyyy'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edEndDate.Date)+''',''dd.mm.yyyy'')';
      ShowModal;
    end;
    with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='NARIAD';
      DontAsk:=True;
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edBegDate.Date)+''',''dd.mm.yyyy'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edEndDate.Date)+''',''dd.mm.yyyy'')';
      ShowModal;
    end;
    with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='NAR_LINE';
      DontAsk:=True;
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edBegDate.Date)+''',''dd.mm.yyyy'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edEndDate.Date)+''',''dd.mm.yyyy'')';
      ShowModal;
    end;
    with tf_ORAToDBF.Create(Self) do
    begin
      DBFtoORAid:='AUTO_DOV';
      DontAsk:=True;
      Param1:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edBegDate.Date)+''',''dd.mm.yyyy'')';
      Param2:='TO_DATE('''+FormatDateTime('dd.mm.yyyy',edEndDate.Date)+''',''dd.mm.yyyy'')';
      ShowModal;
    end;
    MessageDlg('Данные успешно перенесены',mtInformation,[mbOK],0);
{   FileClose(FileCreate(dmData.PathFlags+'upd_dov.ok'));}
  except
    Application.MessageBox('Файлы нарядов и доверенностей не сформированы','Ошибка!',MB_OK+MB_ICONERROR);
  end;
  ModalResult:=mrOk;
end;

procedure TF_NarToDbf.FormActivate(Sender: TObject);
begin
  edBegDate.Date:=LastDayOfPrevMonth+1;
  edEndDate.Date:=FirstDayOfNextMonth-1;
end;

end.
