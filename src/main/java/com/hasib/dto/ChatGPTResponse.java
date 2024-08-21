package com.hasib.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//Data Transfer Object (DTO) for handling responses from the OpenAI API.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatGPTResponse {

	 private List<Choice> choices;
	 	
	 // Inner class representing a single choice from the OpenAI response.
	    @Data
	    @AllArgsConstructor
	    @NoArgsConstructor
	    public static class Choice {

	        private int index;
	        private Message message;

	    }

	
}
