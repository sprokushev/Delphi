unit in1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB, StdCtrls, Mask, ToolEdit, ActnList, dateutils,
  PrnDbgeh, ExtCtrls, DBGridEhImpExp, RXSplit, Placemnt, MDIForm, GridsEh;

type
  Tfrm_OBU_sbcard = class(Tf_MDIForm)
    zarpsnp: TADOConnection;
    ds_Zarpsnp: TDataSource;
    grd_Zarpsnp: TDBGridEh;
    acl_OBU: TActionList;
    ac_OBU_Refresh: TAction;
    q_zarpsnp: TADOQuery;
    q_zarpsnpkls_name: TStringField;
    q_zarpsnpp120: TStringField;
    q_zarpsnpsumvyd: TBCDField;
    prn_Zarpsnp: TPrintDBGridEh;
    Panel1: TPanel;
    ed_DataWork: TDateEdit;
    Button1: TButton;
    Label1: TLabel;
    Button3: TButton;
    q_zarpsnpspec1: TIntegerField;
    q_zarpsnpspec2: TIntegerField;
    q_zarpsnpspec3: TStringField;
    ac_OBU_Write: TAction;
    grd_ZP0: TDBGridEh;
    RxSplitter1: TRxSplitter;
    q_zarpsnp0: TADOQuery;
    ds_zarpsnp0: TDataSource;
    q_zarpsnp0p120: TStringField;
    q_zarpsnp0sumvyd: TBCDField;
    q_zarpsnp0kls_name: TStringField;
    FormStorage1: TFormStorage;
    Button2: TButton;
    ac_OBU_Print: TAction;
    prn_zp0: TPrintDBGridEh;
    ac_OBU_zp0: TAction;
    Button4: TButton;
    grd_ZarpAll: TDBGridEh;
    RxSplitter2: TRxSplitter;
    ds_ZarpAll: TDataSource;
    q_ZarpAll: TADOQuery;
    prn_ZarpAll: TPrintDBGridEh;
    q_ZarpAllsumvyd: TBCDField;
    q_ZarpAllkls_name: TStringField;
    Button5: TButton;
    ac_OBU_ZarpAll: TAction;
    Button6: TButton;
    ac_OBU_Ved: TAction;
    sd_ZarpVed: TSaveDialog;
    procedure ac_OBU_RefreshExecute(Sender: TObject);
    procedure ed_DataWorkChange(Sender: TObject);
    procedure ac_OBU_previewExecute(Sender: TObject);
    procedure ac_OBU_WriteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ac_OBU_PrintExecute(Sender: TObject);
    procedure ac_OBU_zp0Execute(Sender: TObject);
    procedure ac_OBU_ZarpAllExecute(Sender: TObject);
    procedure ac_OBU_VedExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_OBU_sbcard: Tfrm_OBU_sbcard;

implementation

uses ForDB,ForFiles, main;

{$R *.dfm}

procedure Tfrm_OBU_sbcard.ac_OBU_RefreshExecute(Sender: TObject);
begin
q_zarpsnp.Active:=false;
q_zarpsnp.sql[2]:='where entry_date=convert(datetime,'''+ed_DataWork.Text+''',104)';
q_zarpsnp.Active:=True;
q_zarpsnp0.Active:=false;
q_zarpsnp0.sql[2]:='where entry_date=convert(datetime,'''+ed_DataWork.Text+''',104)';
q_zarpsnp0.Active:=True;
q_zarpAll.Active:=false;
q_zarpAll.sql[2]:='where entry_date=convert(datetime,'''+ed_DataWork.Text+''',104)';
q_zarpAll.sql[7]:='where entry_date=convert(datetime,'''+ed_DataWork.Text+''',104)';
q_zarpAll.Active:=True;
end;

procedure Tfrm_OBU_sbcard.ed_DataWorkChange(Sender: TObject);
begin
ed_DataWork.Date:=ed_DataWork.Date-dayofthemonth(ed_DataWork.Date)+1;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_previewExecute(Sender: TObject);
begin
prn_zarpsnp.Preview;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_WriteExecute(Sender: TObject);
var
s,s1,s2,t:string;
FileHandle:integer;
f1:textfile;
v:boolean;
begin
s:=datetostr(ed_DataWork.Date);
s1:=copy(s,4,2);
s2:=copy(s,7,4);
s:='c:\temp\np'+s1+s2+'.txt';
t:='np'+s1+s2+'.txt';
filehandle:=FileCreate(s);
fileclose(filehandle);
assignFile(f1,s);
rewrite(f1);
q_zarpsnp.FindFirst;
repeat
if q_zarpsnp.FieldByName('sumvyd').AsFloat>0 then
begin
        s:=q_zarpsnp.FieldByName('spec1').AsString+#9+q_zarpsnp.FieldByName('p120').AsString+#9;
        s:=s+formatfloat('#0.00',q_zarpsnp.FieldByName('sumvyd').AsFloat)+#9+q_zarpsnp.FieldByName('kls_name').AsString+#9;
        s:=s+q_zarpsnp.FieldByName('spec2').AsString+#9+q_zarpsnp.FieldByName('spec3').AsString;
//        s1:=formatfloat('#0.00',q_zarpsnp.FieldByName('sumvyd').AsFloat);
        writeln(f1,s);
end;
q_zarpsnp.Next;
until q_zarpsnp.Eof;
closeFile(f1);
sd_zarpVed.FileName:=t;
v:=sd_zarpved.Execute;
end;

procedure Tfrm_OBU_sbcard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_PrintExecute(Sender: TObject);
begin
  inherited;
prn_zarpsnp.Preview;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_zp0Execute(Sender: TObject);
begin
  inherited;
prn_zp0.Preview;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_ZarpAllExecute(Sender: TObject);
begin
  inherited;
prn_zarpAll.Preview;
end;

procedure Tfrm_OBU_sbcard.ac_OBU_VedExecute(Sender: TObject);
  var
  f1,f2:String[255];
begin
    Begin
      F_FileUtils.CheckReport('sbcard.xls',f_main.TempNetPath+'sbcard.xls');
      F_FileUtils.ExecAndWait(f_main.TempNetPath+'sbcard.xls','',SW_SHOWMAXIMIZED,false);
    end;

end;

end.
