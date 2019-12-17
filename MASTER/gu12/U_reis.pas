unit U_reis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Dock, TB2Toolbar, TB2Item, ExtCtrls, StdCtrls, DB, OracleData,
  ActnList, XPStyleActnCtrls, ActnMan, Grids, DBGridEh, Oracle, RxLookup,
  Mask, DBCtrlsEh, GridsEh;

type
  Tf_reis = class(TForm)
    q_reis: TOracleDataSet;
    ds_reis: TDataSource;
    ActManReis: TActionManager;
    Grid_reis: TDBGridEh;
    CopyReis: TAction;
    Panel3: TPanel;
    TBToolbar3: TTBToolbar;
    TBItem_addreis: TTBItem;
    TBItem_delreis: TTBItem;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    L_nomz: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    E_regdate: TLabel;
    E_sogldate: TLabel;
    E_gruz: TLabel;
    E_nomz: TLabel;
    E_otprav: TLabel;
    E_stanotpr: TLabel;
    Label2: TLabel;
    E_bdate: TLabel;
    Label7: TLabel;
    E_edate: TLabel;
    refresh_screen: TAction;
    q_sobstvvag: TOracleDataSet;
    ds_sobstvvag: TDataSource;
    q_stannazn: TOracleDataSet;
    ds_stannazn: TDataSource;
    q_stanper: TOracleDataSet;
    ds_stanper: TDataSource;
    q_gruzpol: TOracleDataSet;
    ds_gruzpol: TDataSource;
    q_vidotpr: TOracleDataSet;
    ds_vidotpr: TDataSource;
    q_plat: TOracleDataSet;
    ds_plat: TDataSource;
    q_razb_view: TOracleDataSet;
    ds_razb: TDataSource;
    ds_prinvag: TDataSource;
    q_prinvag: TOracleDataSet;
    TBItem_writereis: TTBItem;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    e_kolvag: TEdit;
    ch_iscor: TCheckBox;
    Label9: TLabel;
    e_ves: TEdit;
    Label4: TLabel;
    c_pdate: TDBDateTimeEditEh;
    Label20: TLabel;
    c_date_ish: TDBDateTimeEditEh;
    Label18: TLabel;
    Label21: TLabel;
    c_date_vh: TDBDateTimeEditEh;
    Label22: TLabel;
    e_nom_letter: TEdit;
    e_nom_vh: TEdit;
    Label10: TLabel;
    c_stannazn: TRxDBLookupCombo;
    Label17: TLabel;
    Label11: TLabel;
    c_stanper: TRxDBLookupCombo;
    Label19: TLabel;
    c_prinvag: TRxDBLookupCombo;
    Label16: TLabel;
    c_sobstvvag: TRxDBLookupCombo;
    Label12: TLabel;
    c_vidotpr: TRxDBLookupCombo;
    Label14: TLabel;
    c_gruzpol: TRxDBLookupCombo;
    Label15: TLabel;
    c_plat: TRxDBLookupCombo;
    GroupBox3: TGroupBox;
    grid_razb: TDBGridEh;
    Panel1: TPanel;
    TBToolbar1: TTBToolbar;
    TBItem_addrazb: TTBItem;
    TBItem_delrazb: TTBItem;
    TBItem_otkaz: TTBItem;
    Refresh_iscor: TAction;
    TBItem_backotkaz: TTBItem;
    q_backotk: TOracleQuery;
    TBItem5: TTBItem;
    Label23: TLabel;
    kol_reis: TLabel;
    q_insb: TOracleQuery;
    attention: TLabel;
    q_sumrazb: TOracleDataSet;
    q_del_reis: TOracleQuery;
    q_delrazb: TOracleQuery;
    q_states: TOracleDataSet;
    ds_states: TDataSource;
    c_states: TRxDBLookupCombo;
    TBItem_modrazb: TTBItem;
    q_maxiscorreis: TOracleDataSet;
    TBItem_mark: TTBItem;
    TBItem_unmark: TTBItem;
    q_mark: TOracleQuery;
    q_unmark: TOracleQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItem_addreisClick(Sender: TObject);
    procedure TBItem_delreisClick(Sender: TObject);
    procedure CopyReisExecute(Sender: TObject);
    procedure TBItem_backzClick(Sender: TObject);
    procedure Grid_reisGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure refresh_screenExecute(Sender: TObject);
    procedure q_reisAfterScroll(DataSet: TDataSet);
    procedure write_reisExecute(Sender: TObject);
    procedure TBItem_writereisClick(Sender: TObject);
    procedure TBItem_addrazbClick(Sender: TObject);
    procedure TBItem_delrazbClick(Sender: TObject);
    procedure TBItem_otkazClick(Sender: TObject);
    procedure Refresh_iscorExecute(Sender: TObject);
    procedure TBItem_backotkazClick(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_reisKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure q_reisBeforeDelete(DataSet: TDataSet);
    procedure TBItem_modrazbClick(Sender: TObject);
    procedure c_stannaznKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_statesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_sobstvvagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_vidotprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_gruzpolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_platKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_stanperKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure c_prinvagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure q_razb_viewAfterOpen(DataSet: TDataSet);
    procedure grid_razbDblClick(Sender: TObject);
    procedure grid_razbGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure TBItem_markClick(Sender: TObject);
    procedure TBItem_unmarkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_reis: Tf_reis;

implementation

uses U_zayav, U_glob_var, main, ForTemp,
  U_add_razb, U_otkaz, ForDB;

{$R *.dfm}

procedure Tf_reis.FormActivate(Sender: TObject);
begin

  E_bdate.caption:=VarToStr(f_zayav.q_zayav.FieldValues['from_date']);
  E_otprav.caption:=VarToStr(f_zayav.q_zayav.FieldValues['otprav']);
  E_stanotpr.caption:=VarToStr(f_zayav.q_zayav.FieldValues['stanotpr']);
  E_edate.caption:=VarToStr(f_zayav.q_zayav.FieldValues['to_date']);
  E_gruz.caption:=VarToStr(f_zayav.q_zayav.FieldValues['prod']);
  E_regdate.caption:=VarToStr(f_zayav.q_zayav.FieldValues['reg_date']);
  E_nomz.caption:=VarToStr(f_zayav.q_zayav.FieldValues['nom_z']);
  E_sogldate.caption:=VarToStr(f_zayav.q_zayav.FieldValues['sogl_date']);
{
  q_sumrazb.close;
  q_razb_view.close;
  q_sumrazb.open;
  q_razb_view.open;
}
  q_reis.close;
  q_reis.open;

  if m_wherefrom='f_add_razb' then
    q_reis.Locate('ID',m_idreis,[]);

  if m_wherefrom='f_otkaz' then
    q_reis.Last;

  kol_reis.Caption:=VarToStr(q_reis.CountQueryHits);

  if Trim(kol_reis.Caption)='0' then
      refresh_screen.Execute;
end;

procedure Tf_reis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if m_back='f_zayav' then f_zayav.Show;
end;

procedure Tf_reis.TBItem_addreisClick(Sender: TObject);
begin
if q_reis.CountQueryHits=0 then
  begin
    q_reis.insert;
    q_reis.FieldValues['ID_A']:=f_zayav.q_zayav.FieldValues['ID'];
    q_reis.FieldValues['KOL_VAG']:=0;
    q_reis.FieldValues['VES']:=0;
    q_reis.Post;
{
    q_insb.SetVariable('IDZAYAV',m_id_zayav);
    q_insb.Execute;
    q_reis.Close;
    q_reis.Open;
}
    kol_reis.Caption:=VarToStr(q_reis.CountQueryHits);
  end
else
  begin
    CopyReis.Execute;
    kol_reis.Caption:=VarToStr(q_reis.CountQueryHits);
  end;

refresh_screen.Execute;
end;

procedure Tf_reis.TBItem_delreisClick(Sender: TObject);
begin
  if q_reis.CountQueryHits>0 then
    begin
    if MessageDlg('Удалить рейс?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
        //SHOWMESSAGE(VARTOSTR(q_reis.FieldValues['ID']));
        q_delrazb.SetVariable('IDREIS',q_reis.FieldValues['ID']);
        q_reis.Delete;
        kol_reis.Caption:=VarToStr(q_reis.CountQueryHits);
        Refresh_iscor.Execute;
        refresh_screen.Execute;
      end
    end
  else
    MessageDlg('Рейсов нет.', mtConfirmation, [mbYes], 0);

end;

procedure Tf_reis.CopyReisExecute(Sender: TObject);
begin
  if q_reis.CountQueryHits>0 then
    begin
      m_idold_reis:=q_reis.FieldValues['ID'];
      arr_z:= VarArrayCreate([0, 30], varVariant);
      arr_z[1]:=q_reis.FieldValues['PDATE'];
      arr_z[3]:=q_reis.FieldValues['SOBSTVVAG_ID'];
      arr_z[4]:=q_reis.FieldValues['STAN_ID'];
      arr_z[5]:=q_reis.FieldValues['STAN_PER_ID'];
      arr_z[6]:=q_reis.FieldValues['GRUZPOL_ID'];
      arr_z[7]:=q_reis.FieldValues['KOL_VAG'];
      arr_z[8]:=q_reis.FieldValues['VES'];
      arr_z[9]:=q_reis.FieldValues['VIDOTPR_ID'];
      arr_z[10]:=q_reis.FieldValues['PLAT_ID'];
      arr_z[11]:=q_reis.FieldValues['FOX_KOD'];
      arr_z[12]:=q_reis.FieldValues['ISCOR'];
      arr_z[13]:=q_reis.FieldValues['PRINVAG_ID'];
    end;

  q_reis.Append;
  q_reis.FieldValues['ID_A']:=m_id_zayav;

  if q_reis.CountQueryHits>0 then
    begin
      q_reis.FieldValues['PDATE']:=arr_z[1];
      q_reis.FieldValues['SOBSTVVAG_ID']:=arr_z[3];
      q_reis.FieldValues['STAN_ID']:=arr_z[4];
      q_reis.FieldValues['STAN_PER_ID']:=arr_z[5];
      q_reis.FieldValues['GRUZPOL_ID']:=arr_z[6];
      q_reis.FieldValues['KOL_VAG']:=arr_z[7];
      q_reis.FieldValues['VES']:=arr_z[8];
      q_reis.FieldValues['VIDOTPR_ID']:=arr_z[9];
      q_reis.FieldValues['PLAT_ID']:=arr_z[10];
        //q_reis.FieldValues['FOX_KOD']:=' ';
      q_reis.FieldValues['ISCOR']:=arr_z[12];
       q_reis.FieldValues['PRINVAG_ID']:=arr_z[13];
    end
  else
    begin
      q_reis.FieldValues['ISCOR']:=0;
    end;

  q_reis.Post;

end;

procedure Tf_reis.TBItem_backzClick(Sender: TObject);
begin
 if m_back='f_zayav' then f_zayav.Show;
 hide;
end;

procedure Tf_reis.Grid_reisGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin

  if q_reis.FieldValues['iscor']=1 then
      Background:=$00DDFFDD;
  if q_reis.FieldValues['iscor']=2 then
      Background:=$00DDDDFF;

end;

procedure Tf_reis.refresh_screenExecute(Sender: TObject);
begin

  if q_reis.CountQueryHits=0 then
    begin
    if f_db.CheckGrant('acGU12_READ') then
      Begin
        TBItem_addreis.Enabled:=false;
        TBItem_writereis.Enabled:=false;
        TBItem_delreis.Enabled:=false;
        TBItem_otkaz.Enabled:=false;
        TBItem_backotkaz.Enabled:=false;
        TBItem_delrazb.Enabled:=false;
        TBItem_addrazb.Enabled:=false;
        TBItem_modrazb.Enabled:=false;
        TBItem_mark.Enabled:=false;
        TBItem_unmark.Enabled:=false;
      End;

    if f_db.CheckGrant('acGU12_FULL') then
      Begin
        TBItem_addreis.Enabled:=true;
        TBItem_writereis.Enabled:=false;
        TBItem_delreis.Enabled:=false;
        TBItem_otkaz.Enabled:=false;
        TBItem_backotkaz.Enabled:=false;
        TBItem_delrazb.Enabled:=false;
        TBItem_addrazb.Enabled:=false;
        TBItem_modrazb.Enabled:=false;
        TBItem_mark.Enabled:=false;
        TBItem_unmark.Enabled:=false;
      End;

      q_razb_view.SetVariable('IDREIS',0);
      q_razb_view.close;
      q_razb_view.open;

      attention.Visible:=false;
    end
  else
    begin

      q_razb_view.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
      q_razb_view.close;
      q_razb_view.open;

      q_sumrazb.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
      q_sumrazb.close;
      q_sumrazb.open;

        if f_db.CheckGrant('acGU12_READ') then
          Begin
            TBItem_addreis.Enabled:=false;
            TBItem_writereis.Enabled:=false;
            TBItem_delreis.Enabled:=false;
            TBItem_otkaz.Enabled:=false;
            TBItem_backotkaz.Enabled:=false;
            TBItem_delrazb.Enabled:=false;
            TBItem_addrazb.Enabled:=false;
            TBItem_modrazb.Enabled:=false;
            TBItem_mark.Enabled:=false;
            TBItem_unmark.Enabled:=false;
          End;

        if f_db.CheckGrant('acGU12_FULL') then
          Begin
            TBItem_addreis.Enabled:=true;
            TBItem_writereis.Enabled:=true;
            TBItem_delreis.Enabled:=true;
            TBItem_modrazb.Enabled:=true;

            if q_reis.FieldValues['iscor']=2 then
              begin
                TBItem_otkaz.Enabled:=false;
                TBItem_backotkaz.Enabled:=true;
                TBItem_mark.Enabled:=false;
                TBItem_unmark.Enabled:=false;
              end
            else
              begin
                TBItem_otkaz.Enabled:=true;
                TBItem_backotkaz.Enabled:=false;
                TBItem_mark.Enabled:=true;
                TBItem_unmark.Enabled:=true;
              end;

            if q_razb_view.CountQueryHits=0 then
              begin
                TBItem_addrazb.Enabled:=true;
                TBItem_delrazb.Enabled:=false;
                TBItem_modrazb.Enabled:=false;
                TBItem_mark.Enabled:=false;
                TBItem_unmark.Enabled:=false;
              end
            else
              begin
                TBItem_addrazb.Enabled:=true;
                TBItem_delrazb.Enabled:=true;
                TBItem_modrazb.Enabled:=true;
                TBItem_mark.Enabled:=true;
                TBItem_unmark.Enabled:=true;
              end;

          end;

        if q_reis.FieldValues['kol_vag']<>q_sumrazb.FieldValues['kol'] then
          attention.caption:='Внимание! Проверьте количество или вес.'
        else
          begin
            if q_reis.FieldValues['ves']<>q_sumrazb.FieldValues['ves'] then
              attention.caption:='Внимание! Проверьте количество или вес.'
            else
              attention.caption:='';
          end;

        if q_razb_view.CountQueryHits=0 then
          attention.caption:='';

    end;

  c_pdate.Value:=f_reis.q_reis.FieldValues['PDATE'];
  if VarIsNull(f_reis.q_reis.FieldValues['KOL_VAG']) then
    e_kolvag.Text:=''
  else
    e_kolvag.Text:=f_reis.q_reis.FieldValues['KOL_VAG'];

  if VarIsNull(f_reis.q_reis.FieldValues['VES']) then
    e_ves.Text:=''
  else
    e_ves.Text:=f_reis.q_reis.FieldValues['VES'];

  if VarIsNull(f_reis.q_reis.FieldValues['SOBSTVVAG_ID']) then
    c_sobstvvag.value:=''
  else
    c_sobstvvag.value:=f_reis.q_reis.FieldValues['SOBSTVVAG_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['STAN_ID']) then
      c_stannazn.value:=''
  else
      c_stannazn.value:=f_reis.q_reis.FieldValues['STAN_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['STATES_ID']) then
      c_states.value:=''
  else
      c_states.value:=f_reis.q_reis.FieldValues['STATES_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['STAN_PER_ID']) then
    c_stanper.value:=''
  else
    c_stanper.value:=f_reis.q_reis.FieldValues['STAN_PER_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['GRUZPOL_ID']) then
    c_gruzpol.value:=''
  else
    c_gruzpol.value:=f_reis.q_reis.FieldValues['GRUZPOL_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['VIDOTPR_ID']) then
    c_vidotpr.value:=''
  else
    c_vidotpr.value:=f_reis.q_reis.FieldValues['VIDOTPR_ID'];

  if VarIsNull(f_reis.q_reis.FieldValues['PLAT_ID']) then
    c_plat.value:=''
  else
    c_plat.value:=f_reis.q_reis.FieldValues['PLAT_ID'];

  if f_reis.q_reis.FieldValues['ISCOR']=1 then
    ch_iscor.Checked:=true
  else
    ch_iscor.Checked:=false;

  if f_reis.q_reis.FieldValues['ISCOR']=2 then
    ch_iscor.Enabled:=False
  else
    ch_iscor.Enabled:=true;


  c_date_ish.value:=f_reis.q_reis.FieldValues['DATE_LETTER'];
  c_date_vh.value:=f_reis.q_reis.FieldValues['DATE_VHOD'];

  if VarIsNull(f_reis.q_reis.FieldValues['NOM_LETTER']) then
    e_nom_letter.Text:=''
  else
    e_nom_letter.Text:=f_reis.q_reis.FieldValues['NOM_LETTER'];

  if VarIsNull(f_reis.q_reis.FieldValues['NOM_VHOD']) then
    e_nom_vh.Text:=''
  else
    e_nom_vh.Text:=f_reis.q_reis.FieldValues['NOM_VHOD'];

  if VarIsNull(f_reis.q_reis.FieldValues['PRINVAG_ID']) then
    c_prinvag.value:=''
  else
    c_prinvag.value:=f_reis.q_reis.FieldValues['PRINVAG_ID'];

//  q_razb_view.Close;
//  q_razb_view.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
//  q_razb_view.Open;

//  grid_razb.Refresh;

end;

procedure Tf_reis.q_reisAfterScroll(DataSet: TDataSet);
begin
refresh_screen.Execute;
end;

procedure Tf_reis.write_reisExecute(Sender: TObject);
begin

f_reis.q_reis.Edit;
f_reis.q_reis.FieldValues['PDATE']:=c_pdate.Value;

if e_kolvag.text<>'0' then
 f_reis.q_reis.FieldValues['KOL_VAG']:=e_kolvag.text
else
 f_reis.q_reis.FieldValues['KOL_VAG']:=0;

if e_ves.text<>'0' then
 f_reis.q_reis.FieldValues['VES']:=e_ves.text
else
 f_reis.q_reis.FieldValues['VES']:=0;

if trim(c_stannazn.Value)<>'' then
  f_reis.q_reis.FieldValues['STAN_ID']:=c_stannazn.Value
else
  f_reis.q_reis.FieldValues['STAN_ID']:=0;

if trim(c_stanper.Value)<>'' then
  f_reis.q_reis.FieldValues['STAN_PER_ID']:=c_stanper.Value
else
  f_reis.q_reis.FieldValues['STAN_PER_ID']:=0;


if trim(c_gruzpol.Value)<>'' then
  f_reis.q_reis.FieldValues['GRUZPOL_ID']:=c_gruzpol.Value
else
  f_reis.q_reis.FieldValues['GRUZPOL_ID']:=0;

if TRIM(c_vidotpr.Value)<>'' then
  f_reis.q_reis.FieldValues['VIDOTPR_ID']:=c_vidotpr.Value
else
  f_reis.q_reis.FieldValues['VIDOTPR_ID']:=0;

if trim(c_sobstvvag.Value)<>'' then
  f_reis.q_reis.FieldValues['SOBSTVVAG_ID']:=c_sobstvvag.Value
else
  f_reis.q_reis.FieldValues['SOBSTVVAG_ID']:=0;

if trim(c_plat.Value)<>'' then
  f_reis.q_reis.FieldValues['PLAT_ID']:=c_plat.Value
else
  f_reis.q_reis.FieldValues['PLAT_ID']:=0;

if ch_iscor.Checked then
  f_reis.q_reis.FieldValues['ISCOR']:=1
else
  f_reis.q_reis.FieldValues['ISCOR']:=0;

//f_reis.q_reis.FieldValues['DATE_LETTER']:=c_date_letter.value;

if trim(e_nom_letter.Text)<>'' then
  f_reis.q_reis.FieldValues['NOM_LETTER']:=e_nom_letter.Text;

if c_prinvag.Value<>'0' then
  f_reis.q_reis.FieldValues['PRINVAG_ID']:=c_prinvag.Value
else
  f_reis.q_reis.FieldValues['PRINVAG_ID']:=0;

f_reis.q_reis.Post;

end;

procedure Tf_reis.TBItem_writereisClick(Sender: TObject);
begin

f_reis.q_reis.Edit;
f_reis.q_reis.FieldValues['PDATE']:=c_pdate.Value;

if e_kolvag.text<>'' then
 f_reis.q_reis.FieldValues['KOL_VAG']:=e_kolvag.text
else
 f_reis.q_reis.FieldValues['KOL_VAG']:=0;

if e_ves.text<>'' then
 f_reis.q_reis.FieldValues['VES']:=e_ves.text
else
 f_reis.q_reis.FieldValues['VES']:=0;

if trim(c_stannazn.Value)<>'' then
  f_reis.q_reis.FieldValues['STAN_ID']:=c_stannazn.Value
else
  f_reis.q_reis.FieldValues['STAN_ID']:=0;

if trim(c_states.Value)<>'' then
  f_reis.q_reis.FieldValues['STATES_ID']:=c_states.Value
else
  f_reis.q_reis.FieldValues['STATES_ID']:=0;

if trim(c_stanper.Value)<>'' then
  f_reis.q_reis.FieldValues['STAN_PER_ID']:=c_stanper.Value
else
  f_reis.q_reis.FieldValues['STAN_PER_ID']:=0;


if trim(c_gruzpol.Value)<>'' then
  f_reis.q_reis.FieldValues['GRUZPOL_ID']:=c_gruzpol.Value
else
  f_reis.q_reis.FieldValues['GRUZPOL_ID']:=0;

if TRIM(c_vidotpr.Value)<>'' then
  f_reis.q_reis.FieldValues['VIDOTPR_ID']:=c_vidotpr.Value
else
  f_reis.q_reis.FieldValues['VIDOTPR_ID']:=0;

if trim(c_sobstvvag.Value)<>'' then
  f_reis.q_reis.FieldValues['SOBSTVVAG_ID']:=c_sobstvvag.Value
else
  f_reis.q_reis.FieldValues['SOBSTVVAG_ID']:=0;

if trim(c_plat.Value)<>'' then
  f_reis.q_reis.FieldValues['PLAT_ID']:=c_plat.Value
else
  f_reis.q_reis.FieldValues['PLAT_ID']:=0;

if ch_iscor.Checked then
  f_reis.q_reis.FieldValues['ISCOR']:=1
else
  begin
    if f_reis.q_reis.FieldValues['ISCOR']<>2 then
      f_reis.q_reis.FieldValues['ISCOR']:=0;
  end;
f_reis.q_reis.FieldValues['DATE_LETTER']:=c_date_ish.value;
f_reis.q_reis.FieldValues['DATE_VHOD']:=c_date_vh.value;

if trim(e_nom_letter.Text)<>'' then
  f_reis.q_reis.FieldValues['NOM_LETTER']:=e_nom_letter.Text
else
  f_reis.q_reis.FieldValues['NOM_LETTER']:='';

if trim(e_nom_vh.Text)<>'' then
  f_reis.q_reis.FieldValues['NOM_VHOD']:=e_nom_vh.Text
else
  f_reis.q_reis.FieldValues['NOM_VHOD']:='';

if c_prinvag.Value<>'' then
  f_reis.q_reis.FieldValues['PRINVAG_ID']:=c_prinvag.Value
else
  f_reis.q_reis.FieldValues['PRINVAG_ID']:=0;

  f_reis.q_reis.Post;
  Refresh_iscor.Execute;

end;

procedure Tf_reis.TBItem_addrazbClick(Sender: TObject);
begin
 TempVari.SetVariNum('ID_REIS',q_reis.FieldValues['ID'],'MASTER','GU12');
 m_idreis:=f_reis.q_reis.FieldValues['ID'];
 f_add_razb.q_br_sum.SetVariable('IDREIS',q_reis.FieldValues['ID']);
 if f_reis.q_razb_view.CountQueryHits>0 then
     begin
        f_add_razb.q_br_sum.Execute;
        if (f_add_razb.q_br_sum.Field('s_kol')>=f_reis.q_reis.FieldValues['KOL_VAG'])
        or (f_add_razb.q_br_sum.Field('s_ves')>=f_reis.q_reis.FieldValues['ves']) then
            begin
            //showmessage('Количество вагонов или вес рейса не позволяют добавить разбивку.');
            //exit;
            end;
     end;
  m_wherefrom:='f_add_razb';
  m_modify:=0;
  m_idreis:=f_reis.q_reis.FieldValues['ID'];
  m_gdprod:=f_zayav.q_zayav.FieldValues['PROD_ID'];
 //f_add_razb.q_npr.SetVariable('GDPROD',f_zayav.q_zayav.FieldValues['PROD_ID']);
  TempVari.SetVariChar('GDPROD',f_zayav.q_zayav.FieldValues['PROD_ID'],'MASTER','GU12');

  if not VarIsNull(q_razb_view.FieldValues['ID_NPR']) then
    m_idnpr:=q_razb_view.FieldValues['ID_NPR']
  else
    m_idnpr:='';

  f_add_razb.show;
end;

procedure Tf_reis.TBItem_delrazbClick(Sender: TObject);
begin
 if q_razb_view.CountQueryHits>0 then
   begin
    q_razb_view.Delete;
   end;
 if q_razb_view.CountQueryHits=0 then
   begin
     TBItem_addrazb.Enabled:=true;
     TBItem_delrazb.Enabled:=false;
     TBItem_modrazb.Enabled:=false;
   end
 else
   begin
     TBItem_addrazb.Enabled:=true;
     TBItem_delrazb.Enabled:=true;
     TBItem_modrazb.Enabled:=true;
   end;
end;

procedure Tf_reis.TBItem_otkazClick(Sender: TObject);
begin
  if VarIsNull(f_reis.q_reis.FieldValues['PLAT_NAME']) or VarIsNull(f_reis.q_reis.FieldValues['STANNAZN']) then
    showmessage('Не указан плательщик или станция назначения!')
  else
    f_otkaz.show;

end;

procedure Tf_reis.Refresh_iscorExecute(Sender: TObject);
begin

  q_maxiscorreis.SetVariable('IDZAYAV',q_reis.FieldValues['ID_A']);
  q_maxiscorreis.Close;
  q_maxiscorreis.Open;
  f_zayav.q_zayav.Edit;
  f_zayav.q_zayav.FieldValues['ISCOR']:=q_maxiscorreis.FieldValues['ISCOR'];
  f_zayav.q_zayav.Post;

end;

procedure Tf_reis.TBItem_backotkazClick(Sender: TObject);
begin
  if VarIsNull(q_reis.FieldValues['old_id']) then
    showmessage('Не заполнено поле для возврата.')
  else
    begin
      q_backotk.setvariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
      q_backotk.setvariable('OLDID',f_reis.q_reis.FieldValues['OLD_ID']);
      q_backotk.Execute;
      q_reis.Refresh;
      refresh_iscor.Execute;
    end;
end;

procedure Tf_reis.TBItem5Click(Sender: TObject);
begin
  f_zayav.show;
  hide;
end;

procedure Tf_reis.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = Chr(vk_Escape)) then
     f_reis.Close;

end;

procedure Tf_reis.Grid_reisKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = Chr(vk_Escape)) then
     f_reis.Close;

end;

procedure Tf_reis.FormCreate(Sender: TObject);
begin

  q_reis.Active:=true;
  q_sumrazb.Active:=true;
  q_razb_view.Active:=true;
  q_sobstvvag.Active:=true;
  q_stannazn.Active:=true;
  q_stanper.Active:=true;
  q_gruzpol.Active:=true;
  q_vidotpr.Active:=true;
  q_plat.Active:=true;
  q_prinvag.Active:=true;
  q_states.Active:=true;

  q_reis.open;
  q_sobstvvag.open;
  q_stannazn.open;
  q_stanper.open;
  q_gruzpol.open;
  q_vidotpr.open;
  q_plat.open;
  q_prinvag.open;
  q_states.open;

  q_reis.Cursor:=crDefault;
  q_sumrazb.Cursor:=crDefault;
  q_razb_view.Cursor:=crDefault;
  q_sobstvvag.Cursor:=crDefault;
  q_stannazn.Cursor:=crDefault;
  q_stanper.Cursor:=crDefault;
  q_gruzpol.Cursor:=crDefault;
  q_vidotpr.Cursor:=crDefault;
  q_plat.Cursor:=crDefault;
  q_prinvag.Cursor:=crDefault;
  q_states.Cursor:=crDefault;
end;

procedure Tf_reis.q_reisBeforeDelete(DataSet: TDataSet);
begin
q_delrazb.Execute;
end;

procedure Tf_reis.TBItem_modrazbClick(Sender: TObject);
begin
  TempVari.SetVariNum('ID_REIS',q_reis.FieldValues['ID'],'MASTER','GU12');
  m_idreis:=f_reis.q_reis.FieldValues['ID'];
  m_modify:=1;
  m_wherefrom:='f_add_razb';
  m_gdprod:=f_zayav.q_zayav.FieldValues['PROD_ID'];
  //f_add_razb.q_npr.SetVariable('GDPROD',VarToStr(f_zayav.q_zayav.FieldValues['PROD_ID']));
  TempVari.SetVariChar('GDPROD',f_zayav.q_zayav.FieldValues['PROD_ID'],'MASTER','GU12');

  if not VarIsNull(q_razb_view.FieldValues['ID']) then
    m_idbr:=q_razb_view.FieldValues['ID']
  else
    m_idbr:=0;

  if not VarIsNull(q_razb_view.FieldValues['ID_NPR']) then
    m_idnpr:=q_razb_view.FieldValues['ID_NPR']
  else
    m_idnpr:='';

  f_add_razb.show;

end;


procedure Tf_reis.c_gruzpolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_gruzpol.Value:='';
end;

procedure Tf_reis.c_stannaznKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_stannazn.Value:='';
end;

procedure Tf_reis.c_statesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_states.Value:='';
end;

procedure Tf_reis.c_sobstvvagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_sobstvvag.Value:='';
end;

procedure Tf_reis.c_vidotprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_vidotpr.Value:='';
end;

procedure Tf_reis.c_platKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_plat.Value:='';
end;

procedure Tf_reis.c_stanperKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_stanper.Value:='';
end;

procedure Tf_reis.c_prinvagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_prinvag.Value:='';
end;

procedure Tf_reis.q_razb_viewAfterOpen(DataSet: TDataSet);
begin
  q_razb_view.Locate('ID',m_idbr,[]);

end;

procedure Tf_reis.grid_razbDblClick(Sender: TObject);
begin
  q_razb_view.Edit;
  if q_razb_view.FieldValues['METKA']=1 then
    q_razb_view.FieldValues['METKA']:=0
  else
    q_razb_view.FieldValues['METKA']:=1;
  q_razb_view.Post;
end;

procedure Tf_reis.grid_razbGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if q_razb_view.FieldValues['METKA']=1 then
    Background:=$00DDDDFF
  else
    Background:=$00FFFFFF;
end;

procedure Tf_reis.TBItem_markClick(Sender: TObject);
begin
  q_mark.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
  q_mark.Execute;
  q_razb_view.close;
  q_razb_view.open;
end;

procedure Tf_reis.TBItem_unmarkClick(Sender: TObject);
begin
  q_unmark.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
  q_unmark.Execute;
  q_razb_view.close;
  q_razb_view.open;
end;

end.
