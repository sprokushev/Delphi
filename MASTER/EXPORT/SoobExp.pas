unit SoobExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, RXSpin, Placemnt, Db, ADODB, ExtCtrls, Grids, DBGrids,variants,
  OracleData;

type
  Tf_SoobExp = class(TForm)
    q_plan_fact: TADOQuery;
    q_fact_year: TADOQuery;
    q_cmn: TADOQuery;
    q_Exped: TADOQuery;
    PF_Conn: TADOConnection;
    q_MonthExped: TADOQuery;
    q_fact_prev_mon: TADOQuery;
    btCalc: TBitBtn;
    l_date1: TLabel;
    ed_Date: TDateTimePicker;
    q_fact_cur_mon: TADOQuery;
    q_Expedexped_name: TStringField;
    q_MonthExpedexped_kod: TIntegerField;
    q_Expedexped_kod: TIntegerField;
    q_gdplan_old: TADOQuery;
    q_planpost: TADOQuery;
    q_fact_sut: TADOQuery;
    q_zayv: TADOQuery;
    q_list: TADOQuery;
    q_seek: TADOQuery;
    t_pe_edit: TADOTable;
    t_pe_editplat_kod: TStringField;
    t_pe_editplat_name: TStringField;
    t_pe_editprod_kod: TStringField;
    t_pe_editprod_kod10: TStringField;
    t_pe_editkind_npr: TStringField;
    t_pe_editprod_fas: TStringField;
    t_pe_editprod_name: TStringField;
    t_pe_editstan_kod: TStringField;
    t_pe_editstan_name: TStringField;
    t_pe_editexped_kod: TStringField;
    t_pe_editexped_name: TStringField;
    t_pe_editvid_trans: TStringField;
    t_pe_editvid_tr_nam: TStringField;
    t_pe_editfact_year: TBCDField;
    t_pe_editplan_post: TBCDField;
    t_pe_editplan_gd: TBCDField;
    t_pe_editfact_mon: TBCDField;
    t_pe_editfact_sut: TBCDField;
    t_pe_editprich: TStringField;
    t_pe_editnum_dog: TStringField;
    t_pe_editsortby: TBCDField;
    t_pe_editnorma_mon: TBCDField;
    t_pe_editis_bad: TIntegerField;
    t_pe_editid: TBCDField;
    t_pe_editSortByInfo: TStringField;
    t_pe_editzapr_mps: TStringField;
    q_last: TADOQuery;
    q_obpr: TOracleDataSet;
    q_obprPLAT_KOD: TIntegerField;
    q_obprPLAT_NAME: TStringField;
    q_obprNUM_DOG: TStringField;
    q_obprPROD_KOD: TStringField;
    q_obprPROD_KOD10: TStringField;
    q_obprKIND_NPR: TStringField;
    q_obprPROD_NAME: TStringField;
    q_obprVID_TRANS: TStringField;
    q_obprOBPR: TFloatField;
    q_obprVID_TR_NAM: TStringField;
    t_pe_editplan_izm: TBCDField;
    t_pe_editobpr: TBCDField;
    q_allplan: TADOQuery;
    q_gdplan: TOracleDataSet;
    q_gdplanPLAT_ID: TIntegerField;
    q_gdplanPROD_GU12_ID: TStringField;
    q_gdplanSTAN_KOD: TIntegerField;
    q_gdplanEXPED_ID: TStringField;
    q_gdplanPLAN_GD: TFloatField;
    q_prod: TADOQuery;
    q_gdplanVID_TRANS: TStringField;
    q_gdplanVID_TR_NAM: TStringField;
    q_gdplanSTAN_NAME: TStringField;
    q_SvedExped: TADOQuery;
    q_KvitExped: TADOQuery;
    q_SvedExpedexped_kod: TIntegerField;
    q_KvitExpedexped_kod: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure q_fact_yearBeforeOpen(DataSet: TDataSet);
    procedure q_fact_prev_monBeforeOpen(DataSet: TDataSet);
    procedure q_fact_cur_monBeforeOpen(DataSet: TDataSet);
    procedure q_gdplan_oldBeforeOpen(DataSet: TDataSet);
    procedure q_planpostBeforeOpen(DataSet: TDataSet);
    procedure q_fact_sutBeforeOpen(DataSet: TDataSet);
    procedure q_zayvBeforeOpen(DataSet: TDataSet);
    procedure q_obprBeforeOpen(DataSet: TDataSet);
    procedure q_allplanBeforeOpen(DataSet: TDataSet);
    procedure q_gdplanBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    DbasesPath:string;
  public
    { Public declarations }
    str_kod_otgr:String;
    str_kod_otgr2:String;
    FlagExist:boolean;
    FlagNew:boolean;
    procedure CalculateRep;
    procedure FillToBase;
    procedure FillToTmp;
  end;


var
  f_SoobExp: Tf_SoobExp;

implementation

uses ForDB,dateutil,strutils,ForFiles,DateUtils,PrichExp, main;

{$R *.DFM}

procedure Tf_SoobExp.FormCreate(Sender: TObject);
begin
  DbasesPath:=F_FileUtils.FillFilePath(f_main.GetApplVari('DbasesPath'),false);

  ed_Date.Date:=Date-1;
end;

procedure Tf_SoobExp.FormActivate(Sender: TObject);
begin
  ClientHeight:=btCalc.Top+btCalc.Height+5;
end;


