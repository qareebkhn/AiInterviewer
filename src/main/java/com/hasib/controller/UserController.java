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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.hasib.entity.Users;
import com.hasib.entity.interviewResult;
import com.hasib.repository.UsersRepository;
import com.hasib.repository.interviewResultRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UsersRepository repo;

	@Autowired
	private interviewResultRepository intRepo;

	@Autowired
	private RestTemplate restTemplate;
	List<String> ansList = new ArrayList<>();

//	@ModelAttribute
//	public void modelData(Model m) {
//		m.addAttribute("name", "Users");
//
//	}

	@PostMapping(value = "addInterviewResult")
	public String addInterviewResult(@ModelAttribute("a1") interviewResult intRes) {
		intRepo.save(intRes);

		return "/summary";
	}

	@PostMapping(value = "addUser")
	public String addUser(@ModelAttribute("a1") Users user) {
		repo.save(user);

		return "index";
	}

//	@GetMapping("getUsers")
//	public String getUsers(Model m) {
//		m.addAttribute("listOfUsers", repo.findAll());
//		return "result";
//	}

	 @PostMapping("/get-interview-results")
	    public String getInterviewResultsByUid(@RequestParam("uid") int uid, HttpSession session, Model model) {
	        // Fetch the interview results based on uid
	        List<interviewResult> results = intRepo.findAllByUid(uid);
	        
	        // Store the results in the session
	        session.setAttribute("interviewResults", results);
	        
	        model.addAttribute("interviewResults", results);
	        
	        // Redirect to a view or another endpoint if needed
	        return "/listOfInterview";
	    }

	@RequestMapping("/")
	public String showPage() {
		return "index";
	}

	@RequestMapping("/listOfInterview")
	public String listOfInterview() {
		return "listOfInterview";
	}

	@RequestMapping("/jobDescription")
	public String jobDescription() {
		return "jobDescription";
	}

	@RequestMapping("/uploadYourCV")
	public String uploadYourCV() {
		return "uploadYourCV";
	}

	@RequestMapping("/questionsList")
	public String questionsList() {
		return "questionsList";
	}

	@RequestMapping("/summary")
	public String summary() {
		return "summary";
	}

	@PostMapping("/signin")
	public String getUser(@RequestParam String email, @RequestParam String password, HttpServletRequest request,
			Model m) {
		Users user = repo.findByEmailAndPassword(email, password);

		if (user != null) {
//			m.addAttribute("result", user);
			System.out.println(user.getUsername());
//			System.out.println(user.getPassword());	
			HttpSession session = request.getSession();
			session.setAttribute("username", user.getUsername());
			session.setAttribute("uid", user.getUid());
			return "redirect:/listOfInterview";
		} else {
			System.out.println("Invalid Username or Password");
			m.addAttribute("error", "Invalid email or password");
			return "redirect:/";
		}

	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.invalidate();
		return "redirect:/";

	}

	@PostMapping("/cvupload")
	public String handleFileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		String content = "";
		try {
			// Save the file to a local directory
			Path path = Paths.get(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
			Files.write(path, file.getBytes());

			// Extract text based on file type
			if (file.getOriginalFilename().endsWith(".pdf")) {
				content = extractTextFromPDF(path.toFile());
			} else if (file.getOriginalFilename().endsWith(".docx")) {
				content = extractTextFromDOCX(path.toFile());
			} else {
				return ("Unsupported file type");
			}
			// Clean up the temporary file
			Files.deleteIfExists(path);

		} catch (IOException e) {
			e.printStackTrace();
			return ("File upload failed");
		}

		HttpSession session = request.getSession();
		session.setAttribute("content", content);
		return "redirect:/jobDescription";
	}

	private String extractTextFromPDF(File file) throws IOException {
		try (PDDocument document = PDDocument.load(file)) {
			PDFTextStripper pdfStripper = new PDFTextStripper();
			String text = pdfStripper.getText(document);
			// Keep alphabetic characters, numeric digits, and common punctuation
			return text.replaceAll("[^a-zA-Z0-9.,?!:;\"'()\\[\\]{}\\- ]", "") // Allow common punctuation
					.replaceAll("\\s+", " ") // Replace multiple spaces with a single space
					.trim(); // Remove leading and trailing spaces
		}
	}

	private String extractTextFromDOCX(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file);
				XWPFDocument document = new XWPFDocument(fis);
				XWPFWordExtractor extractor = new XWPFWordExtractor(document)) {
			String text = extractor.getText();
			// Keep alphabetic characters, numeric digits, and common punctuation
			return text.replaceAll("[^a-zA-Z0-9.,?!:;\"'()\\[\\]{}\\- ]", "") // Allow common punctuation
					.replaceAll("\\s+", " ") // Replace multiple spaces with a single space
					.trim(); // Remove leading and trailing spaces
		}
	}

	@PostMapping("/questions")
	public String generateQuestions(@RequestParam String interviewType, @RequestParam String jd,
			HttpServletRequest request, Model m) {

		HttpSession session = request.getSession();

		Map<String, Integer> interviewTypeToQuestions = Map.of("Simple", 1, "Moderate", 7, "Difficult", 10);
		session.setAttribute("interviewType", interviewType);
		session.setAttribute("jd", jd);
		String CVText = (String) session.getAttribute("content");
		int numberOfQuestions = interviewTypeToQuestions.get(interviewType);

		// Log the received parameters
		System.out.println("CVText: " + CVText);
		System.out.println("Job Description: " + jd);
		System.out.println("Interview Type: " + interviewType);

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

		// Construct the URL for the external endpoint based on the interview type and
		// other data
		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {
			// Make the call to the external endpoint
			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBody = response.getBody();
//			session.setAttribute("response", responseBody);
			// Process the response as needed
			System.out.println("Response from external endpoint: " + responseBody);

			String[] quesArray = responseBody.split("\n");

			List<String> quesList = new ArrayList<>(Arrays.asList(quesArray));

			session.setAttribute("response", quesList);
			session.setAttribute("totalQuesNo", quesList.size());
			// Initialize the current question index
			session.setAttribute("currentQuestionIndex", 0);

			getCurrentQuestion(request, m);

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("error", "Failed to generate questions");
			return "redirect:/jobDescription";
		}

		return "redirect:/questionsList";
	}

	@GetMapping("/currentQuestion")
	public String getCurrentQuestion(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		// Retrieve the list of questions and current index from the session
		List<String> quesList = (List<String>) session.getAttribute("response");
		Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");

		if (quesList == null || currentIndex == null) {
			// Handle the case where no questions or index is found
			model.addAttribute("error", "No questions available or index not set");
			return "errorPage";
		}

		// Ensure the current index is within bounds
		if (currentIndex > quesList.size()) {
			model.addAttribute("error", "No more questions available");
			return "noMoreQuestions";
		}
		// System.out.println(currentIndex + " cur index");
		System.out.println("ccurrent index: inside /cur" + currentIndex);
		// Get the current question
		String currentQuestion = quesList.get(currentIndex);

		// Update the current index for the next request

		// Add the current question to the model
		session.setAttribute("noq", currentIndex + 1);
		session.setAttribute("currentQuestion", currentQuestion);
		session.removeAttribute("answer");
		session.removeAttribute("feedback");
		session.removeAttribute("sampleResponse");

		return "questionsList";
	}

	@PostMapping("/submitAnswer")
	public String submitAnswer(@RequestParam String answer, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		// Retrieve current question index
		Integer currentIndex = (Integer) session.getAttribute("currentQuestionIndex");
		List<String> quesList = (List<String>) session.getAttribute("response");
		ansList.add(answer);
		System.out.println("ccurrent index: inside /sub" + currentIndex);
		if (quesList == null || currentIndex == null) {
			model.addAttribute("error", "Invalid question index or question list not found");
			return "errorPage";
		}

		// Get the current question
		String currentQuestion = quesList.get(currentIndex);

		// Construct the payload to send to the API
		String prompt = String.format(
				"Generate feedback and a sample response for the given question and answer. Keep in mind that the feedback and the sample response should not be more than one paragraph each and should be concise.\n\n"
						+ "Question: \"%s\"\n\n" + "Answer: \"%s\"\n\n" + "Feedback:\n"
						+ "Provide a concise and constructive feedback for the given answer. Ensure it highlights the strengths and suggests improvements without exceeding one paragraph.\n\n"
						+ "Sample Response:\n"
						+ "Provide a well-crafted sample response to the given question that demonstrates the ideal way to answer it. Keep it relevant, clear, and within one paragraph.",
				currentQuestion, answer);

		// Construct the URL for the external endpoint
		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {
			// Make the call to the external endpoint
			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBody = response.getBody();
			String[] parts = responseBody.split("Sample Response:");
			String feedback = parts[0].replace("Feedback:", "").trim();
			String sampleResponse = parts[1].trim();
			if (currentIndex + 1 != quesList.size()) {
				session.setAttribute("currentQuestionIndex", currentIndex + 1);
			}
			System.out.println("Answer: " + answer);
			// Process the feedback response
			System.out.println("Feedback: " + feedback);
			System.out.println("Sample Response: " + sampleResponse);
			session.setAttribute("answer", answer);
			session.setAttribute("feedback", feedback);
			session.setAttribute("sampleResponse", sampleResponse);
			System.out.println(currentIndex);
			// Update the current question index for the next question
			if (currentIndex + 1 == quesList.size()) {
//				String cvText = (String) session.getAttribute("content");
//				String jd = (String) session.getAttribute("jobDescription");
				session.setAttribute("ansList", ansList);

//				submitInterviewData(quesList, ansList, cvText, jd, request);
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Failed to submit answer and get feedback");
			return "redirect:/questionsList";
		}

		return "questionsList";
	}

	@PostMapping("/interviewSummary")
	public String submitInterviewData(HttpServletRequest request) {
		HttpSession session = request.getSession();
//		// Retrieve the stored lists and text
		List<String> questionsList = (List<String>) session.getAttribute("response");
//		
		String interviewType = session.getAttribute("interviewType").toString();
		String cvText = (String) session.getAttribute("content");
		String jd = (String) session.getAttribute("jd");
		System.out.println("ans size:" + ansList.size());
		System.out.println("ques size:" + questionsList.size());
		System.out.println(jd);
		// Construct the prompt
		StringBuilder questionsAnswers = new StringBuilder();
		for (int i = 0; i < ansList.size(); i++) {
			questionsAnswers.append(String.format("**Question %d:** %s\n**Answer %d:** %s\n\n", i + 1,
					questionsList.get(i), i + 1, ansList.get(i)));
		}
//		String prompt = String.format(
//				"Please analyze the following interview data. The data includes a list of questions, the corresponding answers provided by the candidate, the candidate's CV text, and the job description. Perform the following analyses:\n\n"
//						+ "1. **Answers Evaluation:**\n"
//						+ "   - Assess the accuracy, relevance, depth, and communication quality of the candidate's answers. Indicate if the answers align with the job description.\n"
//						+ "2. **CV Evaluation:**\n"
//						+ "   - Evaluate how well the candidate's CV aligns with the job description, focusing on experience, skills, and professionalism.\n"
//						+ "3. **JD-CV Relevance:**\n"
//						+ "   - Determine the overall alignment between the candidate's skills and experiences with the job requirements.\n\n"
//						+ "Provide a concise summary in the following format:\n\n"
//						+ "**Interview Analysis Summary:**\n\n" + "**Answers Evaluation:**\n"
//						+ "- [Insert summary of answers evaluation here]\n\n" + "**CV Evaluation:**\n"
//						+ "- [Insert summary of CV evaluation here]\n\n" + "**JD-CV Relevance:**\n"
//						+ "- [Insert summary of JD-CV relevance here]\n\n" + "**Overall Rating and Comment:**\n"
//						+ "- Provide an overall rating and a brief comment on the candidate’s suitability for the role.\n"
//						+ "- [Overall Rating: n/10 - Status]. For example: [Overall Rating: 2.5/10 - Fair].\n\n"
//						+ "- add this text and continue: [END OF SUMMARY]\n\n" // Added marker for splitting
//						+ "Additionally, at the end of your response, provide the following key-value pairs:\n"
//						+ "1. Role: [Extract the role from the Job Description provided in the prompt with the title '**Job Description:**' and insert here]\n"
//						+ "2. Result: [result]\n"
//						+ "3. Score: [Provide a score from 1-10 based on the status, e.g., Poor, Good, Excellent, etc.]\n\n"
//						+ "Interview Type: %s\n" + "Interview Data:\n" + "- **Questions and Answers:**\n%s\n"
//						+ "- **CV Text:** %s\n" + "- **Job Description:** %s",
//				interviewType, questionsAnswers.toString(), cvText, jd);

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

		// Construct the payload
		Map<String, String> payload = new HashMap<>();
		payload.put("prompt", prompt);

		// URL of the external API
		String url = "http://localhost:8080/bot/chat?prompt=" + prompt;

		try {
			// Send POST request with payload
			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBodyResult = response.getBody();

			// Handle the response as needed
			System.out.println("Response from external endpoint: " + responseBodyResult);
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

	@PostMapping("/saveInterview")
	public String saveInterview(HttpServletRequest request, @RequestParam String interviewResult) {
		HttpSession session = request.getSession();
//		String prompt = String
//				.format("Extract the following information from the provided text in the format below:\n\n"
//						+ "1. Role: [Extract the role from the text]\n"
//						+ "2. Result: [Extract the result from the text]\n"
//						+ "3. Score: [Extract the score from the text]\n"
//						+ "4. Comment: [Provide a concise 3-word comment from the overall rating and comment section]\n\n"
//						+ "Text:\n%s", interviewResult);
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
			// Send POST request with payload
			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			String responseBodyResult = response.getBody();
			System.out.println(responseBodyResult);
			String[] items = responseBodyResult.split("\n");

			// Create a list to store the items
			List<String> list = new ArrayList<>();

			// Add each item to the list
			for (String item : items) {
				// Remove leading '- ' and trim any extra whitespace
				list.add(item.replaceFirst("- ", "").trim());
			}

			// Print the list to verify
			System.out.println("List content:");
			for (String entry : list) {
				System.out.println(entry);
			}
			session.setAttribute("role", list.get(0));
			session.setAttribute("result", list.get(1));
			session.setAttribute("score", list.get(2));
			session.setAttribute("comment", list.get(3));
		} catch (Exception e) {
			e.printStackTrace();

			return "errorPage";
		}

		return "/summary";
	}
//	@PostMapping("/logout")
//	public String logout(HttpServletRequest req, HttpServletResponse res) {
//
//		HttpSession session = req.getSession();
//		session.removeAttribute("username");
//		session.invalidate();
//		return "redirect:/";
//
//	}
//
//	@GetMapping("/logout")
//	public String getLogout(HttpServletRequest req, HttpServletResponse res) {
//
//		HttpSession session = req.getSession();
//		session.removeAttribute("username");
//		session.invalidate();
//		return "redirect:/";
//
//	}

//	@PostMapping("/lunchInterview")
//	public String lunchIntterview() {
//
//		return "uploadYourCV";
//
//	}
}

//@RequestMapping("addUser")
//public String addUser(@RequestParam("uid") int uid, @RequestParam("username") String username, @RequestParam("email") String email, @RequestParam("password") String password, Model m) {
//	Users u = new Users();
//	u.setUid(uid);
//	u.setUsername(username);
//	u.setEmail(email);
//	u.setPassword(password);
//	m.addAttribute("user",m);
//	return "result";
//}
