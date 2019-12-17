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
    DefaultDate:TDateTime; // Äàòà ïî óìîë÷àíèş
  end;

var
  f_selectSheet: Tf_selectSheet;

implementation

{$R *.dfm}

procedure Tf_selectSheet.btSelectClick(Sender: TObject);
begin
  ModalResult := mrNone;

  if cbList.Text = '' then begin
    ShowMessage('Âûáåğèòå ëèñò');
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
  if s='ßÍÂÀĞÜ' then mm:=1;
  if s='ÔÅÂĞÀËÜ' then mm:=2;
  if s='ÌÀĞÒ' then mm:=3;
  if s='ÀÏĞÅËÜ' then mm:=4;
  if s='ÌÀÉ' then mm:=5;
  if s='ÈŞÍÜ' then mm:=6;
  if s='ÈŞËÜ' then mm:=7;
  if s='ÀÂÃÓÑÒ' then mm:=8;
  if s='ÑÅÍÒßÁĞÜ' then mm:=9;
  if s='ÎÊÒßÁĞÜ' then mm:=10;
  if s='ÍÎßÁĞÜ' then mm:=11;
  if s='ÄÅÊÀÁĞÜ' then mm:=12;
  if mm=0 then mm:=MonthOf(DefaultDate);
  yy:=YearOf(DefaultDate);
  edDatePlan.Date:=EncodeDate(yy,mm,1);
end;

procedure Tf_selectSheet.FormCreate(Sender: TObject);
begin
  lbInfo.Caption:='Ïåğâîå ÷èñëî ìåñÿöà:';
  DefaultDate:=StartOfTheMonth(Now);
end;

procedure Tf_selectSheet.FormShow(Sender: TObject);
begin
  cbList.ItemIndex:=0;  
end;

end.
