object frmWhat: TfrmWhat
  Left = 189
  Top = 218
  Width = 780
  Height = 422
  Caption = #1063#1090#1086' '#1047#1072#1082#1072#1095#1072#1085#1086'?'
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
    Width = 772
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 7
      Top = 39
      Width = 6
      Height = 13
      Caption = #1089
    end
    object Label3: TLabel
      Left = 113
      Top = 40
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object deBeg: TDateEdit
      Left = 17
      Top = 35
      Width = 95
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 0
      Text = '17.03.2003'
    end
    object deEnd: TDateEdit
      Left = 129
      Top = 35
      Width = 99
      Height = 21
      DefaultToday = True
      NumGlyphs = 2
      TabOrder = 1
      Text = '17.03.2003'
    end
    object BitBtn1: TBitBtn
      Left = 244
      Top = 33
      Width = 99
      Height = 25
      Action = acFilter
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      TabOrder = 2
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
    object cbTypeDoc: TComboBoxEx
      Left = 17
      Top = 8
      Width = 185
      Height = 22
      ItemsEx = <
        item
          Caption = #1047#1072#1103#1074#1082#1080' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        end
        item
          Caption = #1047#1072#1103#1074#1082#1080' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081
        end
        item
          Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1086#1088#1076#1077#1088#1072
        end
        item
          Caption = #1046'\'#1044' '#1054#1088#1076#1077#1088#1072
        end
        item
          Caption = #1058#1058#1053' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
        end
        item
          Caption = #1058#1058#1053' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081' ('#1046#1044')'
        end
        item
          Caption = #1058#1058#1053' '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1077#1081' ('#1055#1088#1086#1076#1091#1082#1090')'
        end
        item
          Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1074#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1077
        end
        item
          Caption = #1058#1058#1053' '#1074#1086#1079#1085#1072#1075#1088#1072#1078#1076#1077#1085#1080#1077
        end>
      ItemHeight = 16
      TabOrder = 3
      Text = '<'#1042#1099#1073#1080#1088#1080#1090#1077' '#1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'>'
      DropDownCount = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 772
    Height = 326
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 186
      Top = 1
      Height = 321
    end
    object DBGridEh1: TDBGridEh
      Left = 189
      Top = 1
      Width = 582
      Height = 321
      Align = alClient
      AllowedOperations = [alopDeleteEh]
      DataSource = dsWhat
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clScrollBar
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight]
      ParentFont = False
      PopupMenu = PopupMenu1
      RowHeight = 4
      RowLines = 1
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = DBGridEh1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'MONTH_ID'
          Footer.Color = clWindow
          Footer.Value = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SVED_NUM'
          Footer.Color = clWindow
          Footer.FieldName = 'ID'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DATE_KVIT'
          Footer.Color = clWindow
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'AUTHID'
          Footer.Color = clWindow
          Footers = <>
          Title.TitleButton = True
        end>
    end
    object mLog: TMemo
      Left = 1
      Top = 1
      Width = 185
      Height = 321
      Align = alLeft
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
  end
  object oraWhat: TOracleDataSet
    SQL.Strings = (
      'select /*+ ORDERED*/ rowid,'
      ' KVIT_ID,  TASK,  RN,  SUBTASK,  MONTH_ID,  STATUS,  FACEACC_RN,'
      ' AUTHID,  ID,  SVED_NUM,  DATE_KVIT'
      'from parus_fin where 1=1'
      ''
      ''
      ''
      'order by kvit_id')
    QBEDefinition.QBEFieldDefs = {
      040000000B00000002000000494401000000000008000000535645445F4E554D
      01000000000009000000444154455F4B564954010000000000070000004B5649
      545F4944010000000000040000005441534B01000000000002000000524E0100
      00000000070000005355425441534B010000000000080000004D4F4E54485F49
      44010000000000060000005354415455530100000000000A0000004641434541
      43435F524E01000000000006000000415554484944010000000000}
    Session = oraMain
    BeforeDelete = oraWhatBeforeDelete
    Left = 64
    Top = 168
    object oraWhatKVIT_ID: TFloatField
      FieldName = 'KVIT_ID'
    end
    object oraWhatTASK: TStringField
      FieldName = 'TASK'
      Size = 40
    end
    object oraWhatRN: TFloatField
      FieldName = 'RN'
    end
    object oraWhatSUBTASK: TFloatField
      FieldName = 'SUBTASK'
    end
    object oraWhatMONTH_ID: TStringField
      DisplayLabel = #1047#1072#1103#1074#1082#1072
      FieldName = 'MONTH_ID'
      Size = 12
    end
    object oraWhatSTATUS: TFloatField
      FieldName = 'STATUS'
    end
    object oraWhatFACEACC_RN: TFloatField
      FieldName = 'FACEACC_RN'
    end
    object oraWhatAUTHID: TStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'AUTHID'
      Size = 30
    end
    object oraWhatID: TFloatField
      FieldName = 'ID'
    end
    object oraWhatSVED_NUM: TFloatField
      DisplayLabel = #1057#1074#1077#1076#1077#1085#1080#1077
      FieldName = 'SVED_NUM'
    end
    object oraWhatDATE_KVIT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DATE_KVIT'
    end
  end
  object dsWhat: TDataSource
    DataSet = oraWhat
    Left = 104
    Top = 168
  end
  object oraMain: TOracleSession
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'BUH'
    Left = 16
    Top = 169
  end
  object ActionManager1: TActionManager
    Images = frmMain.ImageList1
    Left = 40
    Top = 216
    StyleName = 'XP Style'
    object acFilter: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1090#1100
      ImageIndex = 2
      OnExecute = acFilterExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 32
    object N1: TMenuItem
      Action = acFilter
    end
  end
end
