Unit ttn17dload;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan,
  dateutils, StrUtils, ComCtrls, ImgList, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmTTN17d = Class(TForm)
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
    oraPR17SUM_PROD: TFloatField;
    oraPR17SUM_AKCIZ: TFloatField;
    oraPR17SUM_PROD_NDS: TFloatField;
    oraPR17NOM_ZD: TStringField;
    oraPR17ID: TIntegerField;
    oraPR17MODIF: TStringField;
    oraPR17MOD_MODIF: TStringField;
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
    cbKorrekt: TCheckBox;
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
  frmTTN17d                             : TfrmTTN17d;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmTTN17d.WriteEvent(Tag: String);
Begin
  frmMain.WriteEvent(Tag, 'Ôîğìà "Ğàñõîäíûå îğäåğà â ïîäğàçäåëåíèÿ â Ïàğóñ"');
End;

Procedure TfrmTTN17d.acFilterExecute(Sender: TObject);
Begin
  If oraPR17.Active Then
    oraPR17.Close;
  oraPR17.SQL[21] := 'and k.date_kvit between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraPR17.SQL[22] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  If rbArx.Checked Then //Àğõàíãåëüñê  or (d.predpr_id=3179))
   begin
    oraPR17.SQL[16] := 'and k.bill_id is not null and k.sum_prod >0 and (ps.region_id=21 or m.poluch_id in(2889,28)) and d.predpr_id=2641';
    oraPR17.SQL[24] := '';
   end
  Else
    begin
    oraPR17.SQL[24] := '';
    oraPR17.SQL[16] := 'and k.bill_id is not null and k.sum_prod >0 and d.predpr_id=2641';
    end;
  If rbVor.Checked Then //Âîğêóòà
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
  If rbVog.Checked Then //KnyagPogost
    oraPR17.SQL[24] := 'and (m.poluch_id in (290) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbKos.Checked Then //koslan
    oraPR17.SQL[24] := 'and (m.poluch_id in (2735,133) and not(m.planstru_id in (95,178,208,207)))'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  If rbPech.Checked Then //Pechera
    oraPR17.SQL[24] := 'and (m.poluch_id in (2731,110,2730,857) and not(m.planstru_id in (95,178,208,207)))'
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
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
 If rbAviaTran.Checked Then //êîìèàâèà
    oraPR17.SQL[24] := 'and (m.poluch_id in (2314) and not(m.planstru_id in (95,178,208,207)))'
      //  oraPR17.SQL[24]:='and (m.planstru_id=96 or m.planstru_id=177 or m.planstru_id=105) and (m.poluch_id=2723 or m.poluch_id=102 or m.poluch_id=2641)'
  Else
    oraPR17.SQL[24] := oraPR17.SQL[24];
  oraPR17.Open;
End;

Procedure TfrmTTN17d.FormCreate(Sender: TObject);
Begin
  deBeg.Date := date - 2;
  deEnd.Date := date - 1;
  WriteEvent('Ôîğìà îòêğûòà');
  oraMain.Connected := true;
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraCatalog.Open;
  mteCatalog.Open;
End;

Procedure TfrmTTN17d.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraPR17.Close;
  oraCatalog.Close;
  oraMain.Connected := false;
  oraParus.Connected := false;
  WriteEvent('Ôîğìà îòêğûòà');
  action := caFree;
End;

Procedure TfrmTTN17d.acLoadExecute(Sender: TObject);
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
  rn_crn := mtecatalog.fieldbyname('RN').asstring;
  rn_doc := 'ÒÒÍ';
  rn_vdoc := 'Çàÿâêà ÊÒÓ';
  rn_ship := 'Æ/Ä_ÍÁ';
  rn_instoper := 'ÏĞÈÕÃÑÌÍÁ';
  crn_int := strtoint(rn_crn);
  If cbKorrekt.Checked Then
    pref2 := 'ê'
  Else
    pref2 := '';
  If rbArx.Checked Then
    Begin
      //Àğõàíãåëüñê
      rn_store := 'ÀĞÕÀÍ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';
      rn_mol := 'ÀĞÕÀÍÃÅËÜÑÊÈÉ Ô-Ë';
//      rn_subdiv := 'ÀĞÕÀÍÃÅËÜÑÊ';
      rn_instore := 'ÀĞÕÀÍ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÀĞÕÀÍÃÅËÜÑÊÈÉ Ô-Ë';
      rn_rdoc := 'null';
      rn_ferry := 'null';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'à';
      pref2 := 'à';
    End;
  If rbVor.Checked Then
    Begin
      //Âîğêóòà
			rn_store := 'ÂÎĞÊÓÒÀ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
