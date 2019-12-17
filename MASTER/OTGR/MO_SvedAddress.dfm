object f_SvedAddress: Tf_SvedAddress
  Left = 322
  Top = 235
  BorderStyle = bsSingle
  Caption = #1040#1076#1088#1077#1089#1072#1094#1080#1103'/'#1055#1077#1088#1077#1072#1076#1088#1077#1089#1072#1094#1080#1103' '#1074#1072#1075#1086#1085#1086#1074' '
  ClientHeight = 292
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline frmNariad1: TfrmNariad
    Left = 0
    Top = 34
    Width = 742
    Height = 258
    Align = alClient
    AutoSize = True
    TabOrder = 0
    inherited DBGridEh1: TDBGridEh
      Width = 742
      Height = 258
      Align = alClient
      PopupMenu = TBPopupMenu1
      OnDblClick = frmNariad1DBGridEh1DblClick
      OnKeyPress = frmNariad1DBGridEh1KeyPress
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 34
    ActionManager = acmAD
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object TBPopupMenu1: TTBPopupMenu
    Images = f_main.img_Common
    Left = 560
    Top = 64
    object TBItem2: TTBItem
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      ImageIndex = 42
      Images = f_main.img_Common
      OnClick = TBItem2Click
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem1: TTBItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1087#1088#1086#1089#1072
      OnClick = TBItem1Click
    end
  end
  object acmAD: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Action = acAddr
            ImageIndex = 11
          end
          item
            Caption = '-'
          end
          item
            Action = acClose
            ImageIndex = 8
          end>
      end
      item
        Items = <
          item
            Action = acClose
            ImageIndex = 8
            ShowCaption = False
          end>
        AutoSize = False
      end
      item
        Items = <
          item
            Action = acAddr
            ImageIndex = 13
          end
          item
            Action = acClose
            ImageIndex = 8
          end>
      end
      item
        Items = <
          item
            Action = acClose
            ImageIndex = 8
          end
          item
            Action = acAddr
            ImageIndex = 13
          end>
      end
      item
        Items = <
          item
            Items = <
              item
                Action = acAddr
                ImageIndex = 13
              end
              item
                Action = acClose
                ImageIndex = 8
              end>
            Caption = #1054#1073#1097#1080#1077
          end>
      end
      item
        Items = <
          item
            Action = acClose
            ImageIndex = 8
          end
          item
            Action = acAddr
            ImageIndex = 13
          end>
      end
      item
        Items = <
          item
            Action = acAddr
            ImageIndex = 13
          end
          item
            Action = acClose
            ImageIndex = 8
          end>
      end
      item
        Items = <
          item
            Action = acAddr
            ImageIndex = 11
          end
          item
            Action = acNoAddr
            ImageIndex = 35
          end
          item
            Action = acClose
            ImageIndex = 8
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.ImageXP
    Left = 352
    Top = 136
    StyleName = 'XP Style'
    object acAddr: TAction
      Category = #1054#1073#1097#1080#1077
      Caption = #1055#1088#1080#1089#1074#1086#1080#1090#1100' '#8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      ImageIndex = 11
      OnExecute = acAddrExecute
    end
    object acNoAddr: TAction
      Category = #1054#1073#1097#1080#1077
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' '#8470' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1103
      ImageIndex = 35
      OnExecute = acNoAddrExecute
    end
    object acClose: TAction
      Category = #1054#1073#1097#1080#1077
      Caption = #1054#1089#1090#1072#1074#1080#1090#1100' '#1073#1077#1079' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      ImageIndex = 8
      OnExecute = acCloseExecute
    end
  end
  object PropStorageEh1: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 456
    Top = 144
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'xls'
    FileName = '*.xls'
    Filter = 'Excel files (*.xls)|*.xls'
    InitialDir = 'h:\'
    Left = 296
    Top = 96
  end
end
