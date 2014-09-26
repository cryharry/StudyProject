<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="requestPro3.jsp" method="post">
이름:<input type="text" name="name"><br>
성별:	<input type="radio" name="gender" value="남">남
	<input type="radio" name="gender" value="여">여<br>
학년:	<select name="grade">
		<option value="1">1학년</option>
		<option value="2">2학년</option>
		<option value="3">3학년</option>
		<option value="4">4학년</option>
	</select><br>
취미:<input type="checkbox" name="hobby" value="독서">독서
	<input type="checkbox" name="hobby" value="게임">게임
	<input type="checkbox" name="hobby" value="축구">축구
	<input type="checkbox" name="hobby" value="기타">기타<br>
<input type="submit" value="전송">
</form>
</body>
</html>