procedure Tf_SoobExp.CalculateRep;
var
  ZaprMPS,exped_kod,exped_name:string;
  exped_num:integer;
  Save_Cursor: TCursor;
  Koef,Koef2:double;
  Id,Norma:integer;
  IsBad:string;
  UpdId,PrichTxt:string;
  SumPlan,SumZayv:double;
  LastRep:TDateTime;
  PlanExist:boolean;
  prod_kod,prod_kod10,kind_npr,prod_name: string;

  // Обработка факта
  procedure FillFact(q_fact:TADOQuery);
  Begin
    q_fact.Open;
    while not q_fact.Eof do
    Begin
      if (Trim(q_fact.FieldByName('EXPED_KOD').AsString)='') or (Trim(q_fact.FieldByName('EXPED_KOD').AsString)='0') then
      Begin
        q_SvedExped.SQL[3]:='WHERE ALLT(nom_zd)=='''+Trim(q_fact.FieldByName('NOM_ZD').AsString)+''' and NP='+q_fact.FieldByName('NP').AsString;
        q_SvedExped.Open;
        if NOT q_SvedExped.Eof then
        Begin
          if q_SvedExpedEXPED_KOD.AsInteger<>0 then
            exped_num:=q_SvedExpedEXPED_KOD.AsInteger
          else
            exped_num:=0;
        End
        Else
        Begin
          exped_num:=0;
        End;
        q_SvedExped.Close;

        if exped_num=0 then
        Begin
          q_MonthExped.SQL[3]:='WHERE ALLT(nom_zd)=='''+Trim(q_fact.FieldByName('NOM_ZD').AsString)+'''';
          q_MonthExped.Open;
          if NOT q_MonthExped.Eof then
          Begin
            if q_MonthExpedEXPED_KOD.AsInteger<>0 then
              exped_num:=q_MonthExpedEXPED_KOD.AsInteger
            else
              exped_num:=5;
          End
          Else
          Begin
            exped_num:=5;
          End;
          q_MonthExped.Close;
        end;

        if exped_num=0 then
        Begin
          q_KvitExped.SQL[3]:='WHERE ALLT(nom_zd)=='''+Trim(q_fact.FieldByName('NOM_ZD').AsString)+'''';
          q_KvitExped.Open;
          if NOT q_KvitExped.Eof then
          Begin
            if q_KvitExpedEXPED_KOD.AsInteger<>0 then
              exped_num:=q_KvitExpedEXPED_KOD.AsInteger
            else
              exped_num:=0;
          End
          Else
          Begin
            exped_num:=0;
          End;
          q_KvitExped.Close;
        end;

      End
      Else exped_num:=q_fact.FieldByName('EXPED_KOD').AsInteger;

      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit1.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
      q_cmn.SQL.Add(''''+q_fact.FieldByName('PLAT_KOD').AsString+''','+
                    ''''+q_fact.FieldByName('PLAT_NAME').AsString+''','+
                    ''''+q_fact.FieldByName('PROD_KOD').AsString+''','+
                    ''''+q_fact.FieldByName('PROD_KOD10').AsString+''','+
                    ''''+q_fact.FieldByName('KIND_NPR').AsString+''','+
                    '''0'','+
                    ''''+q_fact.FieldByName('PROD_NAME').AsString+''','+
                    ''''+q_fact.FieldByName('STAN_KOD').AsString+''','+
                    ''''+q_fact.FieldByName('STAN_NAME').AsString+''','+
                    ''''+exped_kod+''','+
                    ''''+exped_name+''','+
                    ''''+Trim(q_fact.FieldByName('VID_TRANS').AsString)+''','+
                    ''''+q_fact.FieldByName('VID_TR_NAM').AsString+''','+
                    q_fact.FieldByName('FACT_YEAR').AsString+','+
                    '0,0,0,'+{q_fact.FieldByName('ZAYV_MON').AsString+','+}
                    '0,'+
                    '0,'+
                    q_fact.FieldByName('FACT_MON').AsString+','+
                    '0,'+
                    q_fact.FieldByName('FACT_SUT').AsString+','+
                    ''' '','+
                    ''''+Trim(q_fact.FieldByName('NUM_DOG').AsString)+''',0,3,'''')');
      q_cmn.ExecSQL;
      q_fact.Next;
    End;
    q_fact.Close;
  End;

begin
  Screen.Cursor := crHourGlass;    { Show hourglass cursor }

  Id:=0;

  if true then
  begin
    // Подготовка файлов
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe_shab.DBF',f_main.TempLocalPath+'pe_edit1.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe_edit1.DBF"');
      q_cmn.ExecSQL;
    except
    end;
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe_shab.DBF',f_main.TempLocalPath+'pe_edit2.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
      q_cmn.ExecSQL;
    except
    end;
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe_shab.DBF',f_main.TempLocalPath+'pe_edit3.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe_edit3.DBF"');
      q_cmn.ExecSQL;
    except
    end;
    F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe_plan.DBF',f_main.TempLocalPath+'pe_plan.DBF');
    try
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe_plan.DBF"');
      q_cmn.ExecSQL;
    except
    end;

    q_Exped.Open;

    // Отгрузка с начала года по 1 число предыдущего месяца
    FillFact(q_fact_year);

    // Отгрузка с 1 числа предыдущего месяца по 1 число текущего
    FillFact(q_fact_prev_mon);

    // Отгрузка за текущий месяц
    FillFact(q_fact_cur_mon);

    // Отгрузка за отчетную дату
    FillFact(q_fact_sut);

    // Группируем факт
    q_plan_fact.SQL[25]:='FROM "'+f_main.TempLocalPath+'pe_edit1.DBF"';
    q_plan_fact.Open;
    while not q_plan_fact.EOF do
    begin
      id:=id+1;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit2.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
      q_cmn.SQL.Add(''''+q_plan_fact.FieldByName('PLAT_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PLAT_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD10').AsString+''','+
                    ''''+q_plan_fact.FieldByName('KIND_NPR').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_FAS').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_NAME').AsString+''','+
                    ''''+Trim(q_plan_fact.FieldByName('VID_TRANS').AsString)+''','+
                    ''''+q_plan_fact.FieldByName('VID_TR_NAM').AsString+''','+
                    q_plan_fact.FieldByName('FACT_YEAR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_POST').AsString+','+
                    q_plan_fact.FieldByName('PLAN_IZM').AsString+','+
                    q_plan_fact.FieldByName('OBPR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_GD').AsString+','+
                    '0,'+
                    q_plan_fact.FieldByName('FACT_MON').AsString+','+
                    '0,'+
                    q_plan_fact.FieldByName('FACT_SUT').AsString+','+
                    ''' '','+
                    ''''+Trim(q_plan_fact.FieldByName('NUM_DOG').AsString)+''','+
                    IntToStr(Id)+','+
                    q_plan_fact.FieldByName('SORTBY').AsString+','''')');
      q_cmn.ExecSQL;
      q_plan_fact.Next;
    end;
    q_plan_fact.Close;

    // Заявлено
    q_zayv.Open;
    while not q_zayv.Eof do
    Begin
      q_KvitExped.SQL[3]:='WHERE ALLT(nom_zd)=='''+Trim(q_zayv.FieldByName('NOM_ZD').AsString)+'''';
      q_KvitExped.Open;
      if NOT q_KvitExped.Eof then
      Begin
        if q_KvitExpedEXPED_KOD.AsInteger<>0 then
          exped_num:=q_KvitExpedEXPED_KOD.AsInteger
        else
          exped_num:=q_zayv.FieldByName('exped_kod').AsInteger;
      End
      Else
      Begin
        exped_num:=q_zayv.FieldByName('exped_kod').AsInteger;
      End;
      q_KvitExped.Close;

      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      UpdId:='';

      // Ищем подходящую отгрузку (Договор, Плательщик, Продукт, Станция, Экспедитор, Факт)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_zayv.FieldByName('num_dog').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_zayv.FieldByName('plat_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_zayv.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(stan_kod)=='''+Trim(q_zayv.FieldByName('stan_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
        q_cmn.SQL.Add('AND fact_mon<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Договор, Плательщик, Продукт, Станция, Экспедитор)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_zayv.FieldByName('num_dog').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_zayv.FieldByName('plat_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_zayv.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(stan_kod)=='''+Trim(q_zayv.FieldByName('stan_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
//        q_cmn.SQL.Add('AND fact_mon<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

{      // Ищем подходящую отгрузку (Договор, Плательщик, Продукт, Станция, Факт)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_zayv.FieldByName('num_dog').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_zayv.FieldByName('plat_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_zayv.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(stan_kod)=='''+Trim(q_zayv.FieldByName('stan_kod').AsString)+'''');
        q_cmn.SQL.Add('AND fact_mon<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Договор, Плательщик, Продукт, Станция)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_zayv.FieldByName('num_dog').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_zayv.FieldByName('plat_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_zayv.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND ALLT(stan_kod)=='''+Trim(q_zayv.FieldByName('stan_kod').AsString)+'''');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;}

      q_cmn.Close;
      q_cmn.SQL.Clear;
      If UpdId<>'' then
      Begin
        // Обновляем заявлено
        q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET plan_post=plan_post+'+
            q_zayv.FieldByName('ZAYV_MON').AsString+' WHERE id='+UpdId);
      end
      else
      Begin
        // Добавляем строку заявлено в PE_EDIT2, если продукт еще не заявлялся
        Id:=Id+1;
        q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit2.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
        q_cmn.SQL.Add(''''+q_zayv.FieldByName('PLAT_KOD').AsString+''','+
                      ''''+q_zayv.FieldByName('PLAT_NAME').AsString+''','+
                      ''''+q_zayv.FieldByName('PROD_KOD').AsString+''','+
                      ''''+q_zayv.FieldByName('PROD_KOD10').AsString+''','+
                      ''''+q_zayv.FieldByName('KIND_NPR').AsString+''','+
                      '''0'','+
                      ''''+q_zayv.FieldByName('PROD_NAME').AsString+''','+
                      ''''+q_zayv.FieldByName('STAN_KOD').AsString+''','+
                      ''''+q_zayv.FieldByName('STAN_NAME').AsString+''','+
                      ''''+exped_kod+''','+
                      ''''+exped_name+''','+
                      ''''+Trim(q_zayv.FieldByName('VID_TRANS').AsString)+''','+
                      ''''+q_zayv.FieldByName('VID_TR_NAM').AsString+''','+
                      '0,'+
                      q_zayv.FieldByName('ZAYV_MON').AsString+','+
                      '0,0,0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      ''' '','+
                      ''''+Trim(q_zayv.FieldByName('NUM_DOG').AsString)+''','+IntToStr(Id)+',2,'''')');
      End;
      q_cmn.ExecSQL;

      q_zayv.Next;
    End;
    q_zayv.Close;

    // План поставок - первоначальный (в PE_PLAN)
    q_planpost.Open;
    while not q_planpost.Eof do
    Begin
      exped_num:=5;
      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      Id:=Id+1;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_plan.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                            'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                            'plan_post,plan_izm,obpr,num_dog,id) VALUES (');
      q_cmn.SQL.Add(''''+q_planpost.FieldByName('PLAT_KOD').AsString+''','+
                        ''''+q_planpost.FieldByName('PLAT_NAME').AsString+''','+
                        ''''+q_planpost.FieldByName('PROD_KOD').AsString+''','+
                        ''''+q_planpost.FieldByName('PROD_KOD10').AsString+''','+
                        ''''+q_planpost.FieldByName('KIND_NPR').AsString+''','+
                        '''0'','+
                        ''''+q_planpost.FieldByName('PROD_NAME').AsString+''','+
                        ''' '','+
                        ''' '','+
                        ''''+exped_kod+''','+
                        ''''+exped_name+''','+
                        ''''+Trim(q_planpost.FieldByName('VID_TRANS').AsString)+''','+
                        ''''+q_planpost.FieldByName('VID_TR_NAM').AsString+''','+
                        q_planpost.FieldByName('PLAN_POST').AsString+','+
                        '0,0,'+
                        ''''+Trim(q_planpost.FieldByName('NUM_DOG').AsString)+''','+IntToStr(Id)+')');
      q_cmn.ExecSQL;
      q_planpost.Next;
    End;
    q_planpost.Close;

    // ОБПР (в PE_PLAN)
    q_obpr.Open;
    while not q_obpr.Eof do
    Begin
      exped_num:=5;
      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      Id:=Id+1;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_plan.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                              'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                              'plan_post,plan_izm,obpr,num_dog,id) VALUES (');
      q_cmn.SQL.Add(''''+q_obpr.FieldByName('PLAT_KOD').AsString+''','+
                          ''''+q_obpr.FieldByName('PLAT_NAME').AsString+''','+
                          ''''+q_obpr.FieldByName('PROD_KOD').AsString+''','+
                          ''''+q_obpr.FieldByName('PROD_KOD10').AsString+''','+
                          ''''+q_obpr.FieldByName('KIND_NPR').AsString+''','+
                          '''0'','+
                          ''''+q_obpr.FieldByName('PROD_NAME').AsString+''','+
                          ''' '','+
                          ''' '','+
                          ''''+exped_kod+''','+
                          ''''+exped_name+''','+
                          ''''+Trim(q_obpr.FieldByName('VID_TRANS').AsString)+''','+
                          ''''+q_obpr.FieldByName('VID_TR_NAM').AsString+''','+
                          '0,0,'+
                          q_obpr.FieldByName('OBPR').AsString+','+
                          ''''+Trim(q_obpr.FieldByName('NUM_DOG').AsString)+''','+IntToStr(Id)+')');
      q_cmn.ExecSQL;
      q_obpr.Next;
    End;
    q_obpr.Close;

    // План поставок (в PE_EDIT3)
    q_allplan.Open;
    while not q_allplan.Eof do
    Begin
      exped_num:=5;
      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      // Всего заявлено
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('SELECT SUM(plan_post) as sum_zayv FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
      q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_allplan.FieldByName('num_dog').AsString)+'''');
      q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_allplan.FieldByName('plat_kod').AsString)+'''');
      q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_allplan.FieldByName('prod_kod').AsString)+'''');
      q_cmn.Open;
      if not q_cmn.Eof then
        SumZayv:=q_cmn.FieldByName('SUM_ZAYV').AsFloat
      else
        SumZayv:=0;

      // Определяем нераспределенный план
      SumPlan:=q_allplan.FieldByName('PLAN_POST').AsFloat-SumZayv;

      if SumPlan>0 then
      Begin
        // Есть нераспределенный план - добавляем
        Id:=Id+1;

        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit3.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                            'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                            'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
        q_cmn.SQL.Add(''''+q_allplan.FieldByName('PLAT_KOD').AsString+''','+
                        ''''+q_allplan.FieldByName('PLAT_NAME').AsString+''','+
                        ''''+q_allplan.FieldByName('PROD_KOD').AsString+''','+
                        ''''+q_allplan.FieldByName('PROD_KOD10').AsString+''','+
                        ''''+q_allplan.FieldByName('KIND_NPR').AsString+''','+
                        '''0'','+
                        ''''+q_allplan.FieldByName('PROD_NAME').AsString+''','+
                        ''' '','+
                        ''' '','+
                        ''''+exped_kod+''','+
                        ''''+exped_name+''','+
                        ''''+Trim(q_allplan.FieldByName('VID_TRANS').AsString)+''','+
                        ''''+q_allplan.FieldByName('VID_TR_NAM').AsString+''','+
                        '0,'+
                        FloatToStr(SumPlan)+','+
                        '0,'+
                        '0,0,'+
                        '0,'+
                        '0,'+
                        '0,'+
                        '0,'+
                        ''' '','+
                        ''''+Trim(q_allplan.FieldByName('NUM_DOG').AsString)+''','+IntToStr(Id)+',2,'''')');
        q_cmn.ExecSQL;
      end
      else
      if SumPlan<0 then
      begin
        // Заявлено больше плана
        q_list.Close;
        q_list.SQL.Clear;
        q_list.SQL.Add('SELECT ID,plan_post as sum_zayv FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_list.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_allplan.FieldByName('num_dog').AsString)+'''');
        q_list.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_allplan.FieldByName('plat_kod').AsString)+'''');
        q_list.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_allplan.FieldByName('prod_kod').AsString)+'''');
        q_list.SQL.Add('AND plan_post<>0');
        q_list.Open;
        q_list.First;

        while not q_list.Eof do
        Begin
          q_cmn.SQL.Clear;
          SumZayv:=q_list.FieldByName('sum_zayv').AsFloat+SumPlan;
          if SumZayv < 0 then
          Begin
            // Обнуляем заявлено/план
            q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET plan_post=0 WHERE id='+q_list.FieldByName('ID').AsString);
            SumPlan:=SumZayv;
          End
          Else
          Begin
            // Уменьшаем заявлено до реального плана
            q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET plan_post='+FloatToStr(SumZayv)+' WHERE id='+q_list.FieldByName('ID').AsString);
            SumPlan:=0;
          End;
          q_cmn.ExecSQL;
          q_list.Next;
        End;
        q_list.Close;
      End;

      // ОБПР
      if q_allplan.FieldByName('OBPR').AsFloat<>0 then
      Begin
        UpdId:='';

        // Ищем подходящую отгрузку (Договор, Плательщик, Продукт, Экспедитор, Факт)
        If UpdId='' then
        try
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
          q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_allplan.FieldByName('num_dog').AsString)+'''');
          q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_allplan.FieldByName('plat_kod').AsString)+'''');
          q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_allplan.FieldByName('prod_kod').AsString)+'''');
          q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
          q_cmn.SQL.Add('AND fact_mon<>0');
          q_cmn.Open;
          if not q_cmn.Eof then
            UpdId:=q_cmn.FieldByName('ID').AsString
          else
            UpdId:='';
        except
          UpdId:='';
        end;

        q_cmn.Close;
        q_cmn.SQL.Clear;
        If UpdId<>'' then
        Begin
          // Обновляем ОБПР в PE_EDIT2
          q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET obpr=obpr+'+
              q_allplan.FieldByName('OBPR').AsString+' WHERE id='+UpdId);
        end
        else
        Begin
          // Добавляем строку ОБПР в PE_EDIT3
          Id:=Id+1;
          q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit3.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                                'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                                'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
          q_cmn.SQL.Add(''''+q_allplan.FieldByName('PLAT_KOD').AsString+''','+
                            ''''+q_allplan.FieldByName('PLAT_NAME').AsString+''','+
                            ''''+q_allplan.FieldByName('PROD_KOD').AsString+''','+
                            ''''+q_allplan.FieldByName('PROD_KOD10').AsString+''','+
                            ''''+q_allplan.FieldByName('KIND_NPR').AsString+''','+
                            '''0'','+
                            ''''+q_allplan.FieldByName('PROD_NAME').AsString+''','+
                            ''' '','+
                            ''' '','+
                            ''''+exped_kod+''','+
                            ''''+exped_name+''','+
                            ''''+Trim(q_allplan.FieldByName('VID_TRANS').AsString)+''','+
                            ''''+q_allplan.FieldByName('VID_TR_NAM').AsString+''','+
                            '0,0,0,'+
                            q_allplan.FieldByName('OBPR').AsString+','+
                            '0,'+
                            '0,'+
                            '0,'+
                            '0,'+
                            '0,'+
                            ''' '','+
                            ''''+Trim(q_allplan.FieldByName('NUM_DOG').AsString)+''','+IntToStr(Id)+',2,'''')');
        end;
        q_cmn.ExecSQL;
      End;

      q_allplan.Next;
    End;
    q_allplan.Close;


    // Ж/д план
    q_gdplan.Open;
    while not q_gdplan.Eof do
    Begin
{      exped_num:=5;
      if q_Exped.Locate('exped_kod',exped_num,[]) then
      begin
        exped_kod:=q_ExpedEXPED_KOD.AsString;
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      UpdId:='';

      // Ищем подходящую отгрузку (Продукт, Экспедитор, Факт)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+Trim(exped_kod)+'''');
        q_cmn.SQL.Add('AND fact_mon<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Продукт, Экспедитор, План поставок)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+Trim(exped_kod)+'''');
        q_cmn.SQL.Add('AND PLAN_POST<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Продукт, План поставок)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.SQL.Add('AND PLAN_POST<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Продукт, Факт)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.SQL.Add('AND fact_mon<>0');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Продукт, Экспедитор)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.SQL.Add('AND exped_kod='''+exped_kod+'''');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;

      // Ищем подходящую отгрузку (Продукт)
      If UpdId='' then
      try
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('SELECT Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"');
        q_cmn.SQL.Add('WHERE ALLT(prod_kod)=='''+Trim(q_gdplan.FieldByName('prod_kod').AsString)+'''');
        q_cmn.SQL.Add('AND num_dog<>'' ''');
        q_cmn.Open;
        if not q_cmn.Eof then
          UpdId:=q_cmn.FieldByName('ID').AsString
        else
          UpdId:='';
      except
        UpdId:='';
      end;
      }

      exped_kod:=Trim(q_gdplan.FieldByName('exped_id').AsString);
      // Заменяем Севзаптранс на МНОС
      if exped_kod='2' then exped_kod:='5';

      q_Prod.Locate('kod_gu12',q_gdplan.FieldByName('prod_gu12_id').AsString,[]);
      prod_kod:=q_Prod.FieldByName('KOD').AsString;
      prod_kod10:=q_Prod.FieldByName('KOD_10').AsString;
      kind_npr:=q_Prod.FieldByName('KIND_NPR').AsString;
      prod_name:=q_Prod.FieldByName('NAIM_PR').AsString;

      UpdId:='';

      if (q_gdplan.FieldByName('plat_id').AsString<>'') AND (q_gdplan.FieldByName('plat_id').AsString<>'0') then
      Begin

        // Ищем подходящую отгрузку (Плательщик, Продукт, Станция, Экспедитор, Факт)
        If UpdId='' then
        try
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('SELECT pe_edit2.Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF","U:\LUK\DBASES\prod.dbf"');
          q_cmn.SQL.Add('WHERE ALLT(pe_edit2.prod_kod)==ALLT(prod.kod)');
          q_cmn.SQL.Add('AND ALLT(prod.kod_gu12)=='''+Trim(q_gdplan.FieldByName('prod_gu12_id').AsString)+'''');
          q_cmn.SQL.Add('AND VAL(plat_kod)='+Trim(q_gdplan.FieldByName('plat_id').AsString));
          q_cmn.SQL.Add('AND VAL(stan_kod)='+Trim(q_gdplan.FieldByName('stan_kod').AsString));
          q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
          q_cmn.SQL.Add('AND (fact_mon<>0 OR plan_post<>0)');
  //        q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.Open;
          if not q_cmn.Eof then
            UpdId:=q_cmn.FieldByName('ID').AsString
          else
            UpdId:='';
        except
          UpdId:='';
        end;

        // Ищем подходящую отгрузку (Плательщик, Продукт, Станция, Экспедитор)
        If UpdId='' then
        try
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('SELECT pe_edit2.Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF","U:\LUK\DBASES\prod.dbf"');
          q_cmn.SQL.Add('WHERE ALLT(pe_edit2.prod_kod)==ALLT(prod.kod)');
          q_cmn.SQL.Add('AND ALLT(prod.kod_gu12)=='''+Trim(q_gdplan.FieldByName('prod_gu12_id').AsString)+'''');
          q_cmn.SQL.Add('AND VAL(plat_kod)='+Trim(q_gdplan.FieldByName('plat_id').AsString));
          q_cmn.SQL.Add('AND VAL(stan_kod)='+Trim(q_gdplan.FieldByName('stan_kod').AsString));
          q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
          q_cmn.Open;
          if not q_cmn.Eof then
            UpdId:=q_cmn.FieldByName('ID').AsString
          else
            UpdId:='';
        except
          UpdId:='';
        end;
      end
      else
      Begin
        // Ищем подходящую отгрузку (Продукт, Станция, Экспедитор, Факт)
        If UpdId='' then
        try
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('SELECT pe_edit2.Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF","U:\LUK\DBASES\prod.dbf"');
          q_cmn.SQL.Add('WHERE ALLT(pe_edit2.prod_kod)==ALLT(prod.kod)');
          q_cmn.SQL.Add('AND ALLT(prod.kod_gu12)=='''+Trim(q_gdplan.FieldByName('prod_gu12_id').AsString)+'''');
          q_cmn.SQL.Add('AND VAL(stan_kod)='+Trim(q_gdplan.FieldByName('stan_kod').AsString));
          q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
          q_cmn.SQL.Add('AND (fact_mon<>0 OR plan_post<>0)');
  //        q_cmn.SQL.SaveToFile('c:\tmp\1.sql');
          q_cmn.Open;
          if not q_cmn.Eof then
            UpdId:=q_cmn.FieldByName('ID').AsString
          else
            UpdId:='';
        except
          UpdId:='';
        end;

        // Ищем подходящую отгрузку (Продукт, Станция, Экспедитор)
        If UpdId='' then
        try
          q_cmn.Close;
          q_cmn.SQL.Clear;
          q_cmn.SQL.Add('SELECT pe_edit2.Id FROM "'+f_main.TempLocalPath+'pe_edit2.DBF","U:\LUK\DBASES\prod.dbf"');
          q_cmn.SQL.Add('WHERE ALLT(pe_edit2.prod_kod)==ALLT(prod.kod)');
          q_cmn.SQL.Add('AND ALLT(prod.kod_gu12)=='''+Trim(q_gdplan.FieldByName('prod_gu12_id').AsString)+'''');
          q_cmn.SQL.Add('AND VAL(stan_kod)='+Trim(q_gdplan.FieldByName('stan_kod').AsString));
          q_cmn.SQL.Add('AND ALLT(exped_kod)=='''+exped_kod+'''');
          q_cmn.Open;
          if not q_cmn.Eof then
            UpdId:=q_cmn.FieldByName('ID').AsString
          else
            UpdId:='';
        except
          UpdId:='';
        end;
      end;

      q_cmn.Close;
      q_cmn.SQL.Clear;

      if q_Exped.Locate('exped_kod',StrToInt(exped_kod),[]) then
      begin
        exped_name:=q_ExpedEXPED_NAME.AsString;
      End
      Else
      Begin
        exped_kod:=' ';
        exped_name:=' ';
      End;

      If UpdId<>'' then
      Begin
        // Обновляем ж/д план
        q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET plan_gd='+
            q_gdplan.FieldByName('PLAN_GD').AsString+' WHERE id='+UpdId);
        q_cmn.ExecSQL;
      end
      else
      Begin
        // Добавляем строку плана, если продукт еще не заявлялся
        Id:=Id+1;
        q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit2.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
        q_cmn.SQL.Add('''999999'','+
                      '''Отгрузка без реквизитов'','+
                      ''''+PROD_KOD+''','+
                      ''''+PROD_KOD10+''','+
                      ''''+KIND_NPR+''','+
                      '''0'','+
                      ''''+PROD_NAME+''','+
                      ''''+Trim(q_gdplan.FieldByName('stan_kod').AsString)+''','+
                      ''''+Trim(q_gdplan.FieldByName('stan_name').AsString)+''','+
                      ''''+exped_kod+''','+
                      ''''+exped_name+''','+
                      ''''+Trim(q_gdplan.FieldByName('VID_TRANS').AsString)+''','+
                      ''''+q_gdplan.FieldByName('VID_TR_NAM').AsString+''','+
                      '0,'+
                      '0,0,0,'+
                      q_gdplan.FieldByName('PLAN_GD').AsString+','+
                      '0,'+
                      '0,'+
                      '0,'+
                      '0,'+
                      ''' '','+
                      ''' '','+IntToStr(Id)+',1,'''')');
        q_cmn.ExecSQL;
      End;

      q_gdplan.Next;
    End;
    q_gdplan.Close;


    // Убираем заявлено, если нет плана
    q_plan_fact.SQL[0]:='SELECT id,';
    q_plan_fact.SQL[25]:='FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"';
    q_plan_fact.Open;
    while not q_plan_fact.EOF do
    begin

      // Проверяем наличие плана
      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('SELECT COUNT(*) as cnt1 FROM "'+f_main.TempLocalPath+'pe_plan.DBF"');
      q_cmn.SQL.Add('WHERE ALLT(num_dog)=='''+Trim(q_plan_fact.FieldByName('num_dog').AsString)+'''');
      q_cmn.SQL.Add('AND ALLT(plat_kod)=='''+Trim(q_plan_fact.FieldByName('plat_kod').AsString)+'''');
      q_cmn.SQL.Add('AND ALLT(prod_kod)=='''+Trim(q_plan_fact.FieldByName('prod_kod').AsString)+'''');
      q_cmn.Open;
      PlanExist:=false;
      if not q_cmn.Eof then
        if q_cmn.FieldByName('cnt1').AsInteger>0 then
          PlanExist:=true;
      IF NOT PlanExist then
      Begin
        // Убираем план
        q_cmn.Close;
        q_cmn.SQL.Clear;
        q_cmn.SQL.Add('UPDATE "'+f_main.TempLocalPath+'pe_edit2.DBF" SET plan_post=0 WHERE id='+q_Plan_fact.FieldByName('ID').AsString);
        q_cmn.ExecSQL;
      End;
      q_plan_fact.Next;
    end;
    q_plan_fact.Close;
    q_plan_fact.SQL[0]:='SELECT ';

    // Группируем план
    q_plan_fact.SQL[25]:='FROM "'+f_main.TempLocalPath+'pe_edit3.DBF"';
    q_plan_fact.Open;
    while not q_plan_fact.EOF do
    begin
      id:=id+1;

      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit2.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
      q_cmn.SQL.Add(''''+q_plan_fact.FieldByName('PLAT_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PLAT_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD10').AsString+''','+
                    ''''+q_plan_fact.FieldByName('KIND_NPR').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_FAS').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_NAME').AsString+''','+
                    ''''+Trim(q_plan_fact.FieldByName('VID_TRANS').AsString)+''','+
                    ''''+q_plan_fact.FieldByName('VID_TR_NAM').AsString+''','+
                    q_plan_fact.FieldByName('FACT_YEAR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_POST').AsString+','+
                    q_plan_fact.FieldByName('PLAN_IZM').AsString+','+
                    q_plan_fact.FieldByName('OBPR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_GD').AsString+','+
                    '0,'+
                    q_plan_fact.FieldByName('FACT_MON').AsString+','+
                    '0,'+
                    q_plan_fact.FieldByName('FACT_SUT').AsString+','+
                    ''' '','+
                    ''''+Trim(q_plan_fact.FieldByName('NUM_DOG').AsString)+''','+
                    IntToStr(Id)+','+
                    q_plan_fact.FieldByName('SORTBY').AsString+','''')');
      q_cmn.ExecSQL;
      q_plan_fact.Next;
    end;
    q_plan_fact.Close;


    // План-факт
    Koef:=DayOfTheMonth(ed_Date.Date)/DaysInMonth(ed_Date.Date);

    Id:=0;

    q_cmn.Close;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('SELECT MAX(rep_date) as max_rep FROM "U:\LUK\DBASES\soob_exp.dbf" WHERE rep_date>='+
      FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheMonth(ed_date.Date)));
    q_cmn.Open;
    if not q_cmn.Eof then
      LastRep:=q_cmn.FieldByName('max_rep').asDateTime
    else
      LastRep:=ed_Date.Date;
    q_cmn.Close;

    q_last.Close;
    q_last.SQL.Clear;
    q_last.SQL.Add('SELECT * FROM "U:\LUK\DBASES\soob_exp.dbf" WHERE rep_date='+
        FormatDateTime('"{"mm"/"dd"/"yyyy"}"',LastRep));
    q_last.Open;

    q_plan_fact.SQL[25]:='FROM "'+f_main.TempLocalPath+'pe_edit2.DBF"';
    q_plan_fact.Open;
    while not q_plan_fact.EOF do
    begin
      id:=id+1;
      if {(q_plan_fact.FieldByName('SORTBY').AsInteger=3) AND}
         ((q_plan_fact.FieldByName('PLAN_POST').AsInteger<>0) OR (q_plan_fact.FieldByName('FACT_MON').AsInteger<>0)) then
      Begin
        Norma:=Round(Koef*q_plan_fact.FieldByName('PLAN_POST').AsInteger);
        if q_plan_fact.FieldByName('PLAN_POST').AsInteger=0 then
          Koef2:=1
        Else
          Koef2:=q_plan_fact.FieldByName('FACT_MON').AsInteger/q_plan_fact.FieldByName('PLAN_POST').AsInteger;
        IF (Koef*100 - Koef2*100)>=10 then
          IsBad:='2'
        Else
          IF (Koef*100 - Koef2*100)<0 then
            IsBad:='1'
          Else
            IsBad:='0';
      End
      Else
      Begin
        Norma:=0;
        IsBad:='0';
      End;

      // Определяем наличие запрета в этом месяце (берем из предыдущего отчета)
      ZaprMPS:='';
      if q_last.Locate('plat_kod;prod_kod;stan_kod;exped_kod;vid_trans;num_dog',
               VarArrayOf([q_plan_fact.FieldByName('plat_kod').AsString,q_plan_fact.FieldByName('prod_kod').AsString,
                           q_plan_fact.FieldByName('stan_kod').AsString,q_plan_fact.FieldByName('exped_kod').AsString,
                           q_plan_fact.FieldByName('vid_trans').AsString,q_plan_fact.FieldByName('num_dog').AsString]),[]) then
      Begin
        ZaprMPS:=q_last.FieldByName('zapr_mps').AsString;
      End;

      PrichTxt:='';
      // Проставить причину и запрет из отчета за отчетный день - если это перерасчет
      if q_seek.Locate('plat_kod;prod_kod;stan_kod;exped_kod;vid_trans;num_dog',
             VarArrayOf([q_plan_fact.FieldByName('plat_kod').AsString,q_plan_fact.FieldByName('prod_kod').AsString,
                         q_plan_fact.FieldByName('stan_kod').AsString,q_plan_fact.FieldByName('exped_kod').AsString,
                         q_plan_fact.FieldByName('vid_trans').AsString,q_plan_fact.FieldByName('num_dog').AsString]),[]) then
      Begin
        PrichTxt:=q_seek.FieldByName('prich').AsString;
        ZaprMPS:=q_seek.FieldByName('zapr_mps').AsString;
      End;

      if PrichTxt='' then
        if (q_plan_fact.FieldByName('SORTBY').AsInteger=3) then
          If IsBad='1' Then
            PrichTxt:='Отгрузка завершена'
          else
            If IsBad='2' Then
              PrichTxt:='Отгрузка по графику ЛУКОЙЛ-СНП'
            else
              PrichTxt:=''
        else
          PrichTxt:='';

      q_cmn.Close;
      q_cmn.SQL.Clear;
      q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                        'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                        'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
      q_cmn.SQL.Add(''''+q_plan_fact.FieldByName('PLAT_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PLAT_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_KOD10').AsString+''','+
                    ''''+q_plan_fact.FieldByName('KIND_NPR').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_FAS').AsString+''','+
                    ''''+q_plan_fact.FieldByName('PROD_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('STAN_NAME').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_KOD').AsString+''','+
                    ''''+q_plan_fact.FieldByName('EXPED_NAME').AsString+''','+
                    ''''+Trim(q_plan_fact.FieldByName('VID_TRANS').AsString)+''','+
                    ''''+q_plan_fact.FieldByName('VID_TR_NAM').AsString+''','+
                    q_plan_fact.FieldByName('FACT_YEAR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_POST').AsString+','+
                    q_plan_fact.FieldByName('PLAN_IZM').AsString+','+
                    q_plan_fact.FieldByName('OBPR').AsString+','+
                    q_plan_fact.FieldByName('PLAN_GD').AsString+','+
                    IntToStr(Norma)+','+
                    q_plan_fact.FieldByName('FACT_MON').AsString+','+
                    IsBad+','+
                    q_plan_fact.FieldByName('FACT_SUT').AsString+','+
                    ''''+PrichTxt+''','+
                    ''''+Trim(q_plan_fact.FieldByName('NUM_DOG').AsString)+''','+
                    IntToStr(Id)+','+
                    q_plan_fact.FieldByName('SORTBY').AsString+','+
                    ''''+ZaprMPS+''')');
      q_cmn.ExecSQL;
      q_plan_fact.Next;
    end;
    q_plan_fact.Close;
    q_last.Close;

  end;

  Screen.Cursor := crDefault;  { Always restore to normal }
