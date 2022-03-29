package com.sesoc.ictmd.search;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchService service;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value = "/getPhotoByQuery", method = RequestMethod.GET)
	public @ResponseBody String getPhotoByQuery(String query) {
		logger.info("query: {}", query);
		return service.photoToString(service.getPhotoByQuery(query));
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String search(@RequestParam(name = "q", defaultValue = "", required = false) String query, Model model) {
		logger.info("query: {}", query);

		model.addAttribute("q", query);
		if (query != null && query.length() != 0) {
			model.addAttribute("photoList", service.searchPhotos(query));
		}

		return "search";
	}

	@RequestMapping(value = "/getPhotoById", method = RequestMethod.GET)
	public @ResponseBody String getPhotoById(String photoId) {
		logger.info("photoId: {}", photoId);
		return service.photoToString(service.getPhotoById(photoId));
	}

}
