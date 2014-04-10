unit MainForm;

interface

uses
  System.SysUtils,
  System.Classes,
  System.RegularExpressions,

  Generics.Collections,
  Generics.Defaults,

  Winapi.Windows,
  Winapi.Messages,
  Winapi.CommCtrl,

  Vcl.Forms,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Mask,

  JvComponentBase,
  JvExMask,
  JvToolEdit,
  JvSearchFiles,
  JclFileUtils,

  FileVersionInfo;

type
  // hook header divider double click
  // http://www.delphipraxis.net/172789-listview-automatische-spaltenbreite-anpassung-abfangen.html
  TListView = class(Vcl.ComCtrls.TListView)
  type
    TAutoResizeEvent = procedure(const Sender: TListView; ColNum: Integer) of object;
  private
    FOnAutoResize: TAutoResizeEvent;
    procedure WMNotify (var Msg: TWMNotify); message WM_NOTIFY;
  protected
    procedure KeyDown (var Key: Word; Shift: TShiftState); override;
  public
    property OnAutoResize: TAutoResizeEvent read FOnAutoResize write FOnAutoResize;
  end;

  TfrmMain = class(TForm)
    JvSearchFiles1: TJvSearchFiles;
    JvDirectoryEdit1: TJvDirectoryEdit;
    ImageList1: TImageList;
    Timer1: TTimer;
    ListView1: TListView;
    btnSearch: TButton;
    btnAbort: TButton;
    edtFileMask: TEdit;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    OpenFolder1: TMenuItem;
    ShowProperties1: TMenuItem;
    pnlCond: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    edtPattern: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAbortClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtPatternChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure JvSearchFiles1BeginScanDir(Sender: TObject; const AName: string);
    procedure JvSearchFiles1FindFile(Sender: TObject; const AName: string);
    procedure JvSearchFiles1Progress(Sender: TObject);
    procedure ListView1AdvancedCustomDrawItem(Sender: TCustomListView; Item:
        TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var
        DefaultDraw: Boolean);
    procedure OpenFolder1Click(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure ListView1Data(Sender: TObject; Item: TListItem);
    procedure ListView1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ShowProperties1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    Descending: Boolean;
    FAborted: Boolean;
    FPrevFoundFiles: Integer;
    FPrevSearchingFolder: string;
    FSearchingFolder: string;
    FPrevSortColumn: Integer;
    FVersionInfoList: TObjectList<TFileVersionInfo>;
    FRegEx: TRegEx;
    FHasValidRegEx: Boolean;
    procedure ListViewColumnAutoResize(const Sender: TListView; ColNum: Integer);
    function GetCaption(const ItemIndex: Integer; ColNum: Integer): string;
  public
    { Public êÈåæ }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  System.DateUtils,
  System.RegularExpressionsCore,
  Vcl.Graphics,
  ListViewUtil,
  ShellUtil;

resourcestring
  SDone = 'Done.';
  SAborted = 'Aborted.';
  SNoFilesFound = 'No Files Found.';
  SSearching = 'Searching...';
  SFilesFound = '%d files found.';

{$R *.dfm}

procedure TfrmMain.btnAbortClick(Sender: TObject);
begin
  JvSearchFiles1.Abort;
  FAborted := True;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  btnSearch.Enabled := False; btnSearch.ImageIndex := 1;
  btnAbort.Enabled := True;   btnAbort.ImageIndex := 2;
  try
    FPrevFoundFiles := -1;
    FSearchingFolder := '';
    FPrevSearchingFolder := '';
    FAborted := False;
    if FHasValidRegEx then
      FRegEx := TRegEx.Create(edtPattern.Text);

    FVersionInfoList.Clear;
    ListView1.Clear;
    // or
    //   ListView1.Items.Count := FVersionInfoList.Count; // = 0
    //   ListView1.Refresh;

    ClearSortTriangle(ListView1, FPrevSortColumn);
    FPrevSortColumn := -1;
    //
    JvSearchFiles1.RootDirectory := JvDirectoryEdit1.Directory;
    JvSearchFiles1.FileParams.FileMask := edtFileMask.Text;

    StatusBar1.Panels.Items[0].Text := SSearching;
    Timer1.Enabled := True;
    if (not JvSearchFiles1.Search) and (not FAborted) then
    begin
      if JvSearchFiles1.Files.Count = 0 then
        StatusBar1.Panels.Items[0].Text := SNoFilesFound;
    end;
  finally
    if FAborted then
      StatusBar1.Panels.Items[1].Text := SAborted
    else
      StatusBar1.Panels.Items[1].Text := SDone;
    btnSearch.Enabled := True; btnSearch.ImageIndex := 0;
    btnAbort.Enabled := False; btnAbort.ImageIndex := 3;
    Timer1.Enabled := False;
  end;
end;

procedure TfrmMain.edtPatternChange(Sender: TObject);
var
  ECName: string;
begin
  try
    FRegEx := TRegEx.Create(edtPattern.Text);
    FHasValidRegEx := True;
    FRegEx.IsMatch('dummy');
  except
    on E: ERegularExpressionError do
    begin
      ECName := E.ClassName;
      FHasValidRegEx := False;
    end
    else
      raise;
  end;
  if edtPattern.Text = '' then
  begin
    edtPattern.Color := clWhite;
//    edtPattern.Font.Color := clBlack;
  end
  else
  begin
    if FHasValidRegEx then
    begin
      edtPattern.Color := $B6FFB6;
//      edtPattern.Font.Color := clGreen;
    end
    else
    begin
      edtPattern.Color := $C9C9FF;
//      edtPattern.Font.Color := clRed;
    end;
  end;
  ListView1.Refresh;
end;

procedure TfrmMain.JvSearchFiles1BeginScanDir(Sender: TObject; const AName:
    string);
begin
  FSearchingFolder := AName;
end;

procedure TfrmMain.JvSearchFiles1FindFile(Sender: TObject; const AName: string);
var
  VerInfo: TFileVersionInfo;
begin
  VerInfo := TFileVersionInfo.Create(AName);
  FVersionInfoList.Add(VerInfo);
  ListView1.Items.Count := FVersionInfoList.Count;
end;

procedure TfrmMain.JvSearchFiles1Progress(Sender: TObject);
begin
  if FPrevFoundFiles <> JvSearchFiles1.TotalFiles then
  begin
    StatusBar1.Panels.Items[0].Text := Format(SFilesFound, [JvSearchFiles1.TotalFiles]);
    FPrevFoundFiles := JvSearchFiles1.TotalFiles;
  end;
  Application.ProcessMessages;
end;


procedure TfrmMain.OpenFolder1Click(Sender: TObject);
var
  ItemIndex: Integer;
begin
  ItemIndex := ListView1.Selected.Index;
  if ItemIndex >= 0 then
    OpenFolderAndSelectItem(FVersionInfoList[ItemIndex].FilePath);
end;

procedure TfrmMain.ShowProperties1Click(Sender: TObject);
var
  ItemIndex: Integer;
begin
  ItemIndex := ListView1.Selected.Index;
  if ItemIndex >= 0 then
   ShowProperties(Handle, FVersionInfoList[ItemIndex].FilePath);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FPrevSortColumn := -1;
  FVersionInfoList := TObjectList<TFileVersionInfo>.Create;
  ListView1.OnAutoResize := ListViewColumnAutoResize;
{$IFNDEF NO_USE_DOUBLE_BUFFER}
  ListView1.DoubleBuffered := True;
{$ENDIF}
  ListView1.ReadOnly := True;
  ListView1.RowSelect := True;
  ListView1.ViewStyle := vsReport;
  ListView1.FullDrag := False; // Need to fix sort to work correctly.
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FVersionInfoList.Free;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnSearch.Click
  else if Key = #27 then
    btnAbort.Click;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  edtPatternChange(Self);
end;

function TfrmMain.GetCaption(const ItemIndex: Integer; ColNum: Integer): string;
var
  Info: TFileVersionInfo;
begin
  Info := FVersionInfoList[ItemIndex];
  case ColNum of
  0: Result := Info.FileName;
  1: Result := Info.ProductVersion;
  2: Result := FormatDateTime('yyyy/mm/dd hh:mm:ss', Info.LastModified);
  3: Result := Info.CompanyName;
  4: Result := Info.FileDir;
  end;
end;

procedure TfrmMain.ListView1AdvancedCustomDrawItem(Sender: TCustomListView;
    Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var
    DefaultDraw: Boolean);
begin
  if FHasValidRegEx then
    if FRegEx.IsMatch(FVersionInfoList[Item.Index].ProductVersion) then
      Sender.Canvas.Font.Color := clRed;
end;

procedure TfrmMain.ListView1Data(Sender: TObject; Item: TListItem);
  procedure AddOrSetSubItem(Index: Integer; Text: string);
  begin
    if Index < Item.SubItems.Count then
      Item.SubItems[Index] := Text
    else
      Item.SubItems.Add(Text);
  end;
var
  Info: TFileVersionInfo;
begin
  if Assigned(Item) then
  begin
    if (0 <= Item.Index) and (Item.Index < FVersionInfoList.Count) then
    begin
      Info := FVersionInfoList[Item.Index];
      Item.Data := Info;
      Item.Caption := Info.FileName;
      AddOrSetSubItem(0, Info.ProductVersion);
      AddOrSetSubItem(1, FormatDateTime('yyyy/mm/dd hh:mm:ss', Info.LastModified));
      AddOrSetSubItem(2, Info.CompanyName);
      AddOrSetSubItem(3, Info.FileDir);
    end;
  end;
end;

procedure TfrmMain.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
  ColumnToSort: Integer;
begin
  ColumnToSort := Column.Index;

  if FPrevSortColumn <> ColumnToSort then
  begin
    Descending := False;
  end
  else
    Descending := not Descending;

  ShowSortTriangle(TListView(Sender), not Descending, ColumnToSort, FPrevSortColumn);
  FPrevSortColumn := ColumnToSort;

  FVersionInfoList.Sort(TComparer<TFileVersionInfo>.Construct(
    function (const Info1, Info2: TFileVersionInfo): Integer
    begin
      case ColumnToSort of
      0: Result := CompareText(Info1.FileName, Info2.FileName);
      1: Result := CompareText(Info1.ProductVersion, Info2.ProductVersion);
      2: Result := CompareDateTime(Info1.LastModified, Info2.LastModified);
      3: Result := CompareText(Info1.CompanyName, Info2.CompanyName);
      4: Result := CompareText(Info1.FileDir, Info2.FileDir);
      else
        Result := 0;
      end;
      if Descending then
        Result := -Result;
    end
  ));

  ListView1.Refresh;
end;

procedure TfrmMain.ListView1ContextPopup(Sender: TObject; MousePos: TPoint; var
    Handled: Boolean);
begin
{$IFDEF NO_USE_DOUBLE_BUFFER}
  ListView1.Invalidate; // workaround for row select drawing problem
{$ENDIF}
end;

procedure TfrmMain.ListView1MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
{$IFDEF NO_USE_DOUBLE_BUFFER}
  ListView1.Invalidate; // workaround for row select drawing problem
{$ENDIF}
end;

procedure TfrmMain.ListViewColumnAutoResize(const Sender: TListView; ColNum: Integer);
begin
  AutoResizeColumn(Sender, ColNum, GetCaption);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  if FSearchingFolder <> FPrevSearchingFolder then
  begin
    StatusBar1.Panels.Items[1].Text := FSearchingFolder;
    FPrevSearchingFolder := FSearchingFolder;
  end;
end;

{ TListView }

procedure TListView.KeyDown(var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  if (ssShift in Shift) and (ssCtrl in Shift) and (Key = VK_ADD) then
  begin
    Key := 0;
    if Assigned(FOnAutoResize) then
      for I := 0 to Columns.Count - 1 do
        FOnAutoResize(Self, I);
  end;
end;

procedure TListView.WMNotify(var Msg: TWMNotify);
var
  I: Integer;
begin
  if Msg.NMHdr.code = HDN_DIVIDERDBLCLICK then
  begin
    I := FindColumnIndex(Self, Msg.NMHdr);
    if Assigned(FOnAutoResize) then
      FOnAutoResize(Self, I);
    Exit;
  end;
  inherited;
end;

end.