End;

// Заполняет U:\LUK\DBASES\SOOB_EXP.DBF из C:\TMP\PE_EDIT.DBF
procedure Tf_SoobExp.FillToBase;
Begin
  // Подготовка базового файла
  q_cmn.SQL.Clear;
  q_cmn.SQL.Add('DELETE FROM "'+DbasesPath+'soob_exp.DBF" WHERE rep_date='+
    FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_date.Date));
  q_cmn.ExecSQL;

  t_pe_edit.Close;
  t_pe_edit.Open;
  while not t_pe_edit.EOF do
  with t_pe_edit do
  begin
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+DbasesPath+'soob_exp.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                      'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                      'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps,rep_date) VALUES (');
    q_cmn.SQL.Add(''''+t_pe_edit.FieldByName('PLAT_KOD').AsString+''','+
                  ''''+t_pe_edit.FieldByName('PLAT_NAME').AsString+''','+
                  ''''+t_pe_edit.FieldByName('PROD_KOD').AsString+''','+
                  ''''+t_pe_edit.FieldByName('PROD_KOD10').AsString+''','+
                  ''''+t_pe_edit.FieldByName('KIND_NPR').AsString+''','+
                  ''''+t_pe_edit.FieldByName('PROD_FAS').AsString+''','+
                  ''''+t_pe_edit.FieldByName('PROD_NAME').AsString+''','+
                  ''''+t_pe_edit.FieldByName('STAN_KOD').AsString+''','+
                  ''''+t_pe_edit.FieldByName('STAN_NAME').AsString+''','+
                  ''''+t_pe_edit.FieldByName('EXPED_KOD').AsString+''','+
                  ''''+t_pe_edit.FieldByName('EXPED_NAME').AsString+''','+
                  ''''+Trim(t_pe_edit.FieldByName('VID_TRANS').AsString)+''','+
                  ''''+t_pe_edit.FieldByName('VID_TR_NAM').AsString+''','+
                  t_pe_edit.FieldByName('FACT_YEAR').AsString+','+
                  t_pe_edit.FieldByName('PLAN_POST').AsString+','+
                  t_pe_edit.FieldByName('PLAN_IZM').AsString+','+
                  t_pe_edit.FieldByName('OBPR').AsString+','+
                  t_pe_edit.FieldByName('PLAN_GD').AsString+','+
                  t_pe_edit.FieldByName('NORMA_MON').AsString+','+
                  t_pe_edit.FieldByName('FACT_MON').AsString+','+
                  t_pe_edit.FieldByName('IS_BAD').AsString+','+
                  t_pe_edit.FieldByName('FACT_SUT').AsString+','+
                  ''''+t_pe_edit.FieldByName('PRICH').AsString+''','+
                  ''''+Trim(t_pe_edit.FieldByName('NUM_DOG').AsString)+''','+
                  t_pe_edit.FieldByName('ID').AsString+','+
                  t_pe_edit.FieldByName('SORTBY').AsString+','+
                  ''''+t_pe_edit.FieldByName('ZAPR_MPS').AsString+''','+
                  FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_Date.Date)+')');

    q_cmn.ExecSQL;
    t_pe_edit.Next;
  end;
  t_pe_edit.Close;
