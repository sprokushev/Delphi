�
 TDMDATA 0BE  TPF0TdmDatadmDataOldCreateOrder	OnCreateDataModuleCreate	OnDestroyDataModuleDestroyLeft� ToptHeightRWidth TTable	taPackets	AfterPosttaPacketsAfterPostAfterDeletetaPacketsAfterDeleteDatabaseNameUHTA_BDE	TableNamePACKETS.DBFLeftTop  TDataSource	dsPacketsDataSet	taPacketsLeft8Top  TTabletaEvents	AfterPosttaEventsAfterPostAfterDeletetaEventsAfterDeleteDatabaseNameUHTA_BDE	TableName
EVENTS.DBF	TableTypettFoxProLeftTop8  TDataSourcedsEventsDataSettaEventsLeft8Top8  TTable	taTimeEvn	AfterPosttaTimeEvnAfterPostAfterDeletetaTimeEvnAfterDeleteDatabaseNameUHTA_BDE	TableNameTIMEEVN.DBFLeftTop�  TSmallintFieldtaTimeEvnKOD_EVTIME	FieldName
KOD_EVTIME  TSmallintFieldtaTimeEvnKOD_PACKET	FieldName
KOD_PACKET  TStringFieldtaTimeEvnTIME	FieldNameTIMESize  TStringFieldtaTimeEvnTIMERUN	FieldNameTIMERUNSize  
TDateFieldtaTimeEvnDATERUN	FieldNameDATERUN  TStringFieldtaTimeEvnFlagPath	FieldKindfkLookup	FieldNameFlagPathLookupDataSet
taPackets0LookupKeyFields
KOD_PACKETLookupResultFieldFLAGPATH	KeyFields
KOD_PACKETSize2Lookup	  TStringFieldtaTimeEvnFlagName	FieldKindfkLookup	FieldNameFlagNameLookupDataSet
taPackets0LookupKeyFields
KOD_PACKETLookupResultFieldFLAGNAME	KeyFields
KOD_PACKETSizeLookup	  TBooleanFieldtaTimeEvnRun	FieldKindfkLookup	FieldNameRunLookupDataSet
taPackets0LookupKeyFields
KOD_PACKETLookupResultFieldRUN	KeyFields
KOD_PACKETLookup	   TDataSource	dsTimeEvnDataSet	taTimeEvnLeft8Top�   TTable
taPackets0DatabaseNameUHTA_BDE	TableNamePACKETS.DBFLeft�Top  TDataSource
dsPackets0DataSet
taPackets0Left Top  TTabletaListFilesAfterInserttaListFilesAfterInsert	AfterPosttaListFilesAfterPostAfterDeletetaListFilesAfterDeleteDatabaseNameUHTA_BDE	TableNameLSTFILES.DBFLeftTop�  TDataSourcedsListFilesDataSettaListFilesLeft8Top�  TTabletaAdminProtokolOnCalcFieldstaAdminProtokolCalcFieldsDatabaseNameUHTA_BDEFilterMANAGER = TrueFiltered		TableNamePROTOKOL.DBFLefthToph TStringFieldtaAdminProtokolKOD_SESSDisplayLabel   Код сессии	FieldNameKOD_SESSVisibleSize  
TDateFieldtaAdminProtokolF_DATE_BDisplayLabel   Дата запуска	FieldNameF_DATE_B  TStringFieldtaAdminProtokolF_TIME_BDisplayLabel   Время запуска	FieldNameF_TIME_BSize  
TDateFieldtaAdminProtokolF_DATE_EDisplayLabel   Дата выгрузки	FieldNameF_DATE_E  TStringFieldtaAdminProtokolF_TIME_EDisplayLabel   Время выгрузки	FieldNameF_TIME_ESize  
TMemoFieldtaAdminProtokolF_ER_RORDisplayLabel   =D>	FieldNameF_ER_RORVisibleBlobTypeftMemoSize  TBooleanFieldtaAdminProtokolMANAGERDisplayLabel   5=5465@	FieldNameMANAGER  TBooleanFieldtaAdminProtokolACTIVE	FieldNameACTIVEVisible  TBooleanFieldtaAdminProtokolERROR	FieldNameERRORVisible  TStringFieldtaAdminProtokolCurrentDisplayWidth
	FieldKindfkCalculated	FieldNameCurrentVisibleSize

