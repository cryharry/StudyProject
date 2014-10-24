<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션초기화
	session.invalidate();
%>
<script>
	alert("로그아웃");
	location.href="sessionLogin.jsp";
</script>