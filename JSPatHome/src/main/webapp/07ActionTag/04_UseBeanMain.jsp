<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<jsp:useBean id="person" class="common.Person" scope="request" /> <!-- request 영역에 자바빈즈 객체생성 -->
	<!-- 기본생성자가 존재하고, get/set 메소드가 규율에 맞게 설정되어 있어야 함. -->
	
	<h3>setProperty  액션 태그로 자바빈즈 속성 지정하기</h3>
	<jsp:setProperty name="person" property="name" value="문승호" /> <!-- 속성값 셋팅 -->
	<jsp:setProperty name="person" property="age" value="33" />
	
	<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<ul>
		<li>이름 : <jsp:getProperty name="person" property="name" /></li> <!-- 속성값 가져오기 -->
		<li>나이 : <jsp:getProperty name="person" property="age" /></li>
	</ul>
</body>
</html>