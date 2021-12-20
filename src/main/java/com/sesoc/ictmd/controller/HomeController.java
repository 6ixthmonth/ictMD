package com.sesoc.ictmd.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.ictmd.Interface.ModelDetailDAO;
import com.sesoc.ictmd.vo.ModelDetail;

@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String redirectMain() {
		return "redirect:/main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public String analysis() {
		return "analysis";
	}

	@RequestMapping(value = "/weatherNshopping", method = RequestMethod.GET)
	public String goWeather() {
		return "weatherNshopping";
	}

	@RequestMapping(value = "/goClickSearch", method = RequestMethod.POST)
	public String goClickSearch(Model model, String tags) {
		model.addAttribute("mtotag", tags);
		return "search";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		ModelDetailDAO dao = sqlSession.getMapper(ModelDetailDAO.class);
		List<ModelDetail> modelList = dao.allModelDetail();
		System.out.println(modelList);
		model.addAttribute("modelList", modelList);

		return "admin";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "commons/testPage";
	}
}