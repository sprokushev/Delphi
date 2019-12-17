Unit pr17load;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmPR17 = Class(TForm)
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
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    oraQ: TOracleQuery;
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
    oraPR17MOD_MODIF: TStringField;
    oraPR17CENA: TFloatField;
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
    oraPR17POLUCH_ID: TIntegerField;
    FindMOL: TOracleQuery;
    oraPR17STAN_ID: TFloatField;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    oraPR17TAXGR_CODE: TStringField;
    oraPR17TAXGR_INCOME: TStringField;
    rbVog: TRadioButton;
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
    Procedure WriteEvent(Tag: String);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmPR17                               : TfrmPR17;

Implementation

Uses MAIN, DMunit;

{$R *.dfm}

Procedure TfrmPR17.WriteEvent(Tag: String);
Begin
  frmMain.WriteEvent(Tag, 'Ôîðìà "Ïðèõîäíûå îðäåðà â Ïàðóñ"');
End;

Procedure TfrmPR17.acFilterExecute(Sender: TObject);
Begin
	//oraMain.Reconnect;
  oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbArxPotr.Checked Then //Ïîòðåáèòåëè ÀÔ  and (d.predpr_id<>3179)
		oraPR17.SQL[25] := 'and ((d.predpr_id<>2641) ) and (ps.region_id=21)'
//		oraPR17.SQL[25] := 'and ((m.npodog_id is not null) ) and (ps.region_id=21)'
	Else
		oraPR17.SQL[25] := '';
	If rbPotreb.Checked Then //Ïîòðåáèòåëè
//		oraPR17.SQL[23] := 'and ((m.npodog_id is not null) and (d.predpr_id<>3179)) and (ps.region_id is null or ps.region_id<>21)'
		oraPR17.SQL[23] := 'and d.predpr_id<>2641 and (ps.region_id is null or ps.region_id<>21)'	Else
		//  oraPR17.SQL[23]:='and m.npodog_id is null';
		oraPR17.SQL[23] := '';
	If rbArx.Checked Then //Àðõàíãåëüñê or (d.predpr_id=3179)
//    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and m.npodog_id is null'
    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and d.predpr_id=2641'
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
  If rbVog.Checked Then //Vogv
    oraPR17.SQL[24] := 'and (m.poluch_id in (290) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2728 or m.poluch_id=137)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKos.Checked Then //koslan
    oraPR17.SQL[24] := 'and (m.poluch_id in (2735,133) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2735 or m.poluch_id=133)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
	If rbPech.Checked Then //Pechera
		oraPR17.SQL[24] := 'and (m.poluch_id in (2731,110,857) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2731 or m.poluch_id=110 or m.poluch_id=2730 or m.poluch_id=857)'
	Else
		oraPR17.SQL[24] := oraPR17.SQL[24];

	If rbPAZS.Checked Then //Pechera AZS
		oraPR17.SQL[24] := 'and (m.poluch_id in (174,2730) and not(m.planstru_id in (95,178,208,207)))'
			//  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=174 or m.poluch_id=2730)'
	Else
		oraPR17.SQL[24] := oraPR17.SQL[24];

  If rbSyk.Checked Then //Syktyvkar
    oraPR17.SQL[24] := 'and (m.poluch_id in (2364,2732,177,112,750,131) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2732 or m.poluch_id=177 or m.poluch_id=112 or m.poluch_id=750)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUs.Checked Then //Usinsk
    oraPR17.SQL[24] := 'and (m.poluch_id in (2725,2703,2646,3526) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2725 or m.poluch_id=2703 or m.poluch_id=2646)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbUh.Checked Then //Uhta
    oraPR17.SQL[24] := 'and (m.poluch_id in (2723,102,2641,3856) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbLabyt.Checked Then //labytnangi
    oraPR17.SQL[24] := 'and (m.poluch_id in (2065) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbAviaTran.Checked Then //komiavia
    oraPR17.SQL[24] := 'and (m.poluch_id in (2314) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
    //  oraPR17.SQL.savetofile('c:\11.txt');
  oraPR17.Open;
End;

Procedure TfrmPR17.FormCreate(Sender: TObject);
Begin
  WriteEvent('Ôîðìà îòêðûòà');
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  oraMain.Connected := true;
  frmMain.acConnectToParus.Execute;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.Open;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmPR17.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
//  frmMain.acDisconnectFromMaster.Execute;;
  frmMain.acDisconnectFromParus.Execute;
  WriteEvent('Ôîðìà çàêðûòà');
  action := caFree;
End;

Procedure TfrmPR17.acLoadExecute(Sender: TObject);
Var
  summ, pref2                           : String;
  st1, st2, pref, rn_crn, rn_agnfifo    : String;
  rn_sved, rn, rn_parti, rn_del,rn_sved_main         : String;
  ok                                    : boolean;
  rn_indoctype, rn_store, rn_stoper     : String;
  rn_lin, rn_lout, rn_mol               : String;
  CONFDOCNUMB,facc                      : string;
