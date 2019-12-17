Unit voznload;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmVZ17 = Class(TForm)
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
    oraPR17CAT_CEN_ID: TIntegerField;
    oraPR17DATE_CEN: TDateTimeField;
    oraPR17NUM_KVIT: TFloatField;
    oraPR17DATE_KVIT: TDateTimeField;
    oraPR17VES: TFloatField;
    oraPR17CENA_OTP: TFloatField;
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
    oraPR17VOZN: TFloatField;
    oraPR17VOZN_BN: TFloatField;
    rbPotrOther: TRadioButton;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    rbVog: TRadioButton;
    oraPR17VOZN_PT: TFloatField;
    oraPR17VOZN_PT_BN: TFloatField;
    oraPR17VOZN_PG: TFloatField;
    oraPR17VOZN_PG_BN: TFloatField;
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
  frmVZ17                               : TfrmVZ17;

Implementation

Uses MAIN;

{$R *.dfm}
Procedure TfrmVZ17.WriteEvent(Tag: String);
Begin
  frmMain.WriteEvent(Tag, 'Форма "Приходные ордера (вознагрождение) в Парус"');
End;

Procedure TfrmVZ17.acFilterExecute(Sender: TObject);
Begin
	//oraMain.Reconnect;
  oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbPotrOther.Checked Then //Потребители с услугами в цене
		oraPR17.SQL[25] := 'and d.id in(2523,2681)'
//		oraPR17.SQL[25] := 'and ((m.npodog_id is not null) ) and (ps.region_id=21)'
	Else
		oraPR17.SQL[25] := '';
  If rbArxPotr.Checked Then //Потребители АФ  and (d.predpr_id<>3179)
		oraPR17.SQL[25] := 'and ((d.predpr_id<>2641) ) and (ps.region_id=21) and d.id not in(2523,2681)'
//		oraPR17.SQL[25] := 'and ((m.npodog_id is not null) ) and (ps.region_id=21)'
	Else
		oraPR17.SQL[25] := oraPR17.SQL[25];
	If rbPotreb.Checked Then //Потребители
//		oraPR17.SQL[23] := 'and ((m.npodog_id is not null) and (d.predpr_id<>3179)) and (ps.region_id is null or ps.region_id<>21)'
		oraPR17.SQL[23] := 'and d.predpr_id<>2641 and (ps.region_id is null or ps.region_id<>21) and d.id not in(2523,2681)'	Else
		//  oraPR17.SQL[23]:='and m.npodog_id is null';
		oraPR17.SQL[23] := '';
	If rbArx.Checked Then //Архангельск or (d.predpr_id=3179)
//    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and m.npodog_id is null'
    oraPR17.SQL[24] := 'and (ps.region_id=21 or m.poluch_id in(2889,28)) and d.predpr_id=2641'
      //  oraPR17.SQL[24]:='and (m.planstru_id in (95,178,208) or m.poluch_id=2889)'
	Else
    oraPR17.SQL[24] := '';
  If rbVor.Checked Then //Воркута
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
  oraPR17.SQL.savetofile('c:\11.txt');
  oraPR17.Open;
End;

Procedure TfrmVZ17.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  WriteEvent('Форма открыта');
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

Procedure TfrmVZ17.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  WriteEvent('Форма закрыта');
  action := caFree;
End;

