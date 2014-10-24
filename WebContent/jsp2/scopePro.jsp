<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScopePro</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf8");
	String id = request.getParameter("id");
	// 영역 속성값 생성
	pageContext.setAttribute("page", "pageContext Value");
	request.setAttribute("req", "Request Value");
	session.setAttribute("ses", "Session Value");
	application.setAttribute("app", "Application Value");
%>
<h1>scopePro.jsp페이지</h1>
파라미터값 아이디:<%=id %><br>
<!-- 영역 속성값 가져오기 -->
pageContext 속성값: <%=pageContext.getAttribute("page") %><br>
request 속성값: <%=request.getAttribute("req") %><br>
session 속성값: <%=session.getAttribute("ses") %><br>
application 속성값: <%=application.getAttribute("app") %><br> 
<a href="scopeProPro.jsp?id=<%=id%>&passwd=pas1111">scopeProPro.jsp이동</a><br>
<script type="text/javascript">
	alert("scopeProPro.jsp페이지 이동");
	location.href = "scopeProPro.jsp?id=<%=id%>&passwd=pas1111";
</script>
<%
	response.sendRedirect("scopeProPro.jsp?id="+id+"&passwd=pas1111");
	// 액션 태그 forward액션태그
	// A페이지의 모든(request) 정보를 가지고 -> B페이지로 이동
	// 주소줄 A페이지 유지 -> 실제내용 B페이지
	
%>
<%-- <jsp:forward page="scopeProPro.jsp">
	<jsp:param value="pass1111" name="passwd" />
</jsp:forward> --%>
</body>
</html>