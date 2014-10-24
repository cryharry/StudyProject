<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
// 브라우저별로 판별하여 새로운 xml 개체 생성
function createXMLHttpRequest(){
	  // See http://en.wikipedia.org/wiki/XMLHttpRequest
	  // Provide the XMLHttpRequest class for IE 5.x-6.x:
	  if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
	    try { return new ActiveXObject("Msxml2.XMLHTTP.6.0") } catch(e) {}
	    try { return new ActiveXObject("Msxml2.XMLHTTP.3.0") } catch(e) {}
	    try { return new ActiveXObject("Msxml2.XMLHTTP") } catch(e) {}
	    try { return new ActiveXObject("Microsoft.XMLHTTP") } catch(e) {}
	    throw new Error( "This browser does not support XMLHttpRequest." )
	  };
	  return new XMLHttpRequest();
}
// 생성된 xml 개체를 AJAX라는 변수에 저장
var AJAX = createXMLHttpRequest();

function handler(id) {
	if(AJAX.readyState == 4 && AJAX.status == 200) {
	    // AJAX success시 결과값 json이라는 변수에 저장
	    var json = AJAX.responseText;
	    // 가져온 결과값 #ajax span에 추가하기
	    $("#ajax").html(json);
	}else if (AJAX.readyState == 4 && AJAX.status != 200) {
		// AJAX status fail
	  	alert('Something went wrong...');
	}
}
// 아이디 입력시 아이디 입력값을 인자값으로 받아 동작하는 show()함수
function show(id){
	AJAX.onreadystatechange = handler;
	// 입력받은 아이디를 id 파라미터값으로 설정하여 idCheck.jsp 호출
	AJAX.open("POST", "idCheck.jsp?id="+id, "true");
	AJAX.send("");
}

function onlyNum(event, type) {
	if(type == "numbers") {
		if(event.keyCode < 47 || event.keyCode > 56) return false;
	}
}

function onlyNum_han(obj) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 38  || event.keyCode == 39 || event.keyCode == 40) return;
	obj.value = obj.value.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
}

function check_page() {
	var id = $('#id').val();
	// 아이디체크
	if(id=="") {
		alert("아이디를 입력하세요");
		id.focus();
		return false;
	}
	if(id.length<4 || id.length>10) { //4~7길이
		alert("아이디는 4~10자리입니다.정확히 입력하세요");
		id.value=""
		id.focus();
		return false;
	}
	/* // 이름체크
	if(document.fr.name.value=="") {
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return false;
	}
	// 비밀번호체크
	if(document.fr.passwd.value=="") {
		alert("비밀번호를 입력하세요");
		document.fr.passwd.focus();
		return false;
	}
	// 성별체크
	if(document.fr.gender[0].checked==false && document.fr.gender[1].checked==false) {
		alert("성별을 체크하세요");
		document.fr.gender(0).focus();
		return false;
	} */ 
}
</script>
</head>
<body>
<form action="insertPro.jsp" method="post" onsubmit="return check_page()" name="frm">
아이디:<input type="text" name="id" onkeyup="show(this.value);" id="id"><span id="ajax"></span><br>
비밀번호:<input type="password" name="passwd" id="passwd"><br>
이름:<input type="text" name="name" id="name"><br>
나이:<input type="text" name="age" id="age" onkeypress="return onlyNum(event, 'numbers');" onkeydown="return onlyNum_han(this);"><br>
성별:남<input type="radio" name="gender" id="gender" value="남">
     여<input type="radio" name="gender" id="gender" value="여"><br>
이메일주소:<input type="text" name="email" id="email"><br>
<input type="submit" value="회원가입">
</form>
</body>
</html>