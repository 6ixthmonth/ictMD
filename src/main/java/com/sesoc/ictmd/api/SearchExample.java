package com.sesoc.ictmd.api;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Component;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

@Component
public class SearchExample {

	Flickr f;

	REST rest;

	public SearchExample(String apiKey, String secret) {
		f = new Flickr(apiKey, secret, new REST());
	}

	public PhotoList<Photo> search(String text) throws FlickrException {
		PhotosInterface photos = f.getPhotosInterface();
		SearchParameters params = new SearchParameters();
		params.setMedia("photos");
		params.setExtras(Stream.of("media").collect(Collectors.toSet()));
		params.setText(text);
		PhotoList<Photo> results = photos.search(params, 5, 0);

		results.forEach(p -> {
			System.out.println(String.format("Title: %s", p.getTitle()));
			System.out.println(String.format("Media: %s", p.getMedia()));
			System.out.println(String.format("Original Photo URL: %s", p.getPhotoUrl()));
		});

		return results;
	}

}
