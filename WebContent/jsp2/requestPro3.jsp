<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String grade = request.getParameter("grade");
	String hobby[] = request.getParameterValues("hobby");
%>
<%=name %>님 회원이 되신 것을 축하드립니다.<br>
성별은 <%=gender %>, 학년은 <%=grade  %>, 취미는
{
<%
	if(hobby!=null){
		for(int i=0;i<hobby.length; i++) {
			out.println(hobby[i]+ ", ");
		}
	}
%>
}입니다.