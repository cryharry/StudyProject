<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// pageNum 가져오기
	String pageNum = request.getParameter("pageNum");
	// 액션태그 자바빈 객체 생성 boardbean
	// 액션태그 폼 => 자바빈 저장
	%>
	<jsp:useBean id="boardBean" class="board.BoardBean">
		<jsp:setProperty property="*" name="boardBean" />
	</jsp:useBean>
	<%
	// 디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	// int check = 메서드 호출 updateBoard(boardBean)
	int check = boardDAO.updateBoard(boardBean);
	// check==1 업데이트 성공 list.jsp?pageNum=
	if(check == 1) {
	    response.sendRedirect("list.jsp?pageNum="+pageNum);
	}
	// check==0 비밀번호 틀림 뒤로이동
	else {
	    %>
	    	<script>
	    		alert("비밀번호 틀림");
	    		history.back();
	    	</script>
	    <%
	}
%>