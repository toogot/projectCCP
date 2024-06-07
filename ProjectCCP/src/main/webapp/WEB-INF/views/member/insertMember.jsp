<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.check{
	color: red;
}

#form-wrap {
	width: 700px;
	margin: auto;
}
#form-wrap>h1{
	margin: 50px 0px;
}

#btn-wrap {
	width: 200px;
	margin: auto;
	margin-top: 50px;
}

#front-email {
	width: 200px;
}

#back-email{
	width: 260px;
}
#userId{
	display:block;
	float:left;
	width: 500px;
}
.mb-3 button{
	display:block;
	float:left;
	width: 100px;
	margin-left: 25px;
}
#idCheck{
	display: block;
	margin-top: 5px
}
#address{
	width: 500px;
}
.mb-3 input{
	width: 500px;
}
#phoneWrap{
	width: 500px;
}
#phoneWrap input, #phoneWrap select,#phoneWrap div{
	width: 155px;
	margin: 0px;
}


</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="form-wrap" class="container mt-3">
		<h1>회원가입</h1>
		<form class="form-inline"  action="inserMember.me">
		
		  <div class="mb-3 mt-3">
		    <label for="userId" class="form-label">아이디</label>
		    <br>
		    <input type="text" class="form-control" id="userId" placeholder="영문자로 시작,영문자,숫자 조합 8글자 이상" name="userId" required onkeyup="idCheck();"  oninput="insertMember();">
		   
		    <br><br>
		    <div id="idCheck" class="check" onchange="insertMember();"></div>
		  </div>
		  <div class="mb-3">
		    <label for="userPwd" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="userPwd" placeholder="영문자,숫자,특수문자 조합 8글자 이상" name="userPwd" required onkeyup="pwdCheck();" oninput="insertMember();">
		    <div id="pwdCheck" class="check" onchange="insertMember();"></div>
		  </div>
		  
		  <div class="mb-3">
		    <label for="checkPwd" class="form-label">비밀번호확인</label>
		    <input type="password" class="form-control" id="checkPwd" placeholder="위의 비밀번호와 동일하게 입력" required onkeyup="reCheckPwd();" oninput="insertMember();">
		    <div id="checkPwdBox" class="check" onchange="insertMember();"></div>
		  </div>
		  
		  <div class="mb-3">
		    <label for="userName" class="form-label">이름</label>
		    <input type="text" class="form-control" id="userName" placeholder="한글두글자이상" name="userName" required onkeyup="nameCheck();" oninput="insertMember();">
		    <div id="nameCheck" class="check" onchange="insertMember();"></div>
		  </div>
		  
		  <div class="row">
		  	<label for="front-email" class="form-label">이메일</label>
		    <div class="col">
		      <input type="text" class="form-control" id="front-email" onchange="insertMember();">
		    </div>
		    @
		    <div class="col">
		      <input type="text" class="form-control" id="back-email" onkeyup="backEmailSelect(this)" oninput="insertMember();">
		    </div>
		    <div class="col">
		     <select id="emailSelect" class="form-select" onchange="backEmailSelcet(this);">
		     	<option>직접입력</option>
		     	<option>naver.com</option>
		     	<option>daum.com</option>
		     	<option>nate.com</option>
		     	<option>gmail.com</option>		     	
		     </select>
		    </div>
		  </div>
		  
		  <input type="hidden" id="email" name="email" value="" onchange="insertMember();">

		  <div class="row" style="margin-top: 10px;" id="phoneWrap">
			<label for="front-email" class="form-label">전화번호</label>
		  	<div class="col">
				<select id="phoneSelect" class="form-select" onchange="insertPhone();">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>019</option>
					<option>018</option>		     	
				</select>
		  	</div>
			
			<div class="col">
				<input type="text" class="form-control" id="midPhone" maxlength="4" onkeyup="checkPhone();" onchange="insertPhone();">
			</div>
			
			<div class="col">
				<input type="text" class="form-control" id="lastPhone" maxlength="4" onkeyup="checkPhone();" onchange="insertPhone();">
			</div>
			<div id="phoneCheck" class="check" style="width: 300px" onchange="insertMember();"></div>
		  </div>
		  
		  <input type="hidden" id="phone" name="phone" oninput="insertMember();" onchange="insertMember();">
		  
		  <div class="row" style="margin-top: 10px;">
		  	<label for="pwd" class="form-label">주소</label>
		    <div class="col">
		      <input type="text" class="form-control" id="address" name="address" readonly required onchange="insertMember();">
		  	</div>
		  	<div class="col">
		      <button type="button" class="btn btn-primary" onclick="addressCheck();">주소확인</button>
		  	</div>
		  </div>
		  
		  <div id="btn-wrap">
		  	<button type="submit" id="insertBtn" class="btn btn-primary" disabled="disabled">회원가입</button>
		  	<button type="reset" class="btn btn-danger" onclick="location.href='<%=request.getContextPath()%>'">취소</button>
		  </div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>


