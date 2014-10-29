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

function handler() {
	if(AJAX.readyState == 4 && AJAX.status == 200) {
	    // AJAX success시 결과값 result라는 변수에 저장
	    result = JSON.parse(AJAX.responseText);
	 	// 가져온 결과값을 변수로 inHtml(); 메서드 호출
	    inHtml(result);
	}else if (AJAX.readyState == 4 && AJAX.status != 200) {
		// AJAX status fail
	  	alert('Something went wrong...');
	}
}
function inHtml(json) {
	$("#ajax").html(json.id);
	if($("#email").val() != "")$("#ajax_email").html(json.email);
}
// 아이디 입력시 아이디 입력값을 인자값으로 받아 동작하는 show()함수
function Check(id, email){
	var url = "";
	AJAX.onreadystatechange = handler;
	// 입력받은 아이디를 id 파라미터값으로 설정하여 idCheck.jsp 호출
	if(id != null && id != "") {
		url = "Check.jsp?id="+id;
	}
	if(email != null && email != "") {
		url = "Check.jsp?email="+email;
	}
	AJAX.open("POST", url, "true");
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
// 이메일체크
function email_check(email) {
	 var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 if(re.test(email)) {
		 Check(null, email);
		 return true;
	 } else {
		 $("#ajax_email").html("<font color='red'>이메일형식이 틀립니다.</font>");
		 $("#email").focus();
		 return false;
	 }
}
function check_page() {
	// 체크할 값들 변수로 지정
	var id = $("#id").val();
	// id가 ""일 때
	if(id == "") {
		alert("아이디를 입력하세요");
		$("#id").focus();
		return false;
	}
	var name = $("#name").val();
	var passwd = $("#passwd").val();
	var age = $("#age").val();
	var email = $("#email").val();
	// 공백, 태그 제거 후 변수에 대입
	var result_id_replace = result.id.replace(/<.*?>^\s*|\s*$|<.*?>/g, '');
	var result_email_replace = result.email.replace(/<.*?>^\s*|\s*$|<.*?>/g, '');
	// 아이디체크
	if(result_id_replace == '사용불가능한 아이디입니다.') {
		alert("아이디를 확인하세요");
		$('#id').focus();
		return false;
	}
	if(result_email_replace == '사용불가능한 이메일입니다.') {
		alert("이메일을 확인하세요");
		$('#id').focus();
		return false;
	}
	// 비밀번호체크
	if(passwd=="") {
		$("#ajax_passwd").html("<font color='red'>비밀번호를 입력해주세요</font>");
		$("#passwd").focus();
		return false;
	}
	// 이름체크
	if(name=="") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;
	}
	// 나이체크
	if(age=="") {
		alert("나이를 입력하세요");
		$("#age").focus();
		return false;
	}
	// 성별체크
	if(document.frm.gender[0].checked==false && document.frm.gender[1].checked==false) {
		alert("성별을 체크하세요");
		$("#gender").focus();
		return false;
	}
	// 이메일체크
	if(email == "") {
		email_check(email);
		return false;
	}
}
</script>
</head>
<body>
<form action="insertPro.jsp" method="post" onsubmit="return check_page()" name="frm">
아이디:<input type="text" name="id" onkeyup="Check(this.value, null);" id="id"><span id="ajax"></span><br>
비밀번호:<input type="password" name="passwd" id="passwd"><span id="ajax_passwd"></span><br>
이름:<input type="text" name="name" id="name"><br>
나이:<input type="text" name="age" id="age" onkeypress="return onlyNum(event, 'numbers');" onkeydown="return onlyNum_han(this);"><br>
이메일주소:<input type="text" name="email" id="email" onkeyup="return email_check(this.value);"><span id="ajax_email"></span><br>
성별:남<input type="radio" name="gender" id="gender" value="남">
     여<input type="radio" name="gender" id="gender" value="여"><br>
<input type="submit" value="회원가입">
</form>
</body>
</html>