object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 382
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    585
    382)
  PixelsPerInch = 96
  TextHeight = 13
  object Chromium1: TChromium
    Left = 324
    Top = 8
    Width = 253
    Height = 366
    Anchors = [akLeft, akTop, akRight, akBottom]
    DefaultUrl = 'about:blank'
    TabOrder = 0
    Options.TextAreaResize = STATE_ENABLED
    Options.WindowlessFrameRate = 100
  end
  object btLoadGraph: TButton
    Left = 8
    Top = 8
    Width = 153
    Height = 25
    Caption = 'Generate Graph'
    TabOrder = 1
    OnClick = btLoadGraphClick
  end
  object btSaveToPDF: TButton
    Left = 160
    Top = 8
    Width = 158
    Height = 25
    Caption = 'Save to PDF'
    TabOrder = 2
    OnClick = btSaveToPDFClick
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 39
    Width = 310
    Height = 335
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'classDiagram'
      '    Class01 <|-- AveryLongClass : Cool'
      '    Class03 *-- Class04'
      '    Class05 o-- Class06'
      '    Class07 .. Class08'
      '    Class09 --> C2 : Where am i?'
      '    Class09 --* C3'
      '    Class09 --|> Class07'
      '    Class07 : equals()'
      '    Class07 : Object[] elementData'
      '    Class01 : size()'
      '    Class01 : int chimp'
      '    Class01 : int gorilla'
      '    Class08 <--> C2: Coola label')
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
end
