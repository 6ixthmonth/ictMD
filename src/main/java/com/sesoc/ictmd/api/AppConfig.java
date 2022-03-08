package com.sesoc.ictmd.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.REST;

@Configuration
@PropertySource("classpath:key.properties")
public class AppConfig {

	@Autowired
	Environment env;

	@Bean
	public Flickr fk() {
		Flickr fk = new Flickr(env.getProperty("FLICKR_API_KEY"), env.getProperty("FLICKR_SHARED_SECRET"), new REST());
		return fk;
	}

}
