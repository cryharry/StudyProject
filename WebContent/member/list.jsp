<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@page import="java.util.*" %>
<%@page import="member.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션값 사져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없는 경우 admin아닌 경우 main.jsp이동
	if(id==null || !id.equals("admin")) {
	    response.sendRedirect("main.jsp");
	}
	// 디비객체 생성
	MemberDAO memberDAO = new MemberDAO();
	// List memberlist = 메서드 호출 getMembers()
	List memberlist = memberDAO.getMembers();
	MemberBean memberBean[] = new MemberBean[memberlist.size()];
	for(int i=0; i<memberlist.size(); i++) {
		memberBean[i] = (MemberBean)memberlist.get(i);
	}
%>
<h1>회원목록</h1>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>가입날짜</td>
		<td>나이</td>
		<td>성별</td>
		<td>이메일</td>
	</tr>
	<%for(int i=0; i<memberBean.length; i++)  {%>
	<tr>
		<td><%=memberBean[i].getId()%></td>
		<td><%=memberBean[i].getPasswd()%></td>
		<td><%=memberBean[i].getName()%></td>
		<td><%=memberBean[i].getReg_date()%></td>
		<td><%=memberBean[i].getAge()%></td>
		<td><%=memberBean[i].getGender()%></td>
		<td><%=memberBean[i].getEmail()%></td>
	</tr>
	<%} %>
</table>
</body>
</html>