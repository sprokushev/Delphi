object frmNariad: TfrmNariad
  Left = 0
  Top = 0
  Width = 750
  Height = 165
  Align = alTop
  AutoSize = True
  TabOrder = 0
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 750
    Height = 165
    Align = alTop
    DataSource = f_Sved.ds_NarLines
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TN'
        Footers = <>
      end>
  end
end