Begin
	If cbKorrekt.Checked Then
    pref2 := 'ê'
  Else
    pref2 := '';
  rn_stoper := 'ÏÐÈÕÎÄ_ÍÏ_ËÓÊÎÉË';
  rn_agnfifo := 'ËÓÊÎÉË-ÓÍÏ';
  CONFDOCNUMB := 'ÑÍÏ-050250001 (1)';
  facc := '050250001/1';
  If rbPotreb.Checked Then
    Begin
      //Ïîòðåáèòåëè
      rn_indoctype := 'ÑÂÅÄ';
      rn_store := 'ÓÕÒÀ_ÖÀ';
      pref := '';
    End;
  If rbArxPotr.Checked Then
    Begin
      //Ïîòðåáèòåëè ÀÔ
      rn_stoper := 'ÏÐÈÕÎÄ_ÍÏ_ËÓÊÎÉË_ÀÐÕ';
      rn_indoctype := 'ÑÂÅÄ';
      rn_store := 'ÓÕÒÀ_ÖÀ';
      pref := '';
      CONFDOCNUMB := 'ÑÍÏ-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbArx.Checked Then
    Begin
      //Àðõàíãåëüñê
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÀÐÕÀÍ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ';
      pref := 'à';
      CONFDOCNUMB := 'ÑÍÏ-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbVor.Checked Then
    Begin
      //Âîðêóòà
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÂÎÐÊÓÒÀ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÈÍÒÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbKp.Checked Then
    Begin
      //KnyagPogost
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÊÍßÆÏÎÃ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbVog.Checked Then
    Begin
      //KnyagPogost
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÂÎÃÂÀÇ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbKos.Checked Then
    Begin
      //koslan
      rn_indoctype := 'ÑÂÅÄ_ÍÁ';
      rn_store := 'ÊÎÑËÀÍ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
	If rbPech.Checked Then
		Begin
			//Pechera
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ÏÅ×ÎÐÀ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
			pref := 'í';
		End;
If rbPAZS.Checked Then
		Begin
			//Pechera AZS
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ÏÅ×ÎÐÀ-ÀÇÑ';
			pref := 'í';
		End;
	If rbSyk.Checked Then
		Begin
			//Syktyvkar
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ÑÛÊÒ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
//			rn_store := 'ÓÕÒÀ_ÖÀ';
			rn_store := 'ÓÑÈÍÑÊ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ÈÐÀÅËÜ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbLabyt.Checked then
    Begin
      //Ëàáûòíàíãè
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ËÀÁÛÒÍÀÍ_ÒÐÀÍÇ_ÍÀËÈÂ';
      pref := 'í';
    End;
  If rbAviaTran.Checked then
    Begin
      //êîìèàâèà
			rn_indoctype := 'ÑÂÅÄ_ÍÁ';
			rn_store := 'ÀÝÐÎÏÎÐÒ';
      pref := 'í';
    End;
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      WriteEvent('Çàêà÷êà â Ïàðóñ ñâåäåíèå ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString + '.');
      // Ïàðòèÿ
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
        28:       begin rn_store := 'ÍÅÔÒÅÁÈÇ_ÒÐÀÍÇ_ÍÀËÈÂ';  rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
        302:      begin rn_store := 'ÒÐÎÈÖÀ_ÒÐÀÍÇ_ÍÀËÈÂ';   rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
        472:     begin
                  if oraPR17.fieldbyname('stan_id').AsInteger=3086 then
                     begin rn_store := 'ÂÅËÊ_ÒÐÀÍÇ_ÍÀËÈÂ_ÂÀÃ';  rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
                  if oraPR17.fieldbyname('stan_id').AsInteger=302 then
                     begin rn_store := 'ÂÅËÊ_ÒÐÀÍÇ_ÍÀËÈÂ_ÂÅË';  rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
                 end;
        659,3849:  begin rn_store := 'ÐÎÑÒÐÀÍÑ_ÒÐÀÍÇ_ÍÀËÈÂ';  rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
        2210:      begin rn_store := 'ÑÈÌÏÅÐÈß_ÒÐÀÍÇ_ÍÀËÈÂ';  rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
        2771:      begin rn_store := 'ÑÌÏ-520_ÒÐÀÍÇ_ÍÀËÈÂ';   rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
        3067:      begin rn_store := 'ÊÎÒËÀÑ_ÒÐÀÍÇ_ÍÀËÈÂ'; rn_stoper := 'ÏÐÈÕÎÄ_ÍÏ_ËÓÊÎÉË'; end;
        3630:      begin rn_store := 'ÀÇÑ-ÑÅÐÂ_ÒÐÀÍÇ_ÍÀËÈÂ';   rn_stoper := 'ÏÐÈÕÎÄ_ÀÐÕ'; end;
      else
        begin
        showmessage('Íå îïðåäåëåí ñêëàä ïîëó÷àòåëÿ.');
        rn_store := 'ÀÐÕÀÍ_ÒÐÀÍÇÈÒ_ÍÀËÈÂ';
        end;
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
      InOR_INS.SetVariable(':sJUR_PERS', 'ÑÅÂÅÐÍÅÔÒÅÏÐÎÄÓÊÒ');
      InOR_INS.SetVariable(':sSELLER', 'ËÓÊÎÉË-ÓÕÒÀÍÅÔÒÅÏÅÐÅ');
			InOR_INS.SetVariable(':sFACEACC', trim(facc));
			InOR_INS.SetVariable(':sPARTY', rn_parti);
			InOR_INS.SetVariable(':sSTORE', rn_store);
			InOR_INS.SetVariable(':sSTOPERTYPE', rn_stoper);
			InOR_INS.SetVariable(':sINDOCTYPE', rn_indoctype);
			InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 1) + pref + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString)+ '-' + trim(oraPR17.fieldbyname('mesto_id').asString));
			InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
			InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
			InOR_INS.SetVariable(':nDOCSTATUS', 0);
			InOR_INS.SetVariable(':sCONFDOCTYPE', 'ÄÎÃÎÂÎÐ');
