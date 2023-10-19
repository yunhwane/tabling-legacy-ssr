<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jyh.model.memberDTO"%>
    
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/jyh/views/myInfo.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }
    .myPage{
        width : 50%;
        height: 50px;
        border:1px solid black;
    }
    .e_form h1{
       margin-top:10px; 
    }
    
</style>
</head>
<body>
<%
memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
memberDTO mem = (memberDTO)request.getAttribute("memInfo");
String eAuth = "";
String iAuth = "";
String userEmail = mem.getEmail();
String userPw = mem.getPw() != null ? mem.getPw() : "";
int emailAuth = mem.getEmailAuth();
if(emailAuth==1){
	eAuth = "인증완료";
}else{
	eAuth = "인증안됨";
}
String nickName = mem.getNickName();
String pNum = mem.getPhoneNum() != null ? mem.getPhoneNum() : "";
String addr = mem.getAddress()  != null ? mem.getAddress() : "";
int noshow = mem.getNoshow();
int idAuth = mem.getIdAuth();
if(idAuth==2){
	iAuth = "네이버 연동";
}else if(idAuth==1){
	iAuth = "카카오 연동";
}else{
	iAuth = "찜꽁 계정";
}
%>
<div class="wrapper">
    <header>
        <a class="logo" href = "/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
            <div class ="cont_header">   
           <div class = "myPage1">
             <h4>내정보 관리</h4>
           </div>
           <div class = "myPage2" onclick = "view();" >
             <h4>리뷰 관리</h4>
           </div>
            </div>
            <div class = "content_form">
                    <div id = "e_form">
                    <h1>내정보 보기</h1>
                    <div id = "inform">
                    <div class="insert_form">
                        <b>이메일</b>
                        <p><%=userEmail%></p>         
                    </div>
                    <div class="insert_form">
                        <b>이메일 인증</b>
                        <p><%=eAuth %></p>         
                    </div>
                    <div class = "insert_form">
                      <b>비밀번호</b>
                        <p><%=userPw %></p> 
                    </div>
                    <div class = "insert_form">
                        <b>닉네임</b>
                        <p><%=nickName %></p> 
                    </div>
                     <div class = "insert_form">
                        <b>주소</b>
                        <p><%=addr %></p> 
                    </div>
                    <div class = "insert_form">
                        <b>계정 연동</b>
                        <p><%=iAuth %></p> 
                    </div>
                    <div class = "insert_form">
                        <b>전화번호</b>
                        <p><%=pNum %></p> 
                    </div>
                    <div class = "insert_form">
                        <b>노쇼 수</b>
                        <p><%=noshow %>번</p> 
                    </div>
                    </div>
                </div>
                <div id = "button_box">
                <button type="button" class="w-btn w-btn-indigo" onclick="updatefunction();">수정하기</button>
                    <button type="button" class="w-btn w-btn-indigo" onclick="goPass();">비밀번호변경</button>
                    <button type="button" class="w-btn w-btn-indigo" onclick="logOut();">로그아웃</button>
                    <button type="button" class="w-btn w-btn-indigo" onclick="deleteAccount();">회원탈퇴</button>
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
            (주) 찜꽁<br>
            대표 : 이지원<br>
            주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
            사업자등록번호 : 202212142126<br>
            개인정보담당 : service@jjimggong.co.kr
        </p>

    </footer>
</div>
<script type = "text/javascript">
var email = "<%=userEmail%>";
var nickName = "<%=nickName%>";
var pnum = "<%=pNum%>";


function updateform(email,nickname,pnum){
	var frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', '/jyh/views/myInfoUpdate.jsp');
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','email');
	hiddenInput.setAttribute('value',email);
	frm.appendChild(hiddenInput);
	var hiddenInput1 = document.createElement('input');
	hiddenInput1.setAttribute('type','hidden');
	hiddenInput1.setAttribute('name','nickName');
	hiddenInput1.setAttribute('value',nickName);
	frm.appendChild(hiddenInput1);
	var hiddenInput2 = document.createElement('input');
	hiddenInput2.setAttribute('type','hidden');
	hiddenInput2.setAttribute('name','pNum');
	hiddenInput2.setAttribute('value',pnum);
	frm.appendChild(hiddenInput2);
	document.body.appendChild(frm);
	frm.submit();
}
//수정하기 
function updatefunction(){
	alert("수정하기 페이지로 이동합니다.");
	updateform(email,nickName,pnum);
	
}
//로그아웃 function 
function logOut(){
	if(confirm("로그아웃 하시겠습니까 ?")==true){
		location.href = "/logOutService";
	}
}
//비밀번호 변경 
function goPass(){
	location.href = "/jyh/views/emailAuth.jsp";
}
//리뷰 페이지로 고고 
function view(){
	location.href = "/jyh/views/reviewList.jsp";
}

function deleteAccount(){
	if(confirm("탈퇴하면 모든 정보가 날아갑니다. 그래도 탈퇴하시겠습니까?")==true){
		location.href = "/deleteController";
	}
}

</script>
</body>
</html>