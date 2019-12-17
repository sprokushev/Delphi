unit disprep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB,variants,
  OracleData;

type
  Tf_disprep = class(TForm)
    cb_Month: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    e_year: TRxSpinEdit;
    GroupBox1: TGroupBox;
    time1: TDateTimePicker;
    Label3: TLabel;
    time2: TDateTimePicker;
    date1: TDateTimePicker;
    date2: TDateTimePicker;
    Label4: TLabel;
    FormStorage1: TFormStorage;
    ds_plan: TDataSource;
    q_plan: TADOQuery;
    q_fact: TADOQuery;
    q_grplp: TADOQuery;
    Label5: TLabel;
    date3: TDateTimePicker;
    q_reestr: TADOQuery;
    q_plankod_npr: TStringField;
    q_plannm_npr: TStringField;
    q_plankod_pos: TIntegerField;
    q_plankod_sgr: TIntegerField;
    q_plankod_spg: TIntegerField;
    q_plankod_rzd: TIntegerField;
    q_plannaim: TStringField;
    q_planplan: TBCDField;
    q_factkod_npr: TStringField;
    q_factnaim_pr: TStringField;
    q_factkod_pos: TIntegerField;
    q_factkod_sgr: TIntegerField;
    q_factkod_spg: TIntegerField;
    q_factkod_rzd: TIntegerField;
    q_factnaim: TStringField;
    q_factfact_bef: TBCDField;
    q_factfact_aft: TBCDField;
    q_reestrkod_npr: TStringField;
    q_reestrnaim_pr: TStringField;
    q_reestrkod_pos: TIntegerField;
    q_reestrkod_sgr: TIntegerField;
    q_reestrkod_spg: TIntegerField;
    q_reestrkod_rzd: TIntegerField;
    q_reestrnaim: TStringField;
    q_reestrval_zd: TBCDField;
    q_plankod_prz: TIntegerField;
    q_factkod_prz: TIntegerField;
    q_reestrkod_prz: TIntegerField;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    q_cmn: TADOQuery;
    ADOConnection1: TADOConnection;
    q_obpr: TOracleDataSet;
    q_obprKOD_NPR: TStringField;
    q_obprKOD_POS: TIntegerField;
    q_obprKOD_SGR: TIntegerField;
    q_obprKOD_SPG: TIntegerField;
    q_obprKOD_RZD: TIntegerField;
    q_obprKOD_PRZ: TIntegerField;
    q_obprNAIM: TStringField;
    q_obprPLAN: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure q_planBeforeOpen(DataSet: TDataSet);
    procedure q_factBeforeOpen(DataSet: TDataSet);
    procedure q_grplpBeforeOpen(DataSet: TDataSet);
    procedure q_reestrBeforeOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure q_obprBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    ReestrPath:string;
    PlanPostPath:string;
    procedure CalcRep(IsNew:boolean);
  public
    { Public declarations }
  end;

var
  f_disprep: Tf_disprep;

implementation

uses dateutil,main, ForFiles;

{$R *.DFM}

procedure Tf_disprep.FormCreate(Sender: TObject);
begin
  ReestrPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('ReestrPath'),false);
  PlanPostPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('PlanPostPath'),false);

  ADOConnection1.Close;
  ADOConnection1.Connected:=True;
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('SELECT MAX(date_ree) AS d_ree FROM "'+ReestrPath+'MOSC_REE.DBF"');
  q_cmn.Open;
  if q_cmn.RecordCount=1 then date3.date:=q_cmn.FieldByName('d_ree').AsdateTime
    else date3.date:=date-1;
  q_cmn.Close;
  if FormatDateTime('hh:mm:ss',Time)>'12:00:00' then
    begin
      time1.Time:=StrToTime('18:00:00');
      time2.Time:=StrToTime('18:00:00');
      date1.Date:=Date-1;
      date2.Date:=Date;
    end
  else
    begin
      time1.Time:=StrToTime('18:00:00');
      time2.Time:=StrToTime('06:00:00');
      date1.Date:=Date-1;
      date2.Date:=Date;
    end;
  cb_Month.ItemIndex:=ExtractMonth(Date1.Date)-1;
  e_year.Value:=ExtractYear(Date1.Date);
end;

procedure Tf_disprep.q_planBeforeOpen(DataSet: TDataSet);
var
  mon:String[2];
  year:String[2];