Calculated	   TDataSourcedsAdminProtokolDataSettaAdminProtokolLeft�Toph  TTabletaAdminEventsOnCalcFieldstaAdminEventsCalcFieldsDatabaseNameUHTA_BDE	IndexNameKOD_SESSMasterFieldsKOD_SESS	TableName
EVENTS.DBFLefthTop8 TStringFieldtaEventsKOD_SESSDisplayLabel   Код сессии	FieldNameKOD_SESSVisibleSize  TSmallintFieldtaEventsKOD_PACKET	FieldName
KOD_PACKETVisible  TStringFieldtaEventsNameDisplayLabel   @>F5AADisplayWidth	FieldKindfkLookup	FieldNameNameLookupDataSettaAdminPacketsLookupKeyFields
KOD_PACKETLookupResultFieldNAME	KeyFields
KOD_PACKETSize
Lookup	  TStringFieldtaEventsTipDisplayLabel   "8?DisplayWidth	FieldKindfkCalculated	FieldNameTipSize

Calculated	  TStringFieldtaEventsTipEvent	FieldKindfkLookup	FieldNameTipEventLookupDataSettaAdminPacketsLookupKeyFields
KOD_PACKETLookupResultFieldTIPEVENT	KeyFields
KOD_PACKETVisibleSizeLookup	  
TDateFieldtaEventsDATEDisplayLabel   0B0DisplayWidth	FieldNameDATE  TStringFieldtaEventsTIME_RUNDisplayLabel   @5<ODisplayWidth
	FieldNameTIME_RUNSize  TStringFieldtaEventsTIME_BDisplayLabel   0G0;>DisplayWidth
	FieldNameTIME_BSize  TStringFieldtaEventsTIME_EDisplayLabel
   025@H5=85DisplayWidth	FieldNameTIME_ESize  TBooleanFieldtaEventsERROR	FieldNameERRORVisible  
TMemoFieldtaEventsRESULTDisplayLabel   H81:0	FieldNameRESULTBlobTypeftMemoSize  
TMemoFieldtaEventsINFODisplayLabel   =D>DisplayWidth	FieldNameINFOVisibleBlobTypeftMemoSize   TDataSourcedsAdminEventsDataSettaAdminEventsOnDataChangedsAdminEventsDataChangeLeft�Top8  TTabletaViewEventsOnCalcFieldstaViewEventsCalcFieldsDatabaseNameUHTA_BDE	TableName
EVENTS.DBFLeft� Top8 TStringFieldStringField1DisplayLabel   Код сессии	FieldNameKOD_SESSVisibleSize  TSmallintFieldSmallintField1	FieldName
KOD_PACKETVisible  TStringFieldStringField2DisplayLabel   @>F5AADisplayWidth	FieldKindfkLookup	FieldNameNameLookupDataSettaViewPacketsLookupKeyFields
KOD_PACKETLookupResultFieldNAME	KeyFields
KOD_PACKETSize
Lookup	  TStringFieldStringField3DisplayLabel   "8?DisplayWidth	FieldKindfkCalculated	FieldNameTipVisibleSize

Calculated	  TStringFieldStringField4	FieldKindfkLookup	FieldNameTipEventLookupDataSettaViewPacketsLookupKeyFields
KOD_PACKETLookupResultFieldTIPEVENT	KeyFields
KOD_PACKETVisibleSizeLookup	  
TDateField
DateField1DisplayLabel   0B0DisplayWidth	FieldNameDATE  TStringFieldStringField5DisplayLabel   0?CA:DisplayWidth
	FieldNameTIME_RUNSize  TStringFieldStringField6DisplayLabel   0G0;>DisplayWidth
	FieldNameTIME_BSize  TStringFieldStringField7DisplayLabel
   025@H5=85DisplayWidth	FieldNameTIME_ESize  TBooleanFieldBooleanField1	FieldNameERRORVisible  
