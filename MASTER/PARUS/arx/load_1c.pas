Unit load_1c;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, strutils, StdCtrls, Buttons, ComCtrls, Mask, ToolEdit, Oracle,
  ADODB, DB, XPStyleActnCtrls, ActnList, ActnMan, Grids, DBGridEh,
  OracleData;

Type
  Tfrm1cLoad = Class(TForm)
    fd: TFilenameEdit;
    re: TRichEdit;
    BitBtn1: TBitBtn;
    oraSesMain: TOracleSession;
    oraVyp: TOracleQuery;
    BitBtn2: TBitBtn;
    ActionManager1: TActionManager;
    acRead: TAction;
    acVypLoad: TAction;
    oraQ: TOracleQuery;
    acTTN: TAction;
    oraTTN: TOracleQuery;
    BitBtn3: TBitBtn;
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormCreate(Sender: TObject);
    Procedure acReadExecute(Sender: TObject);
    Procedure acVypLoadExecute(Sender: TObject);
    Procedure acTTNExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frm1cLoad                             : Tfrm1cLoad;

Implementation

Uses MAIN;

{$R *.dfm}

Function NPos(Const C: String; S: String; N: Integer): Integer;
Var
  I, P, K                               : Integer;
Begin
  Result := 0;
  K := 0;
  For I := 1 To N Do
    Begin
      P := Pos(C, S);
      Inc(K, P);
      If (I = N) And (P > 0) Then
        Begin
          Result := K;
          Exit;
        End;
      If P > 0 Then
        Delete(S, 1, P)
      Else
        Exit;
    End;
End;

Function GetVal(st: String): String;
Var
  stemp                                 : String;
  i                                     : integer;
Begin
  stemp := '';
  For i := npos('|', st, 2) + 1 To npos('|', st, 3) - 1 Do
    sTemp := sTemp + st[i];
  GetVal := trim(stemp);
End;

Function GetNum(st: String): String;
Var
  s1                                    : String;
  j                                     : integer;
Begin
  s1 := '';
  For j := npos('"', st, 3) + 1 To npos('"', st, 4) - 1 Do
    s1 := s1 + st[j];
  getnum := s1;
End;

Function GetID(st: String): String;
Var
  s1                                    : String;
  j                                     : integer;
Begin
  s1 := '';
  For j := npos('"', st, 13) + 1 To npos('"', st, 14) - 1 Do
    s1 := s1 + st[j];
  getId := trim(s1);
End;

Function S2D(st: String): String;
Var
  s1, sdat                              : String;
  k                                     : integer;
Begin
  s1 := '';
  For k := 7 To 8 Do
    s1 := s1 + st[k];
  sdat := s1 + '.';
  s1 := '';
  For k := 5 To 6 Do
    s1 := s1 + st[k];
  sdat := sdat + s1 + '.';
  sdat := sdat + leftStr(st, 4);
  s2d := sdat;
End;

Procedure Tfrm1cLoad.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraSesMain.Connected := false;
  action := caFree;
End;

Procedure Tfrm1cLoad.FormCreate(Sender: TObject);
Begin
  oraSesMain.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraSesMain.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraSesMain.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraSesMain.Connected := true;

End;

Procedure Tfrm1cLoad.acReadExecute(Sender: TObject);
Var
  i                                     : Integer;
  s1, s2                                : AnsiString;
  t                                     : TStrings;
Begin
  If trim(fd.FileName) = '' Then
    fd.DoClick; //Если не выбрано имя файла открываем диалог
  If trim(fd.FileName) <> '' Then //Если не выбрано имя файла ничего не делаем
    If FileExists(fd.FileName) Then
      Begin
        //    WriteEvent(DateTimeToStr(Now)+': Открыли файл '+fd.FileName+'.',18);
        t := TStringList.Create;
        t.LoadFromFile(fd.FileName);
        re.lines := t;
        t.Destroy;
      End;
  //  DeleteFile(fd.FileName);
  //  WriteEvent(DateTimeToStr(Now)+': Прочитано '+trim(inttostr(i))+' строк.',26);
  //  WriteEvent(DateTimeToStr(Now)+': Файл '+fd.FileName+' удален!',2);
End;

Procedure Tfrm1cLoad.acVypLoadExecute(Sender: TObject);
Var
  i, j, k                               : integer;
  s1, s2                                : String;
  sDat                                  : String;
  sNum, temp_id                         : String;
  sAcc, sOp, sSum, sRem                 : String;
  sSc1, sSc2, sSc3                      : String;
