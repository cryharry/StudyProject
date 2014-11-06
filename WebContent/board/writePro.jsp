<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//자바빈 파일 만들기 패키기 board 파일이름 BoardBean
	//액션태그 객체 생성 boardbean
	//액션태그 폼 => 자바빈 저장
%>
<jsp:useBean id="boardbean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardbean"/>
<%
	// set메서드 호출 date  ip
	boardbean.setDate(new Timestamp(System.currentTimeMillis()));
	boardbean.setIp(request.getRemoteAddr());
	
	// 디비파일만들기 패키지 board 파일이름 BoardDAO
	// 디비객체 생성 boarddao
	BoardDAO boarddao=new BoardDAO();
	// 메서드호출 insertBoard(boardbean)
	boarddao.insertBoard(boardbean);
	// 이동 list.jsp이동
%>
<script>
	alert("글쓰기성공");
	location.href="list.jsp";
</script>


