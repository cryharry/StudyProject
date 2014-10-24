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
	request.setCharacterEncoding("utf8");
	String id = request.getParameter("id");
	String s = request.getParameter("s");
%>
파라미터값 아이디:<%=id %><br>
forward 파라미터값 패스워드:<%=request.getParameter("passwd") %><br>
pageContext 속성값: <%=pageContext.getAttribute("page") %><br>
request 속성값: <%=request.getAttribute("req") %><br>
session 속성값: <%=session.getAttribute("ses") %><br>
application 속성값: <%=application.getAttribute("app") %><br>
</body>
</html>