<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
서버도메인명:<%=request.getServerName() %><br>
서버포트번호:<%=request.getServerPort() %><br>
요청URL:<%=request.getRequestURL() %><br>
요청URI:<%=request.getRequestURI() %><br>
프로토콜:<%=request.getProtocol() %><br>
전송방식:<%=request.getMethod() %><br>
컨텍스트경로:<%=request.getContextPath() %><br>
물리적경로:<%=request.getRealPath("/") %><br>
클라이언트호스트:<%=request.getRemoteHost() %><br>
클라이언트IP주소:<%=request.getRemoteAddr() %>
</body>
</html>