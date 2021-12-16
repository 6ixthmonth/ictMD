package com.sesoc.ictmd.vo;

public class UserDetail {

	private String userId;
	private String birth;
	private String model;
	private String favorite;

	public UserDetail() {
	}

	public UserDetail(String userId, String birth, String model, String favorite) {
		super();
		this.userId = userId;
		this.birth = birth;
		this.model = model;
		this.favorite = favorite;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getFavorite() {
		return favorite;
	}

	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}

	@Override
	public String toString() {
		return "UserDetail [userId=" + userId + ", birth=" + birth + ", model=" + model + ", favorite=" + favorite
				+ "]";
	}

}
