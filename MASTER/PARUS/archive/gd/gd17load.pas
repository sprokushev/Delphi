Unit gd17load;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmGD17 = Class(TForm)
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
    dsCatalog: TDataSource;
    oraQ: TOracleQuery;
    InOrs_ins: TOracleQuery;
    InOr_ins: TOracleQuery;
    oraPR17NUM_CIST: TStringField;
    oraPR17CAT_CEN_ID: TIntegerField;
    oraPR17DATE_CEN: TDateTimeField;
    oraPR17NUM_KVIT: TFloatField;
    oraPR17DATE_KVIT: TDateTimeField;
    oraPR17VES: TFloatField;
    oraPR17TARIF: TFloatField;
    oraPR17TARIF_NDS: TFloatField;
    oraPR17NOM_ZD: TStringField;
    oraPR17ID: TIntegerField;
    oraPR17STAN_NAME: TStringField;
    Splitter1: TSplitter;
    mLog: TMemo;
    GroupBox1: TGroupBox;
    deBeg: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    deEnd: TDateEdit;
    rbKp: TRadioButton;
    rbInta: TRadioButton;
    rbVor: TRadioButton;
    rbArx: TRadioButton;
    rbKos: TRadioButton;
    rbPech: TRadioButton;
    rbSyk: TRadioButton;
    rbUs: TRadioButton;
    BitBtn1: TBitBtn;
    rbPotreb: TRadioButton;
    rbUh: TRadioButton;
    oraPR17SVED_NUM: TFloatField;
    oraPR17TARIF_GUARD: TFloatField;
    oraPR17TARIF_GUARD_NDS: TFloatField;
    rbArxPotr: TRadioButton;
    oraPR17DATE_PLAN: TDateTimeField;
    oraState: TOracleQuery;
    oraPR17SAGNFIFO: TStringField;
    oraPR17POLUCH_ID: TIntegerField;
    FindMOL: TOracleQuery;
    oraPR17TEX_PD_ID: TIntegerField;
    oraPR17STAN_ID: TFloatField;
    rbPAZS: TRadioButton;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    procedure DBGridEh1Columns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure dbgPR17GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; Var Background: TColor; State: TGridDrawState);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmGD17                               : TfrmGD17;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmGD17.acFilterExecute(Sender: TObject);
Begin
  //oraMain.Reconnect;
  oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbArxPotr.Checked Then //Ïîòðåáèòåëè ÀÔ   and (d.predpr_id<>3179)
		oraPR17.SQL[25] := 'and ((d.predpr_id<>2641) ) and (ps.region_id=21)'
  Else
    oraPR17.SQL[25] := '';
  If rbPotreb.Checked Then //Ïîòðåáèòåëè
		oraPR17.SQL[23] := 'and d.predpr_id<>2641 and (ps.region_id is null or ps.region_id<>21)'
  Else
    oraPR17.SQL[23] := '';
  If rbArx.Checked Then //Àðõàíãåëüñê   or (d.predpr_id=3179)
    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and d.predpr_id=2641'
  Else
    oraPR17.SQL[24] := '';
  If rbVor.Checked Then //Âîðêóòà
    oraPR17.SQL[24] := 'and (m.poluch_id in (2729,128) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbInta.Checked Then //Inta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2724,136,745) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKp.Checked Then //KnyagPogost
    oraPR17.SQL[24] := 'and (m.poluch_id in (2728,137,290) and not(m.planstru_id in (95,178,208,207)))'
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
    oraPR17.SQL[24] := 'and (m.poluch_id in (2346,2732,177,112,750,131) and not(m.planstru_id in (95,178,208,207)))'
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
  //		oraPR17.SQL.savetofile('c:\11.txt');
  oraPR17.Open;
End;

Procedure TfrmGD17.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.Open;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmGD17.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      //      Recipients.EMailAddresses := frmMain.MailRecipient;//'JRomanov@KomiTu.lukoil.com';
      Subject := 'IncomingOrders Tarif ' + oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Body := mLog.Lines;
    End;
  If mLog.Lines.Count > 1 Then
    With frmMain.IdSMTP Do
      Begin
        Try
          Connect;
          Send(frmMain.IdMessage);
          Disconnect;
        Except On E: Exception Do
            Begin
              If connected Then
                Try
                  disconnect;
                Except
                End;
              ShowMessage(E.Message);
            End;
        End;
      End;
  action := caFree;
