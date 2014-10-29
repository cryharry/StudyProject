<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf8");
	//세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp 이동
	 if(id == null) {
	    response.sendRedirect("loginForm.jsp");
	}
	// 파라미터 가져오기
	String passwd = request.getParameter("passwd");
	
	// 디비연결
	// 디비객체 생성 memberDAO
	MemberDAO memberDAO = new MemberDAO();
	// int check <= 메서드호출 deleteMember(id, passwd)
	int check = memberDAO.deleteMember(id, passwd);
	// check==1 세션값초기화 "삭제성공" loginForm.jsp이동
	if(check==1) {
	    session.invalidate();
	    %>
	    <script>
	    	alert("삭제성공");
	    	location.href="loginForm.jsp"
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