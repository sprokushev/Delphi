program master;

uses
  Forms,
  main in 'main.pas' {f_main},
  AddGdTime in 'AddGdTime.pas' {f_AddGdTime},
  AddPlanStru in 'PLANPOST\AddPlanStru.pas' {F_AddPlanStru},
  AddPlnIz in 'PLANPOST\AddPlnIz.pas' {F_AddPlanIzm},
  AddPlnPer in 'PLANPOST\AddPlnPer.pas' {F_AddPlanPer},
  AddPlPst in 'PLANPOST\AddPlPst.pas' {F_AddPlanPost},
  AllRep in 'AllRep.pas' {f_Rep},
  AskPeriod in 'NARIAD\AskPeriod.pas' {F_AskPeriod},
  azc in 'AZC\azc.pas' {f_forAZCRealiz},
  azsEff in 'Oup\azsEff.pas' {f_azsEff},
  azsmonth in 'Oup\azsMonth.pas' {Form1},
  azc_filter in 'AZC\azc_filter.pas' {f_azc_filter},
  azc_object in 'AZC\azc_object.pas' {f_forAZC_object},
  azc_object_add in 'AZC\azc_object_add.pas' {f_forAZC_object_add},
  azc_oper_all in 'AZC\azc_oper_all.pas' {f_forAZC_oper_all},
  azc_perevod in 'AZC\azc_perevod.pas' {f_forAZC_perevod},
  azc_remove in 'AZC\azc_remove.pas' {f_forAZCRemove},
  azc_rezerv in 'AZC\azc_rezerv.pas' {f_forAZC_Obj_rez},
  azc_sprav in 'AZC\azc_sprav.pas' {f_forAZCSprav},
  azc_from_parus in 'AZC\azc_from_parus.pas' {f_AzcFromParus},
  azc_tarif in 'AZC\azc_tarif.pas' {f_forAZC_tarif},
  Calls in 'Calls.pas' {f_Calls},
  CatCen in 'CatCen.pas' {f_CatCen},
  CatCenGr in 'CatCenGr.pas' {f_CatCenGroup},
  CChart in 'CChart.pas' {f_CounterChart},
  CDetail in 'CDetail.pas' {f_DetailInfo},
  ChCounter in 'ChCounter.pas' {f_ChooseCounter},
  Counter in 'Counter.pas' {f_Counter},
  contr in 'Arhangelsk\contr.pas' {frm1cParAgn},
  disprep in 'PF\disprep.pas' {f_disprep},
  disprep1 in 'PF\disprep1.pas' {f_disprep1},
  DocStream in 'DocStream.pas' {f_DocStream},
  Dover in 'NARIAD\Dover.pas' {F_Dover},
  EdCatCen in 'EdCatCen.pas' {f_EdCatCen},
  EdDover in 'NARIAD\EdDover.pas' {F_EdDover},
  EdNariad in 'NARIAD\EdNariad.pas' {F_EdNariad},
  EdPayment in 'EdPayment.pas' {f_EdPayment},
  End_DT in 'R3\End_DT.pas' {f_EndDateFOX2R3},
  f42 in 'PLANFACT\f42.pas' {f_f42},
  f42_prch in 'PLANFACT\f42_prch.pas' {f_f42_prich},
  FindDov in 'NARIAD\FindDov.pas' {F_FindDov},
  ForDB in 'ForDB.pas',
  ForFiles in 'ForFiles.pas',
  ForReport in 'ForReport.pas' {f_forReport},
  ForSystem in 'ForSystem.pas',
  ForTemp in 'ForTemp.pas',
  ForSESS in 'ForSESS.pas' {ApplSession},
  ForEnv in 'ENVIRONMENT\ForEnv.pas',
  ForODBC in 'ForODBC.pas' {F_ODBC},
  Funcs in 'NARIAD\Funcs.pas',
  GdTime in 'GdTime.pas' {f_GdTime},
  GDPLan4Anton in 'GDPLan4Anton.pas' {f_GDPLan4Anton},
  Identify in 'Identify.pas' {f_identify},
  in1 in 'obu\in1.pas' {frm_OBU_sbcard},
  INF2PBAL in 'INF2PBAL\INF2PBAL.pas' {f_Inf2Pbal},
  JKC_New in 'JKCOMMIT\JKC_New.pas' {F_JKCommit},
  KlsAdd in 'KlsAdd.pas' {f_KlsAdd},
  KlsLinks in 'KlsLinks.pas' {f_KlsLinks},
  KlsListLinks in 'KlsListLinks.pas' {f_KlsListLinks},
  KlsMisc2 in 'klsmisc2.pas' {f_KlsMisc},
  KlsStruEd in 'KlsStruEd.pas' {f_KlsStruEd},
  KlsUnivers in 'KlsUnivers.pas' {f_KlsUnivers},
  Kvit2R3 in 'R3\Kvit2R3.pas' {f_Kvit2R3},
  LoadFilList in 'LOAD_FIL\LoadFilList.pas' {f_LoadFilList},
  loader in 'PARUS\cb\loader.pas' {cb2parus},
  LoadFil in 'LOAD_FIL\LoadFil.pas' {f_LoadFil},
  LoadReeSMN in 'LoadReeSMN.pas' {f_LoadReeSMN_1},
  MemoEdit in 'MemoEdit.pas' {f_MemoEdit},
  MetaPlanMain in 'MetaPlan\MetaPlanMain.pas' {f_MetaPlanSetup},
  MdiForm in 'MdiForm.pas' {f_MDIForm},
  Month in 'Month.pas' {f_Month},
  month_all in 'request\month_all.pas' {frmMonthAll},
  Nariad in 'NARIAD\Nariad.pas' {F_Nariad},
  NarToDBF in 'NARIAD\NarToDBF.pas' {F_NarToDbf},
  NewMonth in 'NewMonth.pas' {f_NewMonth},
  NewSFAsker in 'NewSFAsker.pas' {f_NewSFAsker},
  ZakazNew in 'request\ZakazNew.pas' {f_ZakazNew},
  oper_zayav in 'oper_zayav.pas' {f_oper_zayav},
  opreeflt in 'opreeflt.pas' {f_OperReeFilter},
  OraToDbf in 'OraToDbf.pas' {f_OraToDbf},
  Payments in 'Payments.pas' {f_Payments},
  OneSF in 'OneSF.pas' {f_OneSF},
  oper_pod in 'oper_pod.pas' {f_oper_pod},
  oper_ree in 'oper_ree.pas' {f_oper_ree},
  plnp in 'PLANFACT\plnp.pas' {f_plnp},
  plnp_dbf in 'PLANFACT\plnp_dbf.pas' {f_plnpdbf},
  planpost in 'PLANPOST\planpost.pas' {f_PlanPost},
  planstru in 'PLANPOST\planstru.pas' {f_PlanStru},
  plan_request in 'Requests\plan_request.pas' {f_LoadPlanRequest},
  Predpr in 'Predpr.pas' {f_Predpr},
  prichin in 'PLANFACT\prichin.pas' {FormPrichin},
  PriceNPO in 'PARUS\price\PriceNPO.pas' {frmPrice},
  PrintSF in 'PrintSF.pas' {f_PrintSF},
  pfdbf in 'PLANFACT\pfdbf.pas' {f_pfdbf},
  PrichExp in 'EXPORT\PrichExp.pas' {f_PrichExp},
  pr_view in 'post_realiz\pr_view.pas' {frmPRView},
  pp_new in 'post_realiz\pp_new.pas' {frmPPNew},
  pp_view in 'post_realiz\pp_view.pas' {frmPPView},
  pr_new in 'post_realiz\pr_new.pas' {frmPRNew},
  ReplDep in 'ReplDep.pas' {f_ReplDep},
  SutReeList in 'SutReeList.pas' {f_SutReeList},
  ResourceProizv in 'Plan_Resource\ResourceProizv.pas' {frmResourceProizv},
  RunQuery in 'RunQuery.pas' {f_Query},
  SFNumbers in 'SFNumbers.pas' {f_SFNumbers},
  selectRoot in 'MetaPlan\selectRoot.pas' {SelectRootDlg},
  ScriptGen in 'ScriptGen.pas' {f_ScriptGen},
  sqlReport in 'sqlReport.pas' {f_forReportSQL},
  SoobExp in 'EXPORT\SoobExp.pas' {f_SoobExp},
  SvodPF in 'PLANFACT\SvodPF.pas' {f_SvodPF},
  smn_ree in 'smn_ree.pas' {f_smn_ree},
  selectSheet in 'Requests\selectSheet.pas' {f_selectSheet},
  tarif_adds in 'AZC\tarif_adds.pas' {f_forAZC_tarifadd},
  UserRite in 'UserRite.pas' {f_UserRights},
  loadreesmn_2 in 'loadreesmn_2.pas' {f_LoadReeSMN_2},
  dlgWindow in 'request\dlgWindow.pas' {frmDlgWindow},
  SutRee in 'SutRee.pas' {f_SutRee},
  RepDbfItogs in 'RepDbfItogs.pas' {f_Rep_Dbf_Itogs},
  RepDbfGrp in 'RepDbfGrp.pas' {f_Rep_Dbf_Grp},
  ReplInit in 'REPL\ReplInit.pas' {f_ReplInit},
  month_all_row in 'request\month_all_row.pas' {f_MonthAllRow},
  alfa2month in 'alfa\alfa2month.pas' {frmAlfaLoadRequest},
  zakaz in 'request\zakaz.pas' {f_Zakaz},
  ZakazFilter in 'request\ZakazFilter.pas' {f_ZakazFilter},
  nmonth_all in 'request\nmonth_all.pas' {frm_MonthNew},
  ZakazHistNew in 'request\ZakazHistNew.pas' {f_ZakazHistNew},
  OtpCen in 'OtpCen.pas' {f_OtpCen},
  RepDbf in 'RepDbf.pas' {f_Rep_Dbf},
  RezReport in 'RezReport.pas' {f_RezReport},
  trk_eff in 'AZC\trk_eff.pas' {f_trkEff},
  EdOtpCen in 'EdOtpCen.pas' {f_EdOtpCen},
  OneSFNoOtgr in 'OneSFNoOtgr.pas' {f_OneSFNoOtgr},
  exp2inf in 'OBU\exp2inf.pas' {frmExp2INFIN},
  disp_azs in 'disp_azs.pas' {f_dispazs},
  selectDep in 'selectDep.pas' {f_selectDep},
  extGrid in 'extGrid.pas',
  oper_sf_new in 'oper_sf_new.pas' {f_oper_sf},
  U_zayav in 'gu12\U_zayav.pas' {f_zayav},
  U_glob_var in 'gu12\U_glob_var.pas',
  U_reis in 'gu12\U_reis.pas' {f_reis},
  U_add_razb in 'gu12\U_add_razb.pas' {f_add_razb},
  U_otkaz in 'gu12\U_otkaz.pas' {f_otkaz},
  U_period in 'gu12\U_period.pas' {f_period};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(Tf_main, f_main);
  Application.Run;
end.

