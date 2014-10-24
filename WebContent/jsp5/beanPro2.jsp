<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.BeanTest2" %>
<%
	// 한글 처리
	request.setCharacterEncoding("utf8");
	// 액션태그 객체생성 bt2
	// 액션태그 폼 => 자바빈 저장
	%>
		<jsp:useBean id="bt2" class="test.BeanTest2" />
		<jsp:setProperty property="*" name="bt2" />
		아이디:<jsp:getProperty property="id" name="bt2" /><br>
		패스워드:<jsp:getProperty property="passwd" name="bt2" /><br>
		좋아하는 숫자:<jsp:getProperty property="number" name="bt2" /><br>
	<%
	// 액션태그 출력
%>  