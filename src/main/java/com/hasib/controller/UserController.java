package com.hasib.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hasib.entity.Users;
import com.hasib.repository.UsersRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UsersRepository repo;

//	@ModelAttribute
//	public void modelData(Model m) {
//		m.addAttribute("name", "Users");
//
//	}

	@GetMapping("getUsers")
	public String getUsers(Model m) {
		m.addAttribute("listOfUsers", repo.findAll());
		return "result";
	}

	@RequestMapping("/")
	public String showPage() {
		return "index";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
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

	@PostMapping(value = "addUser")
	public String addUser(@ModelAttribute("a1") Users user) {
		repo.save(user);

		return "index";
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
			return pdfStripper.getText(document);
		}
	}

	private String extractTextFromDOCX(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file);
				XWPFDocument document = new XWPFDocument(fis);
				XWPFWordExtractor extractor = new XWPFWordExtractor(document)) {
			return extractor.getText();
		}
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
