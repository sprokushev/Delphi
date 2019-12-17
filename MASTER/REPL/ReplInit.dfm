object f_ReplInit: Tf_ReplInit
  Left = 312
  Top = 132
  Width = 854
  Height = 628
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 123
    Width = 846
    Height = 449
    ActivePage = tabCallOut
    Align = alClient
    TabOrder = 0
    object tabSite: TTabSheet
      Caption = #1059#1079#1083#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      OnShow = tabSiteShow
      object Panel1: TPanel
        Left = 0
        Top = 23
        Width = 838
        Height = 405
        Align = alClient
        TabOrder = 0
        object gridSites: TDBGridEh
          Left = 1
          Top = 1
          Width = 480
          Height = 403
          Align = alLeft
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_sites
          Flat = False
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
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          UseMultiTitle = True
          OnExit = gridSitesExit
          OnGetCellParams = gridSitesGetCellParams
          Columns = <
            item
              EditButtons = <>
              FieldName = 'SORTBY'
              Footers = <>
              Width = 30
            end
            item
              Checkboxes = True
              EditButtons = <>
              FieldName = 'IS_ACTIVE'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'RN'
              Footers = <>
              ReadOnly = True
              Width = 113
            end
            item
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Width = 242
            end>
        end
        object Panel15: TPanel
          Left = 481
          Top = 1
          Width = 356
          Height = 403
          Align = alClient
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 1
            Top = 39
            Width = 354
            Height = 242
            Align = alTop
            Caption = #1054#1073#1084#1077#1085
            TabOrder = 0
            OnExit = GroupBox1Exit
            object Label1: TLabel
              Left = 8
              Top = 15
              Width = 97
              Height = 13
              Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1082#1072#1090#1072#1083#1086#1075':'
            end
            object Label2: TLabel
              Left = 8
              Top = 64
              Width = 104
              Height = 13
              Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1082#1072#1090#1072#1083#1086#1075':'
            end
            object Label6: TLabel
              Left = 8
              Top = 112
              Width = 106
              Height = 13
              Caption = #1059#1090#1080#1083#1080#1090#1072' '#1069#1050#1057#1055#1054#1056#1058#1040':'
            end
            object Label7: TLabel
              Left = 8
              Top = 136
              Width = 102
              Height = 13
              Caption = #1059#1090#1080#1083#1080#1090#1072' '#1048#1052#1055#1054#1056#1058#1040':'
            end
            object Label11: TLabel
              Left = 9
              Top = 158
              Width = 105
              Height = 13
              Caption = #1042#1088#1077#1084#1077#1085#1085#1099#1081' '#1082#1072#1090#1072#1083#1086#1075':'
            end
            object Label14: TLabel
              Left = 11
              Top = 184
              Width = 83
              Height = 13
              Caption = #1055#1091#1090#1100' '#1082' RAR.EXE'
            end
            object Label3: TLabel
              Left = 11
              Top = 207
              Width = 85
              Height = 13
              Caption = #1040#1076#1088#1077#1089' '#1040#1044#1052#1048#1053#1040':'
            end
            object Label9: TLabel
              Left = 8
              Top = 39
              Width = 97
              Height = 13
              Caption = #1040#1088#1093#1080#1074' '#1074#1093#1086#1076'. '#1082#1072#1090#1072#1083'.:'
            end
            object Label12: TLabel
              Left = 8
              Top = 87
              Width = 103
              Height = 13
              Caption = #1040#1088#1093#1080#1074' '#1080#1089#1093#1086#1076'. '#1082#1072#1090#1072#1083'.:'
            end
            object DBEdit3: TDBEdit
              Left = 120
              Top = 11
              Width = 201
              Height = 21
              DataField = 'BOX_IN'
              DataSource = ds_init
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 120
              Top = 59
              Width = 201
              Height = 21
              DataField = 'BOX_OUT'
              DataSource = ds_init
              TabOrder = 1
            end
            object DBEdit5: TDBEdit
              Left = 120
              Top = 107
              Width = 201
              Height = 21
              DataField = 'EXP_PATH'
              DataSource = ds_init
              TabOrder = 2
            end
            object DBEdit6: TDBEdit
              Left = 120
              Top = 131
              Width = 201
              Height = 21
              DataField = 'IMP_PATH'
              DataSource = ds_init
              TabOrder = 3
            end
            object DBEdit7: TDBEdit
              Left = 120
              Top = 155
              Width = 201
              Height = 21
              DataField = 'TMP_PATH'
              DataSource = ds_init
              TabOrder = 4
            end
            object DBEdit10: TDBEdit
              Left = 120
              Top = 179
              Width = 201
              Height = 21
              DataField = 'ZIP_CMD'
              DataSource = ds_init
              TabOrder = 5
            end
            object DBEdit8: TDBEdit
              Left = 120
              Top = 203
              Width = 201
              Height = 21
              DataField = 'EMAIL_ADMIN'
              DataSource = ds_init
              TabOrder = 6
            end
            object DBEdit11: TDBEdit
              Left = 120
              Top = 35
              Width = 201
              Height = 21
              DataField = 'ARH_IN'
              DataSource = ds_init
              TabOrder = 7
            end
            object DBEdit12: TDBEdit
              Left = 120
              Top = 83
              Width = 201
              Height = 21
              DataField = 'ARH_OUT'
              DataSource = ds_init
              TabOrder = 8
            end
          end
          object Panel16: TPanel
            Left = 1
            Top = 1
            Width = 354
            Height = 38
            Align = alTop
            TabOrder = 1
            OnExit = Panel16Exit
            object DBCheckBox1: TDBCheckBox
              Left = 64
              Top = 12
              Width = 121
              Height = 17
              Caption = #1058#1077#1082#1091#1097#1080#1081' '#1091#1079#1077#1083'?'
              DataField = 'IS_CURRENT'
              DataSource = ds_init
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GroupBox3: TGroupBox
            Left = 1
            Top = 281
            Width = 354
            Height = 121
            Align = alClient
            Caption = 'Database Link'
            TabOrder = 2
            OnExit = GroupBox3Exit
            object Label4: TLabel
              Left = 8
              Top = 36
              Width = 38
              Height = 13
              Caption = 'DBLink:'
            end
            object Label5: TLabel
              Left = 8
              Top = 59
              Width = 103
              Height = 13
              Caption = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1082#1072#1090#1086#1088#1072':'
            end
            object Label13: TLabel
              Left = 8
              Top = 82
              Width = 41
              Height = 13
              Caption = #1055#1072#1088#1086#1083#1100':'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 8
              Top = 15
              Width = 241
              Height = 17
              Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' DBLink '#1076#1083#1103' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1091#1079#1083#1091
              DataField = 'USE_DBLINK'
              DataSource = ds_init
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEdit1: TDBEdit
              Left = 56
              Top = 32
              Width = 265
              Height = 21
              DataField = 'DBLINK'
              DataSource = ds_init
              TabOrder = 1
            end
            object DBEdit2: TDBEdit
              Left = 120
              Top = 55
              Width = 201
              Height = 21
              DataField = 'REPL_SCHEMANAME'
              DataSource = ds_init
              TabOrder = 2
            end
            object DBEdit9: TDBEdit
              Left = 120
              Top = 78
              Width = 201
              Height = 21
              DataField = 'REPL_PASSWORD'
              DataSource = ds_init
              PasswordChar = '*'
              TabOrder = 3
            end
            object DBCheckBox3: TDBCheckBox
              Left = 8
              Top = 101
              Width = 313
              Height = 17
              Caption = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1087#1088#1080' '#1086#1096#1080#1073#1082#1072#1093' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1095#1077#1088#1077#1079' DBLINK'
              DataField = 'DBLINK_ERR_EXP'
              DataSource = ds_init
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      object TBDock10: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar10: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem30: TTBItem
            Action = acReplInitAddSite
            DisplayMode = nbdmImageAndText
          end
          object TBItem31: TTBItem
            Action = acReplInitDelSite
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acReplInitPostSite
            DisplayMode = nbdmImageAndText
          end
          object TBItem1: TTBItem
            Action = acReplInitCancelSite
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem11: TTBSeparatorItem
          end
          object TBItem36: TTBItem
            Action = acReplInitRefreshSite
            DisplayMode = nbdmImageAndText
          end
        end
      end
    end
    object tabTable: TTabSheet
      Caption = #1056#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1099#1077' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 7
      OnShow = tabTableShow
      object TBDock9: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar9: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem17: TTBItem
            Action = acReplInitAddTable
            DisplayMode = nbdmImageAndText
          end
          object TBItem18: TTBItem
            Action = acReplInitDelTable
            DisplayMode = nbdmImageAndText
          end
          object TBItem32: TTBItem
            Action = acReplInitPostTable
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acReplInitCancelTable
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem9: TTBSeparatorItem
          end
          object TBItem19: TTBItem
            Action = acReplInitRefreshTable
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object gridTables: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 405
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_table
        Flat = False
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
        FooterFont.Style = []
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        UseMultiTitle = True
        OnExit = gridTablesExit
        Columns = <
          item
            EditButtons = <>
            FieldName = 'RN'
            Footers = <>
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'REPL_USERNAME'
            Footers = <>
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLENAME'
            Footers = <>
            Width = 134
          end
          item
            EditButtons = <>
            FieldName = 'NOTE'
            Footers = <>
            Width = 201
          end
          item
            EditButtons = <>
            FieldName = 'USERNAME'
            Footers = <>
            Width = 108
          end
          item
            EditButtons = <>
            FieldName = 'TABLENAME'
            Footers = <>
            Width = 132
          end
          item
            EditButtons = <>
            FieldName = 'RNNAME'
            Footers = <>
            Width = 65
          end>
      end
    end
    object tabSchema: TTabSheet
      Caption = #1057#1093#1077#1084#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 1
      OnShow = tabSchemaShow
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem4: TTBItem
            Action = acReplInitAddSchema
            DisplayMode = nbdmImageAndText
          end
          object TBItem3: TTBItem
            Action = acReplInitDelSchema
            DisplayMode = nbdmImageAndText
          end
          object TBItem34: TTBItem
            Action = acReplInitPostSchema
            DisplayMode = nbdmImageAndText
          end
          object TBItem33: TTBItem
            Action = acReplInitCancelSchemaRow
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem5: TTBSeparatorItem
          end
          object TBItem11: TTBItem
            Action = acReplInitRefreshSchema
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object gridSchemaRow: TDBGridEh
        Left = 0
        Top = 182
        Width = 838
        Height = 246
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_schema_row
        Flat = False
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
        FooterFont.Style = []
        FrozenCols = 4
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        UseMultiTitle = True
        OnExit = gridSchemaRowExit
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_ACTIVE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'SORTBY'
            Footers = <>
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'RN'
            Footers = <>
            ReadOnly = True
            Width = 110
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_SOURCE'
            Footers = <>
            Width = 185
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_DEST'
            Footers = <>
            Width = 195
          end
          item
            EditButtons = <>
            FieldName = 'SQL_FIELDS'
            Footers = <>
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'SQL_WHERE'
            Footers = <>
            Width = 142
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLE'
            Footers = <>
            Width = 161
          end
          item
            EditButtons = <>
            FieldName = 'REPL_MODE_NAME'
            Footers = <>
            Width = 174
          end
          item
            EditButtons = <>
            FieldName = 'REPL_USER'
            Footers = <>
            Width = 146
          end>
      end
      object TBDock8: TTBDock
        Left = 0
        Top = 159
        Width = 838
        Height = 23
        object TBToolbar8: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem12: TTBItem
            Action = acReplInitAddSchemaRow
            DisplayMode = nbdmImageAndText
          end
          object TBItem13: TTBItem
            Action = acReplInitDelSchemaRow
            DisplayMode = nbdmImageAndText
          end
          object TBItem16: TTBItem
            Action = acReplInitPostSchemaRow
            DisplayMode = nbdmImageAndText
          end
          object TBItem15: TTBItem
            Action = acReplInitCancelSchemaRow
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem8: TTBSeparatorItem
          end
          object TBItem14: TTBItem
            Action = acReplInitRefreshSchemaRow
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object gridSchema: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 136
        Align = alTop
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_schema
        Flat = False
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
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        UseMultiTitle = True
        OnExit = gridSchemaExit
        Columns = <
          item
            Checkboxes = True
            EditButtons = <>
            FieldName = 'IS_ACTIVE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'SORTBY'
            Footers = <>
            Width = 38
          end
          item
            EditButtons = <>
            FieldName = 'RN'
            Footers = <>
            ReadOnly = True
            Width = 112
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 409
          end>
      end
    end
    object tabLog: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
      ImageIndex = 2
      OnShow = tabLogShow
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 838
        Height = 30
        Align = alTop
        TabOrder = 0
        object Label8: TLabel
          Left = 8
          Top = 8
          Width = 35
          Height = 13
          Caption = #1059#1079#1077#1083':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cb_Site: TRxDBLookupCombo
          Left = 48
          Top = 5
          Width = 177
          Height = 21
          DropDownCount = 8
          EscapeClear = False
          DisplayEmpty = '-- '#1059#1079#1077#1083' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085' --'
          EmptyValue = '0'
          LookupField = 'RN'
          LookupDisplay = 'NAME'
          LookupSource = ds_site_list
          TabOrder = 0
        end
        object cb_Critical: TCheckBox
          Left = 232
          Top = 6
          Width = 137
          Height = 17
          Caption = #1050#1088#1080#1090#1080#1095#1077#1089#1082#1080#1077' '#1086#1096#1080#1073#1082#1080
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object TBDock6: TTBDock
        Left = 0
        Top = 30
        Width = 838
        Height = 23
        object TBToolbar6: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem22: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = TBItem22Click
          end
          object TBSeparatorItem6: TTBSeparatorItem
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 53
        Width = 838
        Height = 368
        Align = alClient
        TabOrder = 2
        object gridLog: TDBGridEh
          Left = 1
          Top = 1
          Width = 320
          Height = 373
          Align = alLeft
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
          DataSource = ds_log
          Flat = False
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
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          PopupMenu = pmLog
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = gridLogSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'DATE_LOG'
              Footers = <>
              Title.TitleButton = True
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'APPL_CODE'
              Footers = <>
              Title.TitleButton = True
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'CALL_RN'
              Footers = <>
              Title.TitleButton = True
              Width = 100
            end>
        end
        object DBMemo1: TDBMemo
          Left = 321
          Top = 1
          Width = 516
          Height = 373
          Align = alClient
          DataField = 'APPL_ERR'
          DataSource = ds_log
          TabOrder = 1
        end
      end
    end
    object TabRepl: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 8
      OnShow = TabReplShow
      object TBDock11: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar11: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem39: TTBItem
            Action = acReplInitAddRepl
            DisplayMode = nbdmImageAndText
          end
          object TBItem40: TTBItem
            Action = acReplInitDelRepl
            DisplayMode = nbdmImageAndText
          end
          object TBItem41: TTBItem
            Action = acReplInitPostRepl
            DisplayMode = nbdmImageAndText
          end
          object TBItem42: TTBItem
            Action = acReplInitCancelRepl
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem4: TTBSeparatorItem
          end
          object tbReplRefresh: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = tbReplRefreshClick
          end
        end
      end
      object gridRepl: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 384
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_Repl
        Flat = False
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
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmRepl
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = gridReplSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REPL_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLENAME'
            Footers = <>
            Title.TitleButton = True
            Width = 167
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLERN'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'REPL_MODIFDATE'
            Footers = <>
            Title.TitleButton = True
          end
          item
            AutoDropDown = True
            ButtonStyle = cbsDropDown
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'REPL_OPERATION'
            Footers = <>
            KeyList.Strings = (
              'U'
              'I'
              'D')
            NotInKeyListIndex = 0
            PickList.Strings = (
              'U - '#1086#1073#1085#1086#1074#1080#1090#1100
              'I - '#1076#1086#1073#1072#1074#1080#1090#1100
              'D - '#1091#1076#1072#1083#1080#1090#1100)
            Title.TitleButton = True
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'REPL_AUTHID'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 193
          end
          item
            EditButtons = <>
            FieldName = 'REPL_USERNAME'
            Footers = <>
            Title.TitleButton = True
            Width = 184
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 173
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 407
        Width = 838
        Height = 21
        Align = alBottom
        TabOrder = 2
        object Label15: TLabel
          Left = 8
          Top = 5
          Width = 275
          Height = 13
          Caption = #1053#1045#1054#1041#1061#1054#1044#1048#1052#1054' '#1042#1067#1041#1056#1040#1058#1068' '#1057#1061#1045#1052#1059' '#1080' '#1058#1040#1041#1051#1048#1062#1059
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tabStatus: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1089#1090#1072#1090#1091#1089#1086#1074
      ImageIndex = 3
      OnShow = tabStatusShow
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar3: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem6: TTBItem
            Action = acReplInitAddStatus
            DisplayMode = nbdmImageAndText
          end
          object TBItem5: TTBItem
            Action = acReplInitDelStatus
            DisplayMode = nbdmImageAndText
          end
          object TBItem37: TTBItem
            Action = acReplInitPostStatus
            DisplayMode = nbdmImageAndText
          end
          object TBItem35: TTBItem
            Action = acReplInitCancelStatus
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem3: TTBSeparatorItem
          end
          object tbStatusRefresh: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = tbStatusRefreshClick
          end
        end
      end
      object gridStatus: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 405
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_status
        Flat = False
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
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmStatus
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = gridStatusSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REPL_STATUS_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 92
          end
          item
            EditButtons = <>
            FieldName = 'REPL_TABLE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 247
          end
          item
            EditButtons = <>
            FieldName = 'REPL_RN'
            Footers = <>
            Title.TitleButton = True
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'EVENT_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 262
          end
          item
            EditButtons = <>
            FieldName = 'SCHEMA_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 144
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 179
          end
          item
            EditButtons = <>
            FieldName = 'TABLERN'
            Footers = <>
            Title.TitleButton = True
            Width = 99
          end
          item
            EditButtons = <>
            FieldName = 'TIME_ADD'
            Footers = <>
            Title.TitleButton = True
          end>
      end
    end
    object tabCallOut: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      ImageIndex = 4
      OnShow = tabCallOutShow
      object TBDock7: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar7: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem7: TTBItem
            Action = acReplInitDelCallOut
            DisplayMode = nbdmImageAndText
          end
          object TBItem25: TTBItem
            Action = acReplInitPostCallOut
            DisplayMode = nbdmImageAndText
          end
          object TBItem38: TTBItem
            Action = acReplInitCancelCallOut
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem7: TTBSeparatorItem
          end
          object TBItem21: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = TBItem21Click
          end
        end
      end
      object gridCallOut: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 179
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds_CallOut
        Flat = False
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
        FooterFont.Style = []
        FrozenCols = 4
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmCallOut
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = gridCallOutSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            Footers = <>
            Title.Caption = 'N'#1087'/'#1087
            Width = 36
            OnGetCellParams = gridCallOutColumns0GetCellParams
          end
          item
            EditButtons = <>
            FieldName = 'REPL_CALL_OUT_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 231
          end
          item
            EditButtons = <>
            FieldName = 'TABLERN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'UPDATE_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 96
          end
          item
            EditButtons = <>
            FieldName = 'STATUS_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 132
          end
          item
            EditButtons = <>
            FieldName = 'COUNTER'
            Footers = <>
            Title.TitleButton = True
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'REPL_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'OPERATION'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'SQL_TEXT'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 436
          end
          item
            EditButtons = <>
            FieldName = 'SCHEMA_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 197
          end
          item
            EditButtons = <>
            FieldName = 'MODIFDATE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'SENDDATE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FILENAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end>
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 202
        Width = 838
        Height = 219
        Align = alBottom
        Caption = 
          ' '#1040#1088#1093#1080#1074' '#1080#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1086#1074' ('#1089#1087#1080#1089#1086#1082' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085' '#1087#1077#1088#1080#1086#1076#1086#1084' ' +
          #1087#1086' '#1076#1072#1090#1077' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1074' '#1072#1088#1093#1080#1074') '
        TabOrder = 2
        Visible = False
        object TBDock12: TTBDock
          Left = 2
          Top = 15
          Width = 834
          Height = 23
          object TBToolbar12: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            TabOrder = 0
            object TBItem60: TTBItem
              Action = acReplInitRestCallOut
              DisplayMode = nbdmImageAndText
            end
            object TBSeparatorItem17: TTBSeparatorItem
            end
            object TBItem47: TTBItem
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DisplayMode = nbdmImageAndText
              Hint = #1054#1073#1085#1086#1074#1080#1090#1100
              ImageIndex = 11
              OnClick = TBItem47Click
            end
          end
        end
        object gridCallOutHist: TDBGridEh
          Left = 2
          Top = 38
          Width = 834
          Height = 179
          Align = alClient
          AllowedOperations = []
          DataSource = ds_CallOutHist
          Flat = False
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
          FooterFont.Style = []
          FrozenCols = 3
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          PopupMenu = pmCallOutHist
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = gridCallOutHistSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'HISTORY_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 96
            end
            item
              EditButtons = <>
              FieldName = 'TABLE_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 165
            end
            item
              EditButtons = <>
              FieldName = 'TABLERN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 98
            end
            item
              EditButtons = <>
              FieldName = 'UPDATE_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 97
            end
            item
              EditButtons = <>
              FieldName = 'STATUS_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 239
            end
            item
              EditButtons = <>
              FieldName = 'COUNTER'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'REPL_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'OPERATION'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'SQL_TEXT'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 436
            end
            item
              EditButtons = <>
              FieldName = 'SCHEMA_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 132
            end
            item
              EditButtons = <>
              FieldName = 'MODIFDATE'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'SENDDATE'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'FILENAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_EXEC'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_HIST'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 113
            end>
        end
      end
    end
    object tabCall: TTabSheet
      Caption = #1041#1091#1092#1077#1088' '#1079#1072#1087#1088#1086#1089#1086#1074
      ImageIndex = 5
      OnShow = tabCallShow
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem8: TTBItem
            Action = acReplInitDelCall
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem1: TTBSeparatorItem
          end
          object TBItem23: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = TBItem23Click
          end
        end
      end
      object gridCall: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 207
        Align = alTop
        AllowedOperations = []
        DataSource = ds_Call
        Flat = False
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
        FooterFont.Style = []
        FrozenCols = 3
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmCall
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = gridCallSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REPL_CALL_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 76
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'TABLERN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 93
          end
          item
            EditButtons = <>
            FieldName = 'UPDATE_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'STATUS_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 239
          end
          item
            EditButtons = <>
            FieldName = 'COUNTER'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'REPL_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'OPERATION'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'SQL_TEXT'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 436
          end
          item
            EditButtons = <>
            FieldName = 'SCHEMA_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 182
          end
          item
            EditButtons = <>
            FieldName = 'MODIFDATE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'SENDDATE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FILENAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end>
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 230
        Width = 838
        Height = 198
        Align = alClient
        Caption = 
          ' '#1040#1088#1093#1080#1074' '#1086#1096#1080#1073#1086#1095#1085#1099#1093' '#1079#1072#1087#1088#1086#1089#1086#1074' ('#1089#1087#1080#1089#1086#1082' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085' '#1087#1077#1088#1080#1086#1076#1086#1084' ' +
          #1087#1086' '#1076#1072#1090#1077' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1074' '#1072#1088#1093#1080#1074') '
        TabOrder = 2
        object TBDock13: TTBDock
          Left = 2
          Top = 15
          Width = 834
          Height = 23
          object TBToolbar13: TTBToolbar
            Left = 0
            Top = 0
            Caption = 'TBToolbar1'
            TabOrder = 0
            object TBItem61: TTBItem
              Action = acReplInitRestCall
              DisplayMode = nbdmImageAndText
            end
            object TBSeparatorItem18: TTBSeparatorItem
            end
            object TBItem54: TTBItem
              Caption = #1054#1073#1085#1086#1074#1080#1090#1100
              DisplayMode = nbdmImageAndText
              Hint = #1054#1073#1085#1086#1074#1080#1090#1100
              ImageIndex = 11
              OnClick = TBItem54Click
            end
          end
        end
        object gridCallErr: TDBGridEh
          Left = 2
          Top = 38
          Width = 834
          Height = 158
          Align = alClient
          AllowedOperations = []
          DataSource = ds_CallErr
          Flat = False
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
          FooterFont.Style = []
          FrozenCols = 3
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          PopupMenu = pmCallErr
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnSortMarkingChanged = gridCallErrSortMarkingChanged
          Columns = <
            item
              EditButtons = <>
              FieldName = 'REPL_CALL_ERR_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 76
            end
            item
              EditButtons = <>
              FieldName = 'TABLE_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 165
            end
            item
              EditButtons = <>
              FieldName = 'TABLERN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 93
            end
            item
              EditButtons = <>
              FieldName = 'UPDATE_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'STATUS_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 239
            end
            item
              EditButtons = <>
              FieldName = 'COUNTER'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'REPL_RN'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 87
            end
            item
              EditButtons = <>
              FieldName = 'OPERATION'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 34
            end
            item
              EditButtons = <>
              FieldName = 'SQL_TEXT'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 436
            end
            item
              EditButtons = <>
              FieldName = 'SCHEMA_NAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
              Width = 182
            end
            item
              EditButtons = <>
              FieldName = 'MODIFDATE'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'SENDDATE'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'FILENAME'
              Footers = <>
              ReadOnly = True
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_EXEC'
              Footers = <>
              Title.TitleButton = True
            end
            item
              EditButtons = <>
              FieldName = 'DATE_HIST'
              Footers = <>
              Title.TitleButton = True
            end>
        end
      end
    end
    object tabAnsw: TTabSheet
      Caption = #1041#1091#1092#1077#1088' '#1086#1090#1074#1077#1090#1086#1074
      ImageIndex = 6
      OnShow = tabAnswShow
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 838
        Height = 23
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          TabOrder = 0
          object TBItem9: TTBItem
            Action = acReplInitDelAnsw
            DisplayMode = nbdmImageAndText
          end
          object TBSeparatorItem2: TTBSeparatorItem
          end
          object TBItem24: TTBItem
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100
            DisplayMode = nbdmImageAndText
            Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            ImageIndex = 11
            OnClick = TBItem24Click
          end
        end
      end
      object gridAnsw: TDBGridEh
        Left = 0
        Top = 23
        Width = 838
        Height = 405
        Align = alClient
        AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
        DataSource = ds_Answ
        Flat = False
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
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghDblClickOptimizeColWidth, dghDialogFind]
        ParentFont = False
        PopupMenu = pmAnsw
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnSortMarkingChanged = gridAnswSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REPL_ANSW_RN'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'SCHEMA_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 182
          end
          item
            EditButtons = <>
            FieldName = 'TABLE_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 165
          end
          item
            EditButtons = <>
            FieldName = 'TABLERN'
            Footers = <>
            Title.TitleButton = True
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'REPL_RN'
            Footers = <>
            Title.TitleButton = True
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'OPERATION'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'SQL_TEXT'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 436
          end
          item
            EditButtons = <>
            FieldName = 'STATUS_NAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
            Width = 239
          end
          item
            EditButtons = <>
            FieldName = 'NOTE'
            Footers = <>
            Title.TitleButton = True
            Width = 357
          end
          item
            EditButtons = <>
            FieldName = 'DATE_LOG'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'SENDDATE'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'FILENAME'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end>
      end
    end
  end
  object pFilter: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 77
    Align = alTop
    TabOrder = 1
    object l_SiteSource: TLabel
      Left = 8
      Top = 8
      Width = 93
      Height = 13
      Caption = #1059#1079#1077#1083'-'#1080#1089#1090#1086#1095#1085#1080#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l_SiteDest: TLabel
      Left = 351
      Top = 9
      Width = 108
      Height = 13
      Caption = #1059#1079#1077#1083'-'#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l_Schema: TLabel
      Left = 59
      Top = 30
      Width = 42
      Height = 13
      Caption = #1057#1093#1077#1084#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l_Table: TLabel
      Left = 404
      Top = 31
      Width = 55
      Height = 13
      Caption = #1058#1072#1073#1083#1080#1094#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 280
      Top = 56
      Width = 23
      Height = 13
      Caption = ' '#1087#1086' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cb_SiteSource: TRxDBLookupCombo
      Left = 104
      Top = 3
      Width = 241
      Height = 21
      DropDownCount = 8
      LookupField = 'RN'
      LookupDisplay = 'NAME'
      LookupSource = ds_site_list
      TabOrder = 0
      OnChange = cb_SiteSourceChange
    end
    object cb_Schema: TRxDBLookupCombo
      Left = 104
      Top = 27
      Width = 241
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '-- '#1042#1057#1045' '#1057#1061#1045#1052#1067' --'
      EmptyValue = '0'
      LookupField = 'RN'
      LookupDisplay = 'NAME'
      LookupSource = ds_schema_list
      TabOrder = 1
      OnChange = cb_SchemaChange
    end
    object cb_Table: TRxDBLookupCombo
      Left = 464
      Top = 27
      Width = 241
      Height = 21
      DropDownCount = 8
      DisplayEmpty = '-- '#1042#1057#1045' '#1058#1040#1041#1051#1048#1062#1067' --'
      EmptyValue = '0'
      LookupField = 'RN'
      LookupDisplay = 'NOTE'
      LookupSource = ds_schema_row_list
      TabOrder = 2
    end
    object cb_SiteDest: TRxDBLookupCombo
      Left = 464
      Top = 3
      Width = 241
      Height = 21
      DropDownCount = 8
      LookupField = 'RN'
      LookupDisplay = 'NAME'
      LookupSource = ds_site_list
      TabOrder = 3
      OnChange = cb_SiteDestChange
    end
    object edTimeFrom: TDateTimePicker
      Left = 104
      Top = 52
      Width = 73
      Height = 21
      Date = 37839.000000000000000000
      Time = 37839.000000000000000000
      Kind = dtkTime
      TabOrder = 4
    end
    object edDateFrom: TDateTimePicker
      Left = 184
      Top = 52
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 5
    end
    object edTimeTo: TDateTimePicker
      Left = 306
      Top = 52
      Width = 71
      Height = 21
      Date = 37839.000000000000000000
      Time = 37839.000000000000000000
      Kind = dtkTime
      TabOrder = 6
    end
    object edDateTo: TDateTimePicker
      Left = 386
      Top = 52
      Width = 92
      Height = 21
      Date = 37839.826075081020000000
      Time = 37839.826075081020000000
      TabOrder = 7
    end
    object cbPeriod: TCheckBox
      Left = 17
      Top = 55
      Width = 81
      Height = 17
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 8
    end
  end
  object Panel11: TPanel
    Left = 0
    Top = 572
    Width = 846
    Height = 22
    Align = alBottom
    TabOrder = 2
    object lbLogin: TLabel
      Left = 6
      Top = 4
      Width = 34
      Height = 13
      Caption = 'lbLogin'
    end
  end
  object TBDock4: TTBDock
    Left = 0
    Top = 77
    Width = 846
    Height = 23
    object TBToolbar4: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      TabOrder = 0
      object TBItem138: TTBItem
        Action = acReplInitImportREPL
        DisplayMode = nbdmImageAndText
      end
      object TBItem137: TTBItem
        Action = acReplInitExecAnswIn
        DisplayMode = nbdmImageAndText
      end
      object TBItem136: TTBItem
        Action = acReplInitExecCallIn
        DisplayMode = nbdmImageAndText
      end
      object TBItem28: TTBItem
        Action = acReplInitExecReSendCallOut
        DisplayMode = nbdmImageAndText
      end
      object TBItem26: TTBItem
        Action = acReplInitExecCallOut
        DisplayMode = nbdmImageAndText
      end
      object TBItem27: TTBItem
        Action = acReplInitExportREPL
        DisplayMode = nbdmImageAndText
      end
      object TBItem139: TTBItem
        Action = acReplInitExecFULL
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object TBDock14: TTBDock
    Left = 0
    Top = 100
    Width = 846
    Height = 23
    object TBToolbar14: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      DockPos = 0
      TabOrder = 0
      object TBItem148: TTBItem
        Action = acReplInitExportMETA
        DisplayMode = nbdmImageAndText
      end
      object TBItem149: TTBItem
        Action = acReplInitImportMETA
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem29: TTBSeparatorItem
      end
      object TBItem29: TTBItem
        Action = acReplInitExecReFormBad
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object oraSess: TOracleSession
    AfterLogOn = oraSessAfterLogOn
    DesignConnection = True
    LogonUsername = 'SNP_REPL'
    LogonPassword = 'ehfufy'
    LogonDatabase = 'P5TEST'
    Left = 28
    Top = 216
  end
  object q_sites: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*,A.rowid,NVL(B.IS_CURRENT,0) as IS_CURRENT '
      'FROM REPL_SITE A,REPL_INIT B'
      'WHERE A.RN=B.SITE_RN(+)'
      'ORDER BY SORTBY')
    SequenceField.Field = 'RN'
    SequenceField.Sequence = 'SEQ_REPL_GLOBAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000500000002000000524E0100000000040000004E414D450100000000
      06000000534F5254425901000000000900000049535F41435449564501000000
      000A00000049535F43555252454E540100000000}
    UniqueFields = 'RN'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REPL_SITE'
    Session = oraSess
    AfterInsert = q_sitesAfterInsert
    BeforeDelete = q_sitesBeforeDelete
    AfterScroll = q_sitesAfterScroll
    Left = 36
    Top = 384
    object q_sitesRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_sitesNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object q_sitesSORTBY: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SORTBY'
      Required = True
    end
    object q_sitesIS_ACTIVE: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074'- '#1085#1099#1081'?'
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_sitesIS_CURRENT: TFloatField
      FieldName = 'IS_CURRENT'
    end
  end
  object ds_sites: TDataSource
    DataSet = q_sites
    Left = 36
    Top = 424
  end
  object ActionManager1: TActionManager
    Left = 72
    Top = 216
    StyleName = 'XP Style'
    object acReplInitAddSite: TAction
      Category = 'USER_INIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1079#1077#1083
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1079#1077#1083
      ImageIndex = 0
      OnExecute = acReplInitAddSiteExecute
    end
    object acReplInitDelSite: TAction
      Category = 'USER_INIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
      ImageIndex = 5
      OnExecute = acReplInitDelSiteExecute
    end
    object acReplInitPostSite: TAction
      Category = 'USER_INIT'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostSiteExecute
    end
    object acReplInitAddSchema: TAction
      Category = 'USER_INIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1093#1077#1084#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1093#1077#1084#1091
      ImageIndex = 0
      OnExecute = acReplInitAddSchemaExecute
    end
    object acReplInitDelSchema: TAction
      Category = 'USER_INIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1093#1077#1084#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1093#1077#1084#1091
      ImageIndex = 5
      OnExecute = acReplInitDelSchemaExecute
    end
    object acReplInitAddStatus: TAction
      Category = 'USER_MAIN'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      ImageIndex = 0
      OnExecute = acReplInitAddStatusExecute
    end
    object acReplInitDelStatus: TAction
      Category = 'USER_MAIN'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      ImageIndex = 5
      OnExecute = acReplInitDelStatusExecute
    end
    object acReplInitPostStatus: TAction
      Category = 'USER_MAIN'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostStatusExecute
    end
    object acReplInitAddRepl: TAction
      Category = 'USER_MAIN'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 0
      OnExecute = acReplInitAddReplExecute
    end
    object acReplInitDelRepl: TAction
      Category = 'USER_MAIN'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 5
      OnExecute = acReplInitDelReplExecute
    end
    object acReplInitDelCallOut: TAction
      Category = 'USER_REPL'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1079#1072#1087#1088#1086#1089
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 5
      OnExecute = acReplInitDelCallOutExecute
    end
    object acReplInitRestCallOut: TAction
      Category = 'USER_REPL'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1079#1072#1087#1088#1086#1089
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1081' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 5
      OnExecute = acReplInitRestCallOutExecute
    end
    object acReplInitPostRepl: TAction
      Category = 'USER_MAIN'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostReplExecute
    end
    object acReplInitDelCall: TAction
      Category = 'USER_MAIN'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 5
      OnExecute = acReplInitDelCallExecute
    end
    object acReplInitRestCall: TAction
      Category = 'USER_MAIN'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 5
      OnExecute = acReplInitRestCallExecute
    end
    object acReplInitDelAnsw: TAction
      Category = 'USER_MAIN'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1074#1077#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1074#1077#1090
      ImageIndex = 5
      OnExecute = acReplInitDelAnswExecute
    end
    object acReplInitPostSchema: TAction
      Category = 'USER_INIT'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostSchemaExecute
    end
    object acReplInitAddSchemaRow: TAction
      Category = 'USER_INIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1089#1093#1077#1084#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 0
      OnExecute = acReplInitAddSchemaRowExecute
    end
    object acReplInitDelSchemaRow: TAction
      Category = 'USER_INIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1089#1093#1077#1084#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 5
      OnExecute = acReplInitDelSchemaRowExecute
    end
    object acReplInitPostSchemaRow: TAction
      Category = 'USER_INIT'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostSchemaRowExecute
    end
    object acReplInitRefreshSite: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1091#1079#1083#1086#1074
      ImageIndex = 11
      OnExecute = acReplInitRefreshSiteExecute
    end
    object acReplInitRefreshSchema: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1089#1093#1077#1084
      ImageIndex = 11
      OnExecute = acReplInitRefreshSchemaExecute
    end
    object acReplInitRefreshSchemaRow: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshSchemaRowExecute
    end
    object acReplInitRefreshRepl: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshReplExecute
    end
    object acReplInitPostCallOut: TAction
      Category = 'USER_REPL'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostCallOutExecute
    end
    object acReplInitCancelSchemaRow: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelSchemaRowExecute
    end
    object acReplInitCancelSchema: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelSchemaExecute
    end
    object acReplInitCancelSite: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelSiteExecute
    end
    object acReplInitCancelStatus: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelStatusExecute
    end
    object acReplInitCancelTable: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelTableExecute
    end
    object acReplInitCancelCallOut: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelCallOutExecute
    end
    object acReplInitCancelRepl: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 16
      OnExecute = acReplInitCancelReplExecute
    end
    object acReplInitAddTable: TAction
      Category = 'USER_INIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      ImageIndex = 0
      OnExecute = acReplInitAddTableExecute
    end
    object acReplInitDelTable: TAction
      Category = 'USER_INIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      ImageIndex = 5
      OnExecute = acReplInitDelTableExecute
    end
    object acReplInitPostTable: TAction
      Category = 'USER_INIT'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = acReplInitPostTableExecute
    end
    object acReplInitRefreshTable: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshTableExecute
    end
    object acReplInitRefreshLog: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshLogExecute
    end
    object acReplInitRefreshStatus: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshStatusExecute
    end
    object acReplInitRefreshCallOut: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshCallOutExecute
    end
    object acReplInitRefreshCall: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshCallExecute
    end
    object acReplInitRefreshAnsw: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acReplInitRefreshAnswExecute
    end
    object acReplInitImportREPL: TAction
      Category = 'USER_MAIN'
      Caption = #1048#1084#1087#1086#1088#1090
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1077' '#1092#1072#1081#1083#1099
      ImageIndex = 13
      OnExecute = acReplInitImportREPLExecute
    end
    object acReplInitExecAnswIn: TAction
      Category = 'USER_MAIN'
      Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1086#1090#1074#1077#1090#1099
      Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1074#1093#1086#1076#1103#1097#1080#1077' '#1086#1090#1074#1077#1090#1099
      ImageIndex = 37
      OnExecute = acReplInitExecAnswInExecute
    end
    object acReplInitExecCallIn: TAction
      Category = 'USER_MAIN'
      Caption = #1042#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1074#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      ImageIndex = 37
      OnExecute = acReplInitExecCallInExecute
    end
    object acReplInitExecReFormBad: TAction
      Category = 'USER_VIEW'
      Caption = #1054#1096#1080#1073#1086#1095#1085#1099#1077' - '#1087#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100
      Hint = #1055#1077#1088#1077#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1096#1080#1073#1086#1095#1085#1099#1077' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099' '#1089' COUNTER>=3'
      ImageIndex = 37
      OnExecute = acReplInitExecReFormBadExecute
    end
    object acReplInitExecReSendCallOut: TAction
      Category = 'USER_REPL'
      Caption = #1055#1086#1074#1090#1086#1088' '#1080#1089#1093#1086#1076#1103#1097#1080#1093
      Hint = #1055#1086#1074#1090#1086#1088#1085#1086' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      ImageIndex = 37
      OnExecute = acReplInitExecReSendCallOutExecute
    end
    object acReplInitExecCallOut: TAction
      Category = 'USER_REPL'
      Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1080#1077' '#1079#1072#1087#1088#1086#1089#1099
      ImageIndex = 37
      OnExecute = acReplInitExecCallOutExecute
    end
    object acReplInitExportREPL: TAction
      Category = 'USER_MAIN'
      Caption = 'DBLINK / '#1069#1082#1089#1087#1086#1088#1090
      Hint = #1055#1077#1088#1077#1076#1072#1090#1100' '#1095#1077#1088#1077#1079' DBLINK / '#1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      ImageIndex = 13
      OnExecute = acReplInitExportREPLExecute
    end
    object acReplInitExportMETA: TAction
      Category = 'USER_INIT'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 13
      OnExecute = acReplInitExportMETAExecute
    end
    object acReplInitImportMETA: TAction
      Category = 'USER_INIT'
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      ImageIndex = 13
      OnExecute = acReplInitImportMETAExecute
    end
    object acReplInitExecFULL: TAction
      Category = 'USER_MAIN'
      Caption = #1056#1077#1087#1083#1080#1082#1072#1094#1080#1103' ('#1074#1089#1077' '#1101#1090#1072#1087#1099')'
      ImageIndex = 37
      OnExecute = acReplInitExecFULLExecute
    end
  end
  object q_init: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*,A.rowid FROM REPL_INIT A'
      'WHERE SITE_RN=0')
    QBEDefinition.QBEFieldDefs = {
      030000001100000002000000524E010000000007000000534954455F524E0100
      0000000A00000049535F43555252454E54010000000006000000424F585F494E
      010000000007000000424F585F4F555401000000000B000000454D41494C5F41
      444D494E01000000000F0000005245504C5F534348454D414E414D4501000000
      000A0000005553455F44424C494E4B01000000000600000044424C494E4B0100
      000000080000004558505F50415448010000000008000000494D505F50415448
      01000000000D0000005245504C5F50415353574F524401000000000800000054
      4D505F504154480100000000070000005A49505F434D44010000000006000000
      4152485F494E0100000000070000004152485F4F555401000000000E00000044
      424C494E4B5F4552525F4558500100000000}
    UniqueFields = 'RN'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REPL_INIT'
    Session = oraSess
    AfterPost = q_initAfterPost
    Left = 68
    Top = 384
    object q_initRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_initSITE_RN: TFloatField
      FieldName = 'SITE_RN'
      Required = True
    end
    object q_initIS_CURRENT: TIntegerField
      FieldName = 'IS_CURRENT'
      Required = True
    end
    object q_initBOX_IN: TStringField
      FieldName = 'BOX_IN'
      Size = 100
    end
    object q_initBOX_OUT: TStringField
      FieldName = 'BOX_OUT'
      Size = 100
    end
    object q_initEMAIL_ADMIN: TStringField
      FieldName = 'EMAIL_ADMIN'
      Size = 50
    end
    object q_initREPL_SCHEMANAME: TStringField
      FieldName = 'REPL_SCHEMANAME'
      Size = 30
    end
    object q_initUSE_DBLINK: TIntegerField
      FieldName = 'USE_DBLINK'
    end
    object q_initDBLINK: TStringField
      FieldName = 'DBLINK'
      Size = 100
    end
    object q_initEXP_PATH: TStringField
      FieldName = 'EXP_PATH'
      Size = 100
    end
    object q_initIMP_PATH: TStringField
      FieldName = 'IMP_PATH'
      Size = 100
    end
    object q_initREPL_PASSWORD: TStringField
      FieldName = 'REPL_PASSWORD'
      Size = 10
    end
    object q_initTMP_PATH: TStringField
      FieldName = 'TMP_PATH'
      Size = 100
    end
    object q_initZIP_CMD: TStringField
      FieldName = 'ZIP_CMD'
      Size = 50
    end
    object q_initARH_IN: TStringField
      DisplayLabel = #1040#1088#1093#1080#1074' '#1074#1093#1086#1076#1103#1097#1077#1075#1086' '#1082#1072#1090#1072#1083#1086#1075#1072
      FieldName = 'ARH_IN'
      Size = 100
    end
    object q_initARH_OUT: TStringField
      FieldName = 'ARH_OUT'
      Size = 100
    end
    object q_initDBLINK_ERR_EXP: TIntegerField
      FieldName = 'DBLINK_ERR_EXP'
    end
  end
  object ds_init: TDataSource
    DataSet = q_init
    Left = 68
    Top = 426
  end
  object q_schema: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*,A.rowid'
      'FROM REPL_SCHEMA A'
      'WHERE A.SITE_SOURCE_RN=:SITE_SOURCE_RN'
      '  AND A.SITE_DEST_RN=:SITE_DEST_RN'
      'ORDER BY A.SORTBY')
    Variables.Data = {
      03000000020000000F0000003A534954455F534F555243455F524E0300000000
      000000000000000D0000003A534954455F444553545F524E0300000000000000
      00000000}
    SequenceField.Field = 'RN'
    SequenceField.Sequence = 'SEQ_REPL_GLOBAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000600000002000000524E0100000000040000004E414D450100000000
      06000000534F5254425901000000000900000049535F41435449564501000000
      000E000000534954455F534F555243455F524E01000000000C00000053495445
      5F444553545F524E0100000000}
    UniqueFields = 'RN'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REPL_SCHEMA'
    Session = oraSess
    BeforeOpen = q_schemaBeforeOpen
    AfterInsert = q_schemaAfterInsert
    BeforeDelete = q_sitesBeforeDelete
    Left = 132
    Top = 384
    object FloatField1: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object FloatField2: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SORTBY'
      Required = True
    end
    object IntegerField1: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074'- '#1085#1072#1103'?'
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_schemaSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_schemaSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
  end
  object ds_schema: TDataSource
    DataSet = q_schema
    Left = 132
    Top = 424
  end
  object q_site_list: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*, B.* FROM REPL_SITE A, REPL_INIT B'
      'WHERE A.RN=B.SITE_RN(+)'
      'ORDER BY SORTBY')
    QBEDefinition.QBEFieldDefs = {
      030000001400000002000000524E0100000000040000004E414D450100000000
      06000000534F5254425901000000000900000049535F41435449564501000000
      0004000000524E5F31010000000007000000534954455F524E01000000000A00
      000049535F43555252454E54010000000006000000424F585F494E0100000000
      07000000424F585F4F555401000000000B000000454D41494C5F41444D494E01
      000000000F0000005245504C5F534348454D414E414D4501000000000A000000
      5553455F44424C494E4B01000000000600000044424C494E4B01000000000800
      00004558505F50415448010000000008000000494D505F504154480100000000
      0D0000005245504C5F50415353574F5244010000000008000000544D505F5041
      54480100000000070000005A49505F434D440100000000060000004152485F49
      4E0100000000070000004152485F4F55540100000000}
    Session = oraSess
    Left = 76
    Top = 280
    object q_site_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_site_listNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object q_site_listSORTBY: TFloatField
      FieldName = 'SORTBY'
      Required = True
    end
    object q_site_listIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_site_listRN_1: TFloatField
      FieldName = 'RN_1'
    end
    object q_site_listSITE_RN: TFloatField
      FieldName = 'SITE_RN'
    end
    object q_site_listIS_CURRENT: TIntegerField
      FieldName = 'IS_CURRENT'
    end
    object q_site_listBOX_IN: TStringField
      FieldName = 'BOX_IN'
      Size = 100
    end
    object q_site_listBOX_OUT: TStringField
      FieldName = 'BOX_OUT'
      Size = 100
    end
    object q_site_listEMAIL_ADMIN: TStringField
      FieldName = 'EMAIL_ADMIN'
      Size = 50
    end
    object q_site_listREPL_SCHEMANAME: TStringField
      FieldName = 'REPL_SCHEMANAME'
      Size = 30
    end
    object q_site_listUSE_DBLINK: TIntegerField
      FieldName = 'USE_DBLINK'
    end
    object q_site_listDBLINK: TStringField
      FieldName = 'DBLINK'
      Size = 100
    end
    object q_site_listEXP_PATH: TStringField
      FieldName = 'EXP_PATH'
      Size = 100
    end
    object q_site_listIMP_PATH: TStringField
      FieldName = 'IMP_PATH'
      Size = 100
    end
    object q_site_listREPL_PASSWORD: TStringField
      FieldName = 'REPL_PASSWORD'
      Size = 10
    end
    object q_site_listTMP_PATH: TStringField
      FieldName = 'TMP_PATH'
      Size = 100
    end
    object q_site_listZIP_CMD: TStringField
      FieldName = 'ZIP_CMD'
      Size = 50
    end
    object q_site_listARH_IN: TStringField
      DisplayLabel = #1040#1088#1093#1080#1074' '#1074#1093#1086#1076#1103#1097#1077#1075#1086' '#1082#1072#1090#1072#1083#1086#1075#1072
      FieldName = 'ARH_IN'
      Size = 100
    end
    object q_site_listARH_OUT: TStringField
      FieldName = 'ARH_OUT'
      Size = 100
    end
  end
  object ds_site_list: TDataSource
    DataSet = q_site_list
    Left = 76
    Top = 328
  end
  object q_schema_row: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*,A.rowid'
      'FROM REPL_SCHEMA_ROW A'
      
        'where A.site_source_rn = :site_source_rn and A.site_dest_rn = :s' +
        'ite_dest_rn and A.schema_rn = :schema_rn'
      'ORDER BY A.SORTBY')
    Variables.Data = {
      03000000030000000F0000003A534954455F534F555243455F524E0400000000
      000000000000000D0000003A534954455F444553545F524E0400000000000000
      000000000A0000003A534348454D415F524E040000000000000000000000}
    SequenceField.Field = 'RN'
    SequenceField.Sequence = 'SEQ_REPL_GLOBAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000D00000002000000524E010000000006000000534F52544259010000
      00000900000049535F41435449564501000000000E000000534954455F534F55
      5243455F524E01000000000C000000534954455F444553545F524E0100000000
      09000000534348454D415F524E01000000000F0000005441424C455F534F5552
      43455F524E01000000000A00000053514C5F4649454C44530100000000090000
      0053514C5F574845524501000000000A0000005245504C5F5441424C45010000
      0000090000005245504C5F4D4F444501000000000D0000005441424C455F4445
      53545F524E0100000000090000005245504C5F555345520100000000}
    UniqueFields = 'RN'
    Master = q_schema
    MasterFields = 'SITE_SOURCE_RN;SITE_DEST_RN;RN'
    DetailFields = 'SITE_SOURCE_RN;SITE_DEST_RN;SCHEMA_RN'
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    UpdatingTable = 'REPL_SCHEMA_ROW'
    Session = oraSess
    AfterInsert = q_schema_rowAfterInsert
    BeforeDelete = q_sitesBeforeDelete
    Left = 164
    Top = 384
    object q_schema_rowRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_schema_rowSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_schema_rowSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_schema_rowSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_schema_rowTABLE_SOURCE_RN: TFloatField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' - '#1080#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'TABLE_SOURCE_RN'
      Required = True
    end
    object q_schema_rowTABLE_DEST_RN: TFloatField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' - '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'TABLE_DEST_RN'
    end
    object q_schema_rowSQL_FIELDS: TStringField
      DisplayLabel = #1057#1087#1080#1089#1086#1082' '#1087#1086#1083#1077#1081
      FieldName = 'SQL_FIELDS'
      Size = 500
    end
    object q_schema_rowSQL_WHERE: TStringField
      DisplayLabel = #1044#1086#1087'. '#1091#1089#1083#1086#1074#1080#1077
      FieldName = 'SQL_WHERE'
      Size = 1000
    end
    object q_schema_rowREPL_TABLE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_schema_rowREPL_MODE: TIntegerField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'REPL_MODE'
    end
    object q_schema_rowSORTBY: TFloatField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'SORTBY'
      Required = True
    end
    object q_schema_rowIS_ACTIVE: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074'- '#1085#1072#1103'?'
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_schema_rowTABLE_SOURCE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' - '#1080#1089#1090#1086#1095#1085#1080#1082
      FieldKind = fkLookup
      FieldName = 'TABLE_SOURCE'
      LookupDataSet = q_table_list
      LookupKeyFields = 'RN'
      LookupResultField = 'NOTE'
      KeyFields = 'TABLE_SOURCE_RN'
      Size = 100
      Lookup = True
    end
    object q_schema_rowTABLE_DEST: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' - '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'TABLE_DEST'
      LookupDataSet = q_table_list
      LookupKeyFields = 'RN'
      LookupResultField = 'NOTE'
      KeyFields = 'TABLE_DEST_RN'
      Size = 100
      Lookup = True
    end
    object q_schema_rowREPL_MODE_NAME: TStringField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldKind = fkLookup
      FieldName = 'REPL_MODE_NAME'
      LookupDataSet = q_mode
      LookupKeyFields = 'RN'
      LookupResultField = 'NAME'
      KeyFields = 'REPL_MODE'
      Size = 50
      Lookup = True
    end
    object q_schema_rowREPL_USER: TStringField
      DisplayLabel = #1050#1090#1086' '#1088#1077#1087#1083#1080#1094#1080#1088#1091#1077#1090
      FieldName = 'REPL_USER'
      Size = 30
    end
  end
  object ds_schema_row: TDataSource
    DataSet = q_schema_row
    Left = 164
    Top = 424
  end
  object q_table_list: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM REPL_TABLE'
      'ORDER BY NOTE')
    QBEDefinition.QBEFieldDefs = {
      030000000700000002000000524E01000000000D0000005245504C5F55534552
      4E414D4501000000000E0000005245504C5F5441424C454E414D450100000000
      040000004E4F5445010000000008000000555345524E414D4501000000000900
      00005441424C454E414D45010000000006000000524E4E414D450100000000}
    Session = oraSess
    Left = 108
    Top = 280
    object q_table_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_table_listREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_table_listREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
    object q_table_listNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object q_table_listUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 30
    end
    object q_table_listTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 50
    end
    object q_table_listRNNAME: TStringField
      FieldName = 'RNNAME'
      Required = True
      Size = 15
    end
  end
  object ds_table_list: TDataSource
    DataSet = q_table_list
    Left = 108
    Top = 328
  end
  object q_mode: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_REPL_MODE'
      'ORDER BY RN')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000524E0100000000040000004E414D450100000000}
    Session = oraSess
    Left = 276
    Top = 280
    object q_modeRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_modeNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object ds_table: TDataSource
    DataSet = q_table
    Left = 100
    Top = 424
  end
  object q_table: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*,A.rowid FROM REPL_TABLE A ORDER BY A.NOTE')
    SequenceField.Field = 'RN'
    SequenceField.Sequence = 'SEQ_REPL_GLOBAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000700000002000000524E01000000000D0000005245504C5F55534552
      4E414D4501000000000E0000005245504C5F5441424C454E414D450100000000
      040000004E4F5445010000000008000000555345524E414D4501000000000900
      00005441424C454E414D45010000000006000000524E4E414D450100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = oraSess
    BeforeDelete = q_tableBeforeDelete
    Left = 100
    Top = 384
    object q_tableRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_tableREPL_USERNAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' ('#1074' UPDATELIST)'
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_tableREPL_TABLENAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' ('#1074' UPDATELIST)'
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
    object q_tableNOTE: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'NOTE'
      Size = 100
    end
    object q_tableUSERNAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' ('#1074' '#1054#1055#1045#1056#1040#1058#1054#1056#1045')'
      FieldName = 'USERNAME'
      Size = 30
    end
    object q_tableTABLENAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' ('#1074' '#1054#1055#1045#1056#1040#1058#1054#1056#1045')'
      FieldName = 'TABLENAME'
      Size = 50
    end
    object q_tableRNNAME: TStringField
      DisplayLabel = #1055#1086#1083#1077' ID'
      FieldName = 'RNNAME'
      Size = 15
    end
  end
  object q_log: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS */'
      '  B.STATUS as APPL_CODE,'
      
        '  DECODE(KLS_EVENTS.RN,NULL,'#39#39',KLS_EVENTS.NAME||'#39' - '#39')||B.DESCRI' +
        'PT as APPL_ERR,'
      '  B.LOG_TIME as DATE_LOG,'
      '  B.CALL_RN,'
      '  B.SITE_RN'
      
        'FROM SNP_REPL.REPL_SESSION A, SNP_REPL.REPL_SESSION_LOG B, SNP_R' +
        'EPL.KLS_EVENTS'
      'WHERE A.ID=B.SESSION_ID AND B.STATUS=KLS_EVENTS.RN(+)'
      '-- '#1060#1080#1083#1100#1090#1088
      
        'AND B.SITE_RN=0 AND B.LOG_TIME>=SYSDATE AND B.LOG_TIME<=SYSDATE ' +
        'AND B.STATUS<=-100'
      'ORDER BY B.ID DESC')
    QBEDefinition.QBEFieldDefs = {
      030000000500000008000000444154455F4C4F47010000000008000000415050
      4C5F4552520100000000090000004150504C5F434F4445010000000007000000
      43414C4C5F524E010000000007000000534954455F524E0100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_logBeforeOpen
    AfterOpen = q_logAfterOpen
    OnFilterRecord = q_logFilterRecord
    Left = 196
    Top = 384
    object q_logAPPL_CODE: TFloatField
      DisplayLabel = #1050#1086#1076' '#1089#1086#1073#1099#1090#1080#1103
      FieldName = 'APPL_CODE'
      Required = True
    end
    object q_logDATE_LOG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' / '#1074#1088#1077#1084#1103
      FieldName = 'DATE_LOG'
      Required = True
    end
    object q_logAPPL_ERR: TStringField
      DisplayLabel = #1057#1086#1073#1099#1090#1080#1077
      FieldName = 'APPL_ERR'
      Size = 403
    end
    object q_logCALL_RN: TFloatField
      DisplayLabel = 'RN '#1086#1087#1077#1088#1072#1090#1086#1088#1072' (CALL_RN)'
      FieldName = 'CALL_RN'
    end
    object q_logSITE_RN: TFloatField
      FieldName = 'SITE_RN'
    end
  end
  object ds_log: TDataSource
    DataSet = q_log
    Left = 196
    Top = 424
  end
  object q_schema_list: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM REPL_SCHEMA'
      'WHERE SITE_SOURCE_RN=:SITE_SOURCE_RN'
      '  AND SITE_DEST_RN=:SITE_DEST_RN'
      'ORDER BY SORTBY')
    Variables.Data = {
      03000000020000000F0000003A534954455F534F555243455F524E0300000000
      000000000000000D0000003A534954455F444553545F524E0300000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      030000000600000002000000524E0100000000040000004E414D450100000000
      06000000534F5254425901000000000900000049535F41435449564501000000
      000E000000534954455F534F555243455F524E01000000000C00000053495445
      5F444553545F524E0100000000}
    Session = oraSess
    Left = 140
    Top = 280
    object q_schema_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_schema_listSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_schema_listSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_schema_listNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object q_schema_listSORTBY: TFloatField
      FieldName = 'SORTBY'
      Required = True
    end
    object q_schema_listIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
  end
  object ds_schema_list: TDataSource
    DataSet = q_schema_list
    Left = 140
    Top = 328
  end
  object q_schema_row_list: TOracleDataSet
    SQL.Strings = (
      
        'SELECT A.*,B.NOTE,B.REPL_USERNAME,B.REPL_TABLENAME FROM REPL_SCH' +
        'EMA_ROW A, REPL_TABLE B'
      'WHERE A.SITE_SOURCE_RN=:SITE_SOURCE_RN'
      '  AND A.SITE_DEST_RN=:SITE_DEST_RN'
      '  AND A.SCHEMA_RN=:SCHEMA_RN'
      '  AND A.TABLE_SOURCE_RN=B.RN'
      'ORDER BY B.NOTE')
    Variables.Data = {
      03000000030000000F0000003A534954455F534F555243455F524E0300000000
      000000000000000D0000003A534954455F444553545F524E0300000000000000
      000000000A0000003A534348454D415F524E030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F00000002000000524E010000000006000000534F52544259010000
      00000900000049535F41435449564501000000000E000000534954455F534F55
      5243455F524E01000000000C000000534954455F444553545F524E0100000000
      09000000534348454D415F524E01000000000F0000005441424C455F534F5552
      43455F524E01000000000A00000053514C5F4649454C44530100000000090000
      0053514C5F574845524501000000000A0000005245504C5F5441424C45010000
      0000090000005245504C5F4D4F444501000000000D0000005441424C455F4445
      53545F524E0100000000040000004E4F544501000000000D0000005245504C5F
      555345524E414D4501000000000E0000005245504C5F5441424C454E414D4501
      00000000}
    Session = oraSess
    Left = 172
    Top = 280
    object q_schema_row_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_schema_row_listSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_schema_row_listSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_schema_row_listSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_schema_row_listTABLE_SOURCE_RN: TFloatField
      FieldName = 'TABLE_SOURCE_RN'
      Required = True
    end
    object q_schema_row_listSQL_FIELDS: TStringField
      FieldName = 'SQL_FIELDS'
      Size = 500
    end
    object q_schema_row_listSQL_WHERE: TStringField
      FieldName = 'SQL_WHERE'
      Size = 1000
    end
    object q_schema_row_listREPL_TABLE: TStringField
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_schema_row_listREPL_MODE: TIntegerField
      FieldName = 'REPL_MODE'
      Required = True
    end
    object q_schema_row_listSORTBY: TFloatField
      FieldName = 'SORTBY'
      Required = True
    end
    object q_schema_row_listIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_schema_row_listTABLE_DEST_RN: TFloatField
      FieldName = 'TABLE_DEST_RN'
      Required = True
    end
    object q_schema_row_listNOTE: TStringField
      FieldName = 'NOTE'
      Size = 100
    end
    object q_schema_row_listREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_schema_row_listREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
  end
  object ds_schema_row_list: TDataSource
    DataSet = q_schema_row_list
    Left = 172
    Top = 328
  end
  object q_status: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED USE_NL(A,B,C,D) */'
      '  A.ROWID, A.RN as REPL_STATUS_RN,'
      
        '  A.*, B.NAME as SCHEMA_NAME, D.NOTE as TABLE_NAME, C.REPL_TABLE' +
        ', D.REPL_USERNAME, D.REPL_TABLENAME'
      
        'FROM SNP_REPL.REPL_STATUS A, SNP_REPL.REPL_SCHEMA B, SNP_REPL.RE' +
        'PL_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D'
      
        'WHERE A.SITE_SOURCE_RN=B.SITE_SOURCE_RN AND A.SITE_DEST_RN=B.SIT' +
        'E_DEST_RN AND A.SCHEMA_RN=B.RN'
      'AND A.SCHEMAROW_RN=C.RN'
      'AND C.TABLE_SOURCE_RN=D.RN'
      
        'AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0 AND A.TIME_ADD>=SYSD' +
        'ATE-1 AND A.TIME_ADD<=SYSDATE'
      'ORDER BY A.RN DESC'
      '')
    SequenceField.Field = 'RN'
    SequenceField.Sequence = 'SEQ_REPL_LOCAL'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000F00000002000000524E0100000000070000005245504C5F524E0100
      0000000600000053544154555301000000000E000000534954455F534F555243
      455F524E01000000000C000000534954455F444553545F524E01000000000900
      0000534348454D415F524E01000000000C000000534348454D41524F575F524E
      01000000000B000000534348454D415F4E414D4501000000000A000000544142
      4C455F4E414D4501000000000A0000005245504C5F5441424C45010000000007
      0000005441424C45524E01000000000800000054494D455F4144440100000000
      0D0000005245504C5F555345524E414D4501000000000E0000005245504C5F54
      41424C454E414D4501000000000E0000005245504C5F5354415455535F524E01
      00000000}
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_statusBeforeOpen
    AfterOpen = q_statusAfterOpen
    AfterInsert = q_statusAfterInsert
    BeforeDelete = q_statusBeforeDelete
    OnFilterRecord = q_statusFilterRecord
    Left = 260
    Top = 384
    object q_statusRN: TFloatField
      FieldName = 'RN'
    end
    object q_statusREPL_RN: TFloatField
      DisplayLabel = 'RN '#1074' '#1090#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_statusSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Required = True
    end
    object q_statusEVENT_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'EVENT_NAME'
      LookupDataSet = q_events_list
      LookupKeyFields = 'RN'
      LookupResultField = 'NAME'
      KeyFields = 'STATUS'
      Size = 100
      Lookup = True
    end
    object q_statusSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_statusSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_statusSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_statusSCHEMAROW_RN: TFloatField
      FieldName = 'SCHEMAROW_RN'
      Required = True
    end
    object q_statusSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_statusTABLE_NAME: TStringField
      DisplayLabel = #1056#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_statusREPL_TABLE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_statusTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
    end
    object q_statusTIME_ADD: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1089#1090#1072#1090#1091#1089#1072
      FieldName = 'TIME_ADD'
      Required = True
    end
    object q_statusREPL_USERNAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_statusREPL_TABLENAME: TStringField
      DisplayLabel = #1056#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
    object q_statusREPL_STATUS_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'REPL_STATUS_RN'
      Required = True
    end
  end
  object ds_status: TDataSource
    DataSet = q_status
    Left = 260
    Top = 424
  end
  object q_events_list: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_EVENTS'
      'ORDER BY RN')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000524E0100000000040000004E414D450100000000}
    Session = oraSess
    Left = 204
    Top = 280
    object q_events_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_events_listNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object ds_events_list: TDataSource
    DataSet = q_events_list
    Left = 204
    Top = 328
  end
  object q_CallOut: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS */'
      '  A.ROWID, A.RN as REPL_CALL_OUT_RN,'
      
        '  A.*, B.NAME as SCHEMA_NAME, D.NOTE as TABLE_NAME, A.SQL1_TEXT|' +
        '|A.SQL2_TEXT as SQL_TEXT, D.REPL_USERNAME, D.REPL_TABLENAME, C.R' +
        'EPL_TABLE'
      
        'FROM SNP_REPL.REPL_CALL_OUT A, SNP_REPL.REPL_SCHEMA B, SNP_REPL.' +
        'REPL_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D'
      'WHERE a.site_source_rn = b.site_source_rn'
      '  AND a.site_dest_rn = b.site_dest_rn'
      '  AND A.SCHEMA_RN=B.RN'
      '  AND A.SCHEMAROW_RN=C.RN'
      '  AND C.TABLE_SOURCE_RN=D.RN'
      '  AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0'
      'ORDER BY A.COUNTER DESC')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001700000002000000524E0100000000070000005245504C5F524E0100
      0000000600000053544154555301000000000E000000534954455F534F555243
      455F524E01000000000C000000534954455F444553545F524E01000000000900
      0000534348454D415F524E01000000000C000000534348454D41524F575F524E
      0100000000090000005550444154455F524E0100000000070000005441424C45
      524E0100000000090000004F5045524154494F4E0100000000090000004D4F44
      494644415445010000000007000000434F554E54455201000000000800000053
      454E444441544501000000000800000046494C454E414D4501000000000B0000
      00534348454D415F4E414D4501000000000A0000005441424C455F4E414D4501
      000000000800000053514C5F5445585401000000000900000053514C315F5445
      585401000000000900000053514C325F5445585401000000000D000000524550
      4C5F555345524E414D4501000000000E0000005245504C5F5441424C454E414D
      4501000000000A0000005245504C5F5441424C4501000000000B00000043414C
      4C5F4F55545F524E0100000000}
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_CallOutBeforeOpen
    AfterOpen = q_CallOutAfterOpen
    BeforePost = q_CallOutBeforePost
    AfterPost = q_CallOutAfterPost
    OnFilterRecord = q_CallOutFilterRecord
    Left = 292
    Top = 384
    object q_CallOutRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_CallOutUPDATE_RN: TFloatField
      DisplayLabel = 'RN '#1086#1087#1077#1088#1072#1090#1086#1088#1072' UPDATE'
      FieldName = 'UPDATE_RN'
    end
    object q_CallOutSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_CallOutSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_CallOutSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_CallOutSCHEMAROW_RN: TFloatField
      FieldName = 'SCHEMAROW_RN'
      Required = True
    end
    object q_CallOutTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080#1088#1091'- '#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
      Required = True
    end
    object q_CallOutREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_CallOutOPERATION: TStringField
      DisplayLabel = #1054#1087#1077'- '#1088#1072'- '#1094#1080#1103
      FieldName = 'OPERATION'
      Required = True
      Size = 1
    end
    object q_CallOutMODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'MODIFDATE'
      Required = True
    end
    object q_CallOutCOUNTER: TIntegerField
      DisplayLabel = #1057#1095#1077#1090'- '#1095#1080#1082
      FieldName = 'COUNTER'
      Required = True
    end
    object q_CallOutSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Required = True
    end
    object q_CallOutSENDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1089#1099#1083#1082#1080
      FieldName = 'SENDDATE'
    end
    object q_CallOutFILENAME: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 30
    end
    object q_CallOutSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_CallOutTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_CallOutSQL_TEXT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'SQL_TEXT'
      Size = 8000
    end
    object q_CallOutSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'STATUS_NAME'
      LookupDataSet = q_status_list
      LookupKeyFields = 'RN'
      LookupResultField = 'NAME'
      KeyFields = 'STATUS'
      Size = 50
      Lookup = True
    end
    object q_CallOutREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_CallOutREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
    object q_CallOutREPL_TABLE: TStringField
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_CallOutREPL_CALL_OUT_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'REPL_CALL_OUT_RN'
      Required = True
    end
  end
  object ds_CallOut: TDataSource
    DataSet = q_CallOut
    Left = 292
    Top = 424
  end
  object q_Call: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED USE_NL(A,B,C,D,E) */'
      '  A.ROWID, A.RN as REPL_CALL_RN,'
      
        '  A.*, B.NAME as SCHEMA_NAME, D.NOTE as TABLE_NAME, A.SQL1_TEXT|' +
        '|A.SQL2_TEXT as SQL_TEXT, E.NAME as STATUS_NAME, D.REPL_USERNAME' +
        ', D.REPL_TABLENAME, C.REPL_TABLE'
      
        'FROM SNP_REPL.REPL_CALL A, SNP_REPL.REPL_SCHEMA B, SNP_REPL.REPL' +
        '_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D, SNP_REPL.KLS_STATUS E'
      
        'WHERE a.site_source_rn = b.site_source_rn(+) AND a.site_dest_rn ' +
        '= b.site_dest_rn(+)'
      'AND A.SCHEMA_RN=B.RN(+)'
      'AND A.SCHEMAROW_RN=C.RN(+)'
      'AND C.TABLE_SOURCE_RN=D.RN(+)'
      'AND A.STATUS=E.RN'
      'AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0'
      'ORDER BY A.RN DESC')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001800000002000000524E0100000000070000005245504C5F524E0100
      0000000600000053544154555301000000000E000000534954455F534F555243
      455F524E01000000000C000000534954455F444553545F524E01000000000900
      0000534348454D415F524E01000000000C000000534348454D41524F575F524E
      0100000000090000005550444154455F524E0100000000070000005441424C45
      524E0100000000090000004F5045524154494F4E0100000000090000004D4F44
      494644415445010000000007000000434F554E54455201000000000800000053
      454E444441544501000000000800000046494C454E414D4501000000000B0000
      00534348454D415F4E414D4501000000000A0000005441424C455F4E414D4501
      000000000800000053514C5F5445585401000000000B0000005354415455535F
      4E414D4501000000000900000053514C315F5445585401000000000900000053
      514C325F5445585401000000000D0000005245504C5F555345524E414D450100
      0000000E0000005245504C5F5441424C454E414D4501000000000A0000005245
      504C5F5441424C4501000000000C0000005245504C5F43414C4C5F524E010000
      0000}
    ReadOnly = True
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_CallBeforeOpen
    AfterOpen = q_CallAfterOpen
    OnFilterRecord = q_CallFilterRecord
    Left = 324
    Top = 384
    object q_CallRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_CallUPDATE_RN: TFloatField
      DisplayLabel = 'RN '#1086#1087#1077#1088#1072#1090#1086#1088#1072' UPDATE'
      FieldName = 'UPDATE_RN'
    end
    object q_CallSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_CallSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_CallSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_CallSCHEMAROW_RN: TFloatField
      FieldName = 'SCHEMAROW_RN'
      Required = True
    end
    object q_CallTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080'- '#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
      Required = True
    end
    object q_CallREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_CallOPERATION: TStringField
      DisplayLabel = #1054#1087#1077'- '#1088#1072'- '#1094#1080#1103
      FieldName = 'OPERATION'
      Required = True
      Size = 1
    end
    object q_CallMODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'MODIFDATE'
      Required = True
    end
    object q_CallCOUNTER: TIntegerField
      DisplayLabel = #1057#1095#1077#1090#1095#1080#1082
      FieldName = 'COUNTER'
      Required = True
    end
    object q_CallSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object q_CallSENDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'SENDDATE'
    end
    object q_CallFILENAME: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 30
    end
    object q_CallSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_CallTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_CallSQL_TEXT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'SQL_TEXT'
      Size = 8000
    end
    object q_CallSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS_NAME'
      Size = 100
    end
    object q_CallREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Size = 30
    end
    object q_CallREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Size = 50
    end
    object q_CallREPL_TABLE: TStringField
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_CallREPL_CALL_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'REPL_CALL_RN'
      Required = True
    end
  end
  object ds_Call: TDataSource
    DataSet = q_Call
    Left = 324
    Top = 424
  end
  object ds_Answ: TDataSource
    DataSet = q_Answ
    Left = 356
    Top = 424
  end
  object q_Answ: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED USE_NL(A,B,C,D,E,AA) */'
      '  A.ROWID, A.RN as REPL_ANSW_RN,'
      
        '  A.*, AA.OPERATION, AA.TABLERN, AA.REPL_RN, B.NAME as SCHEMA_NA' +
        'ME, D.NOTE as TABLE_NAME, AA.SQL1_TEXT||AA.SQL2_TEXT as SQL_TEXT' +
        ', E.NAME as STATUS_NAME'
      
        'FROM SNP_REPL.REPL_ANSW A, SNP_REPL.REPL_SCHEMA B, SNP_REPL.REPL' +
        '_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D, SNP_REPL.KLS_STATUS E,'
      'SNP_REPL.REPL_CALL_OUT AA'
      'WHERE A.SITE_SOURCE_RN=AA.SITE_SOURCE_RN (+)'
      'AND A.SITE_DEST_RN=AA.SITE_DEST_RN (+)'
      'AND A.CALL_OUT_RN=AA.RN (+)'
      'AND AA.SCHEMA_RN=B.RN (+)'
      'AND AA.SCHEMAROW_RN=C.RN (+)'
      'AND C.TABLE_SOURCE_RN=D.RN (+)'
      'AND A.STATUS=E.RN'
      'AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0'
      'ORDER BY A.RN DESC')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001100000002000000524E010000000006000000535441545553010000
      00000E000000534954455F534F555243455F524E01000000000C000000534954
      455F444553545F524E01000000000800000053454E4444415445010000000008
      00000046494C454E414D4501000000000B000000534348454D415F4E414D4501
      000000000A0000005441424C455F4E414D4501000000000800000053514C5F54
      45585401000000000B00000043414C4C5F4F55545F524E010000000004000000
      4E4F5445010000000008000000444154455F4C4F4701000000000B0000005354
      415455535F4E414D450100000000090000004F5045524154494F4E0100000000
      070000005441424C45524E0100000000070000005245504C5F524E0100000000
      0C0000005245504C5F414E53575F524E0100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_AnswBeforeOpen
    AfterOpen = q_AnswAfterOpen
    BeforeDelete = q_AnswBeforeDelete
    OnFilterRecord = q_AnswFilterRecord
    Left = 356
    Top = 384
    object q_AnswRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_AnswSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_AnswSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_AnswCALL_OUT_RN: TFloatField
      FieldName = 'CALL_OUT_RN'
      Required = True
    end
    object q_AnswSENDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'SENDDATE'
    end
    object q_AnswFILENAME: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 30
    end
    object q_AnswSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object q_AnswNOTE: TStringField
      DisplayLabel = #1054#1090#1074#1077#1090
      FieldName = 'NOTE'
      Size = 300
    end
    object q_AnswDATE_LOG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1074#1077#1090#1072
      FieldName = 'DATE_LOG'
    end
    object q_AnswSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_AnswTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_AnswSQL_TEXT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'SQL_TEXT'
      Size = 4000
    end
    object q_AnswSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS_NAME'
      Size = 100
    end
    object q_AnswOPERATION: TStringField
      DisplayLabel = #1054#1087#1077'- '#1088#1072'- '#1094#1080#1103
      FieldName = 'OPERATION'
      Required = True
      Size = 1
    end
    object q_AnswTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080'- '#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
      Required = True
    end
    object q_AnswREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080'- '#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_AnswREPL_ANSW_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'REPL_ANSW_RN'
      Required = True
    end
  end
  object q_status_list: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM KLS_STATUS'
      'ORDER BY RN')
    QBEDefinition.QBEFieldDefs = {
      030000000200000002000000524E0100000000040000004E414D450100000000}
    Session = oraSess
    Left = 236
    Top = 280
    object q_status_listRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_status_listNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
  end
  object ds_status_list: TDataSource
    DataSet = q_status_list
    Left = 236
    Top = 328
  end
  object oraPackage: TOraclePackage
    Session = oraSess
    PackageName = 'FOR_REPL'
    Left = 126
    Top = 217
  end
  object q_cmn: TOracleQuery
    Session = oraSess
    Left = 268
    Top = 221
  end
  object ReplLogon: TOracleLogon
    Session = oraSess
    Retries = 5
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    Caption = #1048#1084#1103' '#1080' '#1055#1072#1088#1086#1083#1100' '#1056#1077#1087#1083#1080#1082#1072#1090#1086#1088#1072
    Left = 176
    Top = 217
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.RAR'
    Options = [ofReadOnly, ofHideReadOnly, ofNoChangeDir, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
    Left = 220
    Top = 215
  end
  object q_site_cur: TOracleDataSet
    SQL.Strings = (
      'SELECT A.*, B.*'
      'FROM REPL_SITE A,REPL_INIT B'
      'WHERE A.RN=B.SITE_RN'
      'AND B.IS_CURRENT=1')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001500000002000000524E0100000000040000004E414D450100000000
      06000000534F5254425901000000000900000049535F41435449564501000000
      000A00000049535F43555252454E54010000000004000000524E5F3101000000
      0007000000534954455F524E010000000006000000424F585F494E0100000000
      07000000424F585F4F555401000000000B000000454D41494C5F41444D494E01
      000000000F0000005245504C5F534348454D414E414D4501000000000A000000
      5553455F44424C494E4B01000000000600000044424C494E4B01000000000800
      00004558505F50415448010000000008000000494D505F504154480100000000
      0D0000005245504C5F50415353574F5244010000000008000000544D505F5041
      54480100000000070000005A49505F434D440100000000060000004152485F49
      4E0100000000070000004152485F4F555401000000000E00000044424C494E4B
      5F4552525F4558500100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = oraSess
    Left = 36
    Top = 472
    object q_site_curNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object q_site_curSORTBY: TFloatField
      FieldName = 'SORTBY'
      Required = True
    end
    object q_site_curIS_ACTIVE: TIntegerField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
    object q_site_curSITE_RN: TFloatField
      FieldName = 'SITE_RN'
      Required = True
    end
    object q_site_curIS_CURRENT: TIntegerField
      FieldName = 'IS_CURRENT'
      Required = True
    end
    object q_site_curBOX_IN: TStringField
      FieldName = 'BOX_IN'
      Size = 100
    end
    object q_site_curBOX_OUT: TStringField
      FieldName = 'BOX_OUT'
      Size = 100
    end
    object q_site_curEMAIL_ADMIN: TStringField
      FieldName = 'EMAIL_ADMIN'
      Size = 50
    end
    object q_site_curREPL_SCHEMANAME: TStringField
      FieldName = 'REPL_SCHEMANAME'
      Size = 30
    end
    object q_site_curUSE_DBLINK: TIntegerField
      FieldName = 'USE_DBLINK'
    end
    object q_site_curDBLINK: TStringField
      FieldName = 'DBLINK'
      Size = 100
    end
    object q_site_curEXP_PATH: TStringField
      FieldName = 'EXP_PATH'
      Size = 100
    end
    object q_site_curIMP_PATH: TStringField
      FieldName = 'IMP_PATH'
      Size = 100
    end
    object q_site_curREPL_PASSWORD: TStringField
      FieldName = 'REPL_PASSWORD'
      Size = 10
    end
    object q_site_curTMP_PATH: TStringField
      FieldName = 'TMP_PATH'
      Size = 100
    end
    object q_site_curZIP_CMD: TStringField
      FieldName = 'ZIP_CMD'
      Size = 50
    end
    object q_site_curARH_IN: TStringField
      FieldName = 'ARH_IN'
      Size = 100
    end
    object q_site_curARH_OUT: TStringField
      FieldName = 'ARH_OUT'
      Size = 100
    end
    object q_site_curDBLINK_ERR_EXP: TIntegerField
      FieldName = 'DBLINK_ERR_EXP'
    end
  end
  object q_Repl: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS */'
      '  A.ROWID,'
      '  A.REPL_RN,'
      '  A.REPL_USERNAME,'
      '  A.REPL_TABLENAME,'
      '  A.REPL_TABLERN,'
      '  A.REPL_MODIFDATE,'
      '  A.REPL_OPERATION, A.REPL_AUTHID,'
      '  '#39'SNP_REPL.V_REPL'#39' as REPL_TABLE'
      'FROM SNP_REPL.V_REPL A'
      
        'WHERE A.REPL_MODIFDATE>=SYSDATE AND A.REPL_MODIFDATE<=SYSDATE AN' +
        'D A.REPL_USERNAME='#39'PARUS'#39' AND A.REPL_TABLENAME='#39'?'#39
      'ORDER BY A.REPL_RN DESC')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      0300000008000000070000005245504C5F524E01000000000D0000005245504C
      5F555345524E414D4501000000000E0000005245504C5F5441424C454E414D45
      01000000000C0000005245504C5F5441424C45524E01000000000E0000005245
      504C5F4D4F4449464441544501000000000E0000005245504C5F4F5045524154
      494F4E01000000000B0000005245504C5F41555448494401000000000A000000
      5245504C5F5441424C450100000000}
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_ReplBeforeOpen
    AfterOpen = q_ReplAfterOpen
    AfterInsert = q_ReplAfterInsert
    BeforeDelete = q_ReplBeforeDelete
    OnFilterRecord = q_ReplFilterRecord
    Left = 228
    Top = 384
    object q_ReplREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
    end
    object q_ReplREPL_USERNAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'REPL_USERNAME'
      Size = 5
    end
    object q_ReplREPL_TABLENAME: TStringField
      DisplayLabel = #1056#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 32
    end
    object q_ReplREPL_TABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'REPL_TABLERN'
      Required = True
    end
    object q_ReplREPL_MODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'REPL_MODIFDATE'
      Required = True
    end
    object q_ReplREPL_OPERATION: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldName = 'REPL_OPERATION'
      Required = True
      Size = 1
    end
    object q_ReplREPL_AUTHID: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'REPL_AUTHID'
      Required = True
      Size = 30
    end
    object q_ReplREPL_TABLE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'REPL_TABLE'
      Size = 15
    end
  end
  object ds_Repl: TDataSource
    DataSet = q_Repl
    Left = 228
    Top = 424
  end
  object pmLog: TTBPopupMenu
    Left = 448
    Top = 176
    object TBItem20: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object tbLogFilter: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = tbLogFilterAcceptText
    end
    object tbLogFilterCur: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = tbLogFilterCurClick
    end
    object tbLogFilterClear: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = tbLogFilterClearClick
    end
    object TBSeparatorItem12: TTBSeparatorItem
    end
    object TBItem52: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem52Click
    end
    object TBSeparatorItem16: TTBSeparatorItem
    end
    object tbLogShowCallOut: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' CALL_RN'
      OnClick = tbLogShowCallOutClick
    end
    object TBItem53: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem53Click
    end
    object TBItem67: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1086#1090#1074#1077#1090#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem67Click
    end
  end
  object pmCallOut: TTBPopupMenu
    Left = 568
    Top = 176
    object TBItem48: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem2: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem2AcceptText
    end
    object TBItem49: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem49Click
    end
    object TBItem50: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem50Click
    end
    object TBSeparatorItem14: TTBSeparatorItem
    end
    object tbCallOutWinEdit: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = tbCallOutWinEditClick
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem55: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1046#1091#1088#1085#1072#1083#1077' '#1089#1086#1073#1099#1090#1080#1081' '#1087#1086' CALL_RN'
      OnClick = TBItem55Click
    end
    object tbCallOutShowStatus: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = tbCallOutShowStatusClick
    end
    object TBItem56: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem56Click
    end
    object tbCallOutShowRepl: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' REPL_RN'
      OnClick = tbCallOutShowReplClick
    end
    object TBItem57: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' TABLERN'
      OnClick = TBItem57Click
    end
    object TBItem109: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' CALL_RN'
      OnClick = TBItem109Click
    end
    object TBItem59: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' REPL_RN'
      OnClick = TBItem59Click
    end
    object TBItem58: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' TABLERN'
      OnClick = TBItem58Click
    end
    object TBItem66: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem66Click
    end
    object TBItem111: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem111Click
    end
    object TBItem110: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem110Click
    end
    object TBItem65: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1086#1090#1074#1077#1090#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem65Click
    end
  end
  object q_inout_sites: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */ DISTINCT'
      '  A.SORTBY,'
      '  A.NAME,'
      '  B.SITE_RN, '
      '  B.BOX_IN,'
      '  B.BOX_OUT,'
      '  B.EMAIL_ADMIN, '
      '  B.IMP_PATH, '
      '  B.TMP_PATH, '
      '  B.ZIP_CMD,'
      '  B.ARH_OUT,'
      '  B.ARH_IN,'
      '  B.USE_DBLINK,'
      '  B.DBLINK,'
      '  B.DBLINK_ERR_EXP'
      'FROM REPL_SITE A,REPL_INIT B,'
      '('
      
        'SELECT DISTINCT C.SITE_SOURCE_RN FROM REPL_SCHEMA C, REPL_INIT D' +
        ' '
      
        '  WHERE C.SITE_DEST_RN=D.SITE_RN AND D.IS_CURRENT=1 AND C.IS_ACT' +
        'IVE=1'
      'UNION'
      'SELECT DISTINCT C.SITE_DEST_RN FROM REPL_SCHEMA C, REPL_INIT D '
      
        '  WHERE C.SITE_SOURCE_RN=D.SITE_RN AND D.IS_CURRENT=1 AND C.IS_A' +
        'CTIVE=1'
      ') E'
      'WHERE E.SITE_SOURCE_RN=A.RN'
      'AND A.RN=B.SITE_RN'
      'AND A.IS_ACTIVE=1'
      'ORDER BY A.SORTBY'
      '')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000000E000000040000004E414D45010000000006000000534F5254425901
      0000000007000000534954455F524E010000000006000000424F585F494E0100
      0000000B000000454D41494C5F41444D494E010000000008000000494D505F50
      415448010000000008000000544D505F504154480100000000070000005A4950
      5F434D440100000000060000004152485F494E01000000000600000044424C49
      4E4B010000000007000000424F585F4F55540100000000070000004152485F4F
      555401000000000A0000005553455F44424C494E4B01000000000E0000004442
      4C494E4B5F4552525F4558500100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = oraSess
    Left = 116
    Top = 472
    object q_inout_sitesSORTBY: TFloatField
      FieldName = 'SORTBY'
      Required = True
    end
    object q_inout_sitesNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object q_inout_sitesSITE_RN: TFloatField
      FieldName = 'SITE_RN'
      Required = True
    end
    object q_inout_sitesBOX_IN: TStringField
      FieldName = 'BOX_IN'
      Size = 100
    end
    object q_inout_sitesEMAIL_ADMIN: TStringField
      FieldName = 'EMAIL_ADMIN'
      Size = 50
    end
    object q_inout_sitesIMP_PATH: TStringField
      FieldName = 'IMP_PATH'
      Size = 100
    end
    object q_inout_sitesTMP_PATH: TStringField
      FieldName = 'TMP_PATH'
      Size = 100
    end
    object q_inout_sitesZIP_CMD: TStringField
      FieldName = 'ZIP_CMD'
      Size = 50
    end
    object q_inout_sitesARH_IN: TStringField
      FieldName = 'ARH_IN'
      Size = 100
    end
    object q_inout_sitesDBLINK: TStringField
      FieldName = 'DBLINK'
      Size = 100
    end
    object q_inout_sitesBOX_OUT: TStringField
      FieldName = 'BOX_OUT'
      Size = 100
    end
    object q_inout_sitesARH_OUT: TStringField
      FieldName = 'ARH_OUT'
      Size = 100
    end
    object q_inout_sitesUSE_DBLINK: TIntegerField
      FieldName = 'USE_DBLINK'
    end
    object q_inout_sitesDBLINK_ERR_EXP: TIntegerField
      FieldName = 'DBLINK_ERR_EXP'
    end
  end
  object pmRepl: TTBPopupMenu
    Left = 480
    Top = 176
    object TBItem43: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem44: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem44Click
    end
    object TBItem45: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem45Click
    end
    object TBSeparatorItem15: TTBSeparatorItem
    end
    object TBItem51: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem51Click
    end
    object TBSeparatorItem13: TTBSeparatorItem
    end
    object TBItem63: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem63Click
    end
    object TBItem64: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem64Click
    end
    object TBItem46: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' REPL_RN'
      OnClick = TBItem46Click
    end
    object TBItem62: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' TABLERN'
      OnClick = TBItem62Click
    end
    object TBItem68: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem68Click
    end
    object TBItem69: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem69Click
    end
  end
  object q_CallOutHist: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED USE_NL(A,B,C,D) */'
      '  A.ROWID, A.RN as HISTORY_RN,'
      
        '  A.*, B.NAME as SCHEMA_NAME, D.NOTE as TABLE_NAME, A.SQL1_TEXT|' +
        '|A.SQL2_TEXT as SQL_TEXT, D.REPL_USERNAME, D.REPL_TABLENAME, C.R' +
        'EPL_TABLE'
      
        'FROM SNP_REPL.REPL_CALL_OUT_HIST A, SNP_REPL.REPL_SCHEMA B, SNP_' +
        'REPL.REPL_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D'
      'WHERE a.site_source_rn = b.site_source_rn'
      'AND a.site_dest_rn = b.site_dest_rn'
      'AND A.SCHEMA_RN=B.RN'
      'AND A.SCHEMAROW_RN=C.RN'
      'AND C.TABLE_SOURCE_RN=D.RN'
      
        'AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0 AND A.DATE_HIST>=SYS' +
        'DATE AND A.DATE_HIST<=SYSDATE'
      'ORDER BY A.DATE_HIST DESC,A.RN DESC'
      '')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001900000002000000524E0100000000070000005245504C5F524E0100
      0000000600000053544154555301000000000E000000534954455F534F555243
      455F524E01000000000C000000534954455F444553545F524E01000000000900
      0000534348454D415F524E01000000000C000000534348454D41524F575F524E
      0100000000090000005550444154455F524E0100000000070000005441424C45
      524E0100000000090000004F5045524154494F4E0100000000090000004D4F44
      494644415445010000000007000000434F554E54455201000000000800000053
      454E444441544501000000000800000046494C454E414D4501000000000B0000
      00534348454D415F4E414D4501000000000A0000005441424C455F4E414D4501
      000000000800000053514C5F5445585401000000000900000053514C315F5445
      585401000000000900000053514C325F5445585401000000000D000000524550
      4C5F555345524E414D4501000000000E0000005245504C5F5441424C454E414D
      4501000000000A0000005245504C5F5441424C45010000000009000000444154
      455F45584543010000000009000000444154455F4849535401000000000A0000
      00484953544F52595F524E0100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_CallOutHistBeforeOpen
    AfterOpen = q_CallOutHistAfterOpen
    OnFilterRecord = q_CallOutHistFilterRecord
    Left = 388
    Top = 384
    object q_CallOutHistRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_CallOutHistUPDATE_RN: TFloatField
      DisplayLabel = 'RN '#1086#1087#1077#1088#1072#1090#1086#1088#1072' UPDATE'
      FieldName = 'UPDATE_RN'
    end
    object q_CallOutHistSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_CallOutHistSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_CallOutHistSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_CallOutHistSCHEMAROW_RN: TFloatField
      FieldName = 'SCHEMAROW_RN'
      Required = True
    end
    object q_CallOutHistTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080'- '#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
      Required = True
    end
    object q_CallOutHistREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080'- '#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_CallOutHistOPERATION: TStringField
      DisplayLabel = #1054#1087#1077'- '#1088#1072'- '#1094#1080#1103
      FieldName = 'OPERATION'
      Required = True
      Size = 1
    end
    object q_CallOutHistMODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'MODIFDATE'
      Required = True
    end
    object q_CallOutHistCOUNTER: TIntegerField
      DisplayLabel = #1057#1095#1077#1090#1095#1080#1082
      FieldName = 'COUNTER'
      Required = True
    end
    object q_CallOutHistSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Required = True
    end
    object q_CallOutHistSENDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1089#1099#1083#1082#1080
      FieldName = 'SENDDATE'
    end
    object q_CallOutHistFILENAME: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 30
    end
    object q_CallOutHistSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_CallOutHistTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_CallOutHistSQL_TEXT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'SQL_TEXT'
      Size = 8000
    end
    object q_CallOutHistSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldKind = fkLookup
      FieldName = 'STATUS_NAME'
      LookupDataSet = q_status_list
      LookupKeyFields = 'RN'
      LookupResultField = 'NAME'
      KeyFields = 'STATUS'
      Size = 50
      Lookup = True
    end
    object q_CallOutHistREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Required = True
      Size = 30
    end
    object q_CallOutHistREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Required = True
      Size = 50
    end
    object q_CallOutHistREPL_TABLE: TStringField
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_CallOutHistDATE_EXEC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'DATE_EXEC'
    end
    object q_CallOutHistDATE_HIST: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1074' '#1072#1088#1093#1080#1074
      FieldName = 'DATE_HIST'
    end
    object q_CallOutHistHISTORY_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'HISTORY_RN'
      Required = True
    end
  end
  object ds_CallOutHist: TDataSource
    DataSet = q_CallOutHist
    Left = 356
    Top = 464
  end
  object q_CallErr: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ ORDERED USE_NL(A,B,C,D,E) */'
      '  A.ROWID, A.RN as REPL_CALL_ERR_RN,'
      
        '  A.*, B.NAME as SCHEMA_NAME, D.NOTE as TABLE_NAME, A.SQL1_TEXT|' +
        '|A.SQL2_TEXT as SQL_TEXT, E.NAME as STATUS_NAME, D.REPL_USERNAME' +
        ', D.REPL_TABLENAME, C.REPL_TABLE'
      
        'FROM SNP_REPL.REPL_CALL_ERR A, SNP_REPL.REPL_SCHEMA B, SNP_REPL.' +
        'REPL_SCHEMA_ROW C, SNP_REPL.REPL_TABLE D, SNP_REPL.KLS_STATUS E'
      
        'WHERE a.site_source_rn = b.site_source_rn(+) AND a.site_dest_rn ' +
        '= b.site_dest_rn(+)'
      'AND A.SCHEMA_RN=B.RN(+)'
      'AND A.SCHEMAROW_RN=C.RN(+)'
      'AND C.TABLE_SOURCE_RN=D.RN(+)'
      'AND A.STATUS=E.RN'
      
        'AND A.SITE_SOURCE_RN=0 AND A.SITE_DEST_RN=0 AND A.DATE_HIST>=SYS' +
        'DATE AND A.DATE_HIST<=SYSDATE'
      'ORDER BY A.DATE_HIST DESC, A.RN DESC'
      '')
    SequenceField.Field = 'RN'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      030000001A00000002000000524E0100000000070000005245504C5F524E0100
      0000000600000053544154555301000000000E000000534954455F534F555243
      455F524E01000000000C000000534954455F444553545F524E01000000000900
      0000534348454D415F524E01000000000C000000534348454D41524F575F524E
      0100000000090000005550444154455F524E0100000000070000005441424C45
      524E0100000000090000004F5045524154494F4E0100000000090000004D4F44
      494644415445010000000007000000434F554E54455201000000000800000053
      454E444441544501000000000800000046494C454E414D4501000000000B0000
      00534348454D415F4E414D4501000000000A0000005441424C455F4E414D4501
      000000000800000053514C5F5445585401000000000B0000005354415455535F
      4E414D4501000000000900000053514C315F5445585401000000000900000053
      514C325F54455854010000000009000000444154455F45584543010000000009
      000000444154455F4849535401000000000D0000005245504C5F555345524E41
      4D4501000000000E0000005245504C5F5441424C454E414D4501000000000A00
      00005245504C5F5441424C450100000000100000005245504C5F43414C4C5F45
      52525F524E0100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = oraSess
    BeforeOpen = q_CallErrBeforeOpen
    AfterOpen = q_CallErrAfterOpen
    OnFilterRecord = q_CallErrFilterRecord
    Left = 444
    Top = 384
    object q_CallErrRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_CallErrUPDATE_RN: TFloatField
      DisplayLabel = 'RN '#1086#1087#1077#1088#1072#1090#1086#1088#1072' UPDATE'
      FieldName = 'UPDATE_RN'
    end
    object q_CallErrSITE_SOURCE_RN: TFloatField
      FieldName = 'SITE_SOURCE_RN'
      Required = True
    end
    object q_CallErrSITE_DEST_RN: TFloatField
      FieldName = 'SITE_DEST_RN'
      Required = True
    end
    object q_CallErrSCHEMA_RN: TFloatField
      FieldName = 'SCHEMA_RN'
      Required = True
    end
    object q_CallErrSCHEMAROW_RN: TFloatField
      FieldName = 'SCHEMAROW_RN'
      Required = True
    end
    object q_CallErrTABLERN: TFloatField
      DisplayLabel = 'RN '#1088#1077#1087#1083#1080#1094#1080'- '#1088#1091#1077#1084#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' (TABLERN)'
      FieldName = 'TABLERN'
      Required = True
    end
    object q_CallErrREPL_RN: TFloatField
      DisplayLabel = 'RN '#1090#1072#1073#1083#1080#1094#1099' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' (REPL_RN)'
      FieldName = 'REPL_RN'
      Required = True
    end
    object q_CallErrOPERATION: TStringField
      DisplayLabel = #1054#1087#1077'- '#1088#1072'- '#1094#1080#1103
      FieldName = 'OPERATION'
      Required = True
      Size = 1
    end
    object q_CallErrMODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'MODIFDATE'
      Required = True
    end
    object q_CallErrCOUNTER: TIntegerField
      DisplayLabel = #1057#1095#1077#1090#1095#1080#1082
      FieldName = 'COUNTER'
      Required = True
    end
    object q_CallErrSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object q_CallErrSENDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'SENDDATE'
    end
    object q_CallErrFILENAME: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1099#1081' '#1092#1072#1081#1083
      FieldName = 'FILENAME'
      Size = 30
    end
    object q_CallErrSCHEMA_NAME: TStringField
      DisplayLabel = #1057#1093#1077#1084#1072
      FieldName = 'SCHEMA_NAME'
      Required = True
      Size = 100
    end
    object q_CallErrTABLE_NAME: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object q_CallErrSQL_TEXT: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = 'SQL_TEXT'
      Size = 8000
    end
    object q_CallErrSTATUS_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS_NAME'
      Size = 100
    end
    object q_CallErrDATE_EXEC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'DATE_EXEC'
    end
    object q_CallErrDATE_HIST: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1077#1088#1077#1085#1086#1089#1072' '#1074' '#1072#1088#1093#1080#1074
      FieldName = 'DATE_HIST'
    end
    object q_CallErrREPL_USERNAME: TStringField
      FieldName = 'REPL_USERNAME'
      Size = 30
    end
    object q_CallErrREPL_TABLENAME: TStringField
      FieldName = 'REPL_TABLENAME'
      Size = 50
    end
    object q_CallErrREPL_TABLE: TStringField
      FieldName = 'REPL_TABLE'
      Size = 100
    end
    object q_CallErrREPL_CALL_ERR_RN: TFloatField
      DisplayLabel = 'RN'
      FieldName = 'REPL_CALL_ERR_RN'
      Required = True
    end
  end
  object ds_CallErr: TDataSource
    DataSet = q_CallErr
    Left = 444
    Top = 424
  end
  object pmStatus: TTBPopupMenu
    Left = 520
    Top = 176
    object TBItem70: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem3: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem3AcceptText
    end
    object TBItem71: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem71Click
    end
    object TBItem72: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem72Click
    end
    object TBSeparatorItem19: TTBSeparatorItem
    end
    object TBItem73: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem73Click
    end
    object TBSeparatorItem20: TTBSeparatorItem
    end
    object TBItem77: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' REPL_RN'
      OnClick = TBItem77Click
    end
    object TBItem78: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' TABLERN'
      OnClick = TBItem78Click
    end
    object TBItem75: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' REPL_RN'
      OnClick = TBItem75Click
    end
    object TBItem74: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' TABLERN'
      OnClick = TBItem74Click
    end
    object TBItem81: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem81Click
    end
    object TBItem82: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem82Click
    end
  end
  object pmCallOutHist: TTBPopupMenu
    Left = 568
    Top = 232
    object TBItem76: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem4: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem4AcceptText
    end
    object TBItem79: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem79Click
    end
    object TBItem80: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem80Click
    end
    object TBSeparatorItem21: TTBSeparatorItem
    end
    object TBItem83: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem83Click
    end
    object TBSeparatorItem22: TTBSeparatorItem
    end
    object TBItem84: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1046#1091#1088#1085#1072#1083#1077' '#1089#1086#1073#1099#1090#1080#1081' '#1087#1086' CALL_RN'
      OnClick = TBItem84Click
    end
    object TBItem85: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem85Click
    end
    object TBItem86: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem86Click
    end
    object TBItem87: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' REPL_RN'
      OnClick = TBItem87Click
    end
    object TBItem88: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' TABLERN'
      OnClick = TBItem88Click
    end
    object TBItem112: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' CALL_RN'
      OnClick = TBItem112Click
    end
    object TBItem89: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' REPL_RN'
      OnClick = TBItem89Click
    end
    object TBItem90: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' TABLERN'
      OnClick = TBItem90Click
    end
    object TBItem91: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem91Click
    end
    object TBItem114: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem114Click
    end
    object TBItem113: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem113Click
    end
    object TBItem92: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1086#1090#1074#1077#1090#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem92Click
    end
  end
  object pmCall: TTBPopupMenu
    Left = 624
    Top = 176
    object TBItem93: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem5: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem5AcceptText
    end
    object TBItem94: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem94Click
    end
    object TBItem95: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem95Click
    end
    object TBSeparatorItem23: TTBSeparatorItem
    end
    object TBItem96: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem96Click
    end
    object TBSeparatorItem24: TTBSeparatorItem
    end
    object TBItem97: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1046#1091#1088#1085#1072#1083#1077' '#1089#1086#1073#1099#1090#1080#1081' '#1087#1086' CALL_RN'
      OnClick = TBItem97Click
    end
    object TBItem98: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem98Click
    end
    object TBItem99: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem99Click
    end
    object TBItem100: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' REPL_RN'
      OnClick = TBItem100Click
    end
    object TBItem101: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' TABLERN'
      OnClick = TBItem101Click
    end
    object TBItem106: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1100' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' CALL_RN'
      OnClick = TBItem106Click
    end
    object TBItem102: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' REPL_RN'
      OnClick = TBItem102Click
    end
    object TBItem103: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' TABLERN'
      OnClick = TBItem103Click
    end
    object TBItem104: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' CALL_RN'
      OnClick = TBItem104Click
    end
    object TBItem108: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' REPL_RN'
      OnClick = TBItem108Click
    end
    object TBItem107: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1040#1088#1093#1080#1074#1077' '#1087#1086' TABLERN'
      OnClick = TBItem107Click
    end
    object TBItem105: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1086#1090#1074#1077#1090#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem105Click
    end
  end
  object pmCallErr: TTBPopupMenu
    Left = 624
    Top = 232
    object TBItem115: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem6: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem6AcceptText
    end
    object TBItem116: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem116Click
    end
    object TBItem117: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem117Click
    end
    object TBSeparatorItem25: TTBSeparatorItem
    end
    object TBItem118: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem118Click
    end
    object TBSeparatorItem26: TTBSeparatorItem
    end
    object TBItem119: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1046#1091#1088#1085#1072#1083#1077' '#1089#1086#1073#1099#1090#1080#1081' '#1087#1086' CALL_RN'
      OnClick = TBItem119Click
    end
    object TBItem120: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem120Click
    end
    object TBItem121: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1089#1090#1072#1090#1091#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem121Click
    end
    object TBItem122: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' REPL_RN'
      OnClick = TBItem122Click
    end
    object TBItem123: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1058#1072#1073#1083#1080#1094#1077' '#1088#1077#1087#1083#1080#1082#1072#1094#1080#1080' '#1087#1086' TABLERN'
      OnClick = TBItem123Click
    end
    object TBItem124: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' CALL_RN'
      OnClick = TBItem124Click
    end
    object TBItem125: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' REPL_RN'
      OnClick = TBItem125Click
    end
    object TBItem126: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' TABLERN'
      OnClick = TBItem126Click
    end
    object TBItem127: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem127Click
    end
    object TBItem128: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' REPL_RN'
      OnClick = TBItem128Click
    end
    object TBItem129: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' TABLERN'
      OnClick = TBItem129Click
    end
    object TBItem130: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1086#1090#1074#1077#1090#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem130Click
    end
  end
  object pmAnsw: TTBPopupMenu
    Left = 672
    Top = 176
    object TBItem131: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem7: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem7AcceptText
    end
    object TBItem132: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem132Click
    end
    object TBItem133: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem133Click
    end
    object TBSeparatorItem27: TTBSeparatorItem
    end
    object TBItem134: TTBItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1086#1082#1085#1077
      OnClick = TBItem134Click
    end
    object TBSeparatorItem28: TTBSeparatorItem
    end
    object TBItem135: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1046#1091#1088#1085#1072#1083#1077' '#1089#1086#1073#1099#1090#1080#1081' '#1087#1086' CALL_RN'
      OnClick = TBItem135Click
    end
    object TBItem140: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1048#1089#1093#1086#1076#1103#1097#1080#1093' '#1079#1072#1087#1088#1086#1089#1072#1093' '#1087#1086' CALL_RN'
      OnClick = TBItem140Click
    end
    object TBItem143: TTBItem
      Caption = #1053#1072#1081#1090#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1041#1091#1092#1077#1088#1077' '#1079#1072#1087#1088#1086#1089#1086#1074' '#1087#1086' CALL_RN'
      OnClick = TBItem143Click
    end
  end
  object pkg_init: TOraclePackage
    Session = oraSess
    PackageName = 'SNP_REPL_FOR_INIT'
    Left = 326
    Top = 225
  end
end
