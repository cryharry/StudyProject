<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키값 생성 이름 "name" 값 "Cookie Test Value"
	Cookie cookie = new Cookie("name", "Cookie Test Value");
	// 쿠키 유지 기간 설정
	cookie.setMaxAge(60*10); // 10분(600초) 설정
	// 쿠키 클라이언트 저장
	response.addCookie(cookie);
	// 이동 cookieTest.jsp
%>
<!-- 자바스크립트 이용시 -->
<script type="text/javascript">
	alert("쿠키값생성");
	location.href="cookieTest.jsp";
</script>
</body>
</html>