object frmPayOrd: TfrmPayOrd
  Left = 354
  Top = 256
  Width = 731
  Height = 522
  Caption = #1058#1077#1083#1077#1092#1086#1085#1086#1075#1088#1072#1084#1084#1099
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
    Width = 723
    Height = 124
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 2
      Width = 443
      Height = 97
      Caption = #1060#1080#1083#1100#1090#1088' '
      TabOrder = 0
      object Label2: TLabel
        Left = 5
        Top = 16
        Width = 6
        Height = 13
        Caption = #1089
      end
      object Label3: TLabel
        Left = 5
        Top = 54
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object Label1: TLabel
        Left = 2
        Top = 75
        Width = 123
        Height = 13
        Caption = #1050#1072#1090#1072#1083#1086#1075' '#1092#1072#1081#1083#1086#1074' '#1086#1073#1084#1077#1085#1072
      end
      object Label4: TLabel
        Left = 112
        Top = 16
        Width = 22
        Height = 13
        Caption = #1055#1041#1045
      end
      object Label5: TLabel
        Left = 134
        Top = 51
        Width = 58
        Height = 13
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      end
      object deBeg: TDateEdit
        Left = 19
        Top = 13
        Width = 84
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object deEnd: TDateEdit
        Left = 19
        Top = 49
        Width = 84
        Height = 21
        DefaultToday = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object edPath: TDirectoryEdit
        Left = 132
        Top = 71
        Width = 297
        Height = 21
        DialogText = #1042#1099#1073#1080#1088#1080#1090#1077' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1102
        NumGlyphs = 1
        TabOrder = 2
      end
      object rbClose: TRadioButton
        Left = 269
        Top = 10
        Width = 79
        Height = 17
        Caption = #1047#1072#1082#1088#1099#1090#1099#1077
        TabOrder = 3
      end
      object rbAll: TRadioButton
        Left = 269
        Top = 26
        Width = 43
        Height = 17
        Caption = #1042#1089#1077
        TabOrder = 4
      end
      object BitBtn1: TBitBtn
        Left = 348
        Top = 11
        Width = 88
        Height = 30
        Action = acFilter
        Caption = #1054#1090#1086#1073#1088#1072#1090#1100
        TabOrder = 5
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF008080800080808000FFFF
          FF00FFFFFF008080800080808000808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF000000FF000000FF00808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF000000FF000000FF00808080008080800000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF008080800080800000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000000000000FFFFFF0080808000808000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000000000000FFFFFF0080808000808000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF00FF00FF008000000080800000FFFFFF0080808000808000000000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF000000000080800000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          000080800000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008080000080800000FFFFFF00FFFFFF00C0C0C000C0C0C0008080
          80008080000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00008080000080808000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C000808080008080000080800000FF00FF00FF00FF00FF00FF00FF00FF008080
          000080800000C0C0C000C0C0C000FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
          C000C0C0C000808000008080000000000000FF00FF00FF00FF00FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00}
      end
      object rxcbPBE: TComboBox
        Left = 136
        Top = 12
        Width = 130
        Height = 21
        AutoDropDown = True
        ItemHeight = 13
        Sorted = True
        TabOrder = 6
        OnExit = rxcbPBEExit
        Items.Strings = (
          #1048#1078#1084#1072
          #1050#1086#1089#1083#1072#1085
          #1059'-'#1062#1080#1083#1100#1084#1072)
      end
      object lcAF: TRxDBLookupCombo
        Left = 271
        Top = 47
        Width = 157
        Height = 21
        DropDownCount = 8
        DisplayEmpty = '<'#1042#1089#1077' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'>'
        EmptyValue = '0'
        LookupField = 'rn'
        LookupDisplay = 'faceacc'
        LookupSource = dsAF_Filter
        TabOrder = 7
      end
    end
    object BitBtn2: TBitBtn
      Left = 453
      Top = 10
      Width = 100
      Height = 30
      Action = acUnload
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF000000
        000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF000000
        000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF000000
        000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF000000000000000000FF00FF00FF00FF000000
        000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF000000000000000000FFFFFF000000000000000000FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00
        FF000000000000000000FF00FF00FF00FF000000000000000000FFFFFF000000
        000000000000FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000FFFF0000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000FFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF00000000000000000000000000000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF00FFFFFF00FFFFFF000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FFFFFF000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object OracleNavigator1: TOracleNavigator
      Left = 9
      Top = 100
      Width = 280
      Height = 21
      DataSource = dsPayorder
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 453
      Top = 42
      Width = 100
      Height = 30
      Action = acLoad
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 3
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FF000000FF000000FF00
        0000FF000000FF000000FF000000FF00000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF0000FFFF0000FFFF
        0000FFFF0000FFFF0000FFFF0000FFFF000000000000FF00FF00FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FF00
        0000FF000000FFFF0000FFFF0000FFFF00000000000080000000FF00FF00FFFF
        FF00FF000000FFFFFF00FF0000000000000000000000FFFF0000FFFF0000FF00
        0000FF000000FF000000FFFF0000FFFF00000000000080000000FF00FF00FFFF
        FF00FF000000FFFFFF00FF0000000000000000000000FF000000FF000000FF00
        0000FF000000FF000000FF000000FFFF00000000000080000000FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FF00
        0000FF000000FFFF0000FFFF0000FFFF00000000000080000000FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000FFFF0000FF00
        0000FF000000FFFF0000FFFF0000FFFF00000000000080000000FF00FF00FFFF
        FF00FF000000FFFFFF00FF000000FF000000000000000000000000000000FF00
        0000FF000000FFFF000000000000000000000000000080000000FF00FF00FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FF00FF00FF00
        0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FF000000FF000000FFFFFF00FFFFFF00FFFFFF0080000000FF00FF00FF00
        0000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FF000000FF00
        00000000000080808000FF000000FF000000FFFFFF00FF000000FF0000000000
        FF000000FF000000FF00FFFFFF00FFFFFF0080000000FF00FF00FF00FF00FF00
        0000FF00000000000000FF000000800000008000000080000000800000008000
        0000800000008000000080000000FF00FF00FF00FF00FF00FF00FF000000FF00
        0000FF000000FF000000FF00000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        0000FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 124
    Width = 723
    Height = 367
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 156
      Top = 1
      Height = 362
    end
    object mLog: TMemo
      Left = 1
      Top = 1
      Width = 155
      Height = 362
      Align = alLeft
      TabOrder = 0
    end
    object DBGridEh1: TDBGridEh
      Left = 159
      Top = 1
      Width = 563
      Height = 362
      Align = alClient
      DataSource = dsPayorder
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'SPBE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
        end
        item
          AlwaysShowEditButton = True
          AutoDropDown = True
          EditButtons = <>
          FieldName = 'FaceAcc'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 212
        end
        item
          EditButtons = <>
          FieldName = 'SNUMB'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
        end
        item
          EditButtons = <>
          FieldName = 'DDATE'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'NSUMM'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end
        item
          EditButtons = <>
          FieldName = 'NSUMM_EX'
          Footers = <>
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'NSTATUS'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 42
        end>
    end
  end
  object oraParus: TOracleSession
    LogonUsername = 'pvz'
    LogonDatabase = 'P5'
    OptimizerGoal = ogRule
    Left = 20
    Top = 143
  end
  object oraPayOrder: TOracleDataSet
    SQL.Strings = (
      
        'SELECT  /*+ RULE */  rowid,NFACEACC_RN, SNUMB, DDATE, NSUMM, NSU' +
        'MM_EX, NSTATUS, SPBE FROM RUI_PAYORDER'
      'where 1=1'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      04000000070000000B0000004E464143454143435F524E010000000000050000
      00534E554D42010000000000050000004444415445010000000000050000004E
      53554D4D010000000000080000004E53554D4D5F455801000000000007000000
      4E5354415455530100000000000400000053504245010000000000}
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Session = oraParus
    BeforeInsert = oraPayOrderBeforeInsert
    AfterInsert = oraPayOrderAfterInsert
    BeforePost = oraPayOrderBeforePost
    BeforeDelete = oraPayOrderBeforeDelete
    Left = 80
    Top = 144
    object oraPayOrderNFACEACC_RN: TFloatField
      FieldName = 'NFACEACC_RN'
    end
    object oraPayOrderSNUMB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'SNUMB'
      Size = 25
    end
    object oraPayOrderDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DDATE'
    end
    object oraPayOrderNSUMM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'NSUMM'
      DisplayFormat = '### ###.00'
    end
    object oraPayOrderNSUMM_EX: TFloatField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1077#1085#1086
      FieldName = 'NSUMM_EX'
      DisplayFormat = '### ###.00'
    end
    object oraPayOrderNSTATUS: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'NSTATUS'
    end
    object oraPayOrderFaceAcc: TStringField
      DisplayLabel = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
      FieldKind = fkLookup
      FieldName = 'FaceAcc'
      LookupDataSet = oraAgnFaceAcc
      LookupKeyFields = 'RN'
      LookupResultField = 'FACEACC'
      KeyFields = 'NFACEACC_RN'
      Lookup = True
    end
    object oraPayOrderSPBE: TStringField
      DisplayLabel = #1055#1041#1045
      FieldName = 'SPBE'
      Size = 25
    end
  end
  object oraAgnFaceAcc: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'FA.RN, '
      'AG.AGNABBR || '#39' | '#39' || FA.NUMB AS faceacc'
      'FROM'
      'FACEACC FA,'
      'AGNLIST AG'
      'WHERE FA.AGENT = AG.RN(+) '
      
        '--AND fa.cRN IN (SELECT rn FROM acatalog c CONNECT BY PRIOR rn=c' +
        'rn START WITH trim(c.NAME)='#39#1048#1078#1084#1072#39')'
      'ORDER BY AG.AGNABBR')
    QBEDefinition.QBEFieldDefs = {
      040000000300000002000000524E010000000000070000004641434541434301
      00000000000700000041474E41424252010000000000}
    Session = oraParus
    Left = 80
    Top = 193
  end
  object dsPayorder: TDataSource
    DataSet = oraPayOrder
    Left = 136
    Top = 144
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 616
    Top = 129
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      ImageIndex = 2
      OnExecute = acFilterExecute
    end
    object acUnload: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
      ImageIndex = 4
      OnExecute = acUnloadExecute
    end
    object acLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      ImageIndex = 5
      OnExecute = acLoadExecute
    end
    object acXLS: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1092#1086#1088#1084#1099
      ImageIndex = 0
      OnExecute = acXLSExecute
    end
  end
  object oraPay_OUT: TOracleDataSet
    SQL.Strings = (
      
        'SELECT /*+ RULE */ nrn,NFACEACC_RN, SNUMB, DDATE, NSUMM, NSUMM_E' +
        'X, NSTATUS FROM RUI_PAYORDER'
      'where 1=1'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    QBEDefinition.QBEFieldDefs = {
      0400000008000000030000004E524E0100000000000B0000004E464143454143
      435F524E01000000000005000000534E554D4201000000000005000000444441
      5445010000000000050000004E53554D4D010000000000080000004E53554D4D
      5F4558010000000000060000004E5354415445010000000000070000004E5354
      41545553010000000000}
    RefreshOptions = [roAfterInsert, roAfterUpdate]
    Session = oraParus
    Left = 304
    Top = 144
  end
  object adoCordIns: TADOQuery
    Connection = adoConn
    Parameters = <>
    Left = 188
    Top = 145
  end
  object adoConn: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=pf;Ex' +
      'tended Properties="DSN=pf;UID=;SourceDB=c:\Borland\projs\parus\p' +
      'ech\output\;SourceType=DBF;Exclusive=No;BackgroundFetch=Yes;Coll' +
      'ate=Machine;Null=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 248
    Top = 144
  end
  object pay_upd: TOracleQuery
    SQL.Strings = (
      'update rui_payorder set nstate=1 where nrn=:nrn1')
    Session = oraParus
    Variables.Data = {0300000001000000050000003A4E524E31030000000000000000000000}
    Left = 360
    Top = 145
  end
  object RegPropStorageManEh1: TRegPropStorageManEh
    Path = 'Load'
    Left = 560
    Top = 128
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'ttn_igma'
    StorageManager = RegPropStorageManEh1
    StoredProps.Strings = (
      'Panel1.GroupBox1.edPath.<P>.Text')
    Left = 560
    Top = 176
  end
  object adoPay: TADODataSet
    Connection = adoConn
    Parameters = <>
    Left = 184
    Top = 193
  end
  object pay_execute: TOracleQuery
    SQL.Strings = (
      'update rui_payorder set nsumm_ex=:ex where nrn=:nrn1')
    Session = oraParus
    Variables.Data = {
      0300000002000000050000003A4E524E31030000000000000000000000030000
      003A4558040000000000000000000000}
    Left = 360
    Top = 193
  end
  object oraAF_Filter: TOracleDataSet
    SQL.Strings = (
      'SELECT /*+ RULE */'
      'DISTINCT FA.RN, '
      'AG.AGNABBR || '#39' | '#39' || FA.NUMB AS faceacc'
      'FROM'
      'FACEACC FA,'
      'AGNLIST AG,'
      'RUI_PAYORDER pay'
      'WHERE pay.NFACEACC_RN=fa.RN '
      'AND FA.AGENT = AG.RN(+) '
      'ORDER BY AG.AGNABBR || '#39' | '#39' || FA.NUMB')
    Session = oraParus
    Left = 64
    Top = 276
  end
  object dsAF_Filter: TDataSource
    DataSet = oraAF_Filter
    Left = 64
    Top = 324
  end
end
