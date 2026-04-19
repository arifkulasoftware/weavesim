object FDesen: TFDesen
  Left = 266
  Top = 148
  Width = 594
  Height = 442
  Caption = 'Desen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefaultPosOnly
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 381
    Top = 57
    Width = 3
    Height = 339
    Cursor = crHSplit
    Align = alRight
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 8
      Width = 33
      Height = 13
      Caption = #214'rg'#252' X'
    end
    object Label2: TLabel
      Left = 56
      Top = 8
      Width = 18
      Height = 13
      Caption = 'Atk'#305
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 30
      Height = 13
      Caption = #199#246'zg'#252
    end
    object Label4: TLabel
      Left = 168
      Top = 8
      Width = 33
      Height = 13
      Caption = #214'rg'#252' Y'
    end
    object SpeedButton1: TSpeedButton
      Left = 224
      Top = 24
      Width = 23
      Height = 22
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Layout = blGlyphBottom
      ParentFont = False
    end
    object SpinEdit1: TSpinEdit
      Left = 8
      Top = 24
      Width = 49
      Height = 22
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 5
    end
    object SpinEdit2: TSpinEdit
      Left = 56
      Top = 24
      Width = 49
      Height = 22
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 5
    end
    object SpinEdit4: TSpinEdit
      Left = 168
      Top = 24
      Width = 49
      Height = 22
      MaxLength = 3
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 396
    Width = 586
    Height = 19
    Panels = <
      item
        Text = #199#246'zg'#252
        Width = 50
      end
      item
        Width = 50
      end
      item
        Text = 'Atk'#305
        Width = 50
      end
      item
        Width = 50
      end
      item
        Text = #214'rg'#252'X'
        Width = 50
      end
      item
        Width = 50
      end
      item
        Text = #214'rg'#252'Y'
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 57
    Width = 381
    Height = 339
    Align = alClient
    TabOrder = 2
    object TopBox: TPaintBox
      Tag = 1
      Left = 0
      Top = 0
      Width = 340
      Height = 10
      OnMouseUp = TopBoxMouseUp
      OnPaint = TLBoxPaint
    end
    object LeftBox: TPaintBox
      Tag = 2
      Left = 0
      Top = 10
      Width = 10
      Height = 284
      OnMouseUp = LeftBoxMouseUp
      OnPaint = TLBoxPaint
    end
    object InBox: TPaintBox
      Left = 10
      Top = 10
      Width = 330
      Height = 284
      OnPaint = InBoxPaint
    end
  end
  object Panel2: TPanel
    Left = 384
    Top = 57
    Width = 202
    Height = 339
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 2
      Top = 129
      Width = 198
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object ScrollBox2: TScrollBox
      Left = 2
      Top = 2
      Width = 198
      Height = 127
      Align = alTop
      TabOrder = 0
      object OrguBox: TPaintBox
        Left = 0
        Top = 0
        Width = 177
        Height = 123
        OnMouseUp = OrguBoxMouseUp
        OnPaint = OrguBoxPaint
      end
    end
    object ScrollBox3: TScrollBox
      Left = 2
      Top = 132
      Width = 198
      Height = 205
      Align = alClient
      TabOrder = 1
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 194
        Height = 201
        Align = alClient
        OnClick = Image1Click
      end
    end
  end
  object SpinEdit3: TSpinEdit
    Left = 112
    Top = 24
    Width = 49
    Height = 22
    MaxLength = 3
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 2
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 96
    Top = 80
  end
end
