package com.sesoc.ictmd.vo;

public class BasicAnalysisData {
	private int num;
	private String tags;
	private String elements;
	private String searchDate;
	private String make;
	private String model;
	
	public BasicAnalysisData() {
		// TODO Auto-generated constructor stub
	}

	public BasicAnalysisData(int num, String tags, String elements, String searchDate, String make, String model) {
		super();
		this.num = num;
		this.tags = tags;
		this.elements = elements;
		this.searchDate = searchDate;
		this.make = make;
		this.model = model;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getElements() {
		return elements;
	}

	public void setElements(String elements) {
		this.elements = elements;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Override
	public String toString() {
		return "BasicAnalysisData [num=" + num + ", tags=" + tags + ", elements=" + elements + ", searchDate="
				+ searchDate + ", make=" + make + ", model=" + model + "]";
	}
}