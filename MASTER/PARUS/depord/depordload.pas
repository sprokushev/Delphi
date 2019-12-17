Unit depordload;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmDepord = Class(TForm)
    oraPR17: TOracleDataSet;
    dsPR17: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgPR17: TDBGridEh;
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
    GroupBox1: TGroupBox;
    rbArx: TRadioButton;
    rbSyk: TRadioButton;
    rbInta: TRadioButton;
    rbVor: TRadioButton;
    rbKp: TRadioButton;
    rbKos: TRadioButton;
    rbPech: TRadioButton;
    rbPAZS: TRadioButton;
    rbUh: TRadioButton;
    rbUs: TRadioButton;
    BitBtn1: TBitBtn;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    oraPR17NOM_ZD: TStringField;
    oraPR17TONN_DECLARED: TFloatField;
    oraPR17DATE_PLAN: TDateTimeField;
    oraPR17INPUT_DATE: TDateTimeField;
    oraPR17MODIF: TStringField;
    oraPR17MOD_MODIF: TStringField;
    oraProps: TOracleQuery;
    oraPR17STAN_NAME: TStringField;
    oraPR17AGNFIFO: TStringField;
    oraState: TOracleQuery;
    Label2: TLabel;
    deBeg: TDateEdit;
    Label3: TLabel;
    deEnd: TDateEdit;
    oraDelIns: TOracleQuery;
    oraDelsIns: TOracleQuery;
    oraDelCat: TOracleQuery;
    oraPR17PLANSTRU_ID: TFloatField;
    oraPR17TAXGR_CODE_NEW: TStringField;
    oraPR17TAXGR_CODE: TStringField;
    oraDelState: TOracleQuery;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    rbLabyt: TRadioButton;
    rbAviaTran: TRadioButton;
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure dbgPR17GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure deBegChange(Sender: TObject);
    Procedure WriteEvent(Tag: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmDepord                             : TfrmDepord;

Implementation

Uses MAIN, DMunit;

{$R *.dfm}

Procedure TfrmDepord.WriteEvent(Tag: String);
Begin
frmMain.WriteEvent(Tag, '����� "������ � ��������������� � �����"');
End;

Procedure TfrmDepord.acFilterExecute(Sender: TObject);
Begin
  If oraPR17.Active Then
    oraPR17.Close;
  oraPR17.SQL[15] := 'and m.input_date between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[15] := oraPR17.SQL[15] + 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbArx.Checked Then //�����������  or (d.predpr_id=3179)
    oraPR17.SQL[16] := 'and (ps.region_id=21 or m.poluch_id in(2889,28))'
      //  oraPR17.SQL[16]:='and (m.planstru_id in (95,178,208) or m.poluch_id=2889)'
//  oraPR17.SQL[16]:='and (m.planstru_id=95 or m.planstru_id=178 or m.poluch_id=2889 or (m.planstru_id=105 and m.poluch_id=2889))'
  Else
    oraPR17.SQL[16] := '';
  If rbVor.Checked Then //�������
    oraPR17.SQL[16] := 'and (m.poluch_id in (2729,128) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2729 or m.poluch_id=128)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbInta.Checked Then //Inta
    oraPR17.SQL[16] := 'and (m.poluch_id in (2724,136,745) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2724 or m.poluch_id=136 or m.poluch_id=745)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbKp.Checked Then //KnyagPogost
    oraPR17.SQL[16] := 'and (m.poluch_id in (2728,137,290, 4088) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2728 or m.poluch_id=137)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbKos.Checked Then //koslan
    oraPR17.SQL[16] := 'and (m.poluch_id in (2735,133) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2735 or m.poluch_id=133)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbPech.Checked Then //Pechera
    oraPR17.SQL[16] := 'and (m.poluch_id in (2731,110,2730,857) and not(m.planstru_id in (95,178,208,207)))'
      //oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2731 or m.poluch_id=110 or m.poluch_id=857)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbPAZS.Checked Then //Pechera AZS
    oraPR17.SQL[16] := 'and (m.poluch_id in (174,2730) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=174 or m.poluch_id=2730)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbSyk.Checked Then //Syktyvkar 2364 �������� 131 ��������������������
    oraPR17.SQL[16] := 'and (m.poluch_id in (2364,2732,177,112,750,131, 4089, 4162, 3347) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2364 or m.poluch_id=2732 or m.poluch_id=177 or m.poluch_id=112 or m.poluch_id=750)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbUs.Checked Then //Usinsk
    oraPR17.SQL[16] := 'and (m.poluch_id in (2725,2703,2646,3526) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2725 or m.poluch_id=2703 or m.poluch_id=2646)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbUh.Checked Then //Uhta
    oraPR17.SQL[16] := 'and (m.poluch_id in (2723,102,2641,3856) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[16]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbLabyt.Checked Then //labytnangi
    oraPR17.SQL[16] := 'and (m.poluch_id in (2065, 3600) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  If rbAviaTran.Checked Then //��������
    oraPR17.SQL[16] := 'and (m.poluch_id in (2314) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[16] := oraPR17.SQL[16];
  oraPR17.Open;
End;

Procedure TfrmDepord.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 1;
  deEnd.Date := date;
  WriteEvent('����� �������');
  frmMain.acConnectToMaster.Execute;
  frmMain.acConnectToParus.Execute;
  //oraPR17.SQL[15]:='and m.date_plan=TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
  //oraPR17.Open;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmDepord.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  frmMain.acDisconnectFromMaster.Execute;
  frmMain.acDisconnectFromParus.Execute;
  WriteEvent('����� �������');
  action := caFree;
End;

Procedure TfrmDepord.acLoadExecute(Sender: TObject);
Var
  summ                                  : String;
  st1, st2, rn_crn, rn_crn2             : String;
  rn_sved                               : integer;
  rn_store,rn_subdiv                    : String;
  pref, numb, rn_doc                    : String;
  ss                                    : ^TOracleDataSet;
Begin

  oraInvIns.ClearVariables;
  rn_doc := '������_��';
  rn_store := '����_��';
  rn_crn := mtecatalog.fieldbyname('RN').asstring;  oraPR17.First;
  //����� �������� ��� ������ ����������
  oraDelCat.ClearVariables;
  oraDelCat.SetVariable(':nFLAG_SMART',1);
  oraDelCat.SetVariable(':nCOMPANY',2);
  oraDelCat.SetVariable(':sUNITCODE','DeliveryOrders');
  oraDelCat.SetVariable(':sNAME','�/� ���');
  oraDelCat.Execute;
  rn_crn2 := inttostr(oraDelCat.GetVariable(':nRN'));
  oraDelCat.Close;
  ss := @oraPR17;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      If rbArx.Checked Then
        Begin
          //�����������
          oraInvIns.SetVariable(':sAGENT', '������� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '�����_��_02/�');
          oraInvIns.SetVariable(':sACC_AGENT', '���������� �.�.');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_��������');
          oraInvIns.SetVariable(':sSUBDIV', '�����������');
          rn_subdiv:='�����������';
          oraInvIns.SetVariable(':sORD_PREF', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_NUMB', '���');
        End;
      If rbVor.Checked Then
        Begin
          //�������
          oraInvIns.SetVariable(':sAGENT', '������� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '�������_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '�������');
          rn_subdiv:='�������';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '����_�/�');
        End;
      If rbInta.Checked Then
        Begin
          //Inta
          oraInvIns.SetVariable(':sAGENT', '������� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '����_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '����');
          rn_subdiv:='����';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '����_�/�');
        End;
      If rbKp.Checked Then
        Begin
          //KnyagPogost
          oraInvIns.SetVariable(':sFACEACC', '����-���_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '����������_���');
          rn_subdiv:='����������_���';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '���_���');
        End;
      If rbKos.Checked Then
        Begin
          //koslan
          oraInvIns.SetVariable(':sAGENT', '����� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '������_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '������');
          rn_subdiv:='������';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '������_�/�');
        End;
      If rbPech.Checked Then
        Begin
          //Pechera
          oraInvIns.SetVariable(':sAGENT', '�������� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '������_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '������');
          rn_subdiv:='������';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '������_�/�');
        End;
      If rbPAZS.Checked Then
        Begin
          //Pechera  AZS
          oraInvIns.SetVariable(':sAGENT', '�������� �.�.');
          oraInvIns.SetVariable(':sFACEACC', '������_���_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '���_ ���');
          rn_subdiv:='���_ ���';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '������_���');
        End;
      If rbSyk.Checked Then
        Begin
          //Syktyvkar
          oraInvIns.SetVariable(':sAGENT', '������ �.�.');
          oraInvIns.SetVariable(':sFACEACC', '����_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '���������');
          rn_subdiv:='���������';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '����_�/�');
        End;
      If rbUs.Checked Then
        Begin
          //Usinsk
          oraInvIns.SetVariable(':sAGENT', '������ �.�.');
          oraInvIns.SetVariable(':sFACEACC', '������_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '���');
          rn_subdiv:='���';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '������_�/�');
        End;
      If rbUh.Checked Then
        Begin
          //Uhta
          oraInvIns.SetVariable(':sFACEACC', '����_��_01/�');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '����_��');
          rn_subdiv:='����_��';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '����_�/�');
        End;
      If rbLabyt.Checked Then
        Begin
          //labytnangi
          oraInvIns.SetVariable(':sAGENT', '���������� �.�.');  //
          oraInvIns.SetVariable(':sFACEACC', '');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '����');
          rn_subdiv:='����';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '���_�/�');
        End;
      If rbAviaTran.Checked Then
        Begin
          //��������
          oraInvIns.SetVariable(':sAGENT', '���������� �.�.');  //
          oraInvIns.SetVariable(':sFACEACC', '');
          oraInvIns.SetVariable(':sACC_SUBDIV', '�����_����������');
          oraInvIns.SetVariable(':sSUBDIV', '����_��');
          rn_subdiv:='����_��';
          oraInvIns.SetVariable(':sORD_NUMB', trim(ss^.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sORD_PREF', '����_�/�');
        End;

      WriteEvent('������� � ����� ������ � ' + ss^.fieldbyname('nom_zd').AsString);
      rn_sved := 0;
      oraInvIns.SetVariable(':nCOMPANY', 2);
      oraInvIns.SetVariable(':nCRN', rn_crn);
      oraInvIns.SetVariable(':sORD_DOCTYPE', rn_doc);
      oraInvIns.SetVariable(':dORD_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
      oraInvIns.SetVariable(':nORD_STATE', 0);
      oraInvIns.SetVariable(':dSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
      oraInvIns.SetVariable(':sCURRENCY', '���.');
      oraInvIns.SetVariable(':sSTORE', rn_store);
      oraInvIns.SetVariable(':dRELEASE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_plan').asDateTime + 30));
      oraInvIns.SetVariable(':nORD_PERIOD', 0);
      oraInvIns.SetVariable(':nPERIOD_CORR', 0);
      oraInvIns.SetVariable(':nPERIOD_QUANT', 1);
      oraInvIns.SetVariable(':nPERIOD_TYPE', 0);
      oraInvIns.SetVariable(':nPERIOD_LEN', 1);
      oraInvIns.SetVariable(':nEMERGORD', 0);
      oraInvIns.SetVariable(':nATSAMETIME', 1);
      Try
        Begin
          oraInvIns.Execute;
          WriteEvent('��������� �������� �������!');
          rn_sved := oraInvIns.GetVariable(':nRN');
          oraProps.ClearVariables;
          oraProps.SetVariable(':NCOMPANY', 2);
          oraProps.SetVariable(':NRN', rn_sved);
          oraProps.SetVariable(':SUNITCODE', 'DepartmentsOrders');
          oraProps.SetVariable(':SCODE', '��� ��');
          oraProps.SetVariable(':NFORMAT', 0);
          oraProps.SetVariable(':SSTR_VALUE', '770800476705');
          Try
            Begin
              oraProps.Execute;
              WriteEvent('��� �� ��������');
            End;
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          //�� �������
          oraProps.ClearVariables;
          st1 := AnsiUpperCase(leftStr(ss^.fieldbyname('stan_name').asString, 1));
          st2 := rightStr(trim(ss^.fieldbyname('stan_name').asString), length(trim(ss^.fieldbyname('stan_name').asString)) - 1);
          st1 := st1 + AnsiLowerCase(st2);
          oraQ.SQL.Clear;
          oraQ.SQL.Add('select str_value from extra_dicts_values where');
          oraQ.SQL.Add('note=''' + st1 + '''');
          oraQ.execute;
          If (oraQ.RowCount > 0) Then
            Begin
              oraProps.SetVariable(':NCOMPANY', 2);
              oraProps.SetVariable(':NRN', rn_sved);
              oraProps.SetVariable(':SUNITCODE', 'DepartmentsOrders');
              oraProps.SetVariable(':SCODE', '��� �������');
              oraProps.SetVariable(':NFORMAT', 0);
              oraProps.SetVariable(':SSTR_VALUE', oraQ.FieldAsString(0));
              Try
                Begin
                  oraProps.Execute;
                  WriteEvent('��� ������� ��������');
                End;
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End;
            End;
          oraQ.Clear;
          oraProps.ClearVariables;
          oraProps.SetVariable(':NCOMPANY', 2);
          oraProps.SetVariable(':NRN', rn_sved);
          oraProps.SetVariable(':SUNITCODE', 'DepartmentsOrders');
          oraProps.SetVariable(':SCODE', '���������������');
          oraProps.SetVariable(':NFORMAT', 0);
          oraProps.SetVariable(':SSTR_VALUE', trim(ss^.fieldbyname('agnfifo').asString));
          Try
            Begin
              oraProps.Execute;
              WriteEvent('��������������� ��������');
            End;
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          // ������������
          oraInvsIns.ClearVariables;
          oraInvsIns.SetVariable(':nCOMPANY', 2);
          oraInvsIns.SetVariable(':nPRN', rn_sved);
          oraInvsIns.SetVariable(':sNOMEN', trim(ss^.fieldbyname('modif').asString));
          oraInvsIns.SetVariable(':sNOM_MODIF', trim(ss^.fieldbyname('mod_modif').asString));
          oraInvsIns.SetVariable(':nEXP_PRICE', 0);
          oraInvsIns.SetVariable(':nPR_MEAS', 1);
          oraInvsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraInvsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraInvsIns.SetVariable(':nACTSUMM', 0);
          oraInvsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          Try
            Begin
              oraInvsIns.Execute;
              WriteEvent('������������ ������ ���������!');
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (task,rn,subtask,month_id,date_kvit,authid) values (');
              oraQuery.SQL.Add('''DepartmentsOrders'',');
              oraQuery.SQL.Add(inttostr(rn_sved) + ',');
              oraQuery.SQL.Add('1,');
              oraQuery.SQL.Add('''' + ss^.fieldbyname('nom_zd').asString + ''',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').AsDateTime) + ''',''dd.mm.yyyy''),');
              oraQuery.SQL.Add('''' + DM.oraParus.LogonUsername + ''')');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
              oraQuery.Session.Commit;
              oraQ.SQL.Clear;
              oraQ.Session.Commit;
              WriteEvent('����� ������������� ���������� �������!');
              oraState.ClearVariables;
              oraState.SetVariable(':NFLAG_SMART', 0);
              oraState.SetVariable(':NCOMPANY', 2);
              oraState.SetVariable(':NRN', rn_sved);
              oraState.SetVariable(':NFLAG_MODE', 0);
              oraState.SetVariable(':NNEW_STATE', 1);
              oraState.SetVariable(':nRESERV_SIGN', 0);
              oraState.SetVariable(':nSIGN_WARN', 0);
              oraState.SetVariable(':DSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
              Try
                oraState.Execute
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End;
              oraQ.Session.Commit;
              WriteEvent('���������� ����� ������������� � ' + ss^.fieldbyname('nom_zd').AsString + #13#10);
            End
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End
        End;
      Except On E: EOracleError Do
          ShowMessage(E.Message);
      End;
//************************** ����� ����������****************************************************
      WriteEvent('������� � ����� ������ ���������� �' + ss^.fieldbyname('nom_zd').AsString + #13#10);
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
      oraDelIns.SetVariable(':sSUBDIV', rn_subdiv);
      oraDelIns.SetVariable(':dPAY_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_plan').asDateTime + 30));
      oraDelIns.SetVariable(':dRELEASE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_plan').asDateTime + 30));
//      oraDelIns.SetVariable(':dPRICE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('date_plan').asDateTime));
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
          WriteEvent('��������� ������ ��������...' + #13#10);
          oraProps.ClearVariables;
          oraProps.SetVariable(':NCOMPANY', 2);
          oraProps.SetVariable(':NRN', rn_sved);
          oraProps.SetVariable(':SUNITCODE', 'DeliveryOrders');
          oraProps.SetVariable(':SCODE', '���� ��������');
          oraProps.SetVariable(':NFORMAT', 0);
          oraProps.SetVariable(':SSTR_VALUE', trim(ss^.fieldbyname('planstru_id').asString));
          Try
            Begin
              oraProps.Execute;
              WriteEvent('��� ����� �������� ��������...');
            End;
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;

          // ������������
          oraDelsIns.ClearVariables;
          oraDelsIns.SetVariable(':nCOMPANY', 2);
          oraDelsIns.SetVariable(':nPRN', rn_sved);
          oraDelsIns.SetVariable(':sNOMEN', trim(ss^.fieldbyname('modif').asString));
					oraDelsIns.SetVariable(':sNOM_MODIF', trim(ss^.fieldbyname('mod_modif').asString));
          oraDelsIns.SetVariable(':nEXP_PRICE', 0);
          oraDelsIns.SetVariable(':nPR_MEAS', 1);
          if (ss^.fieldbyname('date_plan').asDateTime >= StrToDate('01.01.2006')) and (ss^.fieldbyname('date_plan').asDateTime < StrToDate('01.01.2007')) then
    					oraDelsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code_new').asString))
          else
    					oraDelsIns.SetVariable(':sTAX_GROUP', trim(ss^.fieldbyname('taxgr_code').asString));
          oraDelsIns.SetVariable(':sSTORE', '����_��');
          oraDelsIns.SetVariable(':dACTPF_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
          oraDelsIns.SetVariable(':nACTM_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraDelsIns.SetVariable(':nACTA_QUANT', trim(floatToStr(ss^.fieldbyname('tonn_declared').asFloat * 1000)));
          oraDelsIns.SetVariable(':nACTSWTAX', 0);
          oraDelsIns.SetVariable(':nACTSWOTAX', 0);
          Try
            Begin
              oraDelsIns.Execute;
              WriteEvent('������������ ������ ���������� ���������...');

              //��������� ���
              oraQuery.SQL.Clear;
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
              WriteEvent('����� ���������� ���������� �������!');
              oraDelState.ClearVariables;
              oraDelState.SetVariable(':NFLAG_SMART', 0);
              oraDelState.SetVariable(':NCOMPANY', 2);
              oraDelState.SetVariable(':NRN', rn_sved);
              oraDelState.SetVariable(':NFLAG_MODE', 0);
              oraDelState.SetVariable(':NNEW_STATE', 1);
              oraDelState.SetVariable(':DSTATE_DATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('input_date').asDateTime));
              Try
                oraDelState.Execute
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End;
              oraQ.Session.Commit;
              WriteEvent('���������� ����� ����������!' + #13#10);
						End
					Except On E: EOracleError Do
							ShowMessage(E.Message);
          End
        End;
      Except On E: EOracleError Do
          ShowMessage(E.Message);
      End;
      ss^.Next;
    End;
  DM.oraParus.commit;
  acFilterExecute(Self);
End;

Procedure TfrmDepord.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmDepord.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

Procedure TfrmDepord.deBegChange(Sender: TObject);
Begin
  deBeg.Date := deBeg.date - dayOf(deBeg.date) + 1;
End;

procedure TfrmDepord.DBGridEh1Columns0GetCellParams(Sender: TObject;
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

End.
