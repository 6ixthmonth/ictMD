package com.sesoc.ictmd.api;

import org.springframework.beans.factory.annotation.Value;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.REST;

public class SearchExample {

	@Value("${FLICKR_API_KEY}")
	static String apiKey;

	static String sharedSecret;

	Flickr f;

	REST rest;

	public SearchExample() {
		System.out.println("flickr api key: " + apiKey);
	}

}