//			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(oraPR17.fieldbyname('CONFDOCNUMB').asString));
 			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(CONFDOCNUMB));
			InOR_INS.SetVariable(':dCONFDOCDATE', '03.12.2004');
			InOR_INS.SetVariable(':nSIGNTAX', 0);
      InOR_INS.SetVariable(':sCURRENCY', 'Ðóá.');
      InOR_INS.SetVariable(':nCURCOURS', 1);
      InOR_INS.SetVariable(':nCURBASECOURS', 1);
      InOR_INS.SetVariable(':nACC_COURS', 1);
      InOR_INS.SetVariable(':nACC_BASECOURS', 1);
      InOR_INS.SetVariable(':nFA_COURS', 1);
      InOR_INS.SetVariable(':nFA_BASECOURS', 1);
      InOR_INS.SetVariable(':sAGENT', rn_mol);
      InOR_INS.SetVariable(':sCOMMENTS', trim(oraPR17.fieldbyname('num_kvit').asString) + ',(' + trim(oraPR17.fieldbyname('num_cist').asString) + '),' + trim(oraPR17.fieldbyname('sved_num').asString));
      InOR_INS.SetVariable(':sAGNFIFO', rn_agnfifo);
      Try
        Begin
          InOR_INS.Execute;
          WriteEvent('Çàãîëîâîê çàãðóæåí óñïåøíî!');
          rn_sved := InOR_INS.GetVariable(':nrn');
          rn_sved_main:=rn_sved;
          // Ñïåöèôèêàöèÿ ïî ïðîäóêòó
          InORs_INS.ClearVariables;
          InORs_INS.SetVariable(':nCOMPANY', 2);
          InORs_INS.SetVariable(':nPRN', rn_sved);
          InORs_INS.SetVariable(':sNOMEN', trim(oraPR17.fieldbyname('modif').asString));
					InORs_INS.SetVariable(':sNOMMODIF', trim(oraPR17.fieldbyname('mod_modif').asString));
// ÷òî çà óñëîâèå è àäàïòèðîâàò åãî ê íà÷àëó ãîäà
          if (oraPR17.fieldbyname('date_kvit').asDateTime >= StrToDate('01.01.2006')) and (oraPR17.fieldbyname('date_kvit').asDateTime < StrToDate('01.01.2007')) then
    					InORs_INS.SetVariable(':sTAXGR', trim(oraPR17.fieldbyname('taxgr_income').asString))
          else
    					InORs_INS.SetVariable(':sTAXGR', trim(oraPR17.fieldbyname('taxgr_code').asString));
          InORs_INS.SetVariable(':nPLANQUANT', trim(floatToStr((oraPR17.fieldbyname('ves').asFloat * 1000))));
          InORs_INS.SetVariable(':nFACTQUANT', trim(floatToStr((oraPR17.fieldbyname('ves').asFloat * 1000))));
          InORs_INS.SetVariable(':nPLANQUANTALT', trim(floatToStr((oraPR17.fieldbyname('ves').asFloat * 1000))));
          InORs_INS.SetVariable(':nFACTQUANTALT', trim(floatToStr((oraPR17.fieldbyname('ves').asFloat * 1000))));
          InORs_INS.SetVariable(':nPRICE', trim(floatToStr(oraPR17.fieldbyname('cena').asFloat / 1000)));
          InORs_INS.SetVariable(':nPRICEMEAS', 1);
          InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
          InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr(oraPR17.fieldbyname('cena').asFloat / 1000)));
          InORs_INS.SetVariable(':nACC_PRICEMEAS', 1);
          InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat)));
          InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat + oraPR17.fieldbyname('sum_prod_nds').asFloat)));
          InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat)));
          InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat + oraPR17.fieldbyname('sum_prod_nds').asFloat)));
          Try
            Begin
              InORs_INS.Execute;
              WriteEvent('Ñïåöèôèêàöèÿ çàãðóæåíà óñïåøíî!');
             End;
          //End
