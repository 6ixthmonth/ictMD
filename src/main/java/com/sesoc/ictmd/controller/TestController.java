package com.sesoc.ictmd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.sesoc.ictmd.api.SearchService;

//@Controller
//@RequestMapping("/test")
public class TestController {

	@Autowired
	private SearchService service;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String testSearch(@RequestParam(name = "q", defaultValue = "", required = false) String query, Model model) {
		model.addAttribute("q", query);
		if (query != null && query.length() != 0) {
			PhotoList<Photo> photoList = null;
			try {
				photoList = service.search(query);
			} catch (FlickrException e) {
				e.printStackTrace();
			}
			model.addAttribute("photoList", photoList);
		}

		return "commons/testPage";
	}

	@ResponseBody
	@RequestMapping(value = "/getPhoto", method = RequestMethod.GET)
	public Photo getPhoto(String photoId) {
		Photo result = null;
		try {
			result = service.getPhoto(photoId);
		} catch (FlickrException e) {
			e.printStackTrace();
		}

		return result;
	}

}