<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, member.MemberBean" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 자바빈 파일 생성 패키지 member 파일이름 MemberBean
	// 액션태그 usebean 객체 생성 memberBean
	// 액션태그 setProperty 폼 => 자바빈
	%>
		<jsp:useBean id="memberbean" class="member.MemberBean" />
		<jsp:setProperty property="*" name="memberbean" />
	<%
	// 시스템 현재날짜 시간 => 자바빈 저장 setReg_date
	memberbean.setReg_date(new Timestamp(System.currentTimeMillis()));
	
	// 디비작업
	// 파일만들기 패키지 member 파일이름 MemberDAO
	// 객체생성 memberdao
	MemberDAO memberdao = new MemberDAO();
	// 디비(insert)작업처리 => 메서드호출 insertMember(memberbean);
	memberdao.insertMember(memberbean);
	// 이동 "회원가입성공" loginForm.jsp이동
%>
<script>
	alert("회원가입성공");
	location.href="loginForm.jsp";
</script>