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
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    
    <style>
     .map {
     	background-color:white;
     	border-radius:10px;
     	height:800px;
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
            <div class="map" id="map">
              <div class="header-text">               
              </div>
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

	

  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6efe75df65cddf72652dc9ce2bfc991d"></script>
  <script>
  	var ccpMap = document.getElementById('map');
  	var options = {
  			center: new kakao.maps.LatLng(33.450701, 126.570667),
  			level:3
  	};
  	
  	var map = new kakao.maps.Map(ccpMap, options);
  	
  
  	
  </script>	


</body>
</html>