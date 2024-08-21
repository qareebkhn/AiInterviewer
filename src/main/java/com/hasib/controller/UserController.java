package com.hasib.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.hasib.entity.Users;
import com.hasib.entity.interviewResult;
import com.hasib.repository.UsersRepository;
import com.hasib.repository.interviewResultRepository;
import com.hasib.service.ContactUsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private ContactUsService contactUsService;

	@Autowired
	private UsersRepository repo;

	@Autowired
	private interviewResultRepository intRepo;

	@Autowired
	private RestTemplate restTemplate;
	List<String> ansList = new ArrayList<>();

	@Autowired
	private HttpSession session;

//	Adds the interview result to the database and redirects to the summary page.
	@PostMapping(value = "addInterviewResult")
	public String addInterviewResult(HttpSession session) {

		interviewResult intRes = new interviewResult();
		intRes.setRole(session.getAttribute("role").toString());
		intRes.setInterviewType(session.getAttribute("interviewType").toString());
		intRes.setResult(session.getAttribute("result").toString());
		intRes.setScore(session.getAttribute("score").toString());
		intRes.setComment(session.getAttribute("comment").toString());
		intRes.setUid(Integer.parseInt(session.getAttribute("uid").toString()));

		intRepo.save(intRes);
		return "/summary";
	}

//	Saves a new user to the repository and redirects to the index page.
	@PostMapping(value = "addUser")
	public String addUser(@ModelAttribute("a1") Users user) {
		repo.save(user);

		return "redirect:/index";
	}

	@DeleteMapping("/deleteUser/{id}")
	public ResponseEntity<Void> deleteUser(@PathVariable int id) {
		intRepo.deleteByUid(id);
		repo.deleteById(id);
		return ResponseEntity.noContent().build();
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<Users> updateUser(@PathVariable int id, @RequestBody Users updatedUser) {
		Users existingUser = repo.findById(id).orElseThrow(() -> new RuntimeException("User not found"));

		existingUser.setUsername(updatedUser.getUsername());
		existingUser.setEmail(updatedUser.getEmail());
		if (updatedUser.getPassword() != null && !updatedUser.getPassword().isEmpty()) {
			existingUser.setPassword(updatedUser.getPassword());
		}

		repo.save(existingUser);
		return ResponseEntity.ok(existingUser);
	}

//	Displays the index page.
	@RequestMapping("/")
	public String showPage() {
		return "index";
	}

//	Retrieves and displays the list of interviews for the logged-in user.
	@RequestMapping("/listOfInterview")
	public String listOfInterview(Model model) {

		String username = (String) session.getAttribute("username");
		if (username == null) {
//			System.out.println("User not logged in or 'username' not found.");
			return "redirect:/";
		}
		int uid = Integer.parseInt(session.getAttribute("uid").toString());

		model.addAttribute("username", username);
		List<interviewResult> results = intRepo.findAllByUid(uid);
		session.setAttribute("interviewResults", results);

		return "listOfInterview";
	}

//	Displays the job description page for the logged-in user.
	@RequestMapping("/jobDescription")
	public String jobDescription(Model model) {

		String username = (String) session.getAttribute("username");
		if (username == null) {
//			System.out.println("User not logged in or 'username' not found.");
			return "redirect:/"; // Redirect to home or login page
		}

		model.addAttribute("username", username);

		return "jobDescription";
	}

//	Displays the CV upload page for the logged-in user.
	@RequestMapping("/uploadYourCV")
	public String uploadYourCV(Model model) {

		String username = (String) session.getAttribute("username");
		if (username == null) {
//			System.out.println("User not logged in or 'username' not found.");
			return "redirect:/";
		}

		model.addAttribute("username", username);

		return "uploadYourCV";
	}

//	Displays the questions list page for the logged-in user.
	@RequestMapping("/questionsList")
	public String questionsList(Model model) {

		String username = (String) session.getAttribute("username");
		if (username == null) {
//			System.out.println("User not logged in or 'username' not found.");
			return "redirect:/";
		}
		model.addAttribute("username", username);
		return "questionsList";
	}

//	Displays the summary of the interview page for the logged-in user.
	@RequestMapping("/summary")
	public String summary(Model model) {

		String username = (String) session.getAttribute("username");
		if (username == null) {
//			System.out.println("User not logged in or 'username' not found.");
			return "redirect:/";
		}

		model.addAttribute("username", username);

		return "summary";
	}

//	Authenticates the user and redirects to the list of interviews.
	@PostMapping("/signin")
	public String getUser(@RequestParam String email, @RequestParam String password, HttpServletRequest request,
			Model m) {
		Users user = repo.findByEmailAndPassword(email, password);

		if (user != null) {

//			System.out.println(user.getUsername());

			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUsername());
			m.addAttribute("username", user.getUsername());
			session.setAttribute("uid", user.getUid());

			return "redirect:/listOfInterview";
		} else {
//			System.out.println("Invalid Username or Password");
			m.addAttribute("error", "Invalid email or password");
			return "redirect:/";
		}

	}

