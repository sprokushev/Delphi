unit U_otkaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Oracle, DB, OracleData;

type
  Tf_otkaz = class(TForm)
    b_saveotkaz: TButton;
    b_canselotkaz: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    e_nomish: TEdit;
    e_nomvhod: TEdit;
    c_dateish: TDBDateTimeEditEh;
    c_datevh: TDBDateTimeEditEh;
    Label7: TLabel;
    Label8: TLabel;
    l_plat: TLabel;
    l_stan: TLabel;
    q_otkaz: TOracleQuery;
    q_kol_ves_otkaz: TOracleQuery;
    l_kol: TLabel;
    l_ves: TLabel;
    procedure b_canselotkazClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure b_saveotkazClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_otkaz: Tf_otkaz;

implementation

uses U_reis, ForTemp, U_zayav, U_glob_var ;

{$R *.dfm}

procedure Tf_otkaz.b_canselotkazClick(Sender: TObject);
begin
 close;
end;

procedure Tf_otkaz.FormActivate(Sender: TObject);
begin
    l_plat.caption:=f_reis.q_reis.FieldValues['PLAT_NAME'];
    l_stan.caption:=f_reis.q_reis.FieldValues['STANNAZN'];
    //e_kol.Text:=f_reis.q_reis.FieldValues['KOL_VAG'];
    //e_ves.Text:=f_reis.q_reis.FieldValues['VES'];
    e_nomish.Text:='';
    e_nomvhod.Text:='';

    q_kol_ves_otkaz.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
    q_kol_ves_otkaz.Execute;
    l_kol.caption:=VarToStr(q_kol_ves_otkaz.Field('KOL'));
    l_ves.caption:=VarToStr(q_kol_ves_otkaz.Field('VES'));

    if q_kol_ves_otkaz.Field('KOL')=0 then
      b_saveotkaz.Enabled:=false
    else
      b_saveotkaz.Enabled:=true;

end;

procedure Tf_otkaz.b_saveotkazClick(Sender: TObject);
begin

      TempVari.SetVariNum('IDREIS',f_reis.q_reis.FieldValues['ID'],'MASTER','GU12');
      q_otkaz.SetVariable('IDREIS',f_reis.q_reis.FieldValues['ID']);
      q_otkaz.SetVariable('DATEISH',c_dateish.Value);
      q_otkaz.SetVariable('DATEVHOD',c_datevh.Value);
      q_otkaz.SetVariable('NOMISH',e_nomish.Text);
      q_otkaz.SetVariable('NOMVHOD',e_nomvhod.Text);
      q_otkaz.Execute;
      f_zayav.q_zayav.Edit;
      f_zayav.q_zayav.FieldValues['ISCOR']:=2;
      f_zayav.q_zayav.Post;
      f_reis.q_reis.last;
      m_wherefrom:='f_otkaz';
      close;

end;

end.
