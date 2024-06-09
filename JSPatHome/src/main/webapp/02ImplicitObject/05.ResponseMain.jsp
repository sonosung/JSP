<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>
<h2>1. 로그인 폼"./"은 상대경로. 현재위치를 나타냄. "../"은 한단계 위 폴더를 가리킴.</h2>
<% 
String loginErr = request.getParameter("loginErr");
if (loginErr != null) out.print("로그인 실패");
%>
<form action="./06.ResponseLogin.jsp" method="post">
아이디 : <input type="text" name="user_id" /><br />
패스워드 : <input type="text" name="user_pwd" /><br />
<input type="submit" value="로그인" />

<h2>2. HTTP 응답 헤더 설정하기</h2>
<form action="./08.ResponseHeader.jsp" method="get">
날짜 형식 : <input type="text" name="add_date" value="2024-05-23 14:10" /><br />

숫자 형식 : <input type="text" name="add_int" value="2929" /><br />

문자 형식 : <input type="text" name="add_str" value="이구아나" /><br />
<input type="submit" value="응답 헤더 설정 & 출력" /><br />
</form>
</form>
</body>
</html>