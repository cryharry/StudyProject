/*
 * MemberDAO.java 2014. 10. 24.
 *
 * Copyright oracleclub.com All rights Reserved.
 */
package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    // DB연결용 변수
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "";
    
    // DB연결
    private Connection dbConn() throws Exception {
        Context initCtx = new InitialContext();
        DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/jspbeginner");
        conn = ds.getConnection();
        return conn;
    }

    // 회원가입 insertMember()메서드 만들기
    public void insertMember(MemberBean memberbean) {
        try {
            conn = dbConn();
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
            e.printStackTrace();
        } finally {
            if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
            if (conn != null)try {conn.close();} catch (Exception e) {}
        }
    }
    
    public int userCheck(String id, String passwd) {
        int check = -1;     
        try {
            conn = dbConn();
            sql = "SELECT passwd FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(passwd.equals(rs.getString("passwd"))) {
                   check = 1; 
                } else {
                   check = 0;
                }
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
            if (conn != null)try {conn.close();} catch (Exception e) {}
        }
        return check;
    }
    
    public MemberBean getMember(String id) {
        MemberBean memberBean = null;
        try {
            conn = dbConn();
            sql = "SELECT * FROM MEMBER WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                memberBean = new MemberBean();
                memberBean.setId(rs.getString("id"));
                memberBean.setAge(rs.getInt("age"));
                memberBean.setEmail(rs.getString("email"));
                memberBean.setGender(rs.getString("gender"));
                memberBean.setPasswd(rs.getString("passwd"));
                memberBean.setName(rs.getString("name"));
                memberBean.setReg_date(rs.getTimestamp("reg_date"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return memberBean;
    }
    public int updateMember(MemberBean memberBean) {
        int check = -1;
        try {
            conn = dbConn();
            sql = "SELECT passwd FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberBean.getId());
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                if(memberBean.getPasswd() != null && memberBean.getPasswd().equals(rs.getString("passwd"))) {
                    sql = "UPDATE MEMBER SET name = ?, age = ?, "
                            +"gender = ?, email = ? where id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, memberBean.getName());
                    pstmt.setInt(2, memberBean.getAge());
                    pstmt.setString(3, memberBean.getGender());
                    pstmt.setString(4, memberBean.getEmail());
                    pstmt.setString(5, memberBean.getId());
                    
                    pstmt.executeUpdate();
                    check = 1;
                } else {
                    check = 0;
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return check;
    }
    
    public int deleteMember(String id, String passwd) {
        int check = -1;
        try {
            conn = dbConn();
            sql = "SELECT passwd FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                if(passwd.equals(rs.getString("passwd"))) {
                    check = 1;
                    sql = "DELETE FROM MEMBER WHERE id=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, id);
                    
                    pstmt.executeUpdate();
                    
                } else {
                    check = 0;
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e) {}
            if(conn != null) try{conn.close();}catch (Exception e) {}
        }
        return check;
    }
    public List getMembers() {
        List memberlist = new ArrayList();
        try {
            conn = dbConn();
            sql = "SELECT * FROM MEMBER";
            pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                MemberBean memberBean = new MemberBean();
                memberBean.setId(rs.getString("id"));
                memberBean.setPasswd(rs.getString("passwd"));
                memberBean.setAge(rs.getInt("age"));
                memberBean.setEmail(rs.getString("email"));
                memberBean.setName(rs.getString("name"));
                memberBean.setGender(rs.getString("gender"));
                memberBean.setReg_date(rs.getTimestamp("reg_date"));
                memberlist.add(memberBean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(pstmt != null) try{pstmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
        }
        return memberlist;
    }
}
