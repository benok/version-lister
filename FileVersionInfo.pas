unit FileVersionInfo;

interface

uses
  SysUtils,
  JclFileUtils;

type
  TFileVersionInfo = class
  strict private
    FFileName: string;
    FInfo: TJclFileVersionInfo;
    FLastModified: TDateTime;
  private
    function GetCompanyName: string;
    function GetFileName: string;
    function GetFileDir: string;
    function GetFilePath: string;
    function GetProductVersion: string;
  public
    property FileName: string read GetFileName;
    property FileDir: string read GetFileDir;
    property FilePath: string read GetFilePath;
    property LastModified: TDateTime read FLastModified;
    //property Info: TJclFileVersionInfo read FInfo;
    property ProductVersion: string read GetProductVersion;
    property CompanyName: string read GetCompanyName;
    constructor Create(const FileName: string);
    destructor Destroy; override;
  end;

implementation

uses
  WinFileUtil;

{ TFileVersionInfo }

constructor TFileVersionInfo.Create(const FileName: string);
begin
  if TJclFileVersionInfo.FileHasVersionInfo(FileName) then
    FInfo := TJclFileVersionInfo.Create(FileName);
  FLastModified := GetLastModifiedTime(FileName);
  FFileName := FileName;
end;

destructor TFileVersionInfo.Destroy;
begin
  FInfo.Free;
end;

function TFileVersionInfo.GetCompanyName: string;
begin
  if Assigned(FInfo) then
    Result := FInfo.CompanyName
  else
    Result := '-';
end;

function TFileVersionInfo.GetFileDir: string;
begin
  Result := ExtractFileDir(FFileName);
end;

function TFileVersionInfo.GetFileName: string;
begin
  Result := ExtractFileName(FFileName);
end;

function TFileVersionInfo.GetFilePath: string;
begin
  Result := FFileName;
end;

function TFileVersionInfo.GetProductVersion: string;
begin
  if Assigned(FInfo) then
    Result := FInfo.ProductVersion
  else
    Result := '-';
end;

end.
