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
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기 id passwd
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	/* DB연결 비교 맞으면 session 생성 로그인인증
			 비밀번호 틀리면 비밀번호 틀림
			 아이디 없으면 아이디없음 */
	// DBID "kim" DBPASS "kim1234"
	// 아이디 비교 맞으면 비밀번호 비교 맞으면 세션값생성 "id" 틀리면 "비밀번호틀림"
	if(id.equals("kim")) {
		if(passwd.equals("kim1234")) {
			// 세션값 생성 "id"
			session.setAttribute("id", id);
			response.sendRedirect("sessionMain.jsp");
		} else {
			out.println("<script>alert('비밀번호틀림')</script>");
			out.println("<script>location.href='sessionLoginForm.jsp'</script>");
		}
	} else {
		out.println("<script>alert('아이디없음')</script>");
		out.println("<script>location.href='sessionLoginForm.jsp'</script>");
	}
%>
</body>
</html>