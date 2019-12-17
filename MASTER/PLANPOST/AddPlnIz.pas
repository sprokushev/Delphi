unit AddPlnIz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxLookup, ComCtrls, Mask, DB, OracleData,
  Oracle,DateUtil;

type
  TF_AddPlanIzm = class(TForm)
    Label3: TLabel;
    e_NumIzm: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lb_PlanName: TLabel;
    lb_Mon: TLabel;
    Label4: TLabel;
    lb_BegDate: TLabel;
    Label5: TLabel;
    lb_EndDate: TLabel;
    ora_Package: TOraclePackage;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PlanName:string;
    PlanPerId:integer;
    PlanMon:string;
    NumIzm:integer;
    BegDate:TDateTime;
    EndDate:TDateTime;
  end;

var
  F_AddPlanIzm: TF_AddPlanIzm;

implementation

uses main;

{$R *.dfm}

procedure TF_AddPlanIzm.FormShow(Sender: TObject);
begin
  lb_PlanName.Caption:=PlanName;
  lb_Mon.Caption:=PlanMon;
  lb_BegDate.Caption:=DateToStr(BegDate);
  lb_EndDate.Caption:=DateToStr(EndDate);
  e_NumIzm.Text:=IntToStr(NumIzm+1);
end;

procedure TF_AddPlanIzm.BitBtn1Click(Sender: TObject);
begin
  If Trim(e_NumIzm.Text)='' Then
  Begin
    Application.MessageBox('Введите номер изменения плана (0-если первоначальный)','Внимание');
    e_NumIzm.SetFocus;
    exit;
  End;

  try
    NumIzm := StrToInt(Trim(e_NumIzm.Text));
  except
    NumIzm:=0;
  end;

  with ora_Package do
  try
    CallProcedure('NewIzm', ['POST',PlanPerId, NumIzm, 1]);
    ModalResult:=mrOk;
  except
    on E:EOracleError do ShowMessage(E.Message);
  end
end;

end.
