<%@page import="flex.messaging.io.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, org.json.simple.JSONObject" %>
<%
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/xe");
		
		Connection conn = ds.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select name from v$controlfile");
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			JSONObject json = new JSONObject();
			json.put("ctl_name", rs.getString("name"));
			out.println(json);
			out.flush();
		}
		
		if( rs!= null) try{rs.close();} catch(Exception e){}
		if(pstmt != null) try{pstmt.close();} catch(Exception e){}
		if(conn != null) try{conn.close();} catch(Exception e){}
		
	} catch(Exception e) {
		out.println(e.toString());
	}
%>