object f_ParusLog: Tf_ParusLog
  Left = 198
  Top = 196
  Width = 1073
  Height = 589
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 543
    Width = 1065
    Height = 19
    Panels = <
      item
        Width = 180
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1065
    Height = 543
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1057
        Height = 44
        Align = alTop
        Caption = ' '#1060#1080#1083#1100#1090#1088' '
        TabOrder = 0
        object Label3: TLabel
          Left = 222
          Top = 18
          Width = 76
          Height = 13
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
        end
        object Label1: TLabel
          Left = 4
          Top = 18
          Width = 6
          Height = 13
          Caption = #1089
        end
        object Label2: TLabel
          Left = 107
          Top = 18
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object lc_user: TRxDBLookupCombo
          Left = 304
          Top = 14
          Width = 235
          Height = 21
          DropDownCount = 8
          LookupField = 'AUTHID'
          LookupDisplay = 'NAME'
          LookupSource = ds_user
          TabOrder = 0
        end
        object Date1: TDateTimePicker
          Left = 19
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 1
        end
        object Date2: TDateTimePicker
          Left = 131
          Top = 13
          Width = 82
          Height = 22
          Date = 37088.641009456000000000
          Time = 37088.641009456000000000
          TabOrder = 2
        end
        object Button1: TButton
          Left = 552
          Top = 13
          Width = 75
          Height = 25
          Action = acPodachaRefresh
          TabOrder = 3
        end
        object rbNow: TRadioButton
          Left = 656
          Top = 16
          Width = 113
          Height = 17
          Caption = #1042#1095#1077#1088#1072'-'#1089#1077#1075#1086#1076#1085#1103
          Checked = True
          TabOrder = 4
          TabStop = True
        end
        object rbArh: TRadioButton
          Left = 776
          Top = 16
          Width = 113
          Height = 17
          Caption = #1040#1088#1093#1080#1074
          TabOrder = 5
        end
      end
      object GridPod: TDBGridEh
        Left = 0
        Top = 44
        Width = 1057
        Height = 471
        Align = alClient
        DataSource = ds_log
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        FooterRowCount = 1
        FrozenCols = 2
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind]
        ParentFont = False
        PopupMenu = PopupMenu
        ReadOnly = True
        RowSizingAllowed = True
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        OnGetCellParams = GridPodGetCellParams
        OnSortMarkingChanged = GridPodSortMarkingChanged
        Columns = <
          item
            EditButtons = <>
            FieldName = 'RN'
            Footers = <>
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Width = 127
          end
          item
            EditButtons = <>
            FieldName = 'MODIFDATE'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'OPER'
            Footers = <>
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'TABLENOTE'
            Footers = <>
            Width = 304
          end
          item
            EditButtons = <>
            FieldName = 'NOTE'
            Footers = <>
            Width = 216
          end
          item
            EditButtons = <>
            FieldName = 'OSUSER'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'MACHINE'
            Footers = <>
            Width = 204
          end>
      end
    end
  end
  object sesParus: TOracleSession
    DesignConnection = True
    LogonUsername = 'vaneev'
    LogonPassword = 'zpsbwv'
    LogonDatabase = 'P5.WORLD'
    Connected = True
    Left = 335
    Top = 265
  end
  object q_log: TOracleDataSet
    SQL.Strings = (
      'select '
      '  a.RN,'
      '  u.NAME,'
      '  a.MODIFDATE,'
      '  (CASE'
      '     WHEN a.OPERATION='#39'I'#39' THEN '#39#1044#1086#1073#1072#1074#1080#1083#39
      '     WHEN a.OPERATION='#39'U'#39' THEN '#39#1048#1079#1084#1077#1085#1080#1083#39
      '     WHEN a.OPERATION='#39'D'#39' THEN '#39#1059#1076#1072#1083#1080#1083#39
      #9' ELSE '#39'?'#39
      '   END) as OPER,'#9' '
      '  t.tablenote,'
      '  a.note,'
      '  a.OSUSER,'
      '  a.MACHINE'
      'from '
      '  updatelist a'
      ', tablelist t, userlist u'
      'where a.TABLENAME=t.TABLENAME'
      '  AND a.AUTHID=u.AUTHID'
      '  and a.authid=:AUTHID'
      '  and a.modifdate>=:BEG_DATE'
      '  and a.modifdate<=:END_DATE'
      
        '  and a.TABLENAME IN ('#39'CONTRACTS'#39','#39'STAGES'#39','#39'FACEACC'#39','#39'CONSUMEROR' +
        'D'#39','#39'INCOMEFROMDEPS'#39','#39'INORDERS'#39','#39'PAYACC'#39','#39'SHEEPDIRSCUST'#39','#39'SHEEPDI' +
        'RSDEPT'#39','#39'TRANSINVCUST'#39','#39'TRANSINVDEPT'#39','
      
        '      '#39'WROFFACTS'#39','#39'BANKDOCS'#39','#39'CASHDOCS'#39','#39'AGREEMENT'#39','#39'DICACCFO'#39','#39 +
        'DICACCFI'#39','#39'SALESREPORTMAIN'#39','#39'AZSSREPORTMAIN'#39','#39'RLINVSHEET'#39')'
      'order by RN desc')
    Variables.Data = {
      0300000003000000090000003A454E445F444154450C0000000700000078690C
      1F01010100000000070000003A415554484944050000000A0000005354455041
      5359554B0000000000090000003A4245475F444154450C000000070000007869
      0C0101010100000000}
    QBEDefinition.QBEFieldDefs = {
      030000000800000002000000524E0100000000040000004E414D450100000000
      090000004D4F444946444154450100000000040000004F504552010000000009
      0000005441424C454E4F54450100000000040000004E4F544501000000000600
      00004F53555345520100000000070000004D414348494E450100000000}
    ReadOnly = True
    QueryAllRecords = False
    Session = sesParus
    Active = True
    BeforeOpen = q_logBeforeOpen
    AfterOpen = q_logAfterOpen
    Left = 507
    Top = 161
    object q_logRN: TFloatField
      FieldName = 'RN'
      Required = True
    end
    object q_logNAME: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'NAME'
      Required = True
      Size = 40
    end
    object q_logMODIFDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'MODIFDATE'
      Required = True
    end
    object q_logOPER: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldName = 'OPER'
      Size = 7
    end
    object q_logTABLENOTE: TStringField
      DisplayLabel = #1058#1072#1073#1083#1080#1094#1072
      FieldName = 'TABLENOTE'
      Size = 80
    end
    object q_logNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTE'
      Required = True
      Size = 2000
    end
    object q_logOSUSER: TStringField
      DisplayLabel = 'Login'
      FieldName = 'OSUSER'
      Size = 30
    end
    object q_logMACHINE: TStringField
      DisplayLabel = #1052#1072#1096#1080#1085#1072
      FieldName = 'MACHINE'
      Size = 64
    end
  end
  object ds_log: TDataSource
    DataSet = q_log
    Left = 507
    Top = 205
  end
  object FormStorage1: TFormStorage
    UseRegistry = True
    StoredValues = <>
    Left = 191
    Top = 165
  end
  object q_user: TOracleDataSet
    SQL.Strings = (
      'select authid,name from userlist'
      'order by name')
    QBEDefinition.QBEFieldDefs = {
      0300000002000000060000004155544849440100000000040000004E414D4501
      00000000}
    Session = sesParus
    Left = 543
    Top = 161
    object q_userAUTHID: TStringField
      FieldName = 'AUTHID'
      Required = True
      Size = 30
    end
    object q_userNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 40
    end
  end
  object ds_user: TDataSource
    DataSet = q_user
    Left = 543
    Top = 205
  end
  object ActionManager1: TActionManager
    ActionBars.SessionCount = 45
    ActionBars = <
      item
        AutoSize = False
      end
      item
        Items = <
          item
            Caption = '&Common'
          end>
        AutoSize = False
      end>
    Images = f_main.img_Common
    Left = 59
    Top = 181
    StyleName = 'XP Style'
    object acPodachaToXLS: TAction
      Category = 'FOR_ALL'
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      OnExecute = acPodachaToXLSExecute
    end
    object acPodachaRefresh: TAction
      Category = 'FOR_ALL'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      ShortCut = 119
      OnExecute = acPodachaRefreshExecute
    end
  end
  object ImageList1: TImageList
    Left = 247
    Top = 125
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000001042000000420042000000000042
      0042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000004210420000004200420000
      0000004200420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000100010001000
      0000000010420042004200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000001F001F001F001F00
      1F00100000001042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000010001F001F001F001F00
      1F001F0010000000104200420042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F001F001F001F001F00
      1F001F001000100000001042000000000000000000001F001F001F001F001F00
      1F001F0010001000000010420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F00FF7F1F001F001F00
      1F001F001000100010000000000000420042000000001F00FF7F1F001F001F00
      1F001F0010001000100000000000004200420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001000FF7F1F001F001F00
      1F0010001F00100010001000000000000000000000001000FF7F1F001F001F00
      1F0010001F001000100010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000001F00FF7FFF7F1F00
      1F001F0010001F00100010001000000010420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010001F001000
      1F001F001F0010001F001000100000000000000000000000000010001F001000
      1F001F001F0010001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000001000
      100010001F001F0010001F001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000001F00
      1F001F001F001F001F0010001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      000000001F001F001F0010000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      00000000FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000FF00FF0000000099FF99FF00000000
      803F803F00000000C47FC47F00000000C00FC00F00000000E01FE01F00000000
      C003C00300000000C007C00700000000C000C00000000000C001C00100000000
      E000E00000000000F001F00100000000FC03FC0300000000FC03FC0300000000
      FC07FC0700000000FF87FF870000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 196
    Top = 121
  end
  object PopupMenu: TTBPopupMenu
    Images = ImageList1
    Left = 395
    Top = 173
    object TBItem9: TTBItem
      Action = acPodachaToXLS
    end
  end
  object ParusLogon: TOracleLogon
    Session = sesParus
    Retries = 5
    Options = [ldDatabase, ldDatabaseList, ldLogonHistory]
    HistoryRegSection = 'Software\SNP\Master\LogonHistory'
    HistoryWithPassword = True
    Caption = #1048#1084#1103' '#1080' '#1055#1072#1088#1086#1083#1100' '#1074' '#1057#1080#1089#1090#1077#1084#1077' "'#1055#1072#1088#1091#1089'"'
    Left = 408
    Top = 257
  end
end