begin
  mon:=IntToStr(cb_Month.ItemIndex+1);
  if length(mon)<2 then mon:='0'+mon;
  year:=Copy(IntTostr(Round(e_year.value)),3,2);
  q_plan.SQL[10]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\grplp2.dbf" grplp2,';
  q_plan.SQL[11]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\PL_MOS2.DBF" pl_mos2';
end;

procedure Tf_disprep.CalcRep(IsNew:boolean);
var
  GR_Name,GR_Pos:String[255];
  i:integer;
  AKod_PRZ,AKod_SGR,AKod_SPG,AKod_RZD:Integer;
begin
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }

  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'F10_SHBL.DBF',f_main.TempLocalPath+'F10_SHBL.DBF');
  try
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'F10_SHBL.DBF"');
    q_cmn.ExecSQL;
    q_cmn.Close;
  except
  end;
  if q_plan.Active then q_plan.Close;
  q_plan.open;
  while not q_plan.EOF do
    begin
      q_cmn.Close;
      q_cmn.SQl.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F10_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,naim,plan,fact,night,reestr) VALUES (');
      q_cmn.SQL.Add(''''+q_plankod_npr.AsString+''',');
      q_cmn.SQL.Add(q_plankod_pos.AsString+',');
      q_cmn.SQL.Add(q_plankod_sgr.AsString+',');
      q_cmn.SQL.Add(q_plankod_spg.AsString+',');
      q_cmn.SQL.Add(q_plankod_rzd.AsString+',');
      q_cmn.SQL.Add(q_plankod_prz.AsString+',');
      q_cmn.SQL.Add(''''+q_planNaim.AsString+''',');
      q_cmn.SQL.Add(IntToStr(q_planPlan.AsInteger)+',0,0,0)');
      q_cmn.ExecSQL;
      q_cmn.Close;
      q_plan.Next;
    end;
  q_plan.Close;
  if q_obpr.Active then q_obpr.Close;
  q_obpr.open;
  while not q_obpr.EOF do
    begin
      for i:=1 to 4 do
        begin
          AKod_SGR:=q_obprKOD_SGR.AsInteger;
          if i>1 then AKod_SPG:=q_obprKOD_SPG.AsInteger else AKod_SPG:=0;
          if i>2 then AKod_RZD:=q_obprKOD_RZD.AsInteger else AKod_RZD:=0;
          if i>3 then AKod_PRZ:=q_obprKOD_PRZ.AsInteger else AKod_PRZ:=0;
          if ((i=4) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0) and (AKod_Prz<>0)) or
             ((i=3) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0)) or
             ((i=2) and (AKod_SGR<>0) and (AKod_Spg<>0)) or
             ((i=1) and (AKod_SGR<>0)) then
             begin
               q_grplp.Open;
               if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([AKOD_SGR,AKOD_SPG,AKOD_RZD,AKOD_PRZ,0]),[]) then
                 begin
                   gr_name:=q_grplp.FieldByName('naim').AsString;
                   gr_pos:=q_grplp.FieldByName('kod_pos').AsString
                 end
               else
                 begin
                   gr_name:=q_obprNaim.AsString;
                   gr_pos:=q_obprkod_npr.AsString;
                 end;
               q_grplp.Close;
               q_cmn.Close;
               q_cmn.SQl.Clear;
               q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F10_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,naim,plan,fact,night,reestr) VALUES (');
               q_cmn.SQL.Add(''''+q_obprkod_npr.AsString+''',');
               q_cmn.SQL.Add(gr_pos+',');
               q_cmn.SQL.Add(IntToStr(Akod_sgr)+',');
               q_cmn.SQL.Add(IntToStr(Akod_spg)+',');
               q_cmn.SQL.Add(IntToStr(Akod_rzd)+',');
               q_cmn.SQL.Add(IntToStr(Akod_prz)+',');
               q_cmn.SQL.Add(''''+gr_name+''',');
               q_cmn.SQL.Add(IntToStr(q_obprPlan.AsInteger)+',0,0,0)');
               q_cmn.ExecSQL;
               q_cmn.Close;
             end;
        end;
      q_obpr.Next;
    end;
  q_obpr.Close;
  if q_fact.Active then q_fact.close;
  q_fact.open;
  while not q_fact.Eof do
    begin
      for i:=1 to 4 do
        begin
          AKod_SGR:=q_factKOD_SGR.AsInteger;
          if i>1 then AKod_SPG:=q_factKOD_SPG.AsInteger else AKod_SPG:=0;
          if i>2 then AKod_RZD:=q_factKOD_RZD.AsInteger else AKod_RZD:=0;
          if i>3 then AKod_PRZ:=q_factKOD_PRZ.AsInteger else AKod_PRZ:=0;
          if ((i=4) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0) and (AKod_Prz<>0)) or
             ((i=3) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0)) or
             ((i=2) and (AKod_SGR<>0) and (AKod_Spg<>0)) or
             ((i=1) and (AKod_SGR<>0)) then
             begin
               q_grplp.Open;
               if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([AKOD_SGR,AKOD_SPG,AKOD_RZD,AKOD_PRZ,0]),[]) then
                 begin
                   gr_name:=q_grplp.FieldByName('naim').AsString;
                   gr_pos:=q_grplp.FieldByName('kod_pos').AsString
                 end
               else
                 begin
                   gr_name:=q_factNaim.AsString;
                   gr_pos:=q_Factkod_npr.AsString;
                 end;
               q_grplp.Close;
               q_cmn.Close;
               q_cmn.SQl.Clear;
               q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F10_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,naim,plan,fact,night,reestr) VALUES (');
               q_cmn.SQL.Add(''''+q_factKOD_NPR.AsString+''',');
               q_cmn.SQL.Add(gr_pos+',');
               q_cmn.SQL.Add(IntToStr(Akod_sgr)+',');
               q_cmn.SQL.Add(IntToStr(Akod_spg)+',');
               q_cmn.SQL.Add(IntToStr(Akod_rzd)+',');
               q_cmn.SQL.Add(IntToStr(Akod_prz)+',');
               q_cmn.SQL.Add(''''+gr_name+''',0,');
               q_cmn.SQL.Add(IntToStr(q_FactFact_Bef.AsInteger)+',');
               q_cmn.SQL.Add(IntToStr(q_FactFact_Aft.AsInteger)+',0)');
               q_cmn.ExecSQL;
               q_cmn.Close;
             end;
        end;
      q_fact.Next;
    end;
  q_fact.close;
  {Заполнение данных из реестра}
  if q_reestr.Active then q_reestr.close;
  q_reestr.open;
  while not q_reestr.Eof do
    begin
      for i:=1 to 4 do
        begin
          AKod_SGR:=q_reestrKOD_SGR.AsInteger;
          if i>1 then AKod_SPG:=q_reestrKOD_SPG.AsInteger else AKod_SPG:=0;
          if i>2 then AKod_RZD:=q_reestrKOD_RZD.AsInteger else AKod_RZD:=0;
          if i>3 then AKod_PRZ:=q_reestrKOD_PRZ.AsInteger else AKod_PRZ:=0;
          if ((i=4) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0) and (AKod_Prz<>0)) or
             ((i=3) and (AKod_SGR<>0) and (AKod_Spg<>0) and (AKod_Rzd<>0)) or
             ((i=2) and (AKod_SGR<>0) and (AKod_Spg<>0)) or
             ((i=1) and (AKod_SGR<>0)) then
             begin
               q_grplp.Open;
               if q_grplp.Locate('kod_sgr;kod_spg;kod_rzd;kod_prz;kod_grp',VarArrayOf([AKOD_SGR,AKOD_SPG,AKOD_RZD,AKOD_PRZ,0]),[]) then
                 begin
                   gr_name:=q_grplp.FieldByName('naim').AsString;
                   gr_pos:=q_grplp.FieldByName('kod_pos').AsString
                 end
               else
                 begin
                   gr_name:=q_reestrNaim.AsString;
                   gr_pos:=q_reestrkod_npr.AsString;
                 end;
               q_grplp.Close;
               q_cmn.Close;
               q_cmn.SQl.Clear;
               q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'F10_SHBL.DBF" (kod_npr,kod_pos,kod_sgr,kod_spg,kod_rzd,kod_prz,naim,plan,fact,night,reestr) VALUES (');
               q_cmn.SQL.Add(''''+q_reestrKOD_NPR.AsString+''',');
               q_cmn.SQL.Add(gr_pos+',');
               q_cmn.SQL.Add(IntToStr(Akod_sgr)+',');
               q_cmn.SQL.Add(IntToStr(Akod_spg)+',');
               q_cmn.SQL.Add(IntToStr(Akod_rzd)+',');
               q_cmn.SQL.Add(IntToStr(Akod_prz)+',');
               q_cmn.SQL.Add(''''+gr_name+''',0,0,0,');
               q_cmn.SQL.Add(IntToStr(q_reestrVAL_ZD.AsInteger)+')');
               q_cmn.ExecSQL;
               q_cmn.Close;
             end;
        end;
      q_reestr.Next;
    end;
  q_reestr.close;

  try
    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('CREATE TABLE "'+f_main.TempLocalPath+'f10_tm" (date_plan D,date1 D, time1 C(8), date2 D, time2 C(8), date3 D, date4 D, time4 C(8))');
    q_cmn.ExecSQL;
    q_cmn.Close;
  except
    try
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'f10_tm"');
      q_cmn.ExecSQL;
      q_cmn.Close;
    except
    end;
  end;
  q_cmn.Close;
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'f10_tm" (date_plan,date1,time1,date2,time2,date3,date4,time4) VALUES (');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1))+',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date1.date)+',');
  q_cmn.SQL.Add(''''+FormatDateTime('hh:mm:ss',Time1.time)+''',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.date)+',');
  q_cmn.SQL.Add(''''+FormatDateTime('hh:mm:ss',Time2.time)+''',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date3.date)+',');
  q_cmn.SQL.Add(FormatDateTime('"{"mm"/"dd"/"yyyy"}"',Date2.date)+',');
  q_cmn.SQL.Add('''00:00:00'')');
  q_cmn.ExecSQL;
  q_cmn.Close;

  F_FileUtils.CheckReport('F10.XLS',f_main.TempNetPath+'F10.XLS');
  F_FileUtils.ExecAndWait(f_main.TempNetPath+'F10.xls','',SW_SHOWMINIMIZED,false);
  Close;

  Screen.Cursor := crDefault;
end;

procedure Tf_disprep.q_factBeforeOpen(DataSet: TDataSet);
var
  t1,t2,t3:string;

begin
  t1:=FormatDateTime('yyyymmdd',date1.date)+FormatDateTime('hh:mm:ss',time1.time);
  t2:=FormatDateTime('yyyymmdd',date2.date)+FormatDateTime('hh:mm:ss',time2.time);
  t3:=FormatDateTime('yyyymmdd',date2.date)+'00:00:00';
  q_fact.SQl[8]:='sum(IIF(DTOS(np_data_o)+np_timep<"'+t3+'",kvit.ves*1000,0)) AS fact_bef,';
  q_fact.SQl[9]:='sum(IIF(DTOS(np_data_o)+np_timep>="'+t1+'",kvit.ves*1000,0)) AS fact_aft';
  q_fact.SQL[14]:='DTOS(np_data_o)+np_timep<"'+t2+'" AND';
  q_fact.SQL[15]:='  month.date_plan='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EncodeDate(Round(e_year.Value), cb_Month.ItemIndex+1, 1));
end;

procedure Tf_disprep.q_grplpBeforeOpen(DataSet: TDataSet);
var
  mon:String[2];
  year:String[2];
begin
  mon:=IntToStr(cb_Month.ItemIndex+1);
  if length(mon)<2 then mon:='0'+mon;
  year:=Copy(IntTostr(Round(e_year.value)),3,2);
  q_grplp.SQL[1]:='"'+PlanPostPath+'pl'+year+'_'+mon+'\grplp2.dbf" grplp2';
end;

procedure Tf_disprep.q_reestrBeforeOpen(DataSet: TDataSet);
begin
  q_reestr.SQL[14]:='mosc_ree.date_ree='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',date3.date);
end;

procedure Tf_disprep.BitBtn2Click(Sender: TObject);
begin
  CalcRep(true);
end;

procedure Tf_disprep.q_obprBeforeOpen(DataSet: TDataSet);
var
  mon:String[2];
  year:String[4];
begin
  mon:=IntToStr(cb_Month.ItemIndex+1);
  if length(mon)<2 then mon:='0'+mon;
  year:=IntTostr(Round(e_year.value));
  q_obpr.SQL[16]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE(''01.'+mon+'.'+year+''',''dd.mm.yyyy'') ';
end;

end.
