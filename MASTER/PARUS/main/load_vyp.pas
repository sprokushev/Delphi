Unit load_vyp;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, XPStyleActnCtrls, ActnMan, Oracle, DB, ComCtrls,
  vgCtrls, vgDBTree, OracleData, Grids, DBGridEh, StdCtrls, Buttons;

Type
  Tfrm1cVypPar = Class(TForm)
    oraCB: TOracleDataSet;
    oraSesMain: TOracleSession;
    tvCatalog: TvgDBTreeView;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    oraInsert: TOracleQuery;
    oraNextNumb: TOracleQuery;
    ActionManager1: TActionManager;
    acVyp2Par: TAction;
    oraQ: TOracleQuery;
    DBGridEh1: TDBGridEh;
    dsCB: TDataSource;
    acReload: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Procedure acVyp2ParExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acReloadExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frm1cVypPar                           : Tfrm1cVypPar;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure Tfrm1cVypPar.acVyp2ParExecute(Sender: TObject);
Var
  rn                                    : integer;
  docnumb, d1                           : String[255];
  rn_crn                                : String;
  ss                                    : ^TOracleDataSet;
Begin
  ss := @oraCB;
  tvCatalog.UpdateCursorPos;
  rn_crn := tvCatalog.FieldID.AsString;
  //q1.clear;
  ss^.Open;
  ss^.First;
  //WriteEvent(DateTimeToStr(Now)+': Загрузка данных в Парус.',45);
  //pbStatus.Visible:=true;
  //pbStatus.Min:=0;
  //pbStatus.Max:=ss^.RecordCount;
  While Not ss^.Eof Do
    Begin
      With oraInsert Do
        Begin
          ClearVariables;
          SetVariable('ncompany', 2);
          SetVariable('nCRN', StrToInt(rn_crn));
          SetVariable('sBANK_TYPEDOC', 'П/П');
          SetVariable('sBANK_PREFDOC', trim(ss^.Fieldbyname('bank_docnumb').asString) + '.');
          //Получаем номер документа из Паруса
          oraNextNumb.SetVariable('company', 2);
          oraNextNumb.SetVariable('pref', trim(ss^.Fieldbyname('bank_docnumb').asString) + '.');
          oraNextNumb.SetVariable('doctype', 'П/П');
          oraNextNumb.Execute;
          docNumb := oraNextNumb.GetVariable('snumb');
          SetVariable('sBANK_NUMBDOC', docnumb);
          If ss^.Fieldbyname('vid').asInteger = -1 Then
            Begin
              //расход
              SetVariable('sTYPE_OPER', 'БЕЗНАЛ');
              SetVariable('sAGENT_FROM', ss^.Fieldbyname('own_agn').asString);
              SetVariable('sAGENTF_ACC', ss^.Fieldbyname('own_acc').asString);
              SetVariable('sAGENT_TO', ss^.Fieldbyname('agent').asString);
              SetVariable('sAGENTT_ACC', ss^.Fieldbyname('acc').asString);
            End
          Else
            Begin
              SetVariable('sTYPE_OPER', 'БЕЗНАЛПОСТ');
              SetVariable('sAGENT_FROM', ss^.Fieldbyname('agent').asString);
              SetVariable('sAGENTF_ACC', ss^.Fieldbyname('acc').asString);
              SetVariable('sAGENT_TO', ss^.Fieldbyname('own_agn').asString);
              SetVariable('sAGENTT_ACC', ss^.Fieldbyname('own_acc').asString);
            End;
          SetVariable('dBANK_DATEDOC', FormatDateTime('dd.mm.yyyy', ss^.Fieldbyname('bank_docdate').AsDateTime));
          SetVariable('sBUNIT_MNEMO', 'ЦА_СНП');
          SetVariable('dPAY_DATA', FormatDateTime('dd.mm.yyyy', ss^.Fieldbyname('pay_data').AsDateTime));
          SetVariable('spay_info', ss^.Fieldbyname('pay_info').asString);
          SetVariable('nPAY_SUM', ss^.Fieldbyname('pay_sum').asFloat);
          SetVariable('nTAX_SUM', 0);
          SetVariable('nPERCENT_TAX_SUM', 0);
          SetVariable('sCURRENCY', 'Руб.');
          SetVariable('sJUR_PERS', 'СЕВЕРНЕФТЕПРОДУКТ');
        End;
      Try
        Begin
          oraInsert.Execute;
          rn := oraInsert.GetVariable('nrn');
          //    WriteEvent(DateTimeToStr(Now)+': Добавлена запись в Парус №'+inttostr(rn)+'.',3);
          oraq.SQL.Clear;
          oraq.SQL.add('update rui_vypiska set');
          oraq.SQL.add('parus_rn_vyp=''' + inttostr(rn) + '''');
          oraq.SQL.add('where rowid=chartorowid(' + '''' + ss^.Fieldbyname('rid').asString + ''')');
          oraq.Execute;
          oraq.SQL.Clear;
          oraq.Session.Commit;
          oraInsert.Session.Commit;
      End Except
        On E: EOracleError Do
          ShowMessage(E.Message);
      End;
      //  pbstatus.Position:=ss^.RecNo;
      ss^.Next;
    End;
  //pbStatus.Visible:=false;
  //acFilterExecute(self);
  //oradscb.Commit;
End;

Procedure Tfrm1cVypPar.FormCreate(Sender: TObject);
Begin
  oraSesMain.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraSesMain.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraSesMain.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraSesMain.Connected := true;
  oraCatalog.Open;
  oraCB.Open;
End;

Procedure Tfrm1cVypPar.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraSesMain.Connected := false;
  action := caFree;
End;

Procedure Tfrm1cVypPar.acReloadExecute(Sender: TObject);
Begin
  If oraCB.Active Then
    oraCB.Close;
  oracb.Session.Commit;
  oracb.Open;
End;

End.
