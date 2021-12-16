package com.sesoc.ictmd.Interface;

import java.util.ArrayList;

import com.sesoc.ictmd.vo.BasicAnalysisData;
import com.sesoc.ictmd.vo.ComplexAnalysisData;
import com.sesoc.ictmd.vo.HistoryVO;

public interface AnalysisDAO {
	public int write(BasicAnalysisData bad);

	public ArrayList<BasicAnalysisData> readAll();
	
	public HistoryVO check(String id);
	
	public int view(String id);
	
	public int renew(String id);
	
	public HistoryVO check2(String id);
	
	public ArrayList<ComplexAnalysisData> selectModelByMake(String word);
	public ArrayList<ComplexAnalysisData> selectElementsByModel(String word);
	public ArrayList<ComplexAnalysisData> selectModelByElements(String word);
}