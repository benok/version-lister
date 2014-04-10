unit WinFileUtil;

interface

function GetLastModifiedTime(const FileName: string): TDateTime;

implementation

uses
  System.SysUtils,
  Winapi.Windows;


// modified
// http://stackoverflow.com/questions/9209394/how-to-get-file-created-accessed-and-modified-dates-the-same-as-windows-propert

function GetLastModifiedTime(const FileName: string): TDateTime;
  function GetLocalDateTime(const FileTime: TFileTime): TDateTime;
  var
    SystemTime, LocalTime: TSystemTime;
  begin
    if not FileTimeToSystemTime(FileTime, SystemTime) then
      RaiseLastOSError;
    if not SystemTimeToTzSpecificLocalTime(nil, SystemTime, LocalTime) then
      RaiseLastOSError;
    Result := SystemTimeToDateTime(LocalTime);
  end;
var
  fad: TWin32FileAttributeData;
begin
  if not GetFileAttributesEx(PChar(FileName), GetFileExInfoStandard, @fad) then
    RaiseLastOSError;
  Result := GetLocalDateTime(fad.ftLastWriteTime);
end;

end.