Begin
  i := 0;
  {   oraSPR.Clear;
     temp_id:=trim(adods.fieldbyname('id').AsString);
     oraSPR.SQL.Add('select * from RUI_ARX_RS where RS_ID='''+temp_id+'''');
     oraSPR.Execute;
     if oraSPR.RowCount<1 then
     begin   }
  While (re.lines[i] <> '{КонецДокумента}') And (i < re.Lines.Count - 1) Do
    Begin
      temp_id := GetID(trim(re.Lines[i + 2]));
      sDat := S2D(RightStr(trim(re.Lines[i + 3]), 8));
      sNum := GetNum(trim(re.Lines[i + 4]));
      sAcc := GetVal(trim(re.Lines[i + 10]));
      j := i + 24;
      While (re.Lines[j] <> '{КонецДокумента}') And (j < re.Lines.Count - 1) Do
        Begin
          sOp := Getval(trim(re.Lines[j + 2]));
          sSum := GetVal(trim(re.Lines[j + 3]));
          If sSum = '0' Then
            Begin
              sSum := sOp;
              sOp := '1';
            End
          Else
            sOp := '-1';
          sRem := getval(trim(re.Lines[j + 4]));
          sSc1 := GetVal(trim(re.Lines[j + 6]));
          sSc2 := GetVal(trim(re.Lines[j + 7]));
          sSc3 := GetVal(trim(re.Lines[j + 8]));
          j := j + 12;
          oraVyp.ClearVariables;
          oraVyp.SetVariable(':date_vyp', strtoDate(sDat));
          oraVyp.SetVariable(':num_vyp', sNum);
          oraVyp.SetVariable(':acc_vyp', sAcc);
          oraVyp.SetVariable(':op_vyp', strToInt(sOp));
          oraVyp.SetVariable(':sum_vyp', strToFloat(sSum));
          oraVyp.SetVariable(':rem_vyp', sRem);
          oraVyp.SetVariable(':sc1', sSc1);
          oraVyp.SetVariable(':sc2', sSc2);
          oraVyp.SetVariable(':sc3', sSc3);
          oraVyp.SetVariable(':id_vyp', temp_id);
          oraVyp.execute;
          oraVyp.Session.Commit;
          //       oraVyp.Close;
        End;
      i := j + 1;
    End;
End;

Procedure Tfrm1cLoad.acTTNExecute(Sender: TObject);
Var
  i, j, k                               : integer;
  s1, s2                                : String;
  sDat                                  : String;
  sNum, temp_id                         : String;
  sSum                                  : String;
  sSc1, sSc2, sSc3                      : String;
  sPbe, sStore, sAgn, sFifo             : String;
Begin
  i := 0;
  While (re.lines[i] <> '{КонецДокумента}') And (i < re.Lines.Count - 1) Do
    Begin
      temp_id := GetID(trim(re.Lines[i + 2]));
      sDat := S2D(RightStr(trim(re.Lines[i + 3]), 8));
      sNum := GetNum(trim(re.Lines[i + 4]));
      sPbe := GetVal(trim(re.Lines[i + 11]));
      sStore := GetVal(trim(re.Lines[i + 14]));
      sAgn := GetVal(trim(re.Lines[i + 12]));
      sFifo := GetVal(trim(re.Lines[i + 21]));
      j := i + 35;
      While (re.Lines[j] <> '{КонецДокумента}') And (j < re.Lines.Count - 1) Do
        Begin
          oraTTN.ClearVariables;
          oraTTN.SetVariable(':ttn_date', strtoDate(sDat));
          oraTTN.SetVariable(':ttn_numb', sNum);
          oraTTN.SetVariable(':ttn_id', temp_id);
          oraTTN.SetVariable(':ttn_store', sstore);
          oraTTN.SetVariable(':ttn_pbe', spbe);
          oraTTN.SetVariable(':ttn_agn', sagn);
          oraTTN.SetVariable(':ttn_fifo', sfifo);
          oraTTN.SetVariable(':ttn_nomen', GetVal(trim(re.Lines[j + 1])));
          oraTTN.SetVariable(':ttn_ei', GetVal(trim(re.Lines[j + 2])));
          oraTTN.SetVariable(':ttn_quan', strtofloat(GetVal(trim(re.Lines[j + 3]))));
          oraTTN.SetVariable(':ttn_koef', strtofloat(GetVal(trim(re.Lines[j + 4]))));
          oraTTN.SetVariable(':ttn_price', strtofloat(GetVal(trim(re.Lines[j + 5]))));
          oraTTN.SetVariable(':ttn_sumwon', strtofloat(GetVal(trim(re.Lines[j + 6]))));
          oraTTN.SetVariable(':ttn_nds', strtofloat(GetVal(trim(re.Lines[j + 7]))));
          oraTTN.SetVariable(':ttn_sumwn', strtofloat(GetVal(trim(re.Lines[j + 9]))));
          oraTTN.execute;
          oraTTN.Session.Commit;
          j := j + 10;
          //       oraVyp.Close;
        End;
      i := j + 1;
    End;
End;

End.
