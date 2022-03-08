package com.sesoc.ictmd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.sesoc.ictmd.api.SearchExample;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private SearchExample se;

	@Autowired
	private Flickr fk;
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String testSearch(String searchWord, Model model) {
//		PhotoList<Photo> results = null;
//		se.initFlickr();
//
//		try {
//			results = se.search(searchWord);
//		} catch (FlickrException e) {
//			e.printStackTrace();
//		}
		System.out.println("api key: " + fk.getApiKey());
//		model.addAttribute("photoList", results);

		return "commons/testPage";
	}

}