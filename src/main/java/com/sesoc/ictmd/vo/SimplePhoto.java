package com.sesoc.ictmd.vo;

public class SimplePhoto {
	private String id;
	private String squareImageUrl;
	private int views;
	private int favorites;
	private int comments;
	
	public SimplePhoto() {
		// TODO Auto-generated constructor stub
	}

	public SimplePhoto(String id, String squareImageUrl, int views, int favorites, int comments) {
		super();
		this.id = id;
		this.squareImageUrl = squareImageUrl;
		this.views = views;
		this.favorites = favorites;
		this.comments = comments;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSquareImageUrl() {
		return squareImageUrl;
	}

	public void setSquareImageUrl(String squareImageUrl) {
		this.squareImageUrl = squareImageUrl;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getFavorites() {
		return favorites;
	}

	public void setFavorites(int favorites) {
		this.favorites = favorites;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "SimplePhoto [id=" + id + ", squareImageUrl=" + squareImageUrl + ", views=" + views + ", favorites="
				+ favorites + ", comments=" + comments + "]";
	}
}