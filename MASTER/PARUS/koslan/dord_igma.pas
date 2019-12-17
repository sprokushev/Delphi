Unit dord_igma;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, OracleData, Oracle, StdCtrls, ExtCtrls, Mask, ToolEdit,
  Buttons, Grids, DBGridEh, ActnList,XPStyleActnCtrls, ActnMan, ADODB, StrUtils,
  DateUtils, PropStorageEh, QExport3, QExport3DBF,PropFilerEh, MemTableDataEh, DataDriverEh, MemTableEh,
  GridsEh;

Type
  TfrmIgmaDord = Class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    deBeg: TDateEdit;
    deEnd: TDateEdit;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    mLog: TMemo;
    oraParus: TOracleSession;
    oraCatalog: TOracleDataSet;
    dsCatalog: TDataSource;
    Panel2: TPanel;
    Splitter2: TSplitter;
    grCord: TDBGridEh;
    grCords: TDBGridEh;
    Splitter3: TSplitter;
    oraCord: TOracleDataSet;
    oraCords: TOracleDataSet;
    dsCord: TDataSource;
    dsCords: TDataSource;
    ActionManager1: TActionManager;
    acFilter: TAction;
    edPath: TDirectoryEdit;
    adoCordIns: TADOQuery;
    adoCordsIns: TADOQuery;
    acLoad: TAction;
    adoConn: TADOConnection;
    oraMove: TOracleQuery;
    Label1: TLabel;
    oraAgnFiFo: TOracleDataSet;
    oraAgnFaceAcc: TOracleDataSet;
    BitBtn3: TBitBtn;
    acSpr: TAction;
    acSend: TAction;
    PropStorageEh1: TPropStorageEh;
    RegPropStorageManEh1: TRegPropStorageManEh;
    GroupBox2: TGroupBox;
    cbRec: TComboBox;
    BitBtn4: TBitBtn;
    oraNomen: TOracleDataSet;
    ex: TQExport3DBF;
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
    Procedure unLoad();
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure tvCatalogGetImageIndex(Sender: TObject; Node: TTreeNode);
    Procedure acLoadExecute(Sender: TObject);
    Function DateToStr(d1: TDateTime): String;
    Procedure acSprExecute(Sender: TObject);
    Procedure acSendExecute(Sender: TObject);
    procedure mteCatalogAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    NewCatalog: integer;
    { Public declarations }
  End;

Var
  frmIgmaDord                           : TfrmIgmaDord;

Implementation

Uses MAIN;

{$R *.dfm}

Function TfrmIgmaDord.DateToStr(d1: TDateTime): String;
Var
  st, st2                               : String;
Begin
  If d1 <> 0 Then
    Begin
      st := IntToStr(monthof(d1));
      If length(trim(st)) = 1 Then
        st := '0' + trim(st)
      Else
        st := trim(st);
      st2 := st;
      st := IntToStr(Dayof(d1));
      If length(trim(st)) = 1 Then
        st := '0' + trim(st)
      Else
        st := trim(st);
      st2 := st2 + '/' + st;
      st2 := st2 + '/' + rightStr(trim(inttostr(yearOf(d1))), 2);
      DateToStr := st2;
    End
  Else
    DateToStr := ' / / '
End;

Procedure TfrmIgmaDord.acFilterExecute(Sender: TObject);
Begin
  If oraCords.Active Then
    oraCords.Close;
  If oraCord.Active Then
    oraCord.Close;
  oraCord.SQL[13] := 'and v.DDOCDATE between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[14] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  if bitbtn2.Enabled then
  oraCord.SQL[15] := 'and v.nstatus=1'
  else oraCord.SQL[15] := '';
  oraCord.SQL[16] := 'and v.ncrn=' + mtecatalog.fieldbyname('RN').asstring;
  oraCord.Open;
  oraCords.Open;
  If edPath.Text <> '' Then
    Begin
      If adoConn.Connected Then
        adoConn.Connected := false;
      adoConn.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Extended Properties="DSN=pf;UID=;SourceDB=' + edPath.Text + ';SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';
      adoConn.Connected := true;
    End;
End;

Procedure TfrmIgmaDord.FormCreate(Sender: TObject);
Begin
  oraParus.LogonUsername := frmMain.oraParusMain.LogonUsername;
  oraParus.LogonPassword := frmMain.oraParusMain.LogonPassword;
  oraParus.LogonDatabase := frmMain.oraParusMain.LogonDatabase;
  oraParus.Connected := true;
  oraCatalog.Open;
  mteCatalog.Open;
  oraCord.SQL[13] := 'and v.DDOCDATE between TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deBeg.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[14] := 'and TO_DATE(''' + FormatDateTime('dd.mm.yyyy', deEnd.Date) + ''',''dd.mm.yyyy'')';
  oraCord.SQL[15] := 'and v.nstatus=1';
  oraCord.Open;
  oraCords.Open;
