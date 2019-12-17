object f_add_razb: Tf_add_razb
  Left = 361
  Top = 220
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100
  ClientHeight = 215
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 37
    Height = 16
    Caption = #1044#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 154
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1074#1072#1075#1086#1085#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 75
    Width = 28
    Height = 16
    Caption = #1042#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 107
    Width = 64
    Height = 16
    Caption = #1055#1088#1086#1076#1091#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 138
    Width = 146
    Height = 16
    Caption = #1047#1072#1082#1072#1079' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object e_kol_razb: TEdit
    Left = 168
    Top = 40
    Width = 209
    Height = 21
    TabOrder = 1
    Text = 'e_kol_razb'
  end
  object e_ves_razb: TEdit
    Left = 168
    Top = 72
    Width = 209
    Height = 21
    TabOrder = 2
    Text = 'e_ves_razb'
  end
  object Button1: TButton
    Left = 152
    Top = 168
    Width = 105
    Height = 41
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 168
    Width = 105
    Height = 41
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object e_date_razb: TDBDateTimeEditEh
    Left = 168
    Top = 8
    Width = 209
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object c_npr: TRxDBLookupCombo
    Left = 168
    Top = 104
    Width = 209
    Height = 21
    DropDownCount = 8
    LookupField = 'ID_NPR'
    LookupDisplay = 'NAME_NPR'
    LookupSource = ds_npr
    TabOrder = 5
    OnKeyDown = c_nprKeyDown
  end
  object edZakazHist: TEdit
    Left = 168
    Top = 136
    Width = 210
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object btnDropDown: TBitBtn
    Left = 359
    Top = 138
    Width = 17
    Height = 17
    TabOrder = 7
    OnClick = btnDropDownClick
    Glyph.Data = {
      0A020000424D0A0200000000000036000000280000000C0000000D0000000100
      180000000000D401000000000000000000000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000
      00000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
      0000000000000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      000000000000000000000000000000000000000000C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4}
  end
  object pnDropDown: TPanel
    Left = 48
    Top = 17
    Width = 292
    Height = 181
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Visible = False
    object bvlDropDown2: TBevel
      Left = 267
      Top = 69
      Width = 21
      Height = 21
      Shape = bsTopLine
      Style = bsRaised
    end
    object sbtnDropDownClose: TSpeedButton
      Left = 268
      Top = 4
      Width = 20
      Height = 20
      Hint = #1047#1072#1082#1088#1099#1090#1100
      Caption = 'X'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbtnDropDownCloseClick
    end
    object sbtnDropDownDel: TSpeedButton
      Left = 268
      Top = 77
      Width = 20
      Height = 20
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = sbtnDropDownDelClick
    end
    object bvlDropDown: TBevel
      Left = 267
      Top = 34
      Width = 21
      Height = 17
      Shape = bsTopLine
      Style = bsRaised
    end
    object sbtnDropDownSave: TSpeedButton
      Left = 268
      Top = 44
      Width = 20
      Height = 20
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
        00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
        00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000000000FF00FF00FF00FF0000000000000000000000
        00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000000000000000000000000000000000000000000000
        00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BDBD0000BD
        BD0000BDBD0000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000BDBD0000000000000000000000000000000000000000000000
        00000000000000BDBD0000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000000000FFFFFF00FF000000FF000000FF000000FF000000FFFF
        FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD0000000000FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
        FF00FFFFFF000000000000BDBD0000000000FF00FF00FF00FF00FF00FF000000
        000000BDBD00FF00FF00FFFFFF00FF000000FF000000FF000000FF000000FFFF
        FF00FFFFFF00000000000000000000000000FF00FF00FF00FF00FF00FF000000
        0000FF00FF00FF00FF00FF000000FF000000FF000000FFFFFF00FF000000FFFF
        FF00FFFFFF00000000008484840000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentFont = False
      OnClick = sbtnDropDownSaveClick
    end
    object dbgDropDown: TDBGridEh
      Left = 3
      Top = 3
      Width = 262
      Height = 175
      AllowedOperations = []
      AutoFitColWidths = True
      DataSource = dsDownList
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      HorzScrollBar.Visible = False
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      RowHeight = 2
      RowLines = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      OnDblClick = sbtnDropDownSaveClick
      OnExit = sbtnDropDownCloseClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CLIENT_NUMBER'
          Footers = <>
          Title.Caption = #1048#1089#1093'. '#8470' '#1079#1072#1103#1074#1082#1080
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_NUMBER'
          Footers = <>
          Title.Caption = #1042#1093'. '#8470' '#1047#1072#1103#1074#1082#1080
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'INPUT_DATE'
          Footers = <>
          Width = 86
        end>
    end
  end
  object q_br_sum: TOracleQuery
    SQL.Strings = (
      'SELECT SUM(GU12_BR.KOL_VAG) AS S_KOL'
      ',SUM(GU12_BR.VES) AS S_VES'
      ',MAX(GU12_BR.DATE_R) AS MAX_DATE_R'
      'FROM GU12_BR'
      'WHERE ID_B=:IDREIS')
    Session = f_main.ora_Session
    Variables.Data = {0300000001000000070000003A494452454953030000000000000000000000}
    Cursor = crSQLWait
    Left = 40
    Top = 104
  end
  object q_npr: TOracleDataSet
    SQL.Strings = (
      
        'SELECT '#39#39' AS ID_NPR,'#39#39' AS NAME_NPR, '#39#39' AS LONG_NAME_NPR FROM DUA' +
        'L'
      'UNION ALL'
      'SELECT'
      'ID_NPR'
      ',NAME_NPR'
      ',LONG_NAME_NPR'
      'FROM'
      'KLS_PROD'
      'WHERE'
      'PROD_GU12_ID=FOR_TEMP.GET_AS_CHAR('#39'GDPROD'#39','#39'MASTER'#39','#39'GU12'#39')'
      'AND ID_KIND_NPR IS NOT NULL'
      'ORDER BY NAME_NPR')
    Cursor = crSQLWait
    Session = f_main.ora_Session
    Left = 8
    Top = 104
  end
  object ds_npr: TDataSource
    DataSet = q_npr
    Left = 8
    Top = 136
  end
  object oradsDownList: TOracleDataSet
    SQL.Strings = (
      'SELECT ZAKAZ_HIST.ID,'
      '       ZAKAZ_HIST.CLIENT_NUMBER,'
      '       ZAKAZ_HIST.INPUT_NUMBER,'
      '       TO_CHAR(ZAKAZ_HIST.INPUT_DATE,'#39'DD.MM.YYYY'#39') AS INPUT_DATE'
      'FROM ZAKAZ_HIST, ZAKAZ, KLS_PROD'
      'WHERE (ZAKAZ.PLAT_ID = :GU12B_PLATID) AND'
      '      (ZAKAZ.STAN_ID = :GU12B_STANID) AND'
      '      (ZAKAZ.DATE_PLAN >= TRUNC(:GU12A_FROMDATE,'#39'MONTH'#39')) AND'
      '     ((ZAKAZ.PROD_ID_NPR = KLS_PROD.ID_NPR) AND'
      '      (KLS_PROD.PROD_GU12_ID = :GU12A_PRODID)) AND'
      '      (ZAKAZ_HIST.ZAKAZ_ID = ZAKAZ.ID)')
    Variables.Data = {
      03000000040000000D0000003A47553132425F504C4154494403000000000000
      00000000000D0000003A47553132425F5354414E494403000000000000000000
      00000F0000003A47553132415F46524F4D444154450C00000000000000000000
      000D0000003A47553132415F50524F444944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000400000002000000494401000000000D000000434C49454E545F4E55
      4D42455201000000000C000000494E5055545F4E554D42455201000000000A00
      0000494E5055545F444154450100000000}
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    Session = f_main.ora_Session
    Left = 160
    Top = 64
    object oradsDownListCLIENT_NUMBER: TStringField
      DisplayLabel = #1048#1089#1093'.'#8470' '#1079#1072#1103#1074#1082#1080
      DisplayWidth = 12
      FieldName = 'CLIENT_NUMBER'
      Size = 50
    end
    object oradsDownListINPUT_NUMBER: TStringField
      DisplayLabel = #1042#1093'. '#8470' '#1079#1072#1103#1074#1082#1080
      DisplayWidth = 12
      FieldName = 'INPUT_NUMBER'
      Size = 50
    end
    object oradsDownListINPUT_DATE: TStringField
      DisplayLabel = #1042#1093'. '#1076#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
      DisplayWidth = 14
      FieldName = 'INPUT_DATE'
      Size = 10
    end
    object oradsDownListID: TFloatField
      DisplayWidth = 10
      FieldName = 'ID'
    end
  end
  object dsDownList: TDataSource
    DataSet = oradsDownList
    Left = 160
    Top = 96
  end
end
