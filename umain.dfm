object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Test input floating Point -> Single, Double, Extended'
  ClientHeight = 442
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    656
    442)
  TextHeight = 15
  object lb1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 15
    Caption = 'Initial Value'
  end
  object lb2: TLabel
    Left = 8
    Top = 43
    Width = 54
    Height = 15
    Caption = 'Increment'
  end
  object lb3: TLabel
    Left = 9
    Top = 139
    Width = 93
    Height = 15
    Caption = 'Data ter-Generate'
  end
  object lb4: TLabel
    Left = 8
    Top = 70
    Width = 33
    Height = 15
    Caption = 'Count'
  end
  object lb5: TLabel
    Left = 400
    Top = 67
    Width = 16
    Height = 15
    Caption = 'lb5'
  end
  object lb6: TLabel
    Left = 400
    Top = 88
    Width = 16
    Height = 15
    Caption = 'lb6'
  end
  object nbInitial: TNumberBox
    Left = 112
    Top = 13
    Width = 121
    Height = 23
    Alignment = taRightJustify
    Mode = nbmFloat
    TabOrder = 1
    Value = 80.210000000000000000
  end
  object nbIncrement: TNumberBox
    Left = 112
    Top = 40
    Width = 121
    Height = 23
    Alignment = taRightJustify
    Mode = nbmFloat
    TabOrder = 2
    Value = 0.010000000000000000
  end
  object btn1: TButton
    Left = 112
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Process'
    TabOrder = 4
    OnClick = btn1Click
  end
  object nbCount: TNumberBox
    Left = 112
    Top = 67
    Width = 121
    Height = 23
    Alignment = taRightJustify
    TabOrder = 3
    Value = 15.000000000000000000
  end
  object RzPageControl1: TRzPageControl
    Left = 8
    Top = 160
    Width = 640
    Height = 274
    Hint = ''
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabIndex = 2
    TabOrder = 0
    FixedDimension = 21
    object TabSheet1: TRzTabSheet
      Caption = 'String Grid [ Direct ]'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sgData: TRzStringGrid
        Left = 5
        Top = 5
        Width = 626
        Height = 239
        Align = alClient
        TabOrder = 0
        ExplicitLeft = -196
        ExplicitTop = -247
        ExplicitWidth = 500
        ExplicitHeight = 372
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'String Grid [ Database ]'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sgDataBase: TRzStringGrid
        Left = 5
        Top = 5
        Width = 626
        Height = 239
        Align = alClient
        TabOrder = 0
        ExplicitLeft = -196
        ExplicitTop = -247
        ExplicitWidth = 500
        ExplicitHeight = 372
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'tempData'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      ExplicitLeft = -55
      ExplicitTop = 78
      object mmo1: TMemo
        Left = 272
        Top = 13
        Width = 345
        Height = 132
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Source Code Pro'
        Font.Style = []
        Lines.Strings = (
          'mmo1')
        ParentFont = False
        TabOrder = 6
        Visible = False
      end
      object btn2: TButton
        Left = 64
        Top = 82
        Width = 75
        Height = 23
        Caption = 'btn2'
        TabOrder = 4
        OnClick = btn2Click
      end
      object NumberBox1: TNumberBox
        Left = 18
        Top = 28
        Width = 121
        Height = 23
        Alignment = taRightJustify
        Mode = nbmFloat
        TabOrder = 0
        Value = 80.200000000000000000
      end
      object edt1: TEdit
        Left = 18
        Top = 109
        Width = 121
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 2
        Text = 'edt1'
      end
      object edt2: TEdit
        Left = 18
        Top = 136
        Width = 121
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 3
        Text = 'edt1'
      end
      object edt3: TEdit
        Left = 154
        Top = 82
        Width = 121
        Height = 23
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 5
        Text = 'edt1'
      end
      object NumberBox2: TNumberBox
        Left = 18
        Top = 55
        Width = 121
        Height = 23
        Alignment = taRightJustify
        Mode = nbmFloat
        TabOrder = 1
        Value = 1.000000000000000000
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=test_floating'
      'User_Name=aplikasi'
      'Password=kinerjaAplikasi2020'
      'Server=103.230.100.149'
      'Port=30306'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 544
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\Documents Sync\APPS PROJECT\DELPHI 11 VCL\TEST INPUT DECIMAL ' +
      'SEQUENCE MARIADB\Win32\Release\lib\libmysql.dll'
    Left = 544
    Top = 72
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 544
    Top = 128
  end
end
