object f_NaklAddVagon: Tf_NaklAddVagon
  Left = 492
  Top = 188
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1072#1075#1086#1085' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
  ClientHeight = 363
  ClientWidth = 712
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
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 712
    Height = 34
    ActionManager = acNaklAddVagon
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object ListView1: TListView
    Left = 0
    Top = 34
    Width = 712
    Height = 329
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = #8470' '#1074#1072#1075#1086#1085#1072
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
        MinWidth = 150
        Width = 150
      end
      item
        Caption = #1042#1077#1089', '#1090#1085
        MinWidth = 60
        Width = 60
      end
      item
        Caption = #1057#1090#1072#1090#1091#1089
        MinWidth = 90
        Width = 90
      end
      item
        Caption = 'N '#1085#1072#1082#1083'.'
      end
      item
        Caption = #1044#1072#1090#1072' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103
        MinWidth = 130
        Width = 130
      end
      item
        Caption = #8470' '#1089#1074#1077#1076'.'
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1055#1088#1086#1076#1091#1082#1090
        Width = 220
      end
      item
        Caption = 'N '#1087#1072#1089#1087'.'
        MinWidth = 50
      end
      item
        Caption = #8470' '#1079#1072#1076#1072#1085#1080#1103
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1057#1090#1072#1085#1094#1080#1103
        MinWidth = 180
        Width = 180
      end
      item
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        MinWidth = 120
        Width = 120
      end
      item
        Caption = #8470' '#1074#1077#1076'.'#1087#1086#1076
        MinWidth = 80
        Width = 80
      end
      item
        Caption = #1042#1077#1090#1082#1072' '#1087#1086#1075#1088#1091#1079#1082#1080
        MinWidth = 75
        Width = 120
      end>
    GridLines = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object acNaklAddVagon: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = fcSelectAll
            ImageIndex = 16
          end
          item
            Action = acDeselectAll
            ImageIndex = 27
          end
          item
            Action = acNaklAdd1
            ImageIndex = 13
          end>
        ActionBar = ActionToolBar1
      end>
    Images = f_main.ImageXP
    Left = 264
    Top = 192
    StyleName = 'XP Style'
    object acNaklAdd1: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 13
      OnExecute = acNaklAdd1Execute
    end
    object fcSelectAll: TAction
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 16
      OnExecute = fcSelectAllExecute
    end
    object acDeselectAll: TAction
      Caption = #1057#1085#1103#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1080#1077
      ImageIndex = 27
      OnExecute = acDeselectAllExecute
    end
    object acExit: TAction
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 8
      OnExecute = acExitExecute
    end
  end
  object q_vag_nakl: TOracleDataSet
    SQL.Strings = (
      '      SELECT /*+ ordered */'
      #9'      reestr.ID as REESTR_ID,'
      #9#9'    reestr.SVED_POS,'
      '        KLS_VETKA_OTP.SHORT_NAME as VETKA_OTP_NAME,'
      '    '#9'  ved_pod.POD_NUM,'
      #9'      sved.SVED_NUM,'
      '        REESTR.NUM_CIST,'
      '    '#9'  reestr.VES,'
      '        SVED.DATE_OFORML,'
      '        SVED.NOM_ZD,'
      '        KLS_STAN.STAN_NAME,'
      '    '#9'  KLS_PROD.ABBR_NPR as PROD_NAME,'
      '        KLS_VAGOWNER.DISPLAY_NAME as VAGOWNER_NAME,'
      '    '#9'  poluch.SHORT_NAME as POLUCH_NAME,'
      '        sved.SVED_DATE,'
      '        sved.PASP_NUM,'
      '  '#9#9'  kls_vag_status.NAME as VAG_STATUS,'
      #9#9'    reestr.VES_ALL,'
      #9#9'    reestr.VES_CIST,'
      #9#9'    reestr.UPAK_VES,'
      '        0 as V1'
      
        '      from sved, reestr, month, ved_pod_row, ved_pod, kls_stan, ' +
        'kls_vetka_otp, KLS_VAGOWNER, KLS_PROD, KLS_PREDPR poluch,kls_vag' +
        '_status'
      
        '      where reestr.sved_id=sved.id and sved.nom_zd=month.nom_zd(' +
        '+)'
      '        and reestr.ved_pod_row_id=ved_pod_row.id(+)'
      '    '#9'  and ved_pod_row.ved_pod_id=ved_pod.id(+)'
      '        and month.stan_id=kls_stan.id(+)'
      '    '#9'  and month.poluch_id=poluch.id(+)'
      '        and reestr.vetka_otp_id=kls_vetka_otp.id(+)'
      '    '#9'  and sved.prod_id_npr=kls_prod.id_npr(+)'
      '        and reestr.VAGOWNER_ID=KLS_VAGOWNER.ID(+)'
      #9#9'and reestr.VAG_STATUS_ID=kls_vag_status.ID(+)'
      '        and sved.MESTO_ID=:MESTO_ID'
      '        and sved.load_type_id=:LOAD_TYPE_ID'
      '        and reestr.nar_line_id is not null -- '#1042#1072#1075#1086#1085' '#1079#1072#1072#1076#1088#1077#1089#1086#1074#1072#1085
      
        '        and (reestr.nakl_id is null OR reestr.nakl_id=:DOC_ID) -' +
        '- '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      '        and reestr.vag_status_id=0 -- '#1080#1089#1087#1088#1072#1074#1085#1099#1081
      '        and reestr.ves<>0 -- '#1089' '#1074#1077#1089#1086#1084
      #9#9'    and sved.PASP_ID IS NOT NULL -- '#1074' '#1089#1074#1077#1076#1077#1085#1080#1080' '#1091#1082#1072#1079#1072#1085' '#1087#1072#1089#1087#1086#1088#1090
      
        '        and sved.NOM_ZD=:NOM_ZD -- '#1090#1086#1090' '#1078#1077' '#1085#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103', '#1095#1090#1086' '#1080' '#1074 +
        ' '#1101#1090#1072#1083#1086#1085#1085#1086#1084' '#1089#1074#1077#1076#1077#1085#1080#1080
      
        '        and sved.PROD_ID_NPR=:PROD_ID_NPR -- '#1090#1086#1090' '#1078#1077' '#1087#1088#1086#1076#1091#1082#1090', '#1095#1090#1086 +
        ' '#1080' '#1074' '#1101#1090#1072#1083#1086#1085#1085#1086#1084' '#1089#1074#1077#1076#1077#1085#1080#1080
      
        '        and reestr.formnakl_id=:FORMNAKL_ID -- '#1090#1086#1090' '#1078#1077' '#1090#1080#1087' '#1085#1072#1082#1083#1072#1076 +
        #1085#1086#1081', '#1095#1090#1086' '#1080' '#1074' '#1101#1090#1072#1083#1086#1085#1085#1086#1084' '#1074#1072#1075#1086#1085#1077
      '        and (reestr.formnakl_id in (6,7)'
      '             and NVL(reestr.vagowner_id,0)='
      '               (CASE'
      
        '    '#9#9'          WHEN :LOAD_TYPE_ID=1 AND (/*month.is_exp<>0 OR *' +
        '/reestr.formnakl_id<>7) AND :VAGOWNER_ID=3 THEN 3'
      '    '#9#9'          ELSE NVL(reestr.vagowner_id,0)'
      '    '#9#9'        END)'
      '             and NVL(reestr.vagowner_id,0)<>'
      '      '#9'           (CASE'
      
        '    '#9#9'          WHEN :LOAD_TYPE_ID=1 AND (/*month.is_exp<>0 OR *' +
        '/reestr.formnakl_id<>7) AND :VAGOWNER_ID<>3 THEN 3'
      '    '#9#9'          ELSE -1'
      '    '#9#9'        END)'
      '            )'
      '        AND reestr.ID NOT IN (SELECT REESTR_ID FROM TEMP_NAKL)'
      #9'  ORDER BY DATE_OFORML DESC, SVED_NUM DESC, SVED_POS'
      '')
    Variables.Data = {
      03000000070000000C0000003A464F524D4E414B4C5F49440300000000000000
      00000000090000003A4D4553544F5F49440300000000000000000000000D0000
      003A4C4F41445F545950455F4944030000000000000000000000070000003A4E
      4F4D5F5A440500000000000000000000000C0000003A50524F445F49445F4E50
      520500000000000000000000000C0000003A5641474F574E45525F4944030000
      000000000000000000070000003A444F435F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000E000000090000005245455354525F49440100000000060000004E4F
      4D5F5A440100000000090000005354414E5F4E414D450100000000080000004E
      554D5F4349535401000000000D0000005641474F574E45525F4E414D45010000
      00000300000056455301000000000B000000444154455F4F464F524D4C010000
      00000900000050524F445F4E414D45010000000008000000535645445F4E554D
      010000000007000000504F445F4E554D01000000000E0000005645544B415F4F
      54505F4E414D450100000000020000005631010000000008000000535645445F
      504F5301000000000B000000504F4C5543485F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 264
    Top = 120
  end
  object q_vag_uved: TOracleDataSet
    SQL.Strings = (
      '   SELECT /*+ ordered */'
      #9'    reestr.ID as REESTR_ID,'
      #9'    reestr.SVED_POS,'
      '      KLS_VETKA_OTP.SHORT_NAME as VETKA_OTP_NAME,'
      '    '#9'ved_pod.POD_NUM,'
      #9'    sved.SVED_NUM,'
      '      REESTR.NUM_CIST,'
      '    '#9'reestr.VES,'
      '      SVED.DATE_OFORML,'
      '      SVED.NOM_ZD,'
      '      KLS_STAN.STAN_NAME,'
      '    '#9'KLS_PROD.ABBR_NPR as PROD_NAME,'
      '      KLS_VAGOWNER.DISPLAY_NAME as VAGOWNER_NAME,'
      '    '#9'poluch.SHORT_NAME as POLUCH_NAME,'
      '      sved.SVED_DATE,'
      '      sved.PASP_NUM,'
      '      kls_vag_status.NAME as VAG_STATUS,'
      '      nakl.NAKL_NUM,'
      '  '#9#9'reestr.VES_ALL,'
      #9'  '#9'reestr.VES_CIST,'
      #9#9'  reestr.UPAK_VES,'
      '      0 as V1'
      
        '    from sved, reestr, month, ved_pod_row, ved_pod, kls_stan, kl' +
        's_vetka_otp, KLS_VAGOWNER, KLS_PROD, KLS_PREDPR poluch, kls_vag_' +
        'status,nakl'
      '   where reestr.sved_id=sved.id and sved.nom_zd=month.nom_zd(+)'
      '      and reestr.ved_pod_row_id=ved_pod_row.id(+)'
      '    '#9'and ved_pod_row.ved_pod_id=ved_pod.id(+)'
      '      and month.stan_id=kls_stan.id(+)'
      '    '#9'and month.poluch_id=poluch.id(+)'
      '      and reestr.vetka_otp_id=kls_vetka_otp.id(+)'
      '    '#9'and sved.prod_id_npr=kls_prod.id_npr(+)'
      '      and reestr.VAGOWNER_ID=KLS_VAGOWNER.ID(+)'
      '      and reestr.VAG_STATUS_ID=KLS_VAG_STATUS.ID(+)'
      #9'  '#9'and reestr.NAKL_ID=nakl.ID(+)'
      '      and sved.MESTO_ID=:MESTO_ID'
      '      and sved.load_type_id=:LOAD_TYPE_ID'
      
        '      and (reestr.uved_id is null OR  or reestr.uved_id=:DOC_ID)' +
        '-- '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      #9'   '#9'and sved.sved_date>=TRUNC(SYSDATE,'#39'MONTH'#39')-10'
      '      AND reestr.ID NOT IN (SELECT REESTR_ID FROM TEMP_UVED)'
      #9'  ORDER BY DATE_OFORML DESC, SVED_NUM DESC, SVED_POS'
      '')
    Variables.Data = {
      0300000003000000090000003A4D4553544F5F49440300000000000000000000
      000D0000003A4C4F41445F545950455F49440300000000000000000000000700
      00003A444F435F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000E000000090000005245455354525F49440100000000060000004E4F
      4D5F5A440100000000090000005354414E5F4E414D450100000000080000004E
      554D5F4349535401000000000D0000005641474F574E45525F4E414D45010000
      00000300000056455301000000000B000000444154455F4F464F524D4C010000
      00000900000050524F445F4E414D45010000000008000000535645445F4E554D
      010000000007000000504F445F4E554D01000000000E0000005645544B415F4F
      54505F4E414D450100000000020000005631010000000008000000535645445F
      504F5301000000000B000000504F4C5543485F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 344
    Top = 120
  end
  object q_vag_voz: TOracleDataSet
    SQL.Strings = (
      '      SELECT /*+ ordered */'
      #9'      reestr_in.ID as REESTR_ID,'
      #9#9'    reestr_in.SVED_POS,'
      '        '#39' '#39' as VETKA_OTP_NAME,'
      '    '#9'  NULL as POD_NUM,'
      #9'      sved_in.SVED_NUM,'
      '        REESTR_in.NUM_CIST,'
      '    '#9'  0 as VES,'
      '        SVED_in.DATE_OFORML,'
      '        '#39' '#39' as NOM_ZD,'
      '        '#39' '#39' as STAN_NAME,'
      '    '#9'  '#39' '#39' as PROD_NAME,'
      '        KLS_VAGOWNER.DISPLAY_NAME as VAGOWNER_NAME,'
      '    '#9'  '#39' '#39' as POLUCH_NAME,'
      '        sved_in.SVED_DATE,'
      '        '#39' '#39' as PASP_NUM,'
      '  '#9#9'  '#39' '#39' as VAG_STATUS,'
      #9#9'    0 as VES_ALL,'
      #9#9'    reestr_in.VES_CIST,'
      #9#9'    0 as UPAK_VES,'
      '        0 as V1'
      '      from sved_in, reestr_in, KLS_VAGOWNER'
      '      where reestr_in.sved_in_id=sved_in.id'
      '        and reestr_in.VAGOWNER_ID=KLS_VAGOWNER.ID(+)'
      '        and sved_in.MESTO_ID=:MESTO_ID'
      '        and 1=:LOAD_TYPE_ID'
      
        '        and sved_in.PROD_ID_NPR=:PROD_ID_NPR -- '#1090#1086#1090' '#1078#1077' '#1087#1088#1086#1076#1091#1082#1090', ' +
        #1095#1090#1086' '#1080' '#1074' '#1101#1090#1072#1083#1086#1085#1085#1086#1084' '#1089#1074#1077#1076#1077#1085#1080#1080
      
        '        and (reestr_in.nakl_id is null or reestr_in.nakl_id=:DOC' +
        '_ID) -- '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      '  '#9#9'  and reestr_in.plomba1||'#39' '#39'<>'#39' '#39' -- '#1077#1089#1083#1080' '#1074#1074#1077#1076#1077#1085#1072' '#1087#1083#1086#1084#1073#1072' 1'
      
        '        AND reestr_in.ID NOT IN (SELECT REESTR_ID FROM TEMP_NAKL' +
        ')'
      
        '        AND sved_in.sved_date>=TO_DATE('#39'01.02.2006'#39','#39'dd.mm.yyyy'#39 +
        ')'
      #9'  ORDER BY SVED_DATE DESC, SVED_NUM DESC, SVED_POS'
      '')
    Variables.Data = {
      0300000004000000090000003A4D4553544F5F49440300000000000000000000
      000D0000003A4C4F41445F545950455F49440300000000000000000000000C00
      00003A50524F445F49445F4E5052050000000000000000000000070000003A44
      4F435F4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      030000000E000000090000005245455354525F49440100000000060000004E4F
      4D5F5A440100000000090000005354414E5F4E414D450100000000080000004E
      554D5F4349535401000000000D0000005641474F574E45525F4E414D45010000
      00000300000056455301000000000B000000444154455F4F464F524D4C010000
      00000900000050524F445F4E414D45010000000008000000535645445F4E554D
      010000000007000000504F445F4E554D01000000000E0000005645544B415F4F
      54505F4E414D450100000000020000005631010000000008000000535645445F
      504F5301000000000B000000504F4C5543485F4E414D450100000000}
    Session = f_main.ora_Session
    Left = 168
    Top = 120
  end
  object q_vag_UvedVoz: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      #9'reestr_in.UVED_POS,'
      '  reestr_in.ID as REESTR_ID,'
      #9'null as VETKA_OTP_NAME,'
      #9'null as POD_NUM,'
      #9'sved_in.SVED_NUM,'
      '  reestr_in.NUM_CIST,'
      #9'reestr_in.VES,'
      '  sved_in.DATE_OFORML,'
      #9'null as NOM_ZD,'
      '  null as stan_name,'
      #9'KLS_PROD.ABBR_NPR as PROD_NAME,'
      '  KLS_VAGOWNER.DISPLAY_NAME as VAGOWNER_NAME,'
      #9'null as PLOUCH_NAME,'
      #9'sved_in.SVED_DATE,'
      #9'null as PASP_NUM,'
      #9'null as VAG_STATUS,'
      '  nakl.NAKL_NUM,'
      #9'null as VES_ALL,'
      #9'reestr_in.VES_CIST,'
      #9'null as UPAK_VES,'
      '  null as POLUCH_NAME,'
      #9'0 as V1'
      'from reestr_in, sved_in,KLS_VAGOWNER, KLS_PROD,nakl'
      'where reestr_in.sved_in_id=sved_in.id'
      #9'  and sved_in.prod_id_npr=kls_prod.id_npr(+)'
      '    and reestr_in.VAGOWNER_ID=KLS_VAGOWNER.ID(+)'
      #9'  and reestr_in.NAKL_ID=nakl.ID(+)'
      #9'  and sved_in.MESTO_ID=:MESTO_ID'
      '    and 1=:LOAD_TYPE_ID'
      
        '    and sved_in.PROD_ID_NPR=:PROD_ID_NPR -- '#1090#1086#1090' '#1078#1077' '#1087#1088#1086#1076#1091#1082#1090', '#1095#1090#1086' ' +
        #1080' '#1074' '#1101#1090#1072#1083#1086#1085#1085#1086#1084' '#1089#1074#1077#1076#1077#1085#1080#1080
      
        #9'  and (reestr_in.uved_id is null or reestr_in.uved_id=:DOC_ID) ' +
        '-- '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085' '#1074' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      '    AND sved_in.sved_date>=TO_DATE('#39'01.02.2006'#39','#39'dd.mm.yyyy'#39')'
      #9'  AND reestr_in.ID NOT IN (SELECT REESTR_ID FROM TEMP_UVED)'
      'ORDER BY SVED_DATE DESC, SVED_NUM DESC, SVED_POS')
    Variables.Data = {
      0300000004000000090000003A4D4553544F5F49440300000000000000000000
      00070000003A444F435F49440400000000000000000000000D0000003A4C4F41
      445F545950455F49440300000000000000000000000C0000003A50524F445F49
      445F4E5052050000000000000000000000}
    Session = f_main.ora_Session
    Left = 424
    Top = 120
  end
end
