package EduPaper.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.property.TextAlignment;

import EduPaper.dao.CourseDao;
import EduPaper.dao.PaperDao;
import EduPaper.dao.QuestionDao;
import EduPaper.model.AddCourse;
import EduPaper.model.AddPaper;
import EduPaper.model.AddQue;
import EduPaper.model.UserReg;
import java.time.LocalDateTime;

/**
 * Servlet implementation class PaperInfoController
 */
@WebServlet("/PaperInfoController")
public class PaperInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaperInfoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String PaperName = request.getParameter("PaperName");
		String TermName = request.getParameter("TermName");
		String dateOfExam = request.getParameter("dateOfExam");
		String timeLength = request.getParameter("timeLength");
		System.out.println(dateOfExam);
		LocalDateTime now = LocalDateTime.now();
		String creationDate = now.toString();
		
		session.setAttribute("date", creationDate);

		String courseCode = (String) session.getAttribute("courseCodeForUnits");
		UserReg user = (UserReg) session.getAttribute("loggedInUser");

		AddPaper newPaper = new AddPaper(courseCode, user.getEmail(), PaperName, TermName, dateOfExam, creationDate, timeLength);
		PaperDao paperDao = new PaperDao();
		paperDao.createPaper(newPaper);

		Map<String, String> paperInfo = new HashMap<>();
		paperInfo.put("PaperName", PaperName);
		paperInfo.put("TermName", TermName);
		paperInfo.put("dateOfExam", dateOfExam);
		paperInfo.put("timeLength", timeLength);

		session.setAttribute("paperInfo", paperInfo);
		
		
		String fileName = "question_paper.pdf";
        String outputPath = request.getServletContext().getRealPath("/") + File.separator + fileName;

        createPdf(outputPath, request);
        
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");

        try (InputStream input = new FileInputStream(outputPath)) {
            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = input.read(buffer)) != -1) {
                response.getOutputStream().write(buffer, 0, bytesRead);
            }
        }
	}
	
	public void createPdf(String outputPath, HttpServletRequest request) throws IOException,ServletException {
        PdfWriter writer = new PdfWriter(outputPath);
        PdfDocument pdfDocument = new PdfDocument(writer);
        Document document = new Document(pdfDocument);

		HttpSession session = request.getSession();
		String courseCode = (String) session.getAttribute("courseCodeForUnits");
		int TotalMarksInput = (int) session.getAttribute("TotalMarksInput");
		int NumberOfQuestionInput = (int) session.getAttribute("NumberOfQuestionInput");
		List<Integer> subQuestions = (List<Integer>) session.getAttribute("subQuestions");
		List<String> subQueNames = (List<String>) session.getAttribute("subQueNames");
		List<String> allQueNames = (List<String>) session.getAttribute("allQueNames");
		List<Integer> subQueMarks = (List<Integer>) session.getAttribute("subQueMarks");
		List<Integer> allUnitMarks = (List<Integer>) session.getAttribute("allUnitMarks");
		String date = (String) session.getAttribute("date");

		AddCourse addCourse = new AddCourse();
		CourseDao courseDao = new CourseDao();
		
		AddPaper addPaper = new AddPaper();
		QuestionDao queDao = new QuestionDao();
		
		PaperDao paperDao = new PaperDao();
		int paperId = paperDao.getPaper(date).getPaperId();
        
		List<AddQue> questions = new ArrayList<AddQue>();
		
		Map<Integer, Integer> freqMap = getFrequencyMap(subQueMarks);
		int unit = 1;
        for (Integer num : allUnitMarks) {
        	
            List<Integer> combination = getCombination(num, freqMap);
            if (combination != null) {
                int sum = combination.stream().mapToInt(Integer::intValue).sum();
                System.out.println(num + " - " + combination + ", Sum: " + sum);
                List<AddQue> ques = queDao.getQuesForPaper(combination, String.valueOf(unit), courseCode, paperId);
                questions.addAll(ques);
            }
            unit++;
        }
        
        Text CollegeName = new Text("CUMMINS COLLEGE OF ENGINEERING FOR WOMEN, PUNE").setFont(PdfFontFactory.createFont(StandardFonts.TIMES_BOLD)).setFontSize(16);
        Paragraph paragraphCollegeName = new Paragraph().add(CollegeName).setTextAlignment(TextAlignment.CENTER);
        document.add(paragraphCollegeName);        
        
        Text CollegeName2 = new Text("(An Autonomous Institute affiliated to Savitribai Phule Pune University)").setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA)).setFontSize(10);
        Paragraph paragraphCollegeName2 = new Paragraph().add(CollegeName2).setTextAlignment(TextAlignment.CENTER).setMarginTop(-2);
        document.add(paragraphCollegeName2);
        
        Text Class = new Text(paperDao.getPaper(date).getTermName() + " " + courseDao.getCourse(courseCode).getDeptName()).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));
        Paragraph paragraphClass = new Paragraph().add(Class).setTextAlignment(TextAlignment.CENTER);
        document.add(paragraphClass);
        
        Text Exam = new Text(paperDao.getPaper(date).getPaperName()).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));
        Paragraph paragraphExam = new Paragraph().add(Exam).setTextAlignment(TextAlignment.CENTER);
        document.add(paragraphExam);
        
        Text course = new Text(courseDao.getCourse(courseCode).getCourseName() + " (" + courseCode + ")" ).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));
        Paragraph paragraphCourse = new Paragraph().add(course).setTextAlignment(TextAlignment.CENTER);
        document.add(paragraphCourse);
        
        Text marksText = new Text("Paper Marks: " + TotalMarksInput).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));
        Text durationText = new Text("Time Duration: " + paperDao.getPaper(date).getTimeLength()).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA));

        Paragraph paragraphMarks = new Paragraph().add(marksText).add(" ").add(durationText);
        document.add(paragraphMarks).setTextAlignment(TextAlignment.JUSTIFIED);
        
        
        int i = 0;
		for (AddQue question : questions) {
			Text questionNo = new Text(allQueNames.get(i)).setFontSize(14);
			Text questionText = new Text(question.getQuesText()).setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA)).setFontSize(14);
			Text questionMark = new Text("Marks"+String.valueOf(question.getMarks())).setBold().setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA)).setFontSize(14);
			
			Paragraph paragraphQue = new Paragraph().add(questionNo).add(questionText).add("             ").add(questionMark);
			document.add(paragraphQue).setTextAlignment(TextAlignment.JUSTIFIED);
			i++;
		}

        document.close();
    }
	
	public static Map<Integer, Integer> getFrequencyMap(List<Integer> arr) {
        Map<Integer, Integer> freqMap = new HashMap<>();
        for (Integer num : arr) {
            freqMap.put(num, freqMap.getOrDefault(num, 0) + 1);
        }
        return freqMap;
    }

    public static List<Integer> getCombination(int target, Map<Integer, Integer> freqMap) {
        List<Integer> result = new ArrayList<>();
        int[] arr = freqMap.keySet().stream().mapToInt(Integer::intValue).toArray();
        Arrays.sort(arr);
        return findCombination(target, arr, result, freqMap);
    }

    public static List<Integer> findCombination(int target, int[] arr, List<Integer> result, Map<Integer, Integer> freqMap) {
        if (target == 0) {
            return result;
        }
        for (int i = arr.length - 1; i >= 0; i--) {
            if (target >= arr[i] && freqMap.get(arr[i]) > 0) {
                result.add(arr[i]);
                freqMap.put(arr[i], freqMap.get(arr[i]) - 1);
                List<Integer> temp = findCombination(target - arr[i], arr, result, freqMap);
                if (temp != null) {
                    return temp;
                }
                result.remove(result.size() - 1);
                freqMap.put(arr[i], freqMap.get(arr[i]) + 1);
            }
        }
        return null;
    }

}