End;

Procedure TfrmIgmaDord.UnLoad();
Var
  Src, Dst                              : String[255];
Begin
  Src := edPath.Text + '\d.dbf' + #0;
  Dst := edPath.Text + '\depord.dbf' + #0;
  CopyFile(@Src[1], @Dst[1], False);
  Src := edPath.Text + '\ds.dbf' + #0;
  Dst := edPath.Text + '\depords.dbf' + #0;
  CopyFile(@Src[1], @Dst[1], False);
  oraCord.First;
  While Not oraCord.Eof Do
    Begin
      adoCordIns.SQL.Clear;
      adoCordIns.SQL.Add('insert into depord (NRN,Sord_DOCTY,Sord_PREF,Sord_NUMB,SAGENT,SFACEACC,GRPoiNT,');
      adoCordIns.SQL.Add('Dord_DATE,Nord_STATe,dstate_dat,SCURRENCY,SSTORE,ssubdiv,drelease_d,nord_perio,');
      //      adoCordIns.SQL.Add('scndtype,scndpref,scndnumb,dcnddate,Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
         //  adoCordIns.SQL.Add('Dord_DATE,Nord_STATe,dstate_dat,sdisp_type,spay_type,starif,');
      //			adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,dpay_date,drelease_d,dprice_dat,nord_perio,');
      //			adoCordIns.SQL.Add('');
         //  adoCordIns.SQL.Add('SCURRENCY,SSTORE,sacc_agent,ssubdiv,nord_perio,');
      adoCordIns.SQL.Add('nperiod_co,nperiod_qu,nperiod_ty,nperiod_le,natsametim,nemergord,snote,npsumm,');
      adoCordIns.SQL.Add('SACC_AGENT,SACC_SUBDI,SFINACCCNT,SFINARTCL,SPLAN_PERI)');
      //			adoCordIns.SQL.Add('sagnfi,npsumwotax,npsumwtax,sjur_pers)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_DOCTY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_PREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_NUMB').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SAGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('GRPoiNT').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_doctype').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_docpref').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCON_DOCNUMB').AsString + '",');
         //  adoCordIns.SQL.Add('ctod("'+DateToStr(oraCord.fieldbyname('dcon_docdate').AsDateTime)+'"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_state').AsString + ',');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dstate_dat').AsDateTime) + '"),');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sdisp_type').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('spay_type').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('starif').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCURRENCY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sacc_agent').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('ssubdiv').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_period').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_corr').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_quant').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_type').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_len').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('natsametime').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nemergord').AsString + ',');
      //			adoCordIns.SQL.Add(oraCord.fieldbyname('nprice_type').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('snote').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sagnfi').AsString + '",');
      //			adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwotax').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nsumm').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SACC_AGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SACC_SUBDI').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFINACCCNT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFINARTCL').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPLAN_PERI').AsString + '")');
      //      adoCordIns.SQL.SaveToFile('d:\1.txt');
      adoCordIns.ExecSQL;
      mlog.Lines.Add('Экспорт заявки №' + trim(oraCord.fieldbyname('Sord_PREF').AsString) + '-' + trim(oraCord.fieldbyname('Sord_numb').AsString) + ' от ' + SysUtils.datetostr(oraCord.fieldbyname('dord_date').AsDateTime));
      mlog.Lines.Add('Для склада ' + trim(oraCord.fieldbyname('SFINACCCNT').AsString) + '.');
      oraCords.First;
      While Not oraCords.Eof Do
        Begin
          adoCordsIns.SQL.Clear;
          adoCordsIns.SQL.Add('insert into depords (NRN,nprn,snomen,snom_pack,snom_modif,snommod_pa,sproduct,');
          adoCordsIns.SQL.Add('nexp_price,nmax_price,nmin_price,npr_meas,sstore,SFINACCCNT,SFINARTCLS,snote,dactpf_dat,');
          adoCordsIns.SQL.Add('nactm_quan,nacta_quan,nactsumm)');
          adoCordsIns.SQL.Add('values (');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nrn').asInteger) + ',');
          adoCordsIns.SQL.Add(IntToStr(oraCords.fieldbyname('nprn').asInteger) + ',');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snomen').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snom_pack').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snom_modif').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snommod_pack').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('sproduct').AsString + '",');
          //          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('stax_group').AsString + '",');
					If oraCords.fieldbyname('npr_meas').AsInteger = 2 Then //цена для фасовки
						Begin
							adoCordsIns.SQL.Add(floattostr(oraCords.fieldbyname('nexp_price').AsFloat / oraCords.fieldbyname('ninpack').AsFloat / oraCords.fieldbyname('nequal').AsFloat) + ',');
							adoCordsIns.SQL.Add(floattostr(oraCords.fieldbyname('ninpack').AsFloat)+ ',');
							adoCordsIns.SQL.Add(floattostr(oraCords.fieldbyname('nexp_price').AsFloat / oraCords.fieldbyname('ninpack').AsFloat / oraCords.fieldbyname('nequal').AsFloat) + ',');
						End
					Else // цена для налива
						Begin
							adoCordsIns.SQL.Add(oraCords.fieldbyname('nexp_price').AsString + ',');
							adoCordsIns.SQL.Add(floattostr(oraCords.fieldbyname('ninpack').AsFloat) + ',');
							adoCordsIns.SQL.Add(oraCords.fieldbyname('nexp_price').AsString + ',');
            End;
          adoCordsIns.SQL.Add(oraCords.fieldbyname('npr_meas').AsString + ',');
          adoCordsIns.SQL.Add('"' + oraCord.fieldbyname('sstore').AsString + '",');
          //					If oraCords.fieldbyname('npr_meas').AsInteger = 2 Then // для фасовки
          //						adoCordsIns.SQL.Add(oraCords.fieldbyname('ninpack').AsString + ',')
          //          Else //  для налива
          //            adoCordsIns.SQL.Add('0,');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SFINACCCNT').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('SFINARTCLS').AsString + '",');
          adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('snote').AsString + '",');
          //					adoCordsIns.SQL.Add('"' + oraCords.fieldbyname('sname').AsString + '",');
          //					adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dbegin_date').AsDateTime) + '"),');
          //          adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dend_date').AsDateTime) + '"),');
          adoCordsIns.SQL.Add('ctod("' + DateToStr(oraCords.fieldbyname('dactpf_dat').AsDateTime) + '"),');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nactm_quan').AsString + ',');
          adoCordsIns.SQL.Add(oraCords.fieldbyname('nacta_quan').AsString + ',');
          //					adoCordsIns.SQL.Add(oraCords.fieldbyname('nactwtax').AsString + ',');
					adoCordsIns.SQL.Add(oraCords.fieldbyname('nactsumm').AsString + ')');
