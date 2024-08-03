package com.hasib.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class OpenAIConfig {

	@Value("${openai.api.key}")
	private String openaiApiKey;

	@Bean
	public RestTemplate template() {

		RestTemplate restTemp = new RestTemplate();
		restTemp.getInterceptors().add((request, body, execution) -> {
			request.getHeaders().add("Authorization", "Bearer " + openaiApiKey);
			return execution.execute(request, body);
		});
		return restTemp; 
	}
}
