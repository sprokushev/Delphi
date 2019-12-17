(*
**      DELPHI Declarations for crpe32.DLL (Originally for Turbo Pascal)
**      ================================================================
**                    
**      File:         CRPE32.PAS
**
**      Author:       Kenneth Lee - 16 Bit
**                    James Anderson - 32 Bit
**        Date:       15 Jun 92 - 16 Bit
**                    05 Jan 96 - 32 Bit
**
**
**      Purpose:      This file presents the API to the Crystal Reports
**                    32 Bit Print Engine DLL.
**
**      Language:     Delphi
**
**      Copyright (c) 1991-1996 Seagate Software Information Management Group, Inc.
**
**      Revisions:    02/11/93 CRD - New calls for 2.0
**                    02/11/93 KYL - Compiled For 2.0 to CRPE.TPW
**                    03/24/93 CRD - New calls for 2.0 PRO
**                    05/09/93 CRD - SQL Log On/Off
**                    02/07/94 KYL - 3.0 compatibility - CRPE.TPW
**                    02/14/94 KYL - Added UX Structures (BPW 7.0)
**                    03/14/94 KYL - GetSQLQuery, SetSQLQuery
**                    11/07/94 KYL - Revised for 4.0
**                    05/01/95 KLH - Revised for DELPHI (Boolean changed to Bool)
**                    07/15/95 SLF - Revised for DELPHI
**                                   Changed the following Types to Zero-Based Arrays
**                                     PEDllNameType
**                                     PEFullNameType
**                                     PELogonServerType
**                                     PELogonDbType
**                                     PELogonUserType
**                                     PELogonPassType
**                                     PETableLocType
**                                     PEGraphTextType
**                    01/05/96 JEA - Revised for 32 Bit Delphi
**                    01/15/96 JEA - Added STDCALL to all function calls
**                    01/19/96 JEA - Revised Types to Match CRPE.H
**                                   Added {A-} compiler directive to match
**                                   byte alignment of the Print Engine
**                    02/28/96 JEA - Changed TDevMode in PEGetSelectedPrinter
**                                   and PESelectPrinter to THandle
**                    02/29/96 JEA - Added UXFXls5Type constant for exporting
**                                   to Excel 5.
**                    02/29/96 JEA - Removed UXDSMIType constant, UXDSMIOptions
**                                   record definition and UXDSMIOptionsSize
**                                   constant as Crystal Reports 32 Bit doesn't
**                                   export to 32 Bit VIM mail.
**                    02/29/96 JEA - Added declaration for PECanCloseEngine.
**                    03/01/96 JEA - Added declaration for PELogOnSQLServerWithPrivateInfo
**                    03/01/96 JEA - Changed PEExportOptions.formatOptions and
**                                   PEExportOptions.destinationOptions to type
**                                   Pointer.
**                    03/18/96 ABC - Changed printJob to Word data type. CRPE is
**                                   expecting a 16 bit short datatype (C++)
**                    04/18/96 ABC - Converted the THandle for the Devmode in the
**                                   PEGetSelectedPrinter and PESelectPrinter to
**                                   PEDeviceMode
**                    05/11/96 JEA - Revised for 5.0 as follows
**                                   Added the following error codes:
**                                   	PE_ERR_BADSECTIONHEIGHT    = 560;
**                                   	PE_ERR_BADVALUETYPE        = 561;
**                                   	PE_ERR_INVALIDSUBREPORTNAME= 562;
**                                   	PE_ERR_FIELDEXIST          = 563;
**                                   	PE_ERR_NOPARENTWINDOW      = 564;
**                                   	PE_ERR_INVALIDZOOMFACTOR   = 565;
**                                   Added the following constants:
**                                   	PE_SUBREPORT_NAME_LEN      = 128;
**                                      PE_SIZEOF_SUBREPORT_INFO;
**                                      PE_PF_NAME_LEN             = 256;
**                                      PE_PF_PROMPT_LEN           = 256;
**                                      PE_PF_VALUE_LEN            = 256;
**                                      PE_PF_NUMBER               = 0  ;
**                                      PE_PF_CURRENCY             = 1  ;
**                                      PE_PF_BOOLEAN              = 2  ;
**                                      PE_PF_DATE                 = 3  ;
**                                      PE_PF_STRING               = 4  ;
**                                      PE_SIZEOF_VARINFO_TYPE
**                                      PE_PARAMETER_NAME_LEN      = 128;
**                                      PE_SIZEOF_PARAMETER_INFO
**                                      PE_SECT_PAGE_HEADER        = 2;
**                                      PE_SECT_PAGE_FOOTER        = 7;
**                                      PE_SECT_REPORT_HEADER      = 1;
**                                      PE_SECT_REPORT_FOOTER      = 8;
**                                      PE_SECT_GROUP_HEADER       = 3;
**                                      PE_SECT_GROUP_FOOTER       = 5;
**                                      PE_SECT_DETAIL             = 4;
**                                      UXDExchFolderType 	   = 0;
**                                      UXDPostDocMessage          = 1011;
**                                      UXDPostFolderOptionsSize
**                                      UXFODBCType                = 0;
**                                      UXFODBCOptionsSize
**                                      UXFHTML3Type               = 0;
**                                      UXFExplorer2Type	   = 1;
**                                      UXFNetscape2Type	   = 2;
**                                      UXFHTML3OptionsSize
**                                   Added the following types:
**                                   	PESubreportNameType
**                                      PEParameterFieldNameType
**                                      PEParameterFieldTextType
**                                      PEParameterFieldValueType
**                                      PEProcParamNameType
**                                   Added the following structures:
**                                   	PESubreportInfo
**                                      PEParameterFieldInfo
**                                      PEParameterInfo
**                                      UXDPostFolderOptions
**                                      UXFODBCOptions
**                                      UXFHTML3Options
**                                   Added the following declartions:
**                                   	PEGetNSubreportsInSection
**                                      PEGetNthSubreportInSection
**                                      PEGetSubreportInfo
**                                      PEOpenSubreport
**                                      PECloseSubreport
**                                      PEGetNParameterFields
**                                      PEGetNthParameterField
**                                      PESetNthParameterField
**                                      PEGetNSections
**                                      PEGetSectionCode
**                                      PEGetNPages
**                                      PEShowNthPage
**                                      PESetDialogParentWindow
**                                      PEEnableProgressDialog
**                                      PEGetNthParamInfo
**                                   Added the following functions:
**                                      PE_SECTION_CODE
**                                      PE_SECTION_TYPE
**                                      PE_GROUP_N
**                                      PE_SECTION_N
**                    05/12/96 JEA - Changed external 'crpe32' to external 'crpe32.dll'
**                                   for Windows NT.
**                    06/02/96 JEA - Added the following constant
**                                      PE_UNCHANGED_COLOR         = -2;
**                                   Added the following structure members
**                                      PESectionOptions.underlaySection
**                                      PESectionOptions.backgroundColor
**                    06/14/96 JEA - Changed
**                                   function PEGetGraphText (printJob,
**                                     sectionCode,
**                                     graphN:            integer;
**                                     var graphDataInfo: PEGraphTextInfo
**                                    ):Bool stdcall;
**                                   to:
**                                   function PEGetGraphText (printJob,
**                                     sectionCode,
**                                     graphN:            integer;
**                                     var graphTextInfo: PEGraphTextInfo
**                                    ):Bool stdcall;
**                     
**    		      07/05/96 JEA - Changed the return type on these calls to Smallint:
**                                     PEPrintReport
**				       PEGetVersion
**				       PEOpenPrintJob
**		                       PEGetJobStatus
**		                       PEGetErrorCode
**		                       PEGetNGroups
**		                       PEGetNFormulas
**		                       PEGetNSortFields
**		                       PEGetNGroupSortFields
**		                       PEGetNTables
**		                       PEGetNParams
**	 	                       PEGetNLinesInSection
**
**		                     Added STDCALL keyword to PESetSectionFormat declaration
** 
**	                             Changed printjob argument from integer to word for these calls;
**		                       PEClosePrintJob
**		                       PEEnableProgressDialog
**
**                    07/06/96 JEA - Added the following for Paginated Text Export
**                                     UXFPaginatedTextType   = 2;
**
**                                     UXFPaginatedTextOptions = record
**                                                               structSize     :Word;
**                                                               nLinesPerPage  :Word;
**                                                               end;
**
**                                     UXFPaginatedTextOptionsSize = sizeof (UXFPaginatedTextOptions); 
**
**                    07/08/96 JEA - Changed the declaration of PESessionInfo
**                                   from
**                                   PESessionInfo
**                                        SessionHandle      :longint;
**                                   to
**                                   PESessionInfo
**                                        SessionHandle      :DWORD;
**
**                    07/11/96 JEA - Removed declarations for the following calls
**				     PESetLineHeight
**				     PEGetNLinesInSection
**                                   PEGetLineHeight
**                                   For old code:
**                                     PESetLineHeight now calls PESetMinimumSectionHeight
**                                     PEGetLineHeight now calls PEGetMinimumSectionHeight
**                                     PEGetNLineInSection always returns 1.
**                    08/02/96 JEA - Added the following error codes
**                                     PE_ERR_PAGESIZEOVERFLOW    = 567;
**                                     PE_ERR_LOWSYSTEMRESOURCES  = 568;
**                                 - Changed the following parameters
**                                   from integer to word:
**                                     PEGetErrorText(textLength)
**                                     PEGetGroupCondition (conditionFieldLength, condition, sortDirection)
**                                     PEGetNthFormula (nameLength, textLength)
**                                     PEGetFormula (textLength)
**                                     PEGetSelectionFormula (textLength)
**                                     PEGetGroupSelectionFormula (textLength)
**                                     PEGetNthSortField (nameLength, direction)
**                                     PEGetNthGroupSortField (nameLength, direction)
**                                     PEGetNthParam(textLength)
**                                     PEGetSQLQuery (textLength)
**                                     PEGetReportTitle (titleLength)
**                                     PEGetSelectedPrinter (driverLength, printerLength, portLength)
**                                     PEGetPrintDate (year, month, day)
**                                     PEGetMinimumSectionHeight (minimumHeight)
**                                 - Removed the Var keyword from the following parameters:
**                                     PESetGraphType (graphType)
**                                     PESetGraphData (graphDataInfo)
**                                     PESetGraphText (graphTextInfo)
**                                     PESetGraphOptions (graphOptions)
**                                 - Added the following format formula name constants:
**                                     SECTION_VISIBILITY      = 58;
**                                     NEW_PAGE_BEFORE         = 60;
**                                     NEW_PAGE_AFTER          = 61;
**                                     KEEP_SECTION_TOGETHER   = 62;
**                                     SUPPRESS_BLANK_SECTION  = 63;
**                                     RESET_PAGE_N_AFTER      = 64;
**                                     PRINT_AT_BOTTOM_OF_PAGE = 65;
**                                     UNDERLAY_SECTION        = 66;
**                                     SECTION_BACK_COLOUR     = 67;
**                                 - Added the following function:
**                                     function PESetSectionFormatFormula(printJob : Word;
**                                                                        sectionCode : integer;
**                                                                        formulaName : integer;
**                                                                        formulaString : integer
**                                                                       ):Bool stdcall;
**                                 - Changed structure member from
**                                     PESectionOptions.SuppressBlankLines
**                                     to PESectionOptions.SuppressBlankSection
**
**                    08/06/96 JEA - Change the following declaration from:
**                                     function PEOutputToWindow (printJob:           Word;
**                                                                title:              PChar;
**                                                                left:		      Word;
**                                                                top:		      Word;
**                                                                width:	      Word;
**                                                                height:             Word;
**                                                                style:              longint;
**                                                                parentWindow:       HWnd
**                                                               ):Bool stdcall;
**                                     to:
**                                     function PEOutputToWindow (printJob:           Word;
**                                                                title:              PChar;
**                                                                left:		      longint;
**                                                                top:	              longint;
**                                                                width:	      longint;
**                                                                height:             longint;
**                                                                style:              longint;
**                                                                parentWindow:       HWnd
**                                                               ):Bool stdcall;
**                    08/02/96 JEA - Added
**                                     showArea:             Word;
**                                     freeFormPlacement:    Word;
**                                   members to PESectionOptions structure
**                    09/05/96 JEA - Changed
**                                   PEGraphDataInfo.rowGroupN and PEGaphDataInfo.colGroupN from Word
**                                   to
**                                   SmallInt
**                    10/07/96 JEA - Changed
**                                   PESectionOptions = record
**                                   (*Initialize to sizeof PESectionOptions
**                                   StructSize:          Word;
**
**                                   visible:              Word;  (* BOOLEAN values, except use PE_UNCHANGED
**                                   newPageBefore:        Word;  (* to preserve the existing settings
**                                   newPageAfter:         Word;
**                                   keepTogether:         Word;
**                                   suppressBlankSection: Word;
**                                   resetPageNAfter:      Word;
**                                   printAtBottomOfPage:  Word;
**                                   backgroundColor:      COLORREF;   // Use PE_UNCHANGED_COLOR to preserve the
**                                                                     // existing color.
**                                   underlaySection:      Word;
**                                   showArea:             Word;  (* BOOLEAN values, except use PE_UNCHANGED
**                                   freeFormPlacement:    Word;  (* to preserve the existing settings
**                                   end;
**                                   to
**                                   PESectionOptions = record
**                                   (*Initialize to sizeof PESectionOptions
**                                   StructSize:          Word;
**
**                                   visible:              Smallint;  (* BOOLEAN values, except use PE_UNCHANGED
**                                   newPageBefore:        Smallint;  (* to preserve the existing settings
**                                   newPageAfter:         Smallint;
**                                   keepTogether:         Smallint;
**                                   suppressBlankSection: Smallint;
**                                   resetPageNAfter:      Smallint;
**                                   printAtBottomOfPage:  Smallint;
**                                   backgroundColor:      COLORREF;   // Use PE_UNCHANGED_COLOR to preserve the
**                                                                     // existing color.
**                                   underlaySection:      Smallint;
**                                   showArea:             Smallint;  (* BOOLEAN values, except use PE_UNCHANGED
**                                   freeFormPlacement:    Smallint;  (* to preserve the existing settings
**                                   end;
**                                   to accomodate PE_UNCHANGED of -1
**                    10/15/96 JEA - Added 3 declarations
**                                     PESetAreaFormat
**                                     PESetAreaFormatFormula
**                                     PEGetAreaFormat
**                                 - Added a function to create area codes
**                                     PE_AREA_CODE
**                                 - Fixed PESetSectionFormatFormula by changing
**                                     formulaString: integer to
**                                     formulaString: PChar
**                                 - Fixed PESetSectionFormat by removing the
**                                     var from options: PESectionOptions
**                    11/04/96 JEA - Added constant
**                                     PE_SIZEOF_PARAMETER_FIELD_INFO
**                    01/10/97 JEA - Added the new PE_FFN_ naming convention for Format Formula names
**                                 - Added the following Constants
**				       PE_FFN_SHOW_AREA
**                                     PE_VI_STRING_LEN
**                                     PE_SIZEOF_VALUE_INFO
**                                 - Added the following Types
**                                     PEVALUEINFOSTRINGTYPE
**                                     PEVALUEINFODATEORTIMETYPE
**                                     PEVALUEINFODATETIMETYPE
**                                     PEValueInfo 
**                                 - Added the following Declarations
**                                     function PEConvertPFInfoToVInfo
**                                     function PEConvertVInfoToPFInfo
**                                 -  Added the following Error Codes
**                                     PE_ERR_BADGROUPNUMBER             = 570;
**                                     PE_ERR_INVALIDNEGATIVEVALUE       = 572;
**                                     PE_ERR_INVALIDMEMORYPOINTER       = 573;
**                                     PE_ERR_INVALIDPARAMETERNUMBER     = 594;
**                                     PE_ERR_SQLSERVERNOTOPENED         = 599;
**                    01/31/97 JEA - Added constant
**                                     PE_PF_REPORT_NAME_LEN = 128;
**                                   Added Type
**                                     PE_PF_ReportNameType
**                                   Added Record Members
**                                     PEParameterFieldInfo.ReportName
**                                     PEParameterFieldInfo.needsCurrentValue
**                    04/30/97 JEA - Added Constants
**                              PE_SIZEOF_WINDOW_OPTIONS
**                              PE_FFN_AREASECTION_VISIBILITY
**                           Added Type
**                              PEWindowOptions
**                           Added Functions
**                              PEGetSectionFormatFormula
**                              PEGetAreaFormatFormula
**                              PEGetWindowOptions
**                              PESetWindowOptions
**                           Added PE_AREA_CODE to the interface section
**                    05/20/97 JEA - Added Constants
**                              PE_VI_NUMBER
**                              PE_VI_CURRENCY
**                              PE_VI_BOOLEAN
**                              PE_VI_DATE
**                              PE_VI_STRING
**                              PE_VI_DATETIME
**                              PE_VI_TIME
**                              PE_VI_INTEGER
**                              PE_VI_COLOR
**                              PE_VI_CHAR
**                              PE_VI_LONG
**                              PE_VI_NOVALUE
**                              PE_CLOSE_PRINT_WINDOW_EVENT
**                              PE_ACTIVATE_PRINT_WINDOW_EVENT
**                              PE_DEACTIVATE_PRINT_WINDOW_EVENT
**                              PE_PRINT_BUTTON_CLICKED_EVENT
**                              PE_EXPORT_BUTTON_CLICKED_EVENT
**                              PE_ZOOM_CONTROL_SELECTED_EVENT
**                              PE_FIRST_PAGE_BUTTON_CLICKED_EVENT
**                              PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT
**                              PE_NEXT_PAGE_BUTTON_CLICKED_EVENT
**                              PE_LAST_PAGE_BUTTON_CLICKED_EVENT
**                              PE_CANCEL_BUTTON_CLICKED_EVENT
**                              PE_CLOSE_BUTTON_CLICKED_EVENT
**                              PE_SEARCH_BUTTON_CLICKED_EVENT
**                              PE_GROUPTREE_BUTTON_CLICKED_EVENT
**                              PE_PRINT_SETUP_BUTTON_CLICKED_EVENT
**                              PE_REFRESH_BUTTON_CLICKED_EVENT
**                              PE_SHOW_GROUP_EVENT
**                              PE_DRILL_ON_GROUP_EVENT
**                              PE_DRILL_ON_DETAIL_EVENT
**                              PE_READING_RECORDS_EVENT
**                              PE_START_EVENT
**                              PE_STOP_EVENT
**                              PE_TO_NOWHERE
**                              PE_TO_WINDOW
**                              PE_TO_PRINTER
**                              PE_TO_EXPORT
**                              PE_FROM_QUERY
**                              PE_SIZEOF_START_EVENT_INFO
**                              PE_SIZEOF_STOP_EVENT_INFO
**                              PE_SIZEOF_READING_RECORDS_EVENT_INFO
**                              PE_SIZEOF_GENERAL_PRINT_WINDOW_EVENT_INFO
**                              PE_SIZEOF_ZOOM_LEVEL_CHANGING_EVENT_INFO
**                              PE_SIZEOF_CLOSE_BUTTON_CLICKED_EVENT_INFO
**                              PE_SEARCH_STRING_LEN
**                              PE_SIZEOF_SEARCH_BUTTON_CLICKED_EVENT_INFO
**                              PE_SIZEOF_GROUP_TREE_BUTTON_CLICKED_EVENT_INFO
**                              PE_SIZEOF_SHOW_GROUP_EVENT_INFO
**                              PE_DE_ON_GROUP
**                              PE_DE_ON_GROUPTREE
**                              PE_DE_ON_GRAPH
**                              PE_SIZEOF_DRILL_ON_GROUP_EVENT_INFO
**                              PE_FIELD_NAME_LEN
**                              PE_SIZEOF_FIELD_VALUE_INFO
**                              PE_SIZEOF_DRILL_ON_DETAIL_EVENT_INFO
**                              PE_SIZEOF_ENABLE_EVENT_INFO
**                              PE_TC_DEFAULT_CURSOR
**                              PE_TC_ARROW_CURSOR
**                              PE_TC_CROSS_CURSOR
**                              PE_TC_IBEAM_CURSOR
**                              PE_TC_UPARROW_CURSOR
**                              PE_TC_SIZEALL_CURSOR
**                              PE_TC_SIZENWSE_CURSOR
**                              PE_TC_SIZENESW_CURSOR
**                              PE_TC_SIZEWE_CURSOR
**                              PE_TC_SIZENS_CURSOR
**                              PE_TC_NO_CURSOR
**                              PE_TC_WAIT_CURSOR
**                              PE_TC_APPSTARTING_CURSOR
**                              PE_TC_HELP_CUROSR
**                              PE_TC_MAGNIFY_CURSOR
**                              PE_SIZEOF_TRACK_CURSOR_INFO
**                           Added Record Members
**                              PEValueInfo.ignored
**                              PEValueInfo.viLong
**                              PEWindowOptions.hasPrintSetupButton
**                              PEWindowOptions.hasRefreshButton
**                           Added Types
**                              PEStartEventInfo
**                              PEStopEventInfo
**                              PEReadingRecordsEventInfo
**                              PEGeneralPrintWindowEventInfo
**                              PEZoomLevelChangingEventInfo
**                              PECloseButtonClickedEventInfo
**                              PESearchStringType
**                              PESearchButtonClickedEventInfo
**                              PEGroupTreeButtonClickedEventInfo
**                              PEPCharPointer
**                              PEShowGroupEventInfo
**                              PEDrillOnGroupEventInfo
**                              PEDrillOnGroupEventInfoPtr
**                              PEFieldValueInfo
**                              PEFieldValueInfoPtr
**                              PEFieldValueInfoDoublePtr
**                              PEDrillOnDetailEventInfo
**                              PEEnableEventInfo
**                              PETrackCursorInfo
**                           Added Functions
**                              PEEnableEvent
**                              PEGetEnableEventInfo
**                              PESetEventCallback
**                              PEGetTrackCursorInfo
**                              PESetTrackCursorInfo
**                    07/10/97 JEA - Added Constants
**                              PE_GO_TBN_ALL_GROUPS_UNSORTED
**                              PE_GO_TBN_ALL_GROUPS_SORTED
**                              PE_GO_TBN_TOP_N_GROUPS
**                              PE_GO_TBN_BOTTOM_N_GROUPS
**                              PE_SF_ORIGINAL
**                              PE_SF_SPECIFIED
**                              PE_SIZEOF_GROUP_OPTIONS
**                              PE_SI_APPLICATION_NAME_LEN
**                              PE_SI_TITLE_LEN
**                              PE_SI_SUBJECT_LEN
**                              PE_SI_AUTHOR_LEN
**                              PE_SI_KEYWORDS_LEN
**                              PE_SI_COMMENTS_LEN
**                              PE_SI_REPORT_TEMPLATE_LEN
**                              PE_SIZEOF_REPORT_SUMMARY_INFO
**                              PE_GC_CONDITIONMASK
**                              PE_GC_TYPEMASK
**                              PE_GC_TYPEOTHER
**                              PE_GC_TYPEDATE
**                              PE_GC_TYPEBOOLEAN
**
**                           Added Types
**                              PEGroupOptions
**                              PEApplicationNameType
**                              PETitleType
**                              PESubjectType
**                              PEAuthorType
**                              PEKeywordsType
**                              PECommentsType
**                              PEReportTemplateType
**                              PEReportSummaryInfo
**                           Added Functions
**                              PEGetGroupOptions
**                              PESetGroupOptions
**                              PEGetReportSummaryInfo
**                              PESetReportSummaryInfo
**                    07/14/97 JEA - Added Constants
**                              UXFHTML32ExtType
**                              UXFHTML32StdType
**                              UXFXls5TypeTab
**                              PE_PT_LONGVARCHAR
**                              PE_PT_BINARY
**                              PE_PT_VARBINARY
**                              PE_PT_LONGVARBINARY
**                              PE_PT_BIGINT
**                              PE_PT_TINYINT
**                              PE_PT_BIT
**                              PE_PT_CHAR
**                              PE_PT_NUMERIC
**                              PE_PT_DECIMAL
**                              PE_PT_INTEGER
**                              PE_PT_SMALLINT
**                              PE_PT_FLOAT
**                              PE_PT_REAL
**                              PE_PT_DOUBLE
**                              PE_PT_DATE
**                              PE_PT_TIME
**                              PE_PT_TIMESTAMP
**                              PE_PT_VARCHAR
**                    07/16/97 JEA - Changed the PEDeviceMode for the Devmode
**                                   in the PEGetSelectedPrinter and
**                                   PESelectPrinter to PEDeviceModeA
**                                   to support DBCS.
**
**      Notes:        This file will create a crpe32.DCU when you use
**                    Compile and Build.
**
**                    To use the crpe32.DCU, you will need to add the
**                    following line of code to your 'uses' section
**                    of your Delphi 2.0 application:
**
**                    eg.
**
**                    uses
**                      WinTypes,
**                      crpe32,
**                      ....
**                      WinProcs;
**
**
*)


Unit crpe32;
{$X+}
{$A-}
Interface

uses
  WinTypes,
  WinProcs;


const
  PE_SF_MAX_NAME_LENGTH      = 50;

  PE_SF_DESCENDING           = 0;
  PE_SF_ASCENDING            = 1;
  PE_SF_ORIGINAL             = 2; {only for group condition}
  PE_SF_SPECIFIED            = 3; {only for group condition}


  PE_UNCHANGED               = -1;
  PE_UNCHANGED_COLOR         = -2;

  PE_ERR_NOERROR             = 0;

  PE_ERR_NOTENOUGHMEMORY     = 500;
  PE_ERR_INVALIDJOBNO        = 501;
  PE_ERR_INVALIDHANDLE       = 502;
  PE_ERR_STRINGTOOLONG       = 503;
  PE_ERR_NOSUCHREPORT        = 504;
  PE_ERR_NODESTINATION       = 505;
  PE_ERR_BADFILENUMBER       = 506;
  PE_ERR_BADFILENAME         = 507;
  PE_ERR_BADFIELDNUMBER      = 508;
  PE_ERR_BADFIELDNAME        = 509;
  PE_ERR_BADFORMULANAME      = 510;
  PE_ERR_BADSORTDIRECTION    = 511;
  PE_ERR_ENGINENOTOPEN       = 512;
  PE_ERR_INVALIDPRINTER      = 513;
  PE_ERR_PRINTFILEEXISTS     = 514;
  PE_ERR_BADFORMULATEXT      = 515;
  PE_ERR_BADGROUPSECTION     = 516;
  PE_ERR_ENGINEBUSY          = 517;
  PE_ERR_BADSECTION          = 518;
  PE_ERR_NOPRINTWINDOW       = 519;
  PE_ERR_JOBALREADYSTARTED   = 520;
  PE_ERR_BADSUMMARYFIELD     = 521;
  PE_ERR_NOTENOUGHSYSRES     = 522;
  PE_ERR_BADGROUPCONDITION   = 523;
  PE_ERR_JOBBUSY             = 524;
  PE_ERR_BADREPORTFILE       = 525;
  PE_ERR_NODEFAULTPRINTER    = 526;
  PE_ERR_SQLSERVERERROR      = 527;
  PE_ERR_BADLINENUMBER       = 528;
  PE_ERR_DISKFULL            = 529;
  PE_ERR_FILEERROR           = 530;
  PE_ERR_INCORRECTPASSWORD   = 531;
  PE_ERR_BADDATABASEDLL      = 532;
  PE_ERR_BADDATABASEFILE     = 533;
  PE_ERR_ERRORINDATABASEDLL  = 534;
  PE_ERR_DATABASESESSION     = 535;
  PE_ERR_DATABASELOGON       = 536;
  PE_ERR_DATABASELOCATION    = 537;
  PE_ERR_BADSTRUCTSIZE       = 538;
  PE_ERR_BADDATE             = 539;
  PE_ERR_BADEXPORTDLL        = 540;
  PE_ERR_ERRORINEXPORTDLL    = 541;
  PE_ERR_PREVATFIRSTPAGE     = 542;
  PE_ERR_NEXTATLASTPAGE      = 543;
  PE_ERR_CANNOTACCESSREPORT  = 544;
  PE_ERR_USERCANCELLED       = 545;
  PE_ERR_OLE2NOTLOADED       = 546;
  PE_ERR_BADCROSSTABGROUP    = 547;
  PE_ERR_NOCTSUMMARIZEDFIELD = 548;
  PE_ERR_DESTINATIONNOTEXPORT= 549;
  PE_ERR_INVALIDPAGENUMBER   = 550;
  PE_ERR_NOTSTOREDPROCEDURE  = 552;
  PE_ERR_INVALIDPARAMETER    = 553;
  PE_ERR_GRAPHNOTFOUND       = 554;
  PE_ERR_INVALIDGRAPHTYPE    = 555;
  PE_ERR_INVALIDGRAPHDATA    = 556;
  PE_ERR_CANNOTMOVEGRAPH     = 557;
  PE_ERR_INVALIDGRAPHTEXT    = 558;
  PE_ERR_INVALIDGRAPHOPT     = 559;

  {New Error Codes for 5.0}
  PE_ERR_BADSECTIONHEIGHT           = 560;
  PE_ERR_BADVALUETYPE               = 561;
  PE_ERR_INVALIDSUBREPORTNAME       = 562;
  PE_ERR_NOPARENTWINDOW             = 564; {dialog parent window}
  PE_ERR_INVALIDZOOMFACTOR          = 565; {zoom factor}
  PE_ERR_PAGESIZEOVERFLOW           = 567;
  PE_ERR_LOWSYSTEMRESOURCES         = 568;
  PE_ERR_BADGROUPNUMBER             = 570;
  PE_ERR_INVALIDNEGATIVEVALUE       = 572;
  PE_ERR_INVALIDMEMORYPOINTER       = 573;
  PE_ERR_INVALIDPARAMETERNUMBER     = 594;
  PE_ERR_SQLSERVERNOTOPENED         = 599;

  PE_ERR_NOTIMPLEMENTED             = 999;

  (*
  ** Get version info
  ** ----------------
  *)
  PE_GV_DLL                  = 100;
  PE_GV_ENGINE               = 200;

  MaxChar                    = 255;

  PE_JOBNOTSTARTED       = 1;
  PE_JOBINPROGRESS       = 2;
  PE_JOBCOMPLETED        = 3;
  PE_JOBFAILED           = 4;
  PE_JOBCANCELLED        = 5;

  PE_WORD_LEN            = 2;
  PE_DWORD_LEN           = 4;
  PE_DLL_NAME_LEN        = 64;
  PE_FULL_NAME_LEN       = 256;

  PE_SIZEOF_TABLE_TYPE   = PE_WORD_LEN + PE_DLL_NAME_LEN + PE_FULL_NAME_LEN + PE_WORD_LEN;

  PE_DT_STANDARD         = 1;
  PE_DT_SQL              = 2;

  PE_LONGPTR_LEN         = 4;
  PE_SESS_USERID_LEN     = 128;
  PE_SESS_PASSWORD_LEN   = 128;

  PE_SIZEOF_SESSION_INFO = PE_WORD_LEN + PE_SESS_USERID_LEN + PE_SESS_PASSWORD_LEN + PE_LONGPTR_LEN;

  PE_SERVERNAME_LEN      = 128;
  PE_DATABASENAME_LEN    = 128;
  PE_USERID_LEN          = 128;
  PE_PASSWORD_LEN        = 128;

  PE_SIZEOF_LOGON_INFO   = PE_WORD_LEN + PE_SERVERNAME_LEN + PE_DATABASENAME_LEN + PE_USERID_LEN + PE_PASSWORD_LEN;

  PE_TABLE_LOCATION_LEN  = 256;

  PE_SIZEOF_TABLE_LOCATION = PE_WORD_LEN + PE_TABLE_LOCATION_LEN;

  PE_SIZEOF_EXPORT_OPTIONS = 3*PE_WORD_LEN + 2*PE_DLL_NAME_LEN + 4*PE_DWORD_LEN;

  PE_SM_DEFAULT          = $8000;

  (*
  **Section Constants
  **-----------------
  *)

  {Section types for use with PE_SECTION_CODE, PE_SECTION_TYPE, PE_GROUP_N and PE_SECTION_N functions}
  PE_SECT_PAGE_HEADER    = 2;
  PE_SECT_PAGE_FOOTER    = 7;
  PE_SECT_REPORT_HEADER  = 1;
  PE_SECT_REPORT_FOOTER  = 8;
  PE_SECT_GROUP_HEADER   = 3;
  PE_SECT_GROUP_FOOTER   = 5;
  PE_SECT_DETAIL         = 4;

  (*
  ** The old section constants with comment showing them in terms of the new:
  ** (Note that PE_GRANDTOTALSECTION and PE_SUMMARYSECTION both map
  ** to PE_SECT_REPORT_FOOTER.)
  *)

  PE_ALLSECTIONS         =    0;
  PE_HEADERSECTION       = 2000;  {PE_SECTION_CODE (PE_SECT_PAGE_HEADER,   0, 0)}
  PE_FOOTERSECTION       = 7000;  {PE_SECTION_CODE (PE_SECT_PAGE_FOOTER,   0, 0)}
  PE_TITLESECTION        = 1000;  {PE_SECTION_CODE (PE_SECT_REPORT_HEADER, 0, 0)}
  PE_SUMMARYSECTION      = 8000;  {PE_SECTION_CODE (PE_SECT_REPORT_FOOTER, 0, 0)}  
  PE_GROUPHEADER         = 3000;  {PE_SECTION_CODE (PE_SECT_GROUP_HEADER,  0, 0)}
  PE_GROUPFOOTER         = 5000;  {PE_SECTION_CODE (PE_SECT_GROUP_FOOTER,  0, 0)}
  PE_DETAILSECTION       = 4000;  {PE_SECTION_CODE (PE_SECT_DETAIL,        0, 0)}
  PE_GRANDTOTALSECTION   = PE_SUMMARYSECTION;
  
  (*
  ** PEPrintOptions constants for PEGetPrintOptions and PESetPrintOptions
  *)

  PE_MAXPAGEN            = 65535;

  PE_UNCOLLATED          = 0;
  PE_COLLATED            = 1;
  PE_DEFAULTCOLLATION    = 2;

  PE_ALLLINES            = -1;

  PE_FIELDS              = $0001;
  PE_TEXT                = $0002;

  (* Graph Types *)
  PE_SIDE_BY_SIDE_BAR_GRAPH            = 0   ;
  PE_STACKED_BAR_GRAPH                 = 2   ;
  PE_PERCENT_BAR_GRAPH                 = 3   ;
  PE_FAKED_3D_SIDE_BY_SIDE_BAR_GRAPH   = 4   ;
  PE_FAKED_3D_STACKED_BAR_GRAPH        = 5   ;
  PE_FAKED_3D_PERCENT_BAR_GRAPH        = 6   ;
  PE_PIE_GRAPH                         = 40  ;
  PE_MULTIPLE_PIE_GRAPH                = 42  ;
  PE_PROPORTIONAL_MULTI_PIE_GRAPH      = 43  ;
  PE_LINE_GRAPH                        = 80  ;
  PE_AREA_GRAPH                        = 120 ;
  PE_THREED_BAR_GRAPH                  = 160 ;
  PE_USER_DEFINED_GRAPH                = 500 ;
  PE_UNKNOWN_TYPE_GRAPH                = 1000;


  (* Graph Directions. *)
  PE_GRAPH_ROWS_ONLY                   = 0 ;
  PE_GRAPH_COLS_ONLY                   = 1 ;
  PE_GRAPH_MIXED_ROW_COL               = 2 ;
  PE_GRAPH_MIXED_COL_ROW               = 3 ;
  PE_GRAPH_UNKNOWN_DIRECTION           = 20;

  (* Graph constant for rowGroupN, colGroupN, summarizedFieldN in PEGraphDataInfo *)
  PE_GRAPH_DATA_NULL_SELECTION         = -1;

  (* Graph text max length *)
  PE_GRAPH_TEXT_LEN                    = 128;


  (*use PE_ANYCHANGE for all field types except Date*)
  PE_GC_ANYCHANGE        = 0;

  (*use these constants for Date fields*)
  PE_GC_DAILY            = 0;
  PE_GC_WEEKLY           = 1;
  PE_GC_BIWEEKLY         = 2;
  PE_GC_SEMIMONTHLY      = 3;
  PE_GC_MONTHLY          = 4;
  PE_GC_QUARTERLY        = 5;
  PE_GC_SEMIANNUALLY     = 6;
  PE_GC_ANNUALLY         = 7;

  (*use these constants for Boolean fields*)
  PE_GC_TOYES            = 1;
  PE_GC_TONO             = 2;
  PE_GC_EVERYYES         = 3;
  PE_GC_EVERYNO          = 4;
  PE_GC_NEXTISYES        = 5;
  PE_GC_NEXTISNO         = 6;

  (*Controlling Printed Pages*)
  PE_ZOOM_FULL_SIZE           = 0;
  PE_ZOOM_SIZE_FIT_ONE_SIDE   = 1;
  PE_ZOOM_SIZE_FIT_BOTH_SIDES = 2;

  (*UX constants*)
  UXDDiskType            = 0;
  UXDMAPIType            = 1;
  UXFCrystalReportType   = 0;
  UXFDIFType             = 0;
  UXFWordWinType         = 0;
  UXFWordDosType         = 1;
  UXFWordPerfectType     = 2;
  UXFRecordType          = 0;
  UXFTextType            = 0;
  UXFTabbedTextType      = 1;
  UXFPaginatedTextType   = 2;
  UXFRichTextFormatType  = 0;
  UXFCommaSeparatedType  = 0;
  UXFTabSeparatedType    = 1;
  UXFCharSeparatedType   = 2;
  UXFLotusWksType        = 0;
  UXFLotusWk1Type        = 1;
  UXFLotusWk3Type        = 2;
  UXFXls2Type            = 0;
  UXFXls3Type            = 1;
  UXFXls4Type            = 2;
  UXFXls5Type            = 3;
  UXFXls5TypeTab         = 4;

  {Export To Exchange Constants}
  UXDExchFolderType 	= 0   ;
  UXDPostDocMessage     = 1011;   {wDestType for folder messages}

  {Export To ODBC Constants}

  UXFODBCType        = 0;

  {Export to HTML Constants}
  UXFHTML3Type            = 0;    {Draft HTML 3.0 tags}
  UXFExplorer2Type	  = 1;    {Include MS Explorer 2.0 tags}
  UXFNetscape2Type	  = 2;    {Include Netscape 2.0 tags}
  UXFHTML32ExtType        = 1;    {HTML 3.2 tags + bg color extensions}
  UXFHTML32StdType        = 2;    {HTML 3.2 tags}
  
  {Subreport Constants}
  PE_SUBREPORT_NAME_LEN  = 128;
  PE_SIZEOF_SUBREPORT_INFO = PE_WORD_LEN + PE_SUBREPORT_NAME_LEN;
  
   

type
  bufferType                = array [1..MaxChar] of Char;
  PEDllNameType             = array [0..PE_DLL_NAME_LEN-1] of Char;
  PEFullNameType            = array [0..PE_FULL_NAME_LEN-1] of Char;
  PESesPassType             = array [1..PE_SESS_PASSWORD_LEN] of Char;
  PELogonServerType         = array [0..PE_SERVERNAME_LEN-1] of Char;
  PELogonDbType             = array [0..PE_DATABASENAME_LEN-1] of Char;
  PELogonUserType           = array [0..PE_USERID_LEN-1] of Char;
  PELogonPassType           = array [0..PE_PASSWORD_LEN-1] of Char;
  PETableLocType            = array [0..PE_TABLE_LOCATION_LEN-1] of Char;
  PEGraphTextType           = array [0..PE_GRAPH_TEXT_LEN-1] OF Char;
  PESubreportNameType       = array [0..PE_SUBREPORT_NAME_LEN-1] of Char;
  
  PEJobInfo = record
              StructSize        : Word;    (*initialize to sizeof (PEJobInfo)*)
              NumRecordsRead    : longint;
              NumRecordsSelected: longint;
              NumRecordsPrinted : longint;
              DisplayPageN      : Word;    (*the page being displayed in window*)
              LatestPageN       : Word;    (*the page being generated*)
              StartPageN        : Word;    (*user opted, default to 1*)
              PrintEnded        : Bool;    (*full report print completed?*)
              end; 

  PEPrintOptions  = record
                    StructSize              :Word;      (*initialize to sizeof (PEPrintOptions) *)

                    (*
                    ** page and copy numbers are 1-origin
                    ** use 0 to preserve the existing settings
                    *)
                    StartPageN              :Word;
                    StopPageN               :Word;

                    nReportCopies           :Word;
                    Collation               :Word;
                    end;


  PETableType     = record
                    (*INITIALIZE TO PE_SIZEOF_TABLE_TYPE*)
                    StructSize              :Word;
                    (*All strings are null-terminated*)
                    DLLName                 :PEDllNameType;
                    DescriptiveName         :PEFullNameType;
                    DBType                  :Word;
                    end;

  PELogOnInfo        = record

                       (*
                       ** Initialize to PE_SIZEOF_LOGON_INFO.
                       *)
                       StructSize              :Word;

                       (*
                       ** For any of the following values an empty string ("") means to use
                       ** the value already set in the report.  To override a value in the
                       ** report use a non-empty string (e.g. "Server A").  All strings are
                       ** null-terminated.
                       **
                       ** For Netware SQL, pass the dictionary path name in ServerName and
                       ** data path name in DatabaseName.
                       *)
                       ServerName              :PELogonServerType;
                       DatabaseName            :PELogonDbType;
                       UserId                  :PELogonUserType;

                       (*
                       ** Password is undefined when getting information from report.
                       *)
                       Password                :PELogonPassType;
                       end;


  PETableLocation  = record

                     (*
                     ** Initialize to PE_SIZEOF_TABLE_LOCATION.
                     *)
                     StructSize              :Word;

                     (*
                     ** String is null-terminated.
                     *)
                     Location                :PETableLocType;
                     end;

  PESessionInfo    = record

                     (*Initialize to PE_SIZEOF_SESSION_INFO*)
                     StructSize         :Word;

                     (*All strings are null-terminated.*)
                     UserID             :PESesPassType;

                     (*Password is undefined when getting information from report.*)
                     Password           :PESesPassType;

                     (*
                     ** SessionHandle is undefined when getting information from report.
                     ** When setting information, if it is = 0 the UserID and Password
                     ** settings are used, otherwise the SessionHandle is used.
                     *)
                     SessionHandle      :DWORD;
                     end;

  PEExportOptions  = record
                     (*Size of PEExportOptions*)
                     StructSize              :Word;

                     formatDLLName           :PEDllNameType;
                     formatType              :dword;
                     formatOptions           :Pointer;

                     destinationDLLName      :PEDllNameType;
                     destinationType         :dword;

                     destinationOptions      :Pointer;

                     nFormatOptionsBytes     :Word;      (*Set by PEExportOptions*)
                                                         (*Ignored by PEExportTo *)
                     nDestinationOptionsBytes:Word;      (*Set by PEExportOptions*)
                                                         (*Ignored by PEExportTo *)
                     end;


  PESectionOptions = record
                     (*Initialize to sizeof PESectionOptions*)
                     StructSize:          Word;

                     visible:              Smallint;  (* BOOLEAN values, except use PE_UNCHANGED  *)
                     newPageBefore:        Smallint;  (* to preserve the existing settings        *)
                     newPageAfter:         Smallint;
                     keepTogether:         Smallint;
                     suppressBlankSection: Smallint;
                     resetPageNAfter:      Smallint;
                     printAtBottomOfPage:  Smallint;
                     backgroundColor:      COLORREF;   // Use PE_UNCHANGED_COLOR to preserve the
                                                      // existing color.
                     underlaySection:      Smallint;
                     showArea:             Smallint;  (* BOOLEAN values, except use PE_UNCHANGED  *)
                     freeFormPlacement:    Smallint;  (* to preserve the existing settings        *)
                     end;


  PEGraphDataInfo  = record
                     (* initialize to sizeof (PEGraphDataInfo) *)
                     StructSize:        Word;

                     rowGroupN:         SmallInt;  (* group number in report.                        *)
                     colGroupN:         SmallInt;  (* group number in report.                        *)
                     summarizedFieldN:  Word;  (* summarized field number for the group          *)
                                                  (* where the graph stays.                         *)
                     graphDirection:    Word;  (* For normal group/total report, the direction,  *)
                                                  (* is always GRAPH_COLS_ONLY.  For CrossTab       *)
                                                  (* report all four options will change the        *)
                                                  (* graph data.                                    *)
                     end;


  PEGraphTextInfo   = record
                      (* Initialize to sizeof (PEGraphTextInfo) *)
                      StructSize:       Word;

                      (* Strings are null-terminated. *)
                      graphTitle,
                      graphSubTitle,
                      graphFootNote,
                      graphGroupsTitle,
                      graphSeriesTitle,
                      graphXAxisTitle,
                      graphYAxisTitle,
                      graphZAxisTitle:  PEGraphTextType;

                      end;


  PEGraphOptions    = record
                      (* Initialize to sizeof (PEGraphOptions) *)
                      StructSize:     Word;

                      graphMaxValue,
                      graphMinValue:  Double;

                      showDataValue,                   (* Show data values on risers. *)
                      showGridLine,
                      verticalBars,
                      showLegend:     Bool;
                      fontFaceName:   PEGraphTextType;

                      end;




  (*UX Structures*)
  UXDDiskOptions   = record
                     structSize       :Word;
                     fileName         :PChar;
                     end;

  UXDMAPIOptions   = record
                     structSize       :Word;
                     toList           :PChar;
                     ccList           :PChar;
                     subject          :PChar;
                     message          :PChar;
                     end;

  UXFDIFOptions = record
                  structSize             :Word;
                  useReportNumberFormat  :Bool;
                  useReportDateFormat    :Bool;
                  end;

  UXFRecordStyleOptions = record
                          structSize            :Word;
                          useReportNumberFormat :Bool;
                          useReportDateFormat   :Bool;
                          end;

  UXFCommaTabSeparatedOptions = record
                                structSize            :Word;
                                useReportNumberFormat :Bool;
                                useReportDateFormat   :Bool;
                                end;

  UXFCharSeparatedOptions = record
                            structSize              :Word;
                            useReportNumberFormat   :Bool;
                            useReportDateFormat     :Bool;
                            stringDelimiter         :Char;
                            fieldDelimiter          :PChar;
                            end;
  
  {Export to Exchange Structure}

  UXDPostFolderOptions = record
                         structSize    :Word;
                         pszProfile    :PChar;
                         pszPassword   :PChar;
                         wDestType     :Word;
                         pszFolderPath :PChar;
                         end;
  (*
     pszFolderPath has to be in the following format:
     <Message Store Name>@<Folder Name>@<Folder Name>
  *)

  {Export to ODBC Structure}
  
  UXFODBCOptions = record
                   structSize : Word;
                   dataSourceName :PChar;
                   dataSourceUserID :PChar;
                   dataSourcePassword :PChar;
                   exportTableName :PChar;
                   end;

{Export to HTML Structure}

  UXFHTML3Options = record
	            structSize             :Word;  {set to UXFHTML3OptionsSize at run time.}
	            fileName               :PChar; (*ptr to full Windows filepath of HTML output file
				                     e.g. "C:\pub\docs\boxoffic\default.htm"
					             NOTE:
					             - any exported GIF files will be
					             located in the same directory as this file
                                                   *)
                    end;

{Export to Paginated Text Structure}

  UXFPaginatedTextOptions = record
                            structSize     :Word;
                            nLinesPerPage  :Word;
                            end;
  
const
  (*Sizeof UX Structures*)
  UXDDiskOptionsSize              = sizeof (UXDDiskOptions);
  UXDMAPIOptionsSize              = sizeof (UXDMAPIOptions);
  UXFDIFOptionsSize               = sizeof (UXFDIFOptions);
  UXFRecordStyleOptionsSize       = sizeof (UXFRecordStyleOptions);
  UXFCommaTabSeparatedOptionsSize = sizeof (UXFCommaTabSeparatedOptions);
  UXFCharSeparatedOptionsSize     = sizeof (UXFCharSeparatedOptions);
  UXDPostFolderOptionsSize        = sizeof (UXDPostFolderOptions);
  UXFODBCOptionsSize              = sizeof (UXFODBCOptions);
  UXFHTML3OptionsSize             = sizeof (UXFHTML3Options);
  UXFPaginatedTextOptionsSize     = sizeof (UXFPaginatedTextOptions);

type
  {Subreport Structures}

  PESubreportInfo = record
                    structSize :Word; {Initialize to PE_SIZEOF_SUBREPORT_INFO.}
                    name       :PESubreportNameType;
		    end;

(*Functions and Procedures*)

(*
** Open, print and close report (used when no changes needed to report)
** --------------------------------------------------------------------
*)
function PEPrintReport (reportFilePath:               PChar;
                        toDefaultPrinter:	      Bool;
                        toWindow:                     Bool;
                        title:                        PChar;
                        left:			      integer;
                        top:			      integer;
                        width:			      integer;
                        height:                       integer;
                        style:                        longint;
                        parentWindow:                 Hwnd
                       ):Smallint stdcall;


(*
** Open and close print engine
** ---------------------------
*)
function PEOpenEngine: Bool stdcall;

procedure PECloseEngine;

function PECanCloseEngine: Bool stdcall;

(*
** Get version info
** ----------------
*)
function PEGetVersion (versionRequested:              integer
                      ):Smallint stdcall;


(*
** Open and close print job (i.e. report)
** --------------------------------------
*)
function PEOpenPrintJob (reportFilePath:              PChar
                        ):Smallint stdcall;

function PEClosePrintJob (printJob:                   Word
                         ):Bool stdcall;


(*
** Start and cancel print job (i.e. print the report, usually after changing report)
** ---------------------------------------------------------------------------------
*)
function PEStartPrintJob (printJob:                   Word;
                          waitUntilDone:              Bool
                         ):Bool stdcall;

procedure PECancelPrintJob (printJob:                 Word
                           )stdcall;


(*
** Print job status
** ----------------
*)
function PEIsPrintJobFinished (printJob:              Word
                              ):Bool stdcall;

function PEGetJobStatus (printJob:                    Word;
                         var jobInfo:                 PEJobInfo
                        ):Smallint stdcall;


(*
** Controlling dialogs
** -------------------
*)
function PESetDialogParentWindow (printJob: 	  Word;
                                  parentWindow:   HWnd
                                 ): Bool stdcall;

function PEEnableProgressDialog (printJob:       Word;
                                 enable:         Bool
                                ): Bool stdcall;


(*
** Print job error codes and messages
** ----------------------------------
*)
function PEGetErrorCode (printJob:                    Word
                        ):Smallint stdcall;

function PEGetErrorText (printJob:                    Word;
                         var textHandle:              HWnd;
                         var textLength:              Word
                        ):Bool stdcall;

function PEGetHandleString (textHandle:               HWnd;
                            buffer:                   PChar;
                            bufferLength:             integer
                           ):Bool stdcall;


(*
** Setting the print date
** ----------------------
*)
function PEGetPrintDate (printJob:    Word;
                         var year:    Word;
                         var month:   Word;
                         var day:     Word
                        ):Bool stdcall;

function PESetPrintDate (printJob:    Word;
                         year:        integer;
                         month:       integer;
                         day:         integer
                        ):Bool stdcall;

(*
** Encoding and Decoding Section Codes
** -----------------------------------
*)

(* A function to create section codes:
 (This representation allows up to 25 groups and 40 sections of a given
  type, although Crystal Reports itself has no such limitations.)
*)
function PE_SECTION_CODE(sectionType,
                         groupN,
                         sectionN: Smallint
                        ):Smallint stdcall;

{Functions to decode section and area codes:}

function PE_SECTION_TYPE(sectionCode: Smallint
                        ): Smallint stdcall;

function PE_GROUP_N(sectionCode: Smallint
                   ): Smallint stdcall;

function PE_SECTION_N(sectionCode: Smallint
                     ): Smallint stdcall;

 (*
** Encoding Area Codes
** -----------------------------------
*)

(* A function to create section codes:
 (This representation allows up to 25 groups although Crystal Reports
  itself has no such limitations.)
*)
 function PE_AREA_CODE(sectionType,
                       groupN: Smallint
                      ):Smallint;

 (*
** Controlling group conditions (i.e. group breaks)
** ------------------------------------------------
*)
function PESetGroupCondition (printJob:             Word;
                              sectionCode:          integer;
                              conditionField:       PChar;
                              condition:            integer;  (* a PE_GC_ constant *)
                              sortDirection:        integer   (* a PE_SF_ constant *)
                             ):Bool stdcall;

function PEGetNGroups (printJob:    Word
                      ):Smallint stdcall;

(* for PEGetGroupCondition, condition encodes both
        the condition and the type of the condition field *)
const
     PE_GC_CONDITIONMASK = $00FF;
     PE_GC_TYPEMASK      = $0F00;

     PE_GC_TYPEOTHER     = $0000;
     PE_GC_TYPEDATE      = $0200;
     PE_GC_TYPEBOOLEAN   = $0400;

function PEGetGroupCondition (printJob:                   Word;
                              sectionCode:                integer;
                              var conditionFieldHandle:   Hwnd;
                              var conditionFieldLength:   Word;
                              var condition:              Word;
                              var sortDirection:          Word
                             ):Bool stdcall;

const
     PE_FIELD_NAME_LEN = 512;

     PE_GO_TBN_ALL_GROUPS_UNSORTED = 0;
     PE_GO_TBN_ALL_GROUPS_SORTED   = 1;
     PE_GO_TBN_TOP_N_GROUPS        = 2;
     PE_GO_TBN_BOTTOM_N_GROUPS     = 3;

type
     PEFieldNameType = array[0..PE_FIELD_NAME_LEN-1] of char;
     PEGroupOptions = record
                      StructSize:                Word;
                      (* when setting, pass a PE_GC_ constant, or PE_UNCHANGED for no change.
                         when getting, use PE_GC_TYPEMASK and PE_GC_CONDITIONMASK to
                         decode the condition.*)
                      condition:                 smallint;  {a PE_GC_ constant, or PE_UNCHANGED for no change.}
                      fieldName:                 PEFieldNameType; { formula form, or empty for no change.}
                      sortDirection:             smallint;  { a PE_SF_ const, or PE_UNCHANGED for no change.}
                      repeatGroupHeader:         smallint;  { BOOL value, or PE_UNCHANGED for no change.}
                      keepGroupTogether:         smallint;  { BOOL value, or PE_UNCHANGED for no change.}
                      topOrBottomNGroups:        smallint;  { a PE_GO_TBN_ constant, or PE_UNCHANGED for no change.}
                      topOrBottomNSortFieldName: PEFieldNameType; { formula form, or empty for no change.}
                      nTopOrBottomGroups:        smallint;  { the number of groups to keep, 0 for all, or PE_UNCHANGED for no change.}
                      discardOtherGroups:        smallint;  { BOOL value, or PE_UNCHANGED for no change.}
                      end;
const PE_SIZEOF_GROUP_OPTIONS = (sizeof (PEGroupOptions));

function PEGetGroupOptions(printJob:         Word;
                           groupN:           smallint;
                           var groupOptions: PEGroupOptions): Bool stdcall;

function PESetGroupOptions(printJob:         Word;
                           groupN:           smallint;
                           var groupOptions: PEGroupOptions): Bool stdcall;



(*
** Controlling formulas, selection formulas and group selection formulas
** ---------------------------------------------------------------------
*)
function PEGetNFormulas  (printJob:         Word
                         ):Smallint stdcall;

function PEGetNthFormula (printJob:         Word;
                          formulaN:         integer;
                          var nameHandle:   Hwnd;
                          var nameLength:   Word;
                          var textHandle:   Hwnd;
                          var textLength:   Word
                         ):Bool stdcall;

function PEGetFormula (printJob:                      Word;
                       formulaName:                   PChar;
                       var textHandle:                HWnd;
                       var textLength:                Word
                      ):Bool stdcall;

function PESetFormula (printJob:                      Word;
                       formulaName:                   PChar;
                       formulaString:                 PChar
                      ):Bool stdcall;

function PECheckFormula (printJob:                    Word;
                         formulaName:                 PChar
                        ):Bool stdcall;

function PEGetSelectionFormula (printJob:             Word;
                                var textHandle:       HWnd;
                                var textLength:       Word
                               ):Bool stdcall;

function PESetSelectionFormula (printJob:             Word;
                                formulaString:        PChar
                               ):Bool stdcall;

function PECheckSelectionFormula (printJob:           Word
                                 ):Bool stdcall;

function PEGetGroupSelectionFormula (printJob:        Word;
                                     var textHandle:  HWnd;
                                     var textLength:  Word
                                    ):Bool stdcall;

function PESetGroupSelectionFormula (printJob:        Word;
                                     formulaString:   PChar
                                    ):Bool stdcall;

function PECheckGroupSelectionFormula (printJob:      Word
                                      ):Bool stdcall;


(*
** Controlling sort order and group sort order
** -------------------------------------------
*)
function PEGetNSortFields (printJob:                  Word
                          ):Smallint stdcall;

function PEGetNthSortField (printJob:                 Word;
                            sortFieldN:               integer;
                            var nameHandle:           HWnd;
                            var nameLength:           Word;
                            var direction:            Word
                           ):Bool stdcall;

function PESetNthSortField (printJob:                 Word;
                            sortFieldN:               integer;
                            name:                     PChar;
                            direction:                integer
                           ):Bool stdcall;

function PEDeleteNthSortField (printJob:              Word;
                               sortFieldN:            integer
                              ):Bool stdcall;

function PEGetNGroupSortFields (printJob:             Word
                               ):Smallint stdcall;

function PEGetNthGroupSortField (printJob :           Word;
                                 sortFieldN:          integer;
                                 var nameHandle:      HWnd;
                                 var nameLength:      Word;
                                 var direction:       Word
                                ):Bool stdcall;

function PESetNthGroupSortField (printJob:            Word;
                                 sortFieldN:          integer;
                                 name:                PChar;
                                 direction:           integer
                                ):Bool stdcall;

function PEDeleteNthGroupSortField (printJob:         Word;
                                    sortFieldN:       integer
                                   ):Bool stdcall;


(*
** Controlling databases
** ---------------------
**
** The following functions allow retrieving and updating database info
** in an opened report, so that a report can be printed using different
** session, server, database, user and/or table location settings.  Any
** changes made to the report via these functions are not permanent, and
** only last as long as the report is open.
**
** The following database functions (except for PELogOnServer and
** PELogOffServer) must be called after PEOpenPrintJob and before
** PEStartPrintJob.
**
** The function PEGetNTables is called to fetch the number of tables in
** the report.  This includes all PC databases (e.g. Paradox, xBase)
** as well as SQL databases (e.g. SQL Server, Oracle, Netware).
*)
function PEGetNTables (printJob:                  Word
                      ):Smallint stdcall;


(*
** The function PEGetNthTableType allows the application to determine the
** type of each table.  The application can test DBType (equal to
** PE_DT_STANDARD or PE_DT_SQL), or test the database DLL name used to
** create the report.  DLL names have the following naming convention:
**     - PDB*.DLL for standard (non-SQL) databases,
**     - PDS*.DLL for SQL databases.
**
** In the case of ODBC (PDSODBC.DLL) the DescriptiveName includes the
** ODBC data source name.
*)
function PEGetNthTableType (printJob:             Word;
                            tableN:               Integer;
                            var tableType:        PETableType
                           ):Bool stdcall;


(*
** The functions PEGetNthTableSessionInfo and PESetNthTableSessionInfo
** are only used when connecting to MS Access databases (which require a
** session to be opened first)
*)
function PEGetNthTableSessionInfo (printJob:        Word;
                                   tableN:          Integer;
                                   var sessionInfo: PESessionInfo
                                  ):Bool stdcall;

function PESetNthTableSessionInfo (printJob:              Word;
                                   tableN:                Integer;
                                   var sessionInfo:       PESessionInfo;
                                   propagateAcrossTables: Bool
                                  ):Bool stdcall;


(*
** Logging on is performed when printing the report, but the correct
** log on information must first be set using PESetNthTableLogOnInfo.
** Only the password is required, but the server, database, and
** user names may optionally be overriden as well.
**
** If the parameter propagateAcrossTables is TRUE, the new log on info
** is also applied to any other tables in this report that had the
** same original server and database names as this table.  If FALSE
** only this table is updated.
**
** Logging off is performed automatically when the print job is closed.
*)
function PEGetNthTableLogOnInfo (printJob:          Word;
                                 tableN:            integer;
                                 var logOnInfo:     PELogOnInfo
                                ):Bool stdcall;

function PESetNthTableLogOnInfo (printJob:          Word;
                                 tableN:            integer;
                                 var logOnInfo:     PELogOnInfo;
                                 propagateAcrossTables: Bool
                                ):Bool stdcall;


(*
** A table's location is fetched and set using PEGetNthTableLocation and
** PESetNthTableLocation.  This name is database-dependent, and must be
** formatted correctly for the expected database.  For example:
**     - Paradox: "c:\crw\ORDERS.DB"
**     - SQL Server: "publications.dbo.authors"
*)
function PEGetNthTableLocation  (printJob:          Word;
                                 tableN:            integer;
                                 var location:      PETableLocation
                                ):Bool stdcall;

function PESetNthTableLocation  (printJob:          Word;
                                 tableN:            integer;
                                 var location:      PETableLocation
                                ):Bool stdcall;

(*
** If report based on a SQL Stored Procedure, use PEGetNParams to fetch the
** number of parameters, and PEGetNthParam and PESetNthParam to fetch and
** set individual parameters.  All parameter values are encoded as strings.
**
**If a parameter value is NULL, using PEGetNthParams will return a Nil
**for the textHandle and a zero value for the textLength.
**
**If you wish to SET a parameter to NULL then set the ParamValue to 'CRWNULL'
**when using the PESetNthParam Api call.
**eg. PESetNthParam(myJobId, myParamNum, 'CRWNULL')
*)
const 
     PE_PARAMETER_NAME_LEN = 128;
     PE_PT_LONGVARCHAR      = -1;
     PE_PT_BINARY           = -2;
     PE_PT_VARBINARY        = -3;
     PE_PT_LONGVARBINARY    = -4;
     PE_PT_BIGINT           = -5;
     PE_PT_TINYINT          = -6;
     PE_PT_BIT              = -7;
     PE_PT_CHAR              = 1;
     PE_PT_NUMERIC           = 2;
     PE_PT_DECIMAL           = 3;
     PE_PT_INTEGER           = 4;
     PE_PT_SMALLINT          = 5;
     PE_PT_FLOAT             = 6;
     PE_PT_REAL              = 7;
     PE_PT_DOUBLE            = 8;
     PE_PT_DATE              = 9;
     PE_PT_TIME             = 10;
     PE_PT_TIMESTAMP        = 11;
     PE_PT_VARCHAR          = 12;
  
type
     PEProcParamNameType       = array [0..PE_PARAMETER_NAME_LEN-1] of Char;

     PEParameterInfo = record
                       structSize :Word; {Initialize to PE_SIZEOF_PARAMETER_INFO.}
                       paramType  :Word;
                       Name       :PEProcParamNameType;
                       end;

const PE_SIZEOF_PARAMETER_INFO = sizeof(PEParameterInfo);

function PEGetNParams (printJob:        Word   (*Returns number of input parameters.*)
                      ):Smallint stdcall;

function PEGetNthParam(printJob:        Word;
                       paramN:          integer;  (*0 indexed parameter number.*)
                       var textHandle:  HWnd;     (*Address of a texthandle variable.*)
                       var textLength:  Word      (*Number of characters in string not including
                                                    null terminator.*)
                      ):Bool stdcall;

function PEGetNthParamInfo (printJob:  Word;
                            paramN:    Smallint;
                            var paramInfo: PEParameterInfo
                           ):Bool stdcall;

function PESetNthParam(printJob:      Word;
                       paramN:        integer;    (*o indexed parameter number.*)
                       szParamValue:  PChar       (*String representation of parameter value.*)
                      ):Bool stdcall;


(*
** The function PETestNthTableConnectivity tests whether a database
** table's settings are valid and ready to be reported on.  It returns
** true if the database session, log on, and location info is all
** correct.
**
** This is useful, for example, in prompting the user and testing a
** server password before printing begins.
**
** This function may require a significant amount of time to complete,
** since it will first open a user session (if required), then log onto
** the database server (if required), and then open the appropriate
** database table (to test that it exists).  It does not read any data,
** and closes the table immediately once successful.  Logging off is
** performed when the print job is closed.
**
** If it fails in any of these steps, the error code set indicates
** which database info needs to be updated using functions above:
**    - If it is unable to begin a session, PE_ERR_DATABASESESSION is set,
**      and the application should update with PESetNthTableSessionInfo.
**    - If it is unable to log onto a server, PE_ERR_DATABASELOGON is set,
**      and the application should update with PESetNthTableLogOnInfo.
**    - If it is unable open the table, PE_ERR_DATABASELOCATION is set,
**      and the application should update with PESetNthTableLocation.
*)
function PETestNthTableConnectivity (printJob:                   Word;
                                     tableN:        integer
                                    ):Bool stdcall;


(*
** PELogOnServer and PELogOffServer can be called at any time to log on
** and off of a database server.  These functions are not required if
** function PESetNthTableLogOnInfo above was already used to set the
** password for a table.
**
** These functions require a database DLL name, which can be retrieved
** using PEGetNthTableType above.
**
** This function can also be used for non-SQL tables, such as password-
** protected Paradox tables.  Call this function to set the password
** for the Paradox DLL before beginning printing.
**
** Note: When printing using PEStartPrintJob the ServerName passed in
** PELogOnServer must agree exactly with the server name stored in the
** report.  If this is not true use PESetNthTableLogOnInfo to perform
** logging on instead.
*)
function PELogOnServer              (dllName:       PChar;
                                     var logOnInfo: PELogOnInfo
                                    ):Bool stdcall;

function PELogOffServer             (dllName:       PChar;
                                     var logOnInfo: PELogOnInfo
                                    ):Bool stdcall;

function PELogOnSQLServerWithPrivateInfo (dllName : PChar;
                                          privateInfo : Pointer):Bool stdcall;
(*
** Overriding SQL query in report
** ------------------------------
**
** PEGetSQLQuery () returns the same query as appears in the Show SQL Query
** dialog in CRW, in syntax specific to the database driver you are using.
**
** PESetSQLQuery () is mostly useful for reports with SQL queries that
** were explicitly edited in the Show SQL Query dialog in CRW, i.e. those
** reports that needed database-specific selection criteria or joins.
** (Otherwise it is usually best to continue using function calls such as
** PESetSelectionFormula () and let CRW build the SQL query automatically.)
**
** PESetSQLQuery () has the same restrictions as editing in the Show SQL
** Query dialog; in particular that changes are accepted in the FROM and
** WHERE clauses but ignored in the SELECT list of fields.
*)
function PEGetSQLQuery (printJob:       Word;
                        var textHandle: HWnd;
                        var textLength: Word
                       ):Bool stdcall;

function PESetSQLQuery (printJob:       Word;
                        queryString:    PChar
                       ):Bool stdcall;


(*
** Saved data
** ----------
**
** Use PEHasSavedData() to find out if a report currently has saved data
** associated with it.  This may or may not be TRUE when a print job is
** first opened from a report file.  Since data is saved during a print,
** this will always be TRUE immediately after a report is printed.
**
** Use PEDiscardSavedData() to release the saved data associated with a
** report.  The next time the report is printed, it will get current data
** from the database.
**
** The default behavior is for a report to use its saved data, rather than
** refresh its data from the database when printing a report.
*)
function PEHasSavedData     (printJob:          Word;
                             var hasSavedData:  Bool
                            ):Bool stdcall;

function PEDiscardSavedData (printJob:      Word
                            ):Bool stdcall;


(*
** Report title
** ------------
*)
function PEGetReportTitle (printJob:               Word;
                           var titleHandle:        HWnd;
                           var titleLength:        Word
                          ):Bool stdcall;

function PESetReportTitle (printJob:               Word;
                           title:                  PChar
                          ):Bool stdcall;


(*
** Controlling print to window
** ---------------------------
*)
function PEOutputToWindow (printJob:                  Word;
                           title:                     PChar;
                           left:		      longint;
                           top:			      longint;
                           width:		      longint;
                           height:                    longint;
                           style:                     longint;
                           parentWindow:              HWnd
                          ):Bool stdcall;

type
    PEWindowOptions = record
                    StructSize: Word;         { initialize to PE_SIZEOF_WINDOW_OPTIONS}
                    hasGroupTree: Smallint;   { 0 or 1 except use PE_UNCHANGED for no change}
                    canDrillDown: Smallint;             { 0 or 1 except use PE_UNCHANGED for no change}
                    hasNavigationControls: Smallint;    { 0 or 1 except use PE_UNCHANGED for no change}
                    hasCancelButton: Smallint;          { 0 or 1 except use PE_UNCHANGED for no change}
                    hasPrintButton: Smallint;           { 0 or 1 except use PE_UNCHANGED for no change}
                    hasExportButton: Smallint;          { 0 or 1 except use PE_UNCHANGED for no change}
                    hasZoomControl: Smallint;           { 0 or 1 except use PE_UNCHANGED for no change}
                    hasCloseButton: Smallint;           { 0 or 1 except use PE_UNCHANGED for no change}
                    hasProgressControls: Smallint;      { 0 or 1 except use PE_UNCHANGED for no change}
                    hasSearchButton: Smallint;          { 0 or 1 except use PE_UNCHANGED for no change}
                    hasPrintSetupButton: Smallint;      { 0 or 1 except use PE_UNCHANGED for no change}
                    hasRefreshButton: Smallint;   { 0 or 1 except use PE_UNCHANGED for no change}
    end;

const PE_SIZEOF_WINDOW_OPTIONS = sizeof (PEWindowOptions);

function PEGetWindowOptions (printJob: Word;
                             var options: PEWindowOptions
                            ):Bool stdcall;

function PESetWindowOptions (printJob: Word;
                             var options: PEWindowOptions
                            ):Bool stdcall;

function PEGetWindowHandle (printJob:                 Word
                           ):HWnd stdcall;

procedure PECloseWindow (printJob:                    Word
                        )stdcall;


(*
** Controlling printed pages
** -------------------------
*)
function PEShowNextPage (printJob:                    Word
                        ):Bool stdcall;

function PEShowFirstPage (printJob:                   Word
                         ):Bool stdcall;

function PEShowPreviousPage (printJob:                Word
                            ):Bool stdcall;

function PEShowLastPage (printJob:                    Word
                        ):Bool stdcall;

function PEGetNPages (printJob:                       Word
                     ): Smallint stdcall;

function PEShowNthPage (printJob:                     Word;
                        pageN:                        Smallint
                       ): Bool stdcall;

function PEZoomPreviewWindow (printJob:               Word;
                              level:                  Smallint{a percent from 25 to 400}
                             ):Bool stdcall;                  {or a PE_ZOOM_ constant}


(*
** Controlling print window when print control buttons hidden
** ----------------------------------------------------------
*)
function PEShowPrintControls    (printJob:               Word;
                                 showPrintControls:      Bool
                                ):Bool stdcall;

function PEPrintControlsShowing (printJob:            Word;
                                 var controlsShowing: Bool
                                ):Bool stdcall;

function PEPrintWindow (printJob:     Word;
                        waitUntilDone: Bool
                       ):Bool stdcall;

function PEExportPrintWindow (printJob:       Word;
                              toMail:         Bool;
                              waitUntilDone:  Bool
                             ):Bool stdcall;

function PENextPrintWindowMagnification (printJob:  Word
                                        ):Bool stdcall;


(*
** Changing printer selection
** --------------------------
*)
function PESelectPrinter  (printJob:               Word;
                           driverName:             PChar;
                           printerName:            PChar;
                           portName:               PChar;
                           mode:                   PDeviceModeA
                          ):Bool stdcall;

function PEGetSelectedPrinter (printJob:          Word;
                               var driverHandle:  Hwnd;
                               var driverLength:  Word;
                               var printerHandle: Hwnd;
                               var printerLength: Word;
                               var portHandle:    Hwnd;
                               var portLength:    Word;
                               var mode:          PDeviceModeA
                              ):Bool stdcall;

(*
** Changing printer selection
** --------------------------
*)
function PEOutputToPrinter (printJob:              Word;
                            nCopies:               integer
                           ):Bool stdcall;

function PESetNDetailCopies  (printJob:             Word;
                              nCopies:              Integer
                             ):Bool stdcall;

function PEGetNDetailCopies  (printJob:             Word;
                              var nDetailCopies:    integer
                             ):Bool stdcall;


(*
** Extension to PESetPrintOptions function: If the 2nd parameter
** (pointer to PEPrintOptions) is set to 0 (null) the function prompts
** the user for these options.
**
** With this change, you can get the behaviour of the print-to-printer
** button in the print window by calling PESetPrintOptions with a
** null pointer and then calling PEPrintWindow.
*)
function PESetPrintOptions (printJob:              Word;
                            var options:           PEPrintOptions
                           ):Bool stdcall;

function PEGetPrintOptions (printJob:              Word;
                            var options:           PEPrintOptions
                           ):Bool stdcall;


(*
** Controlling Exporting
** ---------------------
*)
function PEGetExportOptions (printJob:                Word;
                             var options:             PEExportOptions
                            ):Bool stdcall;

function PEExportTo (printJob:                      Word;
                     var options:                   PEExportOptions
                    ):Bool stdcall;


(*
** Setting page margins
** --------------------
*)
function PESetMargins (printJob:               Word;
                       left:		       Word;
                       right:		       Word;
                       top:		       Word;
                       bottom:                 Word
                      ):Bool stdcall;

function PEGetMargins (printJob:    Word;
                       var left:    Word;
                       var right:   Word;
                       var top:     Word;
                       var bottom:  Word
                      ):Bool stdcall;

(*
** Report Summary Info
** -------------------
*)
const
     PE_SI_APPLICATION_NAME_LEN  = 128;
     PE_SI_TITLE_LEN             = 128;
     PE_SI_SUBJECT_LEN           = 128;
     PE_SI_AUTHOR_LEN            = 128;
     PE_SI_KEYWORDS_LEN          = 128;
     PE_SI_COMMENTS_LEN          = 512;
     PE_SI_REPORT_TEMPLATE_LEN   = 128;

type
     PEApplicationNameType = array[0..PE_SI_APPLICATION_NAME_LEN-1] of char;
     PETitleType           = array[0..PE_SI_TITLE_LEN-1] of char;
     PESubjectType         = array[0..PE_SI_SUBJECT_LEN-1] of char;
     PEAuthorType          = array[0..PE_SI_AUTHOR_LEN-1] of char;
     PEKeywordsType        = array[0..PE_SI_KEYWORDS_LEN-1] of char;
     PECommentsType        = array[0..PE_SI_COMMENTS_LEN-1] of char;
     PEReportTemplateType  = array[0..PE_SI_REPORT_TEMPLATE_LEN-1] of char;
     PEReportSummaryInfo = record
                           StructSize:      Word;
                           applicationName: PEApplicationNameType; { read only.}
                           title:           PETitleType;
                           subject:         PESubjectType;
                           author:          PEAuthorType;
                           keywords:        PEKeywordsType;
                           comments:        PECommentsType;
                           reportTemplate:  PEReportTemplateType;
                           end;

const PE_SIZEOF_REPORT_SUMMARY_INFO = (sizeof(PEReportSummaryInfo));

function PEGetReportSummaryInfo(printJob:        Word;
                                var summaryInfo: PEReportSummaryInfo): Bool stdcall;

function PESetReportSummaryInfo(printJob:        Word;
                                var summaryInfo: PEReportSummaryInfo): Bool stdcall;


(*
** Setting section height and format
** ---------------------------------
*)
function PEGetNSections (printJob : Word): Smallint stdcall;

function PEGetSectionCode (printJob: Word;
                           sectionN: Smallint
                          ): Smallint stdcall;

function PESetMinimumSectionHeight (printJob:         Word;
                                    sectionCode:      integer;
                                    minimumHeight:    integer  (*in twips*)
                                   ):Bool stdcall;

function PEGetMinimumSectionHeight (printJob:           Word;
                                    sectionCode:        integer;
                                    var minimumHeight:  Word  (*in twips*)
                                   ):Bool stdcall;

{Format formula name}
{Old naming convention}
const
  SECTION_VISIBILITY      = 58;
  NEW_PAGE_BEFORE         = 60;
  NEW_PAGE_AFTER          = 61;
  KEEP_SECTION_TOGETHER   = 62;
  SUPPRESS_BLANK_SECTION  = 63;
  RESET_PAGE_N_AFTER      = 64;
  PRINT_AT_BOTTOM_OF_PAGE = 65;
  UNDERLAY_SECTION        = 66;
  SECTION_BACK_COLOUR     = 67;

{New naming convention}
  PE_FFN_AREASECTION_VISIBILITY  = 58;
  PE_FFN_SECTION_VISIBILITY      = 58;
  PE_FFN_SHOW_AREA               = 59;
  PE_FFN_NEW_PAGE_BEFORE         = 60;
  PE_FFN_NEW_PAGE_AFTER          = 61;
  PE_FFN_KEEP_SECTION_TOGETHER   = 62;
  PE_FFN_SUPPRESS_BLANK_SECTION  = 63;
  PE_FFN_RESET_PAGE_N_AFTER      = 64;
  PE_FFN_PRINT_AT_BOTTOM_OF_PAGE = 65;
  PE_FFN_UNDERLAY_SECTION        = 66;
  PE_FFN_SECTION_BACK_COLOUR     = 67;

function PEGetSectionFormatFormula (printJob: Word;
                                    sectionCode: Word;
                                    formulaName: Word;
                                    var textHandle: HWnd;
                                    var textLength: Word
                                   ):Bool stdcall;

function PESetSectionFormatFormula(printJob : Word;
                                   sectionCode : integer;
                                   formulaName : integer;
                                   formulaString : PChar
                                  ):Bool stdcall;

function PEGetSectionFormat (printJob:    Word;
                             sectionCode: integer;
                             var options: PESectionOptions
                            ):Bool stdcall;

function PESetSectionFormat (printJob:    Word;
                             sectionCode: integer;
                             var options: PESectionOptions
                            ):Bool stdcall;
(*
** Setting area format
** -------------------
*)

function PEGetAreaFormatFormula (printJob: Word;
                                 areaCode: Word;
                                 formulaName: Word;
                                 var textHandle: HWnd;
                                 var textLength: Word
                                ):Bool stdcall;

function PESetAreaFormatFormula (printJob: Word;
                                 areaCode: Word;
                                 formulaName: Word;
                                 formulaString: PChar
                                ):Bool stdcall;

function PEGetAreaFormat (printJob: Word;
                          areaCode: integer;
                          options: PESectionOptions
                         ):Bool stdcall;

function PESetAreaFormat (printJob: Word;
                          areaCode: integer;
                          options: PESectionOptions
                         ):Bool stdcall;
(*
** Setting font info
** -----------------
*)
function PESetFont        (printJob:                Word;
                           sectionCode:		    integer;
                           scopeCode:               integer;
                           faceName:                PChar;     (* 0 for no change               *)
                           fontFamily:              integer;   (* FF_DONTCARE for no change     *)
                           fontPitch:               integer;   (* DEFAULT_PITCH for no change   *)
                           charSet:                 integer;   (* DEFAULT_CHARSET for no change *)
                           pointSize:               integer;   (* 0 for no change               *)
                           isItalic:                integer;   (* PE_UNCHANGED for no change    *)
                           isUnderlined:            integer;   (* ditto                         *)
                           isStruckOut:             integer;   (* ditto                         *)
                           weight:                  integer    (* 0 for no change               *)
                          ):Bool stdcall;


(*
** Setting Graph/Chart info
** ------------------------
**
** Two parameters are passed to uniquely identify the graph:
**      - section code
**      - graph number in that section
**
** The section code includes whether it is a header or footer, and the
** graph number starts at 0, 1...  The graph number identifies the graph
** by its position in the section
**      - looking top down first,
**      - then left to right if they have the same top.
*)
function PEGetGraphType (printJob:        Word;
                         sectionCode:     integer;
                         graphN:          integer;
                         var graphType:   Word
                        ):Bool stdcall;

function PEGetGraphData (printJob:          Word;
                         sectionCode:	    integer;
                         graphN:            integer;
                         var graphDataInfo: PEGraphDataInfo
                        ):Bool stdcall;

function PEGetGraphText (printJob:          Word;
                         sectionCode:	    integer;
                         graphN:            integer;
                         var graphTextInfo: PEGraphTextInfo
                        ):Bool stdcall;

function PEGetGraphOptions (printJob:         Word;
                            sectionCode:      integer;
                            graphN:           integer;
                            var graphOptions: PEGraphOptions
                           ):Bool stdcall;

function PESetGraphType (printJob:      Word;
                         sectionCode:   integer;
                         graphN:        integer;
                         graphType:     integer
                        ):Bool stdcall;

function PESetGraphData (printJob:          Word;
                         sectionCode:       integer;
                         graphN:            integer;
                         graphDataInfo:     PEGraphDataInfo
                        ):Bool stdcall;

function PESetGraphText (printJob:          Word;
                         sectionCode:       integer;
                         graphN:            integer;
                         graphTextInfo:     PEGraphTextInfo
                        ):Bool stdcall;

function PESetGraphOptions (printJob:         Word;
                            sectionCode:      integer;
                            graphN:           integer;
                            graphOptions:     PEGraphOptions
                           ):Bool stdcall;

{Subreports}
function PEGetNSubreportsInSection (printJob:    Word;
                                    sectionCode: Smallint
                                   ): Smallint stdcall;

function PEGetNthSubreportInSection (printJob:    Word;
                                     sectionCode: Smallint;
                                     subreportN:  Smallint
                                    ): DWORD stdcall;

function PEGetSubreportInfo (printJob:          Word;
                             subreportHandle:   DWORD;
                             var subreportInfo: PESubreportInfo
                            ): BOOL stdcall;

function PEOpenSubreport (parentJob:     Word;
                          subreportName: PChar
                         ): Word stdcall;

function PECloseSubreport (printJob : Word): BOOL stdcall;


(***********************
    Parameter Fields
***********************)
const
  PE_PF_REPORT_NAME_LEN = 128;
  PE_PF_NAME_LEN        = 256;
  PE_PF_PROMPT_LEN      = 256;
  PE_PF_VALUE_LEN       = 256;

  PE_PF_NUMBER     = 0  ;
  PE_PF_CURRENCY   = 1  ;
  PE_PF_BOOLEAN    = 2  ;
  PE_PF_DATE       = 3  ;
  PE_PF_STRING     = 4  ;

type
  PE_PF_ReportNameType      = array [0..PE_PF_REPORT_NAME_LEN-1] of Char;
  PEParameterFieldNameType  = array [0..PE_PF_NAME_LEN-1] of Char;
  PEParameterFieldTextType  = array [0..PE_PF_PROMPT_LEN-1] of Char;
  PEParameterFieldValueType = array [0..PE_PF_VALUE_LEN-1] of Char;
  PEParameterFieldInfo = record
                       structSize       :Word; {Initialize to PE_SIZEOF_PARAMETER_FIELD_INFO.}
                       ValueType        :Word; {PE_PF_ constant}
    		       DefaultValueSet  :Word; {Indicate the default value is set in PEParameterFieldInfo.}
                       CurrentValueSet  :Word; {Indicate the current value is set in PEParameterFieldInfo.}
                       Name             :PEParameterFieldNameType;
                       Prompt           :PEParameterFieldTextType;
                       {Next 2 Could be Number, Date, DateTime, Time, Boolean, or String}
                       DefaultValue     :PEParameterFieldValueType;
                       CurrentValue     :PEParameterFieldValueType;
                       {name of report where the field belongs, only used in PEGetNthParameterField}
                       ReportName       :PE_PF_ReportNameType;
                       {returns false (0) if parameter is linked, not in use, or has current value set}
                       needsCurrentValue :Word;
                       end;

Const
  PE_SIZEOF_VARINFO_TYPE = sizeof(PEParameterFieldInfo);
  PE_SIZEOF_PARAMETER_FIELD_INFO = sizeof(PEParameterFieldInfo);

function PEGetNParameterFields (printJob: Word): Smallint stdcall;

function PEGetNthParameterField (printJob:    Word;
                               varN:        Smallint;
                               var varInfo: PEParameterFieldInfo
                              ): BOOL stdcall;

function PESetNthParameterField (printJob:    Word;
                               varN:        Smallint;
                               var varInfo: PEParameterFieldInfo
                              ): BOOL stdcall;

{*** Converting parameterInfo default value or current value into value info ****}
const
     PE_VI_STRING_LEN = 256;

     {define value type}
     PE_VI_NUMBER   = 0;
     PE_VI_CURRENCY = 1;
     PE_VI_BOOLEAN  = 2;
     PE_VI_DATE     = 3;
     PE_VI_STRING   = 4;
     PE_VI_DATETIME = 5;
     PE_VI_TIME     = 6;
     PE_VI_INTEGER  = 7;
     PE_VI_COLOR    = 8;
     PE_VI_CHAR     = 9;
     PE_VI_LONG	    = 10;
     PE_VI_NOVALUE  = 100;

type
  PEVALUEINFOSTRINGTYPE = Array[0..PE_VI_STRING_LEN-1] of Char;
  PEVALUEINFODATEORTIMETYPE = Array[0..2] of Smallint;
  PEVALUEINFODATETIMETYPE = Array[0..5] of Smallint;
  PEValueInfo = record
                StructSize :Word;
                valueType  :Word;  {a PE_VI_ constant}
                viNumber   :Double;
                viCurrency :Double;
                viBoolean  :BOOL;
                viString   :PEVALUEINFOSTRINGTYPE;
                viDate     :PEVALUEINFODATEORTIMETYPE; {year, month, day}
                viDateTime :PEVALUEINFODATETIMETYPE; {year, month, day, hour, minute, second}
                viTime     :PEVALUEINFODATEORTIMETYPE; {hour, minute, second}
                viColor    :COLORREF;
                viInteger  :Smallint;
                viC        :Char; {BYTE}
                ignored    :Char; {for 4 byte alignment. ignored.}
                viLong     :Longint;
                end;

Const PE_SIZEOF_VALUE_INFO = sizeof(PEValueInfo);

function PEConvertPFInfoToVInfo (value         : PChar;
                                 valueType     : Word;
                                 var valueInfo : PEValueInfo) : BOOL stdcall;

function PEConvertVInfoToPFInfo (var valueInfo : PEValueInfo;
                                 var valueType : Word;
                                 value : PChar) : BOOL stdcall;

(************************************************
** Event support
************************************************)
// event ID
const
     PE_CLOSE_PRINT_WINDOW_EVENT            = 1;
     PE_ACTIVATE_PRINT_WINDOW_EVENT         = 2;
     PE_DEACTIVATE_PRINT_WINDOW_EVENT       = 3;
     PE_PRINT_BUTTON_CLICKED_EVENT          = 4;
     PE_EXPORT_BUTTON_CLICKED_EVENT         = 5;
     PE_ZOOM_CONTROL_SELECTED_EVENT         = 6;
     PE_FIRST_PAGE_BUTTON_CLICKED_EVENT     = 7;
     PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT  = 8;
     PE_NEXT_PAGE_BUTTON_CLICKED_EVENT      = 9;
     PE_LAST_PAGE_BUTTON_CLICKED_EVENT      = 10;
     PE_CANCEL_BUTTON_CLICKED_EVENT         = 11;
     PE_CLOSE_BUTTON_CLICKED_EVENT          = 12;
     PE_SEARCH_BUTTON_CLICKED_EVENT         = 13;
     PE_GROUPTREE_BUTTON_CLICKED_EVENT      = 14;
     PE_PRINT_SETUP_BUTTON_CLICKED_EVENT    = 15;
     PE_REFRESH_BUTTON_CLICKED_EVENT        = 16;
     PE_SHOW_GROUP_EVENT		    = 17;
     PE_DRILL_ON_GROUP_EVENT		    = 18; // include drill on graph
     PE_DRILL_ON_DETAIL_EVENT	            = 19;
     PE_READING_RECORDS_EVENT               = 20;
     PE_START_EVENT                         = 21;
     PE_STOP_EVENT     		            = 22;

{job destination}
const
     PE_TO_NOWHERE = 0;
     PE_TO_WINDOW  = 1;
     PE_TO_PRINTER = 2;
     PE_TO_EXPORT  = 3;
     PE_FROM_QUERY = 4;

{ for PE_START_EVENT}
type PEStartEventInfo = record
	              StructSize:  Word;
                      destination: Word;
end;
const PE_SIZEOF_START_EVENT_INFO = sizeof(PEStartEventInfo);

{ for PE_STOP_EVENT}
type PEStopEventInfo = record
	             StructSize:  Word;
	             destination: Word;
	             jobStatus:   Word; {a PE_JOB constant}
end;
const PE_SIZEOF_STOP_EVENT_INFO = sizeof(PEStopEventInfo);

{ for PE_READING_RECORDS_EVENT}
type PEReadingRecordsEventInfo = record
	                       StructSize:      Word;
	                       cancelled:       Smallint;        {0 or 1.}
	                       recordsRead:     Longint;
	                       recordsSelected: Longint;
	                       done:            Smallint;        {0 or 1}
end;
const PE_SIZEOF_READING_RECORDS_EVENT_INFO = sizeof(PEReadingRecordsEventInfo);

{ use this structure for
  PE_CLOSE_PRINT_WINDOW_EVENT
  PE_PRINT_BUTTON_CLICKED_EVENT
  PE_EXPORT_BUTTON_CLICKED_EVENT
  PE_FIRST_PAGE_BUTTON_CLICKED_EVENT
  PE_PREVIOUS_PAGE_BUTTON_CLICKED_EVENT
  PE_NEXT_PAGE_BUTTON_CLICKED_EVENT
  PE_LAST_PAGE_BUTTON_CLICKED_EVENT
  PE_CANCEL_BUTTON_CLICKED_EVENT
  PE_ACTIVATE_PRINT_WINDOW_EVENT
  PE_DEACTIVATE_PRINT_WINDOW_EVENT}
type PEGeneralPrintWindowEventInfo = record
	                           StructSize:   Word;
	                           ignored:      Word; {for 4 byte alignment. ignore.}
	                           windowHandle: HWnd;
end;
const PE_SIZEOF_GENERAL_PRINT_WINDOW_EVENT_INFO = sizeof(PEGeneralPrintWindowEventInfo);

{ for PE_ZOOM_CONTROL_SELECTED_EVENT}
type PEZoomLevelChangingEventInfo = record
     	                          StructSize: Word;
	                          zoomLevel:  Word;
	                          windowHandle: HWnd;
end;
const PE_SIZEOF_ZOOM_LEVEL_CHANGING_EVENT_INFO = sizeof (PEZoomLevelChangingEventInfo);

{ for PE_CLOSE_BUTTON_CLICKED_EVENT}
type PECloseButtonClickedEventInfo = record
	                           StructSize:   Word;
	                           viewIndex:    Word; {which view is going to be closed. start from zero.}
	                           windowHandle: HWnd; {frame window handle the button is on.}
end;
Const PE_SIZEOF_CLOSE_BUTTON_CLICKED_EVENT_INFO = sizeof(PECloseButtonClickedEventInfo);

{for PE_SEARCH_BUTTON_CLICKED_EVENT}
Const PE_SEARCH_STRING_LEN = 128;
type
    PESearchStringType = Array [0..PE_SEARCH_STRING_LEN-1] of Char;
    PESearchButtonClickedEventInfo = record
	                            windowHandle: HWnd;
	                            searchString: PESearchStringType;
	                            StructSize:   Word;
    end;
Const PE_SIZEOF_SEARCH_BUTTON_CLICKED_EVENT_INFO = sizeof(PESearchButtonClickedEventInfo);

{for PE_GROUPTREE_BUTTON_CLICKED_EVENT}
type PEGroupTreeButtonClickedEventInfo = record
	                               StructSize:   Word;
                                       visible:      Smallint; {0 or 1.
                                         Current state of the group tree button}
                                       windowHandle: HWnd;
end;
Const PE_SIZEOF_GROUP_TREE_BUTTON_CLICKED_EVENT_INFO = sizeof(PEGroupTreeButtonClickedEventInfo);

{for PE_SHOW_GROUP_EVENT}
type
    PEPCharPointer = ^PChar;
    PEShowGroupEventInfo = record
                         StructSize:   Word;
	                 groupLevel:   Word;
	                 windowHandle: HWnd;
                         {points to an array of group name. memory pointed by
                          group list is freed after calling the call back function.}
                         groupList: PEPCharPointer;
    end;
Const PE_SIZEOF_SHOW_GROUP_EVENT_INFO = sizeof(PEShowGroupEventInfo);

{For PE_DRILL_ON_GROUP_EVENT}
const
     PE_DE_ON_GROUP        = 0;
     PE_DE_ON_GROUPTREE    = 1;
     PE_DE_ON_GRAPH        = 2;

type
    PEDrillOnGroupEventInfo = record
	                    StructSize:   Word;
	                    drillType:    Word; { a PE_DE_ constant}
	                    windowHandle: HWnd;
	{points to an array of group name. memory pointed by group list is freed after calling the call
	back function.}
                            groupList:    PEPCharPointer;
                            groupLevel:   Word;
    end;
    PEDrillOnGroupEventInfoPtr = ^PEDrillOnGroupEventInfo;

const PE_SIZEOF_DRILL_ON_GROUP_EVENT_INFO = sizeof(PEDrillOnGroupEventInfo);

{ for PE_DRILL_ON_DETAIL_EVENT}

type
    PEFieldValueInfo = record
                      StructSize: Word;
                      ignored:    Word;  {for 4 byte alignment. ignore.}
	              fieldName:  PEFieldNameType;
	              fieldValue: PEValueInfo;
    end;

    PEFieldValueInfoPtr       = ^PEFieldValueInfo;
    PEFieldValueInfoDoublePtr = ^PEFieldValueInfoPtr;

const PE_SIZEOF_FIELD_VALUE_INFO = sizeof(PEFieldValueInfo);

type
    PEDrillOnDetailEventInfo = record
                             StructSize:         Word;
                             selectedFieldIndex: smallint; {-1 if no field selected}
                             windowHandle:       longint;
                             { points to an array of PEFieldValueInfo. memory
                               pointed by fieldValueList is freed after
                               calling the call back function.}
                             fieldValueList:     PEFieldValueInfoDoublePtr;
                             nFieldValue:        smallint; {number of field value in fieldValueList}
    end;
const PE_SIZEOF_DRILL_ON_DETAIL_EVENT_INFO = sizeof(PEDrillOnDetailEventInfo);

{ All events are disabled by default
 use PEEnableEvent to enable events. }
type PEEnableEventInfo = record
                       StructSize:               Word;
                       startStopEvent:           smallint; // BOOL value, PE_UNCHANGED for no change
                       readingRecordEvent:       smallint; // BOOL value, PE_UNCHANGED for no change
                       printWindowButtonEvent:   smallint; // BOOL value, PE_UNCHANGED for no change
                       drillEvent:               smallint; // BOOL value, PE_UNCHANGED for no change
                       closePrintWindowEvent:    smallint; // BOOL value, PE_UNCHANGED for no change
                       activatePrintWindowEvent: smallint; // BOOL value, PE_UNCHANGED for no change
end;

const PE_SIZEOF_ENABLE_EVENT_INFO = sizeof(PEEnableEventInfo);

Function PEEnableEvent(printJob: Word;
                       Var enableEventInfo: PEEnableEventInfo): BOOL stdcall;

Function PEGetEnableEventInfo(printJob: Word;
                              Var enableEventInfo: PEEnableEventInfo): BOOL stdcall;

{ Set callback function}
Function PESetEventCallback(printJob: Word;
                            callbackProc: pointer;
                            { Callback Funtion should be of form:
                              Function callbackProc(eventID: smallint;
                                                    param: pointer;
                                                    userData: pointer):BOOL STDCALL;
                            }
                            userData: pointer): BOOL stdcall;

(* all are window standard cursors except PE_TC_MAGNIFY_CURSOR.
  PE_TC_SIZEALL_CURSOR, PE_TC_NO_CURSOR, PE_TC_APPSTARTING_CURSOR
  and PE_TC_HELP_CURSOR are  not supported in 16bit.
  PE_TC_SIZE_CURSOR and PE_TC_ICON_CURSOR are obsolete for 32bit
  use PE_TC_SIZEALL_CURSOR and PE_TC_ARROW_CURSOR instead.
*)
const
     PE_TC_DEFAULT_CURSOR     = 0; {CRPE set default cursor to be PE_TC_ARRAOW_CURSOR}
     PE_TC_ARROW_CURSOR       = 1;
     PE_TC_CROSS_CURSOR       = 2;
     PE_TC_IBEAM_CURSOR       = 3;
     PE_TC_UPARROW_CURSOR     = 4;
     PE_TC_SIZEALL_CURSOR     = 5;
     PE_TC_SIZENWSE_CURSOR    = 6;
     PE_TC_SIZENESW_CURSOR    = 7;
     PE_TC_SIZEWE_CURSOR      = 8;
     PE_TC_SIZENS_CURSOR      = 9;
     PE_TC_NO_CURSOR          = 10;
     PE_TC_WAIT_CURSOR        = 11;
     PE_TC_APPSTARTING_CURSOR = 12;
     PE_TC_HELP_CUROSR	      = 13;

     PE_TC_MAGNIFY_CURSOR     = 99; {CRPE specific cusor}

type
    PETrackCursorInfo = record
	              StructSize: Word;
	              groupAreaCursor: smallint;            {a PE_TC constant. PE_UNCHANGED for no change.}
	              groupAreaFieldCursor: smallint;       {a PE_TC constant. PE_UNCHAGNED for no change.}
	              detailAreaCursor: smallint;           {a PE_TC constant. PE_UNCHANGED for no change}
	              detailAreaFieldCursor: smallint;      {a PE_TC constant. PE_UNCHANGED for no change}
	              graphCursor: smallint;	            {a PE_TC constant. PE_UNCHANGED for no change.}
	              groupAreaCursorHandle: longint;       {reserved}
	              groupAreaFieldCursorHandle: longint;  {reserved}
	              detailAreaCursorHandle: longint;      {reserved}
	              detailAreaFieldCursorHandle: longint; {reserved}
	              graphCursorHandle: longint;           {reserved}
    end;
const PE_SIZEOF_TRACK_CURSOR_INFO = sizeof(PETrackCursorInfo);

{ set tracking cursor}
Function PEGetTrackCursorInfo(printJob: smallint;
			      var cursorInfo: PETrackCursorInfo): Bool stdcall;

Function PESetTrackCursorInfo(printJob: smallint;
                              var cursorInfo: PETrackCursorInfo): Bool stdcall;

{******End of Interface Section******}

Implementation

function PE_SECTION_CODE(sectionType, groupN, sectionN : Smallint):Smallint;
begin
  result := (((sectionType) * 1000) + ((groupN) mod 25) + (((sectionN) mod 40) * 25));
end;

function PE_AREA_CODE(sectionType, groupN: Smallint):Smallint;
begin
    result := PE_SECTION_CODE (sectionType, groupN, 0);
end;

function PE_SECTION_TYPE(sectionCode: Smallint): Smallint;
begin
  result := ((sectionCode) div 1000);
end;

function PE_GROUP_N(sectionCode: Smallint): Smallint;
begin
  result := ((sectionCode) mod 25);
end;

function PE_SECTION_N(sectionCode: Smallint): Smallint;
begin
  result := (((sectionCode) div 25) mod 40);
end;

function  PEPrintReport;                   external 'crpe32.dll';
function  PEOpenEngine;                    external 'crpe32.dll';
procedure PECloseEngine;                   external 'crpe32.dll';
function  PECanCloseEngine;                external 'crpe32.dll';
function  PEGetVersion;                    external 'crpe32.dll';
function  PEOpenPrintJob;                  external 'crpe32.dll';
function  PEClosePrintJob;                 external 'crpe32.dll';
function  PEStartPrintJob;                 external 'crpe32.dll';
procedure PECancelPrintJob;                external 'crpe32.dll';
function  PEIsPrintJobFinished;            external 'crpe32.dll';
function  PEGetJobStatus;                  external 'crpe32.dll';
function  PEGetErrorCode;                  external 'crpe32.dll';
function  PEGetErrorText;                  external 'crpe32.dll';
function  PEGetHandleString;               external 'crpe32.dll';
function  PEGetPrintDate;                  external 'crpe32.dll';
function  PESetPrintDate;                  external 'crpe32.dll';
function  PESetGroupCondition;             external 'crpe32.dll';
function  PEGetNGroups;                    external 'crpe32.dll';
function  PEGetGroupCondition;             external 'crpe32.dll';
function  PEGetGroupOptions;               external 'crpe32.dll';
function  PESetGroupOptions;               external 'crpe32.dll';
function  PEGetNFormulas;                  external 'crpe32.dll';
function  PEGetNthFormula;                 external 'crpe32.dll';
function  PEGetFormula;                    external 'crpe32.dll';
function  PESetFormula;                    external 'crpe32.dll';
function  PECheckFormula;                  external 'crpe32.dll';
function  PEGetSelectionFormula;           external 'crpe32.dll';
function  PESetSelectionFormula;           external 'crpe32.dll';
function  PECheckSelectionFormula;         external 'crpe32.dll';
function  PEGetGroupSelectionFormula;      external 'crpe32.dll';
function  PESetGroupSelectionFormula;      external 'crpe32.dll';
function  PECheckGroupSelectionFormula;    external 'crpe32.dll';
function  PEGetNSortFields;                external 'crpe32.dll';
function  PEGetNthSortField;               external 'crpe32.dll';
function  PESetNthSortField;               external 'crpe32.dll';
function  PEDeleteNthSortField;            external 'crpe32.dll';
function  PEGetNGroupSortFields;           external 'crpe32.dll';
function  PEGetNthGroupSortField;          external 'crpe32.dll';
function  PESetNthGroupSortField;          external 'crpe32.dll';
function  PEDeleteNthGroupSortField;       external 'crpe32.dll';
function  PEGetNTables;                    external 'crpe32.dll';
function  PEGetNthTableType;               external 'crpe32.dll';
function  PEGetNthTableSessionInfo;        external 'crpe32.dll';
function  PESetNthTableSessionInfo;        external 'crpe32.dll';
function  PEGetNthTableLogOnInfo;          external 'crpe32.dll';
function  PESetNthTableLogOnInfo;          external 'crpe32.dll';
function  PEGetNthTableLocation;           external 'crpe32.dll';
function  PESetNthTableLocation;           external 'crpe32.dll';
function  PEGetNParams;                    external 'crpe32.dll';
function  PEGetNthParam;                   external 'crpe32.dll';
function  PESetNthParam;                   external 'crpe32.dll';
function  PETestNthTableConnectivity;      external 'crpe32.dll';
function  PELogOnServer;                   external 'crpe32.dll';
function  PELogOffServer;                  external 'crpe32.dll';
function  PELogOnSQLServerWithPrivateInfo; external 'crpe32.dll';
function  PEGetSQLQuery;                   external 'crpe32.dll';
function  PESetSQLQuery;                   external 'crpe32.dll';
function  PEHasSavedData;                  external 'crpe32.dll';
function  PEDiscardSavedData;              external 'crpe32.dll';
function  PEGetReportTitle;                external 'crpe32.dll';
function  PESetReportTitle;                external 'crpe32.dll';
function  PEOutputToWindow;                external 'crpe32.dll';
function  PEGetWindowOptions;              external 'crpe32.dll';
function  PESetWindowOptions;              external 'crpe32.dll';
function  PEGetWindowHandle;               external 'crpe32.dll';
procedure PECloseWindow;                   external 'crpe32.dll';
function  PEShowNextPage;                  external 'crpe32.dll';
function  PEShowFirstPage;                 external 'crpe32.dll';
function  PEShowPreviousPage;              external 'crpe32.dll';
function  PEShowLastPage;                  external 'crpe32.dll';
function  PEZoomPreviewWindow;             external 'crpe32.dll';
function  PEShowPrintControls;             external 'crpe32.dll';
function  PEPrintControlsShowing;          external 'crpe32.dll';
function  PEPrintWindow;                   external 'crpe32.dll';
function  PEExportPrintWindow;             external 'crpe32.dll';
function  PENextPrintWindowMagnification;  external 'crpe32.dll';
function  PESelectPrinter;                 external 'crpe32.dll';
function  PEGetSelectedPrinter;            external 'crpe32.dll';
function  PEOutputToPrinter;               external 'crpe32.dll';
function  PESetNDetailCopies;              external 'crpe32.dll';
function  PEGetNDetailCopies;              external 'crpe32.dll';
function  PESetPrintOptions;               external 'crpe32.dll';
function  PEGetPrintOptions;               external 'crpe32.dll';
function  PEGetExportOptions;              external 'crpe32.dll';
function  PEExportTo;                      external 'crpe32.dll';
function  PESetMargins;                    external 'crpe32.dll';
function  PEGetMargins;                    external 'crpe32.dll';
function  PEGetReportSummaryInfo;          external 'crpe32.dll';
function  PESetReportSummaryInfo;          external 'crpe32.dll';
function  PESetMinimumSectionHeight;       external 'crpe32.dll';
function  PEGetMinimumSectionHeight;       external 'crpe32.dll';
function  PESetSectionFormat;              external 'crpe32.dll';
function  PEGetSectionFormatFormula;       external 'crpe32.dll';
function  PESetSectionFormatFormula;       external 'crpe32.dll';
function  PEGetSectionFormat;              external 'crpe32.dll';
function  PESetAreaFormat;                 external 'crpe32.dll';
function  PEGetAreaFormatFormula;          external 'crpe32.dll';
function  PESetAreaFormatFormula;          external 'crpe32.dll';
function  PEGetAreaFormat;                 external 'crpe32.dll';
function  PESetFont;                       external 'crpe32.dll';
function  PEGetGraphType;                  external 'crpe32.dll';
function  PEGetGraphData;                  external 'crpe32.dll';
function  PEGetGraphText;                  external 'crpe32.dll';
function  PEGetGraphOptions;               external 'crpe32.dll';
function  PESetGraphType;                  external 'crpe32.dll';
function  PESetGraphData;                  external 'crpe32.dll';
function  PESetGraphText;                  external 'crpe32.dll';
function  PESetGraphOptions;               external 'crpe32.dll';
function  PEGetNSubreportsInSection;       external 'crpe32.dll';
function  PEGetNthSubreportInSection;      external 'crpe32.dll';
function  PEGetSubreportInfo;              external 'crpe32.dll';
function  PEOpenSubreport;                 external 'crpe32.dll';
function  PECloseSubreport;                external 'crpe32.dll';
function  PEGetNParameterFields;           external 'crpe32.dll';
function  PEGetNthParameterField;          external 'crpe32.dll';
function  PESetNthParameterField;          external 'crpe32.dll';
function  PEGetNSections;                  external 'crpe32.dll';
function  PEGetSectionCode;                external 'crpe32.dll';
function  PEGetNPages;                     external 'crpe32.dll';
function  PEShowNthPage;                   external 'crpe32.dll';
function  PESetDialogParentWindow;         external 'crpe32.dll';
function  PEEnableProgressDialog;          external 'crpe32.dll';
function  PEGetNthParamInfo;               external 'crpe32.dll';
function PEConvertPFInfoToVInfo;           external 'crpe32.dll';
function PEConvertVInfoToPFInfo;           external 'crpe32.dll';
//Events
Function  PEEnableEvent;                   external 'crpe32.dll';
Function  PEGetEnableEventInfo;            external 'crpe32.dll';
Function  PESetEventCallback;              external 'crpe32.dll';
Function  PESetTrackCursorInfo;            external 'crpe32.dll';
Function  PEGetTrackCursorInfo;            external 'crpe32.dll';
End.

(* end *)
