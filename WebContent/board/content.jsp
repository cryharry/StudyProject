<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// int num String pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// 디비객체 생성
	BoardDAO boardDAO = new BoardDAO();
	// 조회수 1증가 메서드 호출
	boardDAO.updateReadCount(num);
	// BoardBean boardBean = getBoard(num) num에 해당하는 글 가져오기
	BoardBean boardBean = boardDAO.getBoard(num);
	// 엔터키(\r\n) <br>바꾸기
	String content = boardBean.getContent().replace("\r\n","<br>");
%>
<h1>글내용보기</h1>
<table border="1">
	<tr>
		<td>글번호</td>
		<td><%=boardBean.getNum() %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%=boardBean.getReadcount() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=boardBean.getName() %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=boardBean.getDate() %></td>
	</tr>
	<tr>
		<td>글제목</td>
		<td colspan="3"><%=boardBean.getSubject() %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=content %></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="글수정" onclick="location.href='update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
			<input type="button" value="글삭제" onclick="location.href='delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기" onclick="location.href='reWrite.jsp?num=<%=num%>&re_ref=<%=boardBean.getRe_ref()%>&re_lev=<%=boardBean.getRe_lev()%>&re_seq=<%=boardBean.getRe_seq()%>'">
			<input type="button" value="글목록" onclick="location.href='list.jsp'">
		</td>
	</tr>
</table>
</body>
</html>