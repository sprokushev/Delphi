Unit ttn17dload;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  XPMan, dateutils, StrUtils, ComCtrls, ImgList, vgCtrls, vgDBTree;

Type
  TfrmTTN_kos = Class(TForm)
    oraMain: TOracleSession;
    oraPR17: TOracleDataSet;
    dsPR17: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    dbgPR17: TDBGridEh;
    ActionManager1: TActionManager;
    acFilter: TAction;
    XPManifest1: TXPManifest;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    OraQuery: TOracleQuery;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    oraQ: TOracleQuery;
    Label4: TLabel;
    oraPR17NUM_CIST: TStringField;
    oraPR17CAT_CEN_ID: TIntegerField;
    oraPR17DATE_CEN: TDateTimeField;
		oraPR17NUM_KVIT: TFloatField;
		oraPR17DATE_KVIT: TDateTimeField;
    oraPR17VES: TFloatField;
		oraPR17CENA_OTP: TFloatField;
		oraPR17SUM_PROD: TFloatField;
		oraPR17SUM_AKCIZ: TFloatField;
		oraPR17SUM_PROD_NDS: TFloatField;
    oraPR17NOM_ZD: TStringField;
    oraPR17ID: TIntegerField;
    oraPR17MODIF: TStringField;
    oraPR17PARUS_PRN: TFloatField;
    oraPR17MOD_MODIF: TStringField;
    oraPR17PARUS_RN: TFloatField;
    oraPR17TAXGR_RN: TFloatField;
    tvCatalog: TvgDBTreeView;
    Splitter1: TSplitter;
    mLog: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    deEnd: TDateEdit;
    deBeg: TDateEdit;
    rbArx: TRadioButton;
    rbSyk: TRadioButton;
    rbInta: TRadioButton;
    rbVor: TRadioButton;
    rbKos: TRadioButton;
    rbKp: TRadioButton;
    rbPech: TRadioButton;
    rbPAZS: TRadioButton;
    rbUh: TRadioButton;
    rbUs: TRadioButton;
    BitBtn1: TBitBtn;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    oraPR17SVED_NUM: TFloatField;
    oraPR17TAXGR_CODE: TStringField;
    cbKorrekt: TCheckBox;
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
  frmTTN_kos                             : TfrmTTN_kos;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTN_kos.acFilterExecute(Sender: TObject);
Begin
  If oraPR17.Active Then
    oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
	If rbArx.Checked Then //Àðõàíãåëüñê
		oraPR17.SQL[24] := 'and (ps.region_id=21) and (m.npodog_id is null)'
      //  oraPR17.SQL[24]:='and (m.planstru_id in (95,178,208) or m.poluch_id=2889)'
  Else
    oraPR17.SQL[24] := '';
  If rbVor.Checked Then //Âîðêóòà
    oraPR17.SQL[24] := 'and (m.poluch_id in (2729,128) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2729 or m.poluch_id=128)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbInta.Checked Then //Inta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2724,136,745) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2724 or m.poluch_id=136 or m.poluch_id=745)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKp.Checked Then //KnyagPogost
    oraPR17.SQL[24] := 'and (m.poluch_id in (2728,137) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2728 or m.poluch_id=137)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKos.Checked Then //koslan
    oraPR17.SQL[24] := 'and (m.poluch_id in (2735,133) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2735 or m.poluch_id=133)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbPech.Checked Then //Pechera
    oraPR17.SQL[24] := 'and (m.poluch_id in (2731,110,2730,857) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2731 or m.poluch_id=110 or m.poluch_id=857)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbPAZS.Checked Then //Pechera AZS
    oraPR17.SQL[24] := 'and (m.poluch_id in (174,2730) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=174 or m.poluch_id=2730)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbSyk.Checked Then //Syktyvkar
    oraPR17.SQL[24] := 'and (m.poluch_id in (2346,2732,177,112,750) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2732 or m.poluch_id=177 or m.poluch_id=112 or m.poluch_id=750)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUs.Checked Then //Usinsk
    oraPR17.SQL[24] := 'and (m.poluch_id in (2725,2703,2646) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2725 or m.poluch_id=2703 or m.poluch_id=2646)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUh.Checked Then //Uhta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2723,102,2641) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  oraPR17.Open;
End;

