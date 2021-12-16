package com.sesoc.ictmd.vo;

public class ModelDetail {
	private String maker;
	private String model;
	private String imgUrl;
	private String type;
	private String pixel;
	private String cmos;
	private String sensor;
	private String imageProcessor;
	private String screen;
	private String viewFinder;
	private String maxISO;
	private String shutterSpeed;
	private String continuousShooting;
	private String af;
	private String focusArea;
	private String flash;
	private String videoQuality;
	private String volume;
	private String weight;
	private String etc;
	
	public ModelDetail() {
		// TODO Auto-generated constructor stub
	}

	public ModelDetail(String maker, String model, String imgUrl, String type, String pixel, String cmos, String sensor,
			String imageProcessor, String screen, String viewFinder, String maxISO, String shutterSpeed,
			String continuousShooting, String af, String focusArea, String flash, String videoQuality, String volume,
			String weight, String etc) {
		super();
		this.maker = maker;
		this.model = model;
		this.imgUrl = imgUrl;
		this.type = type;
		this.pixel = pixel;
		this.cmos = cmos;
		this.sensor = sensor;
		this.imageProcessor = imageProcessor;
		this.screen = screen;
		this.viewFinder = viewFinder;
		this.maxISO = maxISO;
		this.shutterSpeed = shutterSpeed;
		this.continuousShooting = continuousShooting;
		this.af = af;
		this.focusArea = focusArea;
		this.flash = flash;
		this.videoQuality = videoQuality;
		this.volume = volume;
		this.weight = weight;
		this.etc = etc;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPixel() {
		return pixel;
	}

	public void setPixel(String pixel) {
		this.pixel = pixel;
	}

	public String getCmos() {
		return cmos;
	}

	public void setCmos(String cmos) {
		this.cmos = cmos;
	}

	public String getSensor() {
		return sensor;
	}

	public void setSensor(String sensor) {
		this.sensor = sensor;
	}

	public String getImageProcessor() {
		return imageProcessor;
	}

	public void setImageProcessor(String imageProcessor) {
		this.imageProcessor = imageProcessor;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public String getViewFinder() {
		return viewFinder;
	}

	public void setViewFinder(String viewFinder) {
		this.viewFinder = viewFinder;
	}

	public String getMaxISO() {
		return maxISO;
	}

	public void setMaxISO(String maxISO) {
		this.maxISO = maxISO;
	}

	public String getShutterSpeed() {
		return shutterSpeed;
	}

	public void setShutterSpeed(String shutterSpeed) {
		this.shutterSpeed = shutterSpeed;
	}

	public String getContinuousShooting() {
		return continuousShooting;
	}

	public void setContinuousShooting(String continuousShooting) {
		this.continuousShooting = continuousShooting;
	}

	public String getAf() {
		return af;
	}

	public void setAf(String af) {
		this.af = af;
	}

	public String getFocusArea() {
		return focusArea;
	}

	public void setFocusArea(String focusArea) {
		this.focusArea = focusArea;
	}

	public String getFlash() {
		return flash;
	}

	public void setFlash(String flash) {
		this.flash = flash;
	}

	public String getVideoQuality() {
		return videoQuality;
	}

	public void setVideoQuality(String videoQuality) {
		this.videoQuality = videoQuality;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "ModelDetail [maker=" + maker + ", model=" + model + ", imgUrl=" + imgUrl + ", type=" + type + ", pixel="
				+ pixel + ", cmos=" + cmos + ", sensor=" + sensor + ", imageProcessor=" + imageProcessor + ", screen="
				+ screen + ", viewFinder=" + viewFinder + ", maxISO=" + maxISO + ", shutterSpeed=" + shutterSpeed
				+ ", continuousShooting=" + continuousShooting + ", af=" + af + ", focusArea=" + focusArea + ", flash="
				+ flash + ", videoQuality=" + videoQuality + ", volume=" + volume + ", weight=" + weight + ", etc="
				+ etc + "]";
	}
}