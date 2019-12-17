object f_pfdbf: Tf_pfdbf
  Left = 144
  Top = 232
  Width = 880
  Height = 483
  Caption = 'f_pfdbf'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 872
    Height = 426
    Align = alClient
    DataSource = ds_pfdbf
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
        FieldName = 'plan_d'
        Footer.FieldName = 'plan_d'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'plan_v'
        Footer.FieldName = 'plan_v'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'plan_vz'
        Footer.FieldName = 'plan_vz'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'splan_d'
        Footer.FieldName = 'splan_d'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'splan_v'
        Footer.FieldName = 'splan_v'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'splan_vz'
        Footer.FieldName = 'splan_vz'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'fact_d'
        Footer.FieldName = 'fact_d'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'fact_v'
        Footer.FieldName = 'fact_v'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'fact_vz'
        Footer.FieldName = 'fact_vz'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'sfact_d'
        Footer.FieldName = 'sfact_d'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'sfact_v'
        Footer.FieldName = 'sfact_v'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'sfact_vz'
        Footer.FieldName = 'splan_vz'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
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
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' OI@Lukoil.com (PF)'
        OnClick = ToolbarButton971Click
      end
      object TBItem3: TTBItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' OI@Lukoil.com (PU)'
        OnClick = ToolbarButton974Click
      end
      object TBItem2: TTBItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' OI@Lukoil.com (HO)'
        OnClick = ToolbarButton972Click
      end
      object TBItem1: TTBItem
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' OI@Lukoil.com (HG)'
        OnClick = ToolbarButton973Click
      end
    end
  end
  object t_pfdbf: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Password="";Persist Security Info=True;Data S' +
      'ource=PF;Mode=ReadWrite'
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'C:\TMP\2312pfx6.dbf'
    Left = 48
    Top = 56
    object t_pfdbfkod_plan: TStringField
      DisplayWidth = 15
      FieldName = 'kod_plan'
      FixedChar = True
      Size = 15
    end
    object t_pfdbfnaim_plan: TStringField
      FieldName = 'naim_plan'
      FixedChar = True
      Size = 30
    end
    object t_pfdbfkod_10: TStringField
      FieldName = 'kod_10'
      FixedChar = True
      Size = 10
    end
    object t_pfdbfplan_d: TBCDField
      FieldName = 'plan_d'
      Precision = 17
      Size = 0
    end
    object t_pfdbfplan_v: TBCDField
      FieldName = 'plan_v'
      Precision = 17
      Size = 0
    end
    object t_pfdbfplan_vz: TBCDField
      FieldName = 'plan_vz'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsplan_d: TBCDField
      FieldName = 'splan_d'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsplan_v: TBCDField
      FieldName = 'splan_v'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsplan_vz: TBCDField
      FieldName = 'splan_vz'
      Precision = 17
      Size = 0
    end
    object t_pfdbffact_d: TBCDField
      FieldName = 'fact_d'
      Precision = 17
      Size = 0
    end
    object t_pfdbffact_v: TBCDField
      FieldName = 'fact_v'
      Precision = 17
      Size = 0
    end
    object t_pfdbffact_vz: TBCDField
      FieldName = 'fact_vz'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsfact_d: TBCDField
      FieldName = 'sfact_d'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsfact_v: TBCDField
      FieldName = 'sfact_v'
      Precision = 17
      Size = 0
    end
    object t_pfdbfsfact_vz: TBCDField
      FieldName = 'sfact_vz'
      Precision = 17
      Size = 0
    end
    object t_pfdbfnameprod: TStringField
      FieldKind = fkLookup
      FieldName = 'nameprod'
      LookupDataSet = t_prod
      LookupKeyFields = 'kod_10'
      LookupResultField = 'abbr'
      KeyFields = 'kod_10'
      Lookup = True
    end
  end
  object ds_pfdbf: TDataSource
    DataSet = t_pfdbf
    Left = 80
    Top = 56
  end
  object t_prod: TADOTable
    Active = True
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
    OnTimer = Timer1Timer
    Left = 136
    Top = 64
  end
end
