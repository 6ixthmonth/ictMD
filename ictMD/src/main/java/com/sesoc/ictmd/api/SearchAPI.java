package com.sesoc.ictmd.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.flickr4java.flickr.Flickr;
import com.flickr4java.flickr.FlickrException;
import com.flickr4java.flickr.REST;
import com.flickr4java.flickr.Transport;
import com.flickr4java.flickr.photos.Exif;
// import com.flickr4java.flickr.photos.GeoData;
import com.flickr4java.flickr.photos.Photo;
import com.flickr4java.flickr.photos.PhotoList;
import com.flickr4java.flickr.photos.PhotosInterface;
import com.flickr4java.flickr.photos.SearchParameters;
import com.flickr4java.flickr.tags.Tag;
import com.sesoc.ictmd.vo.BrandNewVO;
import com.sesoc.ictmd.vo.ComplexPhoto;
import com.sesoc.ictmd.vo.SimplePhoto;

public class SearchAPI {
	// API를 초기화하여 작동시키는데 필요한 데이터
	private static final String apiKey = "b36b464c2e46a7313fadee937e6a6c16";
	private static final String sharedSecret = "75bc08daeb7fc1dd";
	private static final Transport transport = new REST();
	
	// API를 구성하는 객체들
	private static Flickr f;
	private static PhotosInterface i;
	private static SearchParameters p;
	
	// 추가 검색 항목들을 미리 목록화한다.
	private static final Set<String> e = new HashSet<>();
	{
		e.add("date_upload");
		// e.add("geo");
		e.add("tags");
		e.add("url_sq");
		e.add("url_l");
	}
	
	// 사용할 EXIF 데이터 항목들을 미리 목록화한다.
	private static final ArrayList<String> l = new ArrayList<>();
	{
		l.add("Image Width");
		l.add("Image Height");
		l.add("Make");
		l.add("Model");
		// l.add("Orientation");
		// l.add("X-Resolution");
		// l.add("Y-Resolution");
		// l.add("Resolution Unit");
		// l.add("Software");
		// l.add("Date and Time (Modified)");
		// l.add("Copyright");
		l.add("Exposure");
		l.add("Aperture");
		// l.add("Exposure Program");
		// l.add("ISO Speed");
		// l.add("Sensitivity Type");
		// l.add("Exif Version");
		l.add("Date and Time (Original)");
		// l.add("Date and Time (Digitized)");
		// l.add("Exposure Bias");
		// l.add("Max Aperture Value");
		// l.add("Metering Mode");
		l.add("Flash");
		l.add("Focal Length");
		// l.add("Color Space");
		// l.add("Color Tone");
		// l.add("File Source");
		l.add("Lens");
		l.add("Compression");
		l.add("Format");
	}
	
	// 생성자가 호출되면 검색 객체를 초기화하는 메소드를 실행한다.
	public SearchAPI() {
		init();
	}
	
	// 검색 객체를 초기화하는 메소드
	private void init() {
		f = new Flickr(apiKey, sharedSecret, transport);
		i = f.getPhotosInterface();
	}
	
	// 검색 패러미터를 초기화하는 메소드
	private void initParam(String[] tags) {
		p = new SearchParameters();
		p.setExtras(e);
		// p.setHasGeo(true);
		p.setPrivacyFilter(1);
		p.setSafeSearch("2");
		p.setTags(tags);
	}
	
	// 최신 사진 검색 메소드
	public BrandNewVO brandnew(String[] tags) {
		BrandNewVO result = new BrandNewVO();
		initParam(tags);
		PhotoList<Photo> l = null;
		try {
			l = i.search(p, 1, 0);
			Photo p = l.get(0);
			result.setUrl(p.getSquareLargeUrl());
			// result.setLatitude(p.getGeoData().getLatitude());
			// result.setLongitude(p.getGeoData().getLongitude());
		} catch (FlickrException e) {
			e.printStackTrace();
			System.out.println("Unexpected error has been occured when initializing brandnew search result.");
		}
		return result;
	}

	// 사진 검색 메소드
	public ArrayList<SimplePhoto> search(String[] tags) {
		ArrayList<SimplePhoto> result = new ArrayList<SimplePhoto>();
		initParam(tags);
		PhotoList<Photo> l = null;
		try {
			l = i.search(p, 100, 0);
			for (Photo p : l) {
				result.add(new SimplePhoto(p.getId(), p.getSquareLargeUrl(), 0, 0, 0));
			}
		} catch (FlickrException e) {
			e.printStackTrace();
			System.out.println("Unexpected error has been occured when initializing search list.");
		}
		return result;
	}

	// 임의의 사진 하나를 클릭했을 때 EXIF 데이터를 제외한 해당 사진에 대한 모든 정보를 가져오는 메소드
	public ComplexPhoto getInfo(String id) {
		ComplexPhoto result = new ComplexPhoto();
		try {
			// 사진 고유의 ID를 입력받아 사진 정보를 담은 객체를 가져온다.
			Photo p = i.getInfo(id, sharedSecret);
			result.setId(id);
			
			// 사진 주소를 초기화한다.
			result.setUrl(p.getLargeUrl());
			
			// 태그 목록을 초기화한다.
			ArrayList<String> l = new ArrayList<String>();
			Iterator<Tag> it = p.getTags().iterator();
			while (it.hasNext()) {
				l.add(it.next().getRaw());
			}
			result.setTags(l);
			
			// 위도 및 경도 정보를 초기화한다.
			/*GeoData g = p.getGeoData();
			result.setLatitude(g.getLatitude());
			result.setLongitude(g.getLongitude());*/
			
			// 조회수 정보를 가져오거나 새로 입력한다.
			/*AnalysisDAO d = s.getMapper(AnalysisDAO.class);
			HistoryVO v = d.check(id);
			if (v == null) {
				d.view(id);
				result.setViews(1);
				result.setFavorites(0);
				result.setComments(0);
			} else {
				d.renew(id);
				result.setViews(v.getViews() + 1);
				result.setFavorites(v.getFavorites());
				result.setComments(v.getComments());
			}*/
		} catch (FlickrException e) {
			e.printStackTrace();
			System.out.println("Unexpected error has been occured when initializing detail result.");
		}
		return result;
	}
	
	// 사진 고유의 ID를 입력받아 EXIF 정보를 반환하는 메소드
	public HashMap<String, String> getExif(String id) {
		HashMap<String, String> result = new HashMap<String, String>();
		try {
			Iterator<Exif> it = i.getExif(id, sharedSecret).iterator();
			while (it.hasNext()) {
				Exif e = it.next();
				if (l.contains(e.getLabel())) {
					result.put(e.getLabel(), e.getRaw());
				}
			}
		} catch (FlickrException e) {
			System.out.println("Cannot access to EXIF information.");
		}
		return result;
	}
}