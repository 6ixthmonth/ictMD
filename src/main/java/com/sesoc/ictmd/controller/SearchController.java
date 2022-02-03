package com.sesoc.ictmd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.ictmd.api.SearchAPI;
import com.sesoc.ictmd.function.CreateImg;
import com.sesoc.ictmd.mapper.ModelDetailDAO;
import com.sesoc.ictmd.vo.BrandNewVO;
import com.sesoc.ictmd.vo.ComplexPhoto;
import com.sesoc.ictmd.vo.ModelDetail;

/**
 * Handles requests for the application home page.
 */
@Controller
@PropertySource("classpath:key.properties")
public class SearchController {
	
	@Value("${FLICKR_API_KEY}")
	private String flickrAPIkey;
	
	@Value("${FLICKR_SHARED_SECRET}")
	private String sharedSecret;
	
	@Value("${VISION_API_KEY}")
	private String visionAPIkey;
	
	@Autowired
	SqlSession session;
	
	SearchAPI api;
	CreateImg createImg;
	
	private static final ArrayList<String> l = new ArrayList<>();
	{
		l.add("CANON");
		l.add("NIKON");
		l.add("SONY");
		l.add("APPLE");
		l.add("OLYMPUS");
		l.add("FUJI");
		l.add("RICOH");
		l.add("LG");
		l.add("SAMSUNG");
		l.add("HUAWEI");
		l.add("PENTAX");
		l.add("PANASONIC");
		l.add("LEICA");
		l.add("EPSON");
		l.add("GOOGLE");
		l.add("CASIO");
		l.add("XIAOMI");
		l.add("WIKO");
	}

	// 메인 화면에서 최신 사진 하나를 찾아오는 메소드
	@RequestMapping(value = "/brandnew", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> brandnew(String tag) {
		api = new SearchAPI(flickrAPIkey, sharedSecret);
		Map<String, Object> result = new HashMap<String, Object>();
		
		String[] tags = new String[1];
		tags[0] = tag;
		BrandNewVO brandnew = api.brandnew(tags);
		result.put("url", brandnew.getUrl());
		result.put("latitude", brandnew.getLatitude());
		result.put("longitude", brandnew.getLongitude());
		
		return result;
	}
	
	// 검색어를 문자열 배열로 입력받아 검색 후 결과를 반환하는 메소드
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> list(String[] tags, HttpSession ss) {
		// 검색 API와 리턴 객체를 초기화
		api = new SearchAPI(flickrAPIkey, sharedSecret);
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 검색 결과를 리턴 객체에 저장
		result.put("list", api.search(tags));
		
		// 검색어가 카메라 모델명인지 검사 후 처리
		HashMap<String, String[]> tagsMap = new HashMap<>();
		tagsMap.put("tags", tags);
		ModelDetailDAO mdDAO = session.getMapper(ModelDetailDAO.class);
		ArrayList<ModelDetail> model = mdDAO.searchModelDetail(tagsMap);
		if (model != null) {
			result.put("model", model);
			ArrayList<ModelDetail> modelList = mdDAO.getModel();
			for (int i = 0; i < tags.length; i++) {
				for (ModelDetail temp : modelList) {
					if (tags[i].replace(" ", "").toUpperCase().contains(temp.getModel().replace(" ", "").toUpperCase())) {
						tags[i] = temp.getMaker() + " " + temp.getModel();
					}
				}
			}
		}
		
		// 분석 데이터로 쓰기 위해 검색어를 세션에 저장
		ss.removeAttribute("tags");
		ss.setAttribute("tags", tags);

		return result;
	}

	// 임의의 사진 하나를 클릭했을 때 해당 사진에 대한 모든 정보를 가져오는 메소드
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> detail(String id, HttpServletRequest request, HttpSession ss) {
		// 검색 API와 리턴 객체를 초기화
		api = new SearchAPI(flickrAPIkey, sharedSecret);
		Map<String, Object> result = new HashMap<String, Object>();
		
		// 상세 검색 결과를 요청
		ComplexPhoto p = api.getInfo(id);
		HashMap<String, String> e = api.getExif(id);
		
		// 검색 결과를 리턴 객체에 저장
		result.put("photo", p);
		result.put("exif", e);
		
		// 분석 데이터로 쓰기 위한 데이터들을 이미지 생성 객체에 전달
		String[] tags = (String[]) ss.getAttribute("tags");
		String make = "";
		String model = "";
		if (e.containsKey("Make")) {
			make = e.get("Make").toUpperCase();
			int check = 0;
			for (String maker : l) {
				if (make.contains(maker)) {
					make = maker;
					check++;
					break;
				}
			}
			if (check == 0) {
				make = "etc.";
			}
		}
		if (e.containsKey("Model")) {
			model = e.get("Model").toUpperCase();
		}
		createImg = new CreateImg(p.getUrl(), request, tags, make, model, session, visionAPIkey);
		createImg.start();
		
		return result;
	}
}