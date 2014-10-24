<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	// 시스템 현재날짜 시간
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
	 	// JNDI DB연결
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
		
		conn = ds.getConnection();
		// sql 구문
		String sql = "insert into member values (?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, reg_date);
		pstmt.setInt(5, Integer.parseInt(age));
		pstmt.setString(6, gender);
		pstmt.setString(7, email);
		// 실행
		pstmt.executeUpdate();
		//out.println("회원가입성공");
		
		%>
		<script>
			alert("회원가입성공");
			location.href="loginForm.jsp";
		</script>
		<%
	} catch(Exception e) {
	    out.println(e.toString());
	} finally {
	    //닫기
	    if(pstmt!= null) try{pstmt.close();} catch(Exception e){}
		if(conn!= null) try{conn.close();} catch(Exception e){}
	}
%>