End;

// Заполняет C:\TMP\PE_EDIT.DBF из U:\LUK\DBASES\SOOB_EXP.DBF
procedure Tf_SoobExp.FillToTmp;
Begin
  q_seek.First;
  while not q_seek.EOF do
  with q_seek do
  begin
    q_cmn.SQL.Clear;
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('INSERT INTO "'+f_main.TempLocalPath+'pe_edit.DBF" (plat_kod,plat_name,prod_kod,prod_kod10,kind_npr,'+
                      'prod_fas,prod_name,stan_kod,stan_name,exped_kod,exped_name,vid_trans,vid_tr_nam,'+
                      'fact_year,plan_post,plan_izm,obpr,plan_gd,norma_mon,fact_mon,is_bad,fact_sut,prich,num_dog,id,sortby,zapr_mps) VALUES (');
    q_cmn.SQL.Add(''''+q_seek.FieldByName('PLAT_KOD').AsString+''','+
                  ''''+q_seek.FieldByName('PLAT_NAME').AsString+''','+
                  ''''+q_seek.FieldByName('PROD_KOD').AsString+''','+
                  ''''+q_seek.FieldByName('PROD_KOD10').AsString+''','+
                  ''''+q_seek.FieldByName('KIND_NPR').AsString+''','+
                  ''''+q_seek.FieldByName('PROD_FAS').AsString+''','+
                  ''''+q_seek.FieldByName('PROD_NAME').AsString+''','+
                  ''''+q_seek.FieldByName('STAN_KOD').AsString+''','+
                  ''''+q_seek.FieldByName('STAN_NAME').AsString+''','+
                  ''''+q_seek.FieldByName('EXPED_KOD').AsString+''','+
                  ''''+q_seek.FieldByName('EXPED_NAME').AsString+''','+
                  ''''+Trim(q_seek.FieldByName('VID_TRANS').AsString)+''','+
                  ''''+q_seek.FieldByName('VID_TR_NAM').AsString+''','+
                  q_seek.FieldByName('FACT_YEAR').AsString+','+
                  q_seek.FieldByName('PLAN_POST').AsString+','+
                  q_seek.FieldByName('PLAN_IZM').AsString+','+
                  q_seek.FieldByName('OBPR').AsString+','+
                  q_seek.FieldByName('PLAN_GD').AsString+','+
                  q_seek.FieldByName('NORMA_MON').AsString+','+
                  q_seek.FieldByName('FACT_MON').AsString+','+
                  q_seek.FieldByName('IS_BAD').AsString+','+
                  q_seek.FieldByName('FACT_SUT').AsString+','+
                  ''''+q_seek.FieldByName('PRICH').AsString+''','+
                  ''''+Trim(q_seek.FieldByName('NUM_DOG').AsString)+''','+
                  q_seek.FieldByName('ID').AsString+','+
                  q_seek.FieldByName('SORTBY').AsString+','+
                  ''''+q_seek.FieldByName('ZAPR_MPS').AsString+''')');
    q_cmn.ExecSQL;
    q_seek.Next;
  end;
  q_seek.Close;
