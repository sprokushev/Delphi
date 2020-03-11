object f_main: Tf_main
  Left = 200
  Top = 110
  Width = 1088
  Height = 750
  Caption = 'f_main'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IdTCPServer: TIdTCPServer
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 50001
      end>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnExecute = IdTCPServerExecute
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 44
    Top = 12
  end
  object PingICMP: Ticmp
    Address = -1
    HostName = '0.0.0.0'
    TimeOut = 1000
    HostIP = '0.0.0.0'
    status = 0
    AlwaysResolve = True
    Left = 124
    Top = 16
  end
  object ADOQuery: TADOQuery
    Parameters = <>
    Left = 40
    Top = 72
  end
end
