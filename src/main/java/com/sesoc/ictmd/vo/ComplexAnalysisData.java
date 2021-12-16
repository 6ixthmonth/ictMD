package com.sesoc.ictmd.vo;

public class ComplexAnalysisData {
	private String name;
	private int count;
	
	public ComplexAnalysisData() {
		// TODO Auto-generated constructor stub
	}

	public ComplexAnalysisData(String name, int count) {
		super();
		this.name = name;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "ComplexAnalysisData [name=" + name + ", count=" + count + "]";
	}
}