TMemoField
MemoField1DisplayLabel   H81:0	FieldNameRESULTVisibleBlobTypeftMemoSize  
TMemoField
MemoField2DisplayLabel   =D>DisplayWidth		FieldNameINFOVisibleBlobTypeftMemoSize  TStringFieldtaEventsNameProcessDisplayLabel*   Наименование  процесса	FieldKindfkLookup	FieldNameNameProcessLookupDataSettaViewPacketsLookupKeyFields
KOD_PACKETLookupResultFieldDESCRIPT	KeyFields
KOD_PACKETSizeLookup	   TDataSourcedsViewEventsDataSettaViewEventsLeftTop8  TTabletaViewPacketsDatabaseNameUHTA_BDE	IndexName
KOD_PACKET	TableNamePACKETS.DBFLeft� Top  TDataSourcedsViewPacketsDataSettaViewPacketsLeftTop  TTabletaAdminPacketsDatabaseNameUHTA_BDE	IndexName
KOD_PACKET	TableNamePACKETS.DBFLefthTop  TDataSourcedsAdminPacketsDataSettaAdminPacketsLeft�Top  TTabletaParamListFilesAfterInserttaListFilesAfterInsert	AfterPosttaListFilesAfterPostAfterDeletetaListFilesAfterDeleteDatabaseNameUHTA_BDE	TableNameLSTFILES.DBFLeft� Top�  TDataSourcedsParamListFilesDataSettaParamListFilesLeft� Top�  TTable
taProtokol	AfterPosttaProtokolAfterPostAfterDeletetaProtokolAfterDeleteDatabaseNameUHTA_BDE	TableNamePROTOKOL.DBFLeftTopj  TDataSource
dsProtokolDataSet
taProtokolLeft8Topj  TTabletaParamPacketsAfterInserttaParamPacketsAfterInsert
BeforePosttaParamPacketsBeforePost	AfterPosttaParamPacketsAfterPostAfterDeletetaParamPacketsAfterDeleteDatabaseNameUHTA_BDE	TableNamePACKETS.DBFLeft� Top TSmallintFieldtaPacketsKOD_PACKETDisplayLabel   >4DisplayWidth	FieldName
KOD_PACKETVisible  TStringFieldtaPacketsNAMEDisplayLabel   (8D@DisplayWidth
	FieldNameNAMERequired	Size  TStringFieldtaPacketsDESCRIPTDisplayLabel   08<5=>20=85DisplayWidth,	FieldNameDESCRIPTSize2  TStringFieldtaPacketsMODULEDisplayLabel   >4C;LDisplayWidth)	FieldNameMODULERequired	Size2  TStringFieldtaPacketsFLAGPATHDisplayLabel   Путь флагаDisplayWidth 	FieldNameFLAGPATHRequired	Size2  TStringFieldtaPacketsFLAGNAMEDisplayLabel   Файл-флагDisplayWidth	FieldNameFLAGNAMERequired	Size  TBooleanFieldtaPacketsFLAGERASEDisplayLabel   Удалять?	FieldName	FLAGERASE  TStringFieldtaPacketsPARAMSDisplayLabel	   0@0<5B@KDisplayWidth	FieldNamePARAMS  TSmallintFieldtaPacketsTIPEVENT	FieldNameTIPEVENTRequired	Visible  TBooleanFieldtaPacketsRUNDisplayLabel   :B825=DisplayWidth		FieldNameRUN  
TMemoFieldtaPacketsINFODisplayLabel
   =D>@<0F8O	FieldNameINFOVisibleBlobTypeftMemoSize  TStringFieldtaPacketsTipDisplayLabel   Тип процессаDisplayWidth	FieldKindfkLookup	FieldNameTipLookupDataSettaParamTipEventLookupKeyFieldsTIPLookupResultFieldNAME	KeyFieldsTIPEVENTSize
