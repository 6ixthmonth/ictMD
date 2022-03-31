package com.sesoc.ictmd;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.mapper.MiscMapper;
import com.sesoc.ictmd.vo.LandmarkVO;

@Controller
public class HomeController {

	@Autowired
	private SqlSession session;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "/getLandmarks", method = RequestMethod.GET)
	public ArrayList<LandmarkVO> getLandmarks() {
		MiscMapper mapper = session.getMapper(MiscMapper.class);
		ArrayList<LandmarkVO> landmarks = mapper.getLandmarks();

		return landmarks;
	}

}
