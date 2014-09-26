<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 한글처리
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String sage = request.getParameter("age");
	int age = Integer.parseInt(sage);
	int age2 = Integer.parseInt(request.getParameter("age"));
%>
<%=name %>님의 나이는 <%=age %>입니다.<br>
<%
	if(age>=20) {
		out.println(age+" 나이는 20세이상입니다.");
	} else {
		out.println(age+" : 미성년입니다.");
	}
	
%>