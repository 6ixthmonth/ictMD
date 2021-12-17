package com.sesoc.ictmd.function;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.ibatis.session.SqlSession;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.sesoc.ictmd.api.ImageRecognition;

/**
 * 
 * @author yoon seoyul
 * 이미지 경로를 웹에서 받아 로컬에 저장한 후 google API를 이용해 분석하기 위한 로컬의 웹경로를
 * 담은 imageTmp 이용을 위해 get 매서드를 두었다. 객체 생성과 동시에 이미지를 만든다.
 * imgResize() 이미지를 리사이징한다.
 * fileClear() 사용한 이미지를 삭제한다.
 * 
 */
public class CreateImg extends Thread {
	
	// 서버 설정할 때 방화벽 인바운드 규칙에 해당 포트를 추가해야 함
	private static final String OUR_DOMAIN = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
	
	private HttpServletRequest request;
	private UUID uuid = UUID.randomUUID();
	
	private String imageFile; // 사용자로부터 이미지 경로를 얻는다.
	private String imageTmp; // 얻은 이미지가 저장된 서버의 웹에서의 임시 경로
	private String imageTmpFile; // 로컬에서의 이미지 경로
	private String uid;
	private String encode64;
	private String[] tags; 
	private String make;
	private String model;
	
	private SqlSession session;
	private InetAddress local;
	
	private String visionAPIkey;
	
	public CreateImg(String imageFile, HttpServletRequest request, String[] tags, String make, String model, SqlSession session, String visionAPIkey) {
		super();
		this.request = request;
		this.imageFile = imageFile;
		this.uid = uuid.toString();
		this.uid = uid.substring(uid.length() - 12, uid.length());
		this.tags = tags;
		this.make = make;
		this.model = model;
		this.session = session;
		this.visionAPIkey = visionAPIkey;

		System.out.println("기원 주소 : " + imageFile);
		try {
			URL url = new URL(imageFile);
			imageTmpFile = request.getSession().getServletContext().getRealPath("/resources/img/" + uid + ".jpg");
			InputStream fis = url.openStream();
			File file = new File(imageTmpFile);
			OutputStream os = new FileOutputStream(file);
			FileCopyUtils.copy(fis, os);
			fis.close();
			os.close();
//			imgEncode64();
		} catch (Exception e) {
			System.out.println("CreateImg.java 생성자 오류(seoyul)");
		}
		
		try {
		    local = InetAddress.getLocalHost();
//		    System.out.println("local ip : "+OUR_DOMAIN);
		} catch (UnknownHostException e1) {
			System.out.println("CreateImg.java InetAddress 오류(seoyul)");
		}
		
	}
	
	@Override
	public void run() {
		System.out.println("imageFile 생성 스레드 시작");
		imageTmp = OUR_DOMAIN + "/resources/img/" + uid + ".jpg";
		System.out.println("로컬 경로 : " + imageTmpFile);
	/*	if(encode64!=null)
			System.out.println("encode64 은 null이 아님");*/
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ImageRecognition imgRecog = new ImageRecognition(this); // api콜
		imgRecog.start();
		// super.run();
	}

	public String getImageTmp() {
		return imageTmp;
	}

	public String getImageEncode64() {
		return encode64;
	}
	
	public String[] getTags() {
		return tags;
	}

	public String getMake() {
		return make;
	}

	public String getModel() {
		return model;
	}
	
	public SqlSession getSession() {
		return session;
	}
	
	public String getVisionAPIkey() {
		return visionAPIkey;
	}

	// 파일 base64 변환
	private void imgEncode64() {
		File file = new File(imageTmpFile);
		String encodedfile = null;
		if (file.exists()) {
			try {
				FileInputStream fileInputStreamReader = new FileInputStream(file);
				byte[] bytes = new byte[(int) file.length()];
				fileInputStreamReader.read(bytes);
				encodedfile = new String(Base64.encodeBase64(bytes), "UTF-8");
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		encode64 = encodedfile;
	}

	// 이미지 리사이징
	private void imgResize() {
		String imgOriginalPath = imageTmpFile; // 원본 이미지 파일명
		String imgTargetPath = imageTmpFile; // 새 이미지 파일명
		String imgFormat = "png"; // 새 이미지 포맷. jpg, gif 등
		int newWidth = 600; // 변경 할 넓이
		int newHeight = 700; // 변경 할 높이
		String mainPosition = "W"; // W:넓이중심, H:높이중심, X:설정한 수치로(비율무시)

		Image image;
		int imageWidth;
		int imageHeight;
		double ratio;
		int w;
		int h;

		try {
			// 원본 이미지 가져오기
			image = ImageIO.read(new File(imgOriginalPath));

			// 원본 이미지 사이즈 가져오기
			imageWidth = image.getWidth(null);
			imageHeight = image.getHeight(null);

			if (mainPosition.equals("W")) { // 넓이기준

				ratio = (double) newWidth / (double) imageWidth;
				w = (int) (imageWidth * ratio);
				h = (int) (imageHeight * ratio);

			} else if (mainPosition.equals("H")) { // 높이기준

				ratio = (double) newHeight / (double) imageHeight;
				w = (int) (imageWidth * ratio);
				h = (int) (imageHeight * ratio);

			} else { // 설정값 (비율무시)

				w = newWidth;
				h = newHeight;
			}

			// 이미지 리사이즈
			// Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
			// Image.SCALE_FAST : 이미지 부드러움보다 속도 우선
			// Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
			// Image.SCALE_SMOOTH : 속도보다 이미지 부드러움을 우선
			// Image.SCALE_AREA_AVERAGING : 평균 알고리즘 사용
			Image resizeImage = image.getScaledInstance(w, h, Image.SCALE_SMOOTH);

			// 새 이미지 저장하기
			BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			Graphics g = newImage.getGraphics();
			g.drawImage(resizeImage, 0, 0, null);
			g.dispose();
			ImageIO.write(newImage, imgFormat, new File(imgTargetPath));
			System.out.println("이미지 리사이징 끝");
		} catch (Exception e) {
			System.out.println("CreateImg.java imgResize() 오류(seoyul)");
			// e.printStackTrace();
		}
	}

	public void fileClear() {
		System.out.println("imageTmpFile 삭제");
		File file = new File(imageTmpFile);
		if (file.exists())
			file.delete();
	}
}