unit MO_SvedAddVagon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DateUtils,
  Dialogs, StdCtrls, ComCtrls, RxLookup, MO_Sved, Grids, ValEdit, Buttons,Oracle, DB, OracleData,
  Mask, DBGrids;

const
  MAX_CARGO = 25;

type
  //��������� ��������� - ��� �������� ��������� ������ ����������
  TCargoFeature = record
    Name:string;//��� �������������� �����
    DBFieldName:string;//��� ���� � ��

    Pos1:byte;//������� � 1� �������� ������
    Pos2:byte;//������� �� 2� �������� ������
    Pos3:byte;//������� � 3� �������� ������
    ListNumber:string[3];//������� ������(1������- ��,���-����-����, 2������-��,��,���-����, 3������-��,���-����; 1-��, 0-���)
    Mask:string;
    IsEdit:boolean; // ����� ������
  end;
type
  //��������� ��������� - ��� �������� ��������
  TCargoValue = record
    Name:string;//��� �������������� �����
    Value:string; // ��������
  end;

type
  TCargoFeatures = Array[1..MAX_CARGO] of TCargoFeature;//������ ������������� �����
  TCargoValues = Array[1..MAX_CARGO] of TCargoValue; // ������ ��� ��������

                                                                                              // ��         ��,��    ��,���
                                                                                              // ����-����  ����     ����
