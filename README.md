# 사진 검색 및 트렌드 분석 웹 애플리케이션 - ICT More Details
<img src="https://user-images.githubusercontent.com/42332051/135755678-a2d06cbb-9db1-48d3-bb74-e621b1c4a40b.gif">

## 개요
키워드를 입력하여 **사진을 검색**할 수 있다. 이때 **카메라 브랜드와 모델**, 그밖에도 *화소 수, 셔터 속도, 오토 포커스 여부 등* 사진을 촬영할 때 적용된 **카메라 설정값 또한 확인**할 수 있다.

사용자가 검색된 결과 사진을 열람하면 *이미지 인식 API를 통해 사진 속 개체를 분석*하고 **연관 검색어를 추출**해낸다. 이 정보들을 데이터베이스에 누적한다.

누적된 정보들을 이용하여 *최다 검색어, 인기있는 카메라 브랜드 및 모델 등* **다양한 트렌드 분석 데이터를 시각적으로 제공**한다.

## 개발 환경 및 사용 API
1. Back-end 및 빌드 도구
   - Java 8
   - Spring Framework 4.3.5
   - Maven(4.0.0)
2. Front-end
   - HTML5(JSP 2.1), CSS3, JavaScript, jQuery(3.3.1)
   - Bootstrap(3.3.6)
3. Database
   - Oracle Database 11g2(Express edition)
   - MyBatis(3.4.1)
4. API
   - Flicker API: 사진 검색, 카메라 설정값 추출
   - Google Vision API: 기계 학습을 통한 이미지 인식, 키워드 추출, 관련 단어 추출
   - WebGL Earth: 3D 지구본 이미지 출력, 마커 표시
   - Menucool jQuery Slider: 이미지 슬라이더
   - Highcharts: 워드클라우드, 그래프 출력
   - OpenWeatherMap: 실시간 주요 도시 날씨 정보 확인
   - eBay API: 카메라 제품 검색
5. Web App Server
   - Apache Tomcat 9.0.50

## 주요 기능

1. **메인 화면**
   - <img src="https://user-images.githubusercontent.com/42332051/136549678-c70e9ccc-5608-435e-b373-1bda8bafb99e.gif">
   - *WebGL Earth 라이브러리*를 이용해서 지구본 이미지를 표시한다. 지구본에 세계 22곳의 랜드마크를 국기 이미지의 마커로 표시한다.
   - *Menucool jQuery Slider 라이브러리*를 이용해서 이미지 슬라이더를 표시한다. 슬라이더에 세계 22곳의 랜드마크를 샘플 이미지로 표시한다.
   - 지구본 마커와 슬라이더 이미지에 커서를 올리면 해당 랜드마크 이름을 이용해서 **실시간으로 이미지 한 장을 검색해서 표시**한다.
   - 표시된 실시간 이미지를 클릭하면 검색 페이지로 이동하고 해당 **랜드마크 이름을 이용해서 검색** 기능을 실행한다.

2. **검색 페이지**
   - <img src="https://user-images.githubusercontent.com/42332051/135755685-5bf89037-8c36-4fbe-b0db-86fc3e3b0cd2.gif">
   - 검색어를 입력하고 검색을 요청하면 *Flicker API*를 이용해서 최근에 업로드된 100건의 **사진을 검색**한다.
   - 검색 결과를 *최근, 오래된 순으로 정렬*할 수 있고 *썸네일의 크기를 크게, 작게 표시*할 수도 있다.
   - <img src="https://user-images.githubusercontent.com/42332051/135755689-04c3b646-5abb-44cf-886b-ff679dcf626f.gif">
   - 검색 결과 중 하나를 클릭하면 AJAX 방식으로 *상세 이미지*와 함께 *이미지에 작성된 태그, 카메라 브랜드와 모델, 카메라 설정값, 촬영일, 이미지 형식 등*과 같은 **각종 메타 데이터를 불러와서 표시**한다.
   - 이때, *Google Vision API*를 이용해서 *기계 학습을 통해 이미지를 인식*, **키워드(Label Detection)와 관련 단어(Web Detection)를 추출**하여 데이터베이스에 저장한다.
   - <strike>카메라 기종명을 이용해서 검색하면 해당 기기의 외관 사진과 상세 스펙을 추가로 표시한다.</strike>(기종명, 사진, 스펙 정보를 사전에 하드코딩으로 입력)

3. **트렌드 분석 페이지**
   - <img src="https://user-images.githubusercontent.com/42332051/136640155-7134b702-6972-480c-b240-9dd040f70cc3.gif">
   - **최다 검색어 30개**를 워드클라우드 형태로 표시한다. 검색어를 클릭하면 검색 페이지로 이동하고 해당 *검색어를 이용해서 검색 기능을 실행*한다.
   - <img src="https://user-images.githubusercontent.com/42332051/136640156-d3f45490-ff0d-4e5d-a37f-e7e0497694d6.gif">
   - 데이터베이스에 누적된 정보를 이용해서, 사용자가 열람한 사진들 중 **가장 많이 사용된 카메라 브랜드 10개**를 원 그래프와 표의 형태로 표시한다.
   - *카메라 브랜드 원 그래프 중 한 조각을 클릭*하면, **해당 브랜드 중 가장 많이 사용된 모델 10개**를 순서대로 표시한다.
   - <img src="https://user-images.githubusercontent.com/42332051/136640157-248ab973-c9bc-4512-b8c7-d64528d531cd.gif">
   - 데이터베이스에 누적된 정보를 이용해서, 사용자가 열람한 사진들 중 **가장 많이 사용된 카메라 모델 10개**를 원 그래프와 표의 형태로 표시한다.
   - *카메라 모델 원 그래프 중 한 조각을 클릭*하면, **해당 모델 중 가장 많이 촬영된 대상 키워드 및 관련 단어 10개**를 순서대로 표시한다.

## 비고
- 현재 도메인 만료 및 Google Vision API key 만료로 인한 이미지 인식 및 키워드, 관련 단어 추출 기능 비활성화
