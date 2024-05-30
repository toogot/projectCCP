<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
 	<link href="<%= request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/templatemo-scholar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
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
                    <a href="#" class="logo">
                        <h1>CCP</h1>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Serach Start ***** -->
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="검색" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Serach Start ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                      <li class="scroll-to-section"><a href="<%= request.getContextPath() %>" class="active">메인화면</a></li>
                      <li class="scroll-to-section"><a href="#services">결제</a></li>
                      <li class="scroll-to-section"><a href="#courses">매장찾기</a></li>
                      <li class="scroll-to-section"><a href="#team">입점신청</a></li>
                      <li class="scroll-to-section"><a href="#events">고객센터</a></li>
                
				  	<c:choose>
					  	<c:when test="${ empty loginUser }">
					  		 <li class="scroll-to-section"><a href="loginForm.me">로그인</a></li>
					  	</c:when>
					  	<c:otherwise>
					  		<li class="scroll-to-section"><a href="logout.me">로그아웃</a></li>
					  	</c:otherwise>
				    </c:choose>
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
  
   <script src="<%= request.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/isotope.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/owl-carousel.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/counter.js"></script>
  <script src="<%= request.getContextPath() %>/resources/assets/js/custom.js"></script>


</body>
</html>