object f_plnpdbf: Tf_plnpdbf
  Left = 88
  Top = 182
  Width = 880
  Height = 483
  Caption = 'f_plnpdbf'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 872
    Height = 433
    Align = alClient
    DataSource = ds_plnpdbf
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
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
        FieldName = 'kod_plan'
        Footers = <>
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'naim_plan'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'kod_10'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'nameprod'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'plan'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 91
      end
      item
        EditButtons = <>
        FieldName = 'splan'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'plan_typ_name'
        Footers = <>
        Width = 136
      end
      item
        EditButtons = <>
        FieldName = 'plan_typ'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'date_plan'
        Footers = <>
      end>
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 872
    Height = 23
    object TBToolbar1: TTBToolbar
      Left = 0
      Top = 0
      Caption = 'TBToolbar1'
      TabOrder = 0
      object TBItem4: TTBItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' OI@Lukoil.com (P3)'
        OnClick = ToolbarButton971Click
      end
    end
  end
  object t_plnpdbf: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=PF;Mode=ReadWrite'
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = t_plnpdbfCalcFields
    TableName = 'C:\TMP\0205p334.dbf'
    Left = 48
    Top = 56
    object t_plnpdbfkod_plan: TStringField
      DisplayWidth = 15
      FieldName = 'kod_plan'
      FixedChar = True
      Size = 15
    end
    object t_plnpdbfnaim_plan: TStringField
      FieldName = 'naim_plan'
      FixedChar = True
      Size = 30
    end
    object t_plnpdbfkod_10: TStringField
      FieldName = 'kod_10'
      FixedChar = True
      Size = 10
    end
    object t_plnpdbfnameprod: TStringField
      FieldKind = fkLookup
      FieldName = 'nameprod'
      LookupDataSet = t_prod
      LookupKeyFields = 'kod_10'
      LookupResultField = 'abbr'
      KeyFields = 'kod_10'
      Lookup = True
    end
    object t_plnpdbfplan: TBCDField
      FieldName = 'plan'
      Precision = 13
      Size = 0
    end
    object t_plnpdbfsplan: TBCDField
      FieldName = 'splan'
      Precision = 13
      Size = 0
    end
    object t_plnpdbfplan_typ: TStringField
      FieldName = 'plan_typ'
      FixedChar = True
      Size = 2
    end
    object t_plnpdbfplan_typ_name: TStringField
      FieldKind = fkCalculated
      FieldName = 'plan_typ_name'
      Size = 50
      Calculated = True
    end
    object t_plnpdbfdate_plan: TDateField
      FieldName = 'date_plan'
    end
  end
  object ds_plnpdbf: TDataSource
    DataSet = t_plnpdbf
    Left = 80
    Top = 56
  end
  object t_prod: TADOTable
    Connection = f_f42.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'prod.dbf'
    Left = 48
    Top = 88
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 80
    Top = 88
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    Left = 136
    Top = 64
  end
end
