object f_AddVagonVedPod: Tf_AddVagonVedPod
  Left = 250
  Top = 166
  Width = 750
  Height = 533
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086#1076#1072#1095#1080
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
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 199
    Width = 742
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 742
    Height = 34
    ActionManager = acmVP
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  inline frmNariad1: TfrmNariad
    Left = 0
    Top = 34
    Width = 742
    Height = 165
    Align = alTop
    AutoSize = True
    TabOrder = 1
    inherited DBGridEh1: TDBGridEh
      Width = 742
    end
  end
  object acmVP: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Caption = '-'
          end
          item
            Action = acMove
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
            Action = acMove
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
            Action = acMove
            ImageIndex = 13
          end>
      end
      item
        Items = <
          item
            Items = <
              item
                Action = acMove
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
            Action = acMove
            ImageIndex = 13
          end>
      end
      item
        Items = <
          item
            Action = acMove
            ImageIndex = 13
          end
          item
            Action = acClose
            ImageIndex = 8
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.ImageXP
    Left = 472
    Top = 280
    StyleName = 'XP Style'
    object acMove: TAction
      Category = #1054#1073#1097#1080#1077
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1089#1074#1077#1076#1077#1085#1080#1077
      ImageIndex = 13
      OnExecute = acMoveExecute
    end
    object acClose: TAction
      Category = #1054#1073#1097#1080#1077
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
    Left = 384
    Top = 144
  end
end
