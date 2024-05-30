<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>매장찾기</title>

    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/templatemo-scholar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    <!-- 카카오 지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6efe75df65cddf72652dc9ce2bfc991d&libraries=services"></script>
    <style>
     .map {
        background-color: white;
        border-radius: 10px;
        height: 800px;
     }
     
     .search-input {
     	text-align:center;
     	margin-top:50px;
     }
     
     #placesList {
     	border-radius: 10px;
     	background-color: white;
     	font-size: 20px;
     }
    </style>
</head>
<body>
 <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                   <a href="<%= request.getContextPath() %>" class="logo">
                        <h1>CCP</h1>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Serach Start ***** -->
                    <div class="search-input">
                    </div>
                    <!-- ***** Serach Start ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                       <li class="scroll-to-section"><a href="<%= request.getContextPath() %>" class="active">메인화면</a></li>
                      <li class="scroll-to-section"><a href="#services">결제</a></li>
                      <li class="scroll-to-section"><a href="findStore.st">매장찾기</a></li>
                      <li class="scroll-to-section"><a href="#team">입점신청</a></li>
                      <li class="scroll-to-section"><a href="cscMain.cs">고객센터</a></li>
                  </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="main-banner" id="top">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
             <div class="map" id="map"></div>   
             <div class="search-input">
              <input type="text" placeholder="세차장 검색" id='keyword' name="searchKeyword" onkeypress="handle"  style="border-radius: 10px; width:300px; height:40px;"/>
              <i class="fa fa-search"  onclick="searchPlaces()" style="width:40px; height:40px;"></i>
             <div id="placesList"></div>
             </div>
        </div>
      </div>
    </div>
  </div>
  
  <footer>
    <div class="container">
      <div class="col-lg-12">
        <p>Copyright © 2036 Scholar Organization. All rights reserved. &nbsp;&nbsp;&nbsp; Design: <a href="https://templatemo.com" rel="nofollow" target="_blank">TemplateMo</a> Distribution: <a href="https://themewagon.com" rel="nofollow" target="_blank">ThemeWagon</a></p>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="<%= request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/isotope.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/owl-carousel.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/counter.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/custom.js"></script>

  <script>
      var mapContainer = document.getElementById('map'),
          mapOption = { 
              center: new kakao.maps.LatLng(37.5665, 126.9780), 
              level: 3 
          };

      var map = new kakao.maps.Map(mapContainer, mapOption);
    
      var ps = new kakao.maps.services.Places(); 
    
      function searchPlaces() {
          var keyword = document.getElementById('keyword').value;

          if (!keyword.replace(/^\s+|\s+$/g, '')) {
              alert('키워드를 입력해주세요!');
              return false;
          }

         
          ps.keywordSearch(keyword, placesSearchCB); 
      }
      
      function handleKeyPress(event) {
    	    if (event.keyCode === 13) { 
    	        searchPlaces(); 
    	    }
    	}
   	
    	document.getElementById('keyword').addEventListener('keypress', handleKeyPress);
    
      function placesSearchCB(data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {            
              displayPlaces(data);
          } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
              alert('검색 결과가 존재하지 않습니다.');
              return;
          } else if (status === kakao.maps.services.Status.ERROR) {
              alert('검색 결과 중 오류가 발생했습니다.');
              return;
          }
      }
    
      function displayPlaces(places) {
          var listEl = document.getElementById('placesList'), 
              bounds = new kakao.maps.LatLngBounds(), 
              listStr = '';
          
          
          for (var i=0; i<places.length; i++) {
              var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                  marker = addMarker(placePosition, i);
              
              bounds.extend(placePosition); 
              listStr += '<li>'+ '•  ' + places[i].place_name + '</li>';
          }

          listEl.innerHTML = listStr;
          map.setBounds(bounds); 
      }
    
      function addMarker(position, idx) {
          var marker = new kakao.maps.Marker({
              position: position,
              map: map
          });
          return marker;
      }
  </script> 
</body>
</html>