Procedure TfrmVZ17.acLoadExecute(Sender: TObject);
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
    pref2 := 'к'
  Else
    pref2 := '';
  rn_stoper := 'ПРИХОД_НП_ЛУКОЙЛ';
  rn_agnfifo := 'ЛУКОЙЛ-УНП';
  CONFDOCNUMB := 'СНП-050250001 (1)';
  rn_stoper := 'ПРИХ_ТРАНС';
	rn_indoctype:='ОРДЕР_ВОЗН';
  facc := '050250001/1';
  If rbPotrOther.Checked Then
    Begin
      //Потребители
      rn_store := 'УХТА_ЦА';
      pref := '';
    End;
  If rbPotreb.Checked Then
    Begin
      //Потребители
      rn_store := 'УХТА_ЦА';
      rn_stoper:='ПРИХ_ЖД';
      pref := '';
    End;
  If rbArxPotr.Checked Then
    Begin
      //Потребители АФ
      rn_store := 'УХТА_ЦА';
      pref := '';
      CONFDOCNUMB := 'СНП-050250001 (2)';
      facc := '050250001/2';
      rn_stoper:='ПРИХ_ЖД';
    End;
  If rbArx.Checked Then
    Begin
      //Архангельск
      rn_store := 'АРХАН_ТРАНЗИТ_НАЛИВ';
      pref := 'а';
      CONFDOCNUMB := 'СНП-050250001 (2)';
      facc := '050250001/2';
    End;
  If rbVor.Checked Then
    Begin
      //Воркута
      rn_store := 'ВОРКУТА_ТРАНЗ_НАЛИВ';
      pref := 'н';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_store := 'ИНТА_ТРАНЗИТ_НАЛИВ';
      pref := 'н';
    End;
  If rbKp.Checked Then
    Begin
      //KnyagPogost
      rn_store := 'КНЯЖПОГ_ТРАНЗ_НАЛИВ';
      pref := 'н';
    End;
  If rbVog.Checked Then
    Begin
      //KnyagPogost
      rn_store := 'ВОГВАЗ_ТРАНЗ_НАЛИВ';
      pref := 'н';
    End;
  If rbKos.Checked Then
    Begin
      //koslan
      rn_store := 'КОСЛАН_ТРАНЗ_НАЛИВ';
      pref := 'н';
    End;
	If rbPech.Checked Then
		Begin
			//Pechera
			rn_store := 'ПЕЧОРА_ТРАНЗИТ_НАЛИВ';
			pref := 'н';
		End;
If rbPAZS.Checked Then
		Begin
			//Pechera AZS
			rn_store := 'ПЕЧОРА-АЗС';
			pref := 'н';
		End;
	If rbSyk.Checked Then
		Begin
			//Syktyvkar
			rn_store := 'СЫКТ_ТРАНЗИТ_НАЛИВ';
      pref := 'н';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
			rn_store := 'УСИНСК_ТРАНЗИТ_НАЛИВ';
      pref := 'н';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
			rn_store := 'ИРАЕЛЬ_ТРАНЗИТ_НАЛИВ';
      pref := 'н';
    End;
  If rbLabyt.Checked Then
    Begin
      //labytnangi
			rn_store := 'ЛАБЫТНАН_ТРАНЗ_НАЛИВ';
      pref := 'н';
    End;
  If rbAviaTran.Checked Then
    Begin
      //Komiavia
			rn_store := 'АЭРОПОРТ';
      pref := 'н';
    End;
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      WriteEvent('Закачка в Парус сведение №' + oraPR17.fieldbyname('sved_num').AsString + ' №' + oraPR17.fieldbyname('num_cist').AsString + '.');
      // Партия
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
        28:      rn_store := 'НЕФТЕБИЗ_ТРАНЗ_НАЛИВ';
        302:      rn_store := 'ТРОИЦА_ТРАНЗ_НАЛИВ';
        472:     begin
                  if oraPR17.fieldbyname('stan_id').AsInteger=3086 then
                     rn_store := 'ВЕЛК_ТРАНЗ_НАЛИВ_ВАГ';
                  if oraPR17.fieldbyname('stan_id').AsInteger=302 then
                     rn_store := 'ВЕЛК_ТРАНЗ_НАЛИВ_ВЕЛ';
                 end;
        659,3849:  rn_store := 'РОСТРАНС_ТРАНЗ_НАЛИВ';         
        2210:      rn_store := 'СИМПЕРИЯ_ТРАНЗ_НАЛИВ';
        2771:      rn_store := 'СМП-520_ТРАНЗ_НАЛИВ';
        3067:      rn_store := 'КОТЛАС_ТРАНЗ_НАЛИВ';
        3630:      rn_store := 'АЗС-СЕРВ_ТРАНЗ_НАЛИВ';
      else
        begin
        showmessage('Не определен склад получателя.');
        rn_store := 'АРХАН_ТРАНЗИТ_НАЛИВ';
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
 If rbPotreb.Checked or rbArxPotr.Checked Then
 Begin
