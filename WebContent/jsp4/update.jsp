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
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp
	if(id == null) response.sendRedirect("loginForm.jsp");
	// 디비연결용 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	// 변수 선언
	String name = "", gender = "", email = "";
	int age = 0;
	
	
	try {
	    // JNDI
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    // 디비연결
	    conn = ds.getConnection();
	    // sql구문
	    sql = "select * from member where id = ?";
	    // sql 실행
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    // 결과값 저장
	    rs = pstmt.executeQuery();
	    // 결과값 있으면 변수에 대입
	    if(rs.next()) {
	        name = rs.getString("name");
	        age = rs.getInt("age");
	        gender = rs.getString("gender");
	        email = rs.getString("email");
	    }
	}catch(Exception e) {
	    e.printStackTrace();
	} finally {
	    if(rs!=null) rs.close();
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
	
%>
<h1>회원정보수정</h1>
<form action="updatePro.jsp" method="post">
아이디: <%=id %><br>
비밀번호:<input type="password" name="passwd"><br>
이름:<input type="text" name="name" value="<%=name%>"><br>
나이:<input type="text" name="age" value="<%=age%>"><br>
성별:남<input type="radio" name="gender" value="남" <%if(gender.equals("남")){%>checked<%} %>>
     여<input type="radio" name="gender" value="여" <%if(gender.equals("여")){%>checked<%} %>><br>
이메일주소:<input type="text" name="email" value="<%=email%>"><br>
<input type="submit" value="정보수정">
</form>
</body>
</html>