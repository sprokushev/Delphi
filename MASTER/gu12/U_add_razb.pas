unit U_add_razb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, StdCtrls, Mask, ToolEdit, DBCtrlsEh,
  RxLookup, Buttons, GridsEh, DBGridEh, ExtCtrls;

type
  Tf_add_razb = class(TForm)
    q_br_sum: TOracleQuery;
    e_kol_razb: TEdit;
    e_ves_razb: TEdit;
    Button1: TButton;
    Button2: TButton;
    e_date_razb: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    c_npr: TRxDBLookupCombo;
    q_npr: TOracleDataSet;
    Label4: TLabel;
    ds_npr: TDataSource;
    edZakazHist: TEdit;
    btnDropDown: TBitBtn;
    pnDropDown: TPanel;
    bvlDropDown2: TBevel;
    sbtnDropDownClose: TSpeedButton;
    sbtnDropDownDel: TSpeedButton;
    bvlDropDown: TBevel;
    sbtnDropDownSave: TSpeedButton;
    dbgDropDown: TDBGridEh;
    oradsDownList: TOracleDataSet;
    oradsDownListCLIENT_NUMBER: TStringField;
    oradsDownListINPUT_NUMBER: TStringField;
    oradsDownListINPUT_DATE: TStringField;
    oradsDownListID: TFloatField;
    dsDownList: TDataSource;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure c_nprKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure btnDropDownClick(Sender: TObject);
    procedure sbtnDropDownCloseClick(Sender: TObject);
    procedure sbtnDropDownSaveClick(Sender: TObject);
    procedure FillDropDown;
    procedure ShowDropDown;
    procedure HideDropDown;
    procedure sbtnDropDownDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_add_razb: Tf_add_razb;

implementation

uses U_zayav, U_reis, ForTemp, u_glob_var;

{$R *.dfm}

procedure Tf_add_razb.FormActivate(Sender: TObject);
var
  m_date: TDateTime;
  m_ves,m_kol: real;
begin
  q_npr.Close;
  q_npr.Open;
{
  m_date:=f_zayav.q_zayav.FieldValues['from_date'];
  m_kol:=f_reis.q_reis.FieldValues['KOL_VAG'];
  m_ves:=f_reis.q_reis.FieldValues['VES'];
}

  edZakazHist.Text := '';  // Очищаем поле

  if m_modify=0 then
    begin
      q_br_sum.Execute;
      m_date:=q_br_sum.Field('max_date_r');
      if m_date<StrToDate('01.01.2000') then
        m_date:=f_zayav.q_zayav.FieldValues['FROM_DATE'];
        //m_date:=date()+1;
      m_kol:=f_reis.q_reis.FieldValues['KOL_VAG']-q_br_sum.Field('s_kol');
      m_ves:=f_reis.q_reis.FieldValues['ves']-q_br_sum.Field('s_ves');
    end
  else
    begin
      m_date:=f_reis.q_razb_view.FieldValues['DATE_R'];
      m_kol:=f_reis.q_razb_view.FieldValues['KOL_VAG'];
      m_ves:=f_reis.q_razb_view.FieldValues['VES'];
      if not VarIsNull(f_reis.q_razb_view.FieldValues['ID_NPR']) then
          c_npr.Value:=f_reis.q_razb_view.FieldValues['ID_NPR']
      else
          c_npr.Value:='';

          // При изменении записи - считываем значение (Если оно есть) и показываем в поле
       if not VarIsNull(f_reis.q_razb_view.FieldValues['ZAKAZ_HIST_ID_TXT'])
          then edZakazHist.Text := f_reis.q_razb_view.FieldValues['ZAKAZ_HIST_ID_TXT'];
    end;
  e_date_razb.Value:=m_date;
  e_kol_razb.Text:=VarToStr(m_kol);
  e_ves_razb.Text:=VarToStr(m_ves);

  FillDropDown; // Заполняем "выпадающий" список
end;

procedure Tf_add_razb.Button2Click(Sender: TObject);
begin
  oradsDownList.Close; // Закрываем DataSet "выпадающего" списка

  close;
end;

procedure Tf_add_razb.Button1Click(Sender: TObject);
var
  m_ves,m_kol: real;
  Code: integer;
