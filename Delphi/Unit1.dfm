object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 654
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    935
    654)
  PixelsPerInch = 96
  TextHeight = 13
  object btGenerateGraph: TButton
    Left = 8
    Top = 8
    Width = 205
    Height = 25
    Caption = 'Generate graph'
    TabOrder = 0
    OnClick = btGenerateGraphClick
  end
  object Chromium1: TChromium
    Left = 451
    Top = 8
    Width = 476
    Height = 638
    Anchors = [akTop, akRight, akBottom]
    DefaultUrl = 'about:blank'
    TabOrder = 1
  end
  object btSavePDF: TButton
    Left = 219
    Top = 8
    Width = 226
    Height = 25
    Caption = 'Save to PDF'
    TabOrder = 2
    OnClick = btSavePDFClick
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 39
    Width = 437
    Height = 607
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'graph LR;'
      '  A-->B;'
      '  B-->C;')
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
end
