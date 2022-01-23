package com.sesoc.ictmd.Interface;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.ictmd.vo.MarkerVO;

public interface MiscDAO {

	ArrayList<MarkerVO> getMarkerList();

	ArrayList<HashMap<String, Object>> getFlagImgUrlList();
	

}
