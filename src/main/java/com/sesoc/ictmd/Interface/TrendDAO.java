package com.sesoc.ictmd.Interface;

import java.util.List;

import com.sesoc.ictmd.vo.BasicTrendData;

public interface TrendDAO {
	
	public int allDataCount();
	
	public List<BasicTrendData> BasicModelChart();

	public List<BasicTrendData> BasicMakeChart();
	
	public List<BasicTrendData> BasicTagChart();
	
}
