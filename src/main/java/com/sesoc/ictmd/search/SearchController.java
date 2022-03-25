package com.sesoc.ictmd.search;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchService service;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String search(@RequestParam(name = "q", defaultValue = "", required = false) String query, Model model) {
		model.addAttribute("q", query);
		if (query != null && query.length() != 0) {
			model.addAttribute("photoList", service.search(query));
		}

		return "search";
	}

}
