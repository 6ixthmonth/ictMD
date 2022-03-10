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
	public SearchExample searchExample() {
		String apiKey = env.getProperty("FLICKR_API_KEY");
		String secret = env.getProperty("FLICKR_SHARED_SECRET");
		SearchExample searchExample = new SearchExample(apiKey, secret);

		return searchExample;
	}

}
