package com.sesoc.ictmd.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.mapper.MiscMapper;
import com.sesoc.ictmd.vo.LandmarkVO;

//@Controller
public class HomeController {

	@Autowired
	SqlSession session;

//	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String redirectMain() {
		return "redirect:/main";
	}

//	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

//	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

//	@RequestMapping(value = "/analysis", method = RequestMethod.GET)
	public String analysis() {
		return "analysis";
	}

//	@RequestMapping(value = "/goClickSearch", method = RequestMethod.POST)
	public String goClickSearch(Model model, String tags) {
		model.addAttribute("mtotag", tags);
		return "search";
	}

//	@ResponseBody
//	@RequestMapping(value = "/getLandmarks", method = RequestMethod.GET)
	public ArrayList<LandmarkVO> getLandmarks() {
		MiscMapper mapper = session.getMapper(MiscMapper.class);
		ArrayList<LandmarkVO> landmarks = mapper.getLandmarks();

		return landmarks;
	}

}