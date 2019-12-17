object frm_OBU_sbcard: Tfrm_OBU_sbcard
  Left = 249
  Top = 126
  Width = 841
  Height = 715
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1057#1073#1077#1088#1082#1072#1088#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object grd_Zarpsnp: TDBGridEh
    Left = 323
    Top = 65
    Width = 265
    Height = 616
    Align = alLeft
    AutoFitColWidths = True
    DataSource = ds_Zarpsnp
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'kls_name'
        Footer.FieldName = 'kls_name'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 187
      end
      item
        EditButtons = <>
        FieldName = 'p120'
        Footer.FieldName = 'p120'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footers = <>
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'sumvyd'
        Footer.FieldName = 'sumvyd'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 104
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 12
      Width = 121
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1072#1089#1095#1077#1090#1072' '#1079#1072#1088#1087#1083#1072#1090#1099
    end
    object ed_DataWork: TDateEdit
      Left = 148
      Top = 8
      Width = 89
      Height = 21
      DefaultToday = True
      DialogTitle = #1042#1099#1073#1080#1088#1080#1090#1077' '#1076#1072#1090#1091
      NumGlyphs = 2
      TabOrder = 0
      OnChange = ed_DataWorkChange
    end
    object Button1: TButton
      Left = 244
      Top = 4
      Width = 89
      Height = 26
      Action = ac_OBU_Refresh
      TabOrder = 1
    end
    object Button3: TButton
      Left = 334
      Top = 4
      Width = 95
      Height = 26
      Action = ac_OBU_Write
      TabOrder = 2
    end
    object Button2: TButton
      Left = 189
      Top = 32
      Width = 120
      Height = 25
      Action = ac_OBU_Print
      TabOrder = 3
    end
    object Button4: TButton
      Left = 309
      Top = 32
      Width = 120
      Height = 25
      Action = ac_OBU_zp0
      TabOrder = 4
    end
    object Button5: TButton
      Left = 69
      Top = 32
      Width = 120
      Height = 25
      Action = ac_OBU_ZarpAll
      TabOrder = 5
    end
    object Button6: TButton
      Left = 432
      Top = 4
      Width = 72
      Height = 53
      Action = ac_OBU_Ved
      TabOrder = 6
    end
  end
  object grd_ZP0: TDBGridEh
    Left = 591
    Top = 65
    Width = 242
    Height = 616
    Align = alClient
    AutoFitColWidths = True
    DataSource = ds_zarpsnp0
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    SumList.VirtualRecords = True
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
        FieldName = 'kls_name'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footers = <>
        Width = 183
      end
      item
        EditButtons = <>
        FieldName = 'sumvyd'
        Footer.FieldName = 'sumvyd'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 101
      end>
  end
  object RxSplitter1: TRxSplitter
    Left = 320
    Top = 65
    Width = 3
    Height = 616
    ControlFirst = grd_ZarpAll
    Align = alLeft
  end
  object grd_ZarpAll: TDBGridEh
    Left = 0
    Top = 65
    Width = 320
    Height = 616
    Align = alLeft
    AutoFitColWidths = True
    DataSource = ds_ZarpAll
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'kls_name'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 210
      end
      item
        EditButtons = <>
        FieldName = 'sumvyd'
        Footer.FieldName = 'sumvyd'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 91
      end>
  end
  object RxSplitter2: TRxSplitter
    Left = 588
    Top = 65
    Width = 3
    Height = 616
    ControlFirst = grd_Zarpsnp
    Align = alLeft
  end
  object zarpsnp: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=210673;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=ca;Data Source=UKHOITORA'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 552
    Top = 8
  end
  object ds_Zarpsnp: TDataSource
    DataSet = q_zarpsnp
    Left = 432
    Top = 176
  end
  object acl_OBU: TActionList
    Left = 584
    Top = 8
    object ac_OBU_Refresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnExecute = ac_OBU_RefreshExecute
    end
    object ac_OBU_Write: TAction
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077
      OnExecute = ac_OBU_WriteExecute
    end
    object ac_OBU_Print: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1057#1073#1050#1072#1088#1090
      OnExecute = ac_OBU_PrintExecute
    end
    object ac_OBU_zp0: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1055#1091#1089#1090#1099#1093
      OnExecute = ac_OBU_zp0Execute
    end
    object ac_OBU_ZarpAll: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1089#1077#1093
      OnExecute = ac_OBU_ZarpAllExecute
    end
    object ac_OBU_Ved: TAction
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100
      OnExecute = ac_OBU_VedExecute
    end
  end
  object q_zarpsnp: TADOQuery
    Connection = zarpsnp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select 1 as spec1, p120, sum(opl) as sumvyd, kls_name, 0 as spec' +
        '2,convert(varchar,getdate(),103) as spec3'
      'from sbcard6_2 '
      ''
      'group by kls_name, p120 '
      'having sum(opl)>0'
      'order by 4'
      '')
    Left = 464
    Top = 176
    object q_zarpsnpkls_name: TStringField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#1060'.'#1048'.'#1054'.'
      FieldName = 'kls_name'
      Size = 60
    end
    object q_zarpsnpp120: TStringField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#8470' '#1057#1073#1077#1088'-'#1089#1095#1077#1090#1072
      FieldName = 'p120'
    end
    object q_zarpsnpsumvyd: TBCDField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#1050' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1102
      FieldName = 'sumvyd'
      ReadOnly = True
      DisplayFormat = '### ### ##0.00'
      Precision = 32
      Size = 2
    end
    object q_zarpsnpspec1: TIntegerField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#1057#1087#1077#1094'1'
      FieldName = 'spec1'
      ReadOnly = True
    end
    object q_zarpsnpspec2: TIntegerField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#1057#1087#1077#1094'2'
      FieldName = 'spec2'
      ReadOnly = True
    end
    object q_zarpsnpspec3: TStringField
      DisplayLabel = #1057#1073#1077#1088#1082#1072#1088#1090#1099'|'#1057#1087#1077#1094'3'
      FieldName = 'spec3'
      ReadOnly = True
      Size = 30
    end
  end
  object prn_Zarpsnp: TPrintDBGridEh
    DBGridEh = grd_Zarpsnp
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Courier'
    Units = MM
    Left = 496
    Top = 176
  end
  object q_zarpsnp0: TADOQuery
    Connection = zarpsnp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select p120, sum(opl) as sumvyd, kls_name'
      'from sbcard0'
      ''
      'group by kls_name, p120 '
      'order by 1'
      ''
      ''
      '')
    Left = 696
    Top = 176
    object q_zarpsnp0p120: TStringField
      DisplayLabel = #1041#1077#1079' '#1085#1086#1084#1077#1088#1072'|'#8470' '#1057#1073#1077#1088#1089#1095#1077#1090
      FieldName = 'p120'
    end
    object q_zarpsnp0sumvyd: TBCDField
      DisplayLabel = #1041#1077#1079' '#1085#1086#1084#1077#1088#1072'|'#1050' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1102
      FieldName = 'sumvyd'
      ReadOnly = True
      DisplayFormat = '### ### ##0.00'
      Precision = 32
      Size = 2
    end
    object q_zarpsnp0kls_name: TStringField
      DisplayLabel = #1041#1077#1079' '#1085#1086#1084#1077#1088#1072'|'#1060'.'#1048'.'#1054'.'
      FieldName = 'kls_name'
      Size = 60
    end
  end
  object ds_zarpsnp0: TDataSource
    DataSet = q_zarpsnp0
    Left = 664
    Top = 176
  end
  object FormStorage1: TFormStorage
    Options = [fpState, fpPosition, fpActiveControl]
    UseRegistry = True
    StoredValues = <>
    Left = 624
    Top = 8
  end
  object prn_zp0: TPrintDBGridEh
    DBGridEh = grd_ZP0
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Courier'
    Units = MM
    Left = 720
    Top = 176
  end
  object ds_ZarpAll: TDataSource
    DataSet = q_ZarpAll
    Left = 152
    Top = 216
  end
  object q_ZarpAll: TADOQuery
    Connection = zarpsnp
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select sum(opl) as sumvyd, kls_name'
      'from sbcard6_2 '
      ''
      'group by kls_name'
      'union'
      'select sum(opl) as sumvyd, kls_name'
      'from sbcard0'
      ''
      'group by kls_name'
      'order by 2'
      ''
      '')
    Left = 184
    Top = 216
    object q_ZarpAllsumvyd: TBCDField
      DisplayLabel = #1042#1089#1077#1075#1086'|'#1050' '#1079#1072#1095#1080#1089#1083#1077#1085#1080#1102
      FieldName = 'sumvyd'
      ReadOnly = True
      DisplayFormat = '### ### ##0.00'
      Precision = 32
      Size = 2
    end
    object q_ZarpAllkls_name: TStringField
      DisplayLabel = #1042#1089#1077#1075#1086'|'#1060'.'#1048'.'#1054'.'
      DisplayWidth = 40
      FieldName = 'kls_name'
      Size = 60
    end
  end
  object prn_ZarpAll: TPrintDBGridEh
    DBGridEh = grd_ZarpAll
    Options = []
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Courier'
    Units = MM
    Left = 216
    Top = 216
  end
  object sd_ZarpVed: TSaveDialog
    DefaultExt = 'txt'
    Filter = '*.txt'
    InitialDir = 'a:\'
    Left = 520
    Top = 8
  end
end
