unit U_period;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Oracle, ComCtrls, DbPrgrss, DB,
  ADODB, Spin, RxLookup, Grids, DBGridEh, OracleData;

type
  Tf_period = class(TForm)
    c_dbeg: TDBDateTimeEditEh;
    c_dend: TDBDateTimeEditEh;
    Button1: TButton;
    q_ispoln: TOracleQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    l_plat_otch: TLabel;
    c_plat_otch: TRxDBLookupCombo;
    q_plat_otch: TOracleDataSet;
    d_plat_otch: TDataSource;
    q_spis_zayav_plat: TOracleDataSet;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure c_dbegChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure c_dendChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_period: Tf_period;

implementation

uses u_glob_var, ForTemp, ShellApi, DateUtils,u_zayav;

{$R *.dfm}

procedure Tf_period.FormActivate(Sender: TObject);
begin
 c_dbeg.Value:=StartOfTheMonth(Date);
 c_dend.Value:=EndOfTheMonth(Date);
 m_firstime:=1;

 label3.Visible:=false;
 label4.Visible:=false;

 c_plat_otch.Value:='2641';

  if m_otchet='otgruzka' then
    begin
      c_dbeg.Value:=Date()-1;
      c_dend.Value:=Date();
      label3.Visible:=true;
      label4.Visible:=true;
    end;

  if m_otchet='planfakt' then
    begin
      c_dend.Value:=Date();
    end;
  if m_otchet='planfaktexp' then
    begin
      c_dend.Value:=Date();
    end;

  if m_otchet='spiszayavplat' then
     begin
         l_plat_otch.Visible:=true;
         c_plat_otch.Visible:=true;
     end
  else
     begin
         l_plat_otch.Visible:=false;
         c_plat_otch.Visible:=false;
     end;
end;

procedure Tf_period.Button1Click(Sender: TObject);
begin

