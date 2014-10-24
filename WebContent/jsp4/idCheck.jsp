<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 파라미터값 가져오기
	String id = request.getParameter("id");
	// 디비용 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	try {
	    // JNDI
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    // 디비연결
	    conn = ds.getConnection();
	    // pstmt 사용 sql 쿼리 전송
	    sql = "SELECT id FROM MEMBER";
	    pstmt = conn.prepareStatement(sql);
	    // rs 사용 결과값 저장
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	        // 해당 디비에 입력한 id값이 존재할 때
	        if(id.equals(rs.getString("id"))) {
	            %><font color="red">사용할 수 없는 아이디입니다.</font>
	            <%
	        // 해당 디비에 입력한 id값이 존재하지 않을 때
	        } else {
	            %><font color="green">사용가능한 아이디입니다.</font>
	            <%
	        }
	    }
	} catch(Exception e) {
	    out.println(e.toString());
	} finally {
	    // 연결 끊기
	    if(rs!=null) rs.close();
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
	
%>