//						 adoCordsIns.SQL.SaveToFile('d:\11.txt');
          adoCordsIns.ExecSQL;
          mlog.Lines.Add('Продукт: ' + trim(oraCords.fieldbyname('snom_modif').AsString) + '; вес: ' + trim(oraCords.fieldbyname('nactm_quan').AsString) + ' л.');
          oraCords.Next;
        End; //while cords.eof
      oraMove.ClearVariables;
      oraMove.SetVariable(':nCompany', 2);
      oraMove.SetVariable(':nRn', oraCord.fieldbyname('nrn').asInteger);
      oraMove.SetVariable(':nCRN', NewCatalog);
      oraMove.Execute;
      oraCord.Next;
      mlog.Lines.Add('Заявка экспортирована!');
    End; //while cord.eof
  oracord.Session.Commit;
  //Выгрузка закрытых
  oraCords.Close;
  oraCord.Close;
  oraCord.SQL[15] := 'and v.nstatus=2';
  oraCord.SQL[16] := 'and v.ncrn=' + inttostr(NewCatalog);
  oraCord.Open;
  oraCords.Open;
  oraCord.First;
  While Not oraCord.Eof Do
    Begin
      adoCordIns.SQL.Clear;
      adoCordIns.SQL.Add('insert into depord (NRN,Sord_DOCTY,Sord_PREF,Sord_NUMB,SAGENT,SFACEACC,GRPoiNT,');
      adoCordIns.SQL.Add('Dord_DATE,Nord_STATe,dstate_dat,SCURRENCY,SSTORE,ssubdiv,drelease_d,nord_perio,');
      adoCordIns.SQL.Add('nperiod_co,nperiod_qu,nperiod_ty,nperiod_le,natsametim,nemergord,snote,npsumm,');
      adoCordIns.SQL.Add('SACC_AGENT,SACC_SUBDI,SFINACCCNT,SFINARTCL,SPLAN_PERI)');
      adoCordIns.SQL.Add('values (');
      adoCordIns.SQL.Add(IntToStr(oraCord.fieldbyname('nrn').asInteger) + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_DOCTY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_PREF').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('Sord_NUMB').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SAGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFACEACC').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('GRPoiNT').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_doctype').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('scon_docpref').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCON_DOCNUMB').AsString + '",');
         //  adoCordIns.SQL.Add('ctod("'+DateToStr(oraCord.fieldbyname('dcon_docdate').AsDateTime)+'"),');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_state').AsString + ',');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dstate_dat').AsDateTime) + '"),');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sdisp_type').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('spay_type').AsString + '",');
      //      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('starif').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SCURRENCY').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SSTORE').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sacc_agent').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('ssubdiv').AsString + '",');
      adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      //			adoCordIns.SQL.Add('ctod("' + DateToStr(oraCord.fieldbyname('dord_date').AsDateTime) + '"),');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nord_period').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_corr').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_quant').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_type').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nperiod_len').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('natsametime').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nemergord').AsString + ',');
      //			adoCordIns.SQL.Add(oraCord.fieldbyname('nprice_type').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('snote').AsString + '",');
      //			adoCordIns.SQL.Add('"' + oraCord.fieldbyname('sagnfi').AsString + '",');
      //			adoCordIns.SQL.Add(oraCord.fieldbyname('npsumwotax').AsString + ',');
      adoCordIns.SQL.Add(oraCord.fieldbyname('nsumm').AsString + ',');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SACC_AGENT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SACC_SUBDI').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFINACCCNT').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SFINARTCL').AsString + '",');
      adoCordIns.SQL.Add('"' + oraCord.fieldbyname('SPLAN_PERI').AsString + '")');
      adoCordIns.ExecSQL;
      mlog.Lines.Add('Экспорт закрытой заявки №' + trim(oraCord.fieldbyname('Sord_PREF').AsString) + '-' + trim(oraCord.fieldbyname('Sord_numb').AsString) + ' от ' + SysUtils.datetostr(oraCord.fieldbyname('dord_date').AsDateTime));
      oraCord.Next;
    End; //while cord.eof
