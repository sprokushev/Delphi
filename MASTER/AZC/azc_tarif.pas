unit azc_tarif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, Grids, DBGridEh, TB2Item,
  TB2Dock, TB2Toolbar, ActnList, XPStyleActnCtrls, ActnMan, Oracle;

type
  Tf_forAZC_tarif = class(Tf_MDIForm)
    DBG_tarif: TDBGridEh;
    ODS_tarif: TOracleDataSet;
    DS_tarif: TDataSource;
    ODS_tarifAGENT: TStringField;
    ODS_tarifSKLAD_FROM: TStringField;
    ODS_tarifSKLAD_TO: TStringField;
    ODS_tarifDISTANCE: TFloatField;
    ODS_tarifTARIF_TONN: TFloatField;
    ODS_tarifTARIF_1000V: TFloatField;
    ODS_tarifDATE_: TDateTimeField;
    ODS_tarifAGNNAME: TStringField;
    ODS_tarifAZS_NAME: TStringField;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    tbi_delete: TTBItem;
    tbi_edit: TTBItem;
    tbi_add: TTBItem;
    ActionManager1: TActionManager;
    ac_insert: TAction;
    ac_edit: TAction;
    ac_delete: TAction;
    OQ_tarif: TOracleQuery;
    ODS_tarifID: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBG_tarifGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ac_insertExecute(Sender: TObject);
    procedure ac_editExecute(Sender: TObject);
    procedure ac_deleteExecute(Sender: TObject);
    procedure DBG_tarifColumns0DropDownBoxSortMarkingChanged(
      Sender: TObject);
    procedure DBG_tarifSortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
    procedure create_form_();
  public
    { Public declarations }
  end;

var
  f_forAZC_tarif: Tf_forAZC_tarif;
  var key_id: string;
      key_id_i:integer;

implementation

uses tarif_adds, ForDB;

{$R *.dfm}

procedure Tf_forAZC_tarif.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ODS_tarif.close;
self.free;
end;

procedure Tf_forAZC_tarif.DBG_tarifGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
if ODS_tarif.RecNo mod 2<>0 then
        Background:=clInfoBk;
if gdSelected in State then
    Background:=clNavy;
if ods_tarif.FieldByName('tarif_tonn').AsString='' then
   Background:=clSkyBlue	;
end;

procedure Tf_forAZC_tarif.ac_insertExecute(Sender: TObject);
begin
  inherited;
 flag_tarif:='INSERT';
 create_form_();
ODS_tarif.refresh;
ODS_tarif.locate('ID',inttostr(key_id_i),[]);
end;

procedure Tf_forAZC_tarif.ac_editExecute(Sender: TObject);
begin
  inherited;
flag_tarif:='EDIT';
key_id:= ODS_tarif.fieldbyname('ID').AsString;
create_form_();
ODS_tarif.Close;
ODS_tarif.Open;
ODS_tarif.Locate('ID',key_id,[]);
end;

procedure Tf_forAZC_tarif.ac_deleteExecute(Sender: TObject);
begin
  inherited;
IF Application.MessageBox('ВЫ уверенны, что хотите удалить именно эту запись?', 'Внимание', 1) = 1 then
begin
key_id_i:=ODS_tarif.RecNo;
OQ_tarif.SQL.Clear;
OQ_tarif.sql.Add('DELETE FROM AZC_TARIF WHERE  ID ='+ODS_TARIF.FieldByName('ID').AsString);
OQ_tarif.execute;
ODS_tarif.Refresh;
ODS_tarif.MoveBy(key_id_i-1);
end;
end;


procedure Tf_forAZC_tarif.create_form_();
begin
with Tf_forAZC_tarifadd.create(self) do
begin
IF flag_tarif = 'EDIT' then
Caption:='Редактирование';
RX_sklad_from.Text:=ODS_tarif.fieldbyname('SKLAD_FROM').AsString;
RX_sklad_to.Text:=ODS_tarif.fieldbyname('SKLAD_TO').AsString;
RX_agent.Text:=ODS_tarif.fieldbyname('AGENT').asstring;
dt_date.date:=ODS_tarif.fieldbyname('DATE_').AsDateTime;
ed_distance.Text:=ods_tarif.fieldbyname('Distance').AsString;
IF (ods_tarif.fieldbyname('TARIF_TONN').AsString <>'') AND (ods_tarif.fieldbyname('TARIF_1000V').AsString ='') then
begin
ed_tarif.Text:= ODS_tarif.fieldbyname('TARIF_TONN').AsString;
rb_ves.Checked:=true;
end
else
begin
rb_vol.Checked:=true;
ed_tarif.Text:= ODS_tarif.fieldbyname('TARIF_1000V').AsString;
end;
if ShowModal=mrOk then
begin
end;
end;

end;
procedure Tf_forAZC_tarif.DBG_tarifColumns0DropDownBoxSortMarkingChanged(
  Sender: TObject);
begin
  inherited;
key_id_i:= ODS_tarif.FieldByName('ID').Asinteger;
f_db.SortInGrid(ODS_tarif,6,DBG_tarif);
ODS_tarif.Locate('ID',key_id_i,[]);
end;

procedure Tf_forAZC_tarif.DBG_tarifSortMarkingChanged(Sender: TObject);
begin
  inherited;
key_id_i:= ODS_tarif.FieldByName('ID').Asinteger;
f_db.SortInGrid(ODS_tarif,5,DBG_tarif);
ODS_tarif.Locate('ID',key_id_i,[]);
end;
end.