End;

Procedure TfrmGD17.acLoadExecute(Sender: TObject);
Var
  summ                                  : String;
  pref, rn_crn, rn_agnfifo              : String;
  rn_sved, rn, rn_parti, rn_stan        : String;
  ok                                    : boolean;
  rn_indoctype, rn_store, rn_stoper     : String;
  st1, st2, rn_mol                      : String;
  CONFDOCNUMB, facc                     : String;
Begin
  CONFDOCNUMB := 'ÑÍÏ-050250001 (1)';
  facc := '050250001/1';
  rn_indoctype := 'ÎÐÄÅÐ_ÓÑË';
  rn_agnfifo := 'ËÓÊÎÉË-ÓÍÏ';

  If rbPotreb.Checked Then
    Begin
      //Ïîòðåáèòåëè
      rn_stoper := 'ÏÐÈÕ_ÆÄ';
      rn_store := 'ÓÕÒÀ_ÖÀ';
      pref := '';
    End;
  If rbArxPotr.Checked Then
    Begin
      //Ïîòðåáèòåëè
      rn_stoper := 'ÏÐÈÕ_ÆÄ';
      rn_store := 'ÓÕÒÀ_ÖÀ';
      pref := 'à';
      CONFDOCNUMB := 'ÑÍÏ-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbArx.Checked Then
    Begin
      //Àðõàíãåëüñê
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
      rn_store := 'ÀÐÕÀÍ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'à';
      CONFDOCNUMB := 'ÑÍÏ-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbVor.Checked Then
    Begin
      //Âîðêóòà
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
      rn_store := 'ÂÎÐÊÓÒÀ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÈÍÒÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbKp.Checked Then
    Begin
      //KnyagPogost
			rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÊÍßÆÏÎÃ_ÒÐÀÍÇ_ÍÀËÈÂ';
			pref := 'í';
    End;
  If rbKos.Checked Then
		Begin
			//koslan
			rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÊÎÑËÀÍ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbPech.Checked Then
    Begin
      //Pechera
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
      rn_store := 'ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
