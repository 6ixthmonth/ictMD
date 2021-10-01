package com.sesoc.ictmd.vo;

public class ModelBase {
	private String model;

	public ModelBase(String model) {
		super();
		this.model = model;
	}
	public ModelBase() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Override
	public String toString() {
		return "ModelBase [model=" + model + "]";
	}



	
	
}
