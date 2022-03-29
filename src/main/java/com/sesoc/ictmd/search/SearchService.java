package com.sesoc.ictmd.search;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;

@Service
@PropertySource("classpath:key.properties")
public class SearchService {

	@Value("${FLICKR_API_KEY}")
	private String apiKey;
	@Value("${FLICKR_SHARED_SECRET}")
	private String sharedSecret;

	private Flickr f;
	private PhotosInterface i; // getInfo, getExif
	private SearchParameters p;
	private Set<String> e = new HashSet<>(); // extras

	@PostConstruct
	private void init() {
		f = new Flickr(apiKey, sharedSecret, new REST());
		i = f.getPhotosInterface();
		p = new SearchParameters();

		initExtras();

		p.setPrivacyFilter(1); // public photos
		p.setHasGeo(true);
		p.setExtras(e);
		p.setSafeSearch(Flickr.SAFETYLEVEL_SAFE);
		try {
			p.setMedia("photos");
		} catch (FlickrException fe) {
			fe.printStackTrace();
		}
	}

	private void initExtras() {
		if (e != null) {
			e.add("license");
			e.add("date_upload");
			e.add("date_taken");
//			e.add("owner_name");
//			e.add("icon_server");
			e.add("original_format");
			e.add("last_update");
			e.add("geo");
			e.add("tags");
			e.add("machine_tags");
			e.add("o_dims");
			e.add("views");
			e.add("media");
			e.add("path_alias");
//			e.add("url_sq");
//			e.add("url_t");
//			e.add("url_s");
//			e.add("url_m");
//			e.add("url_l");
//			e.add("url_o");
//			e.add("count_faves");
//			e.add("count_comments");
//			e.add("count_views");
		}
	}
	
	public Photo getPhotoByQuery(String query) {
		p.setText(query);
		PhotoList<Photo> result = null;
		try {
			result = i.search(p, 1, 0);
		} catch (FlickrException e) {
			e.printStackTrace();
		}

		return result.get(0);
	}

	public PhotoList<Photo> searchPhotos(String query) {
		p.setText(query);
		PhotoList<Photo> results = null;
		try {
			results = i.search(p, 40, 0);
		} catch (FlickrException e) {
			e.printStackTrace();
		}

		return results;
	}

	public Photo getPhotoById(String photoId) {
		Photo result = null;
		try {
			result = i.getPhoto(photoId);
		} catch (FlickrException e) {
			e.printStackTrace();
		}

		return result;
	}

	public String photoToString(Photo photo) {
		System.out.println(photo);
		String result = null;
		return result;
	}

}
