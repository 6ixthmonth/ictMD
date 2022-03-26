package com.sesoc.ictmd.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.sesoc.ictmd.mapper.MiscMapper;
import com.sesoc.ictmd.vo.LandmarkVO;

public class HomeController {

	SqlSession session;

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