<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/jyh/views/authkey.css" rel="stylesheet">
<%
//받을 세션을 설정해준다. 
request.setCharacterEncoding("UTF-8");
String key = (String) session.getAttribute("AuthenticationKey");
String email = request.getParameter("email");
//세션 유효시간 설정 
//2분으로 설정함 
session.setMaxInactiveInterval(60 * 2);
%>
<script type="text/javascript">
var time = 120;
var min = "";
var sec = "";

	//유효시간 설정
<%if (key == null || key == "") {}else{%>
var x = setInterval(function() {
	min = parseInt(time / 60);
	sec = time % 60;
	document.getElementById("demo").innerHTML = min + "분" + sec + "초";
	time--;
	// 타임아웃이 되면 
	if (time < 0) {
		clearInterval(x);
		document.getElementById("demo").innerHTML = "시간초과";
		alert("유효시간이 다되었습니다.");
		//새로고침해주기.
		location.reload();
	}
}, 1000);
<%
}
%>	
</script>
</head>
<body>
	<div class="insert_form">
		<b>인증번호받기</b>
		   <p id="email"></p>
		<button type="button" name="checkBtn" onclick="emailCheck();">메일전송</button>
	</div>
	<div class="insert_form">
	<%=key %>
		<b>인증번호입력</b><span name="authkey"></span><br> <input
			type="text" name="auth" minlength="8"
			placeholder="인증번호를 입력하세요." />
		<button type="button" name="checkBtn" onclick="eventclick();">인증하기</button>
	</div>
	<div class="insert_form">
		<b>유효시간</b>
		<div id="demo"></div>
	</div>
</body>
<script type = "text/javascript">
//부모창 이메일 가져오기 
var emails = document.getElementById("email").innerHTML = opener.email.value;

function emailCheck(){
	if(emails==null ||emails==""){
		alert('이메일을 작성해주세요.');
		window.close();
	}else{
		alert("메일 전송 완료");
		emailform(emails);
	}
}
//이메일 서블릿 실행하기위해 값 보내기 
function emailform(email){
	var frm1 = document.createElement('form');
	frm1.setAttribute('method', 'get');
	frm1.setAttribute('action', '/emailAuthController');
	var hiddenInput4 = document.createElement('input');
	hiddenInput4.setAttribute('type','hidden');
	hiddenInput4.setAttribute('name','email');
	hiddenInput4.setAttribute('value',emails);
	frm1.appendChild(hiddenInput4);
	document.body.appendChild(frm1);
	frm1.submit();
}
// 인증 유효성검사 인증되면 닫음.
var auth = document.querySelector("[name = auth]");
var keys = "<%=key%>";
function eventclick(){	
	if(auth.value==keys){
		<%session.removeAttribute("AuthenticationKey");%>
		opener.openCheck = true;
		window.close();
		alert("인증되었습니다.");		
	}else{
		alert("인증실패/n다시한번 시도해보세요.");	
	}
}


</script>
</html>