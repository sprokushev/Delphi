unit u_sfload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PropFilerEh, DB, OracleData, PropStorageEh, Grids, DBGridEh,
  ToolEdit, TB2Item, ComCtrls, TabNotBk, ExtCtrls, StdCtrls, Mask,
  DBCtrlsEh, TB2Dock, TB2Toolbar, ADODB, main, StrUtils, Oracle,
  DateUtils, ActnList, XPStyleActnCtrls, ActnMan, ForSystem, GridsEh;

type
  Tf_sfload = class(TForm)
    RegPropStorageManEh1: TRegPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    TBDock2: TTBDock;
    Panel1: TPanel;
    TabbedNotebook1: TTabbedNotebook;
    Grid_zag: TDBGridEh;
    ds_zag: TDataSource;
    q_zag: TOracleDataSet;
    TBToolbar1: TTBToolbar;
    TBControlItem5: TTBControlItem;
    Label3: TLabel;
    c_datevyp: TDBDateTimeEditEh;
    TBControlItem6: TTBControlItem;
    q_pos: TOracleDataSet;
    ds_pos: TDataSource;
    Grid_pos: TDBGridEh;
    q_soot: TOracleDataSet;
    ds_soot: TDataSource;
    Grid_soot: TDBGridEh;
    TBToolbar6: TTBToolbar;
    TBItem1: TTBItem;
    q_renew: TOracleQuery;
    q_fill_kvittmp: TOracleQuery;
    TBItem3: TTBItem;
    q_del_kvittmp: TOracleQuery;
    TBDock1: TTBDock;
    TBToolbar7: TTBToolbar;
    TBControlItem1: TTBControlItem;
    Label1: TLabel;
    TBControlItem2: TTBControlItem;
    ZagFilename: TFilenameEdit;
    TBItem4: TTBItem;
    q_maxdate: TOracleDataSet;
    q_nomsf: TOracleDataSet;
    Grid_nomsf: TDBGridEh;
    ds_nomsf: TDataSource;
    TBItem5: TTBItem;
    q_nobills: TOracleDataSet;
    q_nulsf: TOracleDataSet;
    q_fill_nomsf: TOracleQuery;
    StatusBar1: TStatusBar;
    q_nofact: TOracleDataSet;
    ActionManager1: TActionManager;
    acSaveFiles: TAction;
    TBItem2: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    q_kolsfluk: TOracleQuery;
    q_oplata: TOracleQuery;
    cbDateCtrl: TCheckBox;
    TBControlItem3: TTBControlItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    q_buh_number: TOracleDataSet;
    q_del_inv: TOracleQuery;
    procedure FormActivate(Sender: TObject);
    procedure c_datevypChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItem1Click(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure TBItem4Click(Sender: TObject);
    procedure ZagFilenameChange(Sender: TObject);
    procedure TBItem5Click(Sender: TObject);
    procedure Grid_zagGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure acSaveFilesExecute(Sender: TObject);
    procedure TBItem6Click(Sender: TObject);
    procedure TBItem2Click(Sender: TObject);
    procedure TBItem7Click(Sender: TObject);
    procedure TBItem8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    zagolovki,posicii,sootvet,vFileNomsf: TextFile;
    s: string; // ������ �� ���������� �����
    p: string; // ����� ���� �� ������
    fz,fp,fs,fn,SaveFile: string; // ������ ���� � ������
    m_simv: string;
    vsego_z,vsego_p,vsego_s: integer; //����� ����� � �����
    loads_z,loads_p,loads_s: integer; //���������� �����
    vDir: string; // ����� ��� ������ ������
    vFromFile,vToFile: string[255];
    vRes: integer; //��������� ����������� ������ � �����
    vUserName: string;
    vKolSfLuk: integer; //���-�� ������ �������
    function GetNumReserv(cnt_to_bills:integer;DateKvit:TDateTime):integer;
    function ClearDir(sdir : string) : boolean;

  end;

var
  f_sfload: Tf_sfload;

implementation

{$R *.dfm}

procedure Tf_sfload.FormActivate(Sender: TObject);
begin

  //�������� ��� �������� ����������
  vDir:='C:\R3\IN\';

  ClearDir(vDir);

  if not DirectoryExists(vDir) then
      ForceDirectories(vDir);

  vUserName:=F_ForSystem.GetUserName(true);
  {
  if vUserName='NIVANOVA' then
    f_sfload.WindowState:=wsMaximized;
   }
    //showmessage(vUserName);

  TabbedNotebook1.PageIndex:=0;
  q_maxdate.Open;

  if not VarIsNull(q_maxdate['KVDATE']) then
    c_datevyp.value:=q_maxdate['KVDATE']
  else
    c_datevyp.value:=date();

  q_zag.SetVariable('DATEKVIT',c_datevyp.value);
  q_zag.Open;
  q_pos.SetVariable('DATEKVIT',c_datevyp.value);
  q_pos.Open;
  q_soot.SetVariable('DATEKVIT',c_datevyp.value);
  q_soot.Open;
  q_nomsf.SetVariable('DATEKVIT',c_datevyp.value);
  q_nomsf.Open;

  Grid_zag.EvenRowColor:=$00DDFFDD;
  Grid_pos.EvenRowColor:=$00DDFFFF;
  Grid_soot.EvenRowColor:=$00EEDDFF;
  Grid_nomsf.EvenRowColor:=$00EEEEEE;
  Grid_zag.SetFocus;

end;

procedure Tf_sfload.c_datevypChange(Sender: TObject);
begin

  q_zag.SetVariable('DATEKVIT',c_datevyp.value);
  q_zag.Close;
  q_zag.Open;
  q_pos.SetVariable('DATEKVIT',c_datevyp.value);
  q_pos.Close;
  q_pos.Open;
  q_soot.SetVariable('DATEKVIT',c_datevyp.value);
  q_soot.Close;
  q_soot.Open;
  q_nomsf.SetVariable('DATEKVIT',c_datevyp.value);
  q_nomsf.Close;
  q_nomsf.Open;
  q_nobills.SetVariable('DATEKVIT',c_datevyp.value);
  q_nobills.Close;
  q_nobills.Open;
  q_nulsf.SetVariable('DATEKVIT',c_datevyp.value);
  q_nulsf.Close;
  q_nulsf.Open;
  q_kolsfluk.SetVariable('DATEKVIT',c_datevyp.value);
  q_kolsfluk.Execute;

  StatusBar1.SimpleText:='� ��� ����� �� ������:    '+VarToStr(q_kolsfluk.Field('KOLLUK'));

  //showmessage(VarToStr(q_kolsfluk.Field('KOLLUK')));

end;

procedure Tf_sfload.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tf_sfload.TBItem1Click(Sender: TObject);
var
  FirstNum: double;
begin
   // ������� ������
   if cbDateCtrl.Checked then
   begin
   q_oplata.SetVariable('DATEKVIT',c_datevyp.value);
   q_oplata.Execute;
   if q_oplata.RowCount>0 then
      begin
         MessageDlg('�� ��������� ������ ��������� ������!',mtError,[mbOk],0);
         Exit;
      end;
   end;

   // �������������� ������
   q_nobills.SetVariable('DATEKVIT',c_datevyp.value);
   q_nobills.Close;
   q_nobills.Open;
   if q_nobills['CNT_NO_BILLS']>0 then
      begin
         MessageDlg('�� ��� ����� ��������������!',mtError,[mbOk],0);
         Exit;
      end;

   StatusBar1.SimpleText:='���������� KVIT, BILLS, BILL_POS';

   // ���������� ���� KVIT, BILLS, BILL_POS
   q_renew.SetVariable('DATEKVIT',c_datevyp.value);
   try
     q_renew.Execute;
   except
     MessageDlg('������ ��� ���������� ������� ����!',mtError,[mbOk],0);
     exit;
   end;

   //���������, ��� �� �������� ���������������
   q_nofact.SetVariable('DATEKVIT',c_datevyp.value);
   q_nofact.Close;
   q_nofact.Open;
   if q_nofact['NOFACT']>0 then
     begin
      MessageDlg('�� ��� �������� ���������������!',mtError,[mbOk],0);
      //exit;
     end;

   //������������ ������� �� - c 01/01/2007 �� ���������
{   StatusBar1.SimpleText:='������������ ������� ��';
   q_nulsf.SetVariable('DATEKVIT',c_datevyp.value);
   q_nulsf.Close;
   q_nulsf.Open;
   if q_nulsf['NUL_SF']>0 then
      begin

         FirstNum:=GetNumReserv(q_nulsf['NUL_SF'],c_datevyp.value);
        // FirstNum:=GetNumReserv(25,StrToDAte('05.08.2006'));

         if FirstNum>0 then
         Begin
           q_fill_nomsf.SetVariable('DATEKVIT',c_datevyp.value);
           q_fill_nomsf.SetVariable('FIRSTNUM',FirstNum);
           try
              q_fill_nomsf.Execute;
           except
                MessageDlg('������ ��� ������������ �������!',mtError,[mbOk],0);
                Exit;
           end;
         end
         else
         Begin
           MessageDlg('������ ��� ������������ �������!',mtError,[mbOk],0);
           Exit;
         end;
      end;
 }

   StatusBar1.SimpleText:='���������� KVIT_NOMSF';

  q_nomsf.Close;
  q_nomsf.Open;

  TabbedNotebook1.PageIndex:=3;
  q_kolsfluk.SetVariable('DATEKVIT',c_datevyp.value);
  q_kolsfluk.Execute;
  StatusBar1.SimpleText:='� ��� ����� �� ������:    '+VarToStr(q_kolsfluk.Field('KOLLUK'));
  MessageDlg('���������� ������� ���� ������ �������.',mtInformation,[mbOk],0);

end;

procedure Tf_sfload.TBItem3Click(Sender: TObject);
begin

   // �������� �� KVIT
   q_del_kvittmp.SetVariable('DATEKVIT',c_datevyp.value);
   try
     q_del_kvittmp.Execute;
     MessageDlg('OK!',mtInformation,[mbOk],0);
   except
     MessageDlg('������ ��� �������� �� KVIT!',mtError,[mbOk],0);
     exit;
   end;

   // ���������� KVIT
   q_fill_kvittmp.SetVariable('DATEKVIT',c_datevyp.value);
   try
     q_fill_kvittmp.Execute;
     //MessageDlg('OK!',mtInformation,[mbOk],0);
   except
     MessageDlg('������ ��� ���������� KVIT!',mtError,[mbOk],0);
     exit;
   end;
end;

procedure Tf_sfload.TBItem4Click(Sender: TObject);
var

  FieldArr_z: array[1..15] of ansistring; // ������ ����������
  FieldArr_p: array[1..23] of ansistring; // ������ �������
  FieldArr_s: array[1..6] of ansistring; // ������� ������
  np: integer; // ����� ����
  ns: integer; // ����� ������� � ������
  vFromFile,vToFile: string[255]; //����� ������ ��� �����������
  znak: integer;
  WhereStr,STR1: string;

begin

//******   ���������  **********////
  if Trim(fz)='' then
    begin
      MessageDlg('�� ������ ����!',mtError,[mbOk],0);
      exit;
    end;
 //�������� ������ �������
       q_zag.First;
       while not q_zag.Eof do
       begin
            WhereStr:=WhereStr+QuotedStr(q_zag['ISU_KOD'])+',';
            q_zag.Next
       end;
       if not q_zag.bof then
       begin
         q_del_inv.SQL[1]:='WHERE isu_kod in ('+LeftStr(WhereStr,Length(WhereStr)-1)+')';
         try
            q_del_inv.Execute;
         except
         end;
       end;
  q_pos.Close;
  q_pos.Open;
  q_zag.Close;
  q_zag.Open;
  q_soot.Close;
  q_soot.Open;

  vsego_z:=0;
  loads_z:=0;
  // ���������� ����������
  while not eof(zagolovki) do
    begin
        np:=1;
        p:='';
        Readln(zagolovki,s);
        // �������� ������
        for ns:=1 to Length(s) do
          begin
            m_simv:=s[ns];
            if m_simv<>';' then
              begin
                p:=p+m_simv;
              end
            else
              begin
                FieldArr_z[np]:=p;
                p:='';
                np:=np+1;
                if np>15 then
                  begin
                    MessageDlg('�������� ������ ����� ����������!',mtError,[mbOk],0);
                    CloseFile(zagolovki);
                    exit;
                  end;
              end;
          end;
         FieldArr_z[np]:=p;

         if np<15 then
            begin
              MessageDlg('�������� ������ ����� ����������!',mtError,[mbOk],0);
              CloseFile(zagolovki);
              exit;
            end;

         vsego_z:=vsego_z+1;

         //������ ������ � �������
         if StrToDate(RightStr(FieldArr_z[12],2)+'.'+LeftStr(RightStr(FieldArr_z[4],4),2)+'.'+LeftStr(FieldArr_z[4],4))<>c_datevyp.Value then
             begin
                if MessageDlg('���� ��������� �� �'+RightStr(FieldArr_z[1],10)+' �� ��������� � ����� ��������. ���������� ��������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
             end
         else
             begin
               q_zag.Edit;
               q_zag.Append;
               q_zag['isu_kod']:=RightStr(FieldArr_z[1],10);
               if StrToInt64(RightStr(FieldArr_z[2],10))<>0 then
               begin
                   q_zag['isu_kod_old']:='';
                   q_buh_number.Close;
                   q_buh_number.SQL[2]:='WHERE nom_dok=' + LeftStr(FieldArr_z[2],10);
                   q_buh_number.open;
                   if q_buh_number.IsEmpty then
                   begin
                    q_buh_number.Close;
                    q_buh_number.SQL[2]:='WHERE nom_dok=' + LeftStr(FieldArr_z[1],10);
                    q_buh_number.open;
                   end;
                   q_zag['nom_sf']:=q_buh_number['nom_sf'];
               end
               else
                   q_zag['nom_sf']:=RightStr(FieldArr_z[3],10);

//             q_zag['nom_sf']:=RightStr(FieldArr_z[3],10);
               q_zag['date_vyp_sf']:=RightStr(FieldArr_z[4],2)+'.'+LeftStr(RightStr(FieldArr_z[4],4),2)+'.'+LeftStr(FieldArr_z[4],4);
               q_zag['isu_kod_dog']:=FieldArr_z[5];
               q_zag['poluch_ksss']:=FieldArr_z[6];
               q_zag['usl_plat']:=FieldArr_z[7];
               q_zag['grotp_ksss']:=FieldArr_z[8];
               q_zag['prim']:=FieldArr_z[9];
               q_zag['dopoln']:=FieldArr_z[10];
               q_zag['numdatekvit']:=FieldArr_z[11];
               q_zag['date_kvit']:=RightStr(FieldArr_z[12],2)+'.'+LeftStr(RightStr(FieldArr_z[12],4),2)+'.'+LeftStr(FieldArr_z[12],4);
               q_zag['status']:=StrToInt(FieldArr_z[13]);
               q_zag['latent']:=FieldArr_z[14];
               q_zag['nom_avans']:=FieldArr_z[15];
               q_zag.Post;
               loads_z:=loads_z+1;
             end;
    end;

  CloseFile(zagolovki);

//******   �������  **********////
  if Trim(fp)='' then
    begin
      MessageDlg('�� ������ ����!',mtError,[mbOk],0);
      exit;
    end;
  //�������� ������ �������
{  q_pos.Last;
  while not q_pos.Bof do
    begin
      q_pos.Delete;
    end;
 }
  //����� �������
  vsego_p:=0;
  loads_p:=0;

//  TabbedNotebook1.PageIndex:=1;

  // ���������� ����������
  while not eof(posicii) do
    begin
        np:=1;
        p:='';
        Readln(posicii,s);
        // �������� ������
        for ns:=1 to Length(s) do
          begin
            m_simv:=s[ns];
            if m_simv<>';' then
              begin
                p:=p+m_simv;
              end
            else
              begin
                FieldArr_p[np]:=p;
                p:='';
                np:=np+1;
                if np>23 then
                  begin
                    MessageDlg('�������� ������ ����� �������!',mtError,[mbOk],0);
                    CloseFile(posicii);
                    exit;
                  end;
              end;
          end;
         FieldArr_p[np]:=p;

         if np<23 then
            begin
              MessageDlg('�������� ������ ����� �������!',mtError,[mbOk],0);
              CloseFile(posicii);
              exit;
            end;

         vsego_p:=vsego_p+1;
         //������ ������ � �������

           if not q_zag.Locate('isu_kod',LeftStr(FieldArr_p[1],10),[]) then
             begin
               if MessageDlg('����� �� ������� �� ������ � ������� �� ����������.����������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
             end
           else
             begin
               q_pos.Edit;
               q_pos.Append;
               q_pos['isu_kod_pos']:=FieldArr_p[1];

               if StrToFloat(FieldArr_p[2])<>0 then
                   q_pos['isu_kod_pos_old']:='';

               q_pos['MATERIAL_KSSS']:=FieldArr_p[3];


               if FieldArr_p[4]<>'' then
                   q_pos['AKCIZ_GRP']:=StrToInt(FieldArr_p[4]);

               q_pos['PRICE']:=StrToFloat(AnsiReplaceStr(FieldArr_p[5],',','.'));
               q_pos['ves']:=StrToFloat(AnsiReplaceStr(FieldArr_p[6],',','.'));
               q_pos['SUMMA_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[7],',','.'));
               q_pos['SUMMA_AKCIZ']:=StrToFloat(AnsiReplaceStr(FieldArr_p[8],',','.'));
               q_pos['SUMMA_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[9],',','.'));
               q_pos['SUMMA']:=StrToFloat(AnsiReplaceStr(FieldArr_p[10],',','.'));
               q_pos['OWNER_KSSS']:=FieldArr_p[11];
               q_pos['nds']:=StrToFloat(AnsiReplaceStr(FieldArr_p[12],',','.'));

               if FieldArr_p[13]<>'' then
               q_pos['TARIF_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[13],',','.'));
               if FieldArr_p[14]<>'' then
                begin
                  if not AnsiContainsStr(FieldArr_p[14],'-') then
                      q_pos['SUMMA_RAZN_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[14],',','.'))
                  else
                      MessageDlg('� 14 ���� ������������� �����!', mtConfirmation, [mbYes, mbNo], 0)
                  //FieldArr_p[14]:=AnsiReplaceStr(FieldArr_p[14],'-','');
                end;
               if FieldArr_p[15]<>'' then
               q_pos['TARIF_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[15],',','.'));
               if FieldArr_p[16]<>'' then
               q_pos['TARIF_GUARD_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[16],',','.'));
               if FieldArr_p[17]<>'' then
               q_pos['TARIF_GUARD_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[17],',','.'));
               if FieldArr_p[18]<>'' then
               q_pos['SUMMA_VOZN_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[18],',','.'));
               if FieldArr_p[19]<>'' then
               q_pos['SUMMA_OSOB']:=StrToFloat(AnsiReplaceStr(FieldArr_p[19],',','.'));
               if FieldArr_p[20]<>'X' then
               q_pos['IS_AKCIZ']:=1;

               q_pos['EX_SVID']:=FieldArr_p[21];
               q_pos['PRICE_WITH_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[22],',','.'));
               q_pos['AKCIZ_RUB']:=StrToFloat(AnsiReplaceStr(FieldArr_p[23],',','.'));

               q_pos.Post;
               loads_p:=loads_p+1;

             end;
    end;

  CloseFile(posicii);

//******   ������������  **********////
  if Trim(fs)='' then
    begin
      MessageDlg('�� ������ ����!',mtError,[mbOk],0);
      exit;
    end;
  //�������� ������ �������
  {q_soot.Last;
  while not q_soot.Bof do
    begin
      q_soot.Delete;
    end;
   }
  vsego_s:=0;
  loads_s:=0;

//  TabbedNotebook1.PageIndex:=2;

  // ���������� ����������
  while not eof(sootvet) do
    begin
        np:=1;
        p:='';
        Readln(sootvet,s);
        // �������� ������
        for ns:=1 to Length(s) do
          begin
            m_simv:=s[ns];
            if m_simv<>';' then
              begin
                p:=p+m_simv;
              end
            else
              begin
                FieldArr_s[np]:=p;
                p:='';
                np:=np+1;
                if np>6 then
                  begin
                    MessageDlg('�������� ������ ����� ������������!',mtError,[mbOk],0);
                    CloseFile(sootvet);
                    exit;
                  end;
              end;
          end;
         FieldArr_s[np]:=p;

         if np<6 then
            begin
              MessageDlg('�������� ������ ����� ������������!',mtError,[mbOk],0);
              CloseFile(sootvet);
              exit;
            end;

         vsego_s:=vsego_s+1;
         //������ ������ � �������

           if not q_zag.Locate('isu_kod',FieldArr_s[1],[]) then
             begin
               if MessageDlg('����� �� ������ ������������ �� ������ � ������� �� ����������.����������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
             end
           else
             begin

               q_soot.Edit;
               q_soot.Append;
               q_soot['isu_kod']:=FieldArr_s[1];
               q_soot['isu_kod_pos']:=FieldArr_s[2];
               q_soot['ISU_TTN_ID']:=FieldArr_s[3];
               q_soot['TTN_ID']:=FieldArr_s[4];
               q_soot['KVIT_ID']:=FieldArr_s[5];
               q_soot['VES']:=StrToFloat(AnsiReplaceStr(FieldArr_s[6],',','.'));
               q_soot.Post;
               loads_s:=loads_s+1;

             end;
    end;

  CloseFile(sootvet);

//****** ������� ������ � ����� ************//

  // ���� ����������
  //CloseFile(zagolovki);
  SaveFile:=fz;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fz);

  // ���� �������
  //CloseFile(posicii);
  SaveFile:=fp;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fp);

  // ���� ������������
  //CloseFile(sootvet);
  SaveFile:=fs;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fs);

  MessageDlg('��������: '+VarToStr(loads_z)+' �� '+VarToStr(vsego_z)+' ����������.'+CHR(13)
            +'          '+VarToStr(loads_p)+' �� '+VarToStr(vsego_p)+' �������.'+CHR(13)
            +'          '+VarToStr(loads_s)+' �� '+VarToStr(vsego_s)+' ������������.'+CHR(13)
              ,mtInformation,[mbOk],0);

end;

procedure Tf_sfload.ZagFilenameChange(Sender: TObject);
begin

  fz:=ZagFileName.Text;

  if Pos('SD005',fz)<>0 then
    if Pos('SD005_1',fz)<>0 then
      begin
        fp:=ZagFileName.Text;
        fs:=ZagFileName.Text;
        fp[Pos('SD005',fp)+6]:='2';
        fs[Pos('SD005',fp)+6]:='3';
      end
    else
        MessageDlg('��� �� ���� ����������!',mtError,[mbOk],0)
  else
      MessageDlg('��� ����� �� ������������� ����������!',mtError,[mbOk],0);

  AssignFile(zagolovki,fz);
  try
    Reset(zagolovki);
    //CloseFile(zagolovki);
  except
    MessageDlg('�� ������ ���� ���������� (1)!',mtError,[mbOk],0);
  end;

  AssignFile(posicii,fp);
  try
    Reset(posicii);
    //CloseFile(posicii);
  except
    MessageDlg('�� ������ ���� ������� (2)!',mtError,[mbOk],0);
  end;

  AssignFile(sootvet,fs);
  try
    Reset(sootvet);
    //CloseFile(sootvet);
  except
    MessageDlg('�� ������ ���� ������������ (3)!',mtError,[mbOk],0);
  end;

end;

procedure Tf_sfload.TBItem5Click(Sender: TObject);
var

   vMonthStr: string; // ����� ������ �������
   vDayStr: string; // ���� ������ �������

begin

  // ��� �����
  if MonthOf(c_datevyp.value)<10 then
      vMonthStr:='0'+ VarToStr(MonthOf(c_datevyp.value))
  else
      vMonthStr:=VarToStr(MonthOf(c_datevyp.value));

  if DayOf(c_datevyp.value)<10 then
      vDayStr:='0'+ VarToStr(DayOf(c_datevyp.value))
  else
      vDayStr:=VarToStr(DayOf(c_datevyp.value));

  vDir:='C:\R3\IN';
  fn:=vDir+'\2300_SD005_4_'+VarToStr(YearOf(c_datevyp.value)) + vMonthStr + vDayStr
                                   +'_'+AnsiReplaceStr(TimeToStr(Time()),':','')
                                   +'.csv';
  {
  //�������� ��� �������� ����������
  if not DirectoryExists(vDir) then
      ForceDirectories(vDir);
  }

  // �������� �����
  AssignFile(vFileNomsf,fn);
  Rewrite(vFileNomsf);
  q_nomsf.First;
  while not q_nomsf.Eof do
    begin
      Writeln(vFileNomsf,VarToStr(q_nomsf['NOMR3'])+';'+VarToStr(q_nomsf['NOM_SF'])+';');
      q_nomsf.Next;
    end;

  CloseFile(vFileNomsf);

  //����������� � �����
  SaveFile:=fn;
  vRes:=0;
  acSaveFiles.Execute;

  MessageDlg('������ ���� '+fn,mtInformation,[mbOk],0);

end;

procedure Tf_sfload.Grid_zagGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if VarIsNull(q_zag.FieldValues['NOM_SF']) then
      Background:=$00DDDDFF;

end;

function Tf_sfload.GetNumReserv(cnt_to_bills:integer;DateKvit:TDateTime):integer;
var q_cmn:TADOQuery;
    SelectSQL:string;
    UpdateSQL:string;
    Res:integer;
    vDate1,vDate2:TDateTime;
    vNumWeek,vStartNum,vCurrNum,vRange,vDopRange: integer;
    vTableDbf: string;
Begin

  vTableDbf:='"u:\luk\buxgalt\scheta\dbf\numbers.dbf"';

  // ����������� �������-����������
  q_cmn:=TADOQuery.Create(Self);
  q_cmn.ConnectionString:='Provider=MSDASQL.1;Persist Security Info=False;Data Source=PF;Extended Properties="DSN=PF;UID=;SourceDB=u:\luk\buxgalt\scheta\dbf;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"';

  // ��������� �� ������� ������� �������
  SelectSQL:='SELECT start_num,curr_num,range FROM '+vTableDbf+' WHERE ' +
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'>=start_date and '+
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'<=end_date';
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add(SelectSQL);
  Res:=0;
  try
    q_cmn.Open;
  except
    //Res:=-1;
    MessageDlg('������ 1 ��� �������������� ������� ��!',mtError,[mbOk],0);
    Exit;
  end;

  //���������� ������ ���� ������ ������ �� ������
  q_cmn.First;
  if q_cmn.Eof then
  begin
     case DayOf(DateKvit) of
      1..5:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-1);
          vDate2:=vDate1+4;
        end;
      6..10:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-6);
          vDate2:=vDate1+4;
        end;
      11..15:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-11);
          vDate2:=vDate1+4;
        end;
      16..20:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-16);
          vDate2:=vDate1+4;
        end;
      21..25:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-21);
          vDate2:=vDate1+4;
        end;
      26..31:
        begin
          vDate1:=DateKvit-(DayOf(DateKvit)-26);
          vDate2:=EndOfTheMonth(DateKvit);
        end;
     end;

    SelectSQL:='SELECT * FROM '+vTableDbf+' order by num_week ';
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add(SelectSQL);

    try
      q_cmn.Open;
    except
      MessageDlg('������ 2 ��� �������������� ������� ��!',mtError,[mbOk],0);
      Exit;
    end;

    q_cmn.Last;

    vNumWeek:=q_cmn.FieldValues['num_week'];
    vStartNum:=q_cmn.FieldValues['start_num'];
    vCurrNum:=q_cmn.FieldValues['curr_num'];
    vRange:=q_cmn.FieldValues['range'];

    //����� �������
    if DayOf(q_cmn.FieldValues['start_date'])>25 then
        vDopRange:=50
    else
        vDopRange:=20;

    //��������� ������
    UpdateSQL:='UPDATE '+vTableDbf+' SET range='+IntToStr(vCurrNum-vStartNum+vDopRange)+' WHERE num_week=' +IntToStr(vNumWeek);
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(UpdateSQL);
      q_cmn.ExecSQL;
    except
      MessageDlg('������ 3 ��� �������������� ������� ��!',mtError,[mbOk],0);
      Exit;
    end;

    //����� ������
    UpdateSQL:='INSERT INTO '+vTableDbf+' (num_week,start_date,end_date,start_num,curr_num,range)'+
                             ' VALUES ('+VarToStr(vNumWeek+1)+','+
                                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',vDate1)+','+
                                        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',vDate2)+','+
                                        VarToStr(vCurrNum+vDopRange+1)+','+
                                        VarToStr(vCurrNum+vDopRange+1)+','+
                                        '500)';
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add(UpdateSQL);
      q_cmn.ExecSQL;
    except
      showmessage(UpdateSQL);
      MessageDlg('������ 4 ��� �������������� ������� ��!',mtError,[mbOk],0);
      Exit;
    end;

    //��������������� ������
    SelectSQL:='SELECT start_num,curr_num,range FROM '+vTableDbf+' WHERE ' +
      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'>=start_date and '+
      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'<=end_date';
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add(SelectSQL);
    Res:=0;
    try
      q_cmn.Open;
    except
      //Res:=-1;
      MessageDlg('������ 5 ��� �������������� ������� ��!',mtError,[mbOk],0);
      Exit;
    end;
  end;


    if q_cmn.FieldByName('range').AsInteger-(q_cmn.FieldByName('curr_num').AsInteger-q_cmn.FieldByName('start_num').AsInteger)>=cnt_to_bills then
     begin
      // ������ ������� ����������
      Res:=q_cmn.FieldByName('curr_num').AsInteger;
      // �����������
      UpdateSQL:='UPDATE '+vTableDbf+' SET curr_num='+IntToStr(q_cmn.FieldByName('curr_num').AsInteger+cnt_to_bills)+' WHERE ' +
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'>=start_date and '+
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',DateKvit)+'<=end_date';
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add(UpdateSQL);
        q_cmn.ExecSQL;
      except
      MessageDlg('������ 6 ��� �������������� ������� ��!',mtError,[mbOk],0);
      Exit;
      end;
     end
    else
      MessageDlg('������ 7 ��� �������������� ������� ��!',mtError,[mbOk],0);

  q_cmn.Close;;
  q_cmn.SQL.Clear;
  q_cmn.free;
{
  if Res=0 then
  Begin
    Application.MessageBox(PChar('���������� �������� ������ �������!'),'��������!',MB_OK);
  end;
  if Res=-1 then
  Begin
    Application.MessageBox(PChar('������ ��� �������������� ������� ��!'),'��������!',MB_OK);
  end;
}
  Result:=res;
End;


procedure Tf_sfload.acSaveFilesExecute(Sender: TObject);
begin
  vRes:=0;
  vDir:='U:\ISU\BILLS_ARCHIVE\'+ RightStr(AnsiReplaceStr(DateToStr(c_datevyp.value),'.',''),2)
                               + Copy(AnsiReplaceStr(DateToStr(c_datevyp.value),'.',''),3,2)
                               + LeftStr(AnsiReplaceStr(DateToStr(c_datevyp.value),'.',''),2);

  if length(SaveFile)=0 then
     exit;

  //�������� ��� �������� ����������
  if not DirectoryExists(vDir) then
      ForceDirectories(vDir);

  // ���� ����������
  vFromFile:=SaveFile+#0;
  vToFile:=vDir + '\' + RightStr(SaveFile,Length(SaveFile)-Pos('SD005',SaveFile)+6)+#0;
  if Windows.COPYFILE(@vFromFile[1],@vToFile[1],False) then
     begin
       vRes:=1;
     end
  else
     begin
      MessageDlg('������ ��� ����������� � ����� ����� '+RightStr(SaveFile,Length(SaveFile)-Pos('SD005',SaveFile)+6)
                ,mtInformation,[mbOk],0);
       vRes:=0;
     end;

end;

procedure Tf_sfload.TBItem6Click(Sender: TObject);
begin
  c_datevyp.value:=c_datevyp.value-1;
end;

procedure Tf_sfload.TBItem2Click(Sender: TObject);
begin
  c_datevyp.value:=c_datevyp.value+1;
end;

function Tf_sfload.ClearDir(sdir : string) : boolean;
var
iindex : integer;
searchrec : tsearchrec;
sfilename : string;
begin
result := false;
sdir := sdir + '*.*';
iindex := findfirst(sdir, faanyfile, searchrec);

while iindex = 0 do begin
sfilename := extractfiledir(sdir)+'\'+searchrec.name;
if searchrec.attr <> fadirectory then
begin
  if searchrec.attr <> faarchive then filesetattr(sfilename, faarchive);
  if not deletefile(sfilename) then
    //showmessage('could not delete ' + sfilename);
  end;
  iindex := findnext(searchrec);
end;
findclose(searchrec);
result := true;
end;

procedure Tf_sfload.TBItem7Click(Sender: TObject);
var

  FieldArr_z: array[1..15] of ansistring; // ������ ����������
  FieldArr_p: array[1..23] of ansistring; // ������ �������
  FieldArr_s: array[1..6] of ansistring; // ������� ������
  np: integer; // ����� ����
  ns: integer; // ����� ������� � ������
  vFromFile,vToFile: string[255]; //����� ������ ��� �����������
  znak: integer;

begin
try
//******   ���������  **********////
  if Trim(fz)='' then
    begin
      MessageDlg('�� ������ ����!',mtError,[mbOk],0);
      exit;
    end;
  //�������� ������ �������
  q_zag.Last;
  while not q_zag.Bof do
    begin
      q_zag.Delete;

      //q_pos.Close;
      //q_pos.Open;
      //q_soot.Close;
      //q_soot.Open;

    end;
  q_pos.Close;
  q_pos.Open;
  q_zag.Close;
  q_zag.Open;
  q_soot.Close;
  q_soot.Open;

  vsego_z:=0;
  loads_z:=0;
  // ���������� ����������
  while not eof(zagolovki) do
    begin
        np:=1;
        p:='';
        Readln(zagolovki,s);
        // �������� ������
        for ns:=1 to Length(s) do
          begin
            m_simv:=s[ns];
            if m_simv<>';' then
              begin
                p:=p+m_simv;
              end
            else
              begin
                FieldArr_z[np]:=p;
                p:='';
                np:=np+1;
                if np>15 then
                  begin
                    MessageDlg('�������� ������ ����� ����������!',mtError,[mbOk],0);
                    CloseFile(zagolovki);
                    exit;
                  end;
              end;
          end;
         FieldArr_z[np]:=p;

         if np<15 then
            begin
              MessageDlg('�������� ������ ����� ����������!',mtError,[mbOk],0);
              CloseFile(zagolovki);
              exit;
            end;

         vsego_z:=vsego_z+1;
         //������ ������ � �������
{         if StrToDate(RightStr(FieldArr_z[12],2)+'.'+LeftStr(RightStr(FieldArr_z[4],4),2)+'.'+LeftStr(FieldArr_z[4],4))<>c_datevyp.Value then
             begin
                if MessageDlg('���� ��������� �� �'+RightStr(FieldArr_z[1],10)+' �� ��������� � ����� ��������. ���������� ��������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
             end
         else
             begin}
               q_zag.Edit;
               q_zag.Append;
               q_zag['isu_kod']:=RightStr(FieldArr_z[1],10);
               if StrToInt64(RightStr(FieldArr_z[2],10))<>0 then
               begin
                   q_zag['isu_kod_old']:='';
                   q_buh_number.Close;
                   q_buh_number.SQL[2]:='WHERE nom_dok=' + LeftStr(FieldArr_z[2],10);
                   q_buh_number.open;
                   if q_buh_number.IsEmpty then
                   begin
                    q_buh_number.Close;
                    q_buh_number.SQL[2]:='WHERE nom_dok=' + LeftStr(FieldArr_z[1],10);
                    q_buh_number.open;
                   end;
                   q_zag['nom_sf']:=q_buh_number['nom_sf'];
               end
               else
                   q_zag['nom_sf']:=RightStr(FieldArr_z[3],10);
                   
               q_zag['date_vyp_sf']:=c_datevyp.Value;
               q_zag['isu_kod_dog']:=FieldArr_z[5];
               q_zag['poluch_ksss']:=FieldArr_z[6];
               q_zag['usl_plat']:=FieldArr_z[7];
               q_zag['grotp_ksss']:=FieldArr_z[8];
               q_zag['prim']:=FieldArr_z[9];
               q_zag['dopoln']:=FieldArr_z[10];
               q_zag['numdatekvit']:=FieldArr_z[11];
               q_zag['date_kvit']:=c_datevyp.Value;
               q_zag['status']:=StrToInt(FieldArr_z[13]);
               q_zag['latent']:=FieldArr_z[14];
               q_zag['nom_avans']:=FieldArr_z[15];
               q_zag.Post;
               loads_z:=loads_z+1;
//             end;
    end;

//  CloseFile(zagolovki);

//******   �������  **********////
  if Trim(fp)='' then
    begin
      MessageDlg('�� ������ ����!',mtError,[mbOk],0);
      exit;
    end;
  //�������� ������ �������
{  q_pos.Last;
  while not q_pos.Bof do
    begin
      q_pos.Delete;
    end;
 }
  //����� �������
  vsego_p:=0;
  loads_p:=0;

//  TabbedNotebook1.PageIndex:=1;

  // ���������� ����������
  while not eof(posicii) do
    begin
        np:=1;
        p:='';
        Readln(posicii,s);
        // �������� ������
        for ns:=1 to Length(s) do
          begin
            m_simv:=s[ns];
            if m_simv<>';' then
              begin
                p:=p+m_simv;
              end
            else
              begin
                FieldArr_p[np]:=p;
                p:='';
                np:=np+1;
                if np>23 then
                  begin
                    MessageDlg('�������� ������ ����� �������!',mtError,[mbOk],0);
                    CloseFile(posicii);
                    exit;
                  end;
              end;
          end;
         FieldArr_p[np]:=p;

         if np<23 then
            begin
              MessageDlg('�������� ������ ����� �������!',mtError,[mbOk],0);
              CloseFile(posicii);
              exit;
            end;

         vsego_p:=vsego_p+1;
         //������ ������ � �������

           if not q_zag.Locate('isu_kod',LeftStr(FieldArr_p[1],10),[]) then
             begin
               if MessageDlg('����� �� ������� �� ������ � ������� �� ����������.����������?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
             end
           else
             begin

               q_pos.Edit;
               q_pos.Append;
               q_pos['isu_kod_pos']:=FieldArr_p[1];

               if StrToFloat(FieldArr_p[2])<>0 then
                   q_pos['isu_kod_pos_old']:='';

               q_pos['MATERIAL_KSSS']:=FieldArr_p[3];


               if FieldArr_p[4]<>'' then
                   q_pos['AKCIZ_GRP']:=StrToInt(FieldArr_p[4]);

               q_pos['PRICE']:=StrToFloat(AnsiReplaceStr(FieldArr_p[5],',','.'));
               q_pos['ves']:=StrToFloat(AnsiReplaceStr(FieldArr_p[6],',','.'));
// � ����� � ��������� ���������� ������� �������� ���������� ��������� �������������� � ��� ���������
               if q_pos['MATERIAL_KSSS']<>'10003' then
                  q_pos['SUMMA_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[10],',','.'))
               else q_pos['SUMMA_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[7],',','.'));
               q_pos['SUMMA_AKCIZ']:=StrToFloat(AnsiReplaceStr(FieldArr_p[8],',','.'));

// � ����� � ��������� ���������� ������� �������� ���������� ��������� �������������� � ��� ���������
               if q_pos['MATERIAL_KSSS']<>'10003' then
                  q_pos['SUMMA_NDS']:=0
               else q_pos['SUMMA_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[9],',','.'));

               q_pos['SUMMA']:=StrToFloat(AnsiReplaceStr(FieldArr_p[10],',','.'));
               q_pos['OWNER_KSSS']:=FieldArr_p[11];
               q_pos['nds']:=StrToFloat(AnsiReplaceStr(FieldArr_p[12],',','.'));

               if FieldArr_p[13]<>'' then
               q_pos['TARIF_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[13],',','.'));
               if FieldArr_p[14]<>'' then
                begin
                  if not AnsiContainsStr(FieldArr_p[14],'-') then
                      q_pos['SUMMA_RAZN_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[14],',','.'))
                  else
                      MessageDlg('� 14 ���� ������������� �����!', mtConfirmation, [mbYes, mbNo], 0)
                  //FieldArr_p[14]:=AnsiReplaceStr(FieldArr_p[14],'-','');
                end;
               if FieldArr_p[15]<>'' then
               q_pos['TARIF_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[15],',','.'));
               if FieldArr_p[16]<>'' then
               q_pos['TARIF_GUARD_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[16],',','.'));
               if FieldArr_p[17]<>'' then
               q_pos['TARIF_GUARD_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[17],',','.'));
               if FieldArr_p[18]<>'' then
               q_pos['SUMMA_VOZN_BN']:=StrToFloat(AnsiReplaceStr(FieldArr_p[18],',','.'));
               if FieldArr_p[19]<>'' then
               q_pos['SUMMA_OSOB']:=StrToFloat(AnsiReplaceStr(FieldArr_p[19],',','.'));
               if FieldArr_p[20]<>'X' then
               q_pos['IS_AKCIZ']:=1;

               q_pos['EX_SVID']:=FieldArr_p[21];
               q_pos['PRICE_WITH_NDS']:=StrToFloat(AnsiReplaceStr(FieldArr_p[22],',','.'));
               q_pos['AKCIZ_RUB']:=StrToFloat(AnsiReplaceStr(FieldArr_p[23],',','.'));

               q_pos.Post;
               loads_p:=loads_p+1;

             end;
    end;

//  CloseFile(posicii);
finally
  CloseFile(zagolovki);
  CloseFile(posicii);
end;
{
//****** ������� ������ � ����� ************//

  // ���� ����������
  //CloseFile(zagolovki);
  SaveFile:=fz;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fz);

  // ���� �������
  //CloseFile(posicii);
  SaveFile:=fp;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fp);

  // ���� ������������
  //CloseFile(sootvet);
  SaveFile:=fs;
  acSaveFiles.Execute;
  if vRes=1 then DeleteFile(fs);
 }
  MessageDlg('��������: '+VarToStr(loads_z)+' �� '+VarToStr(vsego_z)+' ����������.'+CHR(13)
            +'          '+VarToStr(loads_p)+' �� '+VarToStr(vsego_p)+' �������.'+CHR(13)
            +'          '+VarToStr(loads_s)+' �� '+VarToStr(vsego_s)+' ������������.'+CHR(13)
              ,mtInformation,[mbOk],0);


end;

procedure Tf_sfload.TBItem8Click(Sender: TObject);
var LastDay:integer;
    CurDay:TDateTime;
    i: integer;
begin
LastDay:=DaysInMonth(c_datevyp.value)-2;
CurDay:=StartOfTheMonth(c_datevyp.value);
for i:=1 to LastDay do
begin
   // ���������� ���� KVIT, BILLS, BILL_POS
   q_renew.SetVariable('DATEKVIT',CurDay);
   try
     q_renew.Execute;
   except
   end;
   CurDay:=CurDay+1;
end;
end;

end.
