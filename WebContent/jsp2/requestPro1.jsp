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
	String snum = request.getParameter("num"); // num파라미터
	int num = Integer.parseInt(snum);
%>
문자열숫자<%=snum+10 %><br>
숫자+10=<%=num+10 %><br>
<%
	if(num>10) {
		out.println(num+":10보다크다");
	} else {
		out.println(num+":10보다작거나같다");
	}
%>
</body>
</html>