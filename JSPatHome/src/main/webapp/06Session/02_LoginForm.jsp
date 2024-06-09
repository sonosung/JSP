<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
		crossorigin="anonymous">
		
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous">
	</script>
	<meta charset="UTF-8">
	<title>Session</title>
</head>
<body>
	
	<jsp:include page="../Common/01_Link.jsp"></jsp:include>
	
	<h2>로그인 페이지</h2>
	
	<span style="color: red; font-size: 1.2em"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("loginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId") == null) {
		//로그아웃 상태
	%>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	
	<form action="03_LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" /><br />
		패스워드 : <input type="password" name="user_pw" /><br />
		<button input type="submit" style=--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem; color: #fff; backgournd-color: #4287f5;" class="btn btn-primary">
		로그인하기</button>
	</form>

	<%
		} else {
	%>
	
	<%=session.getAttribute("UserName")%> 회원님, 로그인하셨습니다.
	<br />
	
	<a href="04_Logout.jsp">[로그아웃]</a>
	
	<%
	}
	%>
</body>
</html>