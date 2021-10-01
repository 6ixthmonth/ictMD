package com.sesoc.ictmd;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class TestController {

	@RequestMapping(value = "/kenMain", method = RequestMethod.GET)
	public String index() {
		return "kenMain";
	}

	
	@RequestMapping(value = "/Trend", method = RequestMethod.GET)
	public String Trend() {
		return "menu/Trend";
	}
	
	@RequestMapping(value = "/Shop", method = RequestMethod.GET)
	public String Shop() {
		return "menu/Shop";
	}
	
	@RequestMapping(value = "/ETC", method = RequestMethod.GET)
	public String ETC() {
		return "menu/ETC";
	}
	
	@RequestMapping(value = "/single", method = RequestMethod.GET)
	public String single() {
		return "menu/single";
	}
	
	@RequestMapping(value = "/kenSearch", method = RequestMethod.GET)
	public String Search() {
		return "menu/kenSearch";
	}
	
	
	
}