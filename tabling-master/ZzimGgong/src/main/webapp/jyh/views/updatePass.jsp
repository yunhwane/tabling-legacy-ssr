<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/jyh/views/authkey.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
</style>
</head>
<%
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
%>
<body>

<div class="wrapper">
    <header>
        <h1 class="logo">
        <a href = "/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a>
        </h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
            <div class ="cont_header">
                <h2 id = "s01">비밀번호 변경하기</h2>
            </div>
            <div class = "content_form">
                   
                    <form action = "/passController" method = "post" onsubmit ="return subcheck();">
                     <div id = "e_form">
                    <div class="insert_form">
                    <!-- hidden으로 이메일 같이 보내기 -->
                        <input type = "hidden" name = "email" value = "<%=email %>"/>
                        <b>비밀번호</b><span name = "check"></span><br>
                        <input type = "text" name = "newPass" maxlength="50" placeholder="(최소8자)1개 이상 숫자,문자포함 특수문자 1개 포함"/>
                    
                    </div>
                    
                    <div class = "insert_form">
                        <b>비밀번호 재입력</b><span name = "reCheck"></span><br>
                        <input type = "password" name = "repw" minlength="8" placeholder="(최소8자)1개 이상 숫자,문자포함 특수문자 1개 포함"/>
                        <button type = "submit">변경하기</button> 
                    </div>
                     </div>
                    </form>
                    
              
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
            (주) 찜꽁<br>
            대표 : 이지원<br>
            주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
            사업자등록번호 : 202212142126<br>
            개인정보담당 : service@jjimggong.co.kr
        </p>

    </footer>
</div>
<script type = "text/javascript">
var msg = document.querySelector("[name = check]");
var pw = document.querySelector("[name = newPass]");
var pflag = false;
var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
//비밀번호 유효성 검사
pw.onkeyup = function(){
    if(!pwReg.test(pw.value)){
        msg.innerText = "최소8자, 1개 이상 숫자,문자 포함, 특수문자 1개 포함이여야합니다.";
        pflag = false;
    }else{
        msg.innerText = "";
        pflag = true;
    }
}
const repw = document.querySelector("[name=repw]");
const reCheck = document.querySelector("[name = reCheck]");
var reflag = false;
//비밀번호 재확인 유효성 검사 
repw.onkeyup = function(){
    if(pw == "" || pflag == false){
       alert("비밀번호 재설정부터 해주세요");
       pw.value = "";
       pw.focus();
    }else{
        if(pw.value == repw.value){
             reCheck.innerText = "";
             reflag = true;
        }else{
            reCheck.innerText = "일치하지 않습니다.";
            reflag = false;
        }
    }
}
function subcheck() {
	
	if (pw.value == "" || pflag == false) {
		alert("비밀번호를 다시 확인하세요.");
		pw.focus();
		return false;
	}
	if (repw.value == "" || reflag == false) {
		alert("비밀번호 재확인 입력을 확인하세요");
		repw.focus();
		return false;
	}
	return true;
}
</script>
</body>

</html>