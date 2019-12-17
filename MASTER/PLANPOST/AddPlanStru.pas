unit AddPlanStru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxLookup, ComCtrls, Mask, DB, OracleData,
  Oracle,DateUtil;

type
  TF_AddPlanStru = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    e_BegDate: TDateTimePicker;
    Label5: TLabel;
    e_EndDate: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    q_Tmp: TOracleDataSet;
    q_ParentStru: TOracleDataSet;
    ds_ParentStru: TDataSource;
    lc_ParentStru: TRxDBLookupCombo;
    Label7: TLabel;
    e_name: TEdit;
    Label8: TLabel;
    Label1: TLabel;
    e_kod_sgr: TEdit;
    e_kod_spg: TEdit;
    e_kod_rzd: TEdit;
    e_kod_prz: TEdit;
    e_kod_grp: TEdit;
    e_kod_pgr: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    q_ParentStruID: TFloatField;
    q_ParentStruNAME: TStringField;
    q_ParentStruBEGIN_DATE: TDateTimeField;
    q_ParentStruEND_DATE: TDateTimeField;
    q_ParentStruLEVEL_POS: TIntegerField;
    q_ParentStruKOD_SGR: TIntegerField;
    q_ParentStruKOD_SPG: TIntegerField;
    q_ParentStruKOD_RZD: TIntegerField;
    q_ParentStruKOD_PRZ: TIntegerField;
    q_ParentStruKOD_GRP: TIntegerField;
    q_ParentStruKOD_PGR: TIntegerField;
    Label11: TLabel;
    e_Level: TEdit;
    Label12: TLabel;
    q_nazn_otg: TOracleDataSet;
    ds_nazn_otg: TDataSource;
    q_nazn_otgID: TIntegerField;
    q_nazn_otgNAZN_OTG_NAME: TStringField;
    lc_Nazn_Otg: TRxDBLookupCombo;
    Label13: TLabel;
    e_for_id: TEdit;
    Label14: TLabel;
    e_for_name: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lc_ParentStruChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsAdd:boolean;
    PlanYear:integer;
    StruId:integer;
    ParentStruId:integer;
    PosName:string;
    BegDate:TDateTime;
    EndDate:TDateTime;
    KOD_SGR:String;
    KOD_SPG:String;
    KOD_RZD:String;
    KOD_PRZ:String;
    KOD_GRP:String;
    KOD_PGR:String;
  end;

var
  F_AddPlanStru: TF_AddPlanStru;

implementation

uses main;

{$R *.dfm}

procedure TF_AddPlanStru.FormCreate(Sender: TObject);
begin
  q_tmp.Session:=f_main.ora_Session;
  q_ParentStru.Session:=f_main.ora_Session;
  q_nazn_otg.Session:=f_main.ora_Session;
end;

procedure TF_AddPlanStru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  q_Tmp.SQL.Clear;
end;