begin

  Val(e_kol_razb.Text, m_kol, Code);
  Val(e_ves_razb.Text, m_ves, Code);
  m_idnpr:=c_npr.Value;

  f_reis.q_razb_view.Edit;
  if m_modify=0 then
    f_reis.q_razb_view.Append;

  f_reis.q_razb_view.FieldValues['ID_B']:=f_reis.q_reis.FieldValues['ID'];
  f_reis.q_razb_view.FieldValues['DATE_R']:=e_date_razb.Value;
  f_reis.q_razb_view.FieldValues['KOL_VAG']:=m_kol;
  f_reis.q_razb_view.FieldValues['VES']:=m_ves;
  f_reis.q_razb_view.FieldValues['ID_NPR']:=m_idnpr;

  if edZakazHist.Text='' // Если поле очистили
     then  f_reis.q_razb_view.FieldByName('ZAKAZ_HIST_ID').Clear // Очищаем соотв поле записи
     else f_reis.q_razb_view.FieldValues['ZAKAZ_HIST_ID'] := oradsDownList.FieldValues['ID'];
                                                  // Или заносим туда ZAKAZ_HIST.ID
  oradsDownList.Close; // Закрываем DataSet "выпадающего" списка

  f_reis.q_razb_view.post;

  m_idbr:=f_reis.q_razb_view.FieldValues['ID'];
  close;

end;

procedure Tf_add_razb.FormCreate(Sender: TObject);
begin
  q_npr.Active:=true;
  q_npr.open;
  q_npr.Cursor:=crDefault;
end;

procedure Tf_add_razb.c_nprKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(VarToStr(Key))='46' then
    c_npr.Value:='';
end;

procedure Tf_add_razb.FillDropDown;
var ZakazHistID: variant;
begin // Заполняет "выпадающий" список
   oradsDownList.Close;
   oradsDownList.SetVariable('GU12B_PLATID',f_reis.q_reis.FieldValues['PLAT_ID']);
   oradsDownList.SetVariable('GU12B_STANID',f_reis.q_reis.FieldValues['STAN_ID']);
   oradsDownList.SetVariable('GU12A_FROMDATE',f_zayav.q_zayav.FieldValues['FROM_DATE']);
   oradsDownList.SetVariable('GU12A_PRODID',f_zayav.q_zayav.FieldValues['PROD_ID']);
   oradsDownList.Open;

   ZakazHistID := f_reis.q_razb_view.FieldValues['ZAKAZ_HIST_ID'];
   if not VarIsNull(ZakazHistID) // Если значение уже есть, переводим курсор на него
      then oradsDownList.SearchRecord('ID',ZakazHistID,[srFromBeginning]);

                                                          // Очистить поле можно,
   sbtnDropDownDel.Enabled := not VarIsNull(ZakazHistID); //  если в нем есть значение
end;

procedure Tf_add_razb.ShowDropDown;
begin  // Показывает "выпадающий" список
   btnDropDown.Enabled := false;  // Отключаем кнопку показа "выпадающего" списка
   pnDropDown.Show;      // Показываем список
   dbgDropDown.SetFocus;
end;

procedure Tf_add_razb.HideDropDown;
begin
   btnDropDown.Enabled := true;  // Включаем кнопку показа и прячем список
   pnDropDown.Hide;
end;

procedure Tf_add_razb.btnDropDownClick(Sender: TObject);
begin
   ShowDropDown;
end;

procedure Tf_add_razb.sbtnDropDownCloseClick(Sender: TObject);
begin
   HideDropDown;
end;

procedure Tf_add_razb.sbtnDropDownSaveClick(Sender: TObject);
var ZakazHistID: variant;
begin
   ZakazHistID := oradsDownList.FieldValues['ID'];
   if not VarIsNull(ZakazHistID) // Заносим в поле выбранное значение
      then begin
              edZakazHist.Text := oradsDownList.FieldValues['CLIENT_NUMBER']+' / '+
                                  oradsDownList.FieldValues['INPUT_NUMBER']+'  '+
                                  oradsDownList.FieldValues['INPUT_DATE'];
              sbtnDropDownDel.Enabled := true; // Включаем кнопку очистки
           end;


   HideDropDown; // Прячем список
end;

procedure Tf_add_razb.sbtnDropDownDelClick(Sender: TObject);
begin
   edZakazHist.Text := '';            // Очищаем поле
   sbtnDropDownDel.Enabled := false;  // Выключаем кнопку очистки

   HideDropDown; // Прячем список
end;

end.
