package com.sesoc.ictmd.vo;

public class BasicTrendData {

	private String dataName;
	private String dataNum;
	private String dataPercentage;

	public BasicTrendData() {

	}

	public BasicTrendData(String dataName, String dataNum, String dataPercentage) {
		super();
		this.dataName = dataName;
		this.dataNum = dataNum;
		this.dataPercentage = dataPercentage;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataNum() {
		return dataNum;
	}

	public void setDataNum(String dataNum) {
		this.dataNum = dataNum;
	}

	public String getDataPercentage() {
		return dataPercentage;
	}

	public void setDataPercentage(String dataPercentage) {
		this.dataPercentage = dataPercentage;
	}

	@Override
	public String toString() {
		return "BasicTrendData [dataName=" + dataName + ", dataNum=" + dataNum + ", dataPercentage=" + dataPercentage
				+ "]";
	}

}
