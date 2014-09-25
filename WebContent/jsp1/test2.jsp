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
	String str = str1 + " Server Page";
%>
<%! // Declaration(선언)
	String str1 = "Java"; // 전역변수
	public String getStr() { // 메서드정의
		return str1;
	}
%>
<%=str %><br>
<%=getStr() %>
</body>
</html>