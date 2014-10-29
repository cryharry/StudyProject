<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, org.json.simple.JSONObject" %>
<%
	// 한글처리
	request.setCharacterEncoding("utf8");
	// 파라미터값 가져오기
	String id = "";
	String email = "";
	if(request.getParameter("id") != null) id = request.getParameter("id");
	if(request.getParameter("email") != null) email = request.getParameter("email");
	
	// 디비용 변수
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	boolean idValue = false, emailValue = false;
	
	try {
	    // JNDI
	    Context initCtx = new InitialContext();
	    DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/jspbeginner");
	    // 디비연결
	    conn = ds.getConnection();
	    // pstmt 사용 sql 쿼리 전송
	    sql = "SELECT id,email FROM MEMBER";
	    pstmt = conn.prepareStatement(sql);
	    // rs 사용 결과값 저장
	    rs = pstmt.executeQuery();
	    while(rs.next()) {
			// 해당 디비에 입력한 id값이 존재할 때
		    if(id != "" && id.equals(rs.getString("id"))) {
		        idValue = true;
		        break;
		    }
            if(email != "" && email.equals(rs.getString("email"))) {
                emailValue = true;
                break;
            }
	    }
	    JSONObject json = new JSONObject();
	    if(idValue != true) {
	        json.put("id", "<font color='green'>사용가능한 아이디입니다.</font>");
	        if(emailValue != true) {
	        	json.put("email", "<font color='green'>사용가능한 이메일입니다.</font>");
	        } else {
	            json.put("email", "<font color='red'>사용불가능한 이메일입니다.</font>");
	        }
	    } else {
	        json.put("id", "<font color='red'>사용불가능한 아이디입니다.</font>");
	    }
	    out.println(json);
	    out.flush();
	} catch(Exception e) {
	    out.println(e.toString());
	} finally {
	    // 연결 끊기
	    if(rs!=null) rs.close();
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
	
%>