Procedure TfrmTTN_kos.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  //oraPR17.SQL[21]:='and k.date_kvit between TO_DATE('''+FormatDateTime('dd.mm.yyyy',deBeg.Date)+''',''dd.mm.yyyy'')';
  //oraPR17.SQL[22]:='and TO_DATE('''+FormatDateTime('dd.mm.yyyy',deEnd.Date)+''',''dd.mm.yyyy'')';
  //oraPR17.Open;
  oraCatalog.Open;
  tvCatalog.FullExpand;
End;

Procedure TfrmTTN_kos.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Recipients.EMailAddresses := 'JRomanov@KomiTu.lukoil.com';
      Subject := 'GoodsTransInvoicesToDepts ' + oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
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

Procedure TfrmTTN_kos.acLoadExecute(Sender: TObject);
Var
  summ                                  : String;
  st1, st2, pref, pref2, rn_crn, pref3  : String;
  rn_sved, rn                           : integer;
  ok                                    : boolean;
  rn_store, rn_stoper, rn_parti         : String;
  rn_mol, rn_subdiv, rn_instore         : String;
  rn_inmol, rn_rdoc, rn_ferry           : String;
  rn_outsubdiv, rn_vdoc                 : String;
  rn_doc, rn_ship, rn_instoper          : String;
  crn_int                               : cardinal;
