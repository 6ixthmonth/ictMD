package com.sesoc.ictmd.vo;

public class MarkerVO {

	private String alplhaTwoCode;
	private String countryName;
	private String landmark;
	private double latitude;
	private double longitude;
	private String imgUrl;

	public MarkerVO() {}

	@Override
	public String toString() {
		return "MarkerVO [alplhaTwoCode=" + alplhaTwoCode + ", countryName=" + countryName + ", landmark=" + landmark
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", imgUrl=" + imgUrl + "]";
	}

	public String getAlplhaTwoCode() {
		return alplhaTwoCode;
	}

	public void setAlplhaTwoCode(String alplhaTwoCode) {
		this.alplhaTwoCode = alplhaTwoCode;
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

	public MarkerVO(String alplhaTwoCode, String countryName, String landmark, double latitude, double longitude,
			String imgUrl) {
		super();
		this.alplhaTwoCode = alplhaTwoCode;
		this.countryName = countryName;
		this.landmark = landmark;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imgUrl = imgUrl;
	}

}