//********************************* Прих_транс*****************************************
      if oraPR17.fieldbyname('vozn_pt').asFloat>0 then
      begin
      InOR_INS.ClearVariables;
      InOR_INS.SetVariable(':nCOMPANY', 2);
      InOR_INS.SetVariable(':nCRN', rn_crn);
      InOR_INS.SetVariable(':sJUR_PERS', 'СЕВЕРНЕФТЕПРОДУКТ');
      InOR_INS.SetVariable(':sSELLER', 'ЛУКОЙЛ-УХТАНЕФТЕПЕРЕ');
			InOR_INS.SetVariable(':sFACEACC', trim(facc));
			InOR_INS.SetVariable(':sPARTY', 'ВОЗН');
			InOR_INS.SetVariable(':sSTORE', rn_store);
			InOR_INS.SetVariable(':sSTOPERTYPE','ПРИХ_ТРАНС');
			InOR_INS.SetVariable(':sINDOCTYPE', rn_indoctype);
			InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 1) + pref+ pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString)+ '-' + trim(oraPR17.fieldbyname('mesto_id').asString));
			InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
			InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
			InOR_INS.SetVariable(':nDOCSTATUS', 0);
			InOR_INS.SetVariable(':sCONFDOCTYPE', 'ДОГОВОР');
//			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(oraPR17.fieldbyname('CONFDOCNUMB').asString));
 			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(CONFDOCNUMB));
			InOR_INS.SetVariable(':dCONFDOCDATE', '03.12.2004');
			InOR_INS.SetVariable(':nSIGNTAX', 0);
      InOR_INS.SetVariable(':sCURRENCY', 'Руб.');
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
          WriteEvent('Заголовок загружен успешно!');
          rn_sved := InOR_INS.GetVariable(':nrn');
          // Спецификация по продукту
          InORs_INS.ClearVariables;
          InORs_INS.SetVariable(':nCOMPANY', 2);
          InORs_INS.SetVariable(':nPRN', rn_sved);
          InORs_INS.SetVariable(':sNOMEN', 'За транспортировку');
					InORs_INS.SetVariable(':sNOMMODIF', 'За транспортировку');
					InORs_INS.SetVariable(':sTAXGR', 'НДС 18%');
          InORs_INS.SetVariable(':nPLANQUANT', 1);
          InORs_INS.SetVariable(':nFACTQUANT', 1);
          InORs_INS.SetVariable(':nPLANQUANTALT', 1);
          InORs_INS.SetVariable(':nFACTQUANTALT', 1);
          InORs_INS.SetVariable(':nPRICE', trim(floatToStr((oraPR17.fieldbyname('vozn_pt').asFloat))));
          InORs_INS.SetVariable(':nPRICEMEAS', 1);
          InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
          InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr((oraPR17.fieldbyname('vozn_pt').asFloat))));
          InORs_INS.SetVariable(':nACC_PRICEMEAS', 1);
          InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_pt_bn').asFloat))));
          InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn_pt').asFloat))));
          InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_pt_bn').asFloat))));
          InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn_pt').asFloat))));
          Try
            Begin
              InORs_INS.Execute;
              WriteEvent('Спецификация загружена успешно!');
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''IncomingOrders'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('4,');
              oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              InOR_Ins.Session.Commit;
              oraQuery.Session.Commit;
              WriteEvent('Приходный ордер сформирован успешно!');
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
                  WriteEvent('Отработан как факт ПРИХ_ТРАНС №' + oraPR17.fieldbyname('sved_num').AsString + ' №' + oraPR17.fieldbyname('num_cist').AsString);
                End;
          End Except
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
      end;
