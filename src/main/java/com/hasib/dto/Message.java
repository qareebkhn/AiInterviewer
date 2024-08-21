package com.hasib.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Objects;

//Data Transfer Object (DTO) representing a message sent to or received from the OpenAI API.
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	
	private String role;
	private String content;

	

	
}
