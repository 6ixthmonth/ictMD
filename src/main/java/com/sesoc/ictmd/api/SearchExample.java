package com.sesoc.ictmd.api;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
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

	private Flickr f;
	private PhotosInterface i;
	private SearchParameters p;
	private static final Set<String> e = new HashSet<>(); // extras
	{
		e.add("date_upload");
//		e.add("geo");
		e.add("tags");
		e.add("url_sq");
		e.add("url_l");
	}
	private static final ArrayList<String> x = new ArrayList<>(); // exif
	{
		x.add("Image Width");
		x.add("Image Height");
		x.add("Make");
		x.add("Model");
//		x.add("Orientation");
//		x.add("X-Resolution");
//		x.add("Y-Resolution");
//		x.add("Resolution Unit");
//		x.add("Software");
//		x.add("Date and Time (Modified)");
//		x.add("Copyright");
		x.add("Exposure");
		x.add("Aperture");
//		x.add("Exposure Program");
//		x.add("ISO Speed");
//		x.add("Sensitivity Type");
//		x.add("Exif Version");
		x.add("Date and Time (Original)");
//		x.add("Date and Time (Digitized)");
//		x.add("Exposure Bias");
//		x.add("Max Aperture Value");
//		x.add("Metering Mode");
		x.add("Flash");
		x.add("Focal Length");
//		x.add("Color Space");
//		x.add("Color Tone");
//		x.add("File Source");
		x.add("Lens");
		x.add("Compression");
		x.add("Format");
	}

	public SearchExample(String apiKey, String secret) {
		f = new Flickr(apiKey, secret, new REST());
		i = f.getPhotosInterface();
		p.setExtras(e);
		// p.setHasGeo(true);
		p.setPrivacyFilter(1);
		p.setSafeSearch("1");
//		p.setTags(tags);
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