//***********************************ПРИХ_ТРАНС********************************
//***********************************ПРИХ_ЖД***********************************
      if oraPR17.fieldbyname('vozn_pg').asFloat>0 then
      begin
      InOR_INS.ClearVariables;
      InOR_INS.SetVariable(':nCOMPANY', 2);
      InOR_INS.SetVariable(':nCRN', rn_crn);
      InOR_INS.SetVariable(':sJUR_PERS', 'СЕВЕРНЕФТЕПРОДУКТ');
      InOR_INS.SetVariable(':sSELLER', 'ЛУКОЙЛ-УХТАНЕФТЕПЕРЕ');
			InOR_INS.SetVariable(':sFACEACC', trim(facc));
			InOR_INS.SetVariable(':sPARTY', 'ВОЗН');
			InOR_INS.SetVariable(':sSTORE', rn_store);
			InOR_INS.SetVariable(':sSTOPERTYPE',rn_stoper);
			InOR_INS.SetVariable(':sINDOCTYPE', 'ОРДЕР_ДОП');
			InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 1) + pref + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString)+ '-' + trim(oraPR17.fieldbyname('mesto_id').asString));
			InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
			InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
			InOR_INS.SetVariable(':nDOCSTATUS', 0);
			InOR_INS.SetVariable(':sCONFDOCTYPE', 'ДОГОВОР');
//			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(oraPR17.fieldbyname('CONFDOCNUMB').asString));
 			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(CONFDOCNUMB));
			InOR_INS.SetVariable(':dCONFDOCDATE', '03.12.2004');
			InOR_INS.SetVariable(':nSIGNTAX', 0);
      InOR_INS.SetVariable(':sCURRENCY', 'Руб.');
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
          WriteEvent('Заголовок загружен успешно!');
          rn_sved := InOR_INS.GetVariable(':nrn');
          // Спецификация по продукту
          InORs_INS.ClearVariables;
          InORs_INS.SetVariable(':nCOMPANY', 2);
          InORs_INS.SetVariable(':nPRN', rn_sved);
          InORs_INS.SetVariable(':sNOMEN', 'За транспортировку');
					InORs_INS.SetVariable(':sNOMMODIF', 'За транспортировку');
					InORs_INS.SetVariable(':sTAXGR', 'НДС 18%');
          InORs_INS.SetVariable(':nPLANQUANT', 1);
          InORs_INS.SetVariable(':nFACTQUANT', 1);
          InORs_INS.SetVariable(':nPLANQUANTALT', 1);
          InORs_INS.SetVariable(':nFACTQUANTALT', 1);
          InORs_INS.SetVariable(':nPRICE', trim(floatToStr((oraPR17.fieldbyname('vozn_pg').asFloat))));
          InORs_INS.SetVariable(':nPRICEMEAS', 1);
          InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
          InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr((oraPR17.fieldbyname('vozn_pg').asFloat))));
          InORs_INS.SetVariable(':nACC_PRICEMEAS', 1);
          InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_pg_bn').asFloat))));
          InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn_pg').asFloat))));
          InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_pg_bn').asFloat))));
          InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn_pg').asFloat))));
          Try
            Begin
              InORs_INS.Execute;
              WriteEvent('Спецификация загружена успешно!');
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''IncomingOrders'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('5,');
              oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              InOR_Ins.Session.Commit;
              oraQuery.Session.Commit;
              WriteEvent('Приходный ордер сформирован успешно!');
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
                  WriteEvent('Отработан как факт ПРИХ_ЖД №' + oraPR17.fieldbyname('sved_num').AsString + ' №' + oraPR17.fieldbyname('num_cist').AsString);
                End;
          End Except
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
      end;
