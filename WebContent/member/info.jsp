<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf8");
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp이동
	if(id == null) {
	    response.sendRedirect("main.jsp");
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
	    // JDNI
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	 	// 디비연결
	    conn = ds.getConnection();
	    // PrepareStatement로 sql 전송
	    sql = "select * from member where id = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    // rs에 실행결과 저장
	    rs=pstmt.executeQuery();
	    // rs에 데이터가 있으면 가져와서 출력
	    if(rs.next()) {
	        %>
		        아이디:<%=rs.getString("id") %><br>
		        비밀번호:<%=rs.getString("passwd") %><br>
		        이름:<%=rs.getString("name") %><br>
		        가입날짜:<%=rs.getTimestamp("reg_date") %><br>
		        나이:<%=rs.getInt("age") %><br>
		        성별:<%=rs.getString("gender") %><br>
		        이메일:<%=rs.getString("email") %>
	        <%
	    }
	    
	} catch(Exception e) {
	    
	} finally {
	    if(rs!=null) rs.close();
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
%>