object frmPrice: TfrmPrice
  Left = 246
  Top = 132
  Width = 782
  Height = 527
  Caption = #1062#1077#1085#1099' '#1055#1072#1088#1091#1089#1072
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      774
      41)
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 55
      Height = 13
      Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076':'
    end
    object edDate: TDateEdit
      Left = 76
      Top = 7
      Width = 90
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
      OnChange = edDateChange
    end
    object BitBtn1: TBitBtn
      Left = 640
      Top = 8
      Width = 121
      Height = 25
      Action = acFilter
      Anchors = [akTop, akRight]
      Caption = #1060#1080#1083#1100#1090#1088
      TabOrder = 1
    end
    object rbAll: TRadioButton
      Left = 176
      Top = 8
      Width = 80
      Height = 17
      Caption = #1042#1089#1077
      TabOrder = 2
    end
    object rbNoPrice: TRadioButton
      Left = 264
      Top = 8
      Width = 80
      Height = 17
      Caption = #1041#1077#1079' '#1094#1077#1085#1099
      TabOrder = 3
    end
    object rbWPrice: TRadioButton
      Left = 374
      Top = 8
      Width = 97
      Height = 17
      Caption = #1057' '#1094#1077#1085#1086#1081
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 774
    Height = 452
    Align = alClient
    TabOrder = 1
    object dbgMonth: TDBGridEh
      Left = 1
      Top = 1
      Width = 772
      Height = 450
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      AutoFitColWidths = True
      DataSource = dsMonth
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnSortMarkingChanged = dbgMonthSortMarkingChanged
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DOG_NUMBER'
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
          FieldName = 'CENA_NPO'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'CENA_OTP_NPO'
          Footers = <>
          Title.TitleButton = True
        end>
    end
  end
  object oraMonth: TOracleDataSet
    SQL.Strings = (
      
        'select p.short_name,d.dog_number,m.nom_zd,m.CENA_NPO,m.CENA_OTP_' +
        'NPO,m.rowid'
      'from month m, kls_dog d,kls_predpr p'
      'where m.npodog_id=d.ID and d.PREDPR_ID=p.id and'
      'm.NPODOG_ID is not null'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ReadBuffer = 25
    Optimize = True
    Debug = False
    StringFieldsOnly = False
    SequenceField.ApplyMoment = amOnPost
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
    QBEDefinition.QBEFieldDefs = {
      03000000050000000A00000053484F52545F4E414D450100000000060000004E
      4F4D5F5A4401000000000800000043454E415F4E504F01000000000C00000043
      454E415F4F54505F4E504F01000000000A000000444F475F4E554D4245520100
      000000}
    Cursor = crDefault
    ReadOnly = False
    LockingMode = lmCheckImmediate
    QueryAllRecords = True
    CountAllRecords = False
    RefreshOptions = []
    CommitOnPost = True
    CachedUpdates = False
    QBEMode = False
    Session = f_main.ora_Session
    DesignActivation = False
    Active = False
    Left = 208
    Top = 145
    object oraMonthSHORT_NAME: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'SHORT_NAME'
      ReadOnly = True
      Size = 30
    end
    object oraMonthNOM_ZD: TStringField
      DisplayLabel = #1057#1074#1077#1076#1077#1085#1080#1077
      FieldName = 'NOM_ZD'
      ReadOnly = True
      Required = True
      Size = 12
    end
    object oraMonthCENA_NPO: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1073'/'#1085
      FieldName = 'CENA_NPO'
      OnChange = oraMonthCENA_NPOChange
    end
    object oraMonthCENA_OTP_NPO: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1089'/'#1085
      FieldName = 'CENA_OTP_NPO'
    end
    object oraMonthDOG_NUMBER: TStringField
      DisplayLabel = #1044#1086#1075#1086#1074#1086#1088
      FieldName = 'DOG_NUMBER'
      Required = True
      Size = 30
    end
  end
  object dsMonth: TDataSource
    DataSet = oraMonth
    Left = 240
    Top = 145
  end
  object ActionManager1: TActionManager
    Left = 280
    Top = 145
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      OnExecute = acFilterExecute
    end
  end
  object pckBILLS: TOraclePackage
    Session = f_main.ora_Session
    Debug = False
    PackageName = 'FOR_BILLS'
    ParameterMode = pmPositional
    Cursor = crDefault
    Optimize = True
    Left = 208
    Top = 224
  end
end