//	Logs out the user and redirects to the home page.
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.invalidate();
		return "redirect:/";

	}

//	Handles the upload and processing of a CV file and redirects to the job description page.
	@PostMapping("/cvupload")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String content = "";
		try {

			Path path = Paths.get(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
			Files.write(path, file.getBytes());

			if (file.getOriginalFilename().endsWith(".pdf")) {
				content = extractTextFromPDF(path.toFile());
			} else if (file.getOriginalFilename().endsWith(".docx")) {
				content = extractTextFromDOCX(path.toFile());
			} else {
				return ("Unsupported file type");
			}

			Files.deleteIfExists(path);

		} catch (IOException e) {
			e.printStackTrace();
			return ("File upload failed");
		}

		HttpSession session = request.getSession();
		session.setAttribute("content", content);
		return "redirect:/jobDescription";
	}

//	Extracts text content from a PDF file.
	private String extractTextFromPDF(File file) throws IOException {
		try (PDDocument document = PDDocument.load(file)) {
			PDFTextStripper pdfStripper = new PDFTextStripper();
			String text = pdfStripper.getText(document);

			return text.replaceAll("[^a-zA-Z0-9.,?!:;\"'()\\[\\]{}\\- ]", "").replaceAll("\\s+", " ").trim();
		}
	}

//	Extracts text content from a DOCX file.
	private String extractTextFromDOCX(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file);
				XWPFDocument document = new XWPFDocument(fis);
				XWPFWordExtractor extractor = new XWPFWordExtractor(document)) {
			String text = extractor.getText();

			return text.replaceAll("[^a-zA-Z0-9.,?!:;\"'()\\[\\]{}\\- ]", "").replaceAll("\\s+", " ").trim();
		}
	}

//	Generates interview questions based on the CV and job description.
	@PostMapping("/questions")
	public String generateQuestions(@RequestParam String interviewType, @RequestParam String jd,
			HttpServletRequest request, Model m) {

		HttpSession session = request.getSession();

		Map<String, Integer> interviewTypeToQuestions = Map.of("Simple", 5, "Moderate", 7, "Difficult", 10);
		session.setAttribute("interviewType", interviewType);
		session.setAttribute("jd", jd);
		String CVText = (String) session.getAttribute("content");
		int numberOfQuestions = interviewTypeToQuestions.get(interviewType);

//		System.out.println("CVText: " + CVText);
//		System.out.println("Job Description: " + jd);
//		System.out.println("Interview Type: " + interviewType);

		String prompt = String.format(
				"Based on the following CV text and job description, generate %d %s interview questions. The questions should be real-world, practical, and relevant to the job description. The response should contain the questions only, without numbering.\n\n"
						+ "Interview Type: %s\nNumber of Questions: %d\nDifficulty Level: %s\n\n"
						+ "CV Text:\n%s\n\nJob Description:\n%s\n\n"
						+ "Please provide the questions in the following format:\n"
						+ "[Question 1]\n[Question 2]\n...\n[Question %d]\n\n" + "Note:\n"
						+ "- For Easy interviews, generate simple questions that test basic knowledge and understanding.\n"
						+ "- For Moderate interviews, generate real-world and practical questions that test intermediate knowledge and problem-solving skills.\n"
						+ "- For Hard interviews, generate difficult, real-world and practical questions that test advanced knowledge, problem-solving skills, and in-depth understanding of the subject.",
				numberOfQuestions, interviewType, interviewType, numberOfQuestions, interviewType, CVText, jd,
				numberOfQuestions);

		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {

			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBody = response.getBody();

//			System.out.println("Response from external endpoint: " + responseBody);

			String[] quesArray = responseBody.split("\n");

			List<String> quesList = new ArrayList<>(Arrays.asList(quesArray));

			session.setAttribute("response", quesList);
			session.setAttribute("totalQuesNo", quesList.size());

			session.setAttribute("currentQuestionIndex", 0);

			getCurrentQuestion(request, m);

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("error", "Failed to generate questions");
			return "redirect:/jobDescription";
		}

		return "redirect:/questionsList";
	}

