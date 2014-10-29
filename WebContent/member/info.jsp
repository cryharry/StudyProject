<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@page import="member.MemberDAO"%>
<%
	request.setCharacterEncoding("utf8");
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp이동
	if(id == null) {
	    response.sendRedirect("main.jsp");
	}
	// 디비연결
	// 디비객체 생성 memberdao
	MemberDAO memberdao = new MemberDAO();
	// 메서드호출 getMember(id)
	// MemberBean memberbean = 메서드호출 getMember(id)
	MemberBean memberbean = memberdao.getMember(id);
%>
<html>
<body>
	아이디:<%=memberbean.getId() %><br>
	비밀번호:<%=memberbean.getPasswd() %><br>
	이름:<%=memberbean.getName() %><br>
	가입날짜:<%=memberbean.getReg_date() %><br>
	나이:<%=memberbean.getAge() %><br>
	성별:<%=memberbean.getGender() %><br>
	이메일:<%=memberbean.getEmail() %><br>
	<a href="main.jsp">메인화면으로</a>
</body>
</html>