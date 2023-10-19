<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	import = "java.util.*"
   	
    import="ymw.*"
    import="jyh.model.*"
    import="hds.*"
    import="hjw.*"
    import="ljw.*"
    import="ljw.vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>찜꽁</title>
    <link rel="stylesheet" href="/index_markup/reset.css">
    <link rel="stylesheet" href="./style.css">
	<style type="text/css">
	
	 	/* ㅇㅇ */
		.content{
		    width: 100%;
		    background-color: #fff;
		}
		
		/* 지원 */
		.pgName{
			display:flex;
			padding: 40px 50px 10px;
			justify-content: center;
			color:#333;
		}
		.infoprint{
			display:flex;
			padding:0px 50px;
			justify-content: center;
		}
		.infoprint li{
			display:block;
			text-align:center;
		}
		.text01{
			font-size:28px;
			padding-top:40px;
			font-weight:500;
			color:#333;
			
		}
		.data01{
			font-weight: 800;
   			font-size: 40px;
    		padding-top: 15px;
    		color:#601986;
		}
		.data02{
			padding-top: 15px;
   			font-size: 20px;
  		  	font-weight: 500;
		}
		.buttons{
			display:flex;
			padding: 40px 50px 0px;
			justify-content:center;
	   		color:#333;
	   		flex-wrap:wrap;	
	   		gap:40px;
		}
		.buttons div{
			display:inline-flex;
	   		justify-content:center;
	   	    background-color:#E1E5F2;
		    border-radius:10px;
		    width:40%;
		    height:50px;
		    line-height:50px;
		    font-size:25px;
		    font-weight: 600;
		    
		    cursor:pointer;
				
		}
		.buttons div:hover{
			background-color:#601986;
			color:#fff;
		}
		
		
	</style>
	
    <script type="text/javascript" src="./script/power.js"></script>
    <script type="text/javascript" src="./script/shop_loginJS.js"></script>
    
</head>

<body>


	<%-- 가게/신청정보 출력  --%>
	<jsp:useBean id="dao" class="hjw.WaitingStoreDao"/>
	<c:set var="store" value="${dao.firstWaiter(res.resnum)}"/>


    <div class="wrapper">
        <header>
			<h1 class="logo"><a href="/hjw/zzim_shop.jsp?resnum=${param.resnum}"><img src="/index_markup/img/main_logo.png" alt=""></a></h1>
			<nav class="gnb">
				<ul>
					<li><a href="#"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
					<li><button onclick="logout()">종료</button></li>
				</ul>
			</nav>
        </header>
        <section>
        <div class="content">
	        <div class="pgName">
	        	<h1>원격줄서기 페이지</h1>
	        </div>
        	<div class="infoprint">
        		<ul>
        			<li class="text01">입장대기자의 대기번호</li>
        			<li class="data01">${store.waitingNum}</li>
        			
        			<li class="text01">고객정보</li>
        			<li class="data02">${store.nickname}&nbsp;님</li>
        			<li class="data02">${store.waitingPerson }&nbsp;명 입장 예정</li>
        			<li class="data02">신청시간&nbsp;${store.wstarttime }</li>
        		</ul>	
        	</div>
       	
        	<div class="buttons">
        		<div id="enter">입장하기</div>
        		<div id="noenter">입장취소</div>
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
<script type="text/javascript">
	var enterButton = document.querySelector("#enter")
	var noenterButton = document.querySelector("#noenter")
	
	//현재날짜
	var today = new Date();
	var wdate = today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate()
	
	
	enterButton.onclick=function(){
		var xhr = new XMLHttpRequest()
		xhr.open("get", "zzim_shop_wating_enterO.jsp?userEmail=${store.userEmail}&wstarttimeS="+wdate, true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				alert("${store.nickname} 님이 입장합니다")
				location.href = location.href;//새로고침
			}
		}
	}
	
	noenterButton.onclick=function(){
		var xhr = new XMLHttpRequest()
		xhr.open("get", "zzim_shop_wating_enterX.jsp?userEmail=${store.userEmail}&wstarttimeS="+wdate, true)
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4&&xhr.status==200){
				alert("${store.nickname} 님이 입장취소되었습니다")
				location.href = location.href;//새로고침
			}
		}
	}
</script>

</html>