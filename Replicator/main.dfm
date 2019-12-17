object f_main: Tf_main
  Left = 394
  Top = 267
  Width = 557
  Height = 171
  Caption = #1056#1077#1087#1083#1080#1082#1072#1090#1086#1088' v1.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TimerStart: TTimer
    OnTimer = TimerStartTimer
    Left = 32
    Top = 16
  end
  object EurekaLog1: TEurekaLog
    OnExceptionActionNotify = EurekaLog1ExceptionActionNotify
    OnExceptionErrorNotify = EurekaLog1ExceptionErrorNotify
    Left = 88
    Top = 16
  end
  object ora_Session: TOracleSession
    Left = 168
    Top = 24
  end
  object AppEvents1: TAppEvents
    ShowMainForm = False
    Left = 264
    Top = 32
  end
  object rxtiMain: TRxTrayIcon
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000007777770000000000000000
      0000000000000007000000000000000000000000000000070000000000000000
      0000000000777007000000000000000000077070007770070000700000000000
      0077000700787000000007000000000007708000077877000070007000000000
      07088807777777770777000700000000008F88877FFFFF077887700700000000
      00088888F88888FF08870070000000000000880888877778F070007000000007
      77088888880007778F770077777000700008F088007777077F07000000700700
      008F08880800077778F7700000700708888F0880F08F807078F7777700700708
      F88F0780F070F07078F7887700700708888F0780F077807088F7777700700700
      008F0788FF00080888F77000007000000008F0780FFFF0088F77007000000000
      0008F07788000888887700700000000000008F07788888880870007000000000
      00088FF0077788088887000700000000008F888FF00000F87887700700000000
      0708F8088FFFFF88078700700000000007708000088888000070070000000000
      0077007000888007000070000000000000077700008F80070007000000000000
      0000000000888007000000000000000000000000000000070000000000000000
      000000000777777700000000000000000000000000000000000000000000FFFF
      FFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043FF800001FF800
      000FF800000FFC00001FFE00001FE0000001C000000180000001800000018000
      00018000000180000001FC00001FFC00001FFE00001FFC00000FF800000FF800
      001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFFFFFFFFFF}
    Icons.Icons = {
      0C000000FE0200000000010001002020000000000000E8020000160000002800
      0000200000004000000001000400000000008002000000000000000000000000
      0000000000000000000000008000008000000080800080000000800080008080
      000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF
      0000FFFFFF000000000000000000030000000000000000000000000000033B33
      000000000000000000000000033BBB333000000000000000000000033BBBBB33
      33000000000000000000033BBBBBBB33333000000000000000033BBBBBBBBB33
      3333000000000000033BBBBBBBBBBB3333333000000000033BBBBBBBBBBBBB33
      333333000000003BBBBBBBBBBBBBFB33333333300000003BBBBBBBBBBBFFFB33
      3333333300000003BBBBBBBBFFF33B333333333300000003BBBBBBFFF3383B33
      33333333000000003BBBFFF3388F3B3333333330000000003BFFF3308FFF3B33
      333333300000000003B33808FFFF3B33333333300000000003B0880FFFFF3B33
      3333330000000000003B008FFFFF3B333333330000000000003B30FFFFFF3B33
      33333300000000000003038FFFFF3B3333333000000000000003008FFFFF3B33
      333330000000000000003B08FFFF3B33333330000000000000003B08FFFF3B33
      3333000000000000000003B08FFF3B3333330000000000007F0003B08FFF3B33
      33330000000000007F00003B08F83B3333300000000000000000003B08803FB3
      333000000000000000000003B00FFB3B333000000000000000000003BFFBBBB3
      B300000000000000000000003BBBBB3B300000000000000000000000033FFFB3
      00000000000000000000000000033F3000000000000000000000000000000330
      000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FFFF8000FFFE00007FF800
      003FE000001FC000000FC0000007E0000007E0000007F000000FF000000FF800
      000FF800001FFC00001FFC00001FFE00003FFE00003FFE00003FFE00007FF980
      007FF180007FF1C000FFFBC000FFFFE000FFFFE001FFFFF003FFFFF807FFFFFE
      0FFFFFFF9FFFFE0200000000010001002020000000000000E802000016000000
      2800000020000000400000000100040000000000800200000000000000000000
      0000000000000000000000000000800000800000008080008000000080008000
      8080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00
      FFFF0000FFFFFF00000000000000000003000000000000000000000000000003
      3B33000000000000000000000000033BBB333000000000000000000000033BBB
      BB3333000000000000000000033BBBBBBB33333000000000000000033BBBBBBB
      BB333333000000000000033BBBBBBBBBBB3333333000000000033BBBBBBBBBBB
      BB33333333000000003BBBBBBBBBBBBBFB33333333300000003BBBBBBBBBBBFF
      FB333333333300000003BBBBBBBBFFF33B333333333300000003BBBBBBFFF338
      3B3333333333000000003BBBFFF3388F3B3333333330000000003BFFF3308FFF
      3B33333333300000000003B33870FFFF3B33333333300000000003B08F07FFFF
      3B333333330000000000003B080FFFFF3B333333330000000000003B080FFFFF
      3B3333333300000000000003B00FFFFF3B3333333000000000000003B30FFFFF
      3B33333330000000000000003038FFFF3B33333330000000000000003008FFFF
      3B333333000000000000000000B08FFF3B333333000000000000000000B08FFF
      3B3333330000000000000007F03B08F83B3333300000000000000007703B0880
      3FB3333000000000000000000003B00FFB3B333000000000000000000003BFFB
      BBB3B300000000000000000000003BBBBB3B300000000000000000000000033F
      FFB300000000000000000000000000033F300000000000000000000000000000
      0330000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FFFF8000FFFE00007F
      F800003FE000001FC000000FC0000007E0000007E0000007F000000FF000000F
      F800000FF800001FFC00001FFC00001FFE00003FFE00003FFF00003FFF00007F
      FF80007FFF00007FFE0000FFFE0000FFFF6000FFFFE001FFFFF003FFFFF807FF
      FFFE0FFFFFFF9FFFFE0200000000010001002020000000000000E80200001600
      0000280000002000000040000000010004000000000080020000000000000000
      0000000000000000000000000000000080000080000000808000800000008000
      80008080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000000000300000000000000000000000000
      00033B33000000000000000000000000033BBB33300000000000000000000003
      3BBBBB3333000000000000000000033BBBBBBB33333000000000000000033BBB
      BBBBBB333333000000000000033BBBBBBBBBBB3333333000000000033BBBBBBB
      BBBBBB33333333000000003BBBBBBBBBBBBBFB33333333300000003BBBBBBBBB
      BBFFFB333333333300000003BBBBBBBBFFF33B333333333300000003BBBBBBFF
      F3383B3333333333000000003BBBFFF3388F3B3333333330000000003BFFF330
      8FFF3B33333333300000000003B33880FFFF3B33333333300000000003B08FF0
      FFFF3B333333330000000000003B08F0FFFF3B333333330000000000003B08F0
      FFFF3B3333333300000000000003B080FFFF3B3333333000000000000003B080
      FFFF3B33333330000000000000003B00FFFF3B33333330000000000000003B00
      FFFF3B333333000000000000000003B08FFF3B333333000000000000000003B0
      8FFF3B3333330000000000000000007F08F83B33333000000000000000000077
      08803FB3333000000000000000000000B00FFB3B333000000000000000000003
      BFFBBBB3B300000000000000000000003BBBBB3B300000000000000000000000
      033FFFB300000000000000000000000000033F30000000000000000000000000
      00000330000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FFFF8000FFFE00
      007FF800003FE000001FC000000FC0000007E0000007E0000007F000000FF000
      000FF800000FF800001FFC00001FFC00001FFE00003FFE00003FFF00003FFF00
      007FFF80007FFF80007FFFC000FFFFC000FFFFE000FFFFE001FFFFF003FFFFF8
      07FFFFFE0FFFFFFF9FFFFE0200000000010001002020000000000000E8020000
      1600000028000000200000004000000001000400000000008002000000000000
      0000000000000000000000000000000000008000008000000080800080000000
      800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF000000
      FF00FF00FFFF0000FFFFFF000000000000000000030000000000000000000000
      000000033B33000000000000000000000000033BBB3330000000000000000000
      00033BBBBB3333000000000000000000033BBBBBBB3333300000000000000003
      3BBBBBBBBB333333000000000000033BBBBBBBBBBB3333333000000000033BBB
      BBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB33333333300000003BBBBB
      BBBBBBFFFB333333333300000003BBBBBBBBFFF33B333333333300000003BBBB
      BBFFF3383B3333333333000000003BBBFFF3388F3B3333333330000000003BFF
      F3380FFF3B33333333300000000003B3388F0FFF3B33333333300000000003B0
      8FFF08FF3B333333330000000000003B08FF77FF3B333333330000000000003B
      08FF80FF3B3333333300000000000003B08FF0FF3B3333333000000000000003
      B08FF08F3B33333330000000000000003B08F77F3B3333333000000000000000
      3B08F80F3B333333000000000000000003B08F0F3B3333330000000000000000
      03B08F003B3333330000000000000000003B087F0B3333300000000000000000
      003B08770FB3333000000000000000000003B000FB3B33300000000000000000
      0003BFFBBBB3B300000000000000000000003BBBBB3B30000000000000000000
      0000033FFFB300000000000000000000000000033F3000000000000000000000
      000000000330000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FFFF8000FF
      FE00007FF800003FE000001FC000000FC0000007E0000007E0000007F000000F
      F000000FF800000FF800001FFC00001FFC00001FFE00003FFE00003FFF00003F
      FF00007FFF80007FFF80007FFFC000FFFFC000FFFFE000FFFFE001FFFFF003FF
      FFF807FFFFFE0FFFFFFF9FFFFE0200000000010001002020000000000000E802
      0000160000002800000020000000400000000100040000000000800200000000
      0000000000000000000000000000000000000000800000800000008080008000
      0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
      0000FF00FF00FFFF0000FFFFFF00000000000000000003000000000000000000
      0000000000033B33000000000000000000000000033BBB333000000000000000
      000000033BBBBB3333000000000000000000033BBBBBBB333330000000000000
      00033BBBBBBBBB333333000000000000033BBBBBBBBBBB333333300000000003
      3BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB33333333300000003B
      BBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF33B333333333300000003
      BBBBBBFFF3383B3333333333000000003BBBFFF3388F3B333333333000000000
      3BFFF3380FFF3B33333333300000000003B3388FF0FF3B333333333000000000
      03B08FFFF0FF3B333333330000000000003B08FFFF0F3B333333330000000000
      003B08FFFF0F3B3333333300000000000003B08FFFF03B333333300000000000
      0003B08FFFF03B33333330000000000000003B08FFFF0B333333300000000000
      00003B08FFFF0B333333000000000000000003B08FFF30033333000000000000
      000003B08FFF30F033330000000000000000003B08F837703330000000000000
      0000003B08803F03333000000000000000000003B00FFB3B3330000000000000
      00000003BFFBBBB3B300000000000000000000003BBBBB3B3000000000000000
      00000000033FFFB300000000000000000000000000033F300000000000000000
      0000000000000330000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FFFF80
      00FFFE00007FF800003FE000001FC000000FC0000007E0000007E0000007F000
      000FF000000FF800000FF800001FFC00001FFC00001FFE00003FFE00003FFF00
      003FFF00007FFF80007FFF80007FFFC000FFFFC000FFFFE000FFFFE001FFFFF0
      03FFFFF807FFFFFE0FFFFFFF9FFFFE0200000000010001002020000000000000
      E802000016000000280000002000000040000000010004000000000080020000
      0000000000000000000000000000000000000000000080000080000000808000
      80000000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00
      FF000000FF00FF00FFFF0000FFFFFF0000000000000000000300000000000000
      00000000000000033B33000000000000000000000000033BBB33300000000000
      0000000000033BBBBB3333000000000000000000033BBBBBBB33333000000000
      000000033BBBBBBBBB333333000000000000033BBBBBBBBBBB33333330000000
      00033BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB33333333300000
      003BBBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF33B33333333330000
      0003BBBBBBFFF3383B3333333333000000003BBBFFF3388F3B33333333300000
      00003BFFF33807FF3B33333333300000000003B3388FF07F3B33333333300000
      000003B08FFFFF073B333333330000000000003B08FFFFF07B33333333000000
      0000003B08FFFFFF073333333300000000000003B08FFFFF3033333330000000
      00000003B08FFFFF3B03333330000000000000003B08FFFF3B30033330000000
      000000003B08FFFF3B37F033000000000000000003B08FFF3B37703300000000
      0000000003B08FFF3B3333330000000000000000003B08F83B33333000000000
      00000000003B08803FB3333000000000000000000003B00FFB3B333000000000
      000000000003BFFBBBB3B300000000000000000000003BBBBB3B300000000000
      000000000000033FFFB300000000000000000000000000033F30000000000000
      00000000000000000330000000000000FFFF8FFFFFFE07FFFFF803FFFFE001FF
      FF8000FFFE00007FF800003FE000001FC000000FC0000007E0000007E0000007
      F000000FF000000FF800000FF800001FFC00001FFC00001FFE00003FFE00003F
      FF00003FFF00007FFF80007FFF80007FFFC000FFFFC000FFFFE000FFFFE001FF
      FFF003FFFFF807FFFFFE0FFFFFFF9FFFFE020000000001000100202000000000
      0000E80200001600000028000000200000004000000001000400000000008002
      0000000000000000000000000000000000000000000000008000008000000080
      800080000000800080008080000080808000C0C0C0000000FF0000FF000000FF
      FF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000030000000000
      000000000000000000033B33000000000000000000000000033BBB3330000000
      00000000000000033BBBBB3333000000000000000000033BBBBBBB3333300000
      0000000000033BBBBBBBBB333333000000000000033BBBBBBBBBBB3333333000
      000000033BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB3333333330
      0000003BBBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF33B3333333333
      00000003BBBBBBFFF3383B3333333333000000003BBBFFF3388F3B3333333330
      000000003BFFF338007F3B33333333300000000003B3388FFF007B3333333330
      0000000003B08FFFFFFF00333333330000000000003B08FFFFFF3B0033333300
      00000000003B08FFFFFF3B3300300300000000000003B08FFFFF3B33337F0000
      000000000003B08FFFFF3B33333700000000000000003B08FFFF3B3333333000
      0000000000003B08FFFF3B333333000000000000000003B08FFF3B3333330000
      00000000000003B08FFF3B3333330000000000000000003B08F83B3333300000
      000000000000003B08803FB3333000000000000000000003B00FFB3B33300000
      0000000000000003BFFBBBB3B300000000000000000000003BBBBB3B30000000
      0000000000000000033FFFB300000000000000000000000000033F3000000000
      000000000000000000000330000000000000FFFF8FFFFFFE07FFFFF803FFFFE0
      01FFFF8000FFFE00007FF800003FE000001FC000000FC0000007E0000007E000
      0007F000000FF000000FF800000FF800001FFC00001FFC00001FFE00003FFE00
      003FFF00003FFF00007FFF80007FFF80007FFFC000FFFFC000FFFFE000FFFFE0
      01FFFFF003FFFFF807FFFFFE0FFFFFFF9FFFFE02000000000100010020200000
      00000000E8020000160000002800000020000000400000000100040000000000
      8002000000000000000000000000000000000000000000000000800000800000
      0080800080000000800080008080000080808000C0C0C0000000FF0000FF0000
      00FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000000003000000
      0000000000000000000000033B33000000000000000000000000033BBB333000
      000000000000000000033BBBBB3333000000000000000000033BBBBBBB333330
      00000000000000033BBBBBBBBB333333000000000000033BBBBBBBBBBB333333
      3000000000033BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB333333
      33300000003BBBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF33B333333
      333300000003BBBBBBFFF3383B3333333333000000003BBBFFF3388F3B333333
      3330000000003BFFF33807FF3B33333333300000000003B3388FF07F3B333333
      33300000000003B08FFFFF073B333333330000000000003B08FFFFF07B333333
      330000000000003B08FFFFFF073333333300000000000003B08FFFFF30333333
      3000000000000003B08FFFFF3B03333330000000000000003B08FFFF3B300333
      30000000000000003B08FFFF3B37F033000000000000000003B08FFF3B377033
      000000000000000003B08FFF3B3333330000000000000000003B08F83B333330
      0000000000000000003B08803FB3333000000000000000000003B00FFB3B3330
      00000000000000000003BFFBBBB3B300000000000000000000003BBBBB3B3000
      00000000000000000000033FFFB300000000000000000000000000033F300000
      0000000000000000000000000330000000000000FFFF8FFFFFFE07FFFFF803FF
      FFE001FFFF8000FFFE00007FF800003FE000001FC000000FC0000007E0000007
      E0000007F000000FF000000FF800000FF800001FFC00001FFC00001FFE00003F
      FE00003FFF00003FFF00007FFF80007FFF80007FFFC000FFFFC000FFFFE000FF
      FFE001FFFFF003FFFFF807FFFFFE0FFFFFFF9FFFFE0200000000010001002020
      000000000000E802000016000000280000002000000040000000010004000000
      0000800200000000000000000000000000000000000000000000000080000080
      00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
      000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000300
      00000000000000000000000000033B33000000000000000000000000033BBB33
      3000000000000000000000033BBBBB3333000000000000000000033BBBBBBB33
      333000000000000000033BBBBBBBBB333333000000000000033BBBBBBBBBBB33
      33333000000000033BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBBFB33
      333333300000003BBBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF33B33
      3333333300000003BBBBBBFFF3383B3333333333000000003BBBFFF3388F3B33
      33333330000000003BFFF3380FFF3B33333333300000000003B3388FF0FF3B33
      333333300000000003B08FFFF0FF3B333333330000000000003B08FFFF0F3B33
      3333330000000000003B08FFFF0F3B3333333300000000000003B08FFFF03B33
      33333000000000000003B08FFFF03B33333330000000000000003B08FFFF0B33
      333330000000000000003B08FFFF0B333333000000000000000003B08FFF3003
      3333000000000000000003B08FFF30F033330000000000000000003B08F83770
      33300000000000000000003B08803F03333000000000000000000003B00FFB3B
      333000000000000000000003BFFBBBB3B300000000000000000000003BBBBB3B
      300000000000000000000000033FFFB300000000000000000000000000033F30
      00000000000000000000000000000330000000000000FFFF8FFFFFFE07FFFFF8
      03FFFFE001FFFF8000FFFE00007FF800003FE000001FC000000FC0000007E000
      0007E0000007F000000FF000000FF800000FF800001FFC00001FFC00001FFE00
      003FFE00003FFF00003FFF00007FFF80007FFF80007FFFC000FFFFC000FFFFE0
      00FFFFE001FFFFF003FFFFF807FFFFFE0FFFFFFF9FFFFE020000000001000100
      2020000000000000E80200001600000028000000200000004000000001000400
      0000000080020000000000000000000000000000000000000000000000008000
      008000000080800080000000800080008080000080808000C0C0C0000000FF00
      00FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000000000000000
      030000000000000000000000000000033B33000000000000000000000000033B
      BB333000000000000000000000033BBBBB3333000000000000000000033BBBBB
      BB33333000000000000000033BBBBBBBBB333333000000000000033BBBBBBBBB
      BB3333333000000000033BBBBBBBBBBBBB33333333000000003BBBBBBBBBBBBB
      FB33333333300000003BBBBBBBBBBBFFFB333333333300000003BBBBBBBBFFF3
      3B333333333300000003BBBBBBFFF3383B3333333333000000003BBBFFF3388F
      3B3333333330000000003BFFF3380FFF3B33333333300000000003B3388F0FFF
      3B33333333300000000003B08FFF08FF3B333333330000000000003B08FF77FF
      3B333333330000000000003B08FF80FF3B3333333300000000000003B08FF0FF
      3B3333333000000000000003B08FF08F3B33333330000000000000003B08F77F
      3B33333330000000000000003B08F80F3B333333000000000000000003B08F0F
      3B333333000000000000000003B08F003B3333330000000000000000003B087F
      0B3333300000000000000000003B08770FB3333000000000000000000003B000
      FB3B333000000000000000000003BFFBBBB3B300000000000000000000003BBB
      BB3B300000000000000000000000033FFFB30000000000000000000000000003
      3F3000000000000000000000000000000330000000000000FFFF8FFFFFFE07FF
      FFF803FFFFE001FFFF8000FFFE00007FF800003FE000001FC000000FC0000007
      E0000007E0000007F000000FF000000FF800000FF800001FFC00001FFC00001F
      FE00003FFE00003FFF00003FFF00007FFF80007FFF80007FFFC000FFFFC000FF
      FFE000FFFFE001FFFFF003FFFFF807FFFFFE0FFFFFFF9FFFFE02000000000100
      01002020000000000000E8020000160000002800000020000000400000000100
      0400000000008002000000000000000000000000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      0000030000000000000000000000000000033B33000000000000000000000000
      033BBB333000000000000000000000033BBBBB3333000000000000000000033B
      BBBBBB33333000000000000000033BBBBBBBBB333333000000000000033BBBBB
      BBBBBB3333333000000000033BBBBBBBBBBBBB33333333000000003BBBBBBBBB
      BBBBFB33333333300000003BBBBBBBBBBBFFFB333333333300000003BBBBBBBB
      FFF33B333333333300000003BBBBBBFFF3383B3333333333000000003BBBFFF3
      388F3B3333333330000000003BFFF3308FFF3B33333333300000000003B33880
      FFFF3B33333333300000000003B08FF0FFFF3B333333330000000000003B08F0
      FFFF3B333333330000000000003B08F0FFFF3B3333333300000000000003B080
      FFFF3B3333333000000000000003B080FFFF3B33333330000000000000003B00
      FFFF3B33333330000000000000003B00FFFF3B333333000000000000000003B0
      8FFF3B333333000000000000000003B08FFF3B3333330000000000000000007F
      08F83B3333300000000000000000007708803FB3333000000000000000000000
      B00FFB3B333000000000000000000003BFFBBBB3B30000000000000000000000
      3BBBBB3B300000000000000000000000033FFFB3000000000000000000000000
      00033F3000000000000000000000000000000330000000000000FFFF8FFFFFFE
      07FFFFF803FFFFE001FFFF8000FFFE00007FF800003FE000001FC000000FC000
      0007E0000007E0000007F000000FF000000FF800000FF800001FFC00001FFC00
      001FFE00003FFE00003FFF00003FFF00007FFF80007FFF80007FFFC000FFFFC0
      00FFFFE000FFFFE001FFFFF003FFFFF807FFFFFE0FFFFFFF9FFFFE0200000000
      010001002020000000000000E802000016000000280000002000000040000000
      0100040000000000800200000000000000000000000000000000000000000000
      00008000008000000080800080000000800080008080000080808000C0C0C000
      0000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000
      00000000030000000000000000000000000000033B3300000000000000000000
      0000033BBB333000000000000000000000033BBBBB3333000000000000000000
      033BBBBBBB33333000000000000000033BBBBBBBBB333333000000000000033B
      BBBBBBBBBB3333333000000000033BBBBBBBBBBBBB33333333000000003BBBBB
      BBBBBBBBFB33333333300000003BBBBBBBBBBBFFFB333333333300000003BBBB
      BBBBFFF33B333333333300000003BBBBBBFFF3383B3333333333000000003BBB
      FFF3388F3B3333333330000000003BFFF3308FFF3B33333333300000000003B3
      3870FFFF3B33333333300000000003B08F07FFFF3B333333330000000000003B
      080FFFFF3B333333330000000000003B080FFFFF3B3333333300000000000003
      B00FFFFF3B3333333000000000000003B30FFFFF3B3333333000000000000000
      3038FFFF3B33333330000000000000003008FFFF3B3333330000000000000000
      00B08FFF3B333333000000000000000000B08FFF3B3333330000000000000007
      F03B08F83B3333300000000000000007703B08803FB333300000000000000000
      0003B00FFB3B333000000000000000000003BFFBBBB3B3000000000000000000
      00003BBBBB3B300000000000000000000000033FFFB300000000000000000000
      000000033F3000000000000000000000000000000330000000000000FFFF8FFF
      FFFE07FFFFF803FFFFE001FFFF8000FFFE00007FF800003FE000001FC000000F
      C0000007E0000007E0000007F000000FF000000FF800000FF800001FFC00001F
      FC00001FFE00003FFE00003FFF00003FFF00007FFF80007FFF00007FFE0000FF
      FE0000FFFF6000FFFFE001FFFFF003FFFFF807FFFFFE0FFFFFFF9FFF}
    Left = 360
    Top = 32
  end
end