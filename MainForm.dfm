object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Version Lister'
  ClientHeight = 336
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  DesignSize = (
    681
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 8
    Top = 32
    Width = 665
    Height = 279
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'FileName'
        Width = 100
      end
      item
        Caption = 'ProdVersion'
        Width = 100
      end
      item
        Caption = 'LastModified'
        Width = 100
      end
      item
        Caption = 'Company'
        Width = 100
      end
      item
        Caption = 'FilePath'
        Width = 244
      end>
    FullDrag = True
    OwnerData = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 2
    ViewStyle = vsReport
    OnColumnClick = ListView1ColumnClick
    OnContextPopup = ListView1ContextPopup
    OnData = ListView1Data
    OnMouseUp = ListView1MouseUp
  end
  object btnSearch: TButton
    Left = 515
    Top = 2
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Search'
    ImageIndex = 0
    Images = ImageList1
    TabOrder = 0
    OnClick = btnSearchClick
  end
  object btnAbort: TButton
    Left = 596
    Top = 2
    Width = 74
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Abort'
    Enabled = False
    ImageIndex = 3
    Images = ImageList1
    TabOrder = 1
    OnClick = btnAbortClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 317
    Width = 681
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ParentFont = True
    UseSystemFont = False
  end
  object pnlCond: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 32
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 188
      Top = 0
      Height = 32
    end
    object JvDirectoryEdit1: TJvDirectoryEdit
      AlignWithMargins = True
      Left = 8
      Top = 4
      Width = 177
      Height = 23
      Margins.Left = 8
      Margins.Top = 4
      Margins.Bottom = 5
      Align = alLeft
      DialogKind = dkWin32
      TabOrder = 0
      Text = 'C:\'
    end
    object edtFileMask: TEdit
      AlignWithMargins = True
      Left = 194
      Top = 4
      Width = 316
      Height = 23
      Margins.Top = 4
      Margins.Bottom = 5
      Align = alClient
      TabOrder = 1
      Text = 'ssleay*.dll;libeay*.dll;openssl*.exe'
      TextHint = 'File Mask (e.g.  "ssl*.dll;*ssl*.exe")'
    end
  end
  object JvSearchFiles1: TJvSearchFiles
    RootDirectory = 'C:\'
    DirParams.MinSize = 0
    DirParams.MaxSize = 0
    FileParams.SearchTypes = [stFileMask]
    FileParams.MinSize = 0
    FileParams.MaxSize = 0
    FileParams.FileMasks.Strings = (
      's*.dll')
    OnBeginScanDir = JvSearchFiles1BeginScanDir
    OnFindFile = JvSearchFiles1FindFile
    OnProgress = JvSearchFiles1Progress
    Left = 520
    Top = 72
  end
  object ImageList1: TImageList
    ColorDepth = cd32Bit
    Left = 464
    Top = 72
    Bitmap = {
      494C010106000900040010001000FFFFFFFF2100FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      00000000000000000000000000000000000000000000028DBEFF028DBEFF028D
      BEFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028D
      BEFF028DBEFF0000000000000000000000000000000000000000C2A6A4FFC2A6
      A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6
      A4FFC2A6A4FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF20A1D1FF6CC6E8FF84D7
      FAFF61CDF9FF60CDF9FF60CDF9FF60CDF9FF60CDF8FF60CDF9FF60CDF8FF61CE
      F9FF35ADD8FF1499C9FF00000000000000000000000000000000C2A6A4FFFEFC
      FBFFFEFCFBFFFEFCFBFFFEFCFBFFFEFCFBFFFEFCFBFFFEFCFBFFFEFCFBFFFEFC
      FBFFFEFCFBFFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF47BCE7FF34A8D1FFA0E2
      FBFF6AD4FAFF6AD4F9FF69D4FAFF6AD4F9FF6AD4FAFF6AD4FAFF6AD4FAFF69D4
      F9FF39B1D9FFC9F0F3FF028DBEFF000000000000000000000000C2A6A4FFFEFC
      FBFF992E00FF992E00FF992E00FF992E00FF992E00FF992E00FF992E00FF992E
      00FFFEFCFBFFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF6DD6FAFF028DBEFFAEE9
      FCFF74DCFBFF74DCFBFF74DCFBFF74DCFBFF74DCFBFF75DCFBFF74DCFAFF74DC
      FAFF3FB5D9FFC9F0F3FF028DBEFF000000000000000000000000C2A6A4FFFEFB
      F7FF992E00FFFEFEFEFFFEFEFEFFFEFEFEFF8EA4FDFFB8C6FDFFFEFEFEFF992E
      00FFFEFBF7FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF74DDFBFF1399C7FF9ADF
      F3FF92E7FCFF84E4FBFF83E4FCFF83E4FCFF84E4FCFF83E4FCFF83E4FBFF84E5
      FCFF43B9DAFFC9F0F3FF0F96C4FF000000000000000000000000C2A6A4FFFEF9
      F4FF992E00FFFEFEFEFFFAFBFEFF7998FCFF0030FBFF5475FCFFFEFEFEFF992E
      00FFFEF9F4FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF82E3FCFF3EB7DCFF60C2
      E0FFABF0FCFF8DEBFCFF8DEBFCFF8DEBFDFF8DEBFDFF8DEBFCFF8DEBFDFF8DEB
      FCFF47BBDAFFC9F0F3FFC9F0F3FF028DBEFF0000000000000000C2A6A4FFFEF7
      F0FF992E00FFD6DEFEFF3E63FCFF0030FBFF3B61FCFF0031FBFFD9E0FEFF992E
      00FFFEF7F0FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF8AEAFCFF72DCF3FF1C9C
      C7FFFEFFFFFFC8F7FDFFC9F7FDFFC9F7FDFFC9F7FEFFC8F7FEFFC9F7FDFFC8F7
      FEFF9BD5E6FFEAFEFEFFD2F3F8FF028DBEFF0000000000000000C2A6A4FFFEF5
      ECFF992E00FF4D6FFCFF0F3DFBFFBCC9FDFFEFF2FEFF1542FBFF4A6DFCFF972E
      00FFFEF5ECFFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF93F0FEFF93F0FDFF1197
      C5FF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028D
      BEFF028DBEFF028DBEFF028DBEFF028DBEFF0000000000000000C2A6A4FFFEF3
      E9FF992E00FFE4EAFEFFD9E0FEFFFEFEFEFFFEFEFEFF98ACFDFF0030FBFF5F2F
      54FFFEF3E9FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFF9BF5FEFF9AF6FEFF9AF6
      FEFF9BF5FDFF9BF6FEFF9AF6FEFF9BF5FEFF9AF6FDFF9BF5FEFF9AF6FEFF9AF6
      FEFF0489BAFF0000000000000000000000000000000000000000C2A6A4FFFFF1
      E5FF992E00FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFF5172FCFF0030
      FBFFFFF1E5FFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000028DBEFFFEFEFEFFA0FBFFFFA0FB
      FEFFA0FBFEFFA1FAFEFFA1FBFEFFA0FAFEFFA1FBFEFFA1FBFFFFA0FBFFFFA1FB
      FFFF0489BAFF0000000000000000000000000000000000000000C2A6A4FFFFF0
      E2FF992E00FF992E00FF992E00FF992E00FF992E00FF992E00FF8F2E0CFF1D30
      C8FF0030FBFFC2A6A4FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000028DBEFFFEFEFEFFA5FE
      FFFFA5FEFFFFA5FEFFFF028DBEFF028DBEFF028DBEFF028DBEFF028DBEFF028D
      BEFF000000000000000000000000000000000000000000000000C2A6A4FFFFEE
      DEFFFFEEDEFFFFEEDEFFFFEEDEFFFFEEDEFFFFEEDEFFC5B5A9FFC3B4A8FFC2B3
      A7FF0030FBFF0030FBFF0030FBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000028DBEFF028D
      BEFF028DBEFF028DBEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A4FFFFEC
      DAFFFFECDAFFFFECDAFFFFECDAFFFFECDAFFFFECDAFFB0A296FFB0A296FFB0A2
      96FFB0A296FFC2A6A4FF0030FBFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A4FFFFEA
      D7FFFFEAD7FFFFEAD7FFFFEAD7FFFFEAD7FFC9B9ACFFFBF8F4FFFBF8F4FFE6DA
      D9FFC2A6A4FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A4FFFFE8
      D3FFFFE8D3FFFFE8D3FFFFE8D3FFFFE8D3FFC9B9ACFFFBF8F4FFDFCEC7FFC2A6
      A4FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A4FFFFE6
      D0FFFFE6D0FFFFE6D0FFFFE6D0FFFFE6D0FFC9B9ACFFDFCEC7FFC2A6A4FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A4FFC2A6
      A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FFC2A6A4FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000048647AFFBE9596FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FFBDBDBDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000059FFF0111A9FF0216AEFF0217AEFF0111A9FF0006A0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9B9BFF9F9F9FFFA2A2A2FFA2A2A2FF9F9F9FFF9B9B9BFF0000
      000000000000000000000000000000000000699CC3FF1C89E8FF4978A3FFC896
      93FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABABFF979797FF8B8B8BFFC1C1
      C1FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      9DFF021AB1FF052EC0FF0532C4FF0533C5FF0533C5FF0532C3FF052FC1FF021D
      B3FF00049EFF0000000000000000000000000000000000000000000000009A9A
      9AFFA2A2A2FFA9A9A9FFAAAAAAFFABABABFFABABABFFAAAAAAFFA9A9A9FFA3A3
      A3FF9A9A9AFF00000000000000000000000049B4FEFF4FB5FFFF1E89E9FF4978
      A2FFC69592FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B8FFBCBCBCFF989898FF8A8A
      8AFFC0C0C0FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000007A1FF0329
      C3FF0533C7FF0531C2FF0530C2FF0530C2FF0530C2FF0530C2FF0531C3FF0533
      C4FF042BBEFF000AA4FF000000000000000000000000000000009C9C9CFFA9A9
      A9FFABABABFFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFAAAAAAFFAAAA
      AAFFA8A8A8FF9D9D9DFF0000000000000000000000004FB7FEFF4FB3FFFF1B87
      E6FF4C78A0FFCA9792FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBBBBFFBCBCBCFF9595
      95FF8B8B8BFFC2C2C2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000029BFF0329CAFF0434
      D8FF022FCDFF0025C4FF012CC1FF0530C2FF0530C2FF022EC1FF0025BFFF022D
      C1FF0533C4FF052CBEFF00049EFF00000000000000009A9A9AFFABABABFFB1B1
      B1FFACACACFFA8A8A8FFA8A8A8FFA9A9A9FFA9A9A9FFA8A8A8FFA6A6A6FFA8A8
      A8FFAAAAAAFFA8A8A8FF9A9A9AFF0000000000000000000000004FB7FEFF4CB2
      FFFF1D89E6FF4C79A2FFB99497FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BBBBBBFFBABA
      BAFF969696FF8C8C8CFFBABABAFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000118BAFF0335E7FF012F
      DDFF103BD8FF6280E0FF163ECBFF002AC1FF002BC0FF0D36C4FF6380D9FF1941
      C7FF032DC1FF0533C5FF031DB3FF0000000000000000A5A5A5FFB6B6B6FFB2B2
      B2FFB5B5B5FFD5D5D5FFB2B2B2FFA6A6A6FFA7A7A7FFADADADFFD3D3D3FFB2B2
      B2FFA9A9A9FFABABABFFA4A4A4FF0000000000000000000000000000000050B8
      FEFF49B1FFFF2587D9FF5D6874FF00000000B0857DFFC09F94FFC09F96FFBC98
      8EFF00000000000000000000000000000000000000000000000000000000BCBC
      BCFFB9B9B9FF949494FF7C7C7CFF00000000979797FFAAAAAAFFABABABFFA5A5
      A5FF0000000000000000000000000000000000029EFF022EE4FF0234F1FF0028
      E4FF4E6EE9FFFFFFFFFFB7C4F1FF0B34CAFF022BC3FFA2B2E8FFFFFFFFFF6784
      DAFF0024BEFF0531C3FF052FC1FF0006A0FF9A9A9AFFB4B4B4FFB9B9B9FFB3B3
      B3FFD1D1D1FFFFFFFFFFF8F8F8FFAEAEAEFFA9A9A9FFEDEDEDFFFFFFFFFFD4D4
      D4FFA6A6A6FFAAAAAAFFA9A9A9FF9B9B9BFF0000000000000000000000000000
      000053BDFFFFB5D6EDFFBF9D92FFBB9B8CFFE7DAC2FFFFFFE3FFFFFFE5FFFDFA
      DAFFD8C3B3FFB58D85FF00000000000000000000000000000000000000000000
      0000BEBEBEFFD1D1D1FFA8A8A8FFA3A3A3FFD4D4D4FFF1F1F1FFF2F2F2FFEBEB
      EBFFC5C5C5FF9D9D9DFF0000000000000000000DAFFF0134FAFF0133F8FF0030
      EEFF0833E8FF8CA2F2FFFFFFFFFFB4C2F1FFA9B8EDFFFFFFFFFFA7B7E9FF1138
      C4FF032DC1FF0530C2FF0532C4FF0111AAFFA1A1A1FFBBBBBBFFBBBBBBFFB7B7
      B7FFB8B8B8FFE9E9E9FFFFFFFFFFF6F6F6FFF2F2F2FFFFFFFFFFEFEFEFFFAEAE
      AEFFA9A9A9FFA9A9A9FFAAAAAAFF9F9F9FFF0000000000000000000000000000
      00000000000000000000CEA795FFFDEEBEFFFFFFD8FFFFFFDAFFFFFFDBFFFFFF
      E6FFFFFFFBFFEADDDCFFAE837DFF000000000000000000000000000000000000
      00000000000000000000B1B1B1FFDDDDDDFFEBEBEBFFECECECFFEDEDEDFFF2F2
      F2FFFDFDFDFFE3E3E3FF969696FF000000000417BCFF1545FEFF0738FCFF0233
      F8FF002FF0FF0029E8FF91A5F4FFFFFFFFFFFFFFFFFFABBAEFFF042DC5FF002B
      C0FF0530C2FF0530C2FF0534C5FF0217AEFFA7A7A7FFC4C4C4FFBEBEBEFFBBBB
      BBFFB7B7B7FFB4B4B4FFEBEBEBFFFFFFFFFFFFFFFFFFF3F3F3FFAAAAAAFFA7A7
      A7FFA9A9A9FFA9A9A9FFABABABFFA2A2A2FF0000000000000000000000000000
      00000000000000000000C1A091FFFBDCA8FFFEF7D0FFFFFFDBFFFFFFE3FFFFFF
      F8FFFFFFFDFFFFFFFDFFC6A99CFF000000000000000000000000000000000000
      00000000000000000000A9A9A9FFD1D1D1FFE7E7E7FFEDEDEDFFF1F1F1FFFBFB
      FBFFFEFEFEFFFEFEFEFFB1B1B1FF00000000091BBEFF3F66FEFF1A47FCFF0133
      FBFF002FF9FF032FF2FFA4B5F7FFFFFFFFFFFFFFFFFFB9C6F2FF0B34D0FF002A
      C6FF0530C2FF0530C2FF0534C5FF0216ADFFA9A9A9FFD3D3D3FFC5C5C5FFBCBC
      BCFFBABABAFFB9B9B9FFF3F3F3FFFFFFFFFFFFFFFFFFF9F9F9FFB0B0B0FFA9A9
      A9FFA9A9A9FFA9A9A9FFABABABFFA1A1A1FF0000000000000000000000000000
      000000000000C1A091FFFEE3ACFFF1C491FFFCF2CAFFFFFFDDFFFFFFE4FFFFFF
      F7FFFFFFF7FFFFFFE9FFEEE5CBFFB9948CFF0000000000000000000000000000
      000000000000A9A9A9FFD5D5D5FFC1C1C1FFE3E3E3FFEEEEEEFFF1F1F1FFFBFB
      FBFFFBFBFBFFF4F4F4FFDCDCDCFFA2A2A2FF0411B4FF597AFCFF466AFDFF0031
      FBFF0F3AFBFFA1B4FEFFFFFFFFFFA4B6F8FF92A7F5FFFFFFFFFFB6C4F2FF183F
      D3FF022DC8FF0530C4FF0532C3FF0010A9FFA4A4A4FFDBDBDBFFD5D5D5FFBBBB
      BBFFC1C1C1FFF4F4F4FFFFFFFFFFF4F4F4FFECECECFFFFFFFFFFF8F8F8FFB6B6
      B6FFABABABFFAAAAAAFFAAAAAAFF9F9F9FFF0000000000000000000000000000
      000000000000C2A191FFFFE6AEFFEEB581FFF7DCAEFFFEFDD8FFFFFFDFFFFFFF
      E3FFFFFFE4FFFFFFE0FFF3ECD2FFBB968EFF0000000000000000000000000000
      000000000000A9A9A9FFD6D6D6FFB7B7B7FFD2D2D2FFEBEBEBFFEFEFEFFFF1F1
      F1FFF1F1F1FFEFEFEFFFE2E2E2FFA4A4A4FF0001A0FF4868F3FF8FA6FFFF1D44
      FBFF4A6DFCFFFFFFFFFFA7B8FEFF0531F6FF0028EDFF8CA2F6FFFFFFFFFF607D
      E7FF0026D0FF0532CCFF052EC3FF00049FFF9B9B9BFFD2D2D2FFEFEFEFFFC6C6
      C6FFD6D6D6FFFFFFFFFFF6F6F6FFBBBBBBFFB6B6B6FFEBEBEBFFFFFFFFFFD6D6
      D6FFACACACFFADADADFFAAAAAAFF9A9A9AFF0000000000000000000000000000
      000000000000BC978CFFFBE7B7FFF4C791FFF2C994FFF8E5B9FFFEFCD8FFFFFF
      DDFFFFFFDCFFFFFFE0FFE2D2BAFFB68E86FF0000000000000000000000000000
      000000000000A4A4A4FFD9D9D9FFC2C2C2FFC3C3C3FFD8D8D8FFEBEBEBFFEEEE
      EEFFEDEDEDFFEFEFEFFFCECECEFF9E9E9EFF00000000182DCBFF99AFFFFF8BA2
      FEFF1F4BFBFF4B6FFCFF0C3BFBFF002EFBFF002FF7FF0434F1FF4A6CF1FF0E3A
      E3FF0230DBFF0434D7FF021AB5FF0000000000000000B3B3B3FFF2F2F2FFEDED
      EDFFC7C7C7FFD6D6D6FFC0C0C0FFBBBBBBFFB9B9B9FFB9B9B9FFD2D2D2FFB8B8
      B8FFB1B1B1FFB0B0B0FFA4A4A4FF000000000000000000000000000000000000
      00000000000000000000D9C3A9FFFFFEE5FFF7DCB8FFF2C994FFF5D4A5FFFAE8
      BDFFFDF4C9FFFDFBD6FFB69089FF000000000000000000000000000000000000
      00000000000000000000C1C1C1FFF2F2F2FFD7D7D7FFC3C3C3FFCDCDCDFFDBDB
      DBFFE3E3E3FFE9E9E9FF9F9F9FFF00000000000000000002A0FF3F5CECFFB8C7
      FFFF9CAFFDFF385AFCFF0838FBFF0133FBFF0133FBFF0031F9FF032DF2FF0433
      EBFF0335E9FF032ACDFF00029CFF00000000000000009B9B9BFFCCCCCCFFFDFD
      FDFFF2F2F2FFD0D0D0FFBEBEBEFFBCBCBCFFBCBCBCFFBBBBBBFFB9B9B9FFB7B7
      B7FFB7B7B7FFADADADFF9A9A9AFF000000000000000000000000000000000000
      00000000000000000000B58D85FFE8DEDDFFFFFEF2FFF9D8A3FFF4C48CFFF9D4
      9FFFFDEAB8FFD0B49FFFB89086FF000000000000000000000000000000000000
      000000000000000000009D9D9DFFE2E2E2FFF8F8F8FFCECECEFFC0C0C0FFCCCC
      CCFFDADADAFFB7B7B7FF9F9F9FFF0000000000000000000000000107A5FF405E
      ECFFA9BBFFFFBDCAFFFF8EA5FEFF6283FDFF4E71FCFF486CFDFF375FFDFF1242
      F9FF022AD7FF0007A2FF000000000000000000000000000000009E9E9EFFCDCD
      CDFFF8F8F8FFFFFFFFFFEEEEEEFFDFDFDFFFD8D8D8FFD5D5D5FFD0D0D0FFC1C1
      C1FFB0B0B0FF9C9C9CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000AD827DFFC9AA9EFFEFE0B7FFEFDFB2FFE7CE
      ACFFB89086FFB89086FF00000000000000000000000000000000000000000000
      0000000000000000000000000000969696FFB3B3B3FFD3D3D3FFD0D0D0FFC9C9
      C9FF9F9F9FFF9F9F9FFF00000000000000000000000000000000000000000002
      A0FF1C30CDFF5674F6FF859EFEFF8BA3FFFF7794FEFF5174FCFF2148F0FF031C
      C5FF00029CFF0000000000000000000000000000000000000000000000009B9B
      9BFFB5B5B5FFD8D8D8FFEBEBEBFFEDEDEDFFE6E6E6FFD8D8D8FFC3C3C3FFAAAA
      AAFF9A9A9AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968AFFBB988CFFB791
      88FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A2A2A2FFA3A3A3FF9F9F
      9FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000002A0FF0715B6FF0E20C3FF0B1DC2FF010FB4FF00039FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009B9B9BFFA6A6A6FFADADADFFABABABFFA3A3A3FF9B9B9BFF0000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000}
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 416
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 584
    Top = 72
    object OpenFolder1: TMenuItem
      Caption = '&Open Folder'
      ImageIndex = 4
      OnClick = OpenFolder1Click
    end
    object ShowProperties1: TMenuItem
      Caption = 'Show &Properties'
      ImageIndex = 5
      OnClick = ShowProperties1Click
    end
  end
end