Lookup	   TDataSourcedsParamPacketsDataSettaParamPacketsLeft� Top  TTabletaParamTipEvent	AfterPosttaParamTipEventAfterPostAfterDeletetaParamTipEventAfterDeleteDatabaseNameUHTA_BDE	IndexNameTIP	TableNameTIPEVENT.DBFLeftTop�  TDataSourcedsParamTipEventDataSettaParamTipEventLeft8Top�  TTabletaParamLock	AfterPosttaParamLockAfterPostAfterDeletetaParamLockAfterDeleteDatabaseNameUHTA_BDE	TableNameLOCK.DBFLeft� Top�  TDataSourcedsParamLockDataSettaParamLockLeft� Top�  TTable	taRaznLogDatabaseNameUHTA_BDE	TableNameRAZNLOG.DBFLeftTop�  TStringFieldtaRaznLogKODDisplayLabel   0:5BDisplayWidth	FieldNameKODSize  TFloatFieldtaRaznLogCNTRECDisplayLabel   Зап-ВТУDisplayWidth		FieldNameCNTREC  TFloatFieldtaRaznLogCNTREC0DisplayLabel   Зап-НБDisplayWidth	FieldNameCNTREC0  TFloatFieldtaRaznLogCISTDisplayLabel   В/ц-ВТУDisplayWidth		FieldNameCIST  TFloatFieldtaRaznLogCIST0DisplayLabel
   В/ц-НБDisplayWidth	FieldNameCIST0  TFloatFieldtaRaznLogTONNDisplayLabel   Тонн-ВТУDisplayWidth	FieldNameTONN  TFloatFieldtaRaznLogTONN0DisplayLabel   НБ-ТоннDisplayWidth	FieldNameTONN0  
TDateFieldtaRaznLogDATEDisplayLabel   @8=OB0DisplayWidth	FieldNameDATE  TStringFieldtaRaznLogTIMEDisplayLabel   @5<ODisplayWidth
	FieldNameTIMESize  
TDateFieldtaRaznLogDATA_SDisplayLabel
   B?@02;5=0DisplayWidth	FieldNameDATA_S  TStringFieldtaRaznLogTIME_SDisplayLabel   @5<ODisplayWidth		FieldNameTIME_SSize  