End;

procedure Tf_SoobExp.btCalcClick(Sender: TObject);
begin
  // Проверка наличия справки в основной базе
  PF_Conn.Close;
  PF_Conn.Connected:=True;

  q_prod.Open;

  // Подготовка промежуточного файла
  F_FileUtils.SafeCopyFile(f_main.MasterDBFPath+'pe_shab.DBF',f_main.TempLocalPath+'pe_edit.DBF');
  try
    q_cmn.SQL.Clear;
    q_cmn.SQL.Add('DELETE FROM "'+f_main.TempLocalPath+'pe_edit.DBF"');
    q_cmn.ExecSQL;
  except
  end;

  q_seek.Close;
  q_seek.Parameters.ParamByName('rep_date').Value:=ed_date.Date;
  q_seek.Open;
  FlagExist:=NOT q_seek.Eof;
  FlagNew:=false;

  If NOT FlagExist OR (Application.MessageBox('Сформировать новую справку?','ВНИМАНИЕ!',MB_YESNO)=ID_YES) Then
  Begin
    FlagNew:=true;
    If FlagExist then
      if (Application.MessageBox(PChar('Справка за '+DateToStr(ed_date.Date)+' уже существует. Заменить?'),'ВНИМАНИЕ!',MB_YESNO)=IDNO) Then
         FlagNew:=false;
    If FlagNew Then
    Begin
      CalculateRep;
    end
    Else FillToTmp;
  End
  Else FillToTmp;

  F_PrichExp:=Tf_PrichExp.create(Self);
  with f_PrichExp do
  try
    f_PrichExp.Caption:='Сообщение ЭКСП (Причины) на '+DateToStr(ed_Date.Date);
    f_PrichExp.ShowModal;
    If (FlagNew AND NOT FlagExist) OR (f_prichExp.ModalResult=mrOk) OR (Application.MessageBox('Сохранить изменения справки?','ВНИМАНИЕ!',MB_YESNO)=ID_YES) Then
      FillToBase;
  finally
    Free
  end;

  Close;