//      rn_subdiv := 'ÂÎĞÊÓÒÀ';
      rn_instore := 'ÂÎĞÊÓÒÀ_ÒĞÀÍÇ_ÍÀËÈÂ';
			rn_inmol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbInta.Checked Then
    Begin
      //Inta
      rn_store := 'ÈÍÒÀ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÈÍÒÈÍÑÊÈÉ';
//      rn_subdiv := 'ÈÍÒÀ';
      rn_instore := 'ÈÍÒÀ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÈÍÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbKp.Checked Then
    Begin
      //KnyagPogost
      rn_store := 'ÊÍßÆÏÎÃ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
//      rn_subdiv := 'ÊÍßÆÏÎÃÎÑÒ_ÖÅÕ';
      if oraPR17.fieldbyname('poluch_id').AsInteger=290 then
      rn_instore := 'ÂÎÃÂÀÇ_ÒĞÀÍÇ_ÍÀËÈÂ' else
      rn_instore := 'ÊÍßÆÏÎÃ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbVog.Checked Then
    Begin
      //KnyagPogost
      rn_store := 'ÂÎÃÂÀÇ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
//      rn_subdiv := 'ÊÍßÆÏÎÃÎÑÒ_ÖÅÕ';
      if oraPR17.fieldbyname('poluch_id').AsInteger=290 then
      rn_instore := 'ÂÎÃÂÀÇ_ÒĞÀÍÇ_ÍÀËÈÂ' else
      rn_instore := 'ÊÍßÆÏÎÃ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbKos.Checked Then
    Begin
      //koslan
      rn_store := 'ÊÎÑËÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÊÎÑËÀÍÑÊÈÉ';
//      rn_subdiv := 'ÊÎÑËÀÍ';
      rn_instore := 'ÊÎÑËÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÊÎÑËÀÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbPech.Checked Then
    Begin
      //Pechera
      rn_store := 'ÏÅ×ÎĞÀ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÏÅ×ÎĞÑÊÈÉ';
//      rn_subdiv := 'ÏÅ×ÎĞÀ';
      rn_instore := 'ÏÅ×ÎĞÀ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÏÅ×ÎĞÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbPAZS.Checked Then
    Begin
      //Pechera  AZS// rn_store:='ÓÕÒÀ_ÖÀ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      // rn_mol:='ÖÅÍÒĞ';
//      rn_subdiv := 'Ïå÷îğñêàÿ  ÀÇÑ';
      rn_instore := 'ÏÅ×ÎĞÀ-ÀÇÑ';
      rn_inmol := 'Ôèëèïïîâ Í.À.';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';

      rn_store := 'ÏÅ×ÎĞÀ-ÀÇÑ';
      // rn_stoper:='ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÏÅ×ÎĞÑÊÈÉ';
      { rn_subdiv:='ÏÅ×ÎĞÀ';
       rn_instore:='ÏÅ×ÎĞÀ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
       rn_inmol:='ÏÅ×ÎĞÑÊÈÉ';
       rn_rdoc:='¹ öèñòåğíû';
       rn_ferry:='ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
       rn_outsubdiv:='ÖÀ_ÑÍÏ';
       pref:='í';
       pref2:='';
      }
    End;
  If rbSyk.Checked Then
    Begin
      //Syktyvkar
      rn_store := 'ÑÛÊÒ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
//      rn_subdiv := 'ÑÛÊÒÛÂÊÀĞ';
      rn_instore := 'ÑÛÊÒ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÑÛÊÒÛÂÊÀĞÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbUs.Checked Then
    Begin
      //Usinsk
//      rn_store := 'ÓÕÒÀ_ÖÀ';  //ÓÑÈÍÑÊ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ
      rn_store := 'ÓÑÈÍÑÊ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';  //ÓÑÈÍÑÊ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
//      rn_mol := 'ÖÅÍÒĞ';   //ÓÑÈÍÑÊÈÉ
      rn_mol := 'ÓÑÈÍÑÊÈÉ';   //ÓÑÈÍÑÊÈÉ
//      rn_subdiv := 'ÓÑÍ';
      rn_instore := 'ÓÑÈÍÑÊ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÓÑÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbUh.Checked Then
    Begin
      //Uhta
      rn_store := 'ÈĞÀÅËÜ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÓÕÒÈÍÑÊÈÉ';
//      rn_subdiv := 'ÓÕÒÀ_ÍÁ';
      rn_instore := 'ÈĞÀÅËÜ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ';
      rn_inmol := 'ÓÕÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
			pref2 := '';
    End;
  If rblabyt.Checked Then
    Begin
      //Labytnangi
      rn_store := 'ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';  //ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
