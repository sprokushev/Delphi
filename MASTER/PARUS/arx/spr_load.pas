Unit spr_load;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, DB, Oracle, StdCtrls, Buttons, Mask, ToolEdit, ActnList,
  XPStyleActnCtrls, ActnMan;

Type
  Tfrm1cSpr = Class(TForm)
    edPath: TDirectoryEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    oraSPR: TOracleQuery;
    oraSesMain: TOracleSession;
    adoMain: TADOConnection;
    adoDS: TADODataSet;
    ActionManager1: TActionManager;
    acRS: TAction;
    acContr: TAction;
    acNomen: TAction;
    Label1: TLabel;
    acPBE: TAction;
    acStore: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Procedure acRSExecute(Sender: TObject);
    Procedure acContrExecute(Sender: TObject);
    Procedure acNomenExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acPBEExecute(Sender: TObject);
    Procedure acStoreExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frm1cSpr                              : Tfrm1cSpr;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure Tfrm1cSpr.acRSExecute(Sender: TObject);
Var
  temp_id                               : String;
Begin
  If adoMain.Connected Then
    adoMain.Connected := false;
  adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
  adoMain.Connected := true;
  adoDS.CommandText := 'select * from sc1564';
  adods.Open;
  adoDS.First;
  While Not adoDS.Eof Do
    Begin
      oraSPR.Clear;
      temp_id := trim(adods.fieldbyname('id').AsString);
      oraSPR.SQL.Add('select * from RUI_ARX_RS where RS_ID=''' + temp_id + '''');
      oraSPR.Execute;
      If oraSPR.RowCount < 1 Then
        Begin
          oraSPR.Clear;
          oraSPR.SQL.Add('INSERT INTO RUI_ARX_RS (RS_ID, RS_ABBR, RS_RS,RS_NAME, RS_KS, RS_BIK) VALUES (');
          oraSPR.SQL.Add('''' + temp_id + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('descr').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp1571').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp1572').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp1574').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp1575').AsString) + ''')');
          oraSPR.Execute;
          Oraspr.Session.Commit;
          //     oraSpr.Close;
          adoDS.Next;
        End;
    End;
  adoDS.Close;
  adoMain.Connected := false;

End;

Procedure Tfrm1cSpr.acContrExecute(Sender: TObject);
Var
  temp_id                               : String;
Begin
  If adoMain.Connected Then
    adoMain.Connected := false;
  adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
  adoMain.Connected := true;
  adoDS.CommandText := 'select * from sc488';
  adods.Open;
  adoDS.First;
  While Not adoDS.Eof Do
    Begin
      oraSPR.Clear;
      temp_id := trim(adods.fieldbyname('id').AsString);
      oraSPR.SQL.Add('select * from RUI_ARX_AGN where agn_id=''' + temp_id + '''');
      oraSPR.Execute;
      If oraSPR.RowCount < 1 Then
        Begin
          oraSPR.Clear;
          oraSPR.SQL.Add('INSERT INTO RUI_ARX_AGN (AGN_ID, AGN_ABBR, AGN_NAME, AGN_POST, AGN_INN, AGN_KPP) VALUES (');
          oraSPR.SQL.Add('''' + temp_id + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('descr').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp490').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp491').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp494').AsString) + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('sp17755').AsString) + ''')');
          oraSPR.Execute;
          Oraspr.Session.Commit;
          //     oraSpr.Close;
        End;
      adoDS.Next;
    End;
  adoDS.Close;
  adoMain.Connected := false;
End;

Procedure Tfrm1cSpr.acNomenExecute(Sender: TObject);
Var
  s, s1                                 : String;
  i                                     : integer;
  temp_id                               : String;
Begin
  If adoMain.Connected Then
    adoMain.Connected := false;
  adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
  adoMain.Connected := true;
  adoDS.CommandText := 'select * from sc656';
  adods.Open;
  adoDS.First;
  While Not adoDS.Eof Do
    Begin
      oraSPR.Clear;
      temp_id := trim(adods.fieldbyname('id').AsString);
      oraSPR.SQL.Add('select * from RUI_ARX_DICNOMN where NOMN_ID=''' + temp_id + '''');
      oraSPR.Execute;
      If oraSPR.RowCount < 1 Then
        Begin
          s1 := '';
          s := adods.fieldbyname('descr').AsString;
          For i := 1 To length(s) Do
            If s[i] <> '''' Then
              s1 := s1 + s[i]
            Else
              s1 := s1 + '"';
          oraSPR.Clear;
          oraSPR.SQL.Add('INSERT INTO RUI_ARX_DICNOMN (NOMN_ID, NOMN_ABBR) VALUES (');
          oraSPR.SQL.Add('''' + temp_id + ''',');
          oraSPR.SQL.Add('''' + trim(s1) + ''')');
          oraSPR.Execute;
          Oraspr.Session.Commit;
          //     oraSpr.Close;
          adoDS.Next;
        End;
    End;
  adoDS.Close;
  adoMain.Connected := false;
End;

Procedure Tfrm1cSpr.FormCreate(Sender: TObject);
Begin
  oraSesMain.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraSesMain.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraSesMain.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraSesMain.Connected := true;
End;

Procedure Tfrm1cSpr.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraSesMain.Connected := false;
  action := caFree;
End;

Procedure Tfrm1cSpr.acPBEExecute(Sender: TObject);
Var
  temp_id                               : String;
Begin
  If adoMain.Connected Then
    adoMain.Connected := false;
  adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
  adoMain.Connected := true;
  adoDS.CommandText := 'select * from sc792';
  adods.Open;
  adoDS.First;
  While Not adoDS.Eof Do
    Begin
      oraSPR.Clear;
      temp_id := trim(adods.fieldbyname('id').AsString);
      oraSPR.SQL.Add('select * from RUI_ARX_PBE where PBE_ID=''' + temp_id + '''');
      oraSPR.Execute;
      If oraSPR.RowCount < 1 Then
        Begin
          oraSPR.Clear;
          oraSPR.SQL.Add('INSERT INTO RUI_ARX_PBE (PBE_ID, PBE_NAME) VALUES (');
          oraSPR.SQL.Add('''' + temp_id + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('descr').AsString) + ''')');
          oraSPR.Execute;
          Oraspr.Session.Commit;
          //     oraSpr.Close;
        End;
      adoDS.Next;
    End;
  adoDS.Close;
  adoMain.Connected := false;
End;

Procedure Tfrm1cSpr.acStoreExecute(Sender: TObject);
Var
  temp_id                               : String;
Begin
  If adoMain.Connected Then
    adoMain.Connected := false;
  adoMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
  adoMain.Connected := true;
  adoDS.CommandText := 'select * from sc430';
  adods.Open;
  adoDS.First;
  While Not adoDS.Eof Do
    Begin
      oraSPR.Clear;
      temp_id := trim(adods.fieldbyname('id').AsString);
      oraSPR.SQL.Add('select * from RUI_ARX_STORE where STORE_ID=''' + temp_id + '''');
      oraSPR.Execute;
      If oraSPR.RowCount < 1 Then
        Begin
          oraSPR.Clear;
          oraSPR.SQL.Add('INSERT INTO RUI_ARX_STORE (STORE_ID, STORE_NAME) VALUES (');
          oraSPR.SQL.Add('''' + temp_id + ''',');
          oraSPR.SQL.Add('''' + trim(adods.fieldbyname('descr').AsString) + ''')');
          oraSPR.Execute;
          Oraspr.Session.Commit;
          //     oraSpr.Close;
        End;
      adoDS.Next;
    End;
  adoDS.Close;
  adoMain.Connected := false;
End;

End.
