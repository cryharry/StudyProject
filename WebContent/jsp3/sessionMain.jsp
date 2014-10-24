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
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 sessionLogin.jsp이동
	if(id == null) {
	    response.sendRedirect("sessionLogin.jsp");
	}
%>
<%=id %>님이 로그인 하셨습니다.<br>
<a href="sessionLogout.jsp">로그아웃</a>
</body>
</html>