Begin
	rn_doc := 'ÒÒÍ';
  rn_vdoc := 'Çàÿâêà ÊÒÓ';
  rn_ship := 'Æ/Ä_ÍÁ';
  rn_instoper := 'ÏÐÈÕÃÑÌÍÁ';
  tvCatalog.UpdateCursorPos;
  rn_crn := tvCatalog.FieldID.AsString;
  crn_int := strtoint(rn_crn);
  If cbKorrekt.Checked Then
    pref2 := 'ê'
  Else
    pref2 := '';
  If rbArx.Checked Then
    Begin
      //Àðõàíãåëüñê
      rn_store := 'ÓÕÒÀ_ÖÀ';
      rn_stoper := 'ÏÅÐÅÄ_ÀÐÕ';
      rn_mol := 'ÖÅÍÒÐ';
      rn_subdiv := 'ÀÐÕÀÍÃÅËÜÑÊ';
      rn_instore := 'ÀÐÕÀÍ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÀÐÕÀÍÃÅËÜÑÊÈÉ Ô-Ë';
      rn_rdoc := 'null';
      rn_ferry := 'null';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'à';
      pref2 := 'à';
    End;
  If rbVor.Checked Then
    Begin
      //Âîðêóòà
      rn_store := 'ÓÕÒÀ_ÖÀ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÖÅÍÒÐ';
      rn_subdiv := 'ÂÎÐÊÓÒÀ';
      rn_instore := 'ÂÎÐÊÓÒÀ_ÒÐÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÂÎÐÊÓÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_store := 'ÈÍÒÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÈÍÒÈÍÑÊÈÉ';
      rn_subdiv := 'ÈÍÒÀ';
      rn_instore := 'ÈÍÒÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÈÍÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbKp.Checked Then
    Begin
			//KnyagPogost
			rn_store := 'ÊÍßÆÏÎÃ_ÒÐÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
			rn_mol := 'ÑÛÊÒÛÂÊÀÐÑÊÈÉ';
      rn_subdiv := 'ÊÍßÆÏÎÃÎÑÒ_ÖÅÕ';
			rn_instore := 'ÊÍßÆÏÎÃ_ÒÐÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÑÛÊÒÛÂÊÀÐÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbKos.Checked Then
    Begin
      //koslan
      rn_store := 'ÊÎÑËÀÍ_ÒÐÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÊÎÑËÀÍÑÊÈÉ';
      rn_subdiv := 'ÊÎÑËÀÍ';
      rn_instore := 'ÊÎÑËÀÍ_ÒÐÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÊÎÑËÀÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbPech.Checked Then
    Begin
      //Pechera
      rn_store := 'ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÏÅ×ÎÐÑÊÈÉ';
      rn_subdiv := 'ÏÅ×ÎÐÀ';
      rn_instore := 'ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÏÅ×ÎÐÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbPAZS.Checked Then
    Begin
      //Pechera  AZS// rn_store:='ÓÕÒÀ_ÖÀ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      // rn_mol:='ÖÅÍÒÐ';
      rn_subdiv := 'Ïå÷îðñêàÿ  ÀÇÑ';
      rn_instore := 'ÏÅ×ÎÐÀ-ÀÇÑ';
      rn_inmol := 'Ôèëèïïîâ Í.À.';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';

      rn_store := 'ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      // rn_stoper:='ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÏÅ×ÎÐÑÊÈÉ';
      { rn_subdiv:='ÏÅ×ÎÐÀ';
       rn_instore:='ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
       rn_inmol:='ÏÅ×ÎÐÑÊÈÉ';
       rn_rdoc:='¹ öèñòåðíû';
       rn_ferry:='ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
       rn_outsubdiv:='ÖÀ_ÑÍÏ';
       pref:='í';
       pref2:='';
      }
    End;
  If rbSyk.Checked Then
    Begin
      //Syktyvkar
			rn_store := 'ÑÛÊÒ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÑÛÊÒÛÂÊÀÐÑÊÈÉ';
      rn_subdiv := 'ÑÛÊÒÛÂÊÀÐ';
      rn_instore := 'ÑÛÊÒ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
			rn_inmol := 'ÑÛÊÒÛÂÊÀÐÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
      rn_store := 'ÓÕÒÀ_ÖÀ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÖÅÍÒÐ';
      rn_subdiv := 'ÓÑÍ';
      rn_instore := 'ÓÑÈÍÑÊ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÓÑÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
      rn_store := 'ÈÐÀÅËÜ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅÐÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÓÕÒÈÍÑÊÈÉ';
      rn_subdiv := 'ÓÕÒÀ_ÍÁ';
      rn_instore := 'ÈÐÀÅËÜ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÓÕÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåðíû';
      rn_ferry := 'ÀÐÊÀ-ÄÎÐÒÐÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;

  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      mlog.Lines.Add('Çàêà÷êà â Ïàðóñ ñâåäåíèå ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString + '.');
      rn_sved := 0;
      rn := 0;
      // Ïàðòèÿ
      summ := trim(oraPR17.fieldbyname('cat_cen_id').asString) + '_';
      st1 := trim(inttostr(dayof(oraPR17.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then
        st1 := '0' + st1;
      summ := summ + st1;
      st1 := trim(inttostr(monthof(oraPR17.fieldbyname('date_cen').asdatetime)));
      If length(st1) = 1 Then
        st1 := '0' + st1;
      summ := summ + st1;
      st1 := rightstr(inttostr(YearOf(oraPR17.fieldbyname('date_cen').asdatetime)), 2);
      summ := summ + st1 + pref;
      oraQ.SQL.Clear;
      oraQ.SQL.Add('select g.rn from goodsparties g, incomdoc i where g.indoc=i.rn and');
      oraQ.SQL.Add('i.code=''' + summ + ''' and');
      oraQ.SQL.Add('g.nommodif=' + trim(oraPR17.fieldbyname('parus_rn').asString));
      oraQ.execute;
      If oraQ.RowCount > 0 Then
        Begin
          rn_parti := summ;
          ok := true;
        End
      Else
        Begin
          ok := false;
          mlog.Lines.Add('Íå íàéäåíà ïàðòèÿ â Ïàðóñå:' + summ + ' äëÿ ïðîäóêòà ' + trim(oraPR17.fieldbyname('mod_modif').asString) + #13#10);
        End;
      oraQ.SQL.Clear;
      pref2 := pref2 + pref3;
      If ok Then
        Begin
          oraInvIns.ClearVariables;
          oraInvIns.SetVariable(':nCOMPANY', 2);
          //    oraInvIns.SetVariable(':nCRN',rn_crn);
          oraInvIns.SetVariable(':nCRN', crn_int);
          oraInvIns.SetVariable(':sJUR_PERS', 'ÑÅÂÅÐÍÅÔÒÅÏÐÎÄÓÊÒ');
          oraInvIns.SetVariable(':sDOCTYPE', rn_doc);
          oraInvIns.SetVariable(':sPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 2) + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString));
          oraInvIns.SetVariable(':sNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
          oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':sSTOPER', rn_stoper);
          oraInvIns.SetVariable(':sSTORE', rn_store);
          oraInvIns.SetVariable(':sMOL', rn_mol);
          oraInvIns.SetVariable(':sSHEEPVIEW', rn_ship);
          oraInvIns.SetVariable(':sSUBDIV', rn_subdiv);
          oraInvIns.SetVariable(':sCURRENCY', 'Ðóá.');
          oraInvIns.SetVariable(':nCURCOURS', 1);
          oraInvIns.SetVariable(':nCURBASE', 1);
          oraInvIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat + oraPR17.fieldbyname('sum_prod_nds').asFloat)));
          If rn_rdoc <> 'null' Then
            Begin
              oraInvIns.SetVariable(':sRECIPDOC', rn_rdoc);
              oraInvIns.SetVariable(':sRECIPNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
            End;
          If rn_ferry <> 'null' Then
            oraInvIns.SetVariable(':sFERRYMAN', rn_ferry);
          oraInvIns.SetVariable(':sWAYBLADENUMB', trim(oraPR17.fieldbyname('sved_num').asString));
          oraInvIns.SetVariable(':sIN_STORE', rn_instore);
          oraInvIns.SetVariable(':sIN_MOL', rn_inmol);
          oraInvIns.SetVariable(':sIN_STOPER', rn_instoper);
          oraInvIns.SetVariable(':nIN_CURCOURS', 1);
          oraInvIns.SetVariable(':nIN_CURBASE', 1);
          oraInvIns.SetVariable(':sVALID_DOCTYPE', rn_vdoc);
          oraInvIns.SetVariable(':sVALID_DOCNUMB', trim(oraPR17.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sCOMMENTS', trim(oraPR17.fieldbyname('num_kvit').asString) + ',(' + trim(oraPR17.fieldbyname('num_cist').asString) + '),' + trim(oraPR17.fieldbyname('sved_num').asString));
          mlog.Lines.Add('crn:' + rn_crn);
          mlog.Lines.Add('crn:' + inttostr(crn_int));
          Try
            Begin
              oraInvIns.Execute;
              mlog.Lines.Add('Çàãîëîâîê çàãðóæåí óñïåøíî!');
              rn_sved := oraInvIns.GetVariable(':nRN');
              // Ñïåöèôèêàöèÿ      ïî ïðîäóêòó
              oraInvsIns.ClearVariables;
              oraInvsIns.SetVariable(':nCOMPANY', 2);
              oraInvsIns.SetVariable(':nPRN', rn_sved);
              oraInvsIns.SetVariable(':sNOMEN', trim(oraPR17.fieldbyname('modif').asString));
              oraInvsIns.SetVariable(':sNOMMODIF', trim(oraPR17.fieldbyname('mod_modif').asString));
              oraInvsIns.SetVariable(':sGOODSPARTY', rn_parti);
              oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(oraPR17.fieldbyname('cena_otp').asFloat / 1000)));
              oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(oraPR17.fieldbyname('ves').asFloat * 1000)));
              oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(oraPR17.fieldbyname('ves').asFloat * 1000)));
              oraInvsIns.SetVariable(':nPRICEMEAS', 1);
              oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat + oraPR17.fieldbyname('sum_prod_nds').asFloat)));
              Try
                Begin
                  oraInvsIns.Execute;
                  mlog.Lines.Add('Ñïåöèôèêàöèÿ çàãðóæåíà óñïåøíî!');
                  mlog.Lines.Add('ÒÒÍ íà îòïóñê â ïîäðàçäåëåíèÿ ñôîðìèðîâàíà óñïåøíî!');
                  oraQuery.SQL.Clear;
                  oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
                  oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
                  oraQuery.SQL.Add('''GoodsTransInvoicesToDepts'',');
                  oraQuery.SQL.Add(inttostr(rn_sved) + ',');
                  oraQuery.SQL.Add('1,');
                  oraQuery.SQL.Add('''' + oraPR17.fieldbyname('nom_zd').asString + ''',');
                  oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
                  oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
                  oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
                  oraQuery.Execute;
                  oraQuery.Session.Commit;
                  oraQuery.SQL.Clear;
                  oraQ.Session.Commit;
                  oraQ.SQL.Clear;
                End
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End
            End;
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
        End;
      oraPR17.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmTTN_kos.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmTTN_kos.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

End.