//          Except
//            On E: EOracleError Do
//              ShowMessage(E.Message);
//          End;
//      End;
      //End
//      Except
//           On E: EOracleError Do
//              ShowMessage(E.Message);
//      End;

              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''IncomingOrders'',');
              oraQuery.SQL.Add((rn_sved_main) + ',');
              oraQuery.SQL.Add('1,');
              oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
              oraQuery.SQL.Add('''' + DM.oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              rn_sved:=rn_sved_main;
             // ïðîñòàâëÿåì ñâÿçè
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('select rn from parus_fin');
              oraQuery.SQL.Add('where task=''DeliveryOrders'' and ');
              oraQuery.SQL.Add('subtask=1 and ');
              oraQuery.SQL.Add('month_id=''' + trim(oraPR17.fieldbyname('nom_zd').asString) + '''');
              oraQuery.Execute;
              If oraQuery.RowCount < 1 then
              begin
               ShowMessage('Íå çàãðóæåíû çàÿâêè, çàãðóçèòå ñíà÷àëà çàÿâêó è ïåðåçàãðóçèòå ïðèõ. îðäåð ¹ çàäàíèÿ' + oraPR17.fieldbyname('nom_zd').asString);
               WriteEvent('Íå çàãðóæåíû çàÿâêè, çàãðóçèòå ñíà÷àëà çàÿâêó è ïåðåçàãðóçèòå ïðèõ. îðäåð ¹ çàäàíèÿ' + oraPR17.fieldbyname('nom_zd').asString);
              end
              else rn_del:=IntToStr(oraQuery.FieldAsInteger('rn'));
              oraQuery.SQL.Clear;
              qInS.ClearVariables;
              qIns.SetVariable(':nDOCUMENT', rn_del);
              qins.Execute;
              rn_lin := qInS.GetVariable(':NResult');
              If rn_lin = '' Then
                Begin
                  qLinkIn.ClearVariables;
                  qLinkIn.SetVariable(':nCOMPANY', 2);
                  qLinkIn.SetVariable(':nDOCUMENT', rn_del);
                  qLinkIn.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
                  qLinkIn.SetVariable(':sUNITCODE', 'DeliveryOrders');
                  qLinkIn.SetVariable(':nSTATUS', 0);
                  qLinkIn.SetVariable(':nBREAKUP_KIND', 0);
                  qLinkIn.Execute;
                  rn_lin := qLinkIn.GetVariable(':NRN');
                End;
              qLinkOut.ClearVariables;
              qLinkOut.SetVariable(':nCOMPANY', 2);
              qLinkOut.SetVariable(':nDOCUMENT', rn_sved);
              qLinkOut.SetVariable(':din_date', FormatDateTime('dd.mm.yyyy', date));
              qLinkOut.SetVariable(':sUNITCODE', 'IncomingOrders');
              qLinkOut.SetVariable(':nSTATUS', 0);
              qLinkOut.SetVariable(':nBREAKUP_KIND', 0);
              qLinkOut.Execute;
              rn_lout := qLinkOut.GetVariable(':NRN');
              qLink.ClearVariables;
              qLink.SetVariable(':nIN_DOC', rn_lin);
              qLink.SetVariable(':nout_DOC', rn_lout);
              qLink.Execute;
              WriteEvent('Ïðèõîäíûé îðäåð ñâÿçàí ñ Çàêàçîì ïîñòàâùèêó!');
             //çàêîí÷èëè ïðîñòàâëÿòü ñâÿçè
              InOR_Ins.Session.Commit;
              oraQuery.Session.Commit;
              WriteEvent('Ïðèõîäíûé îðäåð ñôîðìèðîâàí óñïåøíî!');
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
                  begin
                      ShowMessage(E.Message);
                      WriteEvent(E.Message);
                  end;
                  End;
                  oraQ.Session.Commit;
                  WriteEvent('Îòðàáîòàí êàê ôàêò Ïðèõîäíûé îðäåð ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString);
                End;
          //End
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

Procedure TfrmPR17.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmPR17.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmPR17.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
