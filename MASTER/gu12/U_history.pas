unit U_history;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, TB2Dock, StdCtrls, DBCtrls, DB, OracleData, Grids,
  DBGridEh, TabNotBk, TB2Item, TB2Toolbar,U_glob_var, ActnList,
  XPStyleActnCtrls, ActnMan;

type
  Tf_history = class(TForm)
    TBDock2: TTBDock;
    TBToolbar2: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBControlItem1: TTBControlItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    e_histnomz: TEdit;
    TabbedNotebook: TTabbedNotebook;
    g_zayav: TDBGridEh;
    q_hist_a: TOracleDataSet;
    ds_hist_a: TDataSource;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    ActManHist: TActionManager;
    acSetFiltHistZ: TAction;
    q_hist_b: TOracleDataSet;
    TBItem3: TTBItem;
    ds_hist_b: TDataSource;
    g_hist_b: TDBGridEh;
    DBMemo2: TDBMemo;
    Label3: TLabel;
    q_hist_br: TOracleDataSet;
    ds_hist_br: TDataSource;
    DBGridEh1: TDBGridEh;
    DBMemo3: TDBMemo;
    Label4: TLabel;
    procedure e_histnomzKeyPress(Sender: TObject; var Key: Char);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acSetFiltHistZExecute(Sender: TObject);
    procedure g_zayavGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure g_hist_bGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure q_hist_aAfterScroll(DataSet: TDataSet);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_history: Tf_history;
  m_zayav_filt: string;
  i: integer;

implementation

{$R *.dfm}

procedure Tf_history.e_histnomzKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(13)) then
    begin
      acSetFiltHistZ.Execute;
    end;
end;

procedure Tf_history.TBItem2Click(Sender: TObject);
begin
  //q_hist_a.SetVariable('IDZ','A');
  //q_hist_a.Open;
  //q_hist_a.Close;
  e_histnomz.Text:='';
  q_hist_a.Filter:='';
end;

procedure Tf_history.TBItem1Click(Sender: TObject);
begin
    acSetFiltHistZ.Execute;
end;

procedure Tf_history.FormCreate(Sender: TObject);
begin
  q_hist_a.Active:=true;
  q_hist_b.Active:=true;
  q_hist_br.Active:=true;

end;

procedure Tf_history.acSetFiltHistZExecute(Sender: TObject);
begin
     m_zayav_filt:=trim(e_histnomz.Text);
     if m_zayav_filt<>'' then
        begin

              if Length(m_zayav_filt)<10 then
                begin
                  for i:=1 to 10-Length(e_histnomz.Text) do
                    m_zayav_filt:='0'+m_zayav_filt;
                end;

              if m_zayav_filt='0000000000' then
                m_zayav_filt:='';

          q_hist_a.Filter:='NOM_Z='''+ m_zayav_filt+'''';
        end;
end;

procedure Tf_history.g_zayavGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin

  if q_hist_a.FieldValues['event_kod']='I' then
      Background:=$00DDFFFF;
  if q_hist_a.FieldValues['event_kod']='D' then
      Background:=$00FFEECC;

end;

procedure Tf_history.FormActivate(Sender: TObject);
begin
    q_hist_a.Filter:='table_id='+VarToStr(m_id_zayav);
    e_histnomz.Text:=m_nomz;
    //q_hist_b.Filter:='ID_A='+VarToStr(m_id_zayav);
    TabbedNotebook.PageIndex:=0;
    g_zayav.SetFocus;
end;

procedure Tf_history.TBItem3Click(Sender: TObject);
begin
    e_histnomz.Text:='';
    q_hist_a.Filter:='is_del=1';
    q_hist_b.Filter:='is_del=1';
    q_hist_br.Filter:='is_del=1';
end;

procedure Tf_history.g_hist_bGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_hist_b.FieldValues['event_kod']='I' then
      Background:=$00DDFFFF;
  if q_hist_b.FieldValues['event_kod']='D' then
      Background:=$00FFEECC;

end;

procedure Tf_history.q_hist_aAfterScroll(DataSet: TDataSet);
begin

  if VarIsNull(q_hist_a.FieldValues['table_id']) then
    q_hist_b.Filter:='ID_A=-1'
  else
    q_hist_b.Filter:='ID_A='+q_hist_a.FieldValues['table_id'];

  if VarIsNull(q_hist_a.FieldValues['table_id']) then
    q_hist_br.Filter:='ID_A=-1'
  else
    q_hist_br.Filter:='ID_A='+q_hist_a.FieldValues['table_id'];
 
  //showmessage(q_hist_b.Filter);
end;

procedure Tf_history.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_hist_br.FieldValues['event_kod']='I' then
      Background:=$00DDFFFF;
  if q_hist_br.FieldValues['event_kod']='D' then
      Background:=$00FFEECC;

end;

end.
