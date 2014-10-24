<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf8");
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	// 세션값 없으면 loginForm.jsp
	if(id == null) response.sendRedirect("loginForm.jsp");
	// 파라미터값 가져오기 passwd, name, age, gender, email
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
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
	    // sql구문
	    sql = "select passwd from member where id = ?";
	    // sql 실행
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, id);
	    // 결과값 저장
	    rs = pstmt.executeQuery();
	    // 결과값 있으면  비밀번호 맞으면 update "수정성공" main.jsp 이동
	    //					 틀리면 "비밀번호틀림" 뒤로이동
	    if(rs.next()) {
	        if(passwd.equals(rs.getString("passwd"))) {
	            // id에 해당되는 name, age, gender, email 수정
	            sql = "update member set name = ?, age = ?, "
	                    +"gender = ?, email = ? where id = ?";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, name);
	            pstmt.setInt(2, age);
	            pstmt.setString(3, gender);
	            pstmt.setString(4, email);
	            pstmt.setString(5, id);
	            
	            pstmt.executeUpdate();
	            // "수정성공" main.jsp이동
	            %>
	            <script>
	            	alert("수정성공");
	            	location.href="main.jsp";
	            </script>
	            <%
	        } else {
	            // "비밀번호틀림" 뒤로이동
	            %>
	            <script>
	            	alert("비밀번호틀림");
	            	history.back();
	            </script>
	            <%
	        }
	    } 
	}catch(Exception e) {
	    e.printStackTrace();
	} finally {
	    if(rs!=null) rs.close();
	    if(pstmt!=null) pstmt.close();
	    if(conn!=null) conn.close();
	}
	
%>