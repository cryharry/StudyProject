<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// 디비연결
	// MemberDAO 객체 생성 memberdao
	MemberDAO memberdao = new MemberDAO();
	// int check =  메서드 호출 userCheck(id, passwd);
	int check = memberdao.userCheck(id, passwd);
	// check == 1 세션값생성 "id" main.jsp이동
	if(check == 1) {
	    session.setAttribute("id", id);
	    response.sendRedirect("main.jsp");
	}
	// check == 0 "비밀번호틀림" 뒤로이동
	else if(check == 0) {
	    %>
	    <script>
	    	alert("비밀번호틀림");
	    	history.back();
	    </script>
	    <%
	}
	// check == -1 "아이디없음" 뒤로이동
	else {
	    %>
	    <script>
	    	alert("아이디없음");
	    	history.back();
	    </script>
	    <%
	}
%>