end;

procedure Tf_SoobExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PF_Conn.Close;
end;

procedure Tf_SoobExp.q_fact_yearBeforeOpen(DataSet: TDataSet);
var BegPrevMon:TDateTime;
begin
  BegPrevMon:=StartOfTheMonth(StartOfTheMonth(ed_Date.Date)-1);
  q_fact_year.SQL[19]:='WHERE kvit.date_otgr<'+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',BegPrevMon);
  q_fact_year.SQL[20]:='  AND kvit.date_otgr>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheYear(ed_Date.date));
end;

procedure Tf_SoobExp.q_fact_prev_monBeforeOpen(DataSet: TDataSet);
var BegPrevMon:TDateTime;
begin
  BegPrevMon:=StartOfTheMonth(StartOfTheMonth(ed_Date.Date)-1);
  if DayOfTheMonth(ed_Date.Date)>=10 then
  Begin
    q_fact_prev_mon.SQL[18]:='FROM kvit,prod,predpr,stan,vid_otgr';
  End
  Else
  Begin
    q_fact_prev_mon.SQL[18]:='FROM ''U:\LUK\OTGR\OPERDATA\reestr'' kvit,prod,predpr,stan,vid_otgr';
  End;
  q_fact_prev_mon.SQL[19]:='WHERE kvit.date_otgr<'+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheMonth(ed_Date.date));
  q_fact_prev_mon.SQL[20]:='  AND kvit.date_otgr>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',BegPrevMon);
  q_fact_prev_mon.SQL[21]:='  AND kvit.date_otgr>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheYear(ed_Date.date));