const
  CargoFeatures: TCargoFeatures = ((name:'����';                      DBFieldName:'GOST';         pos1:1;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:true),
                                   (name:'�����,��';                  DBFieldName:'VZLIV';        pos1:2;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:true),
                                   (name:'�����,�';                   DBFieldName:'VOLUME';       pos1:3;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:false),
                                   (name:'�����������,''�';           DBFieldName:'TEMPER';       pos1:4;   pos2:0; pos3:1; ListNumber:'101'; Mask:''; IsEdit:true),
                                   (name:'����.���������';            DBFieldName:'FAKT_PL';      pos1:5;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:false),
                                   (name:'CTLv';                      DBFieldName:'CTLV';         pos1:6;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:false),
                                   (name:'����� ��� 15';              DBFieldName:'VOLUME15';     pos1:7;   pos2:0; pos3:0; ListNumber:'100'; Mask:''; IsEdit:false),
                                   (name:'���,��';                    DBFieldName:'VES';          pos1:8;   pos2:9; pos3:3; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'��� �����';                 DBFieldName:'KOL_NET';      pos1:9;   pos2:0; pos3:4; ListNumber:'101'; Mask:''; IsEdit:true),
                                   (name:'��� ������';                DBFieldName:'VES_ALL';      pos1:0;   pos2:8; pos3:2; ListNumber:'011'; Mask:''; IsEdit:true),
                                   (name:'��� ��-�� �����, ��';       DBFieldName:'VES_ED';       pos1:0;   pos2:3; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'���-�� ��-� �����';         DBFieldName:'KOL_ED';       pos1:0;   pos2:2; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� ��������';              DBFieldName:'UPAK_ID';      pos1:0;   pos2:1; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� ��������,��';           DBFieldName:'UPAK_VES';     pos1:0;   pos2:10;pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� 1 ��-�� ��������,��';   DBFieldName:'UPAK_VES_ED';  pos1:0;   pos2:11;pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'���-�� ��������';           DBFieldName:'PODDONS';      pos1:0;   pos2:4; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� 1 �������,��';          DBFieldName:'PODDON_VES';   pos1:0;   pos2:5; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'���-�� �����';              DBFieldName:'SHIELDS';      pos1:0;   pos2:6; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� 1 ����,��';             DBFieldName:'SHIELDS_VES';  pos1:0;   pos2:7; pos3:0; ListNumber:'010'; Mask:''; IsEdit:true),
                                   (name:'��� ������ 1';              DBFieldName:'ZPU_TYPE1';    pos1:10;  pos2:12;pos3:5; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'������ 1';                  DBFieldName:'PLOMBA1';      pos1:11;  pos2:13;pos3:6; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'������ ��������������� 1';  DBFieldName:'ROSINSPL1';    pos1:12;  pos2:14;pos3:7; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'��� ������ 2';              DBFieldName:'ZPU_TYPE2';    pos1:13;  pos2:15;pos3:8; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'������ 2';                  DBFieldName:'PLOMBA2';      pos1:14;  pos2:16;pos3:9; ListNumber:'111'; Mask:''; IsEdit:true),
                                   (name:'������ ��������������� 2';  DBFieldName:'ROSINSPL2';    pos1:15;  pos2:17;pos3:10;ListNumber:'111'; Mask:''; IsEdit:true)
                                   );

type
  Tf_AddVagon = class(TForm)
    gbVagon: TGroupBox;
    edNUM_CIST: TEdit;
    edNCISTDOP: TEdit;
    edAXES: TEdit;
    edCAPACITY: TEdit;
    edVES_CIST: TEdit;
    lcVagonType: TRxDBLookupCombo;
    lcVagOwner: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    gbStatus: TGroupBox;
    lcVetka_pod: TRxDBLookupCombo;
    lcVetka_otp: TRxDBLookupCombo;
    lcVetka_napr: TRxDBLookupCombo;
    lcVag_status: TRxDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    gbNakl: TGroupBox;
    lcForm_Nakl: TRxDBLookupCombo;
    Label13: TLabel;
    gbVes: TGroupBox;
    vlCargoFeatures: TValueListEditor;
    btSave: TBitBtn;
    btCancel: TBitBtn;
    edKALIBR_ID: TEdit;
    cbAutoCalc: TCheckBox;
    gbSved: TGroupBox;
    lbSved_info: TLabel;
    lbInfo: TLabel;
    btCalc: TBitBtn;
    btVagOwner: TSpeedButton;
    gbControl: TGroupBox;
    Label3: TLabel;
    Label14: TLabel;
    edCurrVes: TEdit;
    edNewVes: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edAXESExit(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure edNUM_CISTChange(Sender: TObject);
    procedure lcVagonTypeChange(Sender: TObject);
    procedure vlCargoFeaturesValidate(Sender: TObject; ACol, ARow: Integer;
      const KeyName, KeyValue: String);
    procedure edVES_CISTChange(Sender: TObject);
    procedure edKALIBR_IDChange(Sender: TObject);
    procedure vlCargoFeaturesStringsChange(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure edCheckFloat(Sender: TObject);
    procedure edNCISTDOPExit(Sender: TObject);

  private
    { Private declarations }
    Defi_Mass             :integer;//����� ��������� �����
    ZPU_TYPE1,ZPU_TYPE2   :string;//��� ������ �� ���������
    PODDON_VES,SHIELD_VES :string;//����� 1 ������� � 1 ����
    VAG_TYPE              :integer;//��� �������� ����������� ���� ������
    types1                :set of 1..20;
    types2                :set of 1..20;
    CargoValues           :TCargoValues; // ������ ��� �������� �������� ��� ���������� Save/Restore
    procedure InitKey(pos,idx:byte);
    procedure InitPickList(DataSet1:TOracleDataSet;pos:byte);
    procedure InitVagonParams;
    procedure SetCargoValues(Sender,field,RusKey: string); // ��������� ��������
    procedure GetCistValues(Sender: TObject); // ������� �������� ���������
    procedure CalculateCargoFeatures(Sender:string); // ���������� ���������
    procedure FillCargoFeatures(n:integer); // ��������� ������ ����������
    procedure SaveCargoFeatures;
    procedure RestoreCargoFeatures;
  public
    { Public declarations }
    EditMode:integer; // EditMode=0 - ����������, EditMode=1 - ��������������, EditMode=2 - ��������
    EditId: double;
    ParentForm:Tf_Sved;//������ �� ������������ �����
    IsLoading:boolean;//���� �������� ���������������� �� f_Sved. ������ ��� �������������� ���������� ������ FillCargoFeatures
    Recalculation:boolean;//���� ��������� ��� �������������� ��������
  end;

var
  f_AddVagon            :Tf_AddVagon;

implementation

uses main,ForSESS,ForDB, ForSystem;

{$R *.dfm}

//////////////////////////////////////////////////////////////////////////////
//��������� ��� ���������� ���������� � ������ �� ����������� �������       //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.GetCistValues(Sender: TObject);
var pVes:double;
begin
  try
    pVes:=F_ForSystem.StrToReal(vlCargoFeatures.Values['���,��']);
    if sender=edNum_cist then
    if ParentForm.pkgFor_cist.CallIntegerFunction('CIST_EXIST',[edNum_cist.Text,ParentForm.DocLoadTypeId])=1 then
    Begin
      lcVagonType.KeyValue:=ParentForm.pkgFor_cist.CallIntegerFunction('GET_VAGONTYPE',[edNum_cist.Text,ParentForm.DocLoadTypeId]);
      edNCISTDOP.Text:=IntToStr(ParentForm.pkgFor_cist.CallIntegerFunction('GET_NCISTDOP',[edNum_cist.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
      edVES_CIST.Text:=FloatToStr(ParentForm.pkgFor_cist.CallFloatFunction('GET_VES_CIST',[edNum_cist.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
      lcVagowner.KeyValue:=ParentForm.pkgFor_cist.CallIntegerFunction('GET_VAGOWNER',[edNum_cist.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]);
      edKALIBR_ID.Text:=ParentForm.pkgFor_cist.CallStringFunction('GET_KALIBR',[edNum_cist.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]);
      edCAPACITY.Text:=ParentForm.pkgFor_cist.CallStringFunction('GET_CAPACITY',[edNum_cist.Text,edKALIBR_ID.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]);
      edAXES.Text:=IntToStr(ParentForm.pkgFor_cist.CallIntegerFunction('GET_AXES',[edNum_cist.Text,edKALIBR_ID.Text,pVes,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
    end;
  except
    on E: Exception do
    Begin
      // ��������� ������
      f_main.ApplSession.WriteToLog(amFull,'SvedAddVvgon',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
// �������� ��������� ������ ���������� ����� � ���������� ���������� ��   //
// ���������                                                                //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.FillCargoFeatures(n:integer);
var Pos,i,rows:integer;
begin
  Recalculation:=true;//�� ������ ������ �������� ���� ��� ������������� ��������
  vlCargoFeatures.Strings.Clear;
  rows:=0;
  pos:=-1;

  for i:= 1 to MAX_CARGO do
    if CargoFeatures[i].ListNumber[n]='1' then inc(rows);//������� ������

  for i:=1 to rows do
    vlCargoFeatures.Strings.Append(' =');//��������� ������

  for i:=1 to MAX_CARGO do//�������������� ������
  begin
    if CargoFeatures[i].ListNumber[n]='1' then
    begin
      case n of //���������� ������� � ������ �������� ������
        1:pos:=CargoFeatures[i].Pos1;
        2:pos:=CargoFeatures[i].Pos2;
        3:pos:=CargoFeatures[i].Pos3;
      end;
      vlCargoFeatures.Strings[pos-1]:=CargoFeatures[i].Name+'=';
      if (CargoFeatures[i].DBFieldName='ZPU_TYPE1')then InitPickList(ParentForm.q_ZpuType1,pos-1);
      if (CargoFeatures[i].DBFieldName='ZPU_TYPE2')then InitPickList(ParentForm.q_ZpuType2,pos-1);
      if (CargoFeatures[i].DBFieldName='UPAK_ID')then InitPickList(ParentForm.q_Upak,pos-1);
    end;
  end;

  // ��������� ���������� �� ���������
  vlCargoFeatures.Values['��� ������ 1']:=zpu_type1;
  vlCargoFeatures.Values['��� ������ 2']:=zpu_type2;
  if n=2 then
  begin
    vlCargoFeatures.Values['��� 1 �������,��']:=poddon_ves;
    vlCargoFeatures.Values['��� 1 ����,��']:=shield_ves;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
// ���������� �������� ���������� �����                                     //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.SaveCargoFeatures;
var i:integer;
begin
  for i:=1 to MAX_CARGO do
  begin
    if i<=vlCargoFeatures.RowCount-1 then
    Begin
      CargoValues[i].Name:=vlCargoFeatures.Keys[i];
      CargoValues[i].Value:=vlCargoFeatures.Values[CargoValues[i].Name];
    end
    else
    Begin
      CargoValues[i].Name:='';
      CargoValues[i].Value:='';
    end;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
// �������������� �������� ���������� �����                                 //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.RestoreCargoFeatures;
var i,j:integer;
Begin
  Recalculation:=true;//�� ������ ������ �������� ���� ��� ������������� ��������
  for i:=1 to MAX_CARGO do
  if CargoValues[i].Name<>'' then
  if vlCargoFeatures.FindRow(CargoValues[i].Name,j) then
  begin
    vlCargoFeatures.Values[CargoValues[i].Name]:=CargoValues[i].Value;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
//��������� ��� ������������� ��������� ���������� ��������� ��������       //
//������������ ����. ���������� �� CalculateCargoFeatures � bSaveClick      //
//�������� ��� �������� �������� ��������: 1-��� defi_mass=1(����-������),2-//
//��� defi_mass<>1(�� ����� ��� ������� ���� ��,��,��� � ��), 3-���         //
//defi_mass<>1(�� ����� ��� ������� ���� �� � ���).                         //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.InitVagonParams;
var
    sVzliv,sVes_ed,sKol_ed,sVolume,sTemper,sVes,sKol_net,sVes_all,sVes_cist :string;
    sPoddons,sPoddon_ves,sShields,sShield_ves,sUpak_ves,sUpak_ves_ed        :string;
begin
  //������� ������� temp_ves
  ParentForm.pkgFOR_VES.CallProcedure('empty_temp_ves',[]);

  with vlCargoFeatures do
  begin
    //�������� �������� ���������� ��� ���������� �������� � �������� ���������
    sVzliv:=FloatToStr(F_ForSystem.StrToReal(values['�����,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VZLIV',sVzliv,NULL]);

    sVolume:=FloatToStr(F_ForSystem.StrToReal(values['�����,�']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VOLUME',sVolume,NULL]);

    sTemper:=FloatToStr(F_ForSystem.StrToReal(values['�����������,''�']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['TEMPER',sTemper,NULL]);

    sVes_cist:=FloatToStr(F_ForSystem.StrToReal(edVes_cist.Text));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VES_CIST',sVes_cist,NULL]);

    ParentForm.pkgFor_ves.CallProcedure('set_param',['PL15',ParentForm.q_titlePL15.AsString,NULL]);
    ParentForm.pkgFor_ves.CallProcedure('set_param',['PL20',ParentForm.q_titlePL20.AsString,NULL]);

    sVes:=FloatToStr(F_ForSystem.StrToReal(values['���,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VES',sVes,NULL]);

    sVes_all:=FloatToStr(F_ForSystem.StrToReal(values['��� ������']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VES_ALL',sVes_all,NULL]);

    sKol_net:=FloatToStr(F_ForSystem.StrToReal(values['��� �����']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['KOL_NET',sKol_net,NULL]);

    sVes_ed:=FloatToStr(F_ForSystem.StrToReal(values['��� ��-�� �����, ��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['VES_ED',sVes_ed,NULL]);

    sKol_ed:=FloatToStr(F_ForSystem.StrToReal(values['���-�� ��-� �����']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['KOL_ED',sKol_ed,NULL]);

    sUpak_ves_ed:=FloatToStr(F_ForSystem.StrToReal(values['��� 1 ��-�� ��������,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['UPAK_VES_ED',sUpak_ves_ed,NULL]);

    sUpak_ves:=FloatToStr(F_ForSystem.StrToReal(values['��� ��������,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['UPAK_VES',sUpak_ves,NULL]);

    sPoddons:=FloatToStr(F_ForSystem.StrToReal(values['���-�� ��������']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['PODDONS',sPoddons,NULL]);

    sPoddon_ves:=FloatToStr(F_ForSystem.StrToReal(values['��� 1 �������,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['PODDON_VES',sPoddon_ves,NULL]);

    sShields:=FloatToStr(F_ForSystem.StrToReal(values['���-�� �����']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['SHIELDS',sShields,NULL]);

    sShield_ves:=FloatToStr(F_ForSystem.StrToReal(values['��� 1 ����,��']));
    ParentForm.pkgFor_ves.CallProcedure('set_param',['SHIELD_VES',sShield_ves,NULL]);
  end;
  with ParentForm do
  begin
    pkgFor_ves.CallProcedure('set_param',['PROD_ID_NPR',q_titleSVED_ID_NPR.AsString,NULL]);
    pkgFor_ves.CallProcedure('set_param',['PLAT_ID',q_titlePLAT_ID.AsString,NULL]);
    pkgFor_ves.CallProcedure('set_param',['KALIBR_ID',edKALIBR_ID.Text,NULL]);
    pkgFor_ves.CallProcedure('set_param_valsved',[q_titleID.AsString]);
  end;
end;

//////////////////////////////////////////////////////////////////////////////
//�������� ��� �������� �������� ��������: 1-��� defi_mass=1(����-������),2-//
//��� defi_mass<>1(�� ����� ��� ������� ���� ��,��,��� � ��), 3-���         //
//defi_mass<>1(�� ����� ��� ������� ���� �� � ���).                         //
//////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.CalculateCargoFeatures(Sender:string);
var
  IsEnoughParameters:boolean;
  pVes,pVzliv:double;
begin
  if (sender='VAGONTYPE_ID') or (sender='KALIBR_ID') or (sender='NUM_CIST') or (sender='VZLIV') then
  Begin
    pVzliv:=F_ForSystem.StrToReal(vlCargoFeatures.Values['�����,��']);
    if pVzliv<>0 then
      vlCargoFeatures.Values['�����,�']:=IntToStr(ParentForm.pkgFor_cist.CallIntegerFunction('GET_VOLUME',[edKALIBR_ID.Text,pVzliv,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
  end;

  //���� ������������ ���������� �� �����
  if (VAG_TYPE in Types2) and (defi_mass<>1) then
    with vlCargofeatures do
    begin
      IsEnoughParameters:= not ((values['���-�� �����']='')or(values['���-�� ��������']='')or
        (values['��� 1 �������,��']='')or(values['��� 1 ����,��']='')or(values['��� ������']='')or
        (values['���,��']='')or(edVes_cist.Text='')or(values['���-�� ��-� �����']='')or
        (values['���-�� �����']='0')or(values['���-�� ��������']='0')or
        (values['��� 1 �������,��']='0')or(values['��� 1 ����,��']='0')or(values['��� ������']='0')or
        (values['���,��']='0')or(edVes_cist.Text='0')or(values['���-�� ��-� �����']='0'));
      if not IsEnoughParameters then
      begin
        lbInfo.Caption:='������������ ���������� ��� �������';
        exit;
      end;
    end;//with � if

  //������� q_temp_ves,������ ������� temp_ves,�������� ��������� �������,��������� temp_ves ��� ������
  InitVagonParams;
  with ParentForm do
  Begin
    q_temp_ves.Close;
    pkgFor_ves.CallFloatFunction('calc_ves',[DateOf(q_titleSVED_DATE.Value),DocLoadTypeId,lcVagontype.KeyValue,DocMestoId,defi_mass]);
    q_temp_ves.Open;
  end;

  // ���������� ����������
  if defi_mass=1 then
  begin
    with vlCargoFeatures do
    begin
      if ParentForm.q_temp_ves.Locate('TAG','GOST',[loCaseInsensitive]) then
        if ParentForm.q_Gost.Locate('ID',ParentForm.q_temp_ves.FieldByName('VALUE').AsInteger,[]) then
          values['����']:=ParentForm.q_Gost.FieldByName('Name').AsString;
      SetCargoValues(sender,'FACT_PL','����.���������');
      SetCargoValues(sender,'CTLV','CTLv');
      SetCargoValues(sender,'VES','���,��');
      SetCargoValues(sender,'KOL_NET','��� �����');
      SetCargoValues(sender,'VOLUME15','����� ��� 15');
    end;
  end;
  if defi_mass<>1 then
  begin
    if VAG_TYPE in types1 then
    begin
      SetCargoValues(sender,'VES','���,��');
      SetCargoValues(sender,'VES_ALL','��� ������');
      SetCargoValues(sender,'KOL_NET','��� �����');
    end;
    if VAG_TYPE in types2 then
    begin
      SetCargoValues(sender,'KOL_ED','���-�� ��-� �����');
      SetCargoValues(sender,'VES_ED','��� ��-�� �����, ��');
      SetCargoValues(sender,'KOL_NET','��� �����');
      SetCargoValues(sender,'VES','���,��');
      SetCargoValues(sender,'VES_ALL','��� ������');
      if sender<>'VES_CIST' then
      begin
        if ParentForm.q_temp_ves.Locate('TAG','VES_CIST',[loCaseInsensitive]) then
          edVes_cist.Text:=ParentForm.q_temp_ves.FieldByName('VALUE').AsString;
      end;
      SetCargoValues(sender,'UPAK_VES','��� ��������,��');
      SetCargoValues(sender,'UPAK_VES_ED','��� 1 ��-�� ��������,��');
    end;
  end;//if

  if ParentForm.DocLoadTypeId=1 then
  Begin
    pVes:=F_ForSystem.StrToReal(vlCargoFeatures.Values['���,��']);
    edAxes.Text:=IntToStr(ParentForm.pkgFor_cist.CallIntegerFunction('GET_AXES',[edNum_cist.Text,edKALIBR_ID.Text,pVes,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
  end;

  lbinfo.Caption:='';//������� label � ������� �������� � ���������
end;//procedure

////////////////////////////////////////////////////////////////////////////////
//���������� �� CalculateCargoFeatures, ��������� ��������� q_temp_ves.Locate //
//  � Sender � ������ �� ������� ����������� ��� �� ����������� ��������      //
////////////////////////////////////////////////////////////////////////////////
procedure Tf_AddVagon.SetCargoValues(Sender,field,RusKey: string);
var i:integer;
begin
  if AnsiUpperCase(sender)<>AnsiUpperCase(field) then
    if ParentForm.q_temp_ves.Locate('TAG',field,[loCaseInsensitive])then
      if vlCargoFeatures.FindRow(RusKey,i) then
        vlCargoFeatures.values[RusKey]:=ParentForm.q_temp_ves.FieldByName('VALUE').AsString;
end;

//��������� ������� �� ����������� ���� ���� ��� ����� ��� ������ � ��� ��������
//���������� �� Tf_AddVagon.InitKey
procedure Tf_AddVagon.InitPickList(DataSet1:TOracleDataSet;pos:byte);
begin
  DataSet1.First;
  while not DataSet1.eof do
    begin
      vlCargoFeatures.ItemProps[pos].PickList.Add(DataSet1.FieldByName('Name').AsString);
      DataSet1.Next;
    end;
end;

//��������� �������� ���� � ������ ������������� ����� �, ���� ����, �������� ���������� ��������
procedure Tf_AddVagon.InitKey(pos,idx:byte);
begin
{  vlCargoFeatures.Strings[pos]:=CargoFeatures[idx].Name+'=';
  vlCargoFeatures.ItemProps[pos].EditMask:=CargoFeatures[idx].Mask;
  if (CargoFeatures[idx].DBFieldName='ZPU_TYPE1') or (CargoFeatures[idx].DBFieldName='ZPU_TYPE2')then
      InitPickList(ParentForm.q_ZpuType1,pos);
  if (CargoFeatures[idx].DBFieldName='UPAK_ID')then InitPickList(ParentForm.q_Upak,pos);}
end;



procedure Tf_AddVagon.FormCreate(Sender: TObject);
var tmp   :string;
begin
  ParentForm:=Tf_Sved(Owner);
  types1:=[1,6];
  types2:=[2,3,4,5,7,8,9];

  //������� ����������� �����������
  f_db.ReQuery(ParentForm.q_VagonType,false);
  f_db.ReQuery(ParentForm.q_VagOwner,false);
  f_db.ReQuery(ParentForm.q_VetkaPod,false);
  f_db.ReQuery(ParentForm.q_VetkaNapr,false);
  f_db.ReQuery(ParentForm.q_VetkaOtp,false);
  f_db.ReQuery(ParentForm.q_FormNakl,false);
  f_db.ReQuery(ParentForm.q_VagStatus,false);
  f_db.ReQuery(ParentForm.q_Gost,false);
  Defi_mass:=ParentForm.q_title.FieldByName('DEFI_MASS_ID').AsInteger;
  //�������������� ���������� ����������
  tmp:=f_main.GetApplVari('ZPU_TYPE1');
  ParentForm.q_ZpuType1.Locate('id',tmp,[]);
  zpu_type1:=ParentForm.q_ZpuType1.FieldByName('name').AsString;
  //��� ������ 2(��� ����� �� ����������� � ���������)
  tmp:=f_main.GetApplVari('ZPU_TYPE2');
  ParentForm.q_ZpuType2.Locate('id',tmp,[]);
  zpu_type2:=ParentForm.q_ZpuType1.FieldByName('name').AsString;
  //��� ������� � ����
  poddon_ves:=f_main.GetApplVari('PODDON_VES');
  shield_ves:=f_main.GetApplVari('SHIELD_VES');
end;

procedure Tf_AddVagon.FormActivate(Sender: TObject);
var D:double;
begin
  Recalculation:=true;

  with ParentForm.q_title do
  begin
    lbSved_info.Caption:='�������: '+FieldByName('SVED_PROD_NAME').AsString+#13#10+
                             '������� �: '+FieldByName('SVED_PASP_NUM').AsString+#13#10+
                             '��������� �: '+FieldByName('SVED_REZ_NUM').AsString+#13#10+
                             '����� ������ �����: '+FieldByName('DEFI_MASS_NAME').AsString+#13#10+
                             '��. ��� 20: '+FieldByName('PL20').AsString+'   '+
                             '��. ��� 15: '+FieldByName('PL15').AsString+#13#10+'   '+
                             '% ���. ����.: '+FieldByName('P_DIRT').AsString+'   '+
                             '% ����: '+FieldByName('P_VOD').AsString+'    '+
                             '% �����: '+FieldByName('P_SOL').AsString;
  end;

  if (EditMode=0) then
  begin
    IF EditID=0 Then
    Begin
      // ����������
      //������� �������� �� ���������
      Self.Caption:='���������� ������ � �������� �'+ParentForm.q_title.FieldByName('SVED_NUM').AsString+
        ' �� '+ParentForm.q_title.FieldByName('SVED_DATE').AsString;
      lcVetka_pod.KeyValue:=100;
      lcVetka_napr.KeyValue:=100;
      lcVag_Status.KeyValue:=0;
      lcForm_nakl.KeyValue:=2;
      lcVagonType.KeyValue:=6;

      if defi_mass=1 then FillCargoFeatures(1);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types1) then FillCargoFeatures(3);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types2) then FillCargoFeatures(2);
      cbAutoCalc.Checked:=true;
      edCurrVes.Text:='0.000 ��';
    end
    else
    Begin
      // �����������
      Self.Caption:='���������� ������ � �������� �'+ParentForm.q_title.FieldByName('SVED_NUM').AsString+
        ' �� '+ParentForm.q_title.FieldByName('SVED_DATE').AsString;
      //����������� �������� �� ����� ������������ ����� ��� ��������������
      lcVetka_pod.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_POD_ID').AsInteger;
      lcVetka_otp.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_OTP_ID').AsInteger;
      lcVetka_napr.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_NAPR_ID').AsInteger;
      lcVag_status.KeyValue:=ParentForm.q_Rows.FieldByName('VAG_STATUS_ID').AsInteger;
      lcForm_nakl.KeyValue:=ParentForm.q_Rows.FieldByName('FORMNAKL_ID').AsInteger;

      if defi_mass=1 then FillCargoFeatures(1);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types1) then FillCargoFeatures(3);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types2) then FillCargoFeatures(2);

      with vlCargoFeatures do
      Begin
        values['��� ������ 1']:=ParentForm.q_ZpuType1.FieldByName('Name').AsString;
        values['��� ������ 2']:=ParentForm.q_ZpuType2.FieldByName('Name').AsString;

        if TryStrToFloat(ParentForm.q_rows.FieldByName('PLOMBA1').AsString,D) then
        Begin
          values['������ 1']:=FloatToStr(ParentForm.q_rows.FieldByName('PLOMBA1').AsFloat+1);
          if TryStrToFloat(ParentForm.q_rows.FieldByName('ROSINSPL1').AsString,D) then
          Begin
            values['������ ��������������� 1']:=FloatToStr(ParentForm.q_rows.FieldByName('ROSINSPL1').AsFloat+1);
          end;
        end;

        if TryStrToFloat(ParentForm.q_rows.FieldByName('PLOMBA2').AsString,D) then
        Begin
          values['������ 2']:=FloatToStr(ParentForm.q_rows.FieldByName('PLOMBA2').AsFloat+1);
          if TryStrToFloat(ParentForm.q_rows.FieldByName('ROSINSPL2').AsString,D) then
          Begin
            values['������ ��������������� 2']:=FloatToStr(ParentForm.q_rows.FieldByName('ROSINSPL2').AsFloat+1);
          end;
        end;
        values['��� 1 �������,��']:=ParentForm.q_rows.FieldByName('PODDON_VES').AsString;
        values['��� 1 ����,��']:=ParentForm.q_rows.FieldByName('SHIELD_VES').AsString;
      end;
      cbAutoCalc.Checked:=true;
      edCurrVes.Text:='0.000 ��';
      EditId:=0;
    End;
  end
  else
    if EditId<>0 then
    Begin
      if (EditMode=1) then
      begin
        // ��������������
        Self.Caption:='�������������� ������ � �������� �'+ParentForm.q_title.FieldByName('SVED_NUM').AsString+
          ' �� '+ParentForm.q_title.FieldByName('SVED_DATE').AsString;
      end
      else
      Begin
        // ��������
        Self.Caption:='�������� ������ � �������� �'+ParentForm.q_title.FieldByName('SVED_NUM').AsString+
          ' �� '+ParentForm.q_title.FieldByName('SVED_DATE').AsString;
        gbVagon.Enabled:=false;
        gbStatus.Enabled:=false;
        gbNakl.Enabled:=false;
        gbSved.Enabled:=false;
        gbVes.Enabled:=false;
        gbControl.Visible:=false;
        btSave.Enabled:=false;
        btCalc.Enabled:=false;
      End;
      //����������� �������� �� ����� ������������ ����� ��� ��������������
      edNUM_CIST.Text:=ParentForm.q_Rows.FieldByName('NUM_CIST').AsString;
      lcVagonType.KeyValue:=ParentForm.q_Rows.FieldByName('VAGONTYPE_ID').AsInteger;
      VAG_TYPE:=lcVagonType.KeyValue;
      edNCISTDOP.Text:=ParentForm.q_Rows.FieldByName('NCISTDOP').AsString;
      edAXES.Text:=ParentForm.q_Rows.FieldByName('AXES').AsString;
      edCAPACITY.Text:=ParentForm.q_Rows.FieldByName('CAPACITY').AsString;
      edVES_CIST.Text:=ParentForm.q_Rows.FieldByName('VES_CIST').AsString;
      edKALIBR_ID.Text:=ParentForm.q_Rows.FieldByName('KALIBR_ID').AsString;
      lcVagowner.KeyValue:=ParentForm.q_Rows.FieldByName('VAGOWNER_ID').AsInteger;
      lcVetka_pod.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_POD_ID').AsInteger;
      lcVetka_otp.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_OTP_ID').AsInteger;
      lcVetka_napr.KeyValue:=ParentForm.q_Rows.FieldByName('VETKA_NAPR_ID').AsInteger;
      lcVag_status.KeyValue:=ParentForm.q_Rows.FieldByName('VAG_STATUS_ID').AsInteger;
      lcForm_nakl.KeyValue:=ParentForm.q_Rows.FieldByName('FORMNAKL_ID').AsInteger;
      cbAutoCalc.Checked:=(ParentForm.q_Rows.FieldByName('IS_AUTO').AsInteger=1);

      if defi_mass=1 then FillCargoFeatures(1);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types1) then FillCargoFeatures(3);
      if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types2) then FillCargoFeatures(2);

      Recalculation:=true;
      with vlCargoFeatures do
      begin
        values['���,��']:=ParentForm.q_rows.FieldByName('VES').AsString;
        edCurrVes.Text:=values['���,��']+' ��';
        if defi_mass=1 then
        begin
          if ParentForm.q_Gost.Locate('ID',ParentForm.q_rows.FieldByName('GOST_ID').AsInteger,[]) then
            values['����']:=ParentForm.q_Gost.FieldByName('Name').AsString;
          values['�����,��']:=ParentForm.q_rows.FieldByName('VZLIV').AsString;
          values['�����,�']:=ParentForm.q_rows.FieldByName('VOLUME').AsString;
          values['�����������,''�']:=ParentForm.q_rows.FieldByName('TEMPER').AsString;
          values['����.���������']:=ParentForm.q_rows.FieldByName('FAKT_PL').AsString;
          values['CTLv']:=ParentForm.q_rows.FieldByName('CTLV').AsString;
          values['����� ��� 15']:=ParentForm.q_rows.FieldByName('VOLUME15').AsString;
          values['��� �����']:=ParentForm.q_rows.FieldByName('KOL_NET').AsString;
        end;
        if (defi_mass<>1)and(ParentForm.q_VagonTypeID.Value in types1)then
        begin
          values['�����������,''�']:=ParentForm.q_rows.FieldByName('TEMPER').AsString;
          values['��� ������']:=ParentForm.q_rows.FieldByName('VES_ALL').AsString;
          values['��� �����']:=ParentForm.q_rows.FieldByName('KOL_NET').AsString;
        end;
        if (defi_mass<>1) and (ParentForm.q_VagonTypeID.Value in types2) then
        begin
          values['��� ��-�� �����, ��']:=ParentForm.q_rows.FieldByName('VES_ED').AsString;
          values['���-�� ��-� �����']:=ParentForm.q_rows.FieldByName('KOL_ED').AsString;
          values['��� ��������,��']:=ParentForm.q_rows.FieldByName('UPAK_VES').AsString;
          values['��� 1 ��-�� ��������,��']:=ParentForm.q_rows.FieldByName('UPAK_VES_ED').AsString;
          values['��� ������']:=ParentForm.q_rows.FieldByName('VES_ALL').AsString;
          values['���-�� ��������']:=ParentForm.q_rows.FieldByName('PODDONS').AsString;
          values['��� 1 �������,��']:=ParentForm.q_rows.FieldByName('PODDON_VES').AsString;
          values['���-�� �����']:=ParentForm.q_rows.FieldByName('SHIELDS').AsString;
          values['��� 1 ����,��']:=ParentForm.q_rows.FieldByName('SHIELD_VES').AsString;
          if ParentForm.q_Upak.Locate('ID',ParentForm.q_rows.FieldByName('UPAK_ID').AsInteger,[]) then
             values['��� ��������']:=ParentForm.q_Upak.FieldByName('Name').AsString;
        end;

        //������ ���������� ��� ����� ������ �����������
        if ParentForm.q_ZpuType1.Locate('ID',ParentForm.q_rows.FieldByName('ZPU_TYPE1').AsInteger,[]) then
           values['��� ������ 1']:=ParentForm.q_ZpuType1.FieldByName('Name').AsString;
        if ParentForm.q_ZpuType2.Locate('ID',ParentForm.q_rows.FieldByName('ZPU_TYPE2').AsInteger,[]) then
           values['��� ������ 2']:=ParentForm.q_ZpuType2.FieldByName('Name').AsString;

        values['������ 1']:=ParentForm.q_rows.FieldByName('PLOMBA1').AsString;
        values['������ ��������������� 1']:=ParentForm.q_rows.FieldByName('ROSINSPL1').AsString;
        values['������ 2']:=ParentForm.q_rows.FieldByName('PLOMBA2').AsString;
        values['������ ��������������� 2']:=ParentForm.q_rows.FieldByName('ROSINSPL2').AsString;
        // �������� ����
        if cbAutoCalc.Checked then
        begin
          // �������� ���������� �����
          CalculateCargoFeatures('NUM_CIST');
        end;
      end;//with
    end;//if EditId<>0

  Recalculation:=false;
  Isloading:=false;
end;

procedure Tf_AddVagon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Recalculation:=true;
  vlCargoFeatures.Strings.Clear;
  Recalculation:=false;
end;

procedure Tf_AddVagon.edAXESExit(Sender: TObject);
begin
  if edAxes.Text=EmptyStr then edAxes.Text:='4';
  edCheckFloat(Sender);
end;

procedure Tf_AddVagon.btCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tf_AddVagon.edNUM_CISTChange(Sender: TObject);
var str:string;
begin
  if IsLoading then exit; // ���� ���� �������� ����� - �������

  if not edNUM_CIST.Modified then
  Begin
    // ����� ������ �� ��������� - �������
    exit;
  End;

  // ������� ���������� � ������
  GetCistValues(edNUM_CIST);

  // ��������� ����� ������
  IF ParentForm.pkgFOR_CIST.CallIntegerFunction('CHECK_NUM_CIST',[edNUM_CIST.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue])=0 then
  Begin
    f_main.ApplSession.WriteToLog(amFull,'VED_OSMOTR',sesError,'�������� ����� ������ '+edNUM_CIST.Text+' !',0,'');
    edNUM_CIST.SetFocus;
  End;

  //������� �������������� �� ������ ���� ��� ����
  with ParentForm do
  try
    q_cist_deni.Close;
    q_cist_deni.SetVariable(':NUM_CIST',edNUM_CIST.Text);
    q_cist_deni.Open;
    while not q_cist_deni.Eof do
    begin
      str:=str+q_cist_deni.FieldByName('num_cist').AsString+' '+q_cist_deni.FieldByName('beg_deni').AsString+' '+q_cist_deni.FieldByName('prim').AsString+#13#10;
      q_cist_deni.Next;
    end;
    if not q_cist_deni.IsEmpty then
    begin
      Application.MessageBox(Pchar(str),'��������!');
    end;
  finally
    q_cist_deni.Close;
  end;

  // ��� ������ ��������� - ���������� ������ ���������� �����
  if VAG_TYPE<>lcVagonType.KeyValue then
  Begin
    Recalculation:=true;
    SaveCargoFeatures;
    if defi_mass=1 then FillCargoFeatures(1);
    if (defi_mass<>1) and (integer(lcVagonType.KeyValue) in types1) then FillCargoFeatures(3);
    if (defi_mass<>1) and not (integer(lcVagonType.KeyValue) in types1) then FillCargoFeatures(2);
    RestoreCargoFeatures;
    Recalculation:=False;
  end;

  VAG_TYPE:=lcVagonType.KeyValue;//�������� ��� ������ � ���������� ����������

  if cbAutoCalc.Checked then
  begin
    // �������� ���������� �����
    CalculateCargoFeatures('NUM_CIST');
  end;

  edNUM_CIST.Modified:=false;
end;


procedure Tf_AddVagon.lcVagonTypeChange(Sender: TObject);
begin
  if IsLoading then exit; // ���� ���� �������� ����� - �������

  if VAG_TYPE=lcVagonType.KeyValue then
  Begin
    // ��� ������ �� ��������� - �������
    exit;
  End;

  // ������� ���������� � ������
  GetCistValues(lcVagonType);
  // ��� ������ ��������� - ���������� ������ ���������� �����
  Recalculation:=true;
  SaveCargoFeatures;
  if defi_mass=1 then FillCargoFeatures(1);
  if (defi_mass<>1) and (integer(lcVagonType.KeyValue) in types1) then FillCargoFeatures(3);
  if (defi_mass<>1) and not (integer(lcVagonType.KeyValue) in types1) then FillCargoFeatures(2);
  RestoreCargoFeatures;
  Recalculation:=False;

  VAG_TYPE:=lcVagonType.KeyValue;;//�������� ��� ������ � ���������� ����������

  if cbAutoCalc.Checked then
  begin
    // �������� ���������� �����
    CalculateCargoFeatures('VAGONTYPE_ID');
  end;
end;

procedure Tf_AddVagon.vlCargoFeaturesValidate(Sender: TObject; ACol,
  ARow: Integer; const KeyName, KeyValue: String);
var pVzliv, pVes:string;

begin
  //���� ������ OnValidate ��������� � ���-�� ��������� �� ��������� ��������� �� �����
  if Recalculation then exit;
  //���� �������������� ������ ������������� �������� �� �����
  if not cbAutoCalc.Checked then exit;

  if (KeyName='�����,��') or
     (KeyName='�����,�') or
     (KeyName='�����������,''�') or
     (KeyName='���-�� ��-� �����') or
     (KeyName='��� ��-�� �����, ��') or
     (KeyName='���-�� �����') or
     (KeyName='��� 1 ����,��') or
     (KeyName='���-�� ��������') or
     (KeyName='��� 1 �������,��') or
     (KeyName='���,��') or
     (KeyName='��� ��������,��') or
     (KeyName='��� 1 ��-�� ��������,��') or
     (KeyName='��� ������') or
     (KeyName='����.���������') or
     (KeyName='CTLv') or
     (KeyName='����� ��� 15') or
     (KeyName='��� �����') then
  begin
    vlCargoFeatures.Values[KeyName]:=FloatToStr(F_ForSystem.StrToReal(KeyValue));
  end;

  Recalculation:=true;
  if defi_mass=1 then
  begin
    if KeyName='�����,��' then CalculateCargoFeatures('VZLIV');
    if KeyName='�����,�' then CalculateCargoFeatures('VOLUME');
    if KeyName='�����������,''�' then CalculateCargoFeatures('TEMPER');
    if KeyName='CTLv' then CalculateCargoFeatures('CTLV');
    if KeyName='����� ��� 15' then CalculateCargoFeatures('VOLUME15');
    if KeyName='���,��' then CalculateCargoFeatures('VES');
    if KeyName='����.���������' then CalculateCargoFeatures('FACT_PL');
  end;

  if defi_mass<>1 then
  begin
    //��� ����������� � ��.
    if VAG_TYPE in Types2 then
    begin
      if KeyName='���-�� ��-� �����' then CalculateCargoFeatures('KOL_ED');
      if KeyName='��� ��-�� �����, ��' then CalculateCargoFeatures('VES_ED');
      if KeyName='���-�� �����' then CalculateCargoFeatures('SHIELDS');
      if KeyName='��� 1 ����,��' then CalculateCargoFeatures('SHIELD_VES');
      if KeyName='���-�� ��������' then CalculateCargoFeatures('PODDONS');
      if KeyName='��� 1 �������,��' then CalculateCargoFeatures('PODDON_VES');
      if KeyName='���,��' then CalculateCargoFeatures('VES');
      if KeyName='��� ��������,��' then CalculateCargoFeatures('UPAK_VES');
      if KeyName='��� 1 ��-�� ��������,��' then CalculateCargoFeatures('UPAK_VES_ED');
      if KeyName='��� ������' then CalculateCargoFeatures('VES_ALL');
    end;
    //��� �������� � �������
    if VAG_TYPE in Types1 then
    begin
      if KeyName='��� ������' then CalculateCargoFeatures('VES_ALL');
      if KeyName='���,��' then CalculateCargoFeatures('VES');
    end;
  end;
  Recalculation:=false;
end;

procedure Tf_AddVagon.edVES_CISTChange(Sender: TObject);
begin
  if IsLoading then exit; // ���� ���� �������� ����� - �������

  if not edVes_cist.Modified then
  begin
    // ��� ������ �� ��������� - �������
    exit;
  End;

  edCheckFloat(Sender);

  if cbAutoCalc.Checked then
  begin
    // �������� ���������� �����
    CalculateCargoFeatures('VES_CIST');
  end;

  edVes_cist.Modified:=false;
end;

procedure Tf_AddVagon.edKALIBR_IDChange(Sender: TObject);
var pVes:double;
begin
  if IsLoading then exit; // ���� ���� �������� ����� - �������

  if not edKALIBR_ID.Modified then
  begin
    // ��� ������ �� ��������� - �������
    exit;
  End;

  // ��������� ���������� � ������
  edKALIBR_ID.Text:=AnsiUpperCase(edKALIBR_ID.Text);
  IF edKALIBR_ID.Text='25A' THEN edKALIBR_ID.Text:='25�';
  pVes:=F_ForSystem.StrToReal(vlCargoFeatures.Values['���,��']);
  edCapacity.Text:=FloatToStr(ParentForm.pkgFor_cist.CallFloatFunction('GET_CAPACITY',[edNum_cist.Text,edKALIBR_ID.Text,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));
  edAxes.Text:=IntToStr(ParentForm.pkgFor_cist.CallIntegerFunction('GET_AXES',[edNum_cist.Text,edKALIBR_ID.Text,pVes,ParentForm.DocLoadTypeId,lcVagonType.KeyValue]));

  if cbAutoCalc.Checked then
  begin
    // �������� ���������� �����
    CalculateCargoFeatures('KALIBR_ID');
  end;

  edKALIBR_ID.Modified:=false;
end;

procedure Tf_AddVagon.vlCargoFeaturesStringsChange(Sender: TObject);
begin
  edNewVes.Text:=vlCargoFeatures.values['���,��']+' ��';
{  //���� ������ OnChange ��������� � ���-�� ��������� �� ��������� ��������� �� �����
  if Recalculation then exit;
  //���� ������� ������� �� grid �� ������ �� ���������(�� ��������� ������ ����� �������� OnValidate)
  if ActiveControl=vlCargoFeatures then exit;
  //���� �������������� ������ ������������� �������� �� �����
  if not cbAutoCalc.Checked then exit;

  Recalculation:=true;
  CalculateCargoFeatures('vlCargoFeatures');
  Recalculation:=false;}
end;

procedure Tf_AddVagon.btSaveClick(Sender: TObject);
var
  pSVED_ID,pNUM_CIST,pCAPACITY,pWES1,pKALIBR_ID,pPLOMBA1,pTIP1,pPLOMBA2,pROSINSPL1,pROSINSPL2:string;
  pSVED_POS,pVES_CIST:double;
  pVZLIV,pVOLUME,pTEMPER,pFAKT_PL,pVES,pKOL_NET,pVES_ALL,pVES_ED,pVOLUME15,pCTLV:double;
  pUPAK_VES,pUPAK_VES_ED,pPODDON_VES,pSHIELD_VES:double;

  pNCISTDOP,pAxes,pVAGONTYPE_ID,pVAGOWNER_ID,pVAG_STATUS_ID,pVETKA_NAPR_ID,pVETKA_POD_ID,pVETKA_OTP_ID:integer;
  pFORMNAKL_ID,pKOL_ED,pSHIELDS,pPODDONS,pZPU_TYPE2,pZPU_TYPE1,pUPAK_ID,pGOST,pIS_AUTO:integer;
begin
{ FUNCTION AddRow(pCOMMIT NUMBER, pID NUMBER, pSVED_ID VARCHAR2, pSVED_POS NUMBER,
  pNUM_CIST VARCHAR2, pNCISTDOP NUMBER, pAXES NUMBER, pCAPACITY VARCHAR2, pWES1 VARCHAR2, pVES_CIST NUMBER,
	pVAGONTYPE_ID NUMBER, pKALIBR_ID VARCHAR2, pTIP1 VARCHAR2, pVAGOWNER_ID NUMBER,
	pVETKA_POD_ID NUMBER, pVETKA_OTP_ID NUMBER, pVETKA_NAPR_ID NUMBER, pVAG_STATUS_ID NUMBER,
	pVZLIV NUMBER, pVOLUME NUMBER, pTEMPER NUMBER, pFAKT_PL NUMBER, pVES NUMBER, pKOL_NET NUMBER,
	pVES_ALL NUMBER, pVES_ED NUMBER, pKOL_ED NUMBER, pUPAK_ID NUMBER, pUPAK_VES NUMBER, pUPAK_VES_ED NUMBER,
	pPODDONS NUMBER, pPODDON_VES NUMBER, pSHIELDS NUMBER, pSHIELD_VES NUMBER,
	pZPU_TYPE1 NUMBER, pZPU_TYPE2 NUMBER, pPLOMBA1 VARCHAR2, pPLOMBA2 VARCHAR2, pROSINSPL1 VARCHAR2,
	pROSINSPL2 VARCHAR2, pFORMNAKL_ID NUMBER) RETURN VARCHAR2;}
  if edNum_cist.Text=EmptyStr then
  begin
    Application.MessageBox('�� �������� ����� ������!','��������',MB_OK);
    edNum_cist.SetFocus;
    exit;
  end;

  try
    pSved_Id:=ParentForm.q_title.FieldByName('ID').AsString;
    //�������������� �������� ������� ��������(���� ��������� �� ����� ���� ����������� �� ������)
    if EditMode=0 then pSVED_POS:=ParentForm.pkgFOR_sved.CallFloatFunction('GetMaxNumPos',[ParentForm.q_title.FieldByName('ID').AsString])
    else pSVED_POS:=ParentForm.q_rowsSVED_POS.Value;

    pNum_cist:=Trim(edNum_cist.Text);

    pNCISTDOP:=F_ForSystem.StrToInteger(edNCISTDOP.text);
    pAxes:=F_ForSystem.StrToInteger(edAxes.text);
    pCAPACITY:=edCAPACITY.Text;
    pWes1:='';
    pVes_cist:=F_ForSystem.StrToReal(edVes_cist.Text);
    pVagonType_id:=lcVagonType.KeyValue;
    pKalibr_Id:=edKALIBR_ID.Text;
    pTip1:='';
    if cbAutoCalc.Checked then pIS_AUTO:=1 else pIS_AUTO:=0;
    if lcVagowner.KeyValue<>Null then pVagOwner_id:=lcVagowner.KeyValue;
    if lcVetka_pod.KeyValue<>Null then pVETKA_POD_ID:=lcVetka_pod.KeyValue;
    if lcVetka_napr.KeyValue<>Null then pVETKA_NAPR_ID:=lcVetka_napr.KeyValue;
    if lcVetka_otp.KeyValue<>Null then pVETKA_OTP_ID:=lcVetka_otp.KeyValue;
    if lcVag_status.KeyValue<>Null then pVAG_STATUS_ID:=lcVag_status.KeyValue;
    if lcForm_nakl.KeyValue<>Null then pFORMNAKL_ID:=lcForm_nakl.KeyValue;

    with vlCargoFeatures do
    begin
      if defi_mass=1 then
      begin
         pVZLIV:=F_ForSystem.StrToReal(values['�����,��']);
         pVOLUME:=F_ForSystem.StrToReal(values['�����,�']);
         pFAKT_PL:=F_ForSystem.StrToReal(values['����.���������']);
         pVOLUME15:=F_ForSystem.StrToReal(values['����� ��� 15']);
         pCTLV:=F_ForSystem.StrToReal(values['CTLv']);
         if ParentForm.q_Gost.Locate('Name',Values['����'],[loCaseInsensitive]) then
            pGOST:=ParentForm.q_Gost.FieldByName('ID').AsInteger;
      end;
      if defi_mass<>1 then
      begin
        pVES_ALL:=F_ForSystem.StrToReal(values['��� ������']);
        pVES_ED:=F_ForSystem.StrToReal(values['��� ��-�� �����, ��']);
        pKOL_ED:=F_ForSystem.StrToInteger(values['���-�� ��-� �����']);
        pUPAK_VES:=F_ForSystem.StrToReal(values['��� ��������,��']);
        pUPAK_VES_ED:=F_ForSystem.StrToReal(values['��� 1 ��-�� ��������,��']);

        pPODDONS:=F_ForSystem.StrToInteger(values['���-�� ��������']);
        pPODDON_VES:=F_ForSystem.StrToReal(values['��� 1 �������,��']);
        pSHIELDS:=F_ForSystem.StrToInteger(values['���-�� �����']);
        pSHIELD_VES:=F_ForSystem.StrToReal(values['��� 1 ����,��']);
        if parentForm.q_Upak.Locate('NAME',values['��� ��������'],[loCaseInsensitive]) then
                                                              pUPAK_ID:=ParentForm.q_UpakID.AsInteger;

      end;//if defi_mass<>1

      //��������� ��������� ����� ��� ���� ����� ����������� �����
      pTEMPER:=F_ForSystem.StrToReal(values['�����������,''�']);
      pVES:=F_ForSystem.StrToReal(values['���,��']);
      pKOL_NET:=F_ForSystem.StrToReal(values['��� �����']);
      if ParentForm.q_ZpuType1.Locate('Name',Values['��� ������ 1'],[loCaseInsensitive]) then
                 pZPU_TYPE1:=ParentForm.q_ZpuType1.FieldByName('ID').AsInteger;
      pPlomba1:=values['������ 1'];
      pROSINSPL1:=values['������ ��������������� 1'];
      if ParentForm.q_ZpuType2.Locate('Name',Values['��� ������ 2'],[loCaseInsensitive]) then
                   pZPU_TYPE2:=ParentForm.q_ZpuType2.FieldByName('ID').AsInteger;
      pPlomba2:=values['������ 2'];
      pROSINSPL2:=values['������ ��������������� 2'];
    end;//with
  except
    on EConvertError do
        begin
          Application.MessageBox('������� �������� �������� ��������!'+#10#13+'�������� ��������� ������!','��������!');
          exit;
        end;
  end;

  try
    EditId:=ParentForm.pkgFor_sved.CallStringFunction('AddRow',[1, EditId, pSVED_ID, pSVED_POS,
    pNUM_CIST, pNCISTDOP, pAXES, pCAPACITY, pWES1, pVES_CIST,
    pVAGONTYPE_ID, pKALIBR_ID, pTIP1, pVAGOWNER_ID,
	  pVETKA_POD_ID, pVETKA_OTP_ID, pVETKA_NAPR_ID, pVAG_STATUS_ID,
    pVZLIV, pVOLUME, pTEMPER, pFAKT_PL, pVES, pKOL_NET,
	  pVES_ALL, pVES_ED, pKOL_ED, pUPAK_ID, pUPAK_VES, pUPAK_VES_ED,
    pPODDONS, pPODDON_VES, pSHIELDS, pSHIELD_VES,
	  pZPU_TYPE1, pZPU_TYPE2, pPLOMBA1, pPLOMBA2, pROSINSPL1,
    pROSINSPL2, pFORMNAKL_ID,pGost,pVolume15,pCTLV,pIS_AUTO])
  except
    on E: Exception do
    Begin
      // ��������� ������
      f_main.ApplSession.WriteToLog(amFull,'SvedAddVagon',sesError,E.Message,0,'');
      ParentForm.ora_Session.Rollback;
      exit;
    end;
  end;

  ParentForm.ora_Session.Commit;
  ModalResult:=mrOk;

end;


procedure Tf_AddVagon.btCalcClick(Sender: TObject);
begin
  CalculateCargoFeatures('NUM_CIST');
end;

procedure Tf_AddVagon.edCheckFloat(Sender: TObject);
begin
  TEdit(Sender).Text:=FloatToStr(F_ForSystem.StrToReal(TEdit(Sender).Text));
end;

procedure Tf_AddVagon.edNCISTDOPExit(Sender: TObject);
begin
  if edNCISTDOP.Text=EmptyStr then edNCISTDOP.Text:='20';
  edCheckFloat(Sender);
end;

end.
