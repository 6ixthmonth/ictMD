package com.sesoc.ictmd.api;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.REST;

@Component
@PropertySource("classpath:key.properties")
public class SearchExample {

	@Value("${FLICKR_API_KEY}")
	static String apiKey;

	@Value("${FLICKR_SHARED_SECRET}")
	static String sharedSecret;

	Flickr f;

	REST rest;

	public SearchExample() {
		System.out.println("flickr api key at constructor: " + apiKey);
	}
	
	public String getApiKey() {
		return apiKey;
	}

}
