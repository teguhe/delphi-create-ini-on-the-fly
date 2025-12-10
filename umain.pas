unit umain;

interface

uses

  System.IOUtils,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btCheck: TButton;
    btHapus: TButton;
    btLoad: TButton;
    mmoIni: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btCheckClick(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    ConfigDir, ConfigFile, ConfigFileDefault : string;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btCheckClick(Sender: TObject);
var
  OleStr1, OleStr2: PWideChar;

begin

  { TODO : cek apakah folder config ada }
  if not TDirectory.Exists(ConfigDir) then
  begin
    if MessageDlg(ConfigDir+#13+#13+'Direktori konfigurasi tidak tersedia, buat direktori?', TMsgDlgType.mtWarning, mbYesNo, 0)=mrYES
      then
        begin
        TDirectory.CreateDirectory(ConfigDir);
        MessageDlg('Direktori berhasil dibuat!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
        end;
  end
  else
  begin
        MessageDlg('Direktori config tersedia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;

  { TODO : cek apakah file config ada }
  if not FileExists(ConfigFile) then
  begin
    if MessageDlg(ConfigFile+#13+#13+'file configuration.ini tidak tersedia, buat file?', TMsgDlgType.mtWarning, mbYesNo, 0)=mrYES
      then
        begin

        GetMem(OleStr1, (Length(ConfigFileDefault)+1) * SizeOf(WideChar));
        GetMem(OleStr2, (Length(ConfigFileDefault)+1) * SizeOf(WideChar));

        TFile.Copy(
          StringToWideChar(ConfigFileDefault, OleStr1, Length(ConfigFileDefault)+1),
          StringToWideChar(ConfigFile, OleStr2, Length(ConfigFile)+1)
          );
        MessageDlg('file configuration.ini berhasil dibuat!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
        end;
  end
  else
  begin
        MessageDlg('file configuration.ini tersedia!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  end;

end;

procedure TForm1.btLoadClick(Sender: TObject);
begin

  if not FileExists(ConfigFile) then
  begin
    MessageDlg('file configuration.ini tidak tersedia, buat file?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0)
  end
  else
  begin
    mmoIni.Lines.LoadFromFile(ConfigFile);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Position:=poScreenCenter;
  mmoIni.Lines.Clear;

  ConfigDir         :=ExtractFileDir(ParamStr(0))+'\config\';
  ConfigFile        :=ExtractFileDir(ParamStr(0))+'\config\configuration.ini';
  ConfigFileDefault :=ExtractFileDir(ParamStr(0))+'\config-default\configuration.ini';

end;

end.
