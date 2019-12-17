unit selectSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DateUtils;

type
  Tf_selectSheet = class(TForm)
    Label1: TLabel;
    cbList: TComboBox;
    btSelect: TBitBtn;
    lbInfo: TLabel;
    edDatePlan: TDateTimePicker;
    procedure btSelectClick(Sender: TObject);
    procedure cbListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DefaultDate:TDateTime; // ���� �� ���������
  end;

var
  f_selectSheet: Tf_selectSheet;

implementation

{$R *.dfm}

procedure Tf_selectSheet.btSelectClick(Sender: TObject);
begin
  ModalResult := mrNone;

  if cbList.Text = '' then begin
    ShowMessage('�������� ����');
    exit;
  end;

  ModalResult := mrOk;
end;

procedure Tf_selectSheet.cbListChange(Sender: TObject);
var s:string;
    mm,yy:integer;
begin
  s:=AnsiUpperCase(cbList.Text);
  mm:=0;
  if s='������' then mm:=1;
  if s='�������' then mm:=2;
  if s='����' then mm:=3;
  if s='������' then mm:=4;
  if s='���' then mm:=5;
  if s='����' then mm:=6;
  if s='����' then mm:=7;
  if s='������' then mm:=8;
  if s='��������' then mm:=9;
  if s='�������' then mm:=10;
  if s='������' then mm:=11;
  if s='�������' then mm:=12;
  if mm=0 then mm:=MonthOf(DefaultDate);
  yy:=YearOf(DefaultDate);
  edDatePlan.Date:=EncodeDate(yy,mm,1);
end;

procedure Tf_selectSheet.FormCreate(Sender: TObject);
begin
  lbInfo.Caption:='������ ����� ������:';
  DefaultDate:=StartOfTheMonth(Now);
end;

procedure Tf_selectSheet.FormShow(Sender: TObject);
begin
  cbList.ItemIndex:=0;  
end;

end.
