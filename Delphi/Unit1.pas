unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cefvcl, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btGenerateGraph: TButton;
    Chromium1: TChromium;
    btSavePDF: TButton;
    RichEdit1: TRichEdit;
    procedure btGenerateGraphClick(Sender: TObject);
    procedure btSavePDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Ceflib;

{$R *.dfm}

procedure TForm1.btGenerateGraphClick(Sender: TObject);
var
  Path: string;
  HTML: TStringList;
begin
  Path := ExtractFilePath(Application.ExeName);
	HTML := TStringList.Create;
	HTML.Add(' <!DOCTYPE html> ');
	HTML.Add(' <html> ');
	HTML.Add('   <head> ');
	HTML.Add(' 	<meta charset="utf-8"> ');
	HTML.Add(' 	<link rel="stylesheet" type="text/css" href="' + Path + '\mermaid.css"> ');
	HTML.Add(' 	<link rel="stylesheet" type="text/css" href="' + Path + '\mermaid.dark.css"> ');
	HTML.Add(' 	<link rel="stylesheet" type="text/css" href="' + Path + '\mermaid.forest.css"> ');
	HTML.Add(' 	<script src="' + Path + '\mermaid.js"></script> ');
	HTML.Add(' 	<link rel="stylesheet" type="text/css" href="' + Path + '\mermaid.forest.css"/> ');
	HTML.Add('   </head> ');
	HTML.Add('   <body> ');
	HTML.Add(' 	<script> ');
	HTML.Add(' 	  mermaid.initialize({ ');
	HTML.Add(' 		  arrowMarkerAbsolute:true ');
	HTML.Add(' 	  }); ');
	HTML.Add(' 	</script> ');
	HTML.Add(' 	<div class="mermaid" style="height:500px;"> ');
	HTML.Add(RichEdit1.Text);
	HTML.Add(' 	</div> ');
	HTML.Add('   </body> ');
	HTML.Add(' </html> ');

	HTML.SaveToFile('tmp.html');
	Chromium1.Load(Path + '/tmp.html');
end;

procedure TForm1.btSavePDFClick(Sender: TObject);
var
  pSettings: TCefPdfPrintSettings;
begin
	pSettings.header_footer_title := CefString('Graph');
	pSettings.header_footer_url := CefString('Graph');
	pSettings.page_width := 0;
	pSettings.page_height := 0;
	pSettings.margin_top := 0;
	pSettings.margin_right := 0;
	pSettings.margin_bottom := 0;
	pSettings.margin_left := 0;
	pSettings.margin_type := PDF_PRINT_MARGIN_DEFAULT;
	pSettings.header_footer_enabled := 1;
	pSettings.selection_only := 0;
	pSettings.landscape := 0;
	pSettings.backgrounds_enabled := 1;
	Chromium1.Browser.Host.PrintToPdf('Graph.pdf', @pSettings, nil);
end;

end.
