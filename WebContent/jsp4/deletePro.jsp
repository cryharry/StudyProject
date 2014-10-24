<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf8");
	//세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp 이동
	 if(id == null) {
	    response.sendRedirect("loginForm.jsp");
	}
	// 파라미터 가져오기
	String passwd = request.getParameter("passwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    
	    conn = ds.getConnection();
	    sql  = "SELECT passwd FROM MEMBER WHERE id = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	        if(passwd.equals(rs.getString("passwd"))) {
	            sql = "DELETE FROM MEMBER WHERE id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, id);
	            
	            pstmt.executeUpdate();
	            session.invalidate();
	            %>
	            <script>
	            	alert("삭제성공");
	            	location.href="loginForm.jsp";
	            </script>
	            <%
	        } else {
	            // "비밀번호 틀림" 뒤로이동
	            %>
	            <script>
	            	alert("비밀번호틀림");
	            	history.back();
	            </script>
	            <%
	        }
	    }
	} catch(Exception e) {
	    e.printStackTrace();
	} finally {
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
%>