//      rn_subdiv := 'ÓÑÍ';
      rn_instore := 'ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rblabyt.Checked Then
    Begin
      //Labytnangi
      rn_store := 'ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';  //ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
//      rn_subdiv := 'ÓÑÍ';
      rn_instore := 'ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ';
      rn_inmol := 'ÂÎĞÊÓÒÈÍÑÊÈÉ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;
  If rbAviaTran.Checked Then
    Begin
      //komiavia
      rn_store := 'ÀİĞÎÏÎĞÒ';  //ËÀÁÛÒÍÀÍ_ÒĞÀÍÇ_ÍÀËÈÂ
      rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ';
      rn_mol := 'ÔÃÓÏ ÊÎÌÈÀÂÈÀÒĞÀÍÑ';
//      rn_subdiv := 'ÓÑÍ';
      rn_instore := 'ÀİĞÎÏÎĞÒ';
      rn_inmol := 'ÔÃÓÏ ÊÎÌÈÀÂÈÀÒĞÀÍÑ';
      rn_rdoc := '¹ öèñòåğíû';
      rn_ferry := 'ÀĞÊÀ-ÄÎĞÒĞÀÍÑ';
      rn_outsubdiv := 'ÖÀ_ÑÍÏ';
      pref := 'í';
      pref2 := '';
    End;

  oraPR17.First;
  While Not oraPR17.Eof Do
    Begin
      WriteEvent('Çàêà÷êà â Ïàğóñ ñâåäåíèå ¹' + oraPR17.fieldbyname('sved_num').AsString + ' ¹' + oraPR17.fieldbyname('num_cist').AsString + '.');
      rn_sved := 0;
      rn := 0;
      // Ïàğòèÿ
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
//      oraQ.SQL.Add('select g.rn from goodsparties g, incomdoc i where g.indoc=i.rn and');
			oraQ.SQL.Add('select nrn from v_goodsparties where');
			oraQ.SQL.Add('scode=''' + summ + ''' and');
			oraQ.SQL.Add('snommodif=''' + trim(oraPR17.fieldbyname('mod_modif').asString+''''));
      oraQ.execute;
      If oraQ.RowCount > 0 Then
        Begin
          rn_parti := summ;
          ok := true;
        End
      Else
        Begin
          ok := false;
					WriteEvent('Íå íàéäåíà ïàğòèÿ â Ïàğóñå:' + summ + ' äëÿ ïğîäóêòà ' + trim(oraPR17.fieldbyname('mod_modif').asString) + #13#10);
        End;
      oraQ.SQL.Clear;
      pref2 := pref2 + pref3;
      If rbArx.Checked Then
      case oraPR17.fieldbyname('poluch_id').AsInteger of
        28:      begin rn_store := 'ÍÅÔÒÅÁÈÇ_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2007'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
        302:     begin rn_store := 'ÒĞÎÈÖÀ_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2003'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
        472:     begin
                  if oraPR17.fieldbyname('stan_id').AsInteger=3086 then
                     begin rn_store := 'ÂÅËÊ_ÒĞÀÍÇ_ÍÀËÈÂ_ÂÀÃ'; rn_instore:='2012'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
                  if oraPR17.fieldbyname('stan_id').AsInteger=302 then
                     begin rn_store := 'ÂÅËÊ_ÒĞÀÍÇ_ÍÀËÈÂ_ÂÅË'; rn_instore:='2002'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
                 end;
        659,3849:begin rn_store := 'ĞÎÑÒĞÀÍÑ_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2001'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
        2210:    begin rn_store := 'ÑÈÌÏÅĞÈß_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2010'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
        2771:    begin  rn_store := 'ÑÌÏ-520_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2008'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
        3067:    begin  rn_store := 'ÊÎÒËÀÑ_ÒĞÀÍÇ_ÍÀËÈÂ'; rn_instore:='2020'; rn_stoper := 'ÏÅĞÅÄ_ÍÅÔÒÅÁÀÇÛ'; end;
        3630:    begin  rn_store := 'ÀÇÑ-ÑÅĞÂ_ÒĞÀÍÇ_ÍÀËÈÂ';  rn_instore:='2005'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
      else
        begin rn_store := 'ÀĞÕÀÍ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ'; rn_instore := 'ÀĞÕÀÍ_ÒĞÀÍÇÈÒ_ÍÀËÈÂ'; rn_stoper := 'ÏÅĞÅÄ_ÀĞÕ';end;
      end;
      with FindMOL do
      begin
        ClearVariables;
        SetVariable(':nCOMPANY', 2);
        SetVariable(':sNumb', rn_store);
      end;
      FindMOL.Execute;
      rn_mol:=FindMOL.GetVariable(':smol');
      with FindMOL do
      begin
        ClearVariables;
        SetVariable(':nCOMPANY', 2);
        SetVariable(':sNumb', rn_instore);
      end;
      FindMOL.Execute;
      rn_inmol:=FindMOL.GetVariable(':smol');
      FindMOL.Close;
      If ok Then
        Begin
          oraInvIns.ClearVariables;
          oraInvIns.SetVariable(':nCOMPANY', 2);
          //    oraInvIns.SetVariable(':nCRN',rn_crn);
          oraInvIns.SetVariable(':nCRN', crn_int);
          oraInvIns.SetVariable(':sJUR_PERS', 'ÑÅÂÅĞÍÅÔÒÅÏĞÎÄÓÊÒ');
          oraInvIns.SetVariable(':sDOCTYPE', rn_doc);
          oraInvIns.SetVariable(':sPREF', rightstr(inttostr(yearof(oraPR17.fieldbyname('date_kvit').asDateTime)), 2) + pref2 + '-' + trim(oraPR17.fieldbyname('Sved_num').asString));
          oraInvIns.SetVariable(':sNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
          oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', oraPR17.fieldbyname('date_kvit').asDateTime));
          oraInvIns.SetVariable(':sSTOPER', rn_stoper);
          oraInvIns.SetVariable(':sSTORE', rn_store);
          oraInvIns.SetVariable(':sMOL', rn_mol);
          oraInvIns.SetVariable(':sSHEEPVIEW', rn_ship);
          oraInvIns.SetVariable(':sSUBDIV', rn_subdiv);
          oraInvIns.SetVariable(':sCURRENCY', 'Ğóá.');
          oraInvIns.SetVariable(':nCURCOURS', 1);
          oraInvIns.SetVariable(':nCURBASE', 1);
          oraInvIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(oraPR17.fieldbyname('sum_prod').asFloat + oraPR17.fieldbyname('sum_akciz').asFloat + oraPR17.fieldbyname('sum_prod_nds').asFloat)));
          If rn_rdoc <> 'null' Then
            Begin
              oraInvIns.SetVariable(':sRECIPDOC', rn_rdoc);
              oraInvIns.SetVariable(':sRECIPNUMB', trim(oraPR17.fieldbyname('num_cist').asString));
            End;
          //If rn_ferry <> 'null' Then
          //  oraInvIns.SetVariable(':sFERRYMAN', rn_ferry);
          oraInvIns.SetVariable(':sWAYBLADENUMB', trim(oraPR17.fieldbyname('sved_num').asString));
          oraInvIns.SetVariable(':sIN_STORE', rn_instore);
          oraInvIns.SetVariable(':sIN_MOL', rn_inmol);
          oraInvIns.SetVariable(':sIN_STOPER', rn_instoper);
          oraInvIns.SetVariable(':nIN_CURCOURS', 1);
          oraInvIns.SetVariable(':nIN_CURBASE', 1);
          oraInvIns.SetVariable(':sVALID_DOCTYPE', rn_vdoc);
          oraInvIns.SetVariable(':sVALID_DOCNUMB', trim(oraPR17.fieldbyname('nom_zd').asString));
          oraInvIns.SetVariable(':sCOMMENTS', trim(oraPR17.fieldbyname('num_kvit').asString) + ',(' + trim(oraPR17.fieldbyname('num_cist').asString) + '),' + trim(oraPR17.fieldbyname('sved_num').asString));
          Try
            Begin
              oraInvIns.Execute;
              WriteEvent('Çàãîëîâîê çàãğóæåí óñïåøíî!');
              rn_sved := oraInvIns.GetVariable(':nRN');
              // Ñïåöèôèêàöèÿ      ïî ïğîäóêòó
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
                  WriteEvent('Ñïåöèôèêàöèÿ çàãğóæåíà óñïåøíî!');
                  WriteEvent('ÒÒÍ íà îòïóñê â ïîäğàçäåëåíèÿ ñôîğìèğîâàíà óñïåøíî!');
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
               Begin
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
          End;
        End;
      oraPR17.Next;
    End;
  acFilterExecute(Self);
End;

Procedure TfrmTTN17d.dbgPR17GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; Var Background: TColor;
  State: TGridDrawState);
Begin
  If odd(oraPR17.RecNo) Then
    background := clMoneyGreen;
End;

Procedure TfrmTTN17d.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

procedure TfrmTTN17d.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