end;

procedure Tf_SoobExp.q_fact_cur_monBeforeOpen(DataSet: TDataSet);
begin
  q_fact_cur_mon.SQL[19]:='WHERE kvit.date_otgr<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_Date.date);
  q_fact_cur_mon.SQL[20]:='  AND kvit.date_otgr>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheMonth(ed_Date.Date));
end;

procedure Tf_SoobExp.q_gdplan_oldBeforeOpen(DataSet: TDataSet);
begin
  q_gdplan.SQL[9]:='WHERE date_plan<='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',EndOfTheMonth(ed_Date.date));
  q_gdplan.SQL[10]:='  AND date_plan>='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheMonth(ed_Date.Date));
end;

procedure Tf_SoobExp.q_planpostBeforeOpen(DataSet: TDataSet);
begin
  q_planpost.SQL[11]:='FROM ''U:\LUK\DOGOVOR\PLANM\PL'+FormatDateTime('yy',ed_Date.date)+'_'+FormatDateTime('mm',ed_Date.date)+'\plotg2'',prod,predpr,vid_otgr,dog';
//  q_planpost.SQL[41]:='AND month.date_plan={'+FormatDateTime('mm/01/yyyy',ed_Date.date)+'}';
//  q_planpost.SQL.SaveToFile('c:\tmp\a.txt');
end;

