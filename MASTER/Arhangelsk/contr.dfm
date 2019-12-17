object frm1cParAgn: Tfrm1cParAgn
  Left = 343
  Top = 233
  Width = 916
  Height = 512
  Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089' 1'#1089' - '#1055#1072#1088#1091#1089
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
  object grAGN: TDBGridEh
    Left = 0
    Top = 0
    Width = 908
    Height = 485
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = dsAGN
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnSortMarkingChanged = grAGNSortMarkingChanged
    Columns = <
      item
        EditButtons = <>
        FieldName = 'AGN_ABBR'
        Footers = <>
        Title.TitleButton = True
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'AGN_NAME'
        Footers = <>
        Title.TitleButton = True
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'AGN_INN'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'AGN_POST'
        Footers = <>
        Title.TitleButton = True
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'AGN_PARUS_AGNABBR'
        Footers = <>
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'AGN_PARUS_FACC'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  object oraParus: TOracleSession
    DesignConnection = True
    LogonDatabase = 'P5'
    Left = 72
    Top = 240
  end
  object oraLog: TOracleLogon
    Session = oraParus
    Options = [ldDatabase, ldDatabaseList]
    Caption = #1042#1093#1086#1076' '#1074' '#1055#1072#1088#1091#1089
    Left = 120
    Top = 240
  end
  object oraAGN: TOracleDataSet
    SQL.Strings = (
      
        'SELECT rowid,AGN_ID, AGN_ABBR, AGN_NAME, AGN_POST, AGN_INN, AGN_' +
        'KPP, '
      ' AGN_PARUS_FACC, AGN_PARUS_AGNABBR  '
      ' FROM RUI_ARX_AGN'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      03000000080000000600000041474E5F494401000000000800000041474E5F41
      42425201000000000800000041474E5F4E414D4501000000000800000041474E
      5F504F535401000000000700000041474E5F494E4E0100000000070000004147
      4E5F4B505001000000000E00000041474E5F50415255535F4641434301000000
      001100000041474E5F50415255535F41474E414242520100000000}
    Session = oraParus
    Left = 168
    Top = 240
    object oraAGNAGN_ID: TStringField
      FieldName = 'AGN_ID'
      ReadOnly = True
      Size = 9
    end
    object oraAGNAGN_ABBR: TStringField
      DisplayLabel = '1'#1089'|'#1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'AGN_ABBR'
      ReadOnly = True
      Size = 30
    end
    object oraAGNAGN_NAME: TStringField
      DisplayLabel = '1'#1089'|'#1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'AGN_NAME'
      ReadOnly = True
      Size = 150
    end
    object oraAGNAGN_POST: TStringField
      DisplayLabel = '1'#1089'|'#1040#1076#1088#1077#1089
      FieldName = 'AGN_POST'
      ReadOnly = True
      Size = 85
    end
    object oraAGNAGN_INN: TStringField
      DisplayLabel = '1'#1089'|'#1048#1053#1053
      FieldName = 'AGN_INN'
      ReadOnly = True
    end
    object oraAGNAGN_KPP: TStringField
      FieldName = 'AGN_KPP'
      ReadOnly = True
      Size = 9
    end
    object oraAGNAGN_PARUS_FACC: TStringField
      DisplayLabel = #1055#1072#1088#1091#1089'|'#1051#1057
      FieldName = 'AGN_PARUS_FACC'
      Size = 25
    end
    object oraAGNAGN_PARUS_AGNABBR: TStringField
      DisplayLabel = #1055#1072#1088#1091#1089'|'#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'AGN_PARUS_AGNABBR'
      Size = 25
    end
  end
  object dsAGN: TDataSource
    DataSet = oraAGN
    Left = 224
    Top = 240
  end
end
