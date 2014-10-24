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
	// 세션값 생성 이름 "name" 값 "session Test Value"
	session.setAttribute("name", "session Test Value");
	// 이동 sessionTest.jsp
	// JSP sendRedirect 이용시
	// response.sendRedirect("sessionTest.jsp");
%>
<!-- 자바스크립트 이용시 -->
<script type="text/javascript">
	alert("세션값생성");
	location.href="sessionTest.jsp";
</script>
</body>
</html>