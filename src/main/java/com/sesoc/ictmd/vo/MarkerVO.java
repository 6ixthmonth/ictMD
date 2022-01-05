package com.sesoc.ictmd.vo;

public class MarkerVO {

	private String country;
	private String landmark;
	private double latitude;
	private double longitude;
	private String imgUrl;

	public MarkerVO() {}

	public MarkerVO(String country, String landmark, double latitude, double longitude, String imgUrl) {
		super();
		this.country = country;
		this.landmark = landmark;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgUrl = imgUrl;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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
		return "LandmarkInfo [country=" + country + ", landmark=" + landmark + ", latitude=" + latitude + ", longitude="
				+ longitude + ", imgUrl=" + imgUrl + "]";
	}

}