If rbPAZS.Checked Then
		Begin
			//Pechera AZS
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÏÅ×ÎÐÀ-ÀÇÑ';
			pref := 'í';
		End;
	If rbSyk.Checked Then
    Begin
      //Syktyvkar
			rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÑÛÊÒ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
      rn_store := 'ÓÑÈÍÑÊ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
      rn_stoper := 'ÏÐÈÕ_ÒÐÀÍÑ';
			rn_store := 'ÈÐÀÅËÜ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      //ÆÄ ñòàíöèÿ
      st1 := AnsiUpperCase(leftStr(oraPR17.fieldbyname('stan_name').asString, 1));
      st2 := rightStr(trim(oraPR17.fieldbyname('stan_name').asString), length(trim(oraPR17.fieldbyname('stan_name').asString)) - 1);
      rn_stan := leftstr(st1 + AnsiLowerCase(st2),20);
      mlog.Lines.Add('Çàêà÷êà â Ïàðóñ ñâåäåíèå ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString + ';Ñòàíöèÿ ' + rn_stan + '.');
      oraQ.SQL.Clear;
      oraQ.SQL.Add('select rn from NomModif where');
      oraQ.SQL.Add('modif_code=''' + rn_stan + '''');
      oraQ.execute;
      If (oraQ.RowCount > 0) Then
        ok := true
      Else
        Begin
          ok := false;
          mlog.Lines.Add('Íå íàéäåíà ñòàíöèÿ â Ïàðóñå: ' + rn_stan + '.');
          mlog.Lines.Add('Ñâåäåíèå ¹' + oraPR17.fieldbyname('sved_num').AsString + 'íå çàêà÷àíî!');
        End;
      oraQ.SQL.Clear;
      If rbArx.Checked Then
      case oraPR17.fieldbyname('poluch_id').AsInteger of
        28:      rn_store := 'ÍÅÔÒÅÁÈÇ_ÒÐÀÍÇ_ÍÀËÈÂ';
        302:      rn_store := 'ÒÐÎÈÖÀ_ÒÐÀÍÇ_ÍÀËÈÂ';
        472:     begin
                  if oraPR17.fieldbyname('stan_id').AsInteger=3086 then
                     rn_store := 'ÂÅËÊ_ÒÐÀÍÇ_ÍÀËÈÂ_ÂÀÃ';
                  if oraPR17.fieldbyname('stan_id').AsInteger=302 then
                     rn_store := 'ÂÅËÊ_ÒÐÀÍÇ_ÍÀËÈÂ_ÂÅË';
                 end;
        659:       rn_store := 'Â/×55450_ÒÐÀÍÇ_ÍÀËÈÂ';
        2210:      rn_store := 'ÑÈÌÏÅÐÈß_ÒÐÀÍÇ_ÍÀËÈÂ';
        2771:      rn_store := 'ÑÌÏ-520_ÒÐÀÍÇ_ÍÀËÈÂ';
        3067:      rn_store := 'ÌÎÑÒÑÅÐÂ_ÒÐÀÍÇ_ÍÀËÈÂ';
        3630:      rn_store := 'ÀÇÑ-ÑÅÐÂ_ÒÐÀÍÇ_ÍÀËÈÂ';
      else
        rn_store := 'ÀÐÕÀÍ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
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
      If ok Then
        Begin
          InOR_INS.ClearVariables;
          InOR_INS.SetVariable(':nCOMPANY', 2);
          InOR_INS.SetVariable(':nCRN', rn_crn);
          InOR_INS.SetVariable(':sJUR_PERS', 'ÑÅÂÅÐÍÅÔÒÅÏÐÎÄÓÊÒ');
          InOR_INS.SetVariable(':sSELLER', 'ËÓÊÎÉË-ÓÕÒÀÍÅÔÒÅÏÅÐÅ');
          InOR_INS.SetVariable(':sFACEACC', facc);
          InOR_INS.SetVariable(':sPARTY', 'Æ/Ä_ÓÍÏ');
          InOR_INS.SetVariable(':sSTORE', rn_store);
          InOR_INS.SetVariable(':sSTOPERTYPE', rn_stoper);
          InOR_INS.SetVariable(':sINDOCTYPE', rn_indoctype);
          InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 2) + 'ò-' + trim(oraPR17.fieldbyname('Sved_num').asString));
          InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
          InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
          InOR_INS.SetVariable(':nDOCSTATUS', 0);
          InOR_INS.SetVariable(':sCONFDOCTYPE', 'ÄÎÃÎÂÎÐ');
					InOR_INS.SetVariable(':sCONFDOCNUMB', CONFDOCNUMB);
					InOR_INS.SetVariable(':dCONFDOCDATE', '03.12.2004');
          InOR_INS.SetVariable(':nSIGNTAX', 0);
          InOR_INS.SetVariable(':sCURRENCY', 'Ðóá.');
          InOR_INS.SetVariable(':nCURCOURS', 1);
          InOR_INS.SetVariable(':nCURBASECOURS', 1);
          InOR_INS.SetVariable(':nACC_COURS', 1);
          InOR_INS.SetVariable(':nACC_BASECOURS', 1);
          InOR_INS.SetVariable(':nFA_COURS', 1);
          InOR_INS.SetVariable(':nFA_BASECOURS', 1);
          InOR_INS.SetVariable(':sAGENT', rn_MOL);
          InOR_INS.SetVariable(':sCOMMENTS', trim(oraPR17.fieldbyname('num_kvit').asString) + ',(' + trim(oraPR17.fieldbyname('num_cist').asString) + '),' + trim(oraPR17.fieldbyname('sved_num').asString));
          InOR_INS.SetVariable(':sAGNFIFO', rn_agnfifo);
          Try
            Begin
              InOR_INS.Execute;
              mlog.Lines.Add('Çàãîëîâîê çàãðóæåí.');
              rn_sved := InOR_INS.GetVariable(':nrn');
              // Ñïåöèôèêàöèÿ ïî ïðîäóêòó Òàðèô
               InORs_INS.ClearVariables;
               InORs_INS.SetVariable(':nCOMPANY', 2);
               InORs_INS.SetVariable(':nPRN', rn_sved);
							 InORs_INS.SetVariable(':sNOMEN', 'Æ/Ä òàðèô');
							 InORs_INS.SetVariable(':sNOMMODIF', rn_stan);
  					    InORs_INS.SetVariable(':sTAXGR', 'ÍÄÑ 18%');
							 InORs_INS.SetVariable(':nPLANQUANT', 1);
               InORs_INS.SetVariable(':nFACTQUANT', 1);
               InORs_INS.SetVariable(':nPLANQUANTALT', 0);
               InORs_INS.SetVariable(':nFACTQUANTALT', 0);
               InORs_INS.SetVariable(':nPRICE', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat + oraPR17.fieldbyname('tarif_nds').asFloat)));
               InORs_INS.SetVariable(':nPRICEMEAS', 0);
               InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
               InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat + oraPR17.fieldbyname('tarif_nds').asFloat)));
               InORs_INS.SetVariable(':nACC_PRICEMEAS', 0);
               InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat)));
               InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat + oraPR17.fieldbyname('tarif_nds').asFloat)));
               InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat)));
               InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr(oraPR17.fieldbyname('tarif').asFloat + oraPR17.fieldbyname('tarif_nds').asFloat)));
               Try
                Begin
                  InORs_INS.Execute;
                  mlog.Lines.Add('Çàïèñü òàðèôà çàãðóæåíà.');
                  // Ñïåöèôèêàöèÿ ïî ïðîäóêòó  Îõðàíà
                  If oraPR17.fieldbyname('tarif_guard').asFloat > 0 Then
                    Begin
                      InORs_INS.ClearVariables;
                      InORs_INS.SetVariable(':nCOMPANY', 2);
                      InORs_INS.SetVariable(':nPRN', rn_sved);
                      InORs_INS.SetVariable(':sNOMEN', 'Æ/Ä îõðàíà');
											InORs_INS.SetVariable(':sNOMMODIF', 'Æ/Ä îõðàíà');
                      InORs_INS.SetVariable(':sTAXGR', 'ÍÄÑ 18%');
                      InORs_INS.SetVariable(':nPLANQUANT', 1);
                      InORs_INS.SetVariable(':nFACTQUANT', 1);
                      InORs_INS.SetVariable(':nPLANQUANTALT', 0);
                      InORs_INS.SetVariable(':nFACTQUANTALT', 0);
                      InORs_INS.SetVariable(':nPRICE', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat + oraPR17.fieldbyname('tarif_guard_nds').asFloat)));
                      InORs_INS.SetVariable(':nPRICEMEAS', 0);
                      InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
                      InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat + oraPR17.fieldbyname('tarif_guard_nds').asFloat)));
                      InORs_INS.SetVariable(':nACC_PRICEMEAS', 0);
                      InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat)));
                      InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat + oraPR17.fieldbyname('tarif_guard_nds').asFloat)));
                      InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat)));
                      InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr(oraPR17.fieldbyname('tarif_guard').asFloat + oraPR17.fieldbyname('tarif_guard_nds').asFloat)));
                      Try
                        InORs_INS.Execute;
                        mlog.Lines.Add('Çàïèñü îõðàíû çàãðóæåíà.');
                      Except
                        On E: EOracleError Do
                          ShowMessage(E.Message);
                      End;
                    End;
                  oraQuery.SQL.Clear;
                  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
                  oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
                  oraQuery.SQL.Add('''IncomingOrders'',');
                  oraQuery.SQL.Add((rn_sved) + ',');
                  oraQuery.SQL.Add('2,');
                  oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
                  oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
                  oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
                  oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
                  oraQuery.Execute;
                  oraQuery.SQL.Clear;
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
                  mlog.Lines.Add('Îòðàáîòàí êàê ôàêò Ïðèõîäíûé îðäåð ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString);

                  oraQuery.Session.Commit;
                  InOR_INS.Session.Commit;
                  InORs_INS.Session.Commit;
                  mlog.Lines.Add('Âñå çàïèñè ñîõðàíåíû óñïåøíî!');
              End Except
                On E: EOracleError Do
                  ShowMessage(E.Message);
              End;
          End Except
            On E: EOracleError Do
              ShowMessage(E.Message);
          End;
        End;
      oraPR17.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmGD17.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmGD17.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmGD17.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
