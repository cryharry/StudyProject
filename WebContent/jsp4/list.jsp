<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션값 사져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없는 경우 admin아닌 경우 main.jsp이동
	if(id==null || !id.equals("admin")) {
	    response.sendRedirect("main.jsp");
	}
%>
<h1>회원목록</h1>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>가입날짜</td>
		<td>나이</td>
		<td>성별</td>
		<td>이메일</td>
	</tr>
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			// 디비 연결
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
			
			conn = ds.getConnection();
			stmt = conn.createStatement();
			sql = "SELECT * FROM MEMBER";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("passwd") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getTimestamp("reg_date") %></td>
					<td><%=rs.getInt("age") %></td>
					<td><%=rs.getString("gender") %></td>
					<td><%=rs.getString("email") %></td>
				</tr>
				<%
			}
		}catch(Exception e){
		    out.println(e.toString());
		} finally {
		    if(rs!= null) rs.close();
		    if(stmt!= null) stmt.close();
		    if(conn!= null) conn.close();
		}
	%>
</table>
</body>
</html>