object azsinfoF: TazsinfoF
  Left = 325
  Top = 189
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'azsinfoF'
  ClientHeight = 196
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 295
    Height = 196
    Align = alClient
  end
  object Label1: TLabel
    Left = 5
    Top = 3
    Width = 152
    Height = 16
    Alignment = taCenter
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1040#1047#1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ScrollBar1: TScrollBar
    Left = 3
    Top = 27
    Width = 159
    Height = 16
    PageSize = 0
    TabOrder = 4
    OnChange = ScrollBar1Change
  end
  object Panel1: TPanel
    Left = 3
    Top = 48
    Width = 290
    Height = 49
    TabOrder = 0
    object addressLabel: TLabel
      Left = 4
      Top = 4
      Width = 34
      Height = 13
      Caption = #1040#1076#1088#1077#1089':'
    end
    object telefonLabel: TLabel
      Left = 4
      Top = 17
      Width = 48
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085':'
    end
    object Label3: TLabel
      Left = 208
      Top = 32
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Label3'
    end
  end
  object Panel2: TPanel
    Left = 3
    Top = 98
    Width = 290
    Height = 96
    TabOrder = 1
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 288
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1086#1090#1095#1077#1090#1099':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TBDock1: TTBDock
      Left = 1
      Top = 17
      Width = 288
      Height = 24
      AllowDrag = False
      BoundLines = [blTop]
      object TBToolbar1: TTBToolbar
        Left = 0
        Top = 0
        Caption = 'TBToolbar1'
        TabOrder = 0
        object TBSubmenuItem1: TTBSubmenuItem
          Caption = #1054#1059#1055
          object TBSubmenuItem2: TTBSubmenuItem
            Caption = #1069#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1090#1099' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074
            object TBItem1: TTBItem
              Caption = #1047#1072' '#1101#1090#1091' '#1085#1077#1076#1077#1083#1102
              OnClick = TBItem1Click
            end
            object TBItem2: TTBItem
              Caption = #1047#1072' '#1087#1088#1086#1096#1083#1091#1102' '#1085#1077#1076#1077#1083#1102
              OnClick = TBItem2Click
            end
          end
        end
        object TBItem3: TTBItem
          Caption = #1054#1090#1087#1091#1089#1082' '#1040#1047#1057' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          OnClick = TBItem3Click
        end
        object TBItem4: TTBItem
          Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1040#1047#1057
          OnClick = TBItem4Click
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 3
    Top = 19
    Width = 289
    Height = 2
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 20
    Top = 26
    Width = 126
    Height = 18
    BevelOuter = bvLowered
    Caption = 'Panel4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