//***********************************ПРИХ_ЖД***********************************
 end else
 begin
      InOR_INS.ClearVariables;
      InOR_INS.SetVariable(':nCOMPANY', 2);
      InOR_INS.SetVariable(':nCRN', rn_crn);
      InOR_INS.SetVariable(':sJUR_PERS', 'СЕВЕРНЕФТЕПРОДУКТ');
      InOR_INS.SetVariable(':sSELLER', 'ЛУКОЙЛ-УХТАНЕФТЕПЕРЕ');
			InOR_INS.SetVariable(':sFACEACC', trim(facc));
			InOR_INS.SetVariable(':sPARTY', 'ВОЗН');
			InOR_INS.SetVariable(':sSTORE', rn_store);
			InOR_INS.SetVariable(':sSTOPERTYPE',rn_stoper);
			InOR_INS.SetVariable(':sINDOCTYPE', rn_indoctype);
			InOR_INS.SetVariable(':sINDOCPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 1) + pref + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString)+ '-' + trim(oraPR17.fieldbyname('mesto_id').asString));
			InOR_INS.SetVariable(':sINDOCNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
			InOR_INS.SetVariable(':dINDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
			InOR_INS.SetVariable(':nDOCSTATUS', 0);
			InOR_INS.SetVariable(':sCONFDOCTYPE', 'ДОГОВОР');
//			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(oraPR17.fieldbyname('CONFDOCNUMB').asString));
 			InOR_INS.SetVariable(':sCONFDOCNUMB', trim(CONFDOCNUMB));
			InOR_INS.SetVariable(':dCONFDOCDATE', '03.12.2004');
			InOR_INS.SetVariable(':nSIGNTAX', 0);
      InOR_INS.SetVariable(':sCURRENCY', 'Руб.');
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
          WriteEvent('Заголовок загружен успешно!');
          rn_sved := InOR_INS.GetVariable(':nrn');
          // Спецификация по продукту
          InORs_INS.ClearVariables;
          InORs_INS.SetVariable(':nCOMPANY', 2);
          InORs_INS.SetVariable(':nPRN', rn_sved);
          InORs_INS.SetVariable(':sNOMEN', 'За транспортировку');
					InORs_INS.SetVariable(':sNOMMODIF', 'За транспортировку');
					InORs_INS.SetVariable(':sTAXGR', 'НДС 18%');
          InORs_INS.SetVariable(':nPLANQUANT', 1);
          InORs_INS.SetVariable(':nFACTQUANT', 1);
          InORs_INS.SetVariable(':nPLANQUANTALT', 1);
          InORs_INS.SetVariable(':nFACTQUANTALT', 1);
          InORs_INS.SetVariable(':nPRICE', trim(floatToStr((oraPR17.fieldbyname('vozn').asFloat))));
          InORs_INS.SetVariable(':nPRICEMEAS', 1);
          InORs_INS.SetVariable(':nPRICE_CALC_RULE', 1);
          InORs_INS.SetVariable(':nACC_PRICE', trim(floatToStr((oraPR17.fieldbyname('vozn').asFloat))));
          InORs_INS.SetVariable(':nACC_PRICEMEAS', 1);
          InORs_INS.SetVariable(':nPLANSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_bn').asFloat))));
          InORs_INS.SetVariable(':nPLANSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn').asFloat))));
          InORs_INS.SetVariable(':nFACTSUM', trim(floatToStr((oraPR17.fieldbyname('vozn_bn').asFloat))));
          InORs_INS.SetVariable(':nFACTSUMTAX', trim(floatToStr((oraPR17.fieldbyname('vozn').asFloat))));
          Try
            Begin
              InORs_INS.Execute;
              WriteEvent('Спецификация загружена успешно!');
              oraQuery.SQL.Clear;
              oraQuery.SQL.Add('insert into parus_fin (kvit_id,task,rn,subtask,month_id,authid,sved_num, date_kvit) values (');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('id').AsString) + ',');
              oraQuery.SQL.Add('''IncomingOrders'',');
              oraQuery.SQL.Add((rn_sved) + ',');
              oraQuery.SQL.Add('4,');
              oraQuery.SQL.Add('''' + trim(oraPR17.fieldbyname('nom_zd').asString) + ''',');
              oraQuery.SQL.Add('''' + oraParus.LogonUsername + ''',');
              oraQuery.SQL.Add(trim(oraPR17.fieldbyname('Sved_num').asString) + ',');
              oraQuery.SQL.Add('TO_DATE(''' + FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').AsDateTime) + ''',''dd.mm.yyyy''))');
              oraQuery.Execute;
              InOR_Ins.Session.Commit;
              oraQuery.Session.Commit;
              WriteEvent('Приходный ордер сформирован успешно!');
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
                  WriteEvent('Отработан как факт ПРИХ_ЖД №' + oraPR17.fieldbyname('sved_num').AsString + ' №' + oraPR17.fieldbyname('num_cist').AsString);
                End;
          End Except
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
 end;


      oraPR17.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmVZ17.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmVZ17.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmVZ17.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
