package com.sesoc.ictmd.Interface;

import java.util.ArrayList;
import java.util.HashMap;

import com.sesoc.ictmd.vo.ModelDetail;

public interface ModelDetailDAO {
	public ArrayList<ModelDetail> getModel();
	public ArrayList<ModelDetail> searchModelDetail(HashMap<String, String[]> tags);
	public ArrayList<ModelDetail> allModelDetail();
	public ModelDetail selectInfo(String modelName);
	public int deleteDetail(String modelName);
	public int updateDetail(ModelDetail model);
	public int insertDetail(ModelDetail model);
}