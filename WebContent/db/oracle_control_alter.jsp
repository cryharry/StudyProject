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
$(document).ready(function(){
	show();
});
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
var AJAX = createXMLHttpRequest();

function handler() {
	if(AJAX.readyState == 4 && AJAX.status == 200) {
	    var json = eval('(' + AJAX.responseText +')');
	    //var json = AJAX.responseText.replace('\/');
	    //alert(json.ctl_name);
	    //for(var i=0; i<) {
	    	$('#ctl').append(json.ctl_name);
	    //} 
	}else if (AJAX.readyState == 4 && AJAX.status != 200) {
	  alert('Something went wrong...');
	}
}

function show(){
	AJAX.onreadystatechange = handler;
	AJAX.open("POST", "oracle_control_select.jsp");
	AJAX.send("");
};
</script>
</head>
<body>
<form name="frm">
	<textarea id="ctl"></textarea>
</form>
</body>
</html>