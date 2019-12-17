unit tarif_adds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MdiForm, StdCtrls, ExtCtrls,main, DB, OracleData, Mask,
  ToolEdit, RxLookup, Oracle, azc_tarif;

type
  Tf_forAZC_tarifadd = class(TForm)
  //class(Tf_MDIForm)
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    ODS_sklad_from: TOracleDataSet;
    DS_sklad_from: TDataSource;
    ODS_sklad_fromRN: TFloatField;
    ODS_sklad_fromAZS_NUMBER: TStringField;
    ODS_sklad_fromAZS_NAME: TStringField;
    ODS_sklad_to: TOracleDataSet;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    DS_sklad_to: TDataSource;
    ODS_agent: TOracleDataSet;
    DS_agent: TDataSource;
    ODS_agentRN: TFloatField;
    ODS_agentAGNABBR: TStringField;
    ODS_agentAGNNAME: TStringField;
    GroupBox1: TGroupBox;
    RX_sklad_from: TRxLookupEdit;
    GroupBox2: TGroupBox;
    RX_sklad_to: TRxLookupEdit;
    GroupBox3: TGroupBox;
    RX_agent: TRxLookupEdit;
    GroupBox4: TGroupBox;
    rb_vol: TRadioButton;
    rb_ves: TRadioButton;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    ed_distance: TEdit;
    GroupBox7: TGroupBox;
    dt_date: TDateEdit;
    ed_tarif: TEdit;
    OQ_SQL: TOracleQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   // ParentObj :TForm;
  end;

var
  f_forAZC_tarifadd: Tf_forAZC_tarifadd;
  flag_tarif:string;

implementation

{$R *.dfm}

procedure Tf_forAZC_tarifadd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
ODS_sklaD_from.Close;
ODS_sklaD_to.Close;
ODS_agent.Close;
//f_forAZC_tarifadd.close;
//self.free;
end;

procedure Tf_forAZC_tarifadd.FormCreate(Sender: TObject);
begin
  inherited;
ODS_sklaD_from.Open;
ODS_sklad_from.Locate('AZS_NUMBER',Rx_sklad_from.Text,[]);
ODS_sklaD_to.Open;
ODS_sklad_to.Locate('AZS_NUMBER',Rx_sklad_to.Text,[]);
ODS_agent.Open;
ODS_agent.Locate('AGNABBR',Rx_agent.Text,[]);
end;

procedure Tf_forAZC_tarifadd.Button1Click(Sender: TObject);
var
tarif_tonn, tarif_1000V, distance:string;
begin
  inherited;
If ed_distance.Text='' then
distance:='NULL'
else
distance:=ed_distance.Text;

tarif_tonn:='NULL';
tarif_1000V:='NULL';
If rb_vol.Checked = false then
tarif_tonn:=ed_tarif.Text
else
tarif_1000V:=ed_tarif.Text;
  IF flag_tarif = 'INSERT' then
  begin
ODS_sklad_from.Locate('AZS_NUMBER',Rx_sklad_from.Text,[]);
ODS_sklad_to.Locate('AZS_NUMBER',Rx_sklad_to.Text,[]);
ODS_agent.Locate('AGNABBR',Rx_agent.Text,[]);
  OQ_sql.SQL.Clear;
  OQ_sql.SQL.Add('INSERT INTO AZC_TARIF(AGENT,SKLAD_FROM,SKLAD_TO,DISTANCE,TARIF_TONN,TARIF_1000V,DATE_) '+
  ' VALUES ('''+ODS_agent.fieldbyname('AGNABBR').asstring+''','''+
  ODS_sklad_from.fieldbyname('AZS_NUMBER').asstring+''','''+ODS_sklad_to.fieldbyname('AZS_NUMBER').asstring+''','+distance+','+tarif_tonn+','+tarif_1000v+', to_date('''+ dt_date.Text+''',''dd.mm.yyyy''))');
  OQ_sql.Execute;
  OQ_sql.Session.Commit;
  end;
IF flag_tarif = 'EDIT' then
begin
ODS_sklad_from.Locate('AZS_NUMBER',Rx_sklad_from.Text,[]);
ODS_sklad_to.Locate('AZS_NUMBER',Rx_sklad_to.Text,[]);
ODS_agent.Locate('AGNABBR',Rx_agent.Text,[]);
//key_id_i:=azc_tarif.f_forAZC_tarif.ODS_tarif.fieldbyname('ID').AsInteger;
OQ_sql.SQL.Clear;
OQ_sql.SQL.Add('UPDATE AZC_TARIF  SET AGENT ='''+ ODS_agent.fieldbyname('AGNABBR').asstring+''',SKLAD_FROM='''+ ODS_sklad_from.fieldbyname('AZS_NUMBER').asstring+''', SKLAD_TO='''+ ODS_sklad_to.fieldbyname('AZS_NUMBER').asstring+''', DISTANCE='+ed_distance.text+',TARIF_TONN='+tarif_tonn+', tarif_1000v='+tarif_1000v+',date_ = to_date('''+dt_date.Text+''',''dd.mm.yyyy'')'+ ' WHERE ID ='+key_id);
OQ_sql.Execute;
OQ_sql.Session.Commit;
end;

//f_forAZC_tarif.ODS_tarif.refresh;
//f_forAZC_tarif.ODS_tarif.locate('ID',inttostr(key_id_i),[]);
self.close;
end;

procedure Tf_forAZC_tarifadd.Button2Click(Sender: TObject);
begin
self.close;
end;

end.
