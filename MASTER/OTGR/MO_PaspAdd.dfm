object f_PaspAdd: Tf_PaspAdd
  Left = 266
  Top = 201
  Width = 711
  Height = 661
  HorzScrollBar.Visible = False
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1089#1087#1086#1088#1090#1072
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gb1: TGroupBox
    Left = 0
    Top = 26
    Width = 703
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 57
      Height = 13
      Caption = #1055#1072#1089#1087#1086#1088#1090' '#8470
    end
    object Label2: TLabel
      Left = 476
      Top = 16
      Width = 66
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
    end
    object Label3: TLabel
      Left = 229
      Top = 16
      Width = 73
      Height = 13
      Caption = #8470' '#1088#1077#1079#1077#1088#1074#1091#1072#1088#1072
    end
    object Label4: TLabel
      Left = 47
      Top = 50
      Width = 42
      Height = 13
      Caption = #1055#1088#1086#1076#1091#1082#1090
    end
    object Label5: TLabel
      Left = 10
      Top = 78
      Width = 79
      Height = 13
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
    end
    object Label20: TLabel
      Left = 477
      Top = 108
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1083'. '#1087#1088#1080' 20'#39'C:'
    end
    object Label21: TLabel
      Left = 477
      Top = 78
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1083'. '#1087#1088#1080' 15'#39'C:'
    end
    object Label6: TLabel
      Left = 34
      Top = 107
      Width = 55
      Height = 13
      Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088
    end
    object Label7: TLabel
      Left = 443
      Top = 48
      Width = 99
      Height = 13
      Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
    end
    object lcProd: TRxDBLookupCombo
      Left = 103
      Top = 44
      Width = 329
      Height = 21
      DropDownCount = 8
      LookupField = 'ID_NPR'
      LookupDisplay = 'NAME_NPR'
      LookupSource = f_Pasp.ds_Prod
      TabOrder = 3
      OnChange = lcProdChange
    end
    object edNum: TEdit
      Left = 104
      Top = 12
      Width = 114
      Height = 21
      TabOrder = 0
    end
    object edRez_num: TEdit
      Left = 309
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object lcPerer: TRxDBLookupCombo
      Left = 103
      Top = 74
      Width = 329
      Height = 21
      DropDownCount = 8
      LookupField = 'PREDPR_ID'
      LookupDisplay = 'SHORT_NAME'
      LookupSource = f_Pasp.ds_perer
      TabOrder = 5
      OnChange = lcProdChange
    end
    object edPl20: TCurrencyEdit
      Left = 557
      Top = 104
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = ',#0.0000;-,#0.0000'
      TabOrder = 8
    end
    object edPl15: TCurrencyEdit
      Left = 557
      Top = 74
      Width = 57
      Height = 21
      AutoSize = False
      DecimalPlaces = 4
      DisplayFormat = ',#0.0000;-,#0.0000'
      TabOrder = 7
    end
    object edInsp: TEdit
      Left = 103
      Top = 106
      Width = 298
      Height = 21
      TabOrder = 6
    end
    object edDateVir: TDBDateTimeEditEh
      Left = 558
      Top = 43
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 4
      Visible = True
    end
    object edDate: TDBDateTimeEditEh
      Left = 558
      Top = 12
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object ChkFormat: TCheckBox
      Left = 624
      Top = 80
      Width = 73
      Height = 17
      Alignment = taLeftJustify
      Caption = 'ChkFormat'
      TabOrder = 9
      Visible = False
    end
  end
  object sg1: TStringGrid
    Left = 0
    Top = 163
    Width = 703
    Height = 471
    Align = alClient
    ColCount = 3
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
    TabOrder = 1
    ColWidths = (
      353
      97
      98)
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 703
    Height = 26
    ActionManager = amPaspAdd
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object ds_valpasp: TDataSource
    DataSet = q_valpasp
    Left = 184
    Top = 440
  end
  object q_valpasp: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      'DECODE(b.NPP,0,'#39'    '#39',TO_CHAR(b.NPP)||'#39'. '#39')||k.NAME NAME,'
      'a.PASP_ID, a.QUAL,'
      'b.*,k.*'
      'FROM (select * from kls_valpasp where pasp_id=:PASP_ID) a,'
      
        '     (select * from kls_tablpok where prod_id_npr=:ID_NPR) b, kl' +
        's_kodif k'
      'WHERE a.KODIF_ID(+)=b.KODIF_ID'
      '      AND b.KODIF_ID=k.ID(+)'
      
        '      AND not ((b.KODIF_ID=571) OR (b.KODIF_ID=602) OR (b.KODIF_' +
        'ID=1))'
      'ORDER BY b.SORTBY'
      '')
    Variables.Data = {
      0300000002000000080000003A504153505F4944050000000000000000000000
      070000003A49445F4E5052050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000F00000007000000504153505F49440100000000080000004B4F4449
      465F49440100000000040000005155414C0100000000060000004E4F524D5455
      0100000000040000004E414D450100000000030000004E505001000000000B00
      000050524F445F49445F4E5052010000000006000000534F5254425901000000
      000A0000004441544555504C4F41440100000000020000004944010000000006
      0000004E414D455F3101000000000A0000004649454C445F5459504501000000
      00090000004649454C445F4C454E0100000000090000004649454C445F444543
      01000000000A0000004649454C445F535645440100000000}
    UpdatingTable = 'kls_valpasp'
    Session = f_Pasp.ora_Session
    Left = 112
    Top = 440
    object q_valpaspNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object q_valpaspPASP_ID: TStringField
      FieldName = 'PASP_ID'
      Size = 9
    end
    object q_valpaspQUAL: TStringField
      FieldName = 'QUAL'
      Size = 12
    end
    object q_valpaspKODIF_ID: TIntegerField
      FieldName = 'KODIF_ID'
      Required = True
    end
    object q_valpaspNORMTU: TStringField
      FieldName = 'NORMTU'
      Size = 50
    end
    object q_valpaspNPP: TIntegerField
      FieldName = 'NPP'
    end
    object q_valpaspFIELD_TYPE: TStringField
      FieldName = 'FIELD_TYPE'
      Size = 1
    end
    object q_valpaspFIELD_LEN: TIntegerField
      FieldName = 'FIELD_LEN'
    end
    object q_valpaspFIELD_DEC: TIntegerField
      FieldName = 'FIELD_DEC'
    end
  end
  object amPaspAdd: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acPaspSave
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
    Left = 416
    Top = 344
    StyleName = 'XP Style'
    object acPaspSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 52
      OnExecute = acPaspSaveExecute
    end
    object acClose: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 5
      OnExecute = acCloseExecute
    end
    object Action1: TAction
      Caption = 'acChkFormatVisible'
      ShortCut = 49235
      OnExecute = Action1Execute
    end
  end
end
