inherited f_forAZCSprav: Tf_forAZCSprav
  Left = 153
  Top = 105
  Width = 851
  Height = 489
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080' '#1087#1086' '#1089#1090#1088#1091#1082#1090#1091#1088#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PC_AZCSprav: TPageControl
    Left = 0
    Top = 24
    Width = 848
    Height = 439
    ActivePage = tb_azc_kind
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = PC_AZCSpravChange
    object tb_azc_kind: TTabSheet
      Caption = #1042#1080#1076' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      DesignSize = (
        840
        411)
      object DBGreedEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 840
        Height = 407
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DS_spravochnik
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGreedEhGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footer.FieldName = 'NAME'
            Footer.Value = 'NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076
          end>
      end
    end
    object tb_azc_type: TTabSheet
      Caption = #1058#1080#1087' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      ImageIndex = 1
      DesignSize = (
        840
        411)
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 840
        Height = 415
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DS_spravochnik
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGreedEhGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
          end>
      end
    end
    object tb_group: TTabSheet
      Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
      ImageIndex = 2
      DesignSize = (
        840
        411)
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 0
        Width = 845
        Height = 415
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DS_spravochnik
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGreedEhGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1052#1077#1089#1090#1086' '#1086#1090#1075#1088#1091#1079#1082#1080
            Width = 195
          end>
      end
    end
    object tb_: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1055
      ImageIndex = 3
      DesignSize = (
        840
        411)
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 845
        Height = 415
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DS_spravochnik
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGreedEhGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      ImageIndex = 4
      DesignSize = (
        840
        411)
      object DBGridEh5: TDBGridEh
        Left = 0
        Top = 0
        Width = 845
        Height = 415
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DS_spravochnik
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGreedEhGetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
          end>
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 843
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      ShrinkMode = tbsmWrap
      TabOrder = 0
      object TBItem5: TTBItem
        Action = ac_AZCSP_add
        DisplayMode = nbdmImageAndText
        ImageIndex = 0
      end
      object TBItem4: TTBItem
        Action = ac_AZCSP_ed
        DisplayMode = nbdmImageAndText
        ImageIndex = 8
      end
      object TBItem3: TTBItem
        Action = ac_AZCSP_del
        DisplayMode = nbdmImageAndText
        ImageIndex = 5
      end
    end
  end
  object ODS_Spravochnik: TOracleDataSet
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.Field = 'ID'
    SequenceField.Sequence = 'SEQ_KLS_ORG_KIND'
    SequenceField.ApplyMoment = amOnNewRecord
    OracleDictionary.EnforceConstraints = False
    OracleDictionary.UseMessageTable = False
    OracleDictionary.DefaultValues = False
    OracleDictionary.DynamicDefaults = False
    OracleDictionary.FieldKinds = False
    OracleDictionary.DisplayFormats = False
    OracleDictionary.RangeValues = False
    OracleDictionary.RequiredFields = True
    QBEDefinition.SaveQBEValues = True
    QBEDefinition.AllowFileWildCards = True
    QBEDefinition.QBEFontColor = clNone
    QBEDefinition.QBEBackgroundColor = clNone
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    DesignActivation = False
    Active = False
    BeforePost = ODS_SpravochnikBeforePost
    AfterPost = ODS_SpravochnikAfterPost
    Left = 264
    Top = 104
  end
  object DS_spravochnik: TDataSource
    DataSet = ODS_Spravochnik
    Left = 268
    Top = 152
  end
  object ActionManager1: TActionManager
    Left = 268
    Top = 208
    StyleName = 'XP Style'
    object ac_AZCSP_add: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = ac_AZCSP_addExecute
    end
    object ac_AZCSP_ed: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = ac_AZCSP_edExecute
    end
    object ac_AZCSP_del: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = ac_AZCSP_delExecute
    end
  end
  object OQ_spravochnik: TOracleQuery
    ReadBuffer = 25
    Optimize = True
    Debug = False
    Cursor = crDefault
    StringFieldsOnly = False
    Threaded = False
    ThreadSynchronized = True
    Left = 356
    Top = 200
  end
end
