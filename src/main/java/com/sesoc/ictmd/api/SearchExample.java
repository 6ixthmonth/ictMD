package com.sesoc.ictmd.api;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

@Component
@PropertySource("classpath:key.properties")
public class SearchExample {

	@Value("${FLICKR_API_KEY}")
	private String apiKey;

	@Value("${FLICKR_SHARED_SECRET}")
	private String sharedSecret;

	Flickr f;

	REST rest;

	public void initFlickr() {
		f = new Flickr(this.apiKey, this.sharedSecret, new REST());
	}

	public void search(String text) throws FlickrException {
		PhotosInterface photos = f.getPhotosInterface();
		SearchParameters params = new SearchParameters();
		params.setMedia("photos");
		params.setExtras(Stream.of("media").collect(Collectors.toSet()));
		params.setText(text);
		PhotoList<Photo> results = photos.search(params, 5, 0);

		results.forEach(p -> {
			System.out.println(String.format("Title: %s", p.getTitle()));
			System.out.println(String.format("Media: %s", p.getMedia()));
			System.out.println(String.format("Original Video URL: %s", p.getVideoOriginalUrl()));
		});

	}

}
