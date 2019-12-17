object f_MoveVagon: Tf_MoveVagon
  Left = 202
  Top = 173
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1074#1072#1075#1086#1085#1072
  ClientHeight = 546
  ClientWidth = 742
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridSource: TDBGridEh
    Left = 0
    Top = 26
    Width = 742
    Height = 520
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
    PopupMenu = popMoveVagon
    ReadOnly = True
    RowSizingAllowed = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = GridSourceDblClick
    OnKeyPress = GridSourceKeyPress
    Columns = <
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #8470' '#1087'/'#1087
        Width = 33
        OnGetCellParams = GridSourceColumns0GetCellParams
      end>
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 26
    ActionManager = amMoveVagon
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object q_Source: TOracleDataSet
    UniqueFields = 'ID'
    BeforeOpen = q_SourceBeforeOpen
    AfterOpen = q_SourceAfterOpen
    OnFilterRecord = q_SourceFilterRecord
    Left = 24
    Top = 464
  end
  object ds_Source: TDataSource
    DataSet = q_Source
    Left = 104
    Top = 464
  end
  object amMoveVagon: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acSelDoc
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
    Left = 192
    Top = 464
    StyleName = 'XP Style'
    object acSelDoc: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 52
      OnExecute = acSelDocExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 5
      OnExecute = acCloseExecute
    end
  end
  object popMoveVagon: TTBPopupMenu
    Images = f_main.img_Common
    Left = 288
    Top = 464
    object TBItem1: TTBItem
      Action = acSelDoc
      DisplayMode = nbdmImageAndText
      Images = f_main.img_Common
    end
    object TBItem2: TTBItem
      Action = acClose
      DisplayMode = nbdmImageAndText
      Images = f_main.img_Common
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object TBEditItem1: TTBEditItem
      Caption = #1060#1080#1083#1100#1090#1088
      OnAcceptText = TBEditItem1AcceptText
    end
    object TBItem4: TTBItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1084#1091
      OnClick = TBItem4Click
    end
    object TBItem5: TTBItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      OnClick = TBItem5Click
    end
  end
end
