package com.sesoc.ictmd.vo;

public class BrandNewVO {
	private String url;
	private float latitude;
	private float longitude;
	
	public BrandNewVO() {
		// TODO Auto-generated constructor stub
	}

	public BrandNewVO(String url, float latitude, float longitude) {
		super();
		this.url = url;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "BrandNewVO [url=" + url + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}
}