procedure TF_AddPlanStru.FormShow(Sender: TObject);
begin
  q_nazn_otg.Open;
  If IsAdd Then
    Caption:='Добавление позиции в план за '+IntToStr(PlanYear)+' г.'
  Else
    Caption:='Редактирование позиции в плане за '+IntToStr(PlanYear)+' г.';

  with q_ParentStru do
  try
    DisableControls;
    Close;
    try
      SQL[1]:=' WHERE TO_CHAR(BEGIN_DATE,''YYYY'')<='''+IntToStr(PlanYear)+'''';
      SQL[2]:='   AND TO_CHAR(END_DATE,''YYYY'')>='''+IntToStr(PlanYear)+'''';
      Open;
    except
      SQL[1]:=' WHERE 1 = 1 ';
      SQL[2]:='   AND 1 = 1 ';
      Open;
    end;
  finally
    EnableControls;
  End;

  q_ParentStru.Locate('ID',ParentStruId,[]);
  lc_ParentStru.KeyValue:=q_ParentStru.FieldByName('ID').AsInteger;

  If NOT IsAdd Then
  Begin
    e_name.Text:=PosName;
    e_BegDate.Date:=BegDate;
    e_EndDate.Date:=EndDate;
    lc_ParentStru.Enabled:=false;
    e_KOD_SGR.Text:=KOD_SGR;
    e_KOD_SPG.Text:=KOD_SPG;
    e_KOD_RZD.Text:=KOD_RZD;
    e_KOD_PRZ.Text:=KOD_PRZ;
    e_KOD_GRP.Text:=KOD_GRP;
    e_KOD_PGR.Text:=KOD_PGR;
//    e_KOD_SGR.Enabled:=false;
//    e_KOD_SPG.Enabled:=false;
//    e_KOD_RZD.Enabled:=false;
//    e_KOD_PRZ.Enabled:=false;
//    e_KOD_GRP.Enabled:=false;
//    e_KOD_PGR.Enabled:=false;
  End
  Else
  Begin
    e_name.Text:='НОВАЯ ПОЗИЦИЯ ПЛАНА';
    e_BegDate.Date:=EncodeDate(ExtractYear(Now),1,1);
    e_EndDate.Date:=EncodeDate(ExtractYear(Now),12,31);
    lc_ParentStru.Enabled:=true;
//    e_KOD_SGR.Enabled:=true;
//    e_KOD_SPG.Enabled:=true;
//    e_KOD_RZD.Enabled:=true;
//    e_KOD_PRZ.Enabled:=true;
//    e_KOD_GRP.Enabled:=true;
//    e_KOD_PGR.Enabled:=true;
  End;

end;

procedure TF_AddPlanStru.BitBtn1Click(Sender: TObject);
var s:string;
begin
  If Trim(e_Name.Text)='' Then
  Begin
    Application.MessageBox('Введите наименование позиции плана','Внимание');
    e_Name.SetFocus;
    Exit;
  End;

  with q_Tmp do
  If IsAdd Then
  try
  {  PlanIzmId:=0;
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO PLAN_IZM (DATE_PLAN,NUM_IZM,BEGIN_DATE,END_DATE,PLAN_ID)' +
     ' VALUES (TO_DATE(''01.'+IntToStr(e_month.ItemIndex+1)+'.'+IntToStr(ud_year.Position)+''',''dd.mm.yyyy''),'+e_NumIzm.Text+','+
     ' TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BegDate.Date)+''',''dd.mm.yyyy''),' +
     ' TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_EndDate.Date)+''',''dd.mm.yyyy''),' +
     lc_Plan.KeyValue+')');
    ExecSQL;
    SQL.Clear;
    SQL.Add('COMMIT');
    ExecSQL;
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID FROM PLAN_IZM WHERE PLAN_ID='+lc_Plan.KeyValue+' AND DATE_PLAN=TO_DATE(''01.'+IntToStr(e_month.ItemIndex+1)+'.'+IntToStr(ud_year.Position)+''',''dd.mm.yyyy'') AND NUM_IZM='+e_NumIzm.Text);
    Open;
    If Not EOF Then PlanIzmId:=FieldByName('ID').AsInteger
    Else PlanIzmId:=0;}
  finally
    Close;
  End
  Else
  try
    Close;
    SQL.Clear;
    S:='UPDATE KLS_PLANSTRU SET NAME = ''' + e_name.Text + ''', ' +
     ' BEGIN_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_BegDate.Date)+''',''dd.mm.yyyy''),' +
     ' END_DATE=TO_DATE('''+FormatDateTime('dd.mm.yyyy',e_EndDate.Date)+''',''dd.mm.yyyy'') ' +
     ' WHERE ID='+IntToStr(StruId);
    SQL.Add(S);
    ExecSQL;
    SQL.Clear;
    SQL.Add('COMMIT');
    ExecSQL;
  finally
    Close;
  End;
  ModalResult:=mrOk;
end;


procedure TF_AddPlanStru.lc_ParentStruChange(Sender: TObject);
begin
  e_Level.Enabled:=False;
  e_kod_sgr.Enabled:=False;
  e_kod_spg.Enabled:=False;
  e_kod_rzd.Enabled:=False;
  e_kod_prz.Enabled:=False;
  e_kod_grp.Enabled:=False;
  e_kod_pgr.Enabled:=False;

  if IsAdd then
    begin
      e_Level.Text:=IntToStr(q_ParentStru.fieldByName('level_pos').AsInteger+1);
      e_kod_sgr.Text:=q_ParentStru.fieldByName('kod_sgr').AsString;
      e_kod_spg.Text:=q_ParentStru.fieldByName('kod_spg').AsString;
      e_kod_rzd.Text:=q_ParentStru.fieldByName('kod_rzd').AsString;
      e_kod_prz.Text:=q_ParentStru.fieldByName('kod_prz').AsString;
      e_kod_grp.Text:=q_ParentStru.fieldByName('kod_grp').AsString;
      e_kod_pgr.Text:=q_ParentStru.fieldByName('kod_pgr').AsString;
      q_Tmp.SQL.Clear;
      case q_ParentStru.fieldByName('level_pos').AsInteger of
        1:
          begin
            q_Tmp.SQL.Add('SELECT max(kod_spg) FROM kls_planstru WHERE level_pos=2 AND kod_sgr='+q_ParentStru.fieldByName('kod_sgr').AsString);
            q_Tmp.Open;
            e_kod_spg.Text:=IntToStr(q_Tmp.Fields[0].AsInteger+10);
            e_kod_spg.Enabled:=True;
          end;
        2:
          begin
            q_Tmp.SQL.Add('SELECT max(kod_rzd) FROM kls_planstru WHERE level_pos=3 ');
            q_Tmp.SQL.Add(' AND kod_sgr='+q_ParentStru.fieldByName('kod_sgr').AsString);
            q_Tmp.SQL.Add(' AND kod_spg='+q_ParentStru.fieldByName('kod_spg').AsString);
            q_Tmp.Open;
            e_kod_rzd.Text:=IntToStr(q_Tmp.Fields[0].AsInteger+10);
            e_kod_rzd.Enabled:=True;
          end;
        3:
          begin
            q_Tmp.SQL.Add('SELECT max(kod_prz) FROM kls_planstru WHERE level_pos=4 ');
            q_Tmp.SQL.Add(' AND kod_sgr='+q_ParentStru.fieldByName('kod_sgr').AsString);
            q_Tmp.SQL.Add(' AND kod_spg='+q_ParentStru.fieldByName('kod_spg').AsString);
            q_Tmp.SQL.Add(' AND kod_rzd='+q_ParentStru.fieldByName('kod_rzd').AsString);
            q_Tmp.Open;
            e_kod_prz.Text:=IntToStr(q_Tmp.Fields[0].AsInteger+10);
            e_kod_prz.Enabled:=True;
          end;
        4:
          begin
            q_Tmp.SQL.Add('SELECT max(kod_grp) FROM kls_planstru WHERE level_pos=5 ');
            q_Tmp.SQL.Add(' AND kod_sgr='+q_ParentStru.fieldByName('kod_sgr').AsString);
            q_Tmp.SQL.Add(' AND kod_spg='+q_ParentStru.fieldByName('kod_spg').AsString);
            q_Tmp.SQL.Add(' AND kod_rzd='+q_ParentStru.fieldByName('kod_rzd').AsString);
            q_Tmp.SQL.Add(' AND kod_prz='+q_ParentStru.fieldByName('kod_prz').AsString);
            q_Tmp.Open;
            e_kod_grp.Text:=IntToStr(q_Tmp.Fields[0].AsInteger+10);
            e_kod_grp.Enabled:=True;
          end;
        5:
          begin
            q_Tmp.SQL.Add('SELECT max(kod_pgr) FROM kls_planstru WHERE level_pos=6 ');
            q_Tmp.SQL.Add(' AND kod_sgr='+q_ParentStru.fieldByName('kod_sgr').AsString);
            q_Tmp.SQL.Add(' AND kod_spg='+q_ParentStru.fieldByName('kod_spg').AsString);
            q_Tmp.SQL.Add(' AND kod_rzd='+q_ParentStru.fieldByName('kod_rzd').AsString);
            q_Tmp.SQL.Add(' AND kod_prz='+q_ParentStru.fieldByName('kod_prz').AsString);
            q_Tmp.SQL.Add(' AND kod_grp='+q_ParentStru.fieldByName('kod_grp').AsString);
            q_Tmp.Open;
            e_kod_pgr.Text:=IntToStr(q_Tmp.Fields[0].AsInteger+10);
            e_kod_pgr.Enabled:=True;
          end;
        6:
           MessageDlg('Это был самый низкий уровень',mtError,[mbOK],0);
      end;
    end;
  if q_tmp.Active then q_Tmp.Close;
end;

end.
