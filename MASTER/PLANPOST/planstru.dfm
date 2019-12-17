object f_PlanStru: Tf_PlanStru
  Left = 62
  Top = 132
  Width = 936
  Height = 571
  Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1083#1072#1085#1072' '#1087#1086#1089#1090#1072#1074#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 26
    Width = 928
    Height = 518
    Align = alClient
    Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1083#1072#1085#1072
    TabOrder = 0
    object grid_Stru: TDBGridEh
      Left = 2
      Top = 15
      Width = 924
      Height = 501
      Align = alClient
      DataSource = ds_lanstru
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FrozenCols = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Aligned_Name'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'LEVEL_POS'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PARENT_ID'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'BEGIN_DATE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'END_DATE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_DATE'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_SGR'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_SPG'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_RZD'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_PRZ'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_GRP'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'KOD_PGR'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'FOR_ID'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'FOR_NAME'
          Footers = <>
        end>
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 928
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem2: TTBItem
        Action = acNewPlanPostPosition
        DisplayMode = nbdmImageAndText
      end
      object TBItem1: TTBItem
        Action = acEditPlanPostPosition
        DisplayMode = nbdmImageAndText
      end
      object TBItem3: TTBItem
        Action = acDelPlanPostPosition
        DisplayMode = nbdmImageAndText
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBItem4: TTBItem
        Action = acPlanStruToDBF
      end
    end
    object TBToolWindow1: TTBToolWindow
      Left = 587
      Top = 0
      Caption = 'TBToolWindow1'
      ClientAreaHeight = 22
      ClientAreaWidth = 95
      DockPos = 488
      TabOrder = 1
      object Label1: TLabel
        Left = 4
        Top = 5
        Width = 21
        Height = 13
        Caption = #1043#1086#1076':'
      end
      object e_year: TMaskEdit
        Left = 30
        Top = 1
        Width = 49
        Height = 21
        EditMask = '!0000;1; '
        MaxLength = 4
        TabOrder = 0
        Text = '2'#160'002'
        OnChange = e_yearChange
      end
      object ud_year: TUpDown
        Left = 79
        Top = 1
        Width = 15
        Height = 21
        Associate = e_year
        Min = 1990
        Max = 2100
        Position = 2002
        TabOrder = 1
      end
    end
  end
  object q_PlanStru: TOracleDataSet
    SQL.Strings = (
      'SELECT KLS_PLANSTRU.ROWID,KLS_PLANSTRU.*'
      'FROM KLS_PLANSTRU'
      'WHERE TO_CHAR(BEGIN_DATE,'#39'YYYY'#39')='#39'2002'#39
      '   OR TO_CHAR(END_DATE,'#39'YYYY'#39')='#39'2002'#39
      'ORDER BY'
      '  KLS_PLANSTRU.KOD_SGR,'
      '  KLS_PLANSTRU.KOD_SPG,'
      '  KLS_PLANSTRU.KOD_RZD,'
      '  KLS_PLANSTRU.KOD_PRZ,'
      '  KLS_PLANSTRU.KOD_GRP,'
      '  KLS_PLANSTRU.KOD_PGR'
      '')
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_PLANSTRU'
    SequenceField.ApplyMoment = amOnNewRecord
    QBEDefinition.QBEFieldDefs = {
      0300000014000000020000004944010000000009000000504152454E545F4944
      0100000000090000004C4556454C5F504F5301000000000A000000424547494E
      5F44415445010000000008000000454E445F444154450100000000040000004E
      414D4501000000000A000000494E5055545F444154450100000000070000004B
      4F445F5347520100000000070000004B4F445F5350470100000000070000004B
      4F445F525A440100000000070000004B4F445F50525A0100000000070000004B
      4F445F4752500100000000070000004B4F445F50475201000000000B0000004E
      415A4E5F4F54475F494401000000000A000000564945575F4C4556454C010000
      000009000000524547494F4E5F494401000000000B0000004F52475F4B494E44
      5F494401000000000B0000005449505F5245414C5F4944010000000006000000
      464F525F4944010000000008000000464F525F4E414D450100000000}
    UniqueFields = 'id'
    ReadOnly = True
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = f_main.ora_Session
    BeforePost = q_PlanStruBeforePost
    BeforeDelete = q_PlanStruBeforeDelete
    OnCalcFields = q_PlanStruCalcFields
    Left = 628
    Top = 64
    object q_PlanStruLEVEL_POS: TIntegerField
      DisplayLabel = #1059#1088#1086#1074#1077#1085#1100
      FieldName = 'LEVEL_POS'
      Required = True
    end
    object q_PlanStruBEGIN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'BEGIN_DATE'
      Required = True
    end
    object q_PlanStruEND_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'END_DATE'
      Required = True
    end
    object q_PlanStruNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 50
    end
    object q_PlanStruINPUT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
      FieldName = 'INPUT_DATE'
      ReadOnly = True
      Required = True
    end
    object q_PlanStruKOD_SGR: TIntegerField
      FieldName = 'KOD_SGR'
      Required = True
    end
    object q_PlanStruKOD_SPG: TIntegerField
      FieldName = 'KOD_SPG'
      Required = True
    end
    object q_PlanStruKOD_RZD: TIntegerField
      FieldName = 'KOD_RZD'
      Required = True
    end
    object q_PlanStruKOD_PRZ: TIntegerField
      FieldName = 'KOD_PRZ'
      Required = True
    end
    object q_PlanStruKOD_GRP: TIntegerField
      FieldName = 'KOD_GRP'
      Required = True
    end
    object q_PlanStruKOD_PGR: TIntegerField
      FieldName = 'KOD_PGR'
      Required = True
    end
    object q_PlanStruAligned_Name: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldKind = fkCalculated
      FieldName = 'Aligned_Name'
      Size = 50
      Calculated = True
    end
    object q_PlanStruID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object q_PlanStruPARENT_ID: TFloatField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'PARENT_ID'
      Required = True
    end
    object q_PlanStruNAZN_OTG_ID: TIntegerField
      FieldName = 'NAZN_OTG_ID'
    end
    object q_PlanStruVIEW_LEVEL: TIntegerField
      FieldName = 'VIEW_LEVEL'
    end
    object q_PlanStruREGION_ID: TFloatField
      FieldName = 'REGION_ID'
    end
    object q_PlanStruORG_KIND_ID: TFloatField
      FieldName = 'ORG_KIND_ID'
    end
    object q_PlanStruTIP_REAL_ID: TFloatField
      FieldName = 'TIP_REAL_ID'
    end
    object q_PlanStruFOR_ID: TIntegerField
      FieldName = 'FOR_ID'
    end
    object q_PlanStruFOR_NAME: TStringField
      FieldName = 'FOR_NAME'
      Size = 60
    end
  end
  object ds_lanstru: TDataSource
    DataSet = q_PlanStru
    Left = 656
    Top = 64
  end
  object q_Tmp: TOracleDataSet
    Left = 528
    Top = 88
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 472
    Top = 168
    StyleName = 'XP Style'
    object acNewPlanPostPosition: TAction
      Caption = #1053#1086#1074#1072#1103' '#1087#1086#1079#1080#1094#1080#1103' '#1087#1083#1072#1085#1072
      ImageIndex = 0
      OnExecute = acNewPlanPostPositionExecute
    end
    object acEditPlanPostPosition: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1087#1083#1072#1085#1072
      ImageIndex = 2
      OnExecute = acEditPlanPostPositionExecute
    end
    object acDelPlanPostPosition: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102' '#1087#1083#1072#1085#1072
      ImageIndex = 5
      OnExecute = acDelPlanPostPositionExecute
    end
    object acPlanStruToDBF: TAction
      Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1074' DBF'
      OnExecute = acPlanStruToDBFExecute
    end
  end
end
