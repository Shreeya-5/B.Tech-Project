package EduPaper.dao;

import java.io.IOException;
import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;

import EduPaper.model.AddQue;

import java.util.List;
import java.util.ArrayList;

public class PaperDisplay {

	public static void main(String[] args) throws IOException {
		String fileName = "question_paper.pdf";
		String outputPath = "src/main/resources/" + fileName;

		new PaperDisplay().createPdf(outputPath);
	}

	public void createPdf(String outputPath) throws IOException {
		PdfWriter writer = new PdfWriter(outputPath);
		PdfDocument pdfDocument = new PdfDocument(writer);
		Document document = new Document(pdfDocument);

		List<AddQue> questions = new ArrayList<>();

		for (AddQue question : questions) {
			Text questionText = new Text(question.getQuesText()).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));

			Paragraph paragraph = new Paragraph().add(questionText);
			document.add(paragraph);
		}

		document.close();
	}


}
