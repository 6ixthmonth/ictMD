package com.sesoc.ictmd.vo;

public class MarkerVO {

	private String alphaTwoCode;
	private String countryName;
	private String landmark;
	private double latitude;
	private double longitude;
	private String imgUrl;

	public MarkerVO() {}

	public MarkerVO(String alphaTwoCode, String countryName, String landmark, double latitude, double longitude, String imgUrl) {
		super();
		this.alphaTwoCode = alphaTwoCode;
		this.countryName = countryName;
		this.landmark = landmark;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgUrl = imgUrl;
	}

	public String getAlphaTwoCode() {
		return alphaTwoCode;
	}

	public void setAlphaTwoCode(String alphaTwoCode) {
		this.alphaTwoCode = alphaTwoCode;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "MarkerVO [alphaTwoCode=" + alphaTwoCode + ", countryName=" + countryName + ", landmark=" + landmark
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", imgUrl=" + imgUrl + "]";
	}

}
