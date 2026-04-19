object FMain: TFMain
  Left = 342
  Top = 198
  Width = 606
  Height = 477
  Caption = 'Sting'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 96
    Top = 96
    object Seenekler1: TMenuItem
      Caption = 'Se'#231'enekler'
      object YeniDesen1: TMenuItem
        Action = acNewDesen
      end
    end
  end
  object ActionList1: TActionList
    Left = 128
    Top = 96
    object acNewDesen: TAction
      Caption = 'Yeni Desen'
      OnExecute = acNewDesenExecute
    end
  end
end
