object Recursos2: TRecursos2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Reciclagem'
  ClientHeight = 127
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 27
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Metal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Cristal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 59
    Width = 51
    Height = 13
    Caption = 'Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 3
    Top = 74
    Width = 59
    Height = 13
    Caption = '(Opcional)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 64
    Top = 8
    Width = 161
    Height = 17
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = Memo1Change
    OnKeyPress = Memo1KeyPress
  end
  object Memo2: TMemo
    Left = 64
    Top = 24
    Width = 161
    Height = 17
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = Memo1Change
    OnKeyPress = Memo1KeyPress
  end
  object Button1: TButton
    Left = 91
    Top = 104
    Width = 75
    Height = 15
    Caption = '+'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Memo3: TMemo
    Left = 64
    Top = 56
    Width = 161
    Height = 33
    Hint = 
      'Exemplo:|"Metal: 12.345 Cristal: 67.890" ou "Nestas coordenadas ' +
      'flutuam: 30.725.250 de metal e 16.069.650 de cristal."'
    CustomHint = BalloonHint1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnChange = Memo3Change
    OnEnter = Memo3Enter
  end
  object BalloonHint1: TBalloonHint
    Style = bhsStandard
    Delay = 50
    Left = 184
    Top = 91
  end
end
