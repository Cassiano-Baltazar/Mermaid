//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cefvcl"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btLoadGraphClick(TObject *Sender)
{
	String Path = ExtractFilePath(Application->ExeName);
	TStringList* HTML = new TStringList();
	HTML->Add(" <!DOCTYPE html> ");
	HTML->Add(" <html> ");
	HTML->Add("   <head> ");
	HTML->Add(" 	<meta charset=\"utf-8\"> ");
	HTML->Add(" 	<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Path + "\mermaid.css\"> ");
	HTML->Add(" 	<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Path + "\mermaid.dark.css\"> ");
	HTML->Add(" 	<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Path + "\mermaid.forest.css\"> ");
	HTML->Add(" 	<script src=\"" + Path + "\mermaid.js\"></script> ");
	HTML->Add(" 	<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Path + "\mermaid.forest.css\"/> ");
	HTML->Add("   </head> ");
	HTML->Add("   <body> ");
	HTML->Add(" 	<script> ");
	HTML->Add(" 	  mermaid.initialize({ ");
	HTML->Add(" 		  arrowMarkerAbsolute:true ");
	HTML->Add(" 	  }); ");
	HTML->Add(" 	</script> ");
	HTML->Add(" 	<div class=\"mermaid\" style=\"height:500px;\"> ");
	HTML->Add(RichEdit1->Text);
	HTML->Add(" 	</div> ");
	HTML->Add("   </body> ");
	HTML->Add(" </html> ");

	HTML->SaveToFile("tmp.html");
	Chromium1->Load(Path + "/tmp.html");
}

//---------------------------------------------------------------------------
void __fastcall TForm1::btSaveToPDFClick(TObject *Sender)
{
	TCefPdfPrintSettings* pSettings = new TCefPdfPrintSettings();
	pSettings->header_footer_title = CefString("X");
	pSettings->header_footer_url = CefString("X");
	pSettings->page_width = 0;
	pSettings->page_height = 0;
	pSettings->margin_top = 0;
	pSettings->margin_right = 0;
	pSettings->margin_bottom = 0;
	pSettings->margin_left = 0;
	pSettings->margin_type = PDF_PRINT_MARGIN_DEFAULT;
	pSettings->header_footer_enabled = 1;
	pSettings->selection_only = 0;
	pSettings->landscape = 0;
	pSettings->backgrounds_enabled = 1;
	Chromium1->Browser->GetHost()->PrintToPdf("Graph.pdf", pSettings, NULL);
}
//---------------------------------------------------------------------------
