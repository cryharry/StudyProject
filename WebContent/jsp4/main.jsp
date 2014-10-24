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
	// 세션값 없으면 loginForm.jsp 이동
	 if(id == null) {
	    response.sendRedirect("loginForm.jsp");
	}
%>
<h1>메인페이지</h1>
<%=id %>님이 로그인 하셨습니다.<br>
<a href="logout.jsp">로그아웃</a><br>
<a href="info.jsp">회원정보조회</a><br>
<a href="update.jsp">회원정보수정</a><br>
<a href="delete.jsp">회원정보삭제</a><br>
<%
	if(id!= null && id.equals("admin")) {
%>
		<a href="list.jsp">회원목록</a>
<%
	}
%>
</body>
</html>