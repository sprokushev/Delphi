object f_SFNumbers: Tf_SFNumbers
  Left = 298
  Top = 153
  Width = 696
  Height = 480
  Caption = #1056#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1086#1084#1077#1088#1086#1074' '#1089#1095#1077#1090#1086#1074'-'#1092#1072#1082#1090#1091#1088
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 26
    Width = 688
    Height = 427
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_numbers
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
    UseMultiTitle = True
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'FROM_DATE'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'TO_DATE'
        Footers = <>
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'START_NUM'
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'RANGE'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CURR_NUM'
        Footers = <>
        ReadOnly = True
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'REMAINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 75
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 26
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      Images = f_main.img_Common
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acNewSFNumbers
        DisplayMode = nbdmImageAndText
      end
    end
  end
  object t_Numbers: TOracleDataSet
    SQL.Strings = (
      'select sf_numbers.rowid,sf_numbers.* from sf_numbers'
      'ORDER BY from_date')
    QBEDefinition.QBEFieldDefs = {
      03000000050000000900000046524F4D5F44415445010000000007000000544F
      5F4441544501000000000900000053544152545F4E554D010000000008000000
      435552525F4E554D01000000000500000052414E47450100000000}
    CountAllRecords = True
    UpdatingTable = 'sf_numbers'
    Session = ora_Session
    OnCalcFields = t_NumbersCalcFields
    Left = 608
    Top = 24
    object t_NumbersFROM_DATE: TDateTimeField
      DisplayLabel = #1057
      FieldName = 'FROM_DATE'
    end
    object t_NumbersTO_DATE: TDateTimeField
      DisplayLabel = #1055#1086
      FieldName = 'TO_DATE'
    end
    object t_NumbersSTART_NUM: TFloatField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'START_NUM'
    end
    object t_NumbersCURR_NUM: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1081' '#1085#1086#1084#1077#1088
      FieldName = 'CURR_NUM'
    end
    object t_NumbersRANGE: TFloatField
      DisplayLabel = #1044#1080#1072#1087#1072#1079#1086#1085
      FieldName = 'RANGE'
    end
    object t_NumbersREMAINS: TIntegerField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldKind = fkCalculated
      FieldName = 'REMAINS'
      Calculated = True
    end
  end
  object ds_numbers: TDataSource
    DataSet = t_Numbers
    Left = 576
    Top = 24
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 544
    Top = 24
  end
  object ActionManager1: TActionManager
    Images = f_main.img_Common
    Left = 560
    Top = 96
    StyleName = 'XP Style'
    object acNewSFNumbers: TAction
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 0
      OnExecute = acNewSFNumbersExecute
    end
  end
end
