package com.hasib.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.hasib.dto.ChatGPTRequest;
import com.hasib.dto.ChatGPTResponse;

@RestController
@RequestMapping("/bot")
public class BotController {

	@Value("${openai.model}")
	private String model;

	@Value("${openai.api.url}")
	private String url;

	@Autowired
	private RestTemplate template;

	@GetMapping("/chat")
	public String chat(@RequestParam("prompt") String prompt) {
		ChatGPTRequest request = new ChatGPTRequest(model, prompt);
		ChatGPTResponse response = template.postForObject(url, request, ChatGPTResponse.class);
		return response.getChoices().get(0).getMessage().getContent();

	}
}
