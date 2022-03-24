package com.sesoc.ictmd.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@Configuration
@PropertySource("classpath:key.properties")
public class AppConfig {

	@Autowired
	Environment env;

	@Bean
	public SearchService searchExample() {
		String apiKey = env.getProperty("FLICKR_API_KEY");
		String secret = env.getProperty("FLICKR_SHARED_SECRET");
		SearchService searchExample = new SearchService(apiKey, secret);

		return searchExample;
	}

}
