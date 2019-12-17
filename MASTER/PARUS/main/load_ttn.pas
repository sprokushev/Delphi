Unit load_ttn;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, Oracle, DB, ComCtrls,
  OracleData, Grids, DBGridEh, StdCtrls, Buttons;

Type
  Tfrm1cTTNPar = Class(TForm)
    oraTTN: TOracleDataSet;
    oraSesMain: TOracleSession;
    dsCatalog: TDataSource;
    oraNextNumb: TOracleQuery;
    ActionManager1: TActionManager;
    acTTN2Par: TAction;
    oraQ: TOracleQuery;
    DBGridEh1: TDBGridEh;
    dsTTN: TDataSource;
    acReload: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    oraCatalog: TOracleDataSet;
    grTTN_Det: TDBGridEh;
    oraTTN_det: TOracleDataSet;
    dsTTN_det: TDataSource;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    Procedure acTTN2ParExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acReloadExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frm1cTTNPar                           : Tfrm1cTTNPar;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure Tfrm1cTTNPar.acTTN2ParExecute(Sender: TObject);
Var
  summ, rn_stan, rn_parti               : String;
  st1, st2, rn_crn                      : String;
  rn_sved, rn_akt                       : String;
  ok                                    : boolean;
  ss, ss_det                            : ^TOracleDataSet;
