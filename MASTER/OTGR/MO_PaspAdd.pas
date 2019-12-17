unit MO_PaspAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MO_Pasp, RxLookup, Grids, DBGridEh, DB, ExtCtrls, DBCtrls,
  OracleData, StdCtrls, ComCtrls, dbcgrids, Mask, ToolEdit, CurrEdit,
  Buttons,DateUtils, ActnList, ToolWin, ActnMan, ActnCtrls,
  XPStyleActnCtrls, DBCtrlsEh;

// ПАСПОРТ (добавление/изменение)

type
  Tf_PaspAdd = class(TForm)
    ds_valpasp: TDataSource;
    q_valpasp: TOracleDataSet;
    q_valpaspNAME: TStringField;
    q_valpaspPASP_ID: TStringField;
    q_valpaspQUAL: TStringField;
    q_valpaspKODIF_ID: TIntegerField;
    q_valpaspNORMTU: TStringField;
    gb1: TGroupBox;
    lcProd: TRxDBLookupCombo;
    sg1: TStringGrid;
    q_valpaspNPP: TIntegerField;
    edNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edRez_num: TEdit;
    Label3: TLabel;
    lcPerer: TRxDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    edPl20: TCurrencyEdit;
    edPl15: TCurrencyEdit;
    Label21: TLabel;
    Label6: TLabel;
    edInsp: TEdit;
    amPaspAdd: TActionManager;
    ActionToolBar1: TActionToolBar;
    acPaspSave: TAction;
    acClose: TAction;
    Label7: TLabel;
    edDateVir: TDBDateTimeEditEh;
    edDate: TDBDateTimeEditEh;
    q_valpaspFIELD_TYPE: TStringField;
    q_valpaspFIELD_LEN: TIntegerField;
    q_valpaspFIELD_DEC: TIntegerField;
    ChkFormat: TCheckBox;
    Action1: TAction;
    procedure lcProdChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure acPaspSaveExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    function CheckFormat(s:string):boolean;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Editid:string;
    EditMode:integer; // EditMode=0 - добавление, EditMode=1 - редактирование, EditMode=2 - просмотр
    ParentForm:Tf_Pasp;
  end;

var
  f_PaspAdd: Tf_PaspAdd;
implementation

{$R *.dfm}
uses main, ForDB, ForSess,ForSystem;

function Tf_PaspAdd.CheckFormat(s:string):boolean;
var dblQual:double;
    rez:boolean;
begin
  rez:=True;
  if q_valpaspFIELD_TYPE.AsString='N' then
  begin
    if Length(Trim(s))>q_valpaspFIELD_LEN.AsInteger then rez:=false;
    if not TryStrToFloat(Trim(s),dblQual) then rez:=false;
    if rez then
    begin
      dblQual:=Frac(dblQual);
      if (Length(FloatToStr(dblQual))-2)>q_valpaspFIELD_DEC.AsInteger then rez:=false;
    end;
  end;
  CheckFormat:=Rez;
end;

procedure Tf_PaspAdd.lcProdChange(Sender: TObject);
var
  i: integer;
begin
//при смене продукта откроем с новыми парметрами q_valpasp и заполним ими стринг грид
    q_valpasp.Close;
    q_valpasp.SetVariable(':ID_NPR',lcProd.KeyValue);
    q_valpasp.SetVariable(':PASP_ID',EditId);
    q_valpasp.Open;
    with sg1 do
    begin
      RowCount:=0;
      RowCount:=q_valpasp.RecordCount+1;
      if RowCount=1 then RowCount:=2;
      FixedRows:=1;
      for i:=1 to q_valpasp.RecordCount do
      begin
        Cells[0,i] :=q_valpaspNAME.AsString;
        Cells[1,i] :=q_valpaspNORMTU.AsString;
        Cells[2,i] :=q_valpaspQUAL.AsString;
        q_valpasp.Next;
      end;
    end;
end;

