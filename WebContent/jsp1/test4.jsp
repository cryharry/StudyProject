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
	// 문자열 id 문자열 passwd 정수형 age 선언
	String id, passwd;
	int age;
	// id "test"값 넣기 passwd "testpass"값 넣기
	id = "test"; passwd = "testpass";
	// age 20 값넣기
	age = 20;
	// 출력
	out.println(id+"님의 <br> 비밀번호는 "+passwd+"이고 , 나이는 "+age+"입니다.<br>");
%>
<%=id %>님의 <br> 비밀번호는 <%=passwd %>이고 , 나이는 <%=age %>입니다.<br>
</body>
</html>