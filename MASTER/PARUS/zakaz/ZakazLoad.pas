Unit ZakazLoad;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList,  ActnMan, dateutils,
  StrUtils, ComCtrls, ImgList, XPStyleActnCtrls, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmZakaz = Class(TForm)
    oraCord: TOracleDataSet;
    dsCord: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgCord: TDBGridEh;
    ActionManager1: TActionManager;
    acFilter: TAction;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    OraQuery: TOracleQuery;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    oraQ: TOracleQuery;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    oraProps: TOracleQuery;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    oraState: TOracleQuery;
    rbPotreb: TRadioButton;
    rbArxPotr: TRadioButton;
    oraDelIns: TOracleQuery;
    oraDelsIns: TOracleQuery;
    oraDelCat: TOracleQuery;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    oraDelState: TOracleQuery;
    oraInvState: TOracleQuery;
    oraCordINPUT_NUMBER: TStringField;
    oraCordINPUT_DATE: TDateTimeField;
    oraCordPOLUCH: TStringField;
    oraCordSTAN_NAME: TStringField;
    oraCordSTAN_KOD: TIntegerField;
    oraCordREGION_NAME: TStringField;
    oraCordKOD_MOSCOW: TStringField;
    oraCordTIP_CORP_ID: TFloatField;
    oraCordPERIOD_ID: TFloatField;
    oraCordPERIOD: TStringField;
    oraCordSSHIPVIEW: TStringField;
    oraCordSPAY_TYPE: TStringField;
    oraCordSSUBDIV: TStringField;
    oraCordSJUR_PERS: TStringField;
    oraCordSTARIF: TStringField;
    oraCordSAGNFIFO: TStringField;
    oraCordGR4: TStringField;
    oraCordDATA_PLAN: TDateTimeField;
    oraCordFILIAL_ID: TFloatField;
    Button1: TButton;
    oraCords: TOracleDataSet;
    oraCordsINPUT_NUMBER: TStringField;
    oraCordsINPUT_DATE: TDateTimeField;
    oraCordsDATA_PLAN: TDateTimeField;
    oraCordsTIP_CORP_ID: TFloatField;
    oraCordsPERIOD_ID: TFloatField;
    oraCordsFILIAL_ID: TFloatField;
    oraCordsSTAN_ID: TFloatField;
    oraCordsGR4: TStringField;
    oraCordsTIP_CORP: TStringField;
    oraCordsIDZ: TStringField;
    oraCordsGOSPROG_NAME: TStringField;
    oraCordsMODIF: TStringField;
    oraCordsMOD_MODIF: TStringField;
    oraCordsFSUM_VES: TFloatField;
    oraCordsSSUM_VES: TFloatField;
    oraCordsSUM_VES2: TFloatField;
    oraCordSTAN_ID: TFloatField;
    oraCordIDZ: TStringField;
    oraCordSAGENT: TStringField;
    oraCordSFACEACC: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure dbgCordGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure LoadParus(z: integer);
    Procedure deBegChange(Sender: TObject);
    Procedure WriteEvent(Tag: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmZakaz                               : TfrmZakaz;

Implementation

Uses MAIN, DMunit;

{$R *.dfm}

Procedure TfrmZakaz.WriteEvent(Tag: String);
Begin
  frmMain.WriteEvent(Tag, ' ����� "������ ������������ ��� ����� � �����"');
End;

Procedure TfrmZakaz.acFilterExecute(Sender: TObject);
Begin
  If oraCord.Active Then
    oraCord.Close;
  oraCord.SQL[32] := 'and (zakaz.date_plan between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[32] := oraCord.SQL[32] + 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy''))';
//  If rbArxPotr.Checked Then //����������� ��
//    oraCord.SQL[18] := 'and ps.region_id=21'
//  Else
//    oraCord.SQL[18] := 'and (ps.region_id<>21 or ps.region_id is null)';
  oraCord.Open;
  WriteEvent ('������ ������ c '+deBeg.Text+' �� '+deEnd.Text+'.');
End;

Procedure TfrmZakaz.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 1;
  deEnd.Date := date;
  WriteEvent('����� �������');
  frmMain.acConnectToMaster.Execute;
  frmMain.acConnectToParus.Execute;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmZakaz.FormClose(Sender: TObject; Var Action: TCloseAction);
var
i:integer;
Begin
  oraCord.Close;
  oraCatalog.Close;
  frmMain.acDisconnectFromMaster.Execute;
  frmMain.acDisconnectFromParus.Execute;
  WriteEvent('����� �������');
  action := caFree;
End;

Procedure TfrmZakaz.acLoadExecute(Sender: TObject);
Begin
  LoadParus(1);
End;

Procedure TfrmZakaz.LoadParus(z: integer);
Var
  summ                                  : String;
  st1, st2, rn_crn, rn_crn2             : String;
  rn_sved, rn, rn_isp, rn_isps, rn_svedp, rn_sved3: integer;
  ss                                    : ^TOracleDataSet;
Begin
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  //����� �������� ��� ������ ����������
  oraDelCat.ClearVariables;
  oraDelCat.SetVariable(':nFLAG_SMART',1);
  oraDelCat.SetVariable(':nCOMPANY',2);
  oraDelCat.SetVariable(':sUNITCODE','DeliveryOrders');
  oraDelCat.SetVariable(':sNAME','�/� ���');
  oraDelCat.Execute;
  rn_crn2 := IntToStr(oraDelCat.GetVariable(':nRN'));
  oraDelCat.Close;
  If z = 1 Then
    ss := @oraCord;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      WriteEvent('������� � ����� ������ �' {+ ss^.fieldbyname('nom_zd').AsString }+ '.');
      rn_sved := 0;
      rn := 0;
      oraInvIns.ClearVariables;
      // ������������ ������ ������������ �� ������ �� �������
      oraInvIns.SetVariable(':nCOMPANY', 2);
      oraInvIns.SetVariable(':nCRN', rn_crn);
      oraInvIns.SetVariable(':sJUR_PERS', '�����������������');
      if AnsiUpperCase(leftStr(trim(ss^.fieldbyname('gr4').asString), 4))= '����' then
      Case  ss^.fieldbyname('period_id').AsInteger of
      1:oraInvIns.SetVariable(':sORD_DOCTYPE', '���������'); // ��� ����������
      2:oraInvIns.SetVariable(':sORD_DOCTYPE', '�������');  // ��� ���������
      3:oraInvIns.SetVariable(':sORD_DOCTYPE', '��������'); // ��� ��������
      End
      else
      Case  ss^.fieldbyname('period_id').AsInteger of
      1:oraInvIns.SetVariable(':sORD_DOCTYPE', '��������'); // ��� ����������
      2:oraInvIns.SetVariable(':sORD_DOCTYPE', '������');  // ��� ���������
      3:oraInvIns.SetVariable(':sORD_DOCTYPE', '�������'); // ��� ��������
      End;
      oraInvIns.SetVariable(':sORD_PREF', ss^.fieldbyname('input_number').asString);
      if ss^.fieldbyname('data_plan').AsDateTime > StrToDateTime('31.12.2006') then
       oraInvIns.SetVariable(':sORD_NUMB', ss^.fieldbyname('stan_kod').asString + '1');
      if ss^.fieldbyname('data_plan').asDateTime > StrToDateTime('31.03.2007') then
       oraInvIns.SetVariable(':sORD_NUMB', ss^.fieldbyname('stan_kod').asString + '2');
      if ss^.fieldbyname('data_plan').asDateTime > StrToDateTime('30.06.2007') then
       oraInvIns.SetVariable(':sORD_NUMB', ss^.fieldbyname('stan_kod').asString + '3');
      if ss^.fieldbyname('data_plan').asDateTime > StrToDateTime('30.09.2007') then
       oraInvIns.SetVariable(':sORD_NUMB', ss^.fieldbyname('stan_kod').asString + '4');
      oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
      oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
      oraInvIns.SetVariable(':dORD_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime));
      oraInvIns.SetVariable(':nORD_STATE', 0);
      oraInvIns.SetVariable(':dSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
      oraInvIns.SetVariable(':sDISP_TYPE', trim(ss^.fieldbyname('sshipview').asString));
      oraInvIns.SetVariable(':sPAY_TYPE', trim(ss^.fieldbyname('spay_type').asString));
      oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
      oraInvIns.SetVariable(':sCURRENCY', '���.');
      Case ss^.fieldbyname('filial_id').asInteger of
      31: oraInvIns.SetVariable(':sSTORE', '����_��');
      40: oraInvIns.SetVariable(':sSTORE', '�����_�������_�����');
      else oraInvIns.SetVariable(':sSTORE', '����_��');
      End;
      oraInvIns.SetVariable(':sACC_AGENT', '���������� �.�.');
      Case ss^.fieldbyname('filial_id').asInteger of
      31: oraInvIns.SetVariable(':sSUBDIV', '10700');
      40: oraInvIns.SetVariable(':sSUBDIV', '0�100');
      else oraInvIns.SetVariable(':sSUBDIV', '10700');
      End;
//      oraInvIns.SetVariable(':sSUBDIV', '�����_��������');
      oraInvIns.SetVariable(':dPAY_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime ));
      oraInvIns.SetVariable(':dRELEASE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime));
      oraInvIns.SetVariable(':dPRICE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime));
      oraInvIns.SetVariable(':nORD_PERIOD', 0);
      oraInvIns.SetVariable(':nPERIOD_CORR', 1);
      oraInvIns.SetVariable(':nPERIOD_QUANT', 1);
      oraInvIns.SetVariable(':nPERIOD_TYPE', 0);
      oraInvIns.SetVariable(':nPERIOD_LEN', 1);
      oraInvIns.SetVariable(':nATSAMETIME', 1);
      oraInvIns.SetVariable(':nPRICE_TYPE', 1);
      oraInvIns.SetVariable(':nREDUCTION', 0);
      //if not ((leftStr(trim(ss^.fieldbyname('sagnfifo').asString),1) = '/') or (RightStr(trim(ss^.fieldbyname('sagnfifo').asString),1) = '/')) then
      //oraInvIns.SetVariable(':sAGNFI', trim(ss^.fieldbyname('sagnfifo').asString));//���������������
      Try
        Begin
          oraInvIns.Execute;
          rn_sved := oraInvIns.GetVariable(':nRN');
          rn_svedp:= oraInvIns.GetVariable(':nRN');
          // ������������ ��������������� �������� ��� �� ������ ������������
          oraProps.ClearVariables;
          oraProps.SetVariable(':NCOMPANY', 2);
          oraProps.SetVariable(':NRN', rn_sved);
          oraProps.SetVariable(':SUNITCODE', 'ConsumersOrders');
          oraProps.SetVariable(':SCODE', '��� ��');
          oraProps.SetVariable(':NFORMAT', 0);
          oraProps.SetVariable(':SSTR_VALUE', '770800476705');
          Try
            Begin
              oraProps.Execute;
              WriteEvent('�������� ��� �� ��������.');
            End;
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          // ������������ �������������� ������� �/� ������� ������ ������������
          oraProps.ClearVariables;
          oraQ.SQL.Clear;
          oraQ.SQL.Add('select str_value, note from extra_dicts_values where');
          oraQ.SQL.Add('UPPER(note)=''' + ss^.fieldbyname('stan_name').asString + '''');
          oraQ.execute;
          If (oraQ.RowCount > 0) Then
            Begin
              // ������������ ��������������� �������� ��� �/� �������
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrders');
              oraProps.SetVariable(':SCODE', '��� �������');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', oraQ.FieldAsString(0));
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('�������� ��� ������� ��������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;

              //������������ ��������������� �������� ������������ ������� ����������
              oraProps.ClearVariables;
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrders');
              oraProps.SetVariable(':SCODE', '��������������');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', oraQ.FieldAsString(1));
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('��������  ������������ ������� ���������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
            End;
          oraQ.Clear;
          //������ ��������
              oraProps.ClearVariables;
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrders');
              oraProps.SetVariable(':SCODE', '�����������');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', trim(ss^.fieldbyname('REGION_NAME').asString));
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('�������� ������ �������� ��������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
          End;
 {         // ������������ ��������������
          oraInvsIns.ClearVariables;
          oraInvsIns.SetVariable(':nCOMPANY', 2);
          oraInvsIns.SetVariable(':nPRN', rn_sved);
          oraInvsIns.SetVariable(':sNOMEN', '�� ���������������');
					oraInvsIns.SetVariable(':sNOM_MODIF', '�� ���������������');
          if (ss^.fieldbyname('data_plan').asDateTime >= StrToDate('01.01.2006')) then
    					oraInvsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code_new').asString))
          else
    					oraInvsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code').asString));
          oraInvsIns.SetVariable(':nEXP_PRICE', 1.18);
          oraInvsIns.SetVariable(':nPR_MEAS', 0);
          oraInvsIns.SetVariable(':sSTORE', '����_��');
          oraInvsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraInvsIns.SetVariable(':dBEGIN_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraInvsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraInvsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraInvsIns.SetVariable(':nACTSWTAX', 0);
          oraInvsIns.SetVariable(':nACTSWOTAX', 0);
          Try
            Begin
              oraInvsIns.Execute;
              WriteEvent('������������ �� �������������� ������ ���������!');
       			End
					Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
          end;
         { // ������������ ���������
          oraInvsIns.ClearVariables;
          oraInvsIns.SetVariable(':nCOMPANY', 2);
          oraInvsIns.SetVariable(':nPRN', rn_sved);
          oraInvsIns.SetVariable(':sNOMEN', '���������_��');
					oraInvsIns.SetVariable(':sNOM_MODIF', '���������_��');
					oraInvsIns.SetVariable(':sTAX_GROUP', '�����');
          oraInvsIns.SetVariable(':nEXP_PRICE', 0);
          oraInvsIns.SetVariable(':nPR_MEAS', 1);
          oraInvsIns.SetVariable(':sSTORE', '����_��');
          oraInvsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraInvsIns.SetVariable(':dBEGIN_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraInvsIns.SetVariable(':nACTM_QUANT', 0);
          oraInvsIns.SetVariable(':nACTA_QUANT', 0);
          oraInvsIns.SetVariable(':nACTSWTAX', 0);
          oraInvsIns.SetVariable(':nACTSWOTAX', 0);
          Try
            Begin
              oraInvsIns.Execute;
              mlog.Lines.Add('������������ �� ��������� ������ ���������!');
       			End
					Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
          end;  }
          // ������������  �� ��������
          oraCords.SQL[25] := 'and (zakaz.date_plan between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
          oraCords.SQL[25] := oraCords.SQL[25] + 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy''))';
          oraCords.SQL[26] := 'and (To_char(TRUNC(zakaz.date_plan,''Q''),''YY'') || to_char(TRUNC(zakaz.date_plan,''Q''),''MM'') || zakaz.client_number || zakaz.period_id || zakaz.filial_id || zakaz.stan_id) =''' + ss^.fieldbyname('idz').asString + ''' ';
         // oraCords.SQL.SaveToFile('c:\qwer.sql'); 
          oraCords.Open;
          If oraCords.RecordCount >0 then oraCords.First;
        While Not oraCords.EOF do
        Begin
          oraInvsIns.ClearVariables;
          oraInvsIns.SetVariable(':nCOMPANY', 2);
          oraInvsIns.SetVariable(':nPRN', rn_sved);
          oraInvsIns.SetVariable(':sNOMEN', trim(oraCords.fieldbyname('modif').asString));
					oraInvsIns.SetVariable(':sNOM_MODIF', trim(oraCords.fieldbyname('mod_modif').asString));
					oraInvsIns.SetVariable(':sTAX_GROUP', '��� 18%');
          oraInvsIns.SetVariable(':nEXP_PRICE', 0);
          oraInvsIns.SetVariable(':nPR_MEAS', 1);
          Case ss^.fieldbyname('filial_id').asInteger of
          31: oraInvIns.SetVariable(':sSTORE', '����_��');
          40: oraInvIns.SetVariable(':sSTORE', '�����_�������_�����');
          else oraInvIns.SetVariable(':sSTORE', '����_��');
          End;
          oraInvsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', oraCords.fieldbyname('data_plan').asDateTime));
          if AnsiUpperCase(leftStr(trim(oraCords.fieldbyname('gr4').asString), 4))= '����' then
          begin
            oraInvsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(oraCords.fieldbyname('SSUM_VES').asFloat * 1000)));
            oraInvsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(oraCords.fieldbyname('SSUM_VES').asFloat * 1000)));
          end
          else
          begin
            oraInvsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(oraCords.fieldbyname('SUM_VES').asFloat * 1000)));
            oraInvsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(oraCords.fieldbyname('SUM_VES').asFloat * 1000)));
          end;
          oraInvsIns.SetVariable(':nACTSWTAX', 0);
          oraInvsIns.SetVariable(':nACTSWOTAX', 0);
          Try
            Begin
              oraInvsIns.Execute;
              rn_sved3 := oraInvsIns.GetVariable(':nRN');
              WriteEvent('������������ �� �������� ������ ���������!');
          //��� ���������� (�����������, �������������������)
              oraProps.ClearVariables;
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved3);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrdersSpec');
              oraProps.SetVariable(':SCODE', '�������������');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', trim(oraCords.fieldbyname('tip_corp').asString));
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('�������� ��� ���������� ��������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
          //���������
              oraProps.ClearVariables;
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved3);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrdersSpec');
              oraProps.SetVariable(':SCODE', 'VEK_PlDelivery');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', '������-�������������');
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('�������� ��������� ��������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
            //������� �������
              oraProps.ClearVariables;
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved3);
              oraProps.SetVariable(':SUNITCODE', 'ConsumersOrdersSpec');
              oraProps.SetVariable(':SCODE', 'VEK_PlTargretDoc');
              oraProps.SetVariable(':NFORMAT', 0);
              if trim(oraCords.fieldbyname('gosprog_name').asString) = '��������� �/� ������' then
              oraProps.SetVariable(':SSTR_VALUE', '����������');
              if trim(oraCords.fieldbyname('gosprog_name').asString) = '���' then
              oraProps.SetVariable(':SSTR_VALUE', '���')
              else
              oraProps.SetVariable(':SSTR_VALUE', '��� ��� ��������');
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('�������� ������� ������� ��������.');
                End;
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
              //��������� ���
              oraQuery.SQL.Clear;
              // ��������� � ������ ���������� � ��� ��� ������ ������������ ��������
          {    oraQuery.SQL.Add('insert into parus_fin (month_id,task,rn,subtask,date_kvit,authid) values (');
              oraQuery.SQL.Add('''' + trim(ss^.fieldbyname('idz').AsString) + ''',');
              oraQuery.SQL.Add('''ConsumersOrdersZ'',');
              oraQuery.SQL.Add(inttostr(rn_sved) + ',');
              oraQuery.SQL.Add('1,');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').AsDateTime) + ''',''dd.mm.yyyy''),');
              oraQuery.SQL.Add('''' + DM.oraParus.LogonUsername + ''')');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
              oraQ.SQL.Clear;        }
              oraQ.Session.Commit;
              WriteEvent('����� ������������ ���������� �������!'); 

//              oraState.ClearVariables;
//              oraState.SetVariable(':NFLAG_SMART', 0);
//              oraState.SetVariable(':NCOMPANY', 2);
//              oraState.SetVariable(':NRN', rn_sved);
//              oraState.SetVariable(':NFLAG_MODE', 0);
//              oraState.SetVariable(':NNEW_STATE', 1);
//              oraState.SetVariable(':nRESERV_SIGN', 0);
//              oraState.SetVariable(':nSIGN_WARN', 0);
//              oraState.SetVariable(':DSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
//							//        oraState.SetVariable(':NRESULT',0);
//							Try
//                oraState.Execute
//              Except On E: EOracleError Do
//               begin
//                  ShowMessage(E.Message);
//                  WriteEvent(E.Message);
//               end;
//              End;
//							oraQ.SQL.Clear;
//							oraQ.Session.Commit;
//              mlog.Lines.Add('��������� ����� ������������ � ' + ss^.fieldbyname('nom_zd').AsString + #13#10);
						End
					Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
          End;
        oraCords.Next;
        end;
        oraCords.Close;
          // ����������� ������
          oraInvState.ClearVariables;
          oraInvState.SetVariable(':NCOMPANY', 2);
          oraInvState.SetVariable(':NRN', rn_svedp);
          oraInvState.SetVariable(':DSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraInvState.Execute;
          WriteEvent('������ ����������');
      Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
      End;  
//************************** ����� ����������****************************************************
{      WriteEvent('������� � ����� ������ ���������� �' + ss^.fieldbyname('nom_zd').AsString);
      rn_sved := 0;
      oraDelIns.ClearVariables;
      oraDelIns.SetVariable(':nCOMPANY', 2);
      oraDelIns.SetVariable(':nCRN', rn_crn2);
      oraDelIns.SetVariable(':sJUR_PERS', '�����������������');
      oraDelIns.SetVariable(':sORD_DOCTYPE', '�������');
      oraDelIns.SetVariable(':sORD_PREF', ss^.fieldbyname('nom_zd').asString);
      oraDelIns.SetVariable(':sORD_NUMB', '1');
      oraDelIns.SetVariable(':sAGENT', '������-�������������');
      oraDelIns.SetVariable(':sFACEACC', '050250001/1');
      oraDelIns.SetVariable(':dORD_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
      oraDelIns.SetVariable(':nORD_STATE', 0);
      oraDelIns.SetVariable(':dSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
      oraDelIns.SetVariable(':sDISP_TYPE', '�/�_�����');
      oraDelIns.SetVariable(':sPAY_TYPE', '�� ����� 22');
//      oraDelIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
      oraDelIns.SetVariable(':sCURRENCY', '���.');
      oraDelIns.SetVariable(':sSTORE', '����_��');
      oraDelIns.SetVariable(':sACC_AGENT', '���������� �.�.');
      oraDelIns.SetVariable(':sSUBDIV', '����');
      oraDelIns.SetVariable(':dPAY_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime + 30));
      oraDelIns.SetVariable(':dRELEASE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime + 30));
//      oraDelIns.SetVariable(':dPRICE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('data_plan').asDateTime));
      oraDelIns.SetVariable(':nORD_PERIOD', 0);
      oraDelIns.SetVariable(':nPERIOD_CORR', 1);
      oraDelIns.SetVariable(':nPERIOD_QUANT', 1);
      oraDelIns.SetVariable(':nPERIOD_TYPE', 0);
      oraDelIns.SetVariable(':nPERIOD_LEN', 1);
      oraDelIns.SetVariable(':nATSAMETIME', 1);
      oraDelIns.SetVariable(':NINCLUDETAX', 1);
      oraDelIns.SetVariable(':nREDUCTION', 0);
      Try
        Begin
          oraDelIns.Execute;
          rn_sved := oraDelIns.GetVariable(':nRN');
          oraProps.ClearVariables;
          WriteEvent('��������� ������ ��������...');
          oraProps.SetVariable(':NCOMPANY', 2);
          oraProps.SetVariable(':NRN', rn_sved);
          oraProps.SetVariable(':SUNITCODE', 'DeliveryOrders');
          oraProps.SetVariable(':SCODE', '���� ��������');
          oraProps.SetVariable(':NFORMAT', 0);
          oraProps.SetVariable(':SSTR_VALUE', trim(ss^.fieldbyname('planstru_id').asString));
          Try
            Begin
              oraProps.Execute;
              WriteEvent('��� ����� �������� ��������');
            End;
          Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
          End;

          // ������������
          oraDelsIns.ClearVariables;
          oraDelsIns.SetVariable(':nCOMPANY', 2);
          oraDelsIns.SetVariable(':nPRN', rn_sved);
          oraDelsIns.SetVariable(':sNOMEN', trim(ss^.fieldbyname('modif').asString));
					oraDelsIns.SetVariable(':sNOM_MODIF', trim(ss^.fieldbyname('mod_modif').asString));
          if (ss^.fieldbyname('data_plan').asDateTime >= StrToDate('01.01.2006')) then
    					oraDelsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code_new').asString))
          else
    					oraDelsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code').asString));
          oraDelsIns.SetVariable(':nEXP_PRICE', 0);
          oraDelsIns.SetVariable(':nPR_MEAS', 1);
          oraDelsIns.SetVariable(':sSTORE', '����_��');
          oraDelsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraDelsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraDelsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraDelsIns.SetVariable(':nACTSWTAX', 0);
          oraDelsIns.SetVariable(':nACTSWOTAX', 0);
          Try
            Begin
              oraDelsIns.Execute;
              WriteEvent('������������ ������ ���������� ���������!');              //��������� ���
              oraQuery.SQL.Clear;
              // ��������� � ������ ���������� � ��� ��� ������ ������������ ��������
              oraQuery.SQL.Add('insert into parus_fin (month_id,task,rn,subtask,date_kvit,authid) values (');
              oraQuery.SQL.Add('''' + trim(ss^.fieldbyname('nom_zd').AsString) + ''',');
              oraQuery.SQL.Add('''DeliveryOrders'',');
              oraQuery.SQL.Add(inttostr(rn_sved) + ',');
              oraQuery.SQL.Add('1,');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').AsDateTime) + ''',''dd.mm.yyyy''),');
              oraQuery.SQL.Add('''' + DM.oraParus.LogonUsername + ''')');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
              oraQuery.Session.Commit;
              oraQ.SQL.Clear;
              oraQ.Session.Commit;
              WriteEvent('����� ���������� ���������� �������!');              //��������� ���
              oraDelState.ClearVariables;
              // �������� ��������� � ������������
              oraDelState.SetVariable(':NFLAG_SMART', 0);
              oraDelState.SetVariable(':NCOMPANY', 2);
              oraDelState.SetVariable(':NRN', rn_sved);
              oraDelState.SetVariable(':NFLAG_MODE', 0);
              oraDelState.SetVariable(':NNEW_STATE', 1);
              oraDelState.SetVariable(':DSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
              Try
                oraDelState.Execute
              Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
              End;
              oraQ.Session.Commit;
              WriteEvent('��������� ����� ����������!');              //��������� ���
  					End
					Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
          End
        End;
      Except On E: EOracleError Do
               begin
                  ShowMessage(E.Message);
                  WriteEvent(E.Message);
               end;
      End;   }
      ss^.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmZakaz.dbgCordGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraCord.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmZakaz.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

Procedure TfrmZakaz.deBegChange(Sender: TObject);
Begin
  deBeg.Date := deBeg.date - dayOf(deBeg.date) + 1
End;

procedure TfrmZakaz.DBGridEh1Columns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 if mteCatalog.TreeNodeExpanded  then
   params.ImageIndex:=1
 else
  if mteCatalog.TreeNodeHasChildren then
   params.ImageIndex:=2
  else
   params.ImageIndex:=3;
end;

procedure TfrmZakaz.Button1Click(Sender: TObject);
begin
  ShowMessage(mtecatalog.fieldbyname('RN').asstring);
end;

End.

