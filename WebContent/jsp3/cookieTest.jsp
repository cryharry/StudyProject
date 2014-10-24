<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>쿠키테스트</h1>
<%
	String name = "쿠키값 없음";
	// 쿠키값 가져오기
	Cookie cookies[] = request.getCookies();
	if(cookies!= null) {
	    for(int i=0; i<cookies.length; i++) {
	        if(cookies[i].getName().equals("name")) {
	            name = cookies[i].getValue();
	        }
	    }
	}
%>
<input type="button" onclick="location.href='cookieSet.jsp'" value="쿠키값생성">
<input type="button" onclick="location.href='cookieDel.jsp'" value="쿠키값삭제">
쿠키값: <%=name %>
</body>
</html>