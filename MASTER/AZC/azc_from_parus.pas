unit azc_from_parus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, OracleData, RxLookup, ComCtrls, Oracle;

type
  Tf_AzcFromParus = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ed_BegDate: TDateTimePicker;
    ed_EndDate: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    cb_Filial: TRxDBLookupCombo;
    cb_AZS: TRxDBLookupCombo;
    ora_AZS: TOracleDataSet;
    ds_AZS: TDataSource;
    ora_Filial: TOracleDataSet;
    ds_Filial: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ora_Parus: TOracleSession;
    ParusLogon: TOracleLogon;
    pckParus: TOraclePackage;
    pckMASTER: TOraclePackage;
    procedure FormCreate(Sender: TObject);
    procedure cb_FilialChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_AzcFromParus: Tf_AzcFromParus;

implementation

uses main;

{$R *.dfm}

procedure Tf_AzcFromParus.FormCreate(Sender: TObject);
begin
   ed_BegDate.Date:=Now-1;
   ed_EndDate.Date:=Now-1;
   ora_Filial.Open;
   ora_AZS.Open;
   cb_Filial.KeyValue:=31;
end;

procedure Tf_AzcFromParus.cb_FilialChange(Sender: TObject);
begin
  ora_AZS.Close;
  if cb_Filial.Value<>'0' then
    ora_AZS.SQL[1]:='WHERE FILIAL_ID='+ora_Filial.FieldByName('ID').AsString
  else
    ora_AZS.SQl[1]:='where 1=1';
  ora_AZS.Open;
  cb_AZS.Value:='0';
end;

procedure Tf_AzcFromParus.BitBtn1Click(Sender: TObject);
var
  ExecuteParusProc: boolean;
  Filial_Id,Azs_Id,Parus_Rn: integer;
  Dep_ready:string;
begin

  { Logon к Parus'у }
  ExecuteParusProc := ParusLogon.Execute;
  if not ExecuteParusProc then
  begin
    MessageDlg('Введите правильно имя пользователя ПАРУС и пароль!',mtError,[mbOk],0);
    exit;
  end;

  ModalResult:=mrOk;

  If cb_Filial.Value<>'0' Then
  Begin
    Filial_Id:=cb_Filial.KeyValue;
    Dep_Ready:=ora_Filial.FieldByName('PARUS_DEPARTMENT').AsString;
  end
  else
  Begin
    Filial_id:=0;
    Dep_Ready:='';
  end;

  If cb_AZS.Value<>'0' Then
  Begin
    AZS_Id:=cb_AZS.KeyValue;
    Parus_Rn:=ora_Azs.FieldByName('PARUS_RN').AsInteger;
  end
  else
  Begin
    Azs_id:=0;
    Parus_Rn:=0;
  end;



  { Запуск процедуры из Паруса }
  pckParus.CallProcedure('AZS_PARUS_TO_MASTER',['pBegDate',FormatDateTime('dd.mm.yyyy',ed_BegDate.Date),
                                                'pEndDate',FormatDateTime('dd.mm.yyyy',ed_EndDate.Date),
                                                'pDep',Dep_Ready,'pSTORE_RN',Parus_RN]);

  { Запуск процедуры из Master }
  pckMaster.CallProcedure('PARUS_TO_AZC_OPER',['pDATE_BEG',FormatDateTime('dd.mm.yyyy',ed_BegDate.Date),
                                               'pDATE_END',FormatDateTime('dd.mm.yyyy',ed_EndDate.Date),
                                               'pFilial',Filial_ID,'pOrgStru',Azs_ID]);

end;

end.
