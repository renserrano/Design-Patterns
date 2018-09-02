object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'State - Console'
  ClientHeight = 568
  ClientWidth = 1026
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 1026
    Height = 535
    Align = alClient
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 535
    Width = 1026
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnTestDrive: TButton
      Left = 6
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Test drive'
      TabOrder = 0
      OnClick = btnTestDriveClick
    end
  end
end
