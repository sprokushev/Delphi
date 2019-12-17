object f_FindPasp: Tf_FindPasp
  Left = 305
  Top = 166
  BorderStyle = bsSingle
  Caption = #1055#1086#1080#1089#1082' '#1087#1072#1089#1087#1086#1088#1090#1072
  ClientHeight = 618
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 769
    Height = 26
    ActionManager = amFindVagon
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Spacing = 0
  end
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 70
    Width = 769
    Height = 548
    Align = alClient
    DataSource = ds_Source
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
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind]
    ParentFont = False
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
    Columns = <
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #8470' '#1087'/'#1087
        Width = 33
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 26
    Width = 769
    Height = 44
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 17
      Width = 75
      Height = 13
      Caption = #1057#1090#1088#1086#1082#1072' '#1087#1086#1080#1089#1082#1072
    end
    object cbSearchStr: TComboBox
      Left = 95
      Top = 14
      Width = 641
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Memo1: TMemo
    Left = 88
    Top = 184
    Width = 577
    Height = 321
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object q_Source: TOracleDataSet
    Left = 88
    Top = 536
  end
  object amFindVagon: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acStarSearch
            ImageIndex = 1
          end
          item
            Action = acSelPosition
            ImageIndex = 52
          end
          item
            Caption = '-'
          end
          item
            Action = acClose
            ImageIndex = 5
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.img_Common
    Left = 184
    Top = 536
    StyleName = 'XP Style'
    object acStarSearch: TAction
      Caption = #1053#1072#1095#1072#1090#1100' '#1087#1086#1080#1089#1082
      ImageIndex = 1
    end
    object acSelPosition: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 52
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 5
    end
    object acToogleParentSQL: TAction
      Caption = 'ToogleParentSQL'
      ShortCut = 49235
    end
  end
  object q_Structure: TOracleDataSet
    SQL.Strings = (
      
        'select s.id,s.query,start_order,f.field_name,f.field_caption,f.f' +
        'ield_type'
      'from master_kls_structure s,master_kls_field_structure f'
      'where s.id=f.structure_id(+) '
      'AND s.id=:STRUCTURE')
    Variables.Data = {
      03000000010000000A0000003A53545255435455524505000000000000000000
      0000}
    Left = 296
    Top = 536
  end
  object ds_Source: TDataSource
    DataSet = q_Source
    Left = 496
    Top = 536
  end
  object pkgFor_temp_f: TOraclePackage
    PackageName = 'FOR_TEMP'
    Left = 384
    Top = 536
  end
end