procedure Tf_SoobExp.q_fact_sutBeforeOpen(DataSet: TDataSet);
begin
  q_fact_sut.SQL[19]:='WHERE kvit.date_otgr='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',ed_Date.date);
end;

procedure Tf_SoobExp.q_zayvBeforeOpen(DataSet: TDataSet);
begin
  q_zayv.SQL[15]:='WHERE month.date_plan='+FormatDateTime('"{"mm"/"dd"/"yyyy"}"',StartOfTheMonth(ed_Date.date));
end;

procedure Tf_SoobExp.q_obprBeforeOpen(DataSet: TDataSet);
begin
  q_obpr.SQL[17]:=' AND PLAN_PERIODS.DATE_PLAN=TO_DATE(''01.'+FormatDateTime('mm',ed_Date.date)+'.'+FormatDateTime('yyyy',ed_Date.date)+''',''dd.mm.yyyy'')';
end;

procedure Tf_SoobExp.q_allplanBeforeOpen(DataSet: TDataSet);
begin
  q_allplan.SQL[13]:='FROM "'+f_main.TempLocalPath+'pe_plan.DBF"';
end;

procedure Tf_SoobExp.q_gdplanBeforeOpen(DataSet: TDataSet);
begin
  q_gdplan.SQL[8]:='AND GU12_BR.DATE_R<=TO_DATE('''+FormatDateTime('dd.mm.yyyy',EndOfTheMonth(ed_Date.date))+''',''dd.mm.yyyy'')';
  q_gdplan.SQL[9]:='AND GU12_BR.DATE_R>=TO_DATE('''+FormatDateTime('dd.mm.yyyy',StartOfTheMonth(ed_Date.date))+''',''dd.mm.yyyy'')';
end;

end.



