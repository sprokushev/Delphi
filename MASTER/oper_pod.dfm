object f_oper_pod: Tf_oper_pod
  Left = 198
  Top = 196
  Width = 1073
  Height = 589
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1087#1086#1076#1072#1095#1080' '#1085#1072' '#1069#1089#1090#1072#1082#1072#1076#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 1065
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acPodachaRefresh
        DisplayMode = nbdmImageAndText
      end
      object TBItem2: TTBItem
        Action = acPrint
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 543
    Width = 1065
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 26
    Width = 1065
    Height = 517
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1076#1072#1095#1080' '#1085#1072' '#1069#1089#1090#1072#1082#1072#1076#1077
      object Splitter1: TSplitter
        Left = 0
        Top = 209
        Width = 1057
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1057
        Height = 44
        Align = alTop
        Caption = ' '#1060#1080#1083#1100#1090#1088' '
        TabOrder = 0
        object Label3: TLabel
          Left = 222
          Top = 18
          Width = 75
          Height = 13
          Caption = #1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080':'
        end
        object sbNotTrack: TSpeedButton
          Left = 304
          Top = 14
          Width = 20
          Height = 20
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = sbNotTrackClick
        end
        object Label1: TLabel
          Left = 4
          Top = 18
          Width = 6
          Height = 13
          Caption = #1089
        end
        object Label2: TLabel
          Left = 107
          Top = 18
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object lc_track: TRxDBLookupCombo
          Left = 328
          Top = 14
          Width = 235
          Height = 21
          DropDownCount = 8
          DisplayEmpty = '<'#1042#1089#1077' '#1087#1091#1090#1080'>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'VETKA_NAME'
          LookupSource = ds_Track
          TabOrder = 0
        end
        object Date1: TDateTimePicker
          Left = 19
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 1
        end
        object Date2: TDateTimePicker
          Left = 131
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 2
        end
        object Button1: TButton
          Left = 568
          Top = 13
          Width = 75
          Height = 25
          Action = acPodachaRefresh
          TabOrder = 3
        end
      end
      object GridPod: TDBGridEh
        Left = 0
        Top = 44
        Width = 1057
        Height = 165
        Align = alTop
        DataSource = ds_oper_pod
        EvenRowColor = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        FrozenCols = 2
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupMenuPod
        ReadOnly = True
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = GridPodSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'POD_NUM'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.TitleButton = True
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'POD_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 107
          end
          item
            EditButtons = <>
            FieldName = 'VETKA_OTP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 227
          end
          item
            EditButtons = <>
            FieldName = 'GOTOV_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'NALIV_DATE'
            Footers = <>
            Title.TitleButton = True
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'END_NALIV_DATE'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'DATE_OFORML'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'POD_KOL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'POD_VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'USER_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 313
          end
          item
            EditButtons = <>
            FieldName = 'LUKOMA_NUM'
            Footers = <>
            Title.TitleButton = True
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'GD_UVED_NUM'
            Footers = <>
            Title.TitleButton = True
          end>
      end
      object TBDock2: TTBDock
        Left = 0
        Top = 212
        Width = 1057
        Height = 26
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 238
        Width = 1057
        Height = 251
        Align = alClient
        Caption = #1055#1086#1079#1080#1094#1080#1080' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
        TabOrder = 3
        object GridRows: TDBGridEh
          Left = 2
          Top = 15
          Width = 1053
          Height = 234
          Align = alClient
          DataSource = ds_podrow
          EvenRowColor = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          FrozenCols = 3
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
          ParentFont = False
          PopupMenu = PopupMenuRows
          ReadOnly = True
          SumList.Active = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = GridRowsSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'NUM_POS'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.TitleButton = True
              Width = 32
            end
            item
              EditButtons = <>
              FieldName = 'VAGONTYPE_NAME'
              Footers = <>
              Title.TitleButton = True
              Width = 43
            end
            item
              EditButtons = <>
              FieldName = 'NUM_CIST'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'VAG_STATUS_NAME'
              Footers = <>
              Title.TitleButton = True
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'SVED_GOTOV_TIME'
              Footers = <>
              Title.TitleButton = True
              Width = 109
            end
            item
              EditButtons = <>
              FieldName = 'SVED_NALIV_TIME'
              Footers = <>
              Title.TitleButton = True
              Width = 108
            end
            item
              EditButtons = <>
              FieldName = 'SVED_END_NALIV_TIME'
              Footers = <>
              Title.TitleButton = True
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'DATE_OFORML'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'VAGOWNER_NAME'
              Footers = <>
              Title.TitleButton = True
              Width = 79
            end
            item
              EditButtons = <>
              FieldName = 'NCISTDOP'
              Footers = <>
              Title.TitleButton = True
              Width = 51
            end
            item
              EditButtons = <>
              FieldName = 'KALIBR_ID'
              Footers = <>
              Title.TitleButton = True
              Width = 42
            end
            item
              EditButtons = <>
              FieldName = 'AXES'
              Footers = <>
              Title.TitleButton = True
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'CAPACITY'
              Footers = <>
              Title.TitleButton = True
              Width = 54
            end
            item
              EditButtons = <>
              FieldName = 'VETKA_POD_NAME'
              Footers = <>
              Title.TitleButton = True
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'DEFI_MASS_NAME'
              Footers = <>
              Title.TitleButton = True
              Width = 135
            end
            item
              EditButtons = <>
              FieldName = 'VES_BRUTTO'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'VES_CIST'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'VZLIV'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 53
            end
            item
              EditButtons = <>
              FieldName = 'VOLUME'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 57
            end
            item
              EditButtons = <>
              FieldName = 'TEMPER'
              Footers = <>
              Title.TitleButton = True
              Width = 49
            end
            item
              EditButtons = <>
              FieldName = 'PL20'
              Footers = <>
              Title.TitleButton = True
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'FACT_PL'
              Footers = <>
              Title.TitleButton = True
              Width = 67
            end
            item
              EditButtons = <>
              FieldName = 'VES'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 61
            end
            item
              EditButtons = <>
              FieldName = 'KOL_NET'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.TitleButton = True
              Width = 62
            end
            item
              EditButtons = <>
              FieldName = 'PLOMBA1'
              Footers = <>
              Title.TitleButton = True
              Width = 71
            end
            item
              EditButtons = <>
              FieldName = 'PLOMBA2'
              Footers = <>
              Title.TitleButton = True
              Width = 69
            end
            item
              EditButtons = <>
              FieldName = 'PASP_NUM'
              Footers = <>
              Title.TitleButton = True
              Width = 62
            end
            item
              EditButtons = <>
              FieldName = 'PASP_DATE'
              Footers = <>
              Title.TitleButton = True
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'REZ_NUM'
              Footers = <>
              Title.TitleButton = True
              Width = 59
            end
            item
              EditButtons = <>
              FieldName = 'NAME_NPR'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'NOM_ZD'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'SVED_NUM'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'SVED_DATE'
              Footers = <>
              Title.TitleButton = True
              Width = 92
            end
            item
              EditButtons = <>
              FieldName = 'POD_NUM'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'POD_DATE'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'VETKA_OTP_NAME'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'USER_NAME'
              Footers = <>
              Title.TitleButton = True
            end>
        end
      end
    end
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 247
    Top = 153
  end
  object q_oper_pod: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '  id,pod_num,pod_date,lukoma_num,gd_uved_num,'
      '  VETKA_OTP_ID,VETKA_OTP_NAME,USER_ID,USER_NAME,'
      '  MIN(NVL(sved_gotov_time,gotov_date)) as gotov_date,'
      '  MIN(NVL(sved_naliv_time,naliv_date)) as naliv_date,'
      
        '  MAX(NVL(sved_end_naliv_time,end_naliv_date)) as end_naliv_date' +
        ','
      '  MAX(date_oforml) as DATE_OFORML,'
      '  MAX(pod_kol) as pod_kol,'
      '  MAX(pod_ves) as pod_ves'
      'FROM'
      '(  '
      'SELECT '
      '  a.id,a.pod_num,a.pod_date,a.lukoma_num,a.gd_uved_num,'
      '  a.gotov_date,'
      '  (SELECT MAX(sved.GOTOV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_GOTOV_TIME,     '
      '  a.naliv_date,'
      '  (SELECT MAX(sved.BEG_NALIV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_NALIV_TIME,     '
      '  a.end_naliv_date,'
      '  (SELECT MAX(sved.END_NALIV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_END_NALIV_TIME,'
      '  (SELECT MAX(sved.DATE_OFORML) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id'
      #9#9'  AND kvit.nom_zd=b.nom_zd'
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as DATE_OFORML,'
      '  a.VETKA_OTP_ID,'
      '  kls_vetka_otp.VETKA_NAME as VETKA_OTP_NAME,'
      '  a.USER_ID,'
      '  KLS_USER.USER_NAME,'
      '  a.kol as pod_kol,'
      '  a.ves as pod_ves'
      'FROM podacha a,podacha_rows b,kls_vetka_otp,kls_user'
      'WHERE a.pod_date>=:begin_date'
      '  AND a.pod_date<=:end_date'
      '  AND ((:IS_NOT=0 AND a.VETKA_OTP_ID=:VETKA_OTP_ID) OR'
      '       (:IS_NOT=1 AND a.VETKA_OTP_ID<>:VETKA_OTP_ID) OR'
      '       (NVL(:VETKA_OTP_ID,0)=0))'
      '  AND a.id=b.podacha_id'
      '  AND a.VETKA_OTP_ID=kls_vetka_otp.ID(+)'
      '  AND a.USER_ID=KLS_USER.ID(+)'
      ')'
      'GROUP BY'
      '  id,pod_num,pod_date,lukoma_num,gd_uved_num,'
      '  VETKA_OTP_ID,VETKA_OTP_NAME,USER_ID,USER_NAME'
      'ORDER BY pod_date desc, pod_num desc')
    Variables.Data = {
      03000000040000000B0000003A424547494E5F444154450C0000000000000000
      000000090000003A454E445F444154450C00000000000000000000000D000000
      3A5645544B415F4F54505F4944030000000000000000000000070000003A4953
      5F4E4F54030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F000000020000004944010000000007000000504F445F4E554D0100
      00000008000000504F445F4441544501000000000A0000004C554B4F4D415F4E
      554D01000000000B00000047445F555645445F4E554D01000000000C00000056
      45544B415F4F54505F494401000000000E0000005645544B415F4F54505F4E41
      4D45010000000007000000555345525F4944010000000009000000555345525F
      4E414D4501000000000A000000474F544F565F4441544501000000000A000000
      4E414C49565F4441544501000000000E000000454E445F4E414C49565F444154
      4501000000000B000000444154455F4F464F524D4C010000000007000000504F
      445F4B4F4C010000000007000000504F445F5645530100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = ora_Session
    Active = True
    BeforeOpen = q_oper_podBeforeOpen
    AfterOpen = q_oper_podAfterOpen
    AfterScroll = q_oper_podAfterScroll
    Left = 507
    Top = 161
    object q_oper_podID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_oper_podPOD_NUM: TStringField
      DisplayLabel = #8470' '#1074#1077#1076#1086'- '#1084#1086#1089#1090#1080
      FieldName = 'POD_NUM'
      Required = True
    end
    object q_oper_podPOD_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'POD_DATE'
      Required = True
    end
    object q_oper_podLUKOMA_NUM: TIntegerField
      DisplayLabel = #8470' '#1051#1059#1050#1054#1052#1072
      FieldName = 'LUKOMA_NUM'
    end
    object q_oper_podGD_UVED_NUM: TIntegerField
      DisplayLabel = #8470' '#1091#1074#1077#1076#1086#1084'. '#1086#1073' '#1091#1073#1086#1088#1082#1077
      FieldName = 'GD_UVED_NUM'
    end
    object q_oper_podVETKA_OTP_ID: TFloatField
      FieldName = 'VETKA_OTP_ID'
      Required = True
    end
    object q_oper_podVETKA_OTP_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'VETKA_OTP_NAME'
      Size = 40
    end
    object q_oper_podUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object q_oper_podUSER_NAME: TStringField
      DisplayLabel = #1054#1092#1086#1088#1084#1080#1090#1077#1083#1100
      FieldName = 'USER_NAME'
      Size = 50
    end
    object q_oper_podGOTOV_DATE: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      FieldName = 'GOTOV_DATE'
    end
    object q_oper_podNALIV_DATE: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1085#1072#1083#1080#1074#1072
      FieldName = 'NALIV_DATE'
    end
    object q_oper_podEND_NALIV_DATE: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1085#1072#1083#1080#1074#1072
      FieldName = 'END_NALIV_DATE'
    end
    object q_oper_podDATE_OFORML: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
    end
    object q_oper_podPOD_KOL: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086', '#1094#1089
      FieldName = 'POD_KOL'
    end
    object q_oper_podPOD_VES: TFloatField
      DisplayLabel = #1042#1077#1089', '#1090#1085
      FieldName = 'POD_VES'
    end
  end
  object ds_oper_pod: TDataSource
    DataSet = q_oper_pod
    Left = 507
    Top = 205
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 215
    Top = 157
  end
  object q_Track: TOracleDataSet
    SQL.Strings = (
      'SELECT ID,VETKA_NAME'
      'FROM KLS_VETKA_OTP'
      'ORDER BY ORDNUNG')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000494401000000000A0000005645544B415F4E414D
      450100000000}
    Session = ora_Session
    Left = 543
    Top = 161
    object q_TrackID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_TrackVETKA_NAME: TStringField
      FieldName = 'VETKA_NAME'
      Required = True
      Size = 40
    end
  end
  object ds_Track: TDataSource
    DataSet = q_Track
    Left = 543
    Top = 205
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 59
    Top = 181
    StyleName = 'XP Style'
    object acPodachaToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1074' Excel'
      ImageIndex = 13
      OnExecute = acPodachaToXLSExecute
    end
    object acPodachaRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acPodachaRefreshExecute
    end
    object acPodRowsToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1072#1075#1086#1085#1099' '#1074' Excel'
      ImageIndex = 13
      OnExecute = acPodRowsToXLSExecute
    end
    object acPrint: TAction
      Category = 'FOR_ALL'
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 6
      OnExecute = acPrintExecute
    end
  end
  object ImageList1: TImageList
    Left = 247
    Top = 125
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001000100000001042000000000000000000001F001F001F001F001F00
      1F001F0010001000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F00FF7F1F001F001F00
      1F001F001000100010000000000000420042000000001F00FF7F1F001F001F00
      1F001F0010001000100000000000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001000FF7F1F001F001F00
      1F0010001F00100010001000000000000000000000001000FF7F1F001F001F00
      1F0010001F001000100010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010001F001000
      1F001F001F0010001F001000100000000000000000000000000010001F001000
      1F001F001F0010001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000FF00FF0000000099FF99FF00000000
      803F803F00000000C47FC47F00000000C00FC00F00000000E01FE01F00000000
      C003C00300000000C007C00700000000C000C00000000000C001C00100000000
      E000E00000000000F001F00100000000FC03FC0300000000FC03FC0300000000
      FC07FC0700000000FF87FF870000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 212
    Top = 121
  end
  object PopupMenuPod: TTBPopupMenu
    Images = ImageList1
    Left = 59
    Top = 125
    object TBItem3: TTBItem
      Action = acPrint
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = acPodachaToXLS
    end
  end
  object q_podrow: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '  b.id,b.podacha_id,a.pod_num,a.pod_date,kls_vetka_otp.VETKA_NAM' +
        'E as VETKA_OTP_NAME, KLS_USER.USER_NAME,'
      '  b.num_pos,'
      '  kls_vagontype.ABBR_NAME as VAGONTYPE_NAME,'
      '  b.num_cist,'
      '  kls_vag_status.NAME as VAG_STATUS_NAME,'
      '  (SELECT MAX(sved.GOTOV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_GOTOV_TIME,     '
      '  (SELECT MAX(sved.BEG_NALIV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_NALIV_TIME,     '
      '  (SELECT MAX(sved.END_NALIV_TIME) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as SVED_END_NALIV_TIME,'
      '  (SELECT MAX(sved.DATE_OFORML) '
      '         FROM SVED,KVIT'
      '   '#9'    WHERE sved.ID=kvit.sved_id '
      #9#9'  AND kvit.nom_zd=b.nom_zd '
      #9#9'  AND kvit.SVED_NUM=b.sved_num'
      #9#9'  AND kvit.DATE_OTGR=b.sved_date) as DATE_OFORML,'
      '  kls_vagowner.SHORT_NAME as VAGOWNER_NAME,'
      '  b.ncistdop,'
      '  b.kalibr_id,'
      '  b.axes,'
      '  b.capacity,'
      '  kls_vetka_pod.SHORT_NAME as vetka_pod_name,'
      '  kls_defi_mass.NAME as defi_mass_name,'
      '  b.ves_brutto,'
      '  b.ves_cist,'
      '  b.vzliv,'
      '  b.volume,'
      '  b.temper,'
      '  b.pl20,'
      '  b.fact_pl,'
      '  b.ves,'
      '  b.kol_net,'
      '  b.plomba1,'
      '  b.plomba2,'
      '  b.pasp_num,'
      '  b.pasp_date,'
      '  b.rez_num,'
      '  kls_prod.ABBR_NPR as NAME_NPR,'
      '  b.nom_zd,'
      '  b.sved_num,'
      '  b.sved_date'
      
        'FROM podacha a,podacha_rows b,kls_vetka_otp,kls_user,KLS_PROD,KL' +
        'S_VAGOWNER,KLS_VAGONTYPE,KLS_VAG_STATUS,KLS_DEFI_MASS,KLS_VETKA_' +
        'OTP KLS_VETKA_POD'
      'WHERE b.podacha_id=:podacha_id'
      '  AND a.id=b.podacha_id'
      '  AND a.VETKA_OTP_ID=kls_vetka_otp.ID(+)'
      '  AND a.USER_ID=KLS_USER.ID(+)'
      '  AND b.PROD_ID_NPR=KLS_PROD.ID_NPR(+)'
      '  AND b.VAGONTYPE_ID=KLS_VAGONTYPE.ID(+)'
      '  AND b.VAGOWNER_ID=KLS_VAGOWNER.ID(+)'
      '  AND b.VAG_STATUS_ID=KLS_VAG_STATUS.ID(+)'
      '  AND b.DEFI_MASS_ID=KLS_DEFI_MASS.ID(+)'
      '  AND b.VETKA_POD_ID=KLS_VETKA_POD.ID(+)'
      'ORDER BY NUM_POS,b.ID')
    Variables.Data = {
      03000000010000000B0000003A504F44414348415F49440300000004000000B4
      B19F0600000000}
    QBEDefinition.QBEFieldDefs = {
      030000002700000003000000564553010000000002000000494401000000000A
      000000504F44414348415F49440100000000070000004E554D5F504F53010000
      00000E0000005641474F4E545950455F4E414D450100000000080000004E554D
      5F4349535401000000000F0000005641475F5354415455535F4E414D45010000
      00000F000000535645445F474F544F565F54494D4501000000000F0000005356
      45445F4E414C49565F54494D45010000000013000000535645445F454E445F4E
      414C49565F54494D4501000000000B000000444154455F4F464F524D4C010000
      00000D0000005641474F574E45525F4E414D450100000000080000004E434953
      54444F500100000000090000004B414C4942525F494401000000000400000041
      584553010000000008000000434150414349545901000000000E000000564554
      4B415F504F445F4E414D4501000000000E000000444546495F4D4153535F4E41
      4D4501000000000A0000005645535F42525554544F0100000000080000005645
      535F43495354010000000005000000565A4C4956010000000006000000564F4C
      554D4501000000000600000054454D504552010000000004000000504C323001
      0000000007000000464143545F504C0100000000070000004B4F4C5F4E455401
      0000000007000000504C4F4D424131010000000007000000504C4F4D42413201
      0000000008000000504153505F4E554D010000000009000000504153505F4441
      544501000000000700000052455A5F4E554D0100000000080000004E414D455F
      4E50520100000000060000004E4F4D5F5A44010000000008000000535645445F
      4E554D010000000009000000535645445F44415445010000000007000000504F
      445F4E554D010000000008000000504F445F4441544501000000000E00000056
      45544B415F4F54505F4E414D45010000000009000000555345525F4E414D4501
      00000000}
    ReadOnly = True
    Session = ora_Session
    BeforeOpen = q_podrowBeforeOpen
    Left = 587
    Top = 161
    object q_podrowID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_podrowPODACHA_ID: TFloatField
      FieldName = 'PODACHA_ID'
      Required = True
    end
    object q_podrowNUM_POS: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'NUM_POS'
    end
    object q_podrowVAGONTYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VAGONTYPE_NAME'
      Size = 3
    end
    object q_podrowNUM_CIST: TStringField
      DisplayLabel = #8470' '#1074#1072#1075#1086#1085#1072
      FieldName = 'NUM_CIST'
      Required = True
      Size = 10
    end
    object q_podrowVAG_STATUS_NAME: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'VAG_STATUS_NAME'
    end
    object q_podrowSVED_GOTOV_TIME: TDateTimeField
      DisplayLabel = #1043#1086#1090#1086#1074#1085#1086#1089#1090#1100
      FieldName = 'SVED_GOTOV_TIME'
    end
    object q_podrowSVED_NALIV_TIME: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1085#1072#1083#1080#1074#1072
      FieldName = 'SVED_NALIV_TIME'
    end
    object q_podrowSVED_END_NALIV_TIME: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1085#1072#1083#1080#1074#1072
      FieldName = 'SVED_END_NALIV_TIME'
    end
    object q_podrowDATE_OFORML: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1086#1092#1086#1088#1084'- '#1083#1077#1085#1080#1103
      FieldName = 'DATE_OFORML'
    end
    object q_podrowVAGOWNER_NAME: TStringField
      DisplayLabel = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1090'/'#1089
      FieldName = 'VAGOWNER_NAME'
      Size = 10
    end
    object q_podrowNCISTDOP: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1076#1086#1088#1086#1075' '#1057#1053#1043
      FieldName = 'NCISTDOP'
    end
    object q_podrowKALIBR_ID: TStringField
      DisplayLabel = #1058#1080#1087' '#1074#1072#1075#1086#1085#1072
      FieldName = 'KALIBR_ID'
      Size = 5
    end
    object q_podrowAXES: TIntegerField
      DisplayLabel = #1054#1089#1077#1081
      FieldName = 'AXES'
    end
    object q_podrowCAPACITY: TStringField
      DisplayLabel = #1043#1088#1091#1079#1086'- '#1087#1086#1076#1098#1077#1084'- '#1085#1086#1089#1090#1100
      FieldName = 'CAPACITY'
      Size = 10
    end
    object q_podrowVETKA_POD_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1087#1086#1076#1072#1095#1080
      FieldName = 'VETKA_POD_NAME'
    end
    object q_podrowDEFI_MASS_NAME: TStringField
      DisplayLabel = #1052#1077#1090#1086#1076' '#1086#1087#1088#1077#1076'. '#1084#1072#1089#1089#1099
      FieldName = 'DEFI_MASS_NAME'
      Size = 50
    end
    object q_podrowVES_BRUTTO: TFloatField
      DisplayLabel = #1042#1077#1089' '#1041#1056#1059#1058#1058#1054' ('#1085#1072' '#1074#1077#1089#1072#1093')'
      FieldName = 'VES_BRUTTO'
    end
    object q_podrowVES_CIST: TFloatField
      DisplayLabel = #1042#1077#1089' '#1074#1072#1075#1086#1085#1072
      FieldName = 'VES_CIST'
    end
    object q_podrowVZLIV: TIntegerField
      DisplayLabel = #1042#1079#1083#1080#1074
      FieldName = 'VZLIV'
    end
    object q_podrowVOLUME: TFloatField
      DisplayLabel = #1054#1073#1098#1077#1084
      FieldName = 'VOLUME'
    end
    object q_podrowTEMPER: TFloatField
      DisplayLabel = #1058#1077#1084#1087#1077'- '#1088#1072#1090#1091#1088#1072
      FieldName = 'TEMPER'
    end
    object q_podrowPL20: TFloatField
      DisplayLabel = #1055#1072#1089#1087'. '#1087#1083#1086#1090#1085#1086#1089#1090#1100
      FieldName = 'PL20'
    end
    object q_podrowFACT_PL: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1087#1083#1086#1090#1085#1086#1089#1090#1100
      FieldName = 'FACT_PL'
    end
    object q_podrowVES: TFloatField
      DisplayLabel = #1042#1077#1089' '#1085'/'#1087#1088
      FieldName = 'VES'
    end
    object q_podrowKOL_NET: TFloatField
      DisplayLabel = #1042#1077#1089' '#1085#1077#1090#1090#1086' '#1053#1045#1060#1058#1048
      FieldName = 'KOL_NET'
    end
    object q_podrowPLOMBA1: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 1'
      FieldName = 'PLOMBA1'
      Size = 15
    end
    object q_podrowPLOMBA2: TStringField
      DisplayLabel = #1055#1083#1086#1084#1073#1072' 2'
      FieldName = 'PLOMBA2'
      Size = 15
    end
    object q_podrowPASP_NUM: TStringField
      DisplayLabel = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_NUM'
    end
    object q_podrowPASP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASP_DATE'
    end
    object q_podrowREZ_NUM: TStringField
      DisplayLabel = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
      FieldName = 'REZ_NUM'
    end
    object q_podrowNAME_NPR: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'NAME_NPR'
    end
    object q_podrowNOM_ZD: TStringField
      DisplayLabel = #8470' '#1079#1072#1076#1072#1085#1080#1103
      FieldName = 'NOM_ZD'
      Size = 12
    end
    object q_podrowSVED_NUM: TIntegerField
      DisplayLabel = #8470' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_NUM'
    end
    object q_podrowSVED_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'SVED_DATE'
    end
    object q_podrowPOD_NUM: TStringField
      DisplayLabel = #8470' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'POD_NUM'
      Required = True
    end
    object q_podrowPOD_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
      FieldName = 'POD_DATE'
      Required = True
    end
    object q_podrowVETKA_OTP_NAME: TStringField
      DisplayLabel = #1055#1091#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1080
      FieldName = 'VETKA_OTP_NAME'
      Size = 40
    end
    object q_podrowUSER_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'USER_NAME'
      Size = 50
    end
  end
  object ds_podrow: TDataSource
    DataSet = q_podrow
    Left = 587
    Top = 205
  end
  object PopupMenuRows: TTBPopupMenu
    Images = ImageList1
    Left = 107
    Top = 389
    object TBItem13: TTBItem
      Action = acPodRowsToXLS
    end
  end
end
