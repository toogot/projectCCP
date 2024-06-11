<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>게시판</title>

    <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/templatemo-scholar.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
    <style>
    	 .event_box {
    	 	margin-left: 300px;
    	 }
    	 
    	 .down-content {
    	 	width:350px;
    	 }
    	 
    	 #courses {
    	 	margin-top:50px;
    	 }
    	 
    	 #c1, #c2 {
    	 	width:350px;
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
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Serach Start ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                     <li class="scroll-to-section"><a href="<%= request.getContextPath() %>">메인화면</a></li>
                      <li class="scroll-to-section"><a href="#services">결제</a></li>
                      <li class="scroll-to-section"><a href="#courses">매장찾기</a></li>
                      <li class="scroll-to-section"><a href="#team">입점신청</a></li>
                      <li class="scroll-to-section"><a href="#events">고객센터</a></li>
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
	    
    </div>
    </div>

 
       
         
	<div id="selectNotice">
	    <h2 align="center" style="margin-top:50px;">공지사항</h2>
		<br><br>
		<table id="selectTable" style="border:1px solid gray;">
		  <thead style="border:1px solid gray;">
		  	
				<tr>				  
					<th width="50">게시물 번호</th>
	                <th width="100">제목</th>
	                <th width="50">작성자</th>
	                <th width="50">작성일</th>
	                <th width="50">조회수</th>               					
				</tr>
			</thead>
			<tbody>
			<c:forEach var="nl" items="${ selectNotice }">
			  <tr>   			  	
			    <td>${ nl.notiCode }</td>
			    <td>${ nl.notiTitle }</td>
			    <td>관리자</td>
			    <td>${ nl.notiCount }</td>
			    <td>${ nl.notiDate }</td>			  	
			  </tr>
			  </c:forEach>
			</tbody>
		</table>	
	</div> 
  
	<div id="pagingArea">
                <ul class="pagination">
                		<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="notice.no?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	                    	</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    		<li class="page-item"><a class="page-link" href="notice.no?cpage=${ p }">${ p }</a></li>
                    	</c:forEach>
                    	<c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                   		 <li class="page-item disabled"><a class="page-link" href="">Next</a></li>
	               			</c:when>
	               			<c:otherwise>
	               				<li class="page-item"><a class="page-link" href="notice.no?cpage=${ pi.currentPage + 1 }">Next</a></li>
	               			</c:otherwise>
               			</c:choose>
                </ul>
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

</body>
</html>