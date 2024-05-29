<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#form-wrap{
		width: 500px;
		margin: auto;
	}
	#btn-wrap{
		width: 200px;
		margin: auto;
		margin-top: 50px;
	}
	.row select{
		display: block;
	}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="form-wrap" class="container mt-3">
		<h1>회원가입</h1>
		<form action="/action_page.php">
		  <div class="mb-3 mt-3">
		    <label for="userId" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="userId" placeholder="ID" name="userId">
		  </div>
		  <div class="mb-3">
		    <label for="userPwd" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="userPwd" placeholder="Password" name="userPwd">
		  </div>
		  <div class="mb-3">
		    <label for="checkPwd" class="form-label">비밀번호확인</label>
		    <input type="password" class="form-control" id="checkPwd" placeholder="Password">
		  </div>
		  <div class="mb-3">
		    <label for="userName" class="form-label">이름</label>
		    <input type="text" class="form-control" id="userName" placeholder="Password" name="userName">
		  </div>
		  <div class="row">
		  	<label for="pwd" class="form-label">이메일</label>
		    <div class="col">
		      <input type="text" class="form-control" name="front-email">
		    </div>
		    @
		    <div class="col">
		      <input type="text" class="form-control" name="back-email">
		    </div>
		    <div class="col">
		     <select id="emailSelect" class="form-select mt-3">
		     	<option>직접입력</option>
		     	<option>naver.com</option>
		     	<option>daum.com</option>
		     	<option>nate.com</option>
		     	<option>gmail.com</option>		     	
		     </select>
		    </div>
		  </div>
		  <div id="btn-wrap">
		  	<button type="submit" class="btn btn-primary">회원가입</button>
		  	<button type="reset" class="btn btn-danger">취소</button>
		  </div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>