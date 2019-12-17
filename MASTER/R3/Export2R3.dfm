object f_Export2R3: Tf_Export2R3
  Left = 272
  Top = 218
  BorderStyle = bsSingle
  Caption = #1042#1099#1075#1088#1091#1079#1082#1080' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' SAP/R3'
  ClientHeight = 384
  ClientWidth = 662
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
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 117
    Width = 662
    Height = 248
    Align = alClient
    DataSource = dsSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = DBGridEh1Enter
  end
  object Panel1: TPanel
    Left = 0
    Top = 54
    Width = 662
    Height = 63
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 47
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076' '#1089
    end
    object Label2: TLabel
      Left = 200
      Top = 10
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label3: TLabel
      Left = 400
      Top = 10
      Width = 70
      Height = 13
      Caption = #1058#1080#1087' '#1074#1099#1075#1088#1091#1079#1082#1080
    end
    object Label4: TLabel
      Left = 8
      Top = 37
      Width = 49
      Height = 13
      Caption = #8470' '#1074#1072#1075#1086#1085#1072
    end
    object edBegin: TDBDateTimeEditEh
      Left = 72
      Top = 6
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object edEnd: TDBDateTimeEditEh
      Left = 217
      Top = 6
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object cbUpload: TComboBox
      Left = 480
      Top = 6
      Width = 257
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = #1054#1090#1075#1088#1091#1079#1082#1072' ('#1085#1086#1074#1072#1103')'
      OnChange = cbUploadChange
      Items.Strings = (
        #1054#1090#1075#1088#1091#1079#1082#1072' '#1073#1077#1079' '#1088#1072#1079#1085#1072#1088#1103#1076#1086#1082' SAP R/3'
        #1054#1090#1075#1088#1091#1079#1082#1072' '#1073#1077#1079' '#1092#1072#1082#1090#1091#1088' '#1080#1079' '#1060#1048#1053#1040#1053#1057#1086#1074
        #1057#1091#1090#1086#1095#1085#1099#1077' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080
        #1054#1090#1075#1088#1091#1079#1082#1072' ('#1085#1086#1074#1072#1103')'
        #1057#1077#1088#1090#1080#1092#1080#1082#1072#1090#1099' '#1082#1072#1095#1077#1089#1090#1074#1072' ('#1087#1072#1089#1087#1086#1088#1090#1072')'
        #1054#1090#1075#1088#1091#1079#1082#1072' ('#1076#1077#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1080#1077')'
        #1054#1090#1075#1088#1091#1079#1082#1072' ('#1091#1076#1072#1083#1077#1085#1080#1077')'
        #1054#1090#1075#1088#1091#1079#1082#1072', '#1089#1074#1103#1079#1072#1085#1085#1072#1103' '#1089#1086' '#1089#1095#1077#1090#1072#1084#1080'-'#1092#1072#1082#1090#1091#1088#1072#1084#1080)
    end
    object edNumCist: TEdit
      Left = 72
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object sb1: TStatusBar
    Left = 0
    Top = 365
    Width = 662
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 662
    Height = 54
    ActionManager = amR3
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Spacing = 0
  end
  object qNewKvit: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      'kvit.id as ID_MS,'
      #39'05'#39' as VSTEL,--'#1055#1091#1085#1082#1090' '#1086#1090#1075#1088#1091#1079#1082#1080'. 05 - '#1059#1093#1090#1072
      
        #39'50'#39' as V_MO,--'#1050#1086#1076' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1101#1089#1090#1072#1082#1072#1076#1072','#1072#1074#1090#1086#1085#1072#1083#1080#1074 +
        ' '#1080' '#1090'.'#1076'.)'
      
        '--NVL(ksss_partners.kunnr,r3_vbak.VBPA_KUNNR) as SHTP,-- R3-k'#1086#1076' ' +
        #1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103'('#1074' r3_customers '#1089#1086#1076#1077#1088#1078#1072#1090#1089#1103' '#1085#1077' '#1074#1089#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103'-'#1079#1072#1082 +
        #1072#1079#1095#1080#1082#1080')'
      'r3_vbak.VBPA_KUNNR as SHTP,'
      
        'r3_vbak.VBAK_VSBED as VSBED,--'#1059#1089#1083#1086#1074#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1089#1087#1086#1089#1086#1073' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1046 +
        #1044','#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090', '#1090#1088#1091#1073#1072' '#1080' '#1090'.'#1076'.)'
      'NVL(r3_kvit2sap.VBAK_VBELN,r3_vbak.VBELN) as RAZNAR,'
      'NVL(r3_kvit2sap.VBAP_POSNR,r3_vbak.VBAP_POSNR) as RAZNAR_P,'
      'null as N_RAZNAR,'
      'r3_kvit2sap.ID_SAP as ID_SAP,'
      'r3_kvit2sap.ID_SAP_PSN as ID_SAP_PSN,'
      'kvit.DATE_KVIT as LDDAT, -- '#1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1086#1075#1088#1091#1079#1082#1080
      'kvit.NUM_CIST as TRAID,'
      
        'lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080' ('#1087#1086 +
        ' '#1078#1077#1083#1072#1085#1080#1102' '#1043#1088#1091#1079#1076#1077#1074#1072') '
      '--kvit.NUM_KVIT as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080
      'kvit.DATE_KVIT as WADAT, -- '#1044#1072#1090#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1075#1088#1091#1079#1082#1080
      'KLS_VAGOWNER.r3_vsart_id AS VSART,--'#1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080' ,'
      'kvit.VES_BRUTTO*1000 as LFIMG,--'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1075#1088#1091#1078#1077#1085#1085#1086#1075#1086' '#1085'/'#1087
      #39#1050#1043#39' as MEAS,--'#1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1074' '#1087#1086#1089#1090#1072#1074#1082#1077
      #39' '#39' as F_D_IND,--'#1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
      #39' '#39' as DEL,--'#1055#1088#1080#1079#1085#1072#1082' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      
        'KLS_vagowner.R3_VENDORS_ID as SCPARTNER,--'#1057#1080#1090#1077#1084#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1086#1073#1089#1090#1074#1077 +
        #1085#1085#1080#1082#1072' R3'
      
        '(CASE WHEN kvit.ves_brutto>100 THEN '#39'27'#39' ELSE '#39'23'#39' END) as OIC_M' +
        'OT,--'#1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      'kvit.GTD as LADEL,'
      'null as STAWN,'
      'kls_pasp.PASP_NUM as QPASS,'
      'kvit.VES_BRUTTO*1000 as BRGEW,'
      'kvit.VES_BRUTTO*1000 as NTGEW,'
      #39#1050#1043#39' as GEWEI,'
      'kls_stan.rast as DISTANCE,'
      #39#39' as RENDERED,--'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1080#1074#1096#1072#1103' '#1074#1072#1075#1086#1085#1099'.'
      #39'0001001002'#39' as LIFNR,--'#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'('#1074#1089#1077#1075#1076#1072' '#1051#1091#1082#1086#1081#1083' '#1059#1053#1055')'
      
        'exped.KSSS_PREDPR_ID as KSSS_EXPED, '#39'0611207'#39' as ZAKUP_DOG_NUM,'#39 +
        #39' as ZZINCO2KEY,kls_shabexp.INSNUM,kls_shabexp.INSDAT,'#39'-'#39' as TEL' +
        'EGRAM'
      
        'from kvit,month,r3_vbak,sved,kls_pasp, kls_stan, r3_vsbed,kls_vi' +
        'd_otgr,r3_traty,KLS_VAGOWNER,KSSS_PARTNERS,KLS_PREDPR,r3_kvit2sa' +
        'p,kls_predpr exped,kls_shabexp'
      'where kvit.NOM_ZD=month.NOM_ZD'
      '  and kvit.DATE_KVIT=r3_vbak.VBAK_VDATU'
      '  and kvit.nom_zd=r3_vbak.NOM_ZD'
      
        '  and kvit.SVED_ID=sved.id(+) AND kvit.SHABEXP_ID=kls_shabexp.ID' +
        '(+)'
      '  and kvit.ID=r3_kvit2sap.KVIT_ID(+)'
      '  and month.POLUCH_ID=KLS_PREDPR.ID(+)'
      '  and kls_predpr.KSSS_PREDPR_ID=ksss_partners.CONTRAGENT_ID(+)'
      '  and month.EXPED_ID=exped.ID(+)'
      '  and kvit.PASP_ID=kls_pasp.id(+)'
      '  and month.STAN_ID=kls_stan.id(+)'
      '  and month.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR'
      '  and KLS_VID_OTGR.LOAD_TYPE_ID=r3_vsbed.FOX_ID(+)'
      '  and kvit.VAGOWNER_ID=KLS_vagowner.ID(+)'
      '  and kvit.VAGONTYPE_ID=r3_traty.FOX_ID(+)'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and kvit.FLG_OPERDATA=0'
      '  and r3_kvit2sap.ID_SAP is null'
      '  and r3_kvit2sap.ID_SAP_PSN is null'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  AND MONTH.IS_EXP+0=1')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 144
    Top = 184
  end
  object amR3: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = acRefresh
            ImageIndex = 11
          end
          item
            Action = acImportRaznar
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080' (&OD)'
            ImageIndex = 31
          end
          item
            Action = acExportTo
            ImageIndex = 42
          end
          item
            Action = acImportRC
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' (&RC)'
            ImageIndex = 31
          end
          item
            Action = acDelID_SAP
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091' &SAP'
            ImageIndex = 16
          end
          item
            Caption = '-'
          end
          item
            Action = acDelRaznar
            ImageIndex = 21
          end
          item
            Action = acClose
            ImageIndex = 5
          end>
      end
      item
        Items = <
          item
            Action = acRefresh
            ImageIndex = 11
          end
          item
            Action = acImportRaznar
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080' (&OD)'
            ImageIndex = 31
          end
          item
            Action = acExportTo
            ImageIndex = 42
          end
          item
            Action = acImportRC
            Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' (&RC)'
            ImageIndex = 31
          end
          item
            Action = acDelID_SAP
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091' &SAP'
            ImageIndex = 16
          end
          item
            Action = acDelRaznar
            ImageIndex = 21
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
    Top = 192
    StyleName = 'XP Style'
    object acExportTo: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      ImageIndex = 42
      OnExecute = acExportToExecute
    end
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 11
      OnExecute = acRefreshExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 5
      OnExecute = acCloseExecute
    end
    object acImportRaznar: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1080' (OD)'
      ImageIndex = 31
      OnExecute = acImportRaznarExecute
    end
    object acImportRC: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' (RC)'
      ImageIndex = 31
      OnExecute = acImportRCExecute
    end
    object acDelID_SAP: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1089#1090#1072#1074#1082#1091' SAP'
      ImageIndex = 16
      OnExecute = acDelID_SAPExecute
    end
    object acDelRaznar: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1079#1085#1072#1088#1103#1076#1082#1091
      ImageIndex = 21
      OnExecute = acDelRaznarExecute
    end
  end
  object dsSource: TDataSource
    DataSet = qNewKvit
    Left = 144
    Top = 232
  end
  object SaveDialog: TSaveDialog
    Filter = 
      'Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HT' +
      'ML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF|Microsoft E' +
      'xcel Workbook (*.xls)|*.XLS'
    FilterIndex = 5
    Left = 58
    Top = 182
  end
  object qPasp: TOracleDataSet
    SQL.Strings = (
      'select'
      
        'to_char(kls_pasp.PASP_DATE,'#39'ddmmyy'#39')||'#39'_'#39'||trim(kls_pasp.PASP_NU' +
        'M)||'#39'_'#39'||trim(kls_prod.KSSS_PROD_ID) as CQ_NUM,--N '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072' '#1082 +
        #1072#1095#1077#1089#1090#1074#1072
      #39#1051#1059#1050#1054#1049#1051'-'#1059#1053#1055#39' as CQ_INSP_NAME,--'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1085#1089#1087#1077#1082#1090#1086#1088#1072' kls_kodif'
      'kls_pasp.PASP_DATE as CQ_DATE_INSP,--'#1044#1072#1090#1072' '#1080#1085#1089#1087#1077#1082#1094#1080#1080
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_TAG(kvit.PASP_ID, '#39'PL20'#39')) as' +
        ' Z0000001,--'#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1087#1088#1080' 20 '#1086#1057' ( '#1075'/'#1089#1084'3)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_TAG(kvit.PASP_ID, '#39'p_vod'#39')) a' +
        's Z0000011,--'#1052#1072#1089#1089#1086#1074#1072#1103' '#1076#1086#1083#1103' '#1074#1086#1076#1099
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_TAG(kvit.PASP_ID, '#39'p_ser'#39')) a' +
        's Z0000018,--'#1052#1072#1089#1089#1086#1074#1072#1103' '#1076#1086#1083#1103' '#1089#1077#1088#1099' (%)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000028'#39'))' +
        ' as Z0000028,--'#1050#1080#1089#1083#1086#1090#1085#1086#1089#1090#1100' ('#1084#1075#1050#1054#1053'/100'#1089#1084'3)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000059'#39'))' +
        ' as Z0000059,--'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1084#1072#1089#1083#1072' (%'#1084#1072#1089#1089'.)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000078'#39'))' +
        ' as Z0000078,--'#1042#1103#1079#1082'.'#1091#1089#1083'.'#1087#1088#1080' 80'#1086#1057
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000079'#39'))' +
        ' as Z0000079,--'#1055#1088#1077#1076'.'#1090#1077#1084'.'#1092#1080#1083#1100#1090#1088#1091#1077#1084#1086#1089#1090#1080' ('#1086#1057')'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000229'#39'))' +
        ' as Z0000229,--'#1047#1086#1083#1100#1085#1086#1089#1090#1100' (% '#1084#1072#1089#1089'.)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000219'#39'))' +
        ' as Z0000219,--'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1074#1080#1085#1094#1072
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_TAG(kvit.PASP_ID, '#39't_vsp'#39')) a' +
        's Z0000005,--'#1058#1077#1084'.'#1074#1089#1087'.'#1074' '#1079#1072#1082#1088'.'#1090#1080#1075#1083#1077' ('#1086#1057')'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000006'#39'))' +
        ' as Z0000006,--'#1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072' '#1079#1072#1089#1090#1099#1074#1072#1085#1080#1103' ('#1086#1057')'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_TAG(kvit.PASP_ID, '#39'p_dirt'#39')) ' +
        'as Z0000007,--'#1052#1072#1089'.'#1076#1086#1083#1103' '#1084#1077#1093#1072#1085'. '#1087#1088#1080#1084#1077#1089#1077#1081' (%)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000008'#39'))' +
        ' as Z0000008,--'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1085#1080#1082#1077#1083#1103' '#1084#1075'/'#1082#1075' (ppm)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000012'#39'))' +
        ' as Z0000012,--'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1078#1077#1083#1077#1079#1072' '#1084#1075'/'#1082#1075' (ppm)'
      
        'ora_val(for_pasp.GET_PASP_VALUE_BY_R3(kvit.PASP_ID, '#39'Z0000013'#39'))' +
        ' as Z0000013--'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1085#1072#1090#1088#1080#1103' '#1084#1075'/'#1082#1075' (ppm)'
      'from kls_pasp,kvit,month,kls_prod'
      'where kvit.PASP_ID=kls_pasp.ID'
      '    and kvit.NOM_ZD=month.NOM_ZD'
      '  '#9'and kvit.PROD_ID_NPR=kls_prod.ID_NPR'
      
        #9'  and kvit.DATE_KVIT>=:BegDate--'#1074#1099#1073#1080#1088#1072#1077#1084' '#1090#1086#1083#1100#1082#1086' '#1082#1074#1080#1090#1072#1085#1094#1080#1080' '#1079#1072' '#1087#1077 +
        #1088#1080#1086#1076
      #9'  and kvit.DATE_KVIT<=:EndDate'
      '    and kvit.NUM_CIST LIKE '#39'%'#39
      '    AND MONTH.IS_EXP+0=1'
      '--order by id_sap,id_sap_psn')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 216
    Top = 184
  end
  object qSF: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      '  lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080
      '  kvit.NUM_CIST as TRAID,'
      
        '  TO_CHAR(kvit.DATE_KVIT,'#39'yyyymmdd'#39') as BLDAT, -- '#1044#1072#1090#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082 +
        #1086#1081' '#1087#1086#1075#1088#1091#1079#1082#1080
      '  r3_vbak.VBAP_MATNR as MATNR,'
      '  kvit.VES_BRUTTO as LFIMG,'
      '  TO_CHAR(bills.NOM_SF) as SCHET,'
      '  TO_CHAR(bills.DATE_VYP_SF,'#39'yyyymmdd'#39') as DATE_SCHET,'
      '  kls_dog.SHORT_NUMBER as ZZ021'
      'from kvit,bills,month,r3_vbak,r3_kvit2sap,kls_dog'
      'where kvit.NOM_ZD=month.NOM_ZD'
      '  and month.DOG_ID=kls_dog.ID'
      '  and kvit.BILL_ID=bills.NOM_DOK'
      '  and kvit.DATE_KVIT=r3_vbak.VBAK_VDATU'
      '  and kvit.nom_zd=r3_vbak.NOM_ZD'
      '  and kvit.ID=r3_kvit2sap.KVIT_ID'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  and r3_kvit2sap.ID_SAP is not null'
      '  and r3_kvit2sap.ID_SAP_PSN is not null'
      '  AND MONTH.IS_EXP+0=1'
      '')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 288
    Top = 184
  end
  object pkgFOR_R3: TOraclePackage
    Session = ora_Session
    PackageName = 'FOR_R3'
    Left = 528
    Top = 216
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'master'
    LogonPassword = 'master'
    LogonDatabase = 'buh'
    Connected = True
    Left = 535
    Top = 281
  end
  object OpenDlg: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' Excel|*.xls'
    InitialDir = 'C:\'
    Left = 352
    Top = 135
  end
  object qDeblok: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      'kvit.id as ID_MS,'
      #39'05'#39' as VSTEL,--'#1055#1091#1085#1082#1090' '#1086#1090#1075#1088#1091#1079#1082#1080'. 05 - '#1059#1093#1090#1072
      
        #39'50'#39' as V_MO,--'#1050#1086#1076' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1101#1089#1090#1072#1082#1072#1076#1072','#1072#1074#1090#1086#1085#1072#1083#1080#1074 +
        ' '#1080' '#1090'.'#1076'.)'
      
        '--NVL(ksss_partners.kunnr,r3_vbak.VBPA_KUNNR) as SHTP,-- R3-k'#1086#1076' ' +
        #1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103'('#1074' r3_customers '#1089#1086#1076#1077#1088#1078#1072#1090#1089#1103' '#1085#1077' '#1074#1089#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103'-'#1079#1072#1082 +
        #1072#1079#1095#1080#1082#1080')'
      'r3_vbak.VBPA_KUNNR as SHTP,'
      
        'r3_vbak.VBAK_VSBED as VSBED,--'#1059#1089#1083#1086#1074#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1089#1087#1086#1089#1086#1073' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1046 +
        #1044','#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090', '#1090#1088#1091#1073#1072' '#1080' '#1090'.'#1076'.)'
      'NVL(r3_kvit2sap.VBAK_VBELN,r3_vbak.VBELN) as RAZNAR,'
      'NVL(r3_kvit2sap.VBAP_POSNR,r3_vbak.VBAP_POSNR) as RAZNAR_P,'
      'null as N_RAZNAR,'
      'r3_kvit2sap.ID_SAP as ID_SAP,'
      'r3_kvit2sap.ID_SAP_PSN as ID_SAP_PSN,'
      'kvit.DATE_KVIT as LDDAT, -- '#1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1086#1075#1088#1091#1079#1082#1080
      'kvit.NUM_CIST as TRAID,'
      
        'lpad(to_char(kvit.NUM_KVIT),6,'#39'0'#39') as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080' ('#1087#1086 +
        ' '#1078#1077#1083#1072#1085#1080#1102' '#1043#1088#1091#1079#1076#1077#1074#1072')'
      '--kvit.NUM_KVIT as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080
      'kvit.DATE_KVIT as WADAT, -- '#1044#1072#1090#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1075#1088#1091#1079#1082#1080
      'KLS_VAGOWNER.r3_vsart_id AS VSART,--'#1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080' ,'
      'kvit.VES_BRUTTO*1000 as LFIMG,--'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1075#1088#1091#1078#1077#1085#1085#1086#1075#1086' '#1085'/'#1087
      #39#1050#1043#39' as MEAS,--'#1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1074' '#1087#1086#1089#1090#1072#1074#1082#1077
      #39'X'#39' as F_D_IND,--'#1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
      #39' '#39' as DEL,--'#1055#1088#1080#1079#1085#1072#1082' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      
        'KLS_vagowner.R3_VENDORS_ID as SCPARTNER,--'#1057#1080#1090#1077#1084#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1086#1073#1089#1090#1074#1077 +
        #1085#1085#1080#1082#1072' R3'
      
        '(CASE WHEN kvit.ves_brutto>100 THEN '#39'27'#39' ELSE '#39'23'#39' END) as OIC_M' +
        'OT,--'#1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      'kvit.GTD as LADEL,'
      'null as STAWN,'
      'kls_pasp.PASP_NUM as QPASS,'
      'kvit.VES_BRUTTO*1000 as BRGEW,'
      'kvit.VES_BRUTTO*1000 as NTGEW,'
      #39#1050#1043#39' as GEWEI,'
      'kls_stan.rast as DISTANCE,'
      #39#39' as RENDERED,--'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1080#1074#1096#1072#1103' '#1074#1072#1075#1086#1085#1099'.'
      #39'0001001002'#39' as LIFNR,--'#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'('#1074#1089#1077#1075#1076#1072' '#1051#1091#1082#1086#1081#1083' '#1059#1053#1055')'
      
        'exped.KSSS_PREDPR_ID as KSSS_EXPED, '#39'0611207'#39' as ZAKUP_DOG_NUM, ' +
        #39#39' as ZZINCO2KEY,kls_shabexp.INSNUM,kls_shabexp.INSDAT,'#39'-'#39' as TE' +
        'LEGRAM'
      
        'from kvit,month,r3_vbak,sved,kls_pasp, kls_stan, r3_vsbed,kls_vi' +
        'd_otgr,r3_traty,KLS_VAGOWNER,KSSS_PARTNERS,KLS_PREDPR,r3_kvit2sa' +
        'p,kls_predpr exped, kls_shabexp'
      'where kvit.NOM_ZD=month.NOM_ZD'
      '  and kvit.DATE_KVIT=r3_vbak.VBAK_VDATU'
      '  and kvit.nom_zd=r3_vbak.NOM_ZD'
      '  and kvit.SVED_ID=sved.id(+)'
      
        '  and kvit.ID=r3_kvit2sap.KVIT_ID AND kvit.shabexp_id=kls_shabex' +
        'p.id(+)'
      '  and month.POLUCH_ID=KLS_PREDPR.ID(+)'
      '  and kls_predpr.KSSS_PREDPR_ID=ksss_partners.CONTRAGENT_ID(+)'
      '  and month.EXPED_ID=exped.ID(+)'
      '  and kvit.PASP_ID=kls_pasp.id(+)'
      '  and month.STAN_ID=kls_stan.id(+)'
      '  and month.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR'
      '  and KLS_VID_OTGR.LOAD_TYPE_ID=r3_vsbed.FOX_ID(+)'
      '  and kvit.VAGOWNER_ID=KLS_vagowner.ID(+)'
      '  and kvit.VAGONTYPE_ID=r3_traty.FOX_ID(+)'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and r3_kvit2sap.ID_SAP is not null'
      '  and r3_kvit2sap.ID_SAP_PSN is not null'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  AND MONTH.IS_EXP+0=1')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 216
    Top = 312
  end
  object qNoRaznar: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      'kvit.id as KVIT_ID,'
      'kvit.nom_zd,'
      'sved.SVED_NUM,'
      'sved.SVED_DATE,'
      'kvit.DATE_KVIT,'
      'kvit.NUM_KVIT,'
      'kvit.NUM_CIST,'
      'kvit.VES_BRUTTO'
      'from kvit,month,sved'
      'where kvit.NOM_ZD=month.NOM_ZD AND kvit.SVED_ID=sved.ID(+)'
      
        '  and not exists (select null from r3_vbak where kvit.DATE_KVIT=' +
        'r3_vbak.VBAK_VDATU and kvit.nom_zd=r3_vbak.NOM_ZD)'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  AND MONTH.IS_EXP+0=1'
      '')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 152
    Top = 312
  end
  object qNoBills: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      'kvit.id as KVIT_ID,'
      'kvit.nom_zd,'
      'sved.SVED_NUM,'
      'sved.SVED_DATE,'
      'kvit.DATE_KVIT,'
      'kvit.NUM_KVIT,'
      'kvit.NUM_CIST,'
      'kvit.VES_BRUTTO'
      'from kvit,month,sved'
      'where kvit.NOM_ZD=month.NOM_ZD AND kvit.SVED_ID=sved.ID(+)'
      '  and kvit.BILL_ID IS NULL'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  AND MONTH.IS_EXP+0=1'
      '')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 80
    Top = 312
  end
  object qDelKvit: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */'
      'kvit.id as ID_MS,'
      #39'05'#39' as VSTEL,--'#1055#1091#1085#1082#1090' '#1086#1090#1075#1088#1091#1079#1082#1080'. 05 - '#1059#1093#1090#1072
      
        #39'50'#39' as V_MO,--'#1050#1086#1076' '#1092#1080#1079#1080#1095#1077#1089#1082#1086#1075#1086' '#1084#1077#1089#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1101#1089#1090#1072#1082#1072#1076#1072','#1072#1074#1090#1086#1085#1072#1083#1080#1074 +
        ' '#1080' '#1090'.'#1076'.)'
      
        '--NVL(ksss_partners.kunnr,r3_vbak.VBPA_KUNNR) as SHTP,-- R3-k'#1086#1076' ' +
        #1075#1088#1091#1079#1086#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103'('#1074' r3_customers '#1089#1086#1076#1077#1088#1078#1072#1090#1089#1103' '#1085#1077' '#1074#1089#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103'-'#1079#1072#1082 +
        #1072#1079#1095#1080#1082#1080')'
      'r3_vbak.VBPA_KUNNR as SHTP,'
      
        'r3_vbak.VBAK_VSBED as VSBED,--'#1059#1089#1083#1086#1074#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080'('#1089#1087#1086#1089#1086#1073' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1046 +
        #1044','#1072#1074#1090#1086#1090#1088#1072#1085#1089#1087#1086#1088#1090', '#1090#1088#1091#1073#1072' '#1080' '#1090'.'#1076'.)'
      'NVL(r3_kvit2sap.VBAK_VBELN,r3_vbak.VBELN) as RAZNAR,'
      'NVL(r3_kvit2sap.VBAP_POSNR,r3_vbak.VBAP_POSNR) as RAZNAR_P,'
      'null as N_RAZNAR,'
      'r3_kvit2sap.ID_SAP as ID_SAP,'
      'r3_kvit2sap.ID_SAP_PSN as ID_SAP_PSN,'
      'kvit.DATE_KVIT as LDDAT, -- '#1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1086#1075#1088#1091#1079#1082#1080
      'kvit.NUM_CIST as TRAID,'
      'kvit.NUM_KVIT as LIFEX,--'#1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1074#1082#1080
      'kvit.DATE_KVIT as WADAT, -- '#1044#1072#1090#1072' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1075#1088#1091#1079#1082#1080
      'KLS_VAGOWNER.r3_vsart_id AS VSART,--'#1042#1080#1076' '#1086#1090#1075#1088#1091#1079#1082#1080' ,'
      'kvit.VES_BRUTTO*1000 as LFIMG,--'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1075#1088#1091#1078#1077#1085#1085#1086#1075#1086' '#1085'/'#1087
      #39#1050#1043#39' as MEAS,--'#1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1074' '#1087#1086#1089#1090#1072#1074#1082#1077
      #39' '#39' as F_D_IND,--'#1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1079#1072#1087#1080#1089#1080
      #39'X'#39' as DEL,--'#1055#1088#1080#1079#1085#1072#1082' '#1091#1076#1072#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      
        'KLS_vagowner.R3_VENDORS_ID as SCPARTNER,--'#1057#1080#1090#1077#1084#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1086#1073#1089#1090#1074#1077 +
        #1085#1085#1080#1082#1072' R3'
      
        '(CASE WHEN kvit.ves_brutto>100 THEN '#39'27'#39' ELSE '#39'23'#39' END) as OIC_M' +
        'OT,--'#1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      'kvit.GTD as LADEL,'
      'null as STAWN,'
      'kls_pasp.PASP_NUM as QPASS,'
      'kvit.VES_BRUTTO*1000 as BRGEW,'
      'kvit.VES_BRUTTO*1000 as NTGEW,'
      #39#1050#1043#39' as GEWEI,'
      'kls_stan.rast as DISTANCE,'
      #39#39' as RENDERED,--'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103', '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1080#1074#1096#1072#1103' '#1074#1072#1075#1086#1085#1099'.'
      #39'0001001002'#39' as LIFNR,--'#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'('#1074#1089#1077#1075#1076#1072' '#1051#1091#1082#1086#1081#1083' '#1059#1053#1055')'
      
        'exped.KSSS_PREDPR_ID as KSSS_EXPED --, '#39'8'#39' as KSSS_INKOTERM, '#39'04' +
        '11501'#39' as ZAKUP_DOG_NUM'
      
        'from kvit,month,r3_vbak,sved,kls_pasp, kls_stan, r3_vsbed,kls_vi' +
        'd_otgr,r3_traty,KLS_VAGOWNER,KSSS_PARTNERS,KLS_PREDPR,r3_kvit2sa' +
        'p,kls_predpr exped'
      'where kvit.NOM_ZD=month.NOM_ZD'
      '  and kvit.DATE_KVIT=r3_vbak.VBAK_VDATU'
      '  and kvit.nom_zd=r3_vbak.NOM_ZD'
      '  and kvit.SVED_ID=sved.id(+)'
      '  and kvit.ID=r3_kvit2sap.KVIT_ID'
      '  and month.POLUCH_ID=KLS_PREDPR.ID(+)'
      '  and kls_predpr.KSSS_PREDPR_ID=ksss_partners.CONTRAGENT_ID(+)'
      '  and month.EXPED_ID=exped.ID(+)'
      '  and kvit.PASP_ID=kls_pasp.id(+)'
      '  and month.STAN_ID=kls_stan.id(+)'
      '  and month.LOAD_ABBR=KLS_VID_OTGR.LOAD_ABBR'
      '  and KLS_VID_OTGR.LOAD_TYPE_ID=r3_vsbed.FOX_ID(+)'
      '  and kvit.VAGOWNER_ID=KLS_vagowner.ID(+)'
      '  and kvit.VAGONTYPE_ID=r3_traty.FOX_ID(+)'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  and r3_kvit2sap.ID_SAP is not null'
      '  and r3_kvit2sap.ID_SAP_PSN is not null'
      '  and kvit.NUM_CIST LIKE '#39'%'#39
      '  AND MONTH.IS_EXP+0=1'
      '  '
      ''
      '')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 296
    Top = 312
  end
  object qSutRazn: TOracleDataSet
    SQL.Strings = (
      'select /*+ RULE */ '
      
        'TO_CHAR(kvit.DATE_KVIT,'#39'MMDD'#39')||'#39'/'#39'||SUBSTR(kvit.NOM_ZD,6,5) as ' +
        'RAZNAR,'
      'kvit.DATE_KVIT,'
      'kls_dog.SHORT_NUMBER as DOG_NUMBER,'
      'kls_prod.NAME_NPR as PROD_NAME,'
      'kls_prod.MATNR,'
      'r3_vbak.VBELN as R3_RAZNAR_NUM,'
      'SUM(kvit.VES_BRUTTO) as VES'
      'from kvit,month,kls_dog,kls_prod,r3_vbak'
      'where kvit.NOM_ZD=month.NOM_ZD'
      '  and kvit.NOM_ZD=r3_vbak.NOM_ZD(+)'
      '  and kvit.DATE_KVIT=r3_vbak.VBAK_VDATU(+)'
      '  and month.dog_id=kls_dog.id'
      '  and kvit.prod_id_npr=kls_prod.id_npr'
      '  and kvit.DATE_KVIT>=:BegDate'
      '  and kvit.DATE_KVIT<=:EndDate'
      '  AND MONTH.IS_EXP+0=1'
      'GROUP BY'
      'TO_CHAR(kvit.DATE_KVIT,'#39'MMDD'#39')||'#39'/'#39'||SUBSTR(kvit.NOM_ZD,6,5),'
      'kvit.DATE_KVIT,'
      'kls_dog.SHORT_NUMBER,'
      'kls_prod.NAME_NPR,'
      'kls_prod.MATNR,'
      'r3_vbak.VBELN')
    Variables.Data = {
      0300000002000000080000003A424547444154450C0000000000000000000000
      080000003A454E44444154450C0000000000000000000000}
    Session = f_main.ora_Session
    Left = 160
    Top = 392
  end
end
