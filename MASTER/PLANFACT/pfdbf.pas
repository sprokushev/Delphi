unit pfdbf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, Grids, DBGridEh, Placemnt, ExtCtrls, TB2Item, TB2Dock,
  TB2Toolbar;

type
  Tf_pfdbf = class(TForm)
    DBGridEh1: TDBGridEh;
    t_pfdbf: TADOTable;
    ds_pfdbf: TDataSource;
    t_prod: TADOTable;
    t_pfdbfnameprod: TStringField;
    FormStorage1: TFormStorage;
    t_pfdbfkod_plan: TStringField;
    t_pfdbfnaim_plan: TStringField;
    t_pfdbfkod_10: TStringField;
    t_pfdbfplan_d: TBCDField;
    t_pfdbfplan_v: TBCDField;
    t_pfdbfplan_vz: TBCDField;
    t_pfdbfsplan_d: TBCDField;
    t_pfdbfsplan_v: TBCDField;
    t_pfdbfsplan_vz: TBCDField;
    t_pfdbffact_d: TBCDField;
    t_pfdbffact_v: TBCDField;
    t_pfdbffact_vz: TBCDField;
    t_pfdbfsfact_d: TBCDField;
    t_pfdbfsfact_v: TBCDField;
    t_pfdbfsfact_vz: TBCDField;
    Timer1: TTimer;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    procedure ToolbarButton971Click(Sender: TObject);
    procedure ToolbarButton972Click(Sender: TObject);
    procedure ToolbarButton973Click(Sender: TObject);
    procedure ToolbarButton974Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pfdbf: Tf_pfdbf;

implementation

uses main;

{$R *.DFM}

procedure Tf_pfdbf.ToolbarButton971Click(Sender: TObject);
var
  DestFile,DestFile2:String[255];
  day,month,year:Word;
begin
{  DestFile:=Caption+#0;
  DestFile2:=f_main.PathEMail+'OI@lukoil.com\'+ExtractFileName(DestFile)+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    if (ParamCount=0) or (ParamStr(1)<>'/pf') then
      ShowMessage('Отправилось.');
}
  DestFile:=Caption+#0;
  decodedate(Date()-1,Year,Month,day);
  If (Year*100+Month) < 200501 Then
    DestFile2:=FormatDateTime('ddmm',Date()-1)+'pfX6.dbf'
  else
    DestFile2:=FormatDateTime('mmyy',Date()-1)+'pf34.dbf';
  DestFile2:=InputBox('','Название файла (ДДMMpf'+System.Copy(ExtractFileName(DestFile2),7,2)+'.dbf)',DestFile2);
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_pfdbf.ToolbarButton972Click(Sender: TObject);
var
  DestFile,DestFile2:String[255];
  day,month,year:Word;
begin
{  DestFile:=Caption+#0;
  DestFile2:=f_main.PathEMail+'OI@lukoil.com\'+System.Copy(ExtractFileName(DestFile),1,4)+'ho'+System.Copy(ExtractFileName(DestFile),7,2)+'.dbf'+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');}
  DestFile:=Caption+#0;
  decodedate(Date()-1,Year,Month,day);
  If (Year*100+Month) < 200501 Then
    DestFile2:=FormatDateTime('ddmm',Date()-1)+'hoX6.dbf'
  else
    DestFile2:=FormatDateTime('mmyy',Date()-1)+'ho34.dbf';
  DestFile2:=InputBox('','Название файла (ДДMMho'+System.Copy(ExtractFileName(DestFile2),7,2)+'.dbf)',DestFile2);
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_pfdbf.ToolbarButton973Click(Sender: TObject);
var
  day,month,year:Word;
  DestFile,DestFile2:String[255];
begin
  DestFile:=Caption+#0;
  decodedate(Date()-1,Year,Month,day);
  If (Year*100+Month) < 200501 Then
    DestFile2:=FormatDateTime('ddmm',Date()-1)+'hgX6.dbf'
  else
    DestFile2:=FormatDateTime('mmyy',Date()-1)+'hg34.dbf';
  DestFile2:=InputBox('','Название файла (ДДMMhg'+System.Copy(ExtractFileName(DestFile2),7,2)+'.dbf)',DestFile2);
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_pfdbf.ToolbarButton974Click(Sender: TObject);
var
  day,month,year:Word;
  DestFile,DestFile2:String[255];
begin
  DestFile:=Caption+#0;
  decodedate(Date()-1,Year,Month,day);
  If (Year*100+Month) < 200501 Then
    DestFile2:=FormatDateTime('mmyy',Date()-1)+'PUX6.dbf'
  else
    DestFile2:=FormatDateTime('mmyy',Date()-1)+'PU34.dbf';
  DestFile2:=InputBox('','Название файла (MMГГpu'+System.Copy(ExtractFileName(DestFile2),7,2)+'.dbf)',DestFile2);
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_pfdbf.Timer1Timer(Sender: TObject);
var
  DestFile,DestFile2:String[255];
begin
  Timer1.Enabled:=False;
  if (ParamCount>0) and (ParamStr(1)='/pf') then
    begin
      DestFile:=Caption+#0;
      DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+ExtractFileName(DestFile)+#0;
      CopyFile(@DestFile[1],@DestFile2[1],False);
      Close;
    end;
end;

procedure Tf_pfdbf.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

end.
