unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Clipbrd;

type
  TMainForm = class(TForm)
    mmRemedios: TMemo;
    btnGerar: TButton;
    edtLinha: TEdit;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnGerarClick(Sender: TObject);
var
  i: integer;
  AText: String;
  iPos: Integer;
begin
  edtLinha.Text := '';
  for i := 0 to mmRemedios.Lines.Count -1 do begin
    AText := mmRemedios.Lines[i].Substring(0,6);
{    iPos := Pos(' ', AText);             }
    if i >0  then
      edtLinha.Text := edtLinha.Text +',';
//    edtLinha.Text := edtLinha.Text + QuotedStr(Copy(AText, 1, iPos-1));
    edtLinha.Text := edtLinha.Text + QuotedStr(AText);
  end;
  Clipboard.AsText := edtLinha.Text;

end;

end.
