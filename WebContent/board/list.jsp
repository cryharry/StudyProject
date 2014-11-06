<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//디비객체 생성 boardDAO
	BoardDAO boardDAO = new BoardDAO();
	//int count= getBoardCount()   //count(*)
	int count = boardDAO.getBoardCount();
	// 한 페이지 보여줄 글수
	int pageSize = 3;
	// 현 페이지 가져오기
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
	    pageNum = "1";
	}
	// 시작하는 행 구하기
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	// 끝나는 행 구하기
	int endRow = currentPage*pageSize;
	// 글이 있으면 디비 게시판 글 가져오기
	List<BoardBean> boardList = null;
	if(count != 0) {
	    boardList = boardDAO.getBoards(startRow, pageSize);
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	// 가상번호 계산
	int number = 0;
	number = count-(currentPage-1)*pageSize;
%>
	<h1>글목록(전체 글:<%=count%>)</h1>
	<h3><a href="writeForm.jsp">글쓰기</a></h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
			<td>IP</td>
		</tr>
	<%for(int i=0; i<boardList.size(); i++) {
	    // 형변환없이 가능(Generic)
	    BoardBean boardBean = boardList.get(i); %>
		<tr>
			<td><%=number-- %></td>
			<td>
			<%
				int wid = 0;
				if(boardBean.getRe_lev()>0) { //답변글
				    wid = 10*boardBean.getRe_lev();
				%>
					<img src="level.gif" width="<%=wid%>">
					<img src="re.gif">
				<%
				}
			%>
				<a href="content.jsp?num=<%=boardBean.getNum()%>&pageNum=<%=pageNum%>"><%=boardBean.getSubject()%></a>
			</td>
			<td><%=boardBean.getName() %></td>
			<td><%=sdf.format(boardBean.getDate()) %></td>
			<td><%=boardBean.getReadcount() %></td>
			<td><%=boardBean.getIp() %></td>
		</tr>
	<%} %>
	</table>
	<% if(count > 0) {
		   // 전체 페이지수 구하기 글55 한 페이지에 보여줄 글 수 10
		   int pageCount = count/pageSize+(count%pageSize==0?0:1); // 55/10 = 5+1(나머지있을경우)
		   // 한화면에 보여줄 페이지수 설정
		   int pageBlock = 3;
		   // 시작페이지 번호 구하기
		   int startPage = ((int)(currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1; 
		   // 끝페이지 번호 구하기
		   int endPage = startPage+pageBlock-1;
		   if(endPage > pageCount) {
		       endPage = pageCount;
		   }
		   // [이전]
		   if(startPage > pageBlock) {
		       %><a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a><%
		   }
		   // [1] ~ [10]
		   for(int i=startPage; i<=endPage; i++) {
		       %><a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a><%
		   }
		   // [다음]
		   if(endPage < pageCount) {
		       %><a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
		   }
		   %>
	<% } %>
</body>
</html>


