<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	
	<div class="contact-us section" id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-6  align-self-center">
          <div class="section-heading">
            <h6>CCP</h6>
            <h2>로그인</h2>
            <p>Thank you for choosing our templates. We provide you best CSS templates at absolutely 100% free of charge. You may support us by sharing our website to your friends.</p>
            <div class="special-offer">
              <span class="offer">CCP</span>
     
              <h4>메인화면으로 이동</h4>
              <a href="#"><i class="fa fa-angle-right"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="contact-us-content">
            <form id="contact-form" action="loginMember.me" method="post">
              <div class="row">
                <div class="col-lg-12">
                  <fieldset>
                    <input type="text" name="userId" id="userId" placeholder="아이디" required>
                  </fieldset>
                </div>
                <div class="col-lg-12">
                  <fieldset>
                    <input type="password" name="userPwd" id="userPwd"  placeholder="비밀번호" required>
                  </fieldset>
                </div>
                <div class="col-lg-12">
                </div>
                <div class="col-lg-12">
                  <fieldset>
                    <button type="submit" id="form-submit" class="orange-button">로그인</button>
                    <button type="button" id="form-submit" class="orange-button" onclick="location.href='insertForm.me'">회원가입</button>
                  </fieldset>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>