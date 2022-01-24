package com.sesoc.ictmd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.Interface.MiscDAO;
import com.sesoc.ictmd.Interface.ModelDetailDAO;
import com.sesoc.ictmd.vo.MarkerVO;
import com.sesoc.ictmd.vo.ModelDetail;

@Controller
public class HomeController {

	@Autowired
	SqlSession session;

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
		ModelDetailDAO dao = session.getMapper(ModelDetailDAO.class);
		List<ModelDetail> modelList = dao.allModelDetail();
		model.addAttribute("modelList", modelList);

		return "admin";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		return "commons/testPage";
	}

	@ResponseBody
	@RequestMapping(value = "/getMarkerList", method = RequestMethod.GET)
	public ArrayList<MarkerVO> getMarkerList() {
		MiscDAO dao = session.getMapper(MiscDAO.class);
		ArrayList<MarkerVO> markerList = dao.getMarkerList();
		
		return markerList;
	}
	
	@RequestMapping(value = "/flagImgTest", method = RequestMethod.GET)
	public String flagImgTest(Model model) {
		MiscDAO dao = session.getMapper(MiscDAO.class);
		ArrayList<HashMap<String, Object>> flagImgUrlList = dao.getFlagImgUrlList();
		System.out.println(flagImgUrlList);
		model.addAttribute("flagImgUrlList", flagImgUrlList);
		
		return "commons/flagImgTest";
	}

}