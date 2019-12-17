object f_PrichExp: Tf_PrichExp
  Left = 12
  Top = 106
  Width = 1000
  Height = 475
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1069#1050#1057#1055' ('#1055#1088#1080#1095#1080#1085#1099') '#1080' '#1055#1051#1069#1050#1057#1055' ('#1055#1083#1072#1085#1099' '#1087#1086' '#1101#1082#1089#1087#1086#1088#1090#1091')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 17
    Width = 992
    Height = 383
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = ds_pe_edit
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    FrozenCols = 4
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SortByInfo'
        Footers = <>
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'num_dog'
        Footers = <>
        ReadOnly = True
        Width = 69
      end
      item
        EditButtons = <>
        FieldName = 'plat_name'
        Footers = <>
        ReadOnly = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'prod_name'
        Footers = <>
        ReadOnly = True
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'plan_gd'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'plan_post'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 65
      end
      item
        EditButtons = <>
        FieldName = 'obpr'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'norma_mon'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'fact_mon'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'fact_sut'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'prich'
        Footers = <>
        Width = 204
      end
      item
        EditButtons = <>
        FieldName = 'fact_year'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'stan_name'
        Footers = <>
        ReadOnly = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'vid_tr_nam'
        Footers = <>
        ReadOnly = True
      end
      item
        EditButtons = <>
        FieldName = 'exped_name'
        Footers = <>
        ReadOnly = True
        Width = 186
      end
      item
        EditButtons = <>
        FieldName = 'zapr_mps'
        Footers = <>
        Width = 372
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 992
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 128
      Top = 8
      Width = 329
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1062#1044#1059' (oi@lukoil.com) '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1069#1050#1057#1055
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 488
      Top = 8
      Width = 345
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1062#1044#1059' (oi@lukoil.com) '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1055#1051#1069#1050#1057#1055
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object t_pe_edit: TADOTable
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=c:\tmp;SourceType=DBF;Exclusive=No;Back' +
      'groundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    CursorType = ctStatic
    OnCalcFields = t_pe_editCalcFields
    TableName = 'pe_edit'
    Left = 480
    Top = 136
    object t_pe_editplat_kod: TStringField
      FieldName = 'plat_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editplat_name: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'plat_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editprod_kod: TStringField
      FieldName = 'prod_kod'
      FixedChar = True
      Size = 6
    end
    object t_pe_editprod_kod10: TStringField
      FieldName = 'prod_kod10'
      FixedChar = True
      Size = 10
    end
    object t_pe_editkind_npr: TStringField
      FieldName = 'kind_npr'
      FixedChar = True
      Size = 6
    end
    object t_pe_editprod_fas: TStringField
      FieldName = 'prod_fas'
      FixedChar = True
      Size = 1
    end
    object t_pe_editprod_name: TStringField
      DisplayLabel = #1055#1088#1086#1076#1091#1082#1090
      FieldName = 'prod_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editstan_kod: TStringField
      FieldName = 'stan_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editstan_name: TStringField
      DisplayLabel = #1057#1090#1072#1085#1094#1080#1103
      FieldName = 'stan_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editexped_kod: TStringField
      FieldName = 'exped_kod'
      FixedChar = True
      Size = 10
    end
    object t_pe_editexped_name: TStringField
      DisplayLabel = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
      FieldName = 'exped_name'
      FixedChar = True
      Size = 60
    end
    object t_pe_editvid_trans: TStringField
      FieldName = 'vid_trans'
      FixedChar = True
      Size = 10
    end
    object t_pe_editvid_tr_nam: TStringField
      DisplayLabel = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      FieldName = 'vid_tr_nam'
      FixedChar = True
      Size = 30
    end
    object t_pe_editfact_year: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1089' '#1085#1072#1095'.'#1075#1086#1076#1072
      FieldName = 'fact_year'
      Precision = 15
      Size = 0
    end
    object t_pe_editplan_post: TBCDField
      DisplayLabel = #1058#1077#1082#1091#1097#1080#1081' '#1087#1083#1072#1085' '#1087#1086#1089#1090'. ('#1047#1072#1103#1074#1083#1077#1085#1086') '#1074#1082#1083'.'#1054#1041#1055#1056
      FieldName = 'plan_post'
      Precision = 15
      Size = 0
    end
    object t_pe_editplan_gd: TBCDField
      DisplayLabel = #1055#1083#1072#1085' '#1046#1044
      FieldName = 'plan_gd'
      Precision = 15
      Size = 0
    end
    object t_pe_editfact_mon: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1089' '#1085#1072#1095'.'#1084#1077#1089'.'
      FieldName = 'fact_mon'
      Precision = 15
      Size = 0
    end
    object t_pe_editfact_sut: TBCDField
      DisplayLabel = #1060#1072#1082#1090' '#1079#1072' '#1089#1091#1090'.'
      FieldName = 'fact_sut'
      Precision = 15
      Size = 0
    end
    object t_pe_editprich: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1103
      FieldName = 'prich'
      OnGetText = t_pe_editprichGetText
      Size = 100
    end
    object t_pe_editnum_dog: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1082#1090
      FieldName = 'num_dog'
      FixedChar = True
      Size = 10
    end
    object t_pe_editsortby: TBCDField
      FieldName = 'sortby'
      Precision = 10
      Size = 0
    end
    object t_pe_editnorma_mon: TBCDField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1089' '#1085#1072#1095'.'#1084#1077#1089#1103#1094#1072
      FieldName = 'norma_mon'
      Precision = 15
      Size = 0
    end
    object t_pe_editis_bad: TIntegerField
      FieldName = 'is_bad'
    end
    object t_pe_editid: TBCDField
      FieldName = 'id'
      Precision = 10
      Size = 0
    end
    object t_pe_editSortByInfo: TStringField
      DisplayLabel = #1058#1080#1087' '#1079#1072#1087#1080#1089#1080
      FieldKind = fkCalculated
      FieldName = 'SortByInfo'
      ReadOnly = True
      Calculated = True
    end
    object t_pe_editzapr_mps: TStringField
      DisplayLabel = #1047#1072#1087#1088#1077#1090' '#1052#1055#1057
      FieldName = 'zapr_mps'
      OnGetText = t_pe_editzapr_mpsGetText
      FixedChar = True
      Size = 250
    end
    object t_pe_editplan_izm: TBCDField
      FieldName = 'plan_izm'
      Precision = 15
      Size = 0
    end
    object t_pe_editobpr: TBCDField
      DisplayLabel = #1074' '#1090'.'#1095'. '#1054#1041#1055#1056
      FieldName = 'obpr'
      Precision = 15
      Size = 0
    end
  end
  object ds_pe_edit: TDataSource
    DataSet = t_pe_edit
    Left = 192
  end
  object q_cmn: TADOQuery
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=PF;UID=;SourceDB=c:\tmp;SourceType=DBF;Exclusive=No;Back' +
      'groundFetch=Yes;Collate=Machine;Null=Yes;Deleted=Yes;"'
    Parameters = <>
    Left = 360
    Top = 149
  end
end