Begin
//  rn_crn := IntToStr(tvcatalog.FieldID.AsInteger);
  ss := @oraTTN;
  ss_det := @oraTTN_det;
  ss^.First;
  While Not ss^.Eof Do
    Begin
      //  mlog.Lines.Add('«‡Í‡˜Í‡ ‚ œ‡ÛÒ Ò‚Â‰ÂÌËÂ π'+ ss^.fieldbyname('sved_num').AsString+' π'+ ss^.fieldbyname('num_cist').AsString);
      ok := true;
      If ok Then
        Begin
          oraInvIns.ClearVariables;
          oraInvIns.SetVariable(':nCOMPANY', 2);
          oraInvIns.SetVariable(':nCRN', rn_crn);
          oraInvIns.SetVariable(':sJUR_PERS', '—≈¬≈–Õ≈‘“≈œ–Œƒ” “');
          oraInvIns.SetVariable(':sDOCTYPE', '—¬≈ƒ');
          oraInvIns.SetVariable(':sPREF', 'ARX');
          oraInvIns.SetVariable(':sNUMB', trim(ss^.fieldbyname('ttn_numb').asString));
          oraInvIns.SetVariable(':dDOCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('ttn_date').asDateTime));
          oraInvIns.SetVariable(':dSALEDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('ttn_date').asDateTime));
          oraInvIns.SetVariable(':sACCDOC', trim(ss^.fieldbyname('SVALID_DOCTYPE').asString));
          oraInvIns.SetVariable(':sACCNUMB', trim(ss^.fieldbyname('SVALID_DOCNUMB').asString));
          oraInvIns.SetVariable(':dACCDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('DVALID_DOCDATE').asDateTime));
          oraInvIns.SetVariable(':sSTOPER', '–≈¿À_“–¿Õ«»“');
          oraInvIns.SetVariable(':sFACEACC', trim(ss^.fieldbyname('sfaceacc').asString));
          oraInvIns.SetVariable(':sAGENT', trim(ss^.fieldbyname('sagent').asString));
          oraInvIns.SetVariable(':sTARIF', trim(ss^.fieldbyname('starif').asString));
          oraInvIns.SetVariable(':nSERVACT_SIGN', 0);
          oraInvIns.SetVariable(':sSTORE', '”’“¿_÷¿');
          oraInvIns.SetVariable(':sMOL', '÷≈Õ“–');
          oraInvIns.SetVariable(':sSHEEPVIEW', trim(ss^.fieldbyname('sshipview').asString));
          oraInvIns.SetVariable(':sPAYTYPE', trim(ss^.fieldbyname('spay_type').asString));
          oraInvIns.SetVariable(':nDISCOUNT', 0);
          oraInvIns.SetVariable(':sCURRENCY', '–Û·.');
          oraInvIns.SetVariable(':nCURCOURS', 1);
          oraInvIns.SetVariable(':nCURBASE', 1);
          oraInvIns.SetVariable(':nFA_COURS', 1);
          oraInvIns.SetVariable(':nFA_BASECOURS', 1);
          oraInvIns.SetVariable(':nSUMM', floattostr(ss^.fieldbyname('nsumm').asFloat));
          oraInvIns.SetVariable(':nSUMMWITHNDS', floattostr(ss^.fieldbyname('nSUMMWITHNDS').asFloat));
          oraInvIns.SetVariable(':sRECIPNUMB', trim(ss^.fieldbyname('srecipnumb').asString));
          oraInvIns.SetVariable(':sAGNFIFO', trim(ss^.fieldbyname('fifo').asString));
          //    oraInvIns.SetVariable(':sCOMMENTS',trim(ss^.fieldbyname('num_kvit').asString)+',('+trim(ss^.fieldbyname('num_cist').asString)+'),'+trim(ss^.fieldbyname('sved_num').asString));
          oraInvIns.SetVariable(':sACC_AGENT', trim(ss^.fieldbyname('sacc_agent').asString));
          oraInvIns.SetVariable(':sSUBDIV', trim(ss^.fieldbyname('ssubdiv').asString));
          Try
            Begin //Ò‚Â‰ 1
              oraInvIns.Execute;
              rn_sved := oraInvIns.getVariable(':nRN');
              ss_det^.first;
              While Not ss_det^.Eof Do
                Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
                  oraInvsIns.SetVariable(':sTAXGR', trim(ss_det^.fieldbyname('Stax_group').asString));
                  oraInvsIns.SetVariable(':sNOMEN', trim(ss_det^.fieldbyname('Nomen_code').asString));
                  oraInvsIns.SetVariable(':sNOMMODIF', trim(ss_det^.fieldbyname('Nomn_parus_modif').asString));
                  oraInvsIns.SetVariable(':sNOMNMODIFPACK', trim(ss_det^.fieldbyname('Nomn_parus_pack').asString));
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss_det^.fieldbyname('Ttn_price').asFloat)));
                  oraInvsIns.SetVariable(':nDISCOUNT', 0);
                  oraInvsIns.SetVariable(':nQUANT', trim(floatToStr(ss_det^.fieldbyname('Ttn_quan').asFloat)));
                  oraInvsIns.SetVariable(':nQUANTALT', trim(floatToStr(ss_det^.fieldbyname('Ttn_quan').asFloat)));
                  oraInvsIns.SetVariable(':nPRICEMEAS', 1);
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss_det^.fieldbyname('nSUMM').asFloat)));
                  oraInvsIns.SetVariable(':nSUMMWITHNDS', trim(floatToStr(ss_det^.fieldbyname('nsumwithnds').asFloat + ss^.fieldbyname('nds_prod').asFloat)));
                  Try //Ò‚Â‰ 2
                    oraInvsIns.Execute;
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End; //Ò‚Â‰ 2
                  ss_det^.Next;
                End;
            End //    Ò‚Â‰ 1
          Except On E: EOracleError Do
              ShowMessage(E.Message);
          End;
          oraQ.Session.Commit;
          oraQ.SQL.Clear;
        End;
      ss^.Next;
    End;
End;

Procedure Tfrm1cTTNPar.FormCreate(Sender: TObject);
Begin
  oraSesMain.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraSesMain.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraSesMain.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraSesMain.Connected := true;
  oraCatalog.Open;
  oraTTN.Open;
  oraTTN_det.Open;
End;

Procedure Tfrm1cTTNPar.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraSesMain.Connected := false;
  action := caFree;
End;

Procedure Tfrm1cTTNPar.acReloadExecute(Sender: TObject);
Begin
  If oraTTN.Active Then
    oraTTN.Close;
  oraTTN.Session.Commit;
  oraTTN.Open;
End;

End.