TMemoFieldtaRaznLogGD_PRNDisplayLabel   Ж/д (РОСС)DisplayWidth	FieldNameGD_PRNVisibleBlobTypeftMemoSize  
TMemoFieldtaRaznLogGDE_PRNDisplayLabel   Ж/д (ЭКСП)DisplayWidth	FieldNameGDE_PRNVisibleBlobTypeftMemoSize  
TMemoFieldtaRaznLogW_PRNDisplayLabel   Причал (РОСС)DisplayWidth	FieldNameW_PRNVisibleBlobTypeftMemoSize  
TMemoFieldtaRaznLogWE_PRNDisplayLabel   Причал (ЭКСП)DisplayWidth	FieldNameWE_PRNVisibleBlobTypeftMemoSize  
TMemoFieldtaRaznLogT_PRNDisplayLabel   "@C1>?@>2>4DisplayWidth	FieldNameT_PRNVisibleBlobTypeftMemoSize  
TMemoFieldtaRaznLogS_PRNDisplayLabel	   !0<>2K2>7DisplayWidth	FieldNameS_PRNVisibleBlobTypeftMemoSize   TDataSource	dsRaznLogDataSet	taRaznLogOnDataChangedsRaznLogDataChangeLeft8Top�   TTabletaParamTimeEvn
BeforePosttaParamTimeEvnBeforePost	AfterPosttaParamTimeEvnAfterPostAfterDeletetaParamTimeEvnAfterDeleteDatabaseNameUHTA_BDE	TableNameTIMEEVN.DBFLeft� Top�  TStringFieldtaTimeEvnNameDisplayLabel   (8D@DisplayWidth
	FieldKindfkLookup	FieldNameNameLookupDataSettaTEPacketsLookupKeyFields
KOD_PACKETLookupResultFieldNAME	KeyFields
KOD_PACKETReadOnly	SizeLookup	  TSmallintFieldSmallintField2DisplayLabel   >4DisplayWidth	FieldName
KOD_EVTIMEVisible  TSmallintFieldSmallintField3	FieldName
KOD_PACKETVisible  TStringFieldStringField8DisplayLabel   Время запускаDisplayWidth	FieldNameTIMEEditMask
!90:00;1;_Size  
TDateField
DateField2DisplayLabel
   1@01>B0=>DisplayWidth	FieldNameDATERUN  TStringFieldStringField9DisplayLabel   @5<ODisplayWidth
	FieldNameTIMERUNSize  TStringFieldtaTimeEvnDescriptDisplayLabel   @>F5AADisplayWidth<	FieldKindfkLookup	FieldNameDescriptLookupDataSettaTEPacketsLookupKeyFields
KOD_PACKETLookupResultFieldDESCRIPT	KeyFields
KOD_PACKETReadOnly	Size2Lookup	   TDataSourcedsParamTimeEvnDataSettaParamTimeEvnLeft� Top�   TTabletaTEPackets	AfterPosttaTEPacketsAfterPostAfterDeletetaTEPacketsAfterDeleteDatabaseNameUHTA_BDE	IndexName
KOD_PACKETReadOnly		TableNamePACKETS.DBFLeft�Top�  TDataSourcedsTEPacketsDataSettaTEPacketsLeft�Top�  TTabletaTELock	AfterPosttaTELockAfterPostAfterDeletetaTELockAfterDeleteDatabaseNameUHTA_BDE	TableNameLOCK.DBFLeft0Top�  TDataSourcedsTELockDataSettaTELockLeftPTop�  TTabletaParamPingListAfterInserttaListFilesAfterInsert	AfterPosttaListFilesAfterPostAfterDeletetaListFilesAfterDeleteDatabaseNameUHTA_BDE	TableNamepinglist.DBFLeft� Top(  TDataSourcedsParamPingListDataSettaParamPingListLeft� Top(  TTable
taPingListAfterInserttaListFilesAfterInsert	AfterPosttaListFilesAfterPostAfterDeletetaListFilesAfterDeleteDatabaseNameUHTA_BDE	TableNamepinglist.DBFLeftTop(  TDataSource
dsPingListDataSet
taPingListLeft8Top(  TTabletaParamLoadTaskAfterInserttaLoadTaskAfterInsert	AfterPosttaLoadTaskAfterPostBeforeDeletetaLoadTaskBeforeDeleteAfterDeletetaLoadTaskAfterDeleteDatabaseNameUHTA_BDE	IndexNameOWNER_ID	TableNameLOADTASK.DBFLeft� TopX TFloatFieldtaParamLoadTaskID	FieldNameID  TFloatFieldtaParamLoadTaskID_ORDER	FieldNameID_ORDER  TStringFieldtaParamLoadTaskFILENAME	FieldNameFILENAMESize2  
TDateFieldtaParamLoadTaskLASTDATE	FieldNameLASTDATE  TStringFieldtaParamLoadTaskLASTTIME	FieldNameLASTTIMESize  TFloatFieldtaParamLoadTaskOWNER_ID	FieldNameOWNER_ID  TStringFieldtaParamLoadTaskLOADER	FieldNameLOADERSize2  TStringFieldtaParamLoadTaskTASK	FieldNameTASK  TBooleanFieldtaParamLoadTaskRUN	FieldNameRUN  TStringFieldtaParamLoadTaskMODULE	FieldNameMODULESize2  TStringFieldtaParamLoadTaskPARAMS	FieldNamePARAMS  TSmallintFieldtaParamLoadTaskTIPMODULE	FieldName	TIPMODULE  TStringFieldtaParamLoadTaskTIP	FieldKindfkLookup	FieldNameTIPLookupDataSettaParamTipEventLookupKeyFieldsTIPLookupResultFieldNAME	KeyFields	TIPMODULELookup	  TBooleanFieldtaParamLoadTaskFOR_OWNER	FieldName	FOR_OWNER   TDataSourcedsParamLoadTaskDataSettaParamLoadTaskLeft� TopX  TTable
taLoadTaskAfterInserttaLoadTaskAfterInsert	AfterPosttaLoadTaskAfterPostBeforeDeletetaLoadTaskBeforeDeleteAfterDeletetaLoadTaskAfterDeleteDatabaseNameUHTA_BDE	FieldDefsNameIDDataTypeftFloat NameID_ORDERDataTypeftFloat NameFILENAMEDataTypeftStringSize2 Name	FOR_OWNERDataType	ftBoolean NameLASTDATEDataTypeftDate NameLASTTIMEDataTypeftStringSize NameOWNER_IDDataTypeftFloat NameLOADERDataTypeftStringSize2 NameTASKDataTypeftStringSize NameRUNDataType	ftBoolean NameMODULEDataTypeftStringSize2 NamePARAMSDataTypeftStringSize Name	TIPMODULEDataType
ftSmallint  	IndexDefsNameIDFieldsIDSourceLOADTASK.CDX NameOWNER_ID
ExpressionOWNER_ID*100000+ID_ORDEROptionsixExpression SourceLOADTASK.CDX  	IndexNameOWNER_ID	StoreDefs		TableNameLOADTASK.DBFLeftTopX  TDataSource
dsLoadTaskDataSet
taLoadTaskLeft8TopX  TTable	taLogTask	AfterPosttaProtokolAfterPostAfterDeletetaProtokolAfterDeleteDatabaseNameUHTA_BDE	TableNameLOG_TASK.DBFLeftTop�   TDataSource	dsLogTaskDataSet	taLogTaskLeft8Top�   TTabletaListLoadTaskAfterInserttaLoadTaskAfterInsert	AfterPosttaLoadTaskAfterPostBeforeDeletetaLoadTaskBeforeDeleteAfterDeletetaLoadTaskAfterDeleteDatabaseNameUHTA_BDE	FieldDefsNameIDDataTypeftFloat NameID_ORDERDataTypeftFloat NameFILENAMEDataTypeftStringSize2 Name
PARENTNAMEDataTypeftStringSize2 NameLASTDATEDataTypeftDate NameLASTTIMEDataTypeftStringSize NameOWNER_IDDataTypeftFloat NameLOADERDataTypeftStringSize2 NameTASKDataTypeftStringSize NameRUNDataType	ftBoolean NameMODULEDataTypeftStringSize2 NamePARAMSDataTypeftStringSize Name	TIPMODULEDataType
ftSmallint  	IndexDefsNameIDFieldsIDSourceLOADTASK.CDX NameOWNER_ID
ExpressionOWNER_ID*100000+ID_ORDEROptionsixExpression SourceLOADTASK.CDX  	IndexNameID	StoreDefs		TableNameLOADTASK.DBFLeft�TopX  TDataSourcedsListLoadTaskDataSettaListLoadTaskLeft TopX  TDataSourcedsViewLogTaskDataSetqViewLogTaskLeftTop�   TADOConnection	UHTA_ODBCConnectionStringDProvider=MSDASQL.1;Persist Security Info=False;Data Source=UHTA_ODBCLoginPromptProvider	MSDASQL.1Left�Top   	TDatabaseUHTA_BDE	AliasNameUHTADatabaseNameUHTA_BDELoginPromptSessionNameDefaultLeft�Top�   	TADOQueryqViewLogTask
Connection	UHTA_ODBC
CursorTypectStatic
Parameters SQL.Strings1SELECT * FROM log_task ORDER BY lastdate,lasttime Left� Top�   	TADOQueryADOQuery
Connection	UHTA_ODBC
Parameters Left�Top    