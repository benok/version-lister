program VersionLister;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  ListViewUtil in 'ListViewUtil.pas',
  ShellUtil in 'ShellUtil.pas',
  FileVersionInfo in 'FileVersionInfo.pas',
  WinFileUtil in 'WinFileUtil.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
{$IFOPT D+}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
