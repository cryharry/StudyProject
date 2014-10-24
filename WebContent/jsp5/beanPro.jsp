<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="test.BeanTest"%>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 파라미터값 가져오기 => 바구니에 담아서 => 디비작업
	//String name = request.getParameter("name");
	// 바구니 => 자바빈
	/* BeanTest bt = new BeanTest(); // 객체 생성(기억장소 할당)
	bt.setName(name); // 값 저장
	out.println("이름: " +bt.getName()); */
	
	// 액션태그 객체 생성
	// 액션태그 폼 => 자바빈 저장
	%>
		<jsp:useBean id="bt" class="test.BeanTest" />
		<jsp:setProperty property="*" name="bt" />
		이름:<jsp:getProperty property="name"  name="bt" />
	<%
	// 디비연결 insert 분리
%>