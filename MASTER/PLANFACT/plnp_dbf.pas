unit plnp_dbf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, Grids, DBGridEh, Placemnt, ExtCtrls, TB2Item, TB2Dock,
  TB2Toolbar;

type
  Tf_plnpdbf = class(TForm)
    DBGridEh1: TDBGridEh;
    t_plnpdbf: TADOTable;
    ds_plnpdbf: TDataSource;
    t_prod: TADOTable;
    t_plnpdbfnameprod: TStringField;
    FormStorage1: TFormStorage;
    t_plnpdbfkod_plan: TStringField;
    t_plnpdbfnaim_plan: TStringField;
    t_plnpdbfkod_10: TStringField;
    Timer1: TTimer;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem4: TTBItem;
    t_plnpdbfplan: TBCDField;
    t_plnpdbfsplan: TBCDField;
    t_plnpdbfplan_typ: TStringField;
    t_plnpdbfdate_plan: TDateField;
    t_plnpdbfplan_typ_name: TStringField;
    procedure ToolbarButton971Click(Sender: TObject);
    procedure t_plnpdbfCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_plnpdbf: Tf_plnpdbf;

implementation

uses main;

{$R *.DFM}

procedure Tf_plnpdbf.ToolbarButton971Click(Sender: TObject);
var
  DestFile,DestFile2:String[255];
  day,month,year:Word;
begin
  DestFile:=Caption+#0;
  DestFile2:=ExtractFileName(t_plnpdbf.TableName);
  DestFile2:=InputBox('','Название файла (MMГГp3'+System.Copy(ExtractFileName(DestFile2),7,2)+'.dbf)',DestFile2);
  DestFile2:=f_main.EMailPath+'OI@lukoil.com\'+DestFile2+#0;
  if not CopyFile(@DestFile[1],@DestFile2[1],False) then
    ShowMessage('Не отправилось почему-то :(')
  else
    ShowMessage('Отправилось.');
end;

procedure Tf_plnpdbf.t_plnpdbfCalcFields(DataSet: TDataSet);
begin
  if Trim(t_plnpdbf.FieldByName('plan_typ').asString)='1' then
    t_plnpdbf.FieldByName('plan_typ_name').asString:='План утвержденный'
  else
    if Trim(t_plnpdbf.FieldByName('plan_typ').asString)='2' then
      t_plnpdbf.FieldByName('plan_typ_name').asString:='Текущий план (изменения)'
    else
      if Trim(t_plnpdbf.FieldByName('plan_typ').asString)='3' then
        t_plnpdbf.FieldByName('plan_typ_name').asString:='Текущий план (ОБР)'
      else
        t_plnpdbf.FieldByName('plan_typ_name').asString:=''
end;

end.
