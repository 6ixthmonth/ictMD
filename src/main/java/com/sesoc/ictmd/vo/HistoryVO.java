package com.sesoc.ictmd.vo;

public class HistoryVO {
	private String id;
	private int views;
	private int favorites;
	private int comments;
	
	public HistoryVO() {
		// TODO Auto-generated constructor stub
	}

	public HistoryVO(String id, int views, int favorites, int comments) {
		super();
		this.id = id;
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
		return "HistoryVO [id=" + id + ", views=" + views + ", favorites=" + favorites + ", comments=" + comments + "]";
	}
}