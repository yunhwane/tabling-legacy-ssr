<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/jyh/views/authkey.css">
<style type="text/css">

/* ㅇㅇ */
.content {
	width: 100%;
	height: 500px;
	background-color: #fff;
}
</style>
</head>
<%
// 받을 세션을 설정해준다. 
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

<body>
	<div class="wrapper">
		<header>
			<h1 class="logo">
				<a href = "/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a>
			</h1>
			<nav class="gnb">
				<ul>
				</ul>
			</nav>
		</header>
		<section>
			<div class="content">
				<%=key%>

				<div class="cont_header">
					<h2 id="s01">이메일인증</h2>
				</div>
				<div class="content_form">
					<div id="e_form">
						<div class="insert_form">
							<b>이메일</b><span name="emailCheck"></span><br> <input
								type="text" name="email" maxlength="50"
								placeholder="이메일 형식에 맞게 작성해주세요." />
							<button type="button" name="checkBtn" onclick="checkingEmail();">인증받기</button>
						</div>
						<div class="insert_form">
							<b>인증번호</b><span name="authkey"></span><br> <input
								type="password" name="authkeys" minlength="8"
								placeholder="(최소8자)1개 이상 숫자,문자포함 특수문자 1개 포함" />
							<button type="button" name="checkBtn" onclick="eventclick();">인증확인</button>
						</div>
						<div class="insert_form">
							<b>유효시간</b>
							<div id="demo"></div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<nav class="footer_nav">
				<ul>
					<li><a href="#">서비스 이용약관</a></li>
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">제휴 문의</a></li>
					<li><a href="#">채용 공고</a></li>
				</ul>
			</nav>
			<p class="jjim_info">
				(주) 찜꽁<br> 대표 : 이지원<br> 주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
				사업자등록번호 : 202212142126<br> 개인정보담당 : service@jjimggong.co.kr
			</p>

		</footer>
	</div>

</body>
<script type="text/javascript">
var keys = "<%=key%>";
var emails ="<%=email%>";
function eventclick(){	
	if(auth.value==keys){
		<%session.removeAttribute("AuthenticationKey");%>
		alert("인증되었습니다.");		
		emailform2(emails);
	}else{
		alert("인증실패");
	}
}
//계정이 있는지 없는지 확인
var auth = document.querySelector("[name=authkeys]");
var email = document.querySelector("[name=email]");
function checkingEmail(){
	if(!email.value==''||!email.value==null){
	var xhr = new XMLHttpRequest();
	xhr.open("get","/checkIDservice?email="+email.value,true);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			 var ck = xhr.responseText;
			 if(ck == "no_auth"){
				alert("계정이 없습니다.");
			}else if(ck == "kakao_auth" || ck =="naver_auth"){
				alert("sns 연동 계정이 있습니다.");
			    location.href = "/jyh/views/login.jsp";
			}else{
				alert("이메일전송완료")
				emailform(email.value);
			}
		}
	 }
	}else{
		alert('이메일을 작성해주세요.');
	}
}
//인증번호가 유효한지 확인 
//이메일을 같이 넘겨줘야함. 
function emailform(email){
		var frm1 = document.createElement('form');
		frm1.setAttribute('method', 'get');
		frm1.setAttribute('action', '/sendMail');
		var hiddenInput4 = document.createElement('input');
		hiddenInput4.setAttribute('type','hidden');
		hiddenInput4.setAttribute('name','email');
		hiddenInput4.setAttribute('value',email);
		frm1.appendChild(hiddenInput4);
		document.body.appendChild(frm1);
		frm1.submit();
	}
function emailform2(email){
	var frm2 = document.createElement('form');
	frm2.setAttribute('method', 'get');
	frm2.setAttribute('action', '/jyh/views/updatePass.jsp');
	var hiddenInput5 = document.createElement('input');
	hiddenInput5.setAttribute('type','hidden');
	hiddenInput5.setAttribute('name','email');
	hiddenInput5.setAttribute('value',email);
	frm2.appendChild(hiddenInput5);
	document.body.appendChild(frm2);
	frm2.submit();
}
</script>
</html>