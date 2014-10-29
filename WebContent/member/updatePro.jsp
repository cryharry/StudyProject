<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@page import="member.MemberBean"%>
<%
	request.setCharacterEncoding("utf8");
	// 액션태그 자바빈 객체 생성 memberbean
	// 액션태그 폼 => 자바빈 저장
	%>
	<jsp:useBean id="memberbean" class="member.MemberBean" />
	<jsp:setProperty property="*" name="memberbean" />
	<%
	// 디비연결
	// 디비연결 객체생성 memberdao
	MemberDAO memberdao = new MemberDAO();
	// int check = updateMember(memberbean)
	int check = memberdao.updateMember(memberbean);
	// check==1 "수정성공" main.jsp이동
	if(check==1) {
	    %>
	    <script>
	    	alert("수정성공");
	    	location.href="main.jsp";
	    </script>
	    <%
	}
	// check==0 "비밀번호틀림" 뒤로이동
	else if(check==0) {
	    %>
	    <script>
	    	alert("비밀번호틀림");
	    	history.back();
	    </script>
	    <%
	}
	// check==-1 "아이디없음" 뒤로이동
	else {
	    %>
	    <script>
	    	alert("아이디없음");
	    	history.back();
	    </script>
	    <%
	}
%>