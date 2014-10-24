<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    
	    conn = ds.getConnection();
	    String sql = "select passwd from member where id=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	        if(passwd.equals(rs.getString("passwd"))) {
	            session.setAttribute("id", id);
	            //out.println("<script>alert('로그인 성공!')</script>");
	            //out.println("로그인 인증");
	            response.sendRedirect("main.jsp");
		    } else {
		        //out.println("비밀번호틀림");
		        %>
		        <script>
		        	alert("비밀번호틀림");
		        	location.href="loginForm.jsp";
		        </script>
		        <%
		    }
	    } else {
	        //out.println("<script>alert('아이디가 틀려요!');location.href='loginForm.jsp';</script>");
	        %>
	        <script>
	        	alert("아이디가 틀려요!");
	        	location.href="loginForm.jsp";
	        </script>
	        <%
	    }
	        
	    out.flush();
	} catch(Exception e) {
	    out.println(e.toString());
	    out.flush();
	} finally {
	    if(rs!= null) try{rs.close();}catch(Exception e){}
	    if(pstmt!= null) try{pstmt.close();}catch(Exception e){}
	    if(conn!= null) try{conn.close();}catch(Exception e){}
	}
%>