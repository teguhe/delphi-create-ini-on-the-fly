object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Manage Ini Files'
  ClientHeight = 442
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btCheck: TButton
    Left = 16
    Top = 16
    Width = 393
    Height = 25
    Caption = 'Cek apakah file config.ini tersedia'
    TabOrder = 0
    OnClick = btCheckClick
  end
  object btHapus: TButton
    Left = 415
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Hapus config.ini'
    TabOrder = 1
  end
  object btLoad: TButton
    Left = 16
    Top = 47
    Width = 145
    Height = 25
    Caption = 'Baca config.ini'
    TabOrder = 2
    OnClick = btLoadClick
  end
  object mmoIni: TMemo
    Left = 16
    Top = 78
    Width = 528
    Height = 339
    Lines.Strings = (
      'mmoIni')
    ReadOnly = True
    TabOrder = 3
  end
end
