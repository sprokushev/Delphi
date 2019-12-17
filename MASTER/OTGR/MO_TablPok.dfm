object f_TablPok: Tf_TablPok
  Left = 289
  Top = 227
  Width = 774
  Height = 640
  ActiveControl = GridTitle
  Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1087#1072#1089#1087#1086#1088#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000EEEEEEE00000E00000EEEEEEEEEEE00000E
    EE000000EEE000000EEEEEEE00000000E0000000EEE0000000EEEEE000000000
    E000000EEEE0000000EEEEE000000000E000000EEEEE000000EEEEE000000000
    E000000EEEEE000000EEEEE000000000E00000EEEEEEE00000EEEEE000000000
    E00000EEEEE0E00000EEEEE000000000E0000EEEEEE0E00000EEEEE000000000
    E0000EEEEE000E0000EEEEE000000000E0000EEEEE000E0000EEEEE000000000
    E000EEEEEE0000E000EEEEE000000000E000EEEEE00000E000EEEEE000000000
    E00EEEEEE00000E000EEEEE000000000E00EEEEE0000000E00EEEEE000000000
    E0EEEEEE0000000E00EEEEE000000000E0EEEEE000000000E0EEEEE000000000
    E0EEEEE000000000E0EEEEE000000000EEEEEEE0000000000EEEEEE00000000E
    EEEEEE00000000000EEEEEEE00000EEEEEEEEE000000000000EEEEEEEE000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFF80FBE003E3F1F80FF7F1FC1FF7E1FC1FF7E0FC1FF7E0
    FC1FF7C07C1FF7C17C1FF7817C1FF783BC1FF783BC1FF703DC1FF707DC1FF607
    DC1FF60FEC1FF40FEC1FF41FF41FF41FF41FF01FF81FE03FF80F803FFC03FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 316
    Top = 34
    Width = 4
    Height = 579
  end
  object GridTitle: TDBGridEh
    Left = 0
    Top = 34
    Width = 316
    Height = 579
    Align = alLeft
    DataSource = ds_title
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = GridTitleEnter
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME_NPR'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1077#1092#1090#1077#1087#1088#1086#1076#1091#1082#1090
        Width = 293
      end>
  end
  object gridRows: TDBGridEh
    Left = 320
    Top = 34
    Width = 446
    Height = 579
    Align = alClient
    DataSource = ds_rows
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = gridRowsEnter
    OnKeyDown = gridRowsKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
        Width = 221
      end
      item
        EditButtons = <>
        FieldName = 'NORMTU'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1088#1084#1072' '#1087#1086' '#1058#1059
        Width = 89
      end
      item
        EditButtons = <>
        FieldName = 'NPP'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1087'/'#1087
      end
      item
        EditButtons = <>
        FieldName = 'SORTBY'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'SortBy'
      end>
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 766
    Height = 34
    ActionManager = amTablPok
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object lcCopyProd: TRxDBLookupCombo
    Left = 320
    Top = 6
    Width = 441
    Height = 21
    DropDownCount = 8
    LookupField = 'ID_NPR'
    LookupDisplay = 'NAME_NPR'
    LookupSource = ds_prod
    TabOrder = 2
    OnChange = lcCopyProdChange
  end
  object amTablPok: TActionManager
    ActionBars = <
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = acFirstRecord
            Caption = 'ac&FirstRecord'
            ImageIndex = 30
          end
          item
            Action = acPrevRecord
            Caption = 'ac&PrevRecord'
            ImageIndex = 29
          end
          item
            Action = acNextRecord
            Caption = 'ac&NextRecord'
            ImageIndex = 32
          end
          item
            Action = acLastRecord
            Caption = 'ac&LastRecord'
            ImageIndex = 31
          end
          item
            Caption = '-'
          end
          item
            Action = acAddRecord
            Caption = '&acAddRecord'
            ImageIndex = 35
          end
          item
            Action = acDelRecord
            Caption = 'ac&DelRecord'
            ImageIndex = 34
          end
          item
            Caption = '-'
          end
          item
            Action = acPostTablPok
            Caption = 'a&cPostTablPok'
            ImageIndex = 36
          end>
      end
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = acFirstRecord
            Caption = '&acFirstRecord'
            ImageIndex = 30
          end
          item
            Action = acPrevRecord
            Caption = 'a&cPrevRecord'
            ImageIndex = 31
          end
          item
            Action = acNextRecord
            Caption = 'ac&NextRecord'
            ImageIndex = 32
          end
          item
            Action = acLastRecord
            Caption = 'ac&LastRecord'
            ImageIndex = 33
          end
          item
            Caption = '-'
          end
          item
            Action = acAddRecord
            Caption = 'acA&ddRecord'
            ImageIndex = 34
          end
          item
            Action = acDelRecord
            Caption = 'acD&elRecord'
            ImageIndex = 35
          end
          item
            Caption = '-'
          end
          item
            Action = acPostTablPok
            Caption = 'ac&PostTablPok'
            ImageIndex = 29
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.ImageXP
    Left = 40
    Top = 272
    StyleName = 'XP Style'
    object acLastRecord: TAction
      Caption = 'acLastRecord'
      ImageIndex = 33
      OnExecute = acLastRecordExecute
    end
    object acFirstRecord: TAction
      Caption = 'acFirstRecord'
      ImageIndex = 30
      OnExecute = acFirstRecordExecute
    end
    object acNextRecord: TAction
      Caption = 'acNextRecord'
      ImageIndex = 32
      OnExecute = acNextRecordExecute
    end
    object acPrevRecord: TAction
      Caption = 'acPrevRecord'
      ImageIndex = 31
      OnExecute = acPrevRecordExecute
    end
    object acDelRecord: TAction
      Caption = 'acDelRecord'
      ImageIndex = 35
      OnExecute = acDelRecordExecute
    end
    object acAddRecord: TAction
      Caption = 'acAddRecord'
      ImageIndex = 34
      OnExecute = acAddRecordExecute
    end
    object acPostTablPok: TAction
      Caption = 'acPostTablPok'
      ImageIndex = 29
      OnExecute = acPostTablPokExecute
    end
  end
  object q_title: TOracleDataSet
    SQL.Strings = (
      'select id_npr,name_npr,rowid from kls_prod'
      'where flg_allowed=1'
      'order by name_npr')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    Session = ora_Session
    AfterScroll = q_titleAfterScroll
    Left = 24
    Top = 144
    object q_titleID_NPR: TStringField
      FieldName = 'ID_NPR'
      Required = True
      Size = 5
    end
    object q_titleNAME_NPR: TStringField
      FieldName = 'NAME_NPR'
      Required = True
      Size = 40
    end
  end
  object q_rows: TOracleDataSet
    SQL.Strings = (
      
        'select kls_tablpok.*,kls_tablpok.rowid, kls_kodif.name from kls_' +
        'tablpok, kls_kodif'
      'where prod_id_npr=:PROD_ID_NPR'
      '  and kls_tablpok.kodif_id=kls_kodif.id(+)'
      'order by SORTBY')
    Variables.Data = {
      03000000010000000C0000003A50524F445F49445F4E50520500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      03000000070000000B00000050524F445F49445F4E5052010000000008000000
      4B4F4449465F49440100000000030000004E5050010000000006000000534F52
      5442590100000000060000004E4F524D545501000000000A0000004441544555
      504C4F41440100000000040000004E414D450100000000}
    UniqueFields = 'PROD_ID_NPR;KODIF_ID'
    Master = q_title
    MasterFields = 'id_npr'
    DetailFields = 'prod_id_npr'
    UpdatingTable = 'KLS_TABLPOK'
    Session = ora_Session
    AfterInsert = q_rowsAfterInsert
    AfterScroll = q_rowsAfterScroll
    Left = 152
    Top = 144
    object q_rowsPROD_ID_NPR: TStringField
      FieldName = 'PROD_ID_NPR'
      Required = True
      Size = 5
    end
    object q_rowsKODIF_ID: TIntegerField
      FieldName = 'KODIF_ID'
      Required = True
    end
    object q_rowsNPP: TIntegerField
      FieldName = 'NPP'
    end
    object q_rowsSORTBY: TIntegerField
      FieldName = 'SORTBY'
    end
    object q_rowsNORMTU: TStringField
      FieldName = 'NORMTU'
      Size = 50
    end
    object q_rowsDATEUPLOAD: TDateTimeField
      FieldName = 'DATEUPLOAD'
      Required = True
    end
    object q_rowsNAME: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = q_kodif
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'KODIF_ID'
      Size = 50
      Lookup = True
    end
  end
  object ds_title: TDataSource
    DataSet = q_title
    Left = 24
    Top = 192
  end
  object ds_rows: TDataSource
    DataSet = q_rows
    Left = 152
    Top = 192
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 249
    Top = 144
  end
  object q_kodif: TOracleDataSet
    SQL.Strings = (
      'select k.id,k.name from kls_kodif k')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000200000049440100000000040000004E414D450100000000}
    Session = ora_Session
    Left = 152
    Top = 272
  end
  object ds_kodif: TDataSource
    DataSet = q_kodif
    Left = 152
    Top = 328
  end
  object q_prod: TOracleDataSet
    SQL.Strings = (
      'select id_npr,name_npr,rowid from kls_prod'
      'where flg_allowed=1'
      'order by name_npr')
    QBEDefinition.QBEFieldDefs = {
      03000000020000000600000049445F4E50520100000000080000004E414D455F
      4E50520100000000}
    UniqueFields = 'ID_NPR'
    Session = ora_Session
    Left = 240
    Top = 272
  end
  object ds_prod: TDataSource
    DataSet = q_prod
    Left = 240
    Top = 328
  end
  object q_copy: TOracleDataSet
    SQL.Strings = (
      'select kls_tablpok.* from kls_tablpok'
      'where prod_id_npr=:ID_NPR'
      'order by SORTBY')
    Variables.Data = {0300000001000000070000003A49445F4E5052050000000000000000000000}
    Session = ora_Session
    Left = 152
    Top = 384
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState'
      'gridRows.<P>.Columns'
      'gridRows.<P>.Width')
    Left = 384
    Top = 144
  end
end
