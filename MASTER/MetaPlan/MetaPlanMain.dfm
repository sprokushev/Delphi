object f_MetaPlanSetup: Tf_MetaPlanSetup
  Left = 203
  Top = 108
  Width = 744
  Height = 547
  Caption = 'f_MetaPlanSetup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 501
    Width = 736
    Height = 19
    Panels = <>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 736
    Height = 501
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      object oTree: TTreeView
        Left = 0
        Top = 23
        Width = 728
        Height = 450
        Align = alClient
        DragMode = dmAutomatic
        Indent = 19
        TabOrder = 0
      end
      object TBDock1: TTBDock
        Left = 0
        Top = 0
        Width = 728
        Height = 23
        object TBToolbar1: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar1'
          DefaultDock = TBDock1
          TabOrder = 0
          object TBItem1: TTBItem
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            OnClick = TBItem1Click
          end
          object TBItem2: TTBItem
            Caption = #1059#1076#1072#1083#1080#1090#1100
            OnClick = TBItem2Click
          end
          object TBItem3: TTBItem
            Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
            OnClick = TBItem3Click
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1090#1088#1091#1082#1090#1091#1088#1072' '#1080#1079#1076#1077#1088#1078#1077#1082
      ImageIndex = 1
      object zTree: TTreeView
        Left = 0
        Top = 23
        Width = 728
        Height = 450
        Align = alClient
        Indent = 19
        TabOrder = 0
      end
      object TBDock2: TTBDock
        Left = 0
        Top = 0
        Width = 728
        Height = 23
        object TBToolbar2: TTBToolbar
          Left = 0
          Top = 0
          Caption = 'TBToolbar2'
          TabOrder = 0
          object TBItem4: TTBItem
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            OnClick = TBItem4Click
          end
          object TBItem5: TTBItem
            Caption = #1059#1076#1072#1083#1080#1090#1100
            OnClick = TBItem5Click
          end
          object TBItem6: TTBItem
            Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100
            OnClick = TBItem6Click
          end
        end
      end
    end
  end
  object DB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=MetaP' +
      'lan'
    LoginPrompt = False
    Left = 588
    Top = 85
  end
  object ActionList1: TActionList
    Left = 460
    Top = 200
    object ReFreshOrganization: TAction
      Caption = 'ReFreshOrganization'
      OnExecute = ReFreshOrganizationExecute
    end
    object ReFreshExpense: TAction
      Caption = 'ReFreshExpense'
      OnExecute = ReFreshExpenseExecute
    end
  end
end
