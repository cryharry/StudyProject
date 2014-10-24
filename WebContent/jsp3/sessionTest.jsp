<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>세션테스트</h1>
<%
	// 세션값 가져오기
	String name = (String)session.getAttribute("name");
	if(name == null) name="세션값없음";
%>
<input type="button" onclick="location.href='sessionSet.jsp'" value="세션값생성">
<input type="button" onclick="location.href='sessionDel.jsp'" value="세션값삭제">
<input type="button" onclick="location.href='sessionInval.jsp'" value="세션초기화"><br>
세션값: <%=name %>
</body>
</html>