//	Retrieves and displays the current interview question.
	@GetMapping("/currentQuestion")
	public String getCurrentQuestion(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		List<String> quesList = (List<String>) session.getAttribute("response");
		Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");

		if (quesList == null || currentIndex == null) {

			model.addAttribute("error", "No questions available or index not set");
			return "errorPage";
		}

		if (currentIndex > quesList.size()) {
			model.addAttribute("error", "No more questions available");
			return "noMoreQuestions";
		}

//		System.out.println("ccurrent index: inside /cur" + currentIndex);

		String currentQuestion = quesList.get(currentIndex);

		session.setAttribute("noq", currentIndex + 1);
		session.setAttribute("currentQuestion", currentQuestion);
		session.removeAttribute("answer");
		session.removeAttribute("feedback");
		session.removeAttribute("sampleResponse");

		return "questionsList";
	}

//	Submits the user's answer, generates feedback, and displays the next question.
	@PostMapping("/submitAnswer")
	public String submitAnswer(@RequestParam String answer, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");
		List<String> quesList = (List<String>) session.getAttribute("response");
		ansList.add(answer);
//		System.out.println("ccurrent index: inside /sub" + currentIndex);
		if (quesList == null || currentIndex == null) {
			model.addAttribute("error", "Invalid question index or question list not found");
			return "errorPage";
		}

		String currentQuestion = quesList.get(currentIndex);

		String prompt = String.format(
				"Generate feedback and a sample response for the given question and answer. Keep in mind that the feedback and the sample response should not be more than one paragraph each and should be concise.\n\n"
						+ "Question: \"%s\"\n\n" + "Answer: \"%s\"\n\n" + "Feedback:\n"
						+ "Provide a concise and constructive feedback for the given answer. Ensure it highlights the strengths and suggests improvements without exceeding one paragraph.\n\n"
						+ "Sample Response:\n"
						+ "Provide a well-crafted sample response to the given question that demonstrates the ideal way to answer it. Keep it relevant, clear, and within one paragraph.",
				currentQuestion, answer);

		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {

			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBody = response.getBody();
			String[] parts = responseBody.split("Sample Response:");
			String feedback = parts[0].replace("Feedback:", "").trim();
			String sampleResponse = parts[1].trim();
			if (currentIndex + 1 != quesList.size()) {
				session.setAttribute("currentQuestionIndex", currentIndex + 1);
			}
//			System.out.println("Answer: " + answer);
//			System.out.println("Feedback: " + feedback);
//			System.out.println("Sample Response: " + sampleResponse);
			session.setAttribute("answer", answer);
			session.setAttribute("feedback", feedback);
			session.setAttribute("sampleResponse", sampleResponse);
//			System.out.println(currentIndex);

			if (currentIndex + 1 == quesList.size()) {

				session.setAttribute("ansList", ansList);

			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to submit answer and get feedback");
			return "redirect:/questionsList";
		}

		return "questionsList";
	}

//	Submits the entire interview data for analysis and stores the result.
	@PostMapping("/interviewSummary")
	public String submitInterviewData(HttpServletRequest request) {
		HttpSession session = request.getSession();

		List<String> questionsList = (List<String>) session.getAttribute("response");
		String interviewType = session.getAttribute("interviewType").toString();
		String cvText = (String) session.getAttribute("content");
		String jd = (String) session.getAttribute("jd");
//		System.out.println("ans size:" + ansList.size());
//		System.out.println("ques size:" + questionsList.size());
//		System.out.println(jd);

		StringBuilder questionsAnswers = new StringBuilder();
		for (int i = 0; i < ansList.size(); i++) {
			questionsAnswers.append(String.format("**Question %d:** %s\n**Answer %d:** %s\n\n", i + 1,
					questionsList.get(i), i + 1, ansList.get(i)));
		}

		String prompt = String.format(
				"Please analyze the following interview data. The data includes a list of questions, the corresponding answers provided by the candidate, the candidate's CV text, and the job description. Perform the following analyses:\n\n"
						+ "1. **Answers Evaluation:**\n"
						+ "   - Assess the accuracy, relevance, depth, and communication quality of the candidate's answers. Indicate if the answers align with the job description.\n"
						+ "2. **CV Evaluation:**\n"
						+ "   - Evaluate how well the candidate's CV aligns with the job description, focusing on experience, skills, and professionalism.\n"
						+ "3. **JD-CV Relevance:**\n"
						+ "   - Determine the overall alignment between the candidate's skills and experiences with the job requirements.\n\n"
						+ "Provide a concise summary in the following format:\n\n"
						+ "**Interview Analysis Summary:**\n\n" + "**Answers Evaluation:**\n"
						+ "- [Insert summary of answers evaluation here]\n\n" + "**CV Evaluation:**\n"
						+ "- [Insert summary of CV evaluation here]\n\n" + "**JD-CV Relevance:**\n"
						+ "- [Insert summary of JD-CV relevance here]\n\n" + "**Overall Rating and Comment:**\n"
						+ "- Provide an overall rating and a brief comment on the candidate’s suitability for the role.\n"
						+ "- [Overall Rating: n/10 - Status]. For example: [Overall Rating: 2.5/10 - Fair].\n\n"
						+ "Additionally, at the end of your response, provide the following key-value pairs:\n"
						+ "1. Role: [Extract the role from the Job Description provided in the prompt with the title '**Job Description:**' and insert here]\n"
						+ "2. Result: [result]\n"
						+ "3. Score: [Provide a score from 1-10 based on the status, e.g., Poor, Good, Excellent, etc.]\n\n"
						+ "Interview Type: %s\n" + "Interview Data:\n" + "- **Questions and Answers:**\n%s\n"
						+ "- **CV Text:** %s\n" + "- **Job Description:** %s",
				interviewType, questionsAnswers.toString(), cvText, jd);

		Map<String, String> payload = new HashMap<>();
		payload.put("prompt", prompt);

		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {

			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBodyResult = response.getBody();

//			System.out.println("Response from external endpoint: " + responseBodyResult);
			session.setAttribute("responseResult", responseBodyResult);
			saveInterview(request, responseBodyResult);
			session.removeAttribute("jd");
			session.removeAttribute("content");
			session.removeAttribute("sampleResponse");
			session.removeAttribute("feedback");
			session.removeAttribute("answer");
			session.removeAttribute("currentQuestionIndex");
			session.removeAttribute("noq");
			session.removeAttribute("totalQuesNo");
			session.removeAttribute("response");
			ansList.clear();

		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Failed to submit interview data");
			session.removeAttribute("jd");
			session.removeAttribute("content");
			session.removeAttribute("sampleResponse");
			session.removeAttribute("feedback");
			session.removeAttribute("answer");
			session.removeAttribute("currentQuestionIndex");
			session.removeAttribute("noq");
			session.removeAttribute("totalQuesNo");
			session.removeAttribute("response");
			ansList.clear();
			return "errorPage";
		}

		return "redirect:/summary";
	}

//	Saves the analyzed interview result to the database.
	@PostMapping("/saveInterview")
	public String saveInterview(HttpServletRequest request, @RequestParam String interviewResult) {
		HttpSession session = request.getSession();
		String prompt = String.format(
				"Extract the following information from the provided text and return it as a list where each item is a separate list element:\n\n"
						+ "1. Role: [Extract the role from the text]\n"
						+ "2. Result: [Extract the result from the text]\n"
						+ "3. Score: [Extract the score from the text]\n"
						+ "4. Comment: [Provide a concise 3-word comment from the overall rating and comment section]\n\n"
						+ "Return the response as a list with the following format:\n" + "- [Extracted role]\n"
						+ "- [Extracted result]\n" + "- [Extracted score]\n" + "- [3-word comment]\n\n" + "Text:\n%s",
				interviewResult);

		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {

			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBodyResult = response.getBody();
//			System.out.println(responseBodyResult);
			String[] items = responseBodyResult.split("\n");

			List<String> list = new ArrayList<>();

			for (String item : items) {

				list.add(item.replaceFirst("- ", "").trim());
			}

			for (String entry : list) {
//				System.out.println(entry);
			}
			session.setAttribute("role", list.get(0));
			session.setAttribute("result", list.get(1));
			session.setAttribute("score", list.get(2));
			session.setAttribute("comment", list.get(3));
			addInterviewResult(session);
		} catch (Exception e) {
			e.printStackTrace();

			return "errorPage";
		}

		return "/summary";
	}

	@Value("${spring.mail.username}")
	private String toEmail;

	@PostMapping("/contact")
	public String sendContactEmail(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("subject") String subject, @RequestParam("message") String message) {
		String body = "Name: " + name + "\nEmail: " + email + "\nMessage: " + message;
		contactUsService.sendEmail(toEmail, subject, body);
		return "/";
	}
//	@PostMapping("/contact")
//	public String sendContactEmail() {
//
//		contactUsService.sendEmail("qareeb.khn@gmail.com", "This is subject", "This is body");
//		return "/";
//	}

}
