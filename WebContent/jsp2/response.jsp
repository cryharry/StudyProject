<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*
	response 객체 - 서버처리결과 저장
		response.setHeader("헤더이름", 헤더값);
		response.addCookie();
		response.setContentType("text/html; charset=UTF-8");
	페이지이동
		response.sendRedirect("request.jsp");
	pageContext 객체 - 현 페이지 정보 가지고 있는 객체
	session 객체 - 클라이언트 => 서버접속 접속정보 저장 - 페이지 상관없이 접속만 되었으면 유지되는 정보 */
	out.println("세션ID:" +session.getId()+"<br>");
	out.println("생성시간:" +session.getCreationTime()+"<br>");
	out.println("최종접속시간:" +session.getLastAccessedTime()+"<br>");
	out.println("세션유지시간:" +session.getMaxInactiveInterval()+"<br>");
	session.setMaxInactiveInterval(3600);
	out.println("세션유지시간:" +session.getMaxInactiveInterval());
	// 세션값 초기화(전체)
	session.invalidate();
	// 세션값 생성
	//session.setAttribute("세션이름", "세션값");
	// 세션값 가져오기
	//session.getAttribute("세션이름");
	// 세션값 하나만 지우기
	//session.removeAttribute("세션이름");
	
	// application 객체 - 사이트 start 계속유지되는 기억장소
	out.println("서버정보: " +application.getServerInfo()+"<br>");
	out.println("물리적경로: " +application.getRealPath("/")+"<br>");
	
	// out 객체 - 출력정보 저장객체
	out.println("출력");
	out.close(); // 출력끝냄
	out.println("끝"); // close 호출해서 출력안됨
%>
</body>
</html>