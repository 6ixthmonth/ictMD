package com.sesoc.ictmd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flickr4java.flickr.Flickr;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private Flickr flickr;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String testSearch(String searchWord, Model model) {
		System.out.println("api key: " + flickr.getApiKey());

		return "commons/testPage";
	}

}