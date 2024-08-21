package com.hasib.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;


import lombok.Data;

//Data Transfer Object (DTO) for handling responses from the OpenAI API.
@Data
public class ChatGPTRequest {

    private String model;
    private List<Message> messages;
    
 // Constructor for initializing the model and adding the user's prompt to the messages list.
    public ChatGPTRequest(String model, String prompt) {
        this.model = model;
        this.messages = new ArrayList<>();
        this.messages.add(new Message("user",prompt));
    }
}