procedure Tf_PaspAdd.FormCreate(Sender: TObject);
begin
  ParentForm:=Tf_Pasp(owner);
  sg1.Cells[0,0]:='Показатель';
  sg1.Cells[1,0]:='Норма по ТУ';
  sg1.Cells[2,0]:='Значение';
  q_valPasp.Session:=ParentForm.ora_Session;
end;

procedure Tf_PaspAdd.FormActivate(Sender: TObject);
var vPasp_Id:string;
    vProd_Id:string;
begin

  if (EditMode=0) and (EditId='') then
  Begin
    Caption:='Новый паспорт';
    edDate.Value:=DateOf(Now);
    edDateVir.Value:=DateOf(edDate.Value);
    lcPerer.KeyValue:=8;
  end;

  if (EditMode=0) and (EditId<>'') then
  begin
    Caption:='Новый паспорт';
    edRez_num.Text:=parentForm.q_titleREZ_NUM.AsString;
    lcProd.KeyValue:=ParentForm.q_titlePROD_ID_NPR.Value;
    edPl15.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,602,Null]);
    edPl20.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,1,Null]);
    lcPerer.KeyValue:=ParentForm.q_titlePERER_ID.Value;
    edInsp.Text:=ParentForm.q_titleINSPEKTOR.AsString;
    Editid:='';
  end;

  if (EditMode=1) and (EditId<>'') then
  Begin
    Caption:='Редактирование паспорта';
    edNum.Text:=ParentForm.q_titlePASP_NUM.AsString;
    edDate.Value:=DateOf(ParentForm.q_titlePASP_DATE.Value);
    edDateVir.Value:=DateOf(ParentForm.q_titleDATE_VIR.Value);
    edRez_num.Text:=parentForm.q_titleREZ_NUM.AsString;
    lcProd.KeyValue:=ParentForm.q_titlePROD_ID_NPR.Value;
    edPl15.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,602,Null]);
    edPl20.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,1,Null]);
    lcPerer.KeyValue:=ParentForm.q_titlePERER_ID.Value;
    edInsp.Text:=ParentForm.q_titleINSPEKTOR.AsString;
  end;

  if (EditMode=2) and (EditId<>'') then
  Begin
    Caption:='Просмотр паспорта';
    edNum.Text:=ParentForm.q_titlePASP_NUM.AsString;
    edDate.Value:=DateOf(ParentForm.q_titlePASP_DATE.Value);
    edDateVir.Value:=DateOf(ParentForm.q_titleDATE_VIR.Value);
    edRez_num.Text:=parentForm.q_titleREZ_NUM.AsString;
    lcProd.KeyValue:=ParentForm.q_titlePROD_ID_NPR.Value;
    edPl15.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,602,Null]);
    edPl20.Value:=ParentForm.pkgFor_pasp.CallFloatFunction('GET_PASP_VALUE_AS_NUM',[EditId,1,Null]);
    lcPerer.KeyValue:=ParentForm.q_titlePERER_ID.Value;
    edInsp.Text:=ParentForm.q_titleINSPEKTOR.AsString;

    sg1.Enabled:=false;
    gb1.Enabled:=false;
    acPaspSave.Enabled:=false;
  end;
end;

procedure Tf_PaspAdd.acPaspSaveExecute(Sender: TObject);
var
  i,intKodif:integer;
  dblQual:double;
