Unit sr_igma;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, Grids, DBGridEh, ExtCtrls, StdCtrls,
  Mask, ToolEdit, Buttons, ActnList, XPStyleActnCtrls, ActnMan, ADODB,
  dateutils, StrUtils, ComCtrls, ImgList, PropStorageEh,
  PropFilerEh, MemTableDataEh, DataDriverEh, MemTableEh, GridsEh;

Type
  TfrmSRigma = Class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgTTN17_cond: TDBGridEh;
    ActionManager1: TActionManager;
    acFilter: TAction;
    acLoad: TAction;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Splitter3: TSplitter;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    dsTTN: TDataSource;
    dsTTN17specs: TDataSource;
    Splitter1: TSplitter;
    dbgTTN17_new: TDBGridEh;
    oraInvIns: TOracleQuery;
    oraInvsIns: TOracleQuery;
    Splitter4: TSplitter;
    mLog: TMemo;
    tTTN: TADODataSet;
    tTTNspecs: TADODataSet;
    oraFind: TOracleQuery;
    adoMain: TADOConnection;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edPath: TDirectoryEdit;
    BitBtn1: TBitBtn;
    mteCatalog: TMemTableEh;
    mteCatalogRN: TFloatField;
    mteCatalogCRN: TFloatField;
    mteCatalogNAME: TStringField;
    dsdCatalog: TDataSetDriverEh;
    DBGridEh1: TDBGridEh;
    Procedure acFilterExecute(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure acLoadExecute(Sender: TObject);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure LoadParus(z: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  frmSRigma                             : TfrmSRigma;

Implementation

Uses MAIN;

{$R *.dfm}

Procedure TfrmSRigma.acFilterExecute(Sender: TObject);
Begin
  If edPath.Text <> '' Then
    Begin
      If tTTNspecs.Active Then
        tTTNspecs.Close;
      If tTTN.Active Then
        tTTN.Close;
      If adoMain.connected Then
        adoMain.connected := false;
      adoMain.ConnectionString := 'Provider=MSDASQL;Password="";Persist Security Info=True;Extended Properties="DSN=pf;UID=;PWD=;SourceDB=u:\luk\dbases;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoMain.connected := True;
      tTTN.CommandText := 'select * from "' + edPath.Text + '\am.dbf"';
      tTTN.Open;
      tTTNspecs.CommandText := 'select * from "' + edPath.Text + '\ams.dbf"';
      tTTNspecs.Open;
    End;
End;

Procedure TfrmSRigma.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraCatalog.Open;
  mteCatalog.TreeList.Active := True;
  mteCatalog.TreeList.KeyFieldName := 'RN';
  mteCatalog.TreeList.RefParentFieldName := 'CRN';
  mteCatalog.Open;
End;

Procedure TfrmSRigma.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  adoMain.Connected := False;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmSRigma.acLoadExecute(Sender: TObject);
Begin
  If adoMain.connected Then
    LoadParus(1);
End;

Procedure TfrmSRigma.LoadParus(z: integer);
Var
  rn_crn                                : String;
  rn_sved                               : String;
  ss, ss2                               : ^TOracleDataSet;
  ok                                    : boolean;
Begin
  If (edPath.Text <> '') And adoMain.connected Then
    Begin
      //таблицы открыты ?
      rn_crn := mtecatalog.fieldbyname('RN').asstring;
      ss := @tTTN;
      ss2 := @tTTNspecs;
      ss^.First;
      While Not ss^.Eof Do
        Begin
          ok := false;
          mlog.Lines.Add('Загрузка в Парус ' + trim(ss^.fieldbyname('sazs').AsString) + ' от ' + datetostr(ss^.fieldbyname('ddate').AsDateTime));
          oraFind.ClearVariables;
          oraFind.SetVariable(':sAZS', trim(ss^.fieldbyname('sazs').asString));
          oraFind.SetVariable(':sSMENA', trim(ss^.fieldbyname('sSmena').asString));
          oraFind.SetVariable(':dDATE', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dDATE').asDateTime));
          oraFind.SetVariable(':sPBE', 'ЦА_СНП');
          oraFind.Execute;
          If oraFind.Eof Then {был ли такой заголовок}
            Begin // нет не было
              oraInvIns.ClearVariables;
              oraInvIns.SetVariable(':nCOMPANY', 2);
              oraInvIns.SetVariable(':nCRN', rn_crn);
              oraInvIns.SetVariable(':sAZS_NUMBER', trim(ss^.fieldbyname('sazs').asString));
              oraInvIns.SetVariable(':sAZS_SMENA', trim(ss^.fieldbyname('sSmena').asString));
              oraInvIns.SetVariable(':dDATE_SMENA', FormatDateTime('dd.mm.yyyy', ss^.fieldbyname('dDATE').asDateTime));
              oraInvIns.SetVariable(':sAZS_PBE', 'ЦА_СНП');
              oraInvIns.SetVariable(':nCHECKED', 0);
              Try
                Begin
                  oraInvIns.Execute;
                  ok := true;
                  rn_sved := oraInvIns.getVariable(':nRN');
                  mlog.Lines.Add('Заголовок загружен успешно!');
                End
              Except On E: EOracleError Do
                  ShowMessage(E.Message);
              End
            End
          Else
            Begin
              //был уже такой заголовок
              rn_sved := oraFind.FieldAsString('nRN');
              ok := true;
            End;
          oraFind.Close;
          // Спецификация
          If ok Then
            Begin //заголовок есть?
              ss2^.First; // грузим  спецификацию
              While Not ss2^.Eof Do
                Begin
                  oraInvsIns.ClearVariables;
                  oraInvsIns.SetVariable(':nCOMPANY', 2);
                  oraInvsIns.SetVariable(':nPRN', rn_sved);
                  oraInvsIns.SetVariable(':sTIME', trim(ss2^.fieldbyname('sTime').asString));
                  // По пожеланиям трудящихся меняем ДЗУ и ДЛУ на ДИЗТОП
                  If (trim(ss2^.fieldbyname('sNOMEN').asString) = 'ДЗУ') Or (trim(ss2^.fieldbyname('sNOMEN').asString) = 'ДЛУ') Then
                    oraInvsIns.SetVariable(':sNOMEN', 'ДИЗТОП')
                  Else
                    oraInvsIns.SetVariable(':sNOMEN', trim(ss2^.fieldbyname('sNOMEN').asString));
                  oraInvsIns.SetVariable(':sOUTTYPE', trim(ss2^.fieldbyname('sOUTTYPE').asString));
                  oraInvsIns.SetVariable(':sPAYTYPE', trim(ss2^.fieldbyname('sPAYTYPE').asString));
                  oraInvsIns.SetVariable(':sSHIPTYPE', trim(ss2^.fieldbyname('sSHIPTYPE').asString));
                  oraInvsIns.SetVariable(':sMUNIT', 'л.');
                  oraInvsIns.SetVariable(':sFACEACC', trim(ss2^.fieldbyname('sFACEACC').asString));
                  oraInvsIns.SetVariable(':nPRICE', trim(floatToStr(ss2^.fieldbyname('nprice').asFloat)));
                  oraInvsIns.SetVariable(':nSUMM', trim(floatToStr(ss2^.fieldbyname('nprice').asFloat * ss2^.fieldbyname('nprihl').asFloat)));
                  If ss2^.fieldbyname('nprihp').asFloat = 0 Then
                    oraInvsIns.SetVariable(':nPL', trim(floatToStr(ss2^.fieldbyname('nprihl').asFloat / ss2^.fieldbyname('nprihk').asFloat)))
                  Else
                    oraInvsIns.SetVariable(':nPL', trim(floatToStr(ss2^.fieldbyname('nprihp').asFloat)));
                  oraInvsIns.SetVariable(':nVolume', trim(floatToStr(ss2^.fieldbyname('nprihl').asFloat)));
                  oraInvsIns.SetVariable(':nMassa', trim(floatToStr(ss2^.fieldbyname('nprihk').asFloat)));
                  Try
                    Begin
                      oraInvsIns.Execute;
                      mlog.Lines.Add('Загружен расход: ' + trim(ss2^.fieldbyname('sFACEACC').asString) + '; ' + trim(ss2^.fieldbyname('sNOMEN').asString) + '; ' + trim(floatToStr(ss2^.fieldbyname('nprice').asFloat * ss2^.fieldbyname('nprihl').asFloat)) + '.');
                    End
                  Except On E: EOracleError Do
                      ShowMessage(E.Message);
                  End;
                  ss2^.Next;
                End;
            End;
          ss^.Next;
        End;
      oraInvIns.Session.Commit;
    End
  Else
    ShowMessage('Не верно задан путь или не открыты таблицы обмена!');
End;

Procedure TfrmSRigma.tvCatalogGetImageIndex(Sender: TObject;
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

