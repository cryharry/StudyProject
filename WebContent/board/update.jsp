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
	request.setCharacterEncoding("utf8");
	// 파라미터 가져오기 num pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	// 디비객체 생성
	BoardDAO boardDAO = new BoardDAO();
	// BoardBean boardBean = getBoard(num) 메서드 호출
	BoardBean boardBean = boardDAO.getBoard(num);
%>
	<h1>글수정</h1>
	<h3>
		<a href="list.jsp">글목록</a>
	</h3>
	<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
	<input type="hidden" name="num" value="<%=num%>">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=boardBean.getName() %>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" value="<%=boardBean.getSubject() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" rows="13" cols="40"><%=boardBean.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="글수정"> <input
					type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>