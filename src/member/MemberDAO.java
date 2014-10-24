/*
 * MemberDAO.java 2014. 10. 24.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * Class 내용 기술
 * 
 * @author : user
 * 
 */
public class MemberDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "";

    // 회원가입 insertMember()메서드 만들기
    public void insertMember(MemberBean memberbean) {

        try {
            Context initCtx = new InitialContext();
            DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/jspbeginner");

            conn = ds.getConnection();
            sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberbean.getId());
            pstmt.setString(2, memberbean.getPasswd());
            pstmt.setString(3, memberbean.getName());
            pstmt.setTimestamp(4, memberbean.getReg_date());
            pstmt.setInt(5, memberbean.getAge());
            pstmt.setString(6, memberbean.getGender());
            pstmt.setString(7, memberbean.getEmail());

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            if (pstmt != null)
                try {
                    pstmt.close();
                } catch (SQLException e) {

                    e.printStackTrace();
                }
            if (conn != null)
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

}