<script>
	let req = "";
	let frontEmail = "";
	let backEmail = "";
	
	function insertIdCheck(){
		req=/^[a-z][a-z\d]{4,15}$/i;
		if($("#userId").val == ""){
			alert("아이디를 입력해주세요")
		}
		
		if(!req.test($("#userId").val())){
			alert("옳바른 아이디를 입력해주세요")
		}else{
			$.ajax({
				url:"idCheck.me",
				data:{
					userId:$("#userId").val()
				},
				success:function(data){
					if(data=="중복된 아이디입니다."){
						$("#idCheck").html("중복된 아이디입니다.").css("color","red")
					}else{
						$("#idCheck").html("사용 가능 아이디입니다.").css("color","green");
					}
				}
			})
		}
	}
	
	
	function idCheck(){
		req=/^[a-z][a-z\d]{4,15}$/i;
		if(!req.test($("#userId").val())){
			$("#idCheck").html("사용 불가능 아이디입니다.").css("color","red")
		}else{
			insertIdCheck();
		}
	}
	
	function pwdCheck(){
		req=/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		if(!req.test($("#userPwd").val())){
			$("#pwdCheck").html("사용 불가능한 비밀번호입니다.").css("color","red")
		}else{
			$("#pwdCheck").html("사용 가능한 비밀번호입니다.").css("color","green")
		}
		
		
		if($("#checkPwd").val() != $("#userPwd").val()){
			$("#checkPwdBox").html("비밀번호가 일치하지 않습니다.").css("color","red")
		}else{
			$("#checkPwdBox").html("비밀번호가 일치합니다.").css("color","green")
		}
		
	}
	
	function reCheckPwd(){

		if($("#checkPwd").val() != $("#userPwd").val()){
			$("#checkPwdBox").html("비밀번호가 일치하지 않습니다.").css("color","red")
		}else{
			$("#checkPwdBox").html("비밀번호가 일치합니다.").css("color","green")
		}
	}
	
	function nameCheck(){
		req=/^[가-힣]{2,}$/;
		if(!req.test($("#userName").val())){
			$("#nameCheck").html("옳바른 이름을 입력해주세요.")
		}else{
			$("#nameCheck").html("")
		}

	}
	function checkPhone(){
		req=/^[0-9]{3,4}$/;
		if(!req.test($("#midPhone").val()) || !req.test($("#lastPhone").val())){
			$("#phoneCheck").html("옳바른 전화번호를 입력해주세요.").css("color","red")
		}else{
			$("#phoneCheck").html("전화번호 확인.").css("color","green")
		}
	}
	
	
	function frontEmailSelect(e){
		frontEmail = $("#front-email").val();
		backEmail = $("#back-email").val();
		if(frontEmail != ""){
			$("#email").val(frontEmail+"@"+backEmail);
		}
	}
	function backEmailSelcet(e){
		if(e.value=="직접입력"){
			$("#back-email").attr("disabled",false).val("")
		}else{
			$("#back-email").attr("disabled",true).val(e.value)
			frontEmail = $("#front-email").val();
			backEmail = $("#back-email").val();
			$("#email").val(frontEmail+"@"+backEmail);
		}
	}
	
	function addressCheck(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            $("#address").val(data.roadAddress)
	            insertMember()
	        }
	    }).open();
		insertMember();
	}
	
	function insertPhone(){
		$("#phone").val($("#phoneSelect").val()+$("#midPhone").val()+$("#lastPhone").val())
	}
	
	$("input").on("input",function(){
		console.log($("#address").val())
		insertMember()
	})
	

	function insertMember(){
		if($("#idCheck").html() == "사용 가능 아이디입니다."
		  && $("#pwdCheck").html() == "사용 가능한 비밀번호입니다."
		  && $("#checkPwdBox").html() == "비밀번호가 일치합니다."
		  && $("#phoneCheck").html() == "전화번호 확인."
		  && $("#address").val() != ""
		  && $("#userName").val() != ""
		  && $("#nameCheck").html("") != "옳바른 이름을 입력해주세요."
		  ){
			$("#insertBtn").attr("disabled",false);
		 }else{
			 $("#insertBtn").attr("disabled",true);
		 }
	}

</script>



</html>