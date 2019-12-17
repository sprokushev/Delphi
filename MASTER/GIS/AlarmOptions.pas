unit AlarmOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, global;

type
  TAlarmOptionsDlg = class(TForm)
    CheckListBox1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    function MyDeclension(vol: integer; word: string): string;
    { Public declarations }
  end;

var
  AlarmOptionsDlg: TAlarmOptionsDlg;

implementation

uses StrUtils;

{$R *.dfm}

procedure TAlarmOptionsDlg.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TAlarmOptionsDlg.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TAlarmOptionsDlg.FormShow(Sender: TObject);
var
i: integer;
s:  string;
begin
  CheckListBox1.Clear;

  for i:=0 to alarmListLength - 1 do begin
    if AlarmArray[i].value <> -32768 then begin
      s := AnsiReplaceStr(AlarmArray[i].name, '<value>', IntToStr(AlarmArray[i].value));
      s := AnsiReplaceStr(s, '<day>', MyDeclension(AlarmArray[i].value, '<day>'));
    end
    else
      s := AlarmArray[i].name;
    CheckListBox1.Items.Add(s);
    CheckListBox1.Checked[i] := AlarmArray[i].Enable;
  end;

end;

procedure TAlarmOptionsDlg.CheckListBox1Click(Sender: TObject);
var
i:  integer;
s:  string;
val:  integer;
begin
  for i:=0 to alarmListLength - 1 do begin
    AlarmArray[i].Enable := CheckListBox1.Checked[i];
    if CheckListBox1.Selected[i] = true then begin
      label2.Caption := AlarmArray[i].description;
      if AlarmArray[i].value = -32768 then
        Button3.Visible := false
      else
        Button3.Visible := true;
    end;
  end;

end;

procedure TAlarmOptionsDlg.Button3Click(Sender: TObject);
var
s:  string;
i:  integer;
begin
  for i:=0 to alarmListLength - 1 do begin
    if CheckListBox1.Selected[i] = true then begin
      s := InputBox( 'Введите значение:', '', IntToStr(AlarmArray[i].value));
      AlarmArray[i].value := StrToInt(s);
      s := AnsiReplaceStr(AlarmArray[i].name, '<value>', IntToStr(AlarmArray[i].value));
      s := AnsiReplaceStr(s, '<day>', MyDeclension(AlarmArray[i].value, '<day>'));      
      CheckListBox1.Items[i] := s;
    end;
  end;

end;

function TAlarmOptionsDlg.MyDeclension(vol: integer; word: string): string;
//склоняет слово в зависимости от числа
const
days: array[0..9] of string = ('дней', 'день', 'дня', 'дня', 'дня', 'дней', 'дней', 'дней', 'дней', 'дней');
var
res:  string;
begin
  if word = '<day>' then
    if ((vol mod 100) > 10) and ((vol mod 100) < 20) then
      res := days[0]
    else
      res := days[vol mod 10];
      
  MyDeclension := res;
end;

end.
