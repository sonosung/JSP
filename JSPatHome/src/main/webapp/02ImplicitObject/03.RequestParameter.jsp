<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] favo = request.getParameterValues("favorit");//getParameterValues : 여러개의 값을 가져옴.
	String favorit = "";
	if (favo != null) {
		for (int i = 0; i < favo.length; i++) {
			favorit += favo[i] + " ";
		}
	}
	String intro = request.getParameter("intro").replace("\r\n", "<br>");//replace: 자바코드인 "\r\n"(커서 줄바꿈)을 HTML 코드인 <br> 로 변경. 
	%>
	<ul>
		<li>아이디 : <%=id%></li>
		<li>성별 : <%=sex%></li>
		<li>관심사항 : <%=favorit%></li>
		<li>자기소개 : <%=intro%></li>
	</ul>
</body>
</html>