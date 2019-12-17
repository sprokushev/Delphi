object f_Calls: Tf_Calls
  Left = 279
  Top = 194
  Width = 696
  Height = 480
  Caption = #1052#1077#1078#1075#1086#1088#1086#1076
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
  object Splitter1: TSplitter
    Left = 177
    Top = 23
    Height = 430
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 177
    Height = 430
    Align = alLeft
    DataSource = ds_Emails
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'EMAIL'
        Footers = <>
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 180
    Top = 23
    Width = 508
    Height = 430
    Align = alClient
    DataSource = ds_Calls
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'CALLTIME'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CALLLENGTH'
        Footers = <>
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'TONUMBER'
        Footers = <>
        Width = 132
      end
      item
        EditButtons = <>
        FieldName = 'SUMMA'
        Footer.FieldName = 'SUMMA'
        Footer.ValueType = fvtSum
        Footers = <>
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 688
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem1: TTBItem
        Action = acSendOne
      end
      object TBItem2: TTBItem
        Action = acSendAll
      end
    end
  end
  object t_Emails: TOracleDataSet
    SQL.Strings = (
      
        'SELECT DISTINCT email FROM tel.kls_phones WHERE EMAIL IS NOT NUL' +
        'L')
    QBEDefinition.QBEFieldDefs = {030000000100000005000000454D41494C0100000000}
    AfterScroll = t_EmailsAfterScroll
    Left = 232
    Top = 128
    object t_EmailsEMAIL: TStringField
      DisplayWidth = 25
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object ds_Emails: TDataSource
    DataSet = t_Emails
    Left = 260
    Top = 128
  end
  object t_Calls: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '  atslog.calltime,'
      '  atslog.calllength,'
      '  atslog.tonumber,'
      '  atslog.summa'
      '  FROM tel.atslog,tel.kls_phones'
      '  WHERE atslog.fromnumber=kls_phones.inside_number AND'
      '    CALLTIME>=trunc(sysdate-1) AND'
      
        '    (SUBSTR(atslog.tonumber,1,1)='#39'8'#39' or SUBSTR(atslog.tonumber,1' +
        ',2)='#39'08'#39') AND'
      '    kls_phones.email='#39'evaneev@komitu.lukoil.com'#39
      '  order by atslog.calltime')
    QBEDefinition.QBEFieldDefs = {
      03000000040000000800000043414C4C54494D4501000000000A00000043414C
      4C4C454E475448010000000008000000544F4E554D4245520100000000050000
      0053554D4D410100000000}
    BeforeOpen = t_CallsBeforeOpen
    Left = 232
    Top = 156
    object t_CallsCALLTIME: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1074#1086#1085#1082#1072
      FieldName = 'CALLTIME'
    end
    object t_CallsCALLLENGTH: TFloatField
      DisplayLabel = #1055#1088#1086#1076#1086#1083#1078#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100
      FieldName = 'CALLLENGTH'
    end
    object t_CallsTONUMBER: TStringField
      DisplayLabel = #1042#1099#1079#1099#1074#1072#1077#1084#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'TONUMBER'
      Size = 40
    end
    object t_CallsSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
  end
  object ds_Calls: TDataSource
    DataSet = t_Calls
    Left = 260
    Top = 156
  end
  object ActionManager1: TActionManager
    Left = 191
    Top = 156
    StyleName = 'XP Style'
    object acSendOne: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      OnExecute = acSendOneExecute
    end
    object acSendAll: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074#1089#1077#1084
      OnExecute = acSendAllExecute
    end
  end
end
