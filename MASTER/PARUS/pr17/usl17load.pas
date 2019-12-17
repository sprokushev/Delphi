Unit usl17load;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmUSL17 = Class(TForm)
    oraMain: TOracleSession;
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
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    oraQ: TOracleQuery;
    oraPR17CAT_CEN_ID: TIntegerField;
    oraPR17DATE_CEN: TDateTimeField;
    oraPR17NUM_KVIT: TFloatField;
    oraPR17DATE_KVIT: TDateTimeField;
    oraPR17NOM_ZD: TStringField;
    oraPR17ID: TIntegerField;
    InOr_ins: TOracleQuery;
    InOrs_ins: TOracleQuery;
    GroupBox1: TGroupBox;
    deBeg: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    deEnd: TDateEdit;
    rbArx: TRadioButton;
    rbVor: TRadioButton;
    rbInta: TRadioButton;
    rbKp: TRadioButton;
    rbUs: TRadioButton;
    rbSyk: TRadioButton;
    rbPech: TRadioButton;
    rbKos: TRadioButton;
    rbUh: TRadioButton;
    rbPotreb: TRadioButton;
    BitBtn1: TBitBtn;
    oraState: TOracleQuery;
    cbKorrekt: TCheckBox;
    rbArxPotr: TRadioButton;
    oraPR17MESTO_ID: TIntegerField;
    oraPR17DATE_PLAN: TDateTimeField;
    rbPAZS: TRadioButton;
    qLinkIn: TOracleQuery;
    qInS: TOracleQuery;
    qLink: TOracleQuery;
    qLinkOut: TOracleQuery;
    oraPR17SVED_NUM: TStringField;
    oraPR17NUM_CIST: TFloatField;
    oraPR17SUM: TFloatField;
    oraPR17NDS: TFloatField;
    DBGridEh1: TDBGridEh;
    dsCat: TDataSource;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    oraPR17POLUCH_ID: TIntegerField;
    FindMOL: TOracleQuery;
    oraPR17STAN_ID: TFloatField;
    rbVog: TRadioButton;
    rbLabyt: TRadioButton;
    rbAviaTran: TRadioButton;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure dbgPR17GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    Procedure WriteEvent(Tag: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmUSL17                               : TfrmUSL17;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmUSL17.WriteEvent(Tag: String);
Begin
  frmMain.WriteEvent(Tag, '����� "��������� ������(������) � �����"');
End;

Procedure TfrmUSL17.acFilterExecute(Sender: TObject);
Begin
	//oraMain.Reconnect;
  oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbArxPotr.Checked Then //����������� �� and (d.predpr_id<>3179)
		oraPR17.SQL[25] := 'and ((m.npodog_id is not null) ) and (ps.region_id=21)'
	Else
		oraPR17.SQL[25] := '';
	If rbPotreb.Checked Then //�����������
		oraPR17.SQL[23] := 'and d.predpr_id<>2641 and (ps.region_id is null or ps.region_id<>21)'
	Else
		//  oraPR17.SQL[23]:='and m.npodog_id is null';
		oraPR17.SQL[23] := '';
	If rbArx.Checked Then //�����������   or (d.predpr_id=3179)
    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and ((m.npodog_id is null) )'
	Else
    oraPR17.SQL[24] := '';
  If rbVor.Checked Then //�������
    oraPR17.SQL[24] := 'and (m.poluch_id in (2729,128) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbInta.Checked Then //Inta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2724,136,745) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKp.Checked Then //KnyagPogost
    oraPR17.SQL[24] := 'and (m.poluch_id in (2728,137) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbVog.Checked Then //Vog
    oraPR17.SQL[24] := 'and (m.poluch_id in (290) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKos.Checked Then //koslan
    oraPR17.SQL[24] := 'and (m.poluch_id in (2735,133) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
	If rbPech.Checked Then //Pechera
		oraPR17.SQL[24] := 'and (m.poluch_id in (2731,110,857) and not(m.planstru_id in (95,178,208,207)))'
	Else
		oraPR17.SQL[24] := oraPR17.SQL[24];

	If rbPAZS.Checked Then //Pechera AZS
		oraPR17.SQL[24] := 'and (m.poluch_id in (174,2730) and not(m.planstru_id in (95,178,208,207)))'
	Else
		oraPR17.SQL[24] := oraPR17.SQL[24];

  If rbSyk.Checked Then //Syktyvkar
    oraPR17.SQL[24] := 'and (m.poluch_id in (2364,2732,177,112,750,131) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUs.Checked Then //Usinsk
    oraPR17.SQL[24] := 'and (m.poluch_id in (2725,2703,2646,3526) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUh.Checked Then //Uhta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2723,102,2641,3856) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbLabyt.Checked Then //labytnangi
    oraPR17.SQL[24] := 'and (m.poluch_id in (2065) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbAviaTran.Checked Then //���� �������������
    oraPR17.SQL[24] := 'and (m.poluch_id in (2314) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  //  oraPR17.SQL.savetofile('c:\11.txt');
  oraPR17.Open;
End;

Procedure TfrmUSL17.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  WriteEvent('����� �������');
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.Open;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmUSL17.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  WriteEvent('����� �������');
  action := caFree;
End;

Procedure TfrmUSL17.acLoadExecute(Sender: TObject);
Var
  summ, pref2                           : String;
  st1, st2, pref, rn_crn, rn_agnfifo    : String;
  rn_sved, rn, rn_parti, rn_del         : String;
  ok                                    : boolean;
  rn_indoctype, rn_store, rn_stoper     : String;
  rn_lin, rn_lout,rn_mol                : String;
  CONFDOCNUMB, facc                     : String;

Begin
	If cbKorrekt.Checked Then
    pref2 := '�'
  Else
    pref2 := '';
  rn_indoctype := '�����_����';
  rn_stoper := '������_��_������';
  rn_agnfifo := '������-���';
  CONFDOCNUMB := '���-050250001 (1)';
  facc := '050250001/1';
  If rbPotreb.Checked Then
    Begin
      //�����������
      rn_store := '����_��';
      pref := '';
    End;
  If rbArxPotr.Checked Then
    Begin
      //����������� ��
      rn_stoper := '������_��_������_���';
      rn_store := '����_��';
      pref := '';
      CONFDOCNUMB := '���-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbArx.Checked Then
    Begin
      //�����������
      rn_store := '�����_�������_�����';
      rn_stoper := '������_���';
      pref := '�';
      CONFDOCNUMB := '���-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbVor.Checked Then
    Begin
      //�������
      rn_store := '�������_�����_�����';
      pref := '�';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_store := '����_�������_�����';
      pref := '�';
    End;
  If rbKp.Checked Then
    Begin
      //KnyagPogost
      rn_store := '�������_�����_�����';
      pref := '�';
    End;
  If rbVog.Checked Then
    Begin
      //KnyagPogost
      rn_store := '������_�����_�����';
      pref := '�';
    End;
  If rbKos.Checked Then
    Begin
      //koslan
      rn_store := '������_�����_�����';
      pref := '�';
    End;
	If rbPech.Checked Then
		Begin
			//Pechera
			rn_store := '������_�������_�����';
			pref := '�';
		End;
If rbPAZS.Checked Then
		Begin
			//Pechera AZS
			rn_store := '������-���';
			pref := '�';
		End;
	If rbSyk.Checked Then
		Begin
			//Syktyvkar
			rn_store := '����_�������_�����';
      pref := '�';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
			rn_store := '������_�������_�����';
      pref := '�';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
			rn_store := '������_�������_�����';
      pref := '�';
    End;
  If rbLabyt.Checked Then
    Begin
      //labytnangi
			rn_store := '��������_�����_�����';
      pref := '�';
    End;
  If rbAviaTran.Checked then
    Begin
      //����������
			rn_store := '��������';
      pref := '�';
    End;

  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      WriteEvent('������� � ����� ����� �������� �' + oraPR17.fieldbyname('sved_num').AsString + ' �' + oraPR17.fieldbyname('num_cist').AsString + '.');
      // ������
      summ := trim(oraPR17.fieldbyname('cat_cen_id').asString) + '_';
      st1 := trim(inttostr(dayof(oraPR17.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then st1 := '0' + st1;
      summ := summ + st1;
      st1 := trim(inttostr(monthof(oraPR17.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then st1 := '0' + st1;
      summ := summ + st1;
      st1 := rightstr(inttostr(YearOf(oraPR17.fieldbyname('date_cen').asdatetime)), 2);
      rn_parti := summ + st1 + pref;
      If rbArx.Checked Then
      case oraPR17.fieldbyname('poluch_id').AsInteger of
        28:      rn_store := '��������_�����_�����';
        302:      rn_store := '������_�����_�����';
        472:     begin
                  if oraPR17.fieldbyname('stan_id').AsInteger=3086 then
                     rn_store := '����_�����_�����_���';
                  if oraPR17.fieldbyname('stan_id').AsInteger=302 then
                     rn_store := '����_�����_�����_���';
                 end;
        659,3849:  rn_store := '��������_�����_�����';         
        2210:      rn_store := '��������_�����_�����';
        2771:      rn_store := '���-520_�����_�����';
        3067:      rn_store := '������_�����_�����';
        3630:      rn_store := '���-����_�����_�����';
      else
        rn_store := '�����_�������_�����';
      end;
      with FindMOL do
      begin
        ClearVariables;
        SetVariable(':nCOMPANY', 2);
        SetVariable(':sNumb', rn_store);
      end;
      FindMOL.Execute;
      rn_mol:=FindMOL.GetVariable(':smol');
      FindMOL.Close;
      InOR_INS.ClearVariables;
      InOR_INS.SetVariable(':nCOMPANY', 2);
      InOR_INS.SetVariable(':nCRN', rn_crn);
      InOR_INS.SetVariable(':sJUR_PERS', '�����������������');
      InOR_INS.SetVariable(':sSELLER', '������-�������������');
			InOR_INS.SetVariable(':sFACEACC', facc);
			InOR_INS.SetVariable(':sPARTY', rn_parti);
			InOR_INS.SetVariable(':sSTORE', rn_store);
			InOR_INS.SetVariable(':sSTOPERTYPE', rn_stoper);
			InOR_INS.SetVariable(':sINDOCTYPE', rn_indoctype);
			InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 1) + pref + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString)+ '-' + trim(oraPR17.fieldbyname('mesto_id').asString));
			InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
			InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
			InOR_INS.SetVariable(':nDOCSTATUS', 0);
			InOR_INS.SetVariable(':sCONFDOCTYPE', '�������');
			InOR_INS.SetVariable(':sCONFDOCNUMB', CONFDOCNUMB);
			InOR_INS.SetVariable(':dCONFDOCDATE', '30.12.2003');
			InOR_INS.SetVariable(':nSIGNTAX', 0);
      InOR_INS.SetVariable(':sCURRENCY', '���.');
      InOR_INS.SetVariable(':nCURCOURS', 1);
      InOR_INS.SetVariable(':nCURBASECOURS', 1);
      InOR_INS.SetVariable(':nACC_COURS', 1);
      InOR_INS.SetVariable(':nACC_BASECOURS', 1);
      InOR_INS.SetVariable(':nFA_COURS', 1);
      InOR_INS.SetVariable(':nFA_BASECOURS', 1);
      InOR_INS.SetVariable(':sAGENT', '�����');
      InOR_INS.SetVariable(':sCOMMENTS', trim(oraPR17.fieldbyname('num_kvit').asString) + ',(' + trim(oraPR17.fieldbyname('num_cist').asString) + '),' + trim(oraPR17.fieldbyname('sved_num').asString));
      InOR_INS.SetVariable(':sAGNFIFO', rn_agnfifo);
      Try
        Begin
          InOR_INS.Execute;
          WriteEvent('��������� �������� �������...');
          rn_sved := InOR_INS.GetVariable(':nrn');
          // ������������ �� ��������
          InORs_INS.ClearVariables;
          InORs_INS.SetVariable(':nCOMPANY', 2);
          InORs_INS.SetVariable(':nPRN', rn_sved);
          InORs_INS.SetVariable(':sNOMEN', '���. �� ����.�������');
					InORs_INS.SetVariable(':sNOMMODIF', '���. �� ����.�������');
					InORs_INS.SetVariable(':sTAXGR', '��� 18%');
          InORs_INS.SetVariable(':nPLANQUANT', 1);
          InORs_INS.SetVariable(':nFACTQUANT', 1);
          InORs_INS.SetVariable(':nPLANQUANTALT', 1);
          InORs_INS.SetVariable(':nFACTQUANTALT', 1);
          InORs_INS.SetVariable(':nPRICE', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat)));
          InORs_INS.SetVariable(':nPRICEMEAS', 1);
          InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
          InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat)));
          InORs_INS.SetVariable(':nACC_PRICEMEAS', 1);
          InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat)));
          InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat+oraPR17.fieldbyname('nds').asFloat)));
          InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat)));
          InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr(oraPR17.fieldbyname('sum').asFloat + oraPR17.fieldbyname('nds').asFloat)));
          Try
            Begin
              InORs_INS.Execute;
              WriteEvent('������������ ��������� �������...');
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''IncomingOrders'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('3,');
              oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              oraQuery.SQL.Clear;
              InOR_Ins.Session.Commit;
              oraQuery.Session.Commit;
              WriteEvent('��������� ����� ����� ����������� �������!');
              If Not cbKorrekt.Checked Then
                Begin
                  oraState.ClearVariables;
                  oraState.SetVariable(':NCOMPANY', 2);
                  oraState.SetVariable(':NRN', rn_sved);
                  oraState.SetVariable(':NSTATUS', 2);
                  oraState.SetVariable(':DWORK_DATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
                  Try
                    oraState.Execute
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End;
                  oraQ.Session.Commit;
                  WriteEvent('��������� ��� ���� ��������� ����� ����� �' + oraPR17.fieldbyname('sved_num').AsString + ' �' + oraPR17.fieldbyname('num_cist').AsString);
                End;
            End
          Except
            On E: EOracleError Do
            begin
              ShowMessage(E.Message);
              WriteEvent(E.Message);
            end;
          End;
        End
      Except
        On E: EOracleError Do
         begin
          ShowMessage(E.Message);
          WriteEvent(E.Message);
         end;
      End;
      oraPR17.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmUSL17.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmUSL17.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmUSL17.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
