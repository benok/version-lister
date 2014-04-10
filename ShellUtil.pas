unit ShellUtil;

interface

uses
  Winapi.Windows;

function OpenFolderAndSelectItem(Path: string): Boolean;
function ShowProperties(hWndOwner: HWND; const FileName: string) :Boolean;

implementation

uses
  System.SysUtils,
  Winapi.ShellAPI,
  Winapi.ShlObj;

// Implemented referring from chromium's ShowItemInFolderOnFileThread
// http://src.chromium.org/svn/trunk/src/chrome/browser/platform_util_win.cc
// (and http://www.decoding.dax.ru/faq/files/files004.html)
// Shell32.dll Ver6 over (XP or higher) needed.

function OpenFolderAndSelectItem(Path: string): Boolean;
var
  Dir: string;
  Desktop: IShellFolder;
  Dir_IIDL, FullPath_IIDL: PItemIDList;
  HR: HRESULT;
  ChEaten, Attrs: ULONG; // dummy. needed for Delphi compiler's restriction.
begin
  Result := False;
  Dir := IncludeTrailingPathDelimiter(ExtractFileDir(Path));
  HR := SHGetDesktopFolder(Desktop); if FAILED(HR) then Exit;
  HR := Desktop.ParseDisplayName(0, nil, PChar(Dir),  ChEaten, Dir_IIDL,      Attrs); if FAILED(HR) then Exit;
  HR := Desktop.ParseDisplayName(0, nil, PChar(Path), ChEaten, FullPath_IIDL, Attrs); if FAILED(HR) then Exit;
  HR := SHOpenFolderAndSelectItems(FullPath_IIDL, 0, nil, 0);
  if FAILED(HR) then
  begin
    if HR = ERROR_FILE_NOT_FOUND then
      // On some systems, the above call mysteriously fails with "file not
      // found" even though the file is there.  In these cases, ShellExecute()
      // seems to work as a fallback (although it won't select the file).
      // comment from http://src.chromium.org/svn/trunk/src/chrome/browser/platform_util_win.cc
      ShellExecute(0, 'open', PChar(Dir), nil, nil, SW_SHOW)
    else
    begin
      // TODO: Log warning here.
{$IFDEF DEBUG}
      asm int 3 end;
{$ENDIF}
    end;
  end;
  Result := True;
end;

// http://forum.lazarus.freepascal.org/index.php?topic=11194.0

function ShowProperties(hWndOwner: HWND; const FileName: string) :Boolean;
var
   Info: TShellExecuteInfo;
   Handle : THandle;
begin
   with Info do
   begin
     cbSize := SizeOf(Info);
     fMask := SEE_MASK_NOCLOSEPROCESS or
              SEE_MASK_INVOKEIDLIST or
              SEE_MASK_FLAG_NO_UI;
     wnd := hWndOwner;
     lpVerb := 'properties';
     lpFile := pChar(FileName);
     lpParameters := nil;
     lpDirectory := nil;
     nShow := 0;
     hInstApp := 0;
     lpIDList := nil;
   end;
   Result := ShellExecuteEx(@Info);
end;
end.
