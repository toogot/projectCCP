<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#social-wrap{
		width: 200px;
		margin-top: 30px;
	}
</style>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous" />
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
            <div id="social-wrap">
	            <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0746476497ec8c987bca594c88f0b09c&redirect_uri=http://localhost:8053/ccp/kakaoCallback.me">
				  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
				    alt="카카오 로그인 버튼" />
				</a>
			</div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	Kakao.init('e56deda5fad6b83a79e9155ef4a1751c');
	console.log(Kakao.isInitialized())
	
		
	$(function(){
		if(${token} != null){
			console.log(${token})
			
			$.ajax({
				url:"https://kapi.kakao.com/v2/user/me",
				beforeSend : function(xhr){
			        xhr.setRequestHeader("Authorization", "Bearer "+ ${token});
			        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
			    },
			    success:function(data){
			    	console.log(data);
			    }
			})
			
		}
	})

	</script>
	
</body>
</html>