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
	// 쿠키값 삭제
	// 쿠키값 가져오기
	Cookie cookies[] = request.getCookies();
	// 쿠키값 시간 0 설정
	if(cookies!= null) {
	    for(int i=0; i<cookies.length; i++) {
	        if(cookies[i].getName().equals("name")) {
	            cookies[i].setMaxAge(0);
	            // 쿠키값 클라이언트 저장
	            response.addCookie(cookies[i]);
	        }
	    }
	}
	
%>
<!-- 이동 cookieTest.jsp -->
<script type="text/javascript">
	alert("쿠키값삭제");
	location.href="cookieTest.jsp";
</script>
</body>
</html>