begin
  //проверка обязательных полей
  if Trim(edNum.Text)='' then
  begin
    Application.MessageBox('Не заполнен номер паспорта!','Внимание',MB_OK);
    edNum.SetFocus;
    exit;
  end;

  if Trim(edRez_num.Text)='' then
  begin
    Application.MessageBox('Не заполнен номер резервуара!','Внимание',MB_OK);
    edRez_num.SetFocus;
    exit;
  end;

  if edDate.value=Null then
  begin
    Application.MessageBox('Не заполнена дата выдачи паспорта!','Внимание',MB_OK);
    edDate.SetFocus;
    exit;
  end;

  if edDateVir.value=Null then
  begin
    Application.MessageBox('Не заполнена дата изготовления!','Внимание',MB_OK);
    edDateVir.SetFocus;
    exit;
  end;

  if lcProd.KeyValue=Null then
  begin
    Application.MessageBox('Не заполнен продукт!','Внимание',MB_OK);
    lcProd.SetFocus;
    exit;
  end;

  if lcPerer.KeyValue=Null then
  begin
    Application.MessageBox('Не заполнен производитель продукта!','Внимание',MB_OK);
    lcPerer.SetFocus;
    exit;
  end;

  ///проверочка форматов введенных показателей
  if ChkFormat.Checked then //на всякий случай вдруг с проверкой форматов не пойдет
  for i:=1 to sg1.RowCount do
  begin
    if q_Valpasp.Locate('Name',sg1.Cells[0,i],[loCaseInsensitive]) then
      if not CheckFormat(sg1.Cells[1,i]) then
      begin
        application.MessageBox(PChar('ЧИСЛОВОЙ ФОРМАТ ЗНАЧЕНИЯ'+#10#13+sg1.Cells[0,i]+
            #10#13+'НЕ СООТВЕТСТВУЕТ ЗАДАННОМУ!'+
            '  LEN:'+q_valpaspField_len.AsString+'DEC:'+q_valpaspField_dec.AsString),'Внимание!');
        Exit;
      end;
  end;

  {FUNCTION AddPasp (pCOMMIT NUMBER, pID VARCHAR2, pMESTO_ID NUMBER ,pPASP_NUM VARCHAR2, pREZ_NUM VARCHAR2,
                  pPASP_DATE DATE,pINSPEKTOR VARCHAR2, pDATE_OFORML DATE, pPROD_ID_NPR VARCHAR2, pDATE_VIR DATE,
				  pPERER_ID NUMBER) RETURN VARCHAR2;
}

  try
    //сохраняет заголовок
    EditId:=ParentForm.pkgFor_pasp.CallFloatFunction('AddPasp',[1,EditId,ParentForm.DocMestoId,Trim(edNum.Text),Trim(edRez_num.Text),
        DateOf(edDate.Value),Trim(edInsp.Text),DateOf(Now),lcProd.KeyValue,DateOf(edDateVir.Value),lcPerer.KeyValue]);
    //SET_PASP_VALUE (pPASP_ID VARCHAR2, pKODIF_ID NUMBER, pKODIF_TAG VARCHAR2, pQUAL VARCHAR2)
    //сохраняет показатели
    for i:=1 to sg1.RowCount do
    begin
      intKodif:=0;
      if q_Valpasp.Locate('Name',sg1.Cells[0,i],[loCaseInsensitive]) then intKodif:=q_valpaspKODIF_ID.Value;
      ParentForm.pkgFor_pasp.CallProcedure('SET_PASP_VALUE',[EditId,intKodif,Null,sg1.Cells[1,i]]);
    end;
    //СОХРАННИМ основные показатели паспорта
    ParentForm.pkgFor_pasp.CallProcedure('SET_PASP_VALUE',[EditId,571,Null,F_ForSystem.RealToStr(edPL15.Value*1000)]);
    ParentForm.pkgFor_pasp.CallProcedure('SET_PASP_VALUE',[EditId,602,Null,Trim(edPL15.Text)]);
    ParentForm.pkgFor_pasp.CallProcedure('SET_PASP_VALUE',[EditId,1,Null,Trim(edPL20.Text)]);
  except
    on E: Exception do
    Begin
      // Отобразим ошибку
      f_main.ApplSession.WriteToLog(amFull,'MO_PaspAdd',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  End;
  ModalResult:=mrOk;
end;

procedure Tf_PaspAdd.acCloseExecute(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure Tf_PaspAdd.Action1Execute(Sender: TObject);
begin
  ChkFormat.Visible:=not ChkFormat.Visible;
end;

end.
