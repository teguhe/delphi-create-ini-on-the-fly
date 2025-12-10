unit umain;

interface

uses

  IOUtils,

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btCheckClick(Sender: TObject);
begin

  { TODO : cek apakah folder config ada }
  if not TDirectory.Exists('test') then
  begin
    MessageDlg('Direktori konfigurasi tidak tersedia', TMsgDlgType.mtWarning, [mbOK], 0);
  end;
//    TDirectory.CreateDirectory('test');


  { TODO : cek apakah file config ada }






end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Position:=poScreenCenter;
  mmoIni.Lines.Clear;

end;

end.
