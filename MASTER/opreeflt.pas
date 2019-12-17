unit opreeflt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tf_OperReeFilter = class(TForm)
    bt_AddFilter: TButton;
    Label1: TLabel;
    bt_ClearFilter: TButton;
    bt_Exit: TButton;
    m_FilterText: TMemo;
    GroupBox1: TGroupBox;
    cb_FilterKey: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    ed_FilterValue: TEdit;
    cb_FullValue: TCheckBox;
    procedure bt_AddFilterClick(Sender: TObject);
    procedure bt_ClearFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    FilterTable:string;
    FilterText:string;
    { Public declarations }
  end;

var
  f_OperReeFilter: Tf_OperReeFilter;

implementation

{$R *.dfm}

procedure Tf_OperReeFilter.bt_AddFilterClick(Sender: TObject);
var FilterKey,FilterValue:string;
begin
  FilterKey:=AnsiUpperCase(Trim(cb_FilterKey.Text));
  FilterValue:=AnsiUpperCase(Trim(ed_FilterValue.Text));
  if (FilterKey<>'') and (FilterValue<>'') then
  Begin
    If FilterText<>'' Then
      FilterText:='('+FilterText+') AND ';

    if (FilterKey='¹ ÖÈÑÒÅĞÍÛ') AND (FilterTable='KVIT') then
    if cb_FullValue.Checked then
      FilterText:=FilterText+FilterTable+'.num_cist='''+FilterValue+''''
    else
      FilterText:=FilterText+FilterTable+'.num_cist LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ÑÂÅÄÅÍÈß') AND (FilterTable='KVIT') then
    try
      StrToInt(FilterValue);
      FilterText:=FilterText+FilterTable+'.sved_num='+FilterValue;
    except
      Application.MessageBox('Ââåäèòå ÷èñëîâîå çíà÷åíèå','Âíèìàíèå!');
      ed_FilterValue.SetFocus;
      FilterText:=FilterText+'1=1';
    end;

    if (FilterKey='¹ ÍÀĞßÄÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+FilterTable+'.num_nar='''+FilterValue+''''
    else
      FilterText:=FilterText+FilterTable+'.num_nar LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ÄÎÂÅĞÅÍÍÎÑÒÈ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+FilterTable+'.num_dover='''+FilterValue+''''
    else
      FilterText:=FilterText+FilterTable+'.num_dover LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ÏÀÑÏÎĞÒÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'kls_pasp.pasp_num='''+FilterValue+''''
    else
      FilterText:=FilterText+'kls_pasp.pasp_num LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ĞÅÇÅĞÂÓÀĞÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'kls_pasp.rez_num='''+FilterValue+''''
    else
      FilterText:=FilterText+'kls_pasp.rez_num LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ÆÄ ÊÂÈÒÀÍÖÈÈ') AND (FilterTable='KVIT')  then
    try
      StrToInt(FilterValue);
      FilterText:=FilterText+'kvit.num_kvit='+FilterValue;
    except
      Application.MessageBox('Ââåäèòå ÷èñëîâîå çíà÷åíèå','Âíèìàíèå!');
      ed_FilterValue.SetFocus;
      FilterText:=FilterText+'1=1';
    end;

    if (FilterKey='¹ ÒĞÀÍÑÏÎĞÒÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'kvit.num_military='''+FilterValue+''''
    else
      FilterText:=FilterText+'kvit.num_military LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ ÃÒÄ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'kvit.gtd='''+FilterValue+''''
    else
      FilterText:=FilterText+'kvit.gtd LIKE ''%'+FilterValue+'%''';

    if (FilterKey='¹ Ñ×ÅÒÀ-ÔÀÊÒÓĞÛ') AND (FilterTable='KVIT')  then
      FilterText:=FilterText+'bills.nom_sf='+FilterValue;

    if (FilterKey='¹ Ñ×ÅÒÀ-ÔÀÊÒÓĞÛ') AND (FilterTable='V_SF')  then
      FilterText:=FilterText+'nom_sf='+FilterValue;

    if FilterKey='ÊÎÄ ÒÅÕ ÏÄ' then
    try
      StrToInt(FilterValue);
      FilterText:=FilterText+FilterTable+'.tex_pd_id='+FilterValue;
    except
      Application.MessageBox('Ââåäèòå ÷èñëîâîå çíà÷åíèå','Âíèìàíèå!');
      ed_FilterValue.SetFocus;
      FilterText:=FilterText+'1=1';
    end;

    if (FilterKey='¹ ÄÎÃÎÂÎĞÀ') AND (FilterTable='KVIT') then
      FilterText:=FilterText+'kls_dog.dog_number='''+FilterValue+'''';

    if (FilterKey='¹ ÄÎÃÎÂÎĞÀ') AND (FilterTable='MONTH') then
      FilterText:=FilterText+FilterTable+'.dog_number='''+FilterValue+'''';

    if (FilterKey='¹ ÄÎÃÎÂÎĞÀ') AND (FilterTable='V_SF') then
      FilterText:=FilterText+FilterTable+'.dog_number='''+FilterValue+'''';

    if (FilterKey='ÏËÎÌÁÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'(kvit.plomba1='''+FilterValue+''' OR kvit.plomba2='''+FilterValue+''')'
    else
      FilterText:=FilterText+'(kvit.plomba1 LIKE ''%'+FilterValue+'%'' OR kvit.plomba2 LIKE ''%'+FilterValue+'%'')';

    if (FilterKey='ÏËÎÌÁÀ ĞÎÑÈÍÑÏÅÊÒÎĞÀÒÀ') AND (FilterTable='KVIT')  then
    if cb_FullValue.Checked then
      FilterText:=FilterText+'(kvit.rosinpl1='''+FilterValue+''' OR kvit.rosinpl2='''+FilterValue+''')'
    else
      FilterText:=FilterText+'(kvit.rosinspl1 LIKE ''%'+FilterValue+'%'' OR kvit.rosinspl2 LIKE ''%'+FilterValue+'%'')';

    m_FilterText.Text:=FilterText;
    ModalResult:=mrOk;
  End;
end;

procedure Tf_OperReeFilter.bt_ClearFilterClick(Sender: TObject);
begin
  FilterText:='';
  m_FilterText.Text:=FilterText;
end;

procedure Tf_OperReeFilter.FormActivate(Sender: TObject);
begin
  m_FilterText.Text:=FilterText;
end;

end.