End;

Procedure TfrmIgmaDord.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  oraCatalog.Close;
  oraParus.Connected := false;
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Subject := 'LUK-SNP DirectShip KnyagPogost';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
  action := caFree;
End;

Procedure TfrmIgmaDord.tvCatalogGetImageIndex(Sender: TObject;
  Node: TTreeNode);
Begin
  If node.Expanded Then
    node.ImageIndex := 1
  Else
    node.ImageIndex := 2;
  If Not node.HasChildren Then
    node.ImageIndex := 3;
End;

Procedure TfrmIgmaDord.acLoadExecute(Sender: TObject);
Begin
  If adoConn.Connected Then
  if MessageDlg('Выгрузить данные для отправки?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    unload;
End;

Procedure TfrmIgmaDord.acSprExecute(Sender: TObject);
Var
  iFileHandle                           : Integer;
  s                                     : char;
Begin
  oraagnfifo.Open;
  ex.DataSet := oraagnfifo;
  ex.FileName := edPath.Text + '\aFiFo_im.dbf';
  ex.Execute;
  oraagnfifo.Close;
  oraAgnFaceAcc.Open;
  ex.DataSet := oraAgnFaceAcc;
  ex.FileName := edPath.Text + '\aFace_im.dbf';
  ex.Execute;
  oraAgnFaceAcc.Close;
  oraNomen.Open;
  ex.DataSet := oraNomen;
  ex.FileName := edPath.Text + '\nom_imp.dbf';
  ex.Execute;
  oraNomen.Close;
  //процедура смены кодовой страницы
  s := chr(201); //кодовая страница 1251 для foxpro
  iFileHandle := FileOpen(edPath.Text + '\aFiFo_im.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  iFileHandle := FileOpen(edPath.Text + '\aFace_im.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  iFileHandle := FileOpen(edPath.Text + '\nom_imp.dbf', fmOpenWrite);
  FileSeek(iFileHandle, 29, 0);
  FileWrite(iFileHandle, s, 1);
  fileClose(iFileHandle);
  mlog.Lines.Add('Выгружены справочники.');
End;

Procedure TfrmIgmaDord.acSendExecute(Sender: TObject);
Begin
  If mLog.Lines.Count > 1 Then
  With frmMain.IdMessage Do
    Begin
      From.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Sender.Text := oraParus.LogonUsername + '@' + oraParus.LogonDatabase;
      Recipients.EMailAddresses := cbRec.Text;
      Subject := 'LUK-SNP (Request for Consumers)';
      Body := mLog.Lines;
      frmMain.acSendmail.Execute;
    End;
End;

procedure TfrmIgmaDord.mteCatalogAfterScroll(DataSet: TDataSet);
Var
  catName                               : String[25];
Begin
  If oraCatalog.Active Then
    Begin
      catName := mtecatalog.fieldbyname('name').asstring;
      catName := leftstr(catName, length(trim(catName)) - 11);
      If oraCatalog.SearchRecord('name', catname, [srFromBeginning]) Then
        Begin
          newCatalog := oraCatalog.FieldByName('rn').AsInteger;
          BitBtn2.Enabled := True;
        End
      Else
        BitBtn2.Enabled := False;
    End;
end;

procedure TfrmIgmaDord.DBGridEh1Columns0GetCellParams(Sender: TObject;
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
