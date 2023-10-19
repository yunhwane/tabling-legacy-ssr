<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="ymw.*"
    import="jyh.model.*"
    import="hds.*"
    import="hjw.*"
    import="ljw.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/index_markup/reset.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        padding: 0px 10px;
        background-color: #fff;
    }
    .sch{
    		padding-top:20px;
    		display:flex;
    	}
   	.schBtn>button{
  		width: 40px;
	    height: 40px;
	    border: 1px solid gray;
	    border-radius: 6px 0px 0px 6px;
	    cursor:pointer;
   	}
   	.schInp{
   		width: 100%;
	    height: 40px;
	    margin-left: -1px;
	    border: 1px gray solid;
	    border-radius: 0px 6px 6px 0px;
	    background: white;
   	}
   	.schInp>input{
   		padding: 0px 10px;
	    width: 93%;
	    height: 100%;
	    border: none;
   	}
   	h3{
   		padding : 15px 0px;
   	}
   	.recKeyword{
   		display:flex;
   		justify-content: flex-start;
   		gap: 10px;
   	}
   	.recKeyword>li{
   		border: 2px solid #601986;
   		background:white;
   		padding: 5px;
   		border-radius: 10px;
   		cursor:pointer;
   	}
   	.popSch>li{
   		padding: 0px 0px 7px 25px;
   		cursor:pointer;
   	}
   	.schInp>button{
   		background-color: black;
	    color: white;
	    padding: 3px;
	    border-radius: 9px;
	    text-align: center;
	    cursor:pointer;
   	}
   	input[type=text]:focus{
   		outline:none;
   	}
   	#sch2{
		display: none;
	}
	.recSch>ul{
		display: flex;
	    flex-wrap: nowrap;
	    flex-direction: column;
	    gap: 20px;
	    padding-left: 10px;
	    padding-top: 10px;
	}
	.recSch>ul li{
		cursor:pointer;
	}

</style>

<script type="text/javascript">

</script>
</head>
<body>

<div class="wrapper">
	<%
		memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
	%>
	<c:if test="${empty sesID }">
       <header class="head1">
           <h1 class="logo"><a href="/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a></h1>
            <nav class="gnb">
               <ul>
                   <li><a href="/jyh/views/login.jsp">로그인</a></li>
                   <li><a href="/jyh/views/insertMember.jsp">회원가입</a></li>
               </ul>
            </nav>
       </header>
    </c:if>
    <c:if test="${not empty sesID }">
       <header class="head2">
        <h1 class="logo"><a href="/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a></h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    </c:if>
    <section>
        <div class="content">
        	<div id="sch1">
        		<div class="sch">
	        		<div class="schBtn">
	        			<button type="button" onclick="schBtn()">검색</button>
	        		</div>
	        		<div class="schInp">
	        			<input name="schContent1" type="text" placeholder="매장을 검색해보세요." onfocus="schFocus()">
	        		</div>
	        	</div>
	        	<h3>추천 키워드</h3>
	        	<div>
	        		<div>
	        			<ul class="recKeyword">
	        			</ul>
	        		</div>
	        	</div>
	        	<h3>인기 검색어</h3>
	        		<div>
	        			<ul class="popSch">
		        			<jsp:useBean id="schDao" class="ymw.dao.Sch"/>
		        			<c:forEach var="pop" items="${schDao.pop()}">
		        				<li>${pop.sch }</li>
		        			</c:forEach>
	        			</ul>
	        		</div>
        	</div>
        	<div id=sch2>
        		<div class="sch">
	        		<div class="schBtn">
	        			<button type="button" onclick="backBtn()">이전</button>
	        		</div>
	        		<div class="schInp">
	        			<input name="schContent2" type="text" placeholder="매장을 검색해보세요.">
	        			<button id="delBtn" type="button" onclick="delBtn()">X</button>
	        		</div>
	        	</div>
	        	<h3>최근 검색어</h3>
	        	<c:if test="${empty sesID }">
			       <div>로그인을 했을 경우에만 보입니다.</div>
			    </c:if>
			    <c:if test="${not empty sesID }">
			       <div class="recSch">
			       		<ul>
			       			<c:forEach var="recSch" begin="0" end="4" 
			       				items="${schDao.recSch(sesID.email) }">
			       				<li><span>${recSch }</span></li>
			       			</c:forEach>
			       		</ul>
			       </div>
			    </c:if>
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
	var recSchs = document.querySelectorAll(".recSch>ul>li")
	recSchs.forEach(function(recSch){
		recSch.onclick = function(){
			location.href="/ymw/pg0011.jsp?sch="+recSch.innerText+"&appKind=전체&arrKind=별점높은순"
		}
	})
	var schInpOb1 = document.querySelector("[name=schContent1]")
	var schInpOb2 = document.querySelector("[name=schContent2]")
	var backBtnOb = document.querySelector("#backBtn")
	var sch1 = document.querySelector("#sch1")
	var sch2 = document.querySelector("#sch2")
	
	var popSchs = document.querySelectorAll(".popSch>li")
	var recKeyword = document.querySelector(".recKeyword")
	
	var rKey = ["한식", "브런치", "아시아식", "해산물", "뷔페", "일식", "구이", "주점", "양식", "중식"]
	var ranNums = [];
	for (i = 1; i <= 5; i += 1) {
	  var ranNum = Math.floor(Math.random() * rKey.length);
	  if (ranNums.indexOf(ranNum) === -1) {
		  ranNums.push(ranNum);
	  } else {
	    i--
	  }
	}
	ranNums.forEach(function(num){
		recKeyword.innerHTML += "<li>"+rKey[num]+"</li>"
	})
	var recKeywords = document.querySelectorAll(".recKeyword>li")
	
	
	recKeywords.forEach(function(keyword){
		keyword.onclick = function(){
			location.href="/ymw/pg0011.jsp?sch="+keyword.innerText+"&appKind=전체&arrKind=별점높은순"
		}
	})
	popSchs.forEach(function(pop){
		pop.onclick = function(){
			location.href="/ymw/pg0011.jsp?sch="+pop.innerText+"&appKind=전체&arrKind=별점높은순"
		}
	})
	function schFocus(){
		schInpOb1.focus()
		sch1.style.display = "none";
		sch2.style.display = "block";
		schInpOb2.focus()
		
	}
	function schBtn(){
		schFocus()
	}
	function backBtn(){
		schInpOb2.value = "";
		sch1.style.display = "block";
		sch2.style.display = "none";
	}
	function delBtn(){
		schInpOb2.value = ""
		schInpOb2.focus()
	}
	schInpOb2.onkeyup = function(){
		if(event.keyCode==13){
			if(schInpOb2.value==""){
				alert("검색어를 입력해주세요.")
				schInpOb2.focus()
			}
			else{
				location.href="./pg0011.jsp?sch="+schInpOb2.value+"&appKind=전체&arrKind=별점높은순"
			}
		}
	}
</script>
</html>