if m_otchet='ispolnenie' then
    begin
      TempVari.SetVariDate('dbeg_isp',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_isp',c_dend.Value,'MASTER','GU12');
      q_ispoln.Execute;
      FromFile:='U:\Master\gu12\GU12_ispoln.XLS';
      ToFile:='C:\TMP\GU12_ispoln.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='plan' then
    begin
      TempVari.SetVariDate('dbeg_plan',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_plan',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_planpod.XLS';
      ToFile:='C:\TMP\GU12_planpod.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='plansnp' then
    begin
      TempVari.SetVariDate('dbeg_plan',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_plan',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_plansnp.XLS';
      ToFile:='C:\TMP\GU12_plansnp.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='grafik' then
    begin
      TempVari.SetVariDate('dbeg_graf',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_graf',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_grafper.XLS';
      ToFile:='C:\TMP\GU12_grafper.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='otgruzka' then
    begin
      TempVari.SetVariDate('dbeg_otgr',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_otgr',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_otgr.XLS';
      ToFile:='C:\TMP\GU12_otgr.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='planfakt_gd' then
    begin
      TempVari.SetVariDate('dbeg_plfkt',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_plfkt',c_dend.Value,'MASTER','GU12');
      TempVari.SetVariDate('dbeg_month',StartOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      TempVari.SetVariDate('dend_month',EndOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_planfakt.XLS';
      ToFile:='C:\TMP\GU12_planfakt.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='planfakt_gen' then
    begin
      TempVari.SetVariDate('dbeg_plfkt',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_plfkt',c_dend.Value,'MASTER','GU12');
      TempVari.SetVariDate('dbeg_month',StartOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      TempVari.SetVariDate('dend_month',EndOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_planfakt_n.XLS';
      ToFile:='C:\TMP\GU12_planfakt_n.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='planfaktexp' then
    begin
      TempVari.SetVariDate('dbeg_plfkt',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_plfkt',c_dend.Value,'MASTER','GU12');
      TempVari.SetVariDate('dbeg_month',StartOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      TempVari.SetVariDate('dend_month',EndOfTheMonth(c_dbeg.Value),'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_planfakt_exp.XLS';
      ToFile:='C:\TMP\GU12_planfakt_exp.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='sverka' then
    begin
      TempVari.SetVariDate('dbeg_sver',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_sver',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_sverka.XLS';
      ToFile:='C:\TMP\GU12_sverka.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='sverkadate' then
    begin
      TempVari.SetVariDate('dbeg_sver',c_dbeg.Value,'MASTER','GU12');
      TempVari.SetVariDate('dend_sver',c_dend.Value,'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_sverka_date.XLS';
      ToFile:='C:\TMP\GU12_sverka_date.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
    end;

if m_otchet='spiszayavplat' then
    begin
    TempVari.SetVariNum('platid_spis',q_plat_otch.FieldValues['plat_id'],'MASTER','GU12');
    TempVari.SetVariDate('dbeg_spis',c_dbeg.Value,'MASTER','GU12');
    TempVari.SetVariDate('dend_spis',c_dend.Value,'MASTER','GU12');
    q_spis_zayav_plat.Close;
    q_spis_zayav_plat.Open;
    if q_spis_zayav_plat.CountQueryHits=0 then
      begin
        showmessage('По выбранному плательщику заявок нет.');
      end
    else
      begin
{
      TempVari.SetVariDate('dbeg_spis',c_dbeg.Value);
      TempVari.SetVariDate('dend_spis',c_dend.Value);
}
      TempVari.SetVariChar('platname_spis',q_plat_otch.FieldValues['plat_name'],'MASTER','GU12');
      FromFile:='U:\Master\gu12\GU12_spisok_zayav.XLS';
      ToFile:='C:\TMP\GU12_spisok_zayav.XLS';
      f_zayav.SaveCopyFile(FromFile,ToFile);
      ShellExecute(Application.Handle,'open',PChar( String( '"'+ToFile+'"') ),nil,nil,SW_MAXIMIZE);
      end;
    end;
hide;

end;

procedure Tf_period.FormCreate(Sender: TObject);
begin
  q_plat_otch.Active:=true;
  q_spis_zayav_plat.Active:=true;
end;

procedure Tf_period.c_dbegChange(Sender: TObject);
begin
   if (m_otchet='planfakt_gd') or (m_otchet='planfakt_gen') then
    begin
      if m_firstime=1 then
      begin
        if (YearOf(c_dbeg.Value)<>YearOf(c_dend.Value)) or (MonthOf(c_dbeg.Value)<>MonthOf(c_dend.Value)) then
          begin
            c_dend.Value:=StrToDate(VarToStr(DayOf(c_dend.Value))+'.'+VarToStr(MonthOf(c_dbeg.Value))+'.'+VarToStr(YearOf(c_dbeg.Value)));
            //showmessage(DateToStr(c_dend.Value));
          end;
      end;
    end;
    if c_dbeg.Value>c_dend.Value then
      begin
       c_dend.Value:=c_dbeg.Value
      end
end;

procedure Tf_period.FormDestroy(Sender: TObject);
begin
  m_firstime:=0;
end;

procedure Tf_period.c_dendChange(Sender: TObject);
begin
   if (m_otchet='planfakt_gd') or (m_otchet='planfakt_gen') then
    begin
      if m_firstime=1 then
      begin
        if (YearOf(c_dbeg.Value)<>YearOf(c_dend.Value)) or (MonthOf(c_dbeg.Value)<>MonthOf(c_dend.Value)) then
          begin
            c_dbeg.Value:=StrToDate(VarToStr(DayOf(c_dbeg.Value))+'.'+VarToStr(MonthOf(c_dend.Value))+'.'+VarToStr(YearOf(c_dend.Value)));
          end;
      end;
    end;
    if c_dbeg.Value>c_dend.Value then
      begin
       c_dbeg.Value:=c_dend.Value
      end

end;

end.
