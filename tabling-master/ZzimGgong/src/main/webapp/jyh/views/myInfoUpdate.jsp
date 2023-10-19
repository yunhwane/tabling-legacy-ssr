<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jyh.model.memberDTO"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/jyh/views/myInfoUpdate.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String userEmail = request.getParameter("email");
String nickname = request.getParameter("nickName");
String userpnum = request.getParameter("pNum");

%>
<script>

</script>
<div class="wrapper">
    <header>
        <h1 class="/ljw/pg0000.jsp"><img src="/index.markup/img/main_logo.png" alt=""></h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index.markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
            <div class ="cont_header">
                <h2 id = "s01">회원정보수정</h2>
            </div>
            <div class = "content_form">
                <form action ="/myInfoUpdate" method = "post" onsubmit="return updateForm_check()">
                    <div id = "e_form">
                    <div class="insert_form">
                        <b>이메일</b><br>
                        <p><%=userEmail %></p> 
                        <input type = "hidden" name = "email" value = "<%=userEmail %>"/>      
                    </div>   
                    <div class = "insert_form">
                        <b>닉네임</b><span name = "nikCheck"></span><br>
                        <input type = "text" name = "nik" value = "<%=nickname %>"/>
                    </div>
                    <div class = "insert_form">
                        <b>연락처</b><span name = "pCheck" ></span><br>
                        <input type = "text" name = "pum" value = "<%=userpnum %>"/>
                    </div>
                    <div class = "s_form">
                        <b>주소입력</b><span name = "addrCheck"></span><br>
                        <input id="member_post"  type="text" placeholder="우편번호 선택" readonly onclick="findAddr()">
                        <input id="member_addr" type="text" name = "addr" placeholder="도로명주소 입력" readonly> <br>
                        <input type="text" name = "detailaddr" placeholder="상세주소 입력">
                    </div>
                    <div id = "sub_form">
                    <input type = "submit" id = "request01" value = "수정하기"/>
                    <input type = "button" id = "request01" value = "내정보 가기"/>
                    <input type = "button" id = "request01" value = "메인 가기"/>
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

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type = "text/javascript">

var nikReg = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/;
const nik = document.querySelector("[name = nik]");
const nikCheck = document.querySelector("[name = nikCheck]");
var nikflag = false;
nik.onkeyup = function(){
    if(!nikReg.test(nik.value)){
        nikCheck.innerText = "2자 이상 8자 이하 영어,숫자,한글로 구성해주세요."
        nikflag = false;
    }else{
        nikCheck.innerText = "";
        nikflag = true;
    }
}


var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
var pnum = document.querySelector("[name=pum]");
var pCheck = document.querySelector("[name=pCheck]");
var pflag = false;

pnum.onkeyup = function(){
	if(!regPhone.test(pnum.value)){
		pCheck.innerText = "전화번호 형식으로 입력해주세요.(-없어도가능)";
		pflag = false;
	}else{
		pCheck.innerText = "";
		pflag = true;
	}
}

const addr = document.querySelector("[name=addr]");
const detailaddr = document.querySelector("[name = detailaddr]");
const addrCheck = document.querySelector("[name = addrCheck]");
var addrflag = false;
// 주소 입력 유효성 검사 
detailaddr.onkeyup = function(){
	if(detailaddr.value == ""){
		addrCheck.innerText = "상세 주소 입력이 되지 않았습니다.";
		addrflag = false;
	}
	else{
		addrCheck.innerText = "";
		addrflag = true;
	}
}

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
function updateForm_check(){
    //아이디 최종 유효성
    if(nik.value == "" || nikflag == false){
        alert("닉네임 입력을 확인하세요");
        nik.focus();
        return false;
    }
    
    if(pnum.value=="" || pflag == false){
    	alert("핸드폰 입력을 확인하세요.");
    	pnum.focus();
    	return false;
    }
    
	if(addr.value == ""){
	alert("주소 입력이 되지 않았습니다.");
	return false;	
	}
	// 상세주소 
	if(addrflag == false){
		alert("주소입력을 해주세요.");
		return false;
	}
	return true;
}

</script>
</html>