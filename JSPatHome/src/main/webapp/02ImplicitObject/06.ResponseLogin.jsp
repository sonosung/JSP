<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - Response</title>
</head>
<body>
<%
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
if (id.equalsIgnoreCase("msh") && pwd.equalsIgnoreCase("1234")) {//equalsIgnoreCase : 대소문자를 구분하지 않는 메소드.
	response.sendRedirect("07.ResponseWelcome.jsp");
} else {
	request.getRequestDispatcher("05.ResponseMain.jsp?loginErr=1").forward(request, response);//"?"는 헤더에 값을 넣는 쿼리.05.ResponseMain.jsp 의 13절에 loginErr 값에 1을 넣어서 에러를 띄움.
}
%>
</body>
</html>