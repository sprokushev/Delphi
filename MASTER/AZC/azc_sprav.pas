unit azc_sprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, DB, OracleData, Grids, DBGridEh, ComCtrls, TB2Item,
  TB2Dock, TB2Toolbar, XPStyleActnCtrls, ActnList, ActnMan, Oracle,
  StdCtrls;

type
  Tf_forAZCSprav = class(Tf_MDIForm)
    PC_AZCSprav: TPageControl;
    tb_azc_kind: TTabSheet;
    tb_azc_type: TTabSheet;
    tb_group: TTabSheet;
    tb_: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGreedEh: TDBGridEh;
    DBGridEh3: TDBGridEh;
    ODS_Spravochnik: TOracleDataSet;
    DS_spravochnik: TDataSource;
    DBGridEh4: TDBGridEh;
    TabSheet1: TTabSheet;
    DBGridEh5: TDBGridEh;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    ActionManager1: TActionManager;
    ac_AZCSP_add: TAction;
    ac_AZCSP_ed: TAction;
    ac_AZCSP_del: TAction;
    OQ_spravochnik: TOracleQuery;
    procedure FormCreate(Sender: TObject);
    procedure PC_AZCSpravChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ac_AZCSP_addExecute(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure ac_AZCSP_delExecute(Sender: TObject);
    procedure ODS_SpravochnikBeforePost(DataSet: TDataSet);
    procedure ODS_SpravochnikAfterPost(DataSet: TDataSet);
    procedure ac_AZCSP_edExecute(Sender: TObject);
    procedure DBGreedEhGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_forAZCSprav: Tf_forAZCSprav;
  azc_param, ed_script: string;

implementation

uses main;

{$R *.dfm}

procedure Tf_forAZCSprav.FormCreate(Sender: TObject);
begin
  inherited;
  azc_param:='KLS_ORG_KIND';
  ODS_spravochnik.close;
  ODS_spravochnik.Session:=f_main.ora_session;
  OQ_spravochnik.Session:=f_main.ora_session;
  ODS_spravochnik.SQL.Clear;
  ODS_spravochnik.SQL.Add('SELECT '+AZC_PARAM+'.ROWID, '+AZC_PARAM+'.*'+' FROM '+AZC_PARAM);
  ODS_spravochnik.SequenceField.Sequence:='SEQ_KLS_ORG_KIND';
  ODS_spravochnik.SequenceField.Field:='ID';
  ODS_spravochnik.Open;
end;

procedure Tf_forAZCSprav.PC_AZCSpravChange(Sender: TObject);
begin
  inherited;
with ODS_spravochnik do
 if  (State=dsEdit) or  (State=dsInsert) then  begin
        if trim(ODS_spravochnik.FieldByName('NAME').asstring)='' then  cancel
else post;
end;

 ODS_spravochnik.close;

 IF PC_azcsprav.TabIndex=0 then begin
  azc_param:='KLS_ORG_KIND';
  ODS_spravochnik.SequenceField.Sequence:='SEQ_KLS_ORG_KIND';
  end;
 IF PC_azcsprav.TabIndex=1 then  begin
 azc_param:='KLS_ORG_TYPE';
 ODS_spravochnik.SequenceField.Sequence:='SEQ_KLS_ORG_TYPE';
 end;

 IF PC_azcsprav.TabIndex=2 then begin
 azc_param:='AZC_PLACE_SEND';
ODS_spravochnik.SequenceField.Sequence:='SEQ_AZC_PLACE_SEND';
 end;
 IF PC_azcsprav.TabIndex=3 then begin
 azc_param:='AZC_PROD_GROUP';
ODS_spravochnik.SequenceField.Sequence:='SEQ_AZC_PROD_GROUP';
 end;
 IF PC_azcsprav.TabIndex=4 then begin
 azc_param:='AZC_TYPE_OPERATION';
 ODS_spravochnik.SequenceField.Sequence:='SEQ_AZC_TYPE_OPERATION';
end;
  ODS_spravochnik.SQL.Clear;
  ODS_spravochnik.SQL.Add('SELECT '+AZC_PARAM+'.ROWID, '+AZC_PARAM+'.*'+' FROM '+AZC_PARAM);
  ODS_spravochnik.Open;
end;

procedure Tf_forAZCSprav.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
ODS_spravochnik.Close;
Action:= caFree;
end;

procedure Tf_forAZCSprav.ac_AZCSP_addExecute(Sender: TObject);
begin
  inherited;
with ODS_Spravochnik do begin
ReadOnly:= false;
Append;
end;

end;

procedure Tf_forAZCSprav.TBItem2Click(Sender: TObject);
begin
  inherited;
ODs_spravochnik.Cancel;
f_main.ora_Session.Rollback;
end;

procedure Tf_forAZCSprav.ac_AZCSP_delExecute(Sender: TObject);
var bmark:TBookmark;
begin
  inherited;
        ed_script:= 'Delete from '+azc_param+' where ID='+ODS_spravochnik.fieldbyname('ID').AsString;
        Bmark:=ODS_spravochnik.GetBookmark;
        oq_spravochnik.SQL.Clear;
        oq_spravochnik.SQL.Add(ed_script);
        oq_spravochnik.Execute;
        ODS_spravochnik.Refresh;

if  ODS_spravochnik.BookmarkValid(bmark)  then   ODS_spravochnik.GotoBookmark(bmark);
ODS_spravochnik.FreeBookmark(bmark);

end;

procedure Tf_forAZCSprav.ODS_SpravochnikBeforePost(DataSet: TDataSet);
var insert_str:string;
begin
  inherited;
IF ODS_spravochnik.state=dsEdit then
if trim(ODS_spravochnik.fieldbyname('NAME').AsString)='' then
        ODS_spravochnik.CancelUpdates;
end;

procedure Tf_forAZCSprav.ODS_SpravochnikAfterPost(DataSet: TDataSet);
begin
  inherited;
ODS_spravochnik.ReadOnly:= true;
end;

procedure Tf_forAZCSprav.ac_AZCSP_edExecute(Sender: TObject);
begin
  inherited;
with ods_spravochnik do begin
ReadOnly:= false;
ods_spravochnik.Edit;
end;
end;

procedure Tf_forAZCSprav.DBGreedEhGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

if ODS_spravochnik.RecNo mod 2<>0 then
    Background:=clInfoBk;
end;

end.
