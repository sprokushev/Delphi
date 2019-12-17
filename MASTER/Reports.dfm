object f_Reports: Tf_Reports
  Left = 273
  Top = 103
  Width = 696
  Height = 480
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' / '#1084#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1093' '#1086#1090#1095#1077#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    ActivePage = tabGroups
    Align = alClient
    TabOrder = 0
    object tabGroups: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1086#1090#1095#1077#1090#1086#1074
      ImageIndex = 1
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 680
        Height = 26
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem1: TTBItem
            Action = acRepGrpPost
            DisplayMode = nbdmImageAndText
          end
          object TBItem2: TTBItem
            Action = acRepGrpRefresh
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 385
        Width = 680
        Height = 33
        Align = alBottom
        TabOrder = 1
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 26
        Width = 680
        Height = 359
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds_RepGrp
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'REPORT_GROUP'
            Footers = <>
            Title.TitleButton = True
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_GROUP_NAME'
            Footers = <>
            Title.TitleButton = True
            Width = 244
          end
          item
            EditButtons = <>
            FieldName = 'REP_KIND'
            Footers = <>
            Title.TitleButton = True
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'SORTBY'
            Footers = <>
            Title.TitleButton = True
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'VIEW_TAB'
            Footers = <>
            Title.TitleButton = True
            Width = 93
          end>
      end
    end
    object tabReports: TTabSheet
      Caption = #1054#1090#1095#1077#1090#1099
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 680
        Height = 26
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem5: TTBItem
            Action = acReportAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem6: TTBItem
            Action = acReportEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem7: TTBItem
            Action = acReportDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem3: TTBItem
            Action = acReportPost
            DisplayMode = nbdmImageAndText
          end
          object TBItem8: TTBItem
            Action = acReportRefresh
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 385
        Width = 680
        Height = 33
        Align = alBottom
        TabOrder = 1
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 50
        Width = 680
        Height = 335
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = ds_Reports
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'SORTBY'
            Footers = <>
            Width = 58
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_NAME'
            Footers = <>
            Width = 408
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_TYPE'
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_FILE'
            Footers = <>
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'REPORT_TITLE'
            Footers = <>
            Width = 249
          end
          item
            Checkboxes = True
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'IS_MSSQL'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 44
          end
          item
            Checkboxes = True
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'IS_VIP'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 43
          end
          item
            EditButtons = <>
            FieldName = 'COPY_FILE'
            Footers = <>
            Width = 298
          end
          item
            EditButtons = <>
            FieldName = 'DIAGRAM_TYPE'
            Footers = <>
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'DIAGRAM_KIND'
            Footers = <>
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'AXES_X_NAME'
            Footers = <>
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'COUNT_COLS_X'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'AXES_Y_NAME'
            Footers = <>
            Width = 146
          end
          item
            EditButtons = <>
            FieldName = 'COUNT_COLS_Y'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'PROC_PACKET'
            Footers = <>
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'PROC_NAME'
            Footers = <>
            Width = 123
          end
          item
            EditButtons = <>
            FieldName = 'PARUS_PROC'
            Footers = <>
            Width = 154
          end
          item
            EditButtons = <>
            FieldName = 'TIP_DATE'
            Footers = <>
            Width = 113
          end
          item
            Checkboxes = True
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'VIEW_TIME'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Width = 72
          end
          item
            EditButtons = <>
            FieldName = 'DEF_BEG_VAL'
            Footers = <>
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'DEF_BEG_TIME'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'DEF_END_VAL'
            Footers = <>
            Width = 87
          end
          item
            EditButtons = <>
            FieldName = 'DEF_END_TIME'
            Footers = <>
            Width = 44
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 26
        Width = 680
        Height = 24
        Align = alTop
        TabOrder = 3
        object Label1: TLabel
          Left = 8
          Top = 4
          Width = 50
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072': '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 64
          Top = 4
          Width = 361
          Height = 17
          DataField = 'REPORT_GROUP_NAME'
          DataSource = ds_RepGrp
        end
      end
    end
    object tabReportParams: TTabSheet
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 2
      object TBDock3: TTBDock
        Left = 0
        Top = 0
        Width = 680
        Height = 26
        object TBToolbar3: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem9: TTBItem
            Action = acRepParamAdd
            DisplayMode = nbdmImageAndText
          end
          object TBItem10: TTBItem
            Action = acRepParamEdit
            DisplayMode = nbdmImageAndText
          end
          object TBItem11: TTBItem
            Action = acRepParamDel
            DisplayMode = nbdmImageAndText
          end
          object TBItem12: TTBItem
            Action = acRepParamRefresh
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 385
        Width = 680
        Height = 33
        Align = alBottom
        TabOrder = 1
      end
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 26
        Width = 680
        Height = 359
        Align = alClient
        AllowedOperations = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PREDPR'
            Footers = <>
            Title.TitleButton = True
            Width = 222
          end
          item
            EditButtons = <>
            FieldName = 'NPR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ORG_STRU'
            Footers = <>
            Title.TitleButton = True
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'VID_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'TIP_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'ORG_KIND'
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end>
      end
    end
    object tabTags: TTabSheet
      Caption = #1058#1045#1043#1080' '#1087#1086#1083#1077#1081' '#1074#1074#1086#1076#1072
      ImageIndex = 3
      object TBDock4: TTBDock
        Left = 0
        Top = 0
        Width = 680
        Height = 26
        object TBToolbar4: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem16: TTBItem
            Action = acRepTagsRefresh
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 392
        Width = 680
        Height = 33
        Align = alBottom
        TabOrder = 1
      end
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 26
        Width = 680
        Height = 366
        Align = alClient
        AllowedOperations = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PREDPR'
            Footers = <>
            Title.TitleButton = True
            Width = 222
          end
          item
            EditButtons = <>
            FieldName = 'NPR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ORG_STRU'
            Footers = <>
            Title.TitleButton = True
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'VID_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'TIP_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'ORG_KIND'
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end>
      end
    end
    object tabTipDates: TTabSheet
      Caption = #1058#1080#1087#1099' '#1076#1072#1090
      ImageIndex = 4
      object TBDock5: TTBDock
        Left = 0
        Top = 0
        Width = 680
        Height = 26
        object TBToolbar5: TTBToolbar
          Left = 0
          Top = 0
          Caption = #1054#1090#1087#1091#1089#1082#1085#1099#1077' '#1094#1077#1085#1099
          Images = f_main.img_Common
          TabOrder = 0
          object TBItem20: TTBItem
            Action = acRepTipDatesRefresh
            DisplayMode = nbdmImageAndText
          end
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 392
        Width = 680
        Height = 33
        Align = alBottom
        TabOrder = 1
      end
      object DBGridEh5: TDBGridEh
        Left = 0
        Top = 26
        Width = 680
        Height = 366
        Align = alClient
        AllowedOperations = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        FooterRowCount = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
        SumList.Active = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PREDPR'
            Footers = <>
            Title.TitleButton = True
            Width = 222
          end
          item
            EditButtons = <>
            FieldName = 'NPR'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'D_PLAN'
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'VES'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'ORG_STRU'
            Footers = <>
            Title.TitleButton = True
            Width = 226
          end
          item
            EditButtons = <>
            FieldName = 'VID_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 122
          end
          item
            EditButtons = <>
            FieldName = 'TIP_REAL'
            Footers = <>
            Title.TitleButton = True
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'ORG_KIND'
            Footers = <>
            Title.TitleButton = True
            Width = 92
          end>
      end
    end
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 592
    Top = 121
    StyleName = 'XP Style'
    object acReportAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 20
    end
    object acRepParamAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 20
    end
    object acRepGrpRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087
      ImageIndex = 11
      OnExecute = acRepGrpRefreshExecute
    end
    object acReportRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1090#1095#1077#1090#1086#1074
      ImageIndex = 11
      OnExecute = acReportRefreshExecute
    end
    object acRepParamRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      ImageIndex = 11
    end
    object acRepTagsRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1077#1075#1086#1074' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      ImageIndex = 11
    end
    object acRepTipDatesRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1080#1087#1086#1074' '#1076#1072#1090
      ImageIndex = 11
    end
    object acReportEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 8
    end
    object acRepParamEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 8
    end
    object acReportDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1095#1077#1090
      ImageIndex = 5
    end
    object acRepParamDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088' '#1086#1090#1095#1077#1090
      ImageIndex = 5
    end
    object acReportPost: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1086#1090#1095#1077#1090#1077
      ImageIndex = 13
      OnExecute = acReportPostExecute
    end
    object acRepGrpPost: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1074' '#1075#1088#1091#1087#1087#1077
      ImageIndex = 13
      OnExecute = acRepGrpPostExecute
    end
  end
  object q_RepGrp: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*,a.rowid'
      'FROM REPORT_GROUPS a'
      'ORDER BY a.REP_KIND,a.SORTBY')
    QBEDefinition.QBEFieldDefs = {
      030000000600000002000000494401000000000C0000005245504F52545F4752
      4F55500100000000110000005245504F52545F47524F55505F4E414D45010000
      000006000000534F525442590100000000080000005245505F4B494E44010000
      000008000000564945575F5441420100000000}
    UniqueFields = 'ID'
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    UpdatingTable = 'REPORT_GROUPS'
    Session = f_main.ora_Session
    Active = True
    Left = 44
    Top = 128
    object q_RepGrpID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_RepGrpREPORT_GROUP: TStringField
      DisplayLabel = #1058#1045#1043' '#1075#1088#1091#1087#1087#1099
      FieldName = 'REPORT_GROUP'
      ReadOnly = True
      Required = True
      Size = 15
    end
    object q_RepGrpREPORT_GROUP_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'REPORT_GROUP_NAME'
      Required = True
      Size = 80
    end
    object q_RepGrpSORTBY: TIntegerField
      DisplayLabel = #1055#1086#1088#1103#1076#1086#1082' '#1074' '#1087#1088#1077#1076#1077#1083#1072#1093' '#1074#1080#1076#1072
      FieldName = 'SORTBY'
    end
    object q_RepGrpREP_KIND: TStringField
      DisplayLabel = #1042#1080#1076' '#1075#1088#1091#1087#1087#1099
      FieldName = 'REP_KIND'
      ReadOnly = True
      Size = 30
    end
    object q_RepGrpVIEW_TAB: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1080#1094#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
      FieldName = 'VIEW_TAB'
      Size = 15
    end
  end
  object ds_RepGrp: TDataSource
    DataSet = q_RepGrp
    Left = 100
    Top = 128
  end
  object q_Reports: TOracleDataSet
    SQL.Strings = (
      'SELECT a.*,a.rowid'
      'FROM REPORTS a'
      'WHERE a.REPORT_GROUP=:REPORT_GROUP'
      'ORDER BY a.SORTBY')
    Variables.Data = {
      03000000010000000D0000003A5245504F52545F47524F555005000000040000
      00415A430000000000}
    QBEDefinition.QBEFieldDefs = {
      030000002D00000002000000494401000000000C0000005245504F52545F4752
      4F5550010000000006000000534F5254425901000000000B0000005245504F52
      545F4E414D4501000000000B0000005245504F52545F46494C45010000000006
      000000504152414D3101000000000C0000005245504F52545F5449544C450100
      0000000800000049535F4D5353514C01000000000600000049535F5649500100
      00000009000000434F50595F46494C4501000000000B0000005245504F52545F
      5459504501000000000C0000004449414752414D5F5459504501000000000C00
      00004449414752414D5F4B494E4401000000000B000000415845535F585F4E41
      4D4501000000000C000000434F554E545F434F4C535F5801000000000B000000
      415845535F595F4E414D4501000000000C000000434F554E545F434F4C535F59
      01000000000B00000050524F435F5041434B455401000000000900000050524F
      435F4E414D4501000000000B0000004445465F4245475F56414C01000000000B
      0000004445465F454E445F56414C01000000000C0000004445465F4245475F54
      494D4501000000000C0000004445465F454E445F54494D450100000000090000
      00564945575F54494D450100000000080000005449505F444154450100000000
      0A00000050415255535F50524F430100000000080000005245505F464F524D01
      000000000C0000004C4153545F4E554D5F52455001000000000A00000053514C
      5F534F55524345010000000009000000454D41494C5F44424601000000000700
      00004152434849564501000000000B0000004442465F464F525F444246010000
      00000B0000004649454C44535F4E414D4501000000000A0000004649454C4453
      5F53554D01000000000800000053454E445F4442460100000000080000005345
      4E445F584C5301000000000D00000053454E445F4442465F4E414D4501000000
      000B0000004442465F464F525F584C5301000000000D00000053454E445F584C
      535F4E414D45010000000009000000454D41494C5F584C5301000000000F0000
      0053514C5F534F555243455F5459504501000000000C00000053514C5F444154
      414241534501000000000C00000053514C5F555345524E414D4501000000000C
      00000053514C5F50415353574F52440100000000070000005A49505F44424601
      00000000}
    UniqueFields = 'ID'
    Master = q_RepGrp
    MasterFields = 'REPORT_GROUP'
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    UpdatingTable = 'REPORTS'
    Session = f_main.ora_Session
    Active = True
    Left = 44
    Top = 176
    object q_ReportsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_ReportsREPORT_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'REPORT_NAME'
      Required = True
      Size = 80
    end
    object q_ReportsREPORT_FILE: TStringField
      DisplayLabel = #1060#1072#1081#1083
      FieldName = 'REPORT_FILE'
      Required = True
      Size = 30
    end
    object q_ReportsREPORT_GROUP: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'REPORT_GROUP'
      ReadOnly = True
      Size = 15
    end
    object q_ReportsSORTBY: TIntegerField
      DisplayLabel = #8470' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      FieldName = 'SORTBY'
    end
    object q_ReportsPARAM1: TStringField
      DisplayLabel = #1055#1072#1088#1072#1084#1077#1090#1088' (LEGACY)'
      FieldName = 'PARAM1'
      Size = 15
    end
    object q_ReportsREPORT_TITLE: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1086#1090#1095#1077#1090#1072
      FieldName = 'REPORT_TITLE'
      Size = 250
    end
    object q_ReportsIS_MSSQL: TIntegerField
      DisplayLabel = #1048#1079' MSSQL'
      FieldName = 'IS_MSSQL'
    end
    object q_ReportsIS_VIP: TIntegerField
      DisplayLabel = #1044#1083#1103' '#1088#1091#1082'-'#1074#1072
      FieldName = 'IS_VIP'
    end
    object q_ReportsCOPY_FILE: TStringField
      DisplayLabel = 
        #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1092#1072#1081#1083' ('#1085#1072#1087#1088#1080#1084#1077#1088' MDB) '#1074' '#1090#1086' '#1078#1077' '#1082#1072#1090#1072#1083#1086#1075' '#1086#1090#1082#1091#1076#1072' '#1079#1072#1087#1091#1089#1082#1072#1077#1090 +
        #1089#1103' '#1092#1072#1081#1083' '#1086#1090#1095#1077#1090#1072
      FieldName = 'COPY_FILE'
      Size = 100
    end
    object q_ReportsREPORT_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1090#1095#1077#1090#1072
      FieldName = 'REPORT_TYPE'
      ReadOnly = True
      Size = 7
    end
    object q_ReportsDIAGRAM_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
      FieldName = 'DIAGRAM_TYPE'
      ReadOnly = True
      Size = 10
    end
    object q_ReportsDIAGRAM_KIND: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1080#1072#1075#1088#1072#1084#1084#1099
      FieldName = 'DIAGRAM_KIND'
      ReadOnly = True
      Size = 30
    end
    object q_ReportsAXES_X_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1089#1080' X'
      FieldName = 'AXES_X_NAME'
      Size = 30
    end
    object q_ReportsCOUNT_COLS_X: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1086' '#1086#1089#1080' X'
      FieldName = 'COUNT_COLS_X'
    end
    object q_ReportsAXES_Y_NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1089#1080' Y'
      FieldName = 'AXES_Y_NAME'
      Size = 30
    end
    object q_ReportsCOUNT_COLS_Y: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1086' '#1086#1089#1080' Y'
      FieldName = 'COUNT_COLS_Y'
    end
    object q_ReportsPROC_PACKET: TStringField
      DisplayLabel = #1055#1072#1082#1077#1090' MASTER'
      FieldName = 'PROC_PACKET'
      Size = 30
    end
    object q_ReportsPROC_NAME: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072' MASTER'
      FieldName = 'PROC_NAME'
      Size = 30
    end
    object q_ReportsDEF_BEG_VAL: TStringField
      DisplayLabel = #1057' '#1076#1072#1090#1099
      FieldName = 'DEF_BEG_VAL'
      Size = 30
    end
    object q_ReportsDEF_END_VAL: TStringField
      DisplayLabel = #1055#1086' '#1076#1072#1090#1091
      FieldName = 'DEF_END_VAL'
      Size = 30
    end
    object q_ReportsDEF_BEG_TIME: TStringField
      DisplayLabel = #1089' '#1076#1072#1090#1099' ('#1074#1088#1077#1084#1103')'
      FieldName = 'DEF_BEG_TIME'
      Size = 8
    end
    object q_ReportsDEF_END_TIME: TStringField
      DisplayLabel = #1087#1086' '#1076#1072#1090#1091' ('#1074#1088#1077#1084#1103')'
      FieldName = 'DEF_END_TIME'
      Size = 8
    end
    object q_ReportsVIEW_TIME: TIntegerField
      DisplayLabel = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074#1088#1077#1084#1103
      FieldName = 'VIEW_TIME'
    end
    object q_ReportsTIP_DATE: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1072#1090#1099' ('#1090#1077#1082#1089#1090')'
      FieldName = 'TIP_DATE'
      Size = 30
    end
    object q_ReportsPARUS_PROC: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072' '#1055#1072#1088#1091#1089#1072
      FieldName = 'PARUS_PROC'
      Size = 30
    end
  end
  object ds_Reports: TDataSource
    DataSet = q_Reports
    Left = 100
    Top = 176
  end
end
