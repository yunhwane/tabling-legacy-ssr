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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        min-height: 500px;
        background-color: #fff;
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
    <style>
    	.content{
        width: 100%;
        min-height: 500px;
        padding: 0px 10px;
        background-color: #fff;
	    }
	    .sch{
	    		padding-top:10px;
	    		display:flex;
	    	}
	   	.schBtn>button{
	  		width: 40px;
		    height: 40px;
		    border: 1px solid gray;
		    border-radius: 9px;
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
	   	h3,h5{
	   		padding-top: 10px;
	   	}
	   	.recKeyword{
	   		display:flex;
	   		justify-content: flex-start;
	   		gap: 10px;
	   	}
	   	.recKeyword>li{
	   		border:1px solid gray;
	   		background:white;
	   		padding: 5px;
	   		border-radius: 10px;
	   	}
	   	.popSch>li{
	   		padding: 0px 0px 7px 25px;
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
	   	.appKind{
	   		padding-top: 20px;
	   	}
		.appKind>ul{
			padding-top:10px;
			display:flex;
			gap: 10px;
		}
		.arrKind>ul{
			padding-top: 10px;
			display: flex;
			gap: 10px;
			align-items: flex-start;
			flex-direction: column;
			flex-wrap: wrap;
			align-content: flex-end;
			padding-right: 20px;
		}
		.appKind>ul>li{
			border: 2px solid #601986;
			padding:3px;
			border-radius: 9px;
			font-weight: 600;
			cursor:pointer;
		}
		.arrKind{
			display: flex;
	    	align-items: flex-end;
		}
		.arrKind>select{
			width: 100px;
		    font-size: 15px;
		    font-weight: 900;
		    border: 2px solid #601986;
		    border-radius: 9px;
		    height: 30px;
		}
		.storeInfo{
			display: flex;
			padding-top: 20px;
			flex-wrap: wrap;
			justify-content: space-between;
		}
		.storeInfoDiv{
			width:200px;
			padding-bottom:20px;
		}
		.storeInfo img{
			width:200px;
			height:150px;
		}
		header{
			position: sticky;
			top: 0;
		}
	
		.sch_wrapper{
			position: sticky;
		    top: 46px;
		    background: white;
		}
		.arr{
			display:flex;
			justify-content: space-between;
		}
		.asss{
			height:1000px;
		}
		.scrollMenu{
			display:flex;
			justify-content: space-around;
		}
		.scrollMenu>div{
		    border: 2px solid #601986;
		    border-radius: 9px;
		    padding: 10px;
		    cursor: pointer;
		}
		.menu{
			display: flex;
    		gap: 10px;
		}
		.menuImg img{
			width:150px;
			height:100px;
		}
		.menuInfo {
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    padding-top: 4px;
		}
		.menuInfo>span:nth-child(2){
			color:red;
		}
		.allMenu{
			padding-top: 10px;
			display: flex;
			flex-direction: column;
			gap: 20px;
		}
		.show{
			display:flex;
			justify-content: center;
			padding: 20px 0px;
		}
		.show>button{
		    padding: 6px;
		    border: 2px solid #601986;
		    border-radius: 9px;
		    background: white;
		    font-size: 14px;
		    font-weight: 900;
		    cursor: pointer;
		}
		.storeImg>img{
			width:100%;
			height:150px;
		}
		.reviews{
			display: flex;
			flex-direction: column;
		}
		.reviews>div{
			display: flex;
			flex-direction: column;
			padding-top: 30px;
			gap: 3px;
		}
		.reviews span{
			font-size: 14px;
			color: darkgray;
		}
		.storeInformation1{
			padding-top:20px;
		}
		.storeInformation2{
			display: flex;
			gap: 20px;
		}
		.storeInformation2>div{
			display: flex;
			flex-direction: column;
			gap: 10px;
		}
		.pickList{
			padding-top:20px;
		}
		.pickList>ul{
			display:flex;
			justify-content: space-evenly;
		}
		.pickList>ul>li{
			padding: 4px;
			border: 1px solid black;
			border-radius: 9px;
		}
		.resBar{
       		background: white;
		    position: sticky;
		    bottom: 0px;
		    padding: 30px 0px;
       	}
       	.resList{
       		display: flex;
   			justify-content: space-around;
       	}
       	.resList>div{
   		    font-size: 30px;
		    border: 1px solid #601986;
		    padding: 8px;
		    background: #601986;
		    border-radius: 8px;
		    color: white;
		    cursor: pointer;
       	}
       	.revAndCnt{
   			display: flex;
   		}
   		.revAndCnt img{
   			width:15px;
   			height:15px;
   		}
   		.scoAndCnt{
   			padding-left:10px;
   		}
   		.star{
			display:flex;
			gap:2px;
		}
		.star img{
			width:15px;
			height:15px;
			margin-top:1px;
		}
    </style>
    <section>
        <div class="content">
        	<div class="sch_wrapper">
	        	<div class="sch">
	        		<div class="schBtn">
	        			<button type="button" onclick="back()">이전</button>
	        		</div>
	        	</div>
        	</div>
        	<jsp:useBean id="schList" class="ymw.dao.StoreInfo" scope="session"/>
        	<c:set var="store" value="${schList.detailStore(param.resnum) }"/>
        	<c:set var="storeR" value="${schList.StoreReview(param.resnum) }"/>
        	<div class="storeImg">
        		<img src="${store.res_img }">
        	</div>
        	<h3>${store.res_name }</h3>
        	<h5>${store.res_address }</h5>
        	<h5 class="revAndCnt">
        	<c:set var="starCnt" value="0"/>
			<c:forEach var="i" begin="1" end="${storeR.sco }">
				<c:set var="starCnt" value="${i }"/>
				<span><img src="https://cdn-icons-png.flaticon.com/512/956/956100.png"></span>
			</c:forEach>
			<c:forEach var="i" begin="1" end="${5-starCnt }">
				<c:set var="starCnt" value="${i }"/>
				<span><img src="https://cdn-icons-png.flaticon.com/512/1828/1828970.png"></span>
			</c:forEach>
			<span class="scoAndCnt">${storeR.sco } (${storeR.cnt})</span>
			</h5>
        	<%--<h5><img width="12px" height="12px" src="https://cdn-icons-png.flaticon.com/512/956/956100.png"></h5>--%>
        	<br><hr><br>
        	<div class="scrollMenu">
        		<div class="allMenuSc">전체메뉴</div>
        		<div class="allMenuSc">리뷰</div>
        		<div class="allMenuSc">매장정보</div>
        	</div>
        	<br><hr><br>
        	
        	<div class="sc1">	<%-- 메뉴 div --%>
        		<h3>전체메뉴</h3>
        		<div class="allMenu">
        		<c:set var="menuArray" value="${fn:split(schList.StoreMenu(param.resnum).menuname,'/')}" />
        		<c:set var="priceArray" value="${fn:split(schList.StoreMenu(param.resnum).price,'/')}" />
        		<c:set var="imgArray" value="${fn:split(schList.StoreMenu(param.resnum).food_image,'@')}" />
        		<c:set var="doneLoop" value="false" />

        		<c:forEach var="g" begin="0" end="${fn:length(menuArray)-1}" varStatus="status">
        			<c:if test="${not doneLoop }">
        				<div class="menu">
		        			<div class="menuImg">
		        				<img src="${imgArray[g] }">
		        			</div>
		        			<div class="menuInfo">
		        				<span>${menuArray[g]}</span>
		        				<span>${priceArray[g] }원</span>
		        				<span></span>
		        			</div>
		        		</div>
	        			<c:if test="${g>=1 }">
					        <c:set var="doneLoop" value="true" />
					    </c:if>
					</c:if>
        		</c:forEach>
       			</div>
       			<div class="show">
       				<button>메뉴 전체보기</button>
       			</div>
       			<br><hr><br>
       		</div>
       		<div class=sc2>	<%-- 리뷰 div --%>
       			<h3>리뷰 <span>${storeR.cnt}</span></h3>
       			<div class="reviews">
       			<c:set var="reviews" value="${schList.userReview(param.resnum)}" />
        		<c:set var="doneLoop" value="false" />
				<c:if test="${fn:length(reviews)>0}">
        		<c:forEach var="g" begin="0" end="${fn:length(reviews)-1}" varStatus="status">
        			<c:if test="${not doneLoop }">
        				<div class="menu">
		        			<div>
		       					<div class="star">
		       						<c:if test="${fn:length(reviews)>0}">
		       						<c:set var="starCnt" value="0"/>
				        				<c:forEach var="i" begin="1" end="${reviews[g].star_sco}">
				        					<c:set var="starCnt" value="${i }"/>
				        					<span><img src="https://cdn-icons-png.flaticon.com/512/956/956100.png"></span>
				        				</c:forEach>
				        				<c:forEach var="i" begin="1" end="${5-starCnt }">
				        					<c:set var="starCnt" value="${i }"/>
				        					<span><img src="https://cdn-icons-png.flaticon.com/512/1828/1828970.png"></span>
				        				</c:forEach>
			       						 ${reviews[g].star_sco }
			       					</c:if>
		       					</div>
		       					<div>
		       						<span>${reviews[g].nickname }</span>
		       					</div>
		       					<div>
		       						${reviews[g].review_content }
		       					</div>
		       				</div>
		        		</div>
	        			<c:if test="${g>=2 }">
					        <c:set var="doneLoop" value="true" />
					    </c:if>
					</c:if>
        		</c:forEach>
        		</c:if>
        		
       			</div>
       			<div class="show">
       				<button>리뷰 더보기</button>
       			</div>
       		</div>
       		<div class=sc3>	<%-- 매장정보 div --%>
       			<h3>영업정보</h3>
       			<div class="storeInformation1">
       				<div class="storeInformation2">
       					<div>
       						<span>운영시간</span>
       						<span>휴식시간</span>
       						<span>휴무일</span>
       						<span>전화번호</span>
       						<span>보증금</span>
       					</div>
       					<div>
       						<span>${store.business_hours }</span>
       						<span>${store.day_off }</span>
       						<span>${store.break_time }</span>
       						<span>${store.res_phonenum }</span>
       						<span>${store.deposit }원</span>
       					</div>
       				</div>
       				<div class="show">
       				</div>
       			</div>
       			<h3>매장 Pick</h3>
       			<c:set var="moodArray" value="${fn:split(schList.StoreRespick(param.resnum).mood,'/')}" />
       			<c:set var="purposeArray" value="${fn:split(schList.StoreRespick(param.resnum).purpose,'/')}" />
       			<c:set var="food_typeArray" value="${fn:split(schList.StoreRespick(param.resnum).food_type,'/')}" />
       			<c:set var="table_typeArray" value="${fn:split(schList.StoreRespick(param.resnum).table_type,'/')}" />
       			
       			<div class="pickList">
       				<ul>
       				</ul>
       			</div>
       			<div class="show">
   					<button style="border:none">매장 Pick 더보기</button>
   				</div>
       			<h3>편의시설</h3>
       			<div class="pickList">
       				<ul>
       					<c:set var="convenientArray" value="${fn:split(store.convenient,'/')}" />
		        		<c:set var="doneLoop" value="false" />
		
		        		<c:forEach var="g" begin="0" end="${fn:length(convenientArray)-1}" varStatus="status">
		        			<c:if test="${not doneLoop }">
		        				<c:if test="${not convenientArray[g].equals(\"-\") }">
		        					<li>${ convenientArray[g]}</li>
		        				</c:if>
			        			<c:if test="${g>=1 }">
							        <c:set var="doneLoop" value="true" />
							    </c:if>
							</c:if>
		        		</c:forEach>
       				</ul>
       			</div>
       			<div class="show">
   					<button style="border:none">편의시설 더보기</button>
   				</div>
       		</div>
       	<c:set var="waiting" value="${schList.detailStore(param.resnum).waiting}" />
       	<c:set var="reservation" value="${schList.detailStore(param.resnum).reservation}" />
        <div class="resBar">
        	<div class="resList">
        		<div class="waiting">
        			원격 줄서기
        		</div>
        		<div class="reservation">
        			즉시 예약
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
            (주) 찜꽁<br>
            대표 : 이지원<br>
            주소 : 서울특별시 마포구 월드컵북로 21 2층 풍성빌딩<br>
            사업자등록번호 : 202212142126<br>
            개인정보담당 : service@jjimggong.co.kr
        </p>

    </footer>
</div>
	<jsp:useBean id="dao" class="ljw.WaitingDao"/>			
	<c:set var="countResnum" value="${dao.countWaiting(param.resnum)}"/>
</body>
<script type="text/javascript">
	var sesID = "${sesID}"
	
	var waiting = document.querySelector(".waiting")
	var reservation = document.querySelector(".reservation")
	if(${waiting}==0){
		waiting.style.background="lightgray";
		waiting.style.color = "gray";
		waiting.style.border = "none";
		waiting.style.cursor = "default";
	}
	if(${waiting}==1){
		waiting.onclick = function(){
			if(sesID != ""){
				var result = confirm("대기인원 ${countResnum}팀\n 예상대기시간\t ${5+countResnum*5}분\n 원격줄서기를 신청하시겠습니까?")
		     	if(result==true){
		    		location.href="/ljw/pg3004.jsp?resnum=${param.resnum}&countResnum=${countResnum}";
		      	}
			}else{
				var goLogin = confirm("로그인 후 이용 가능합니다.\n로그인 창으로 이동하시겠습니까?")
				if(goLogin){
					location.href="/jyh/views/login.jsp"
				}
			}
		}
	}
	if(${reservation}==0){
		reservation.style.background="lightgray";
		reservation.style.color = "gray";
		reservation.style.border = "none";
		reservation.style.cursor = "default";
	}
	if(${reservation}==1){
		reservation.onclick = function(){
			if(sesID != ""){
				location.href="/hds/pg_1001.jsp?resnum=${param.resnum}"
			}else{
				var goLogin = confirm("로그인 후 이용 가능합니다.\n로그인 창으로 이동하시겠습니까?")
				if(goLogin){
					location.href="/jyh/views/login.jsp"
				}
			}
			
		}
	}
	let pList = [];
	<c:forEach var="mood" items="${moodArray}" varStatus="status">
		if("${mood}"!="-"){
			pList.push("${mood}");
		}
	</c:forEach>
	<c:forEach var="purpose" items="${purposeArray}" varStatus="status">
		if("${purpose}"!="-"){
			pList.push("${purpose}");
		}
	</c:forEach>
	<c:forEach var="food_type" items="${food_typeArray}" varStatus="status">
		if("${table_type}"!="-"){
			pList.push("${food_type}");
		}
	</c:forEach>
	<c:forEach var="table_type" items="${table_typeArray}" varStatus="status">
		if("${table_type}"!="-"){
			pList.push("${table_type}");
		}
		
	</c:forEach>
	var pickList = document.querySelector(".pickList>ul")
	pList.forEach(function(pick,idx){
		if(idx<=2){
			pickList.innerHTML += "<li>"+pick+"</li>"
		}
	})
	var allMenuSc = document.querySelectorAll(".allMenuSc")
	var morePage = document.querySelectorAll(".show")
	morePage.forEach(function(page,idx){
		page.onclick = function(){
			if(idx==0){
				location.href="/ymw/pg0013.jsp?resnum=${param.resnum }"
			}
			else if(idx==1){
				location.href="/ymw/pg0014.jsp?resnum=${param.resnum }"
			}
			else if(idx==2){
				location.href="/ymw/pg0015.jsp?resnum=${param.resnum }"
			}
			else if(idx==3){
				location.href="/ymw/pg0016.jsp?resnum=${param.resnum }"
			}
			else if(idx==4){
				location.href="/ymw/pg0017.jsp?resnum=${param.resnum }"
			}
		}
	})
	function back(){
		history.back()
	}
	allMenuSc.forEach(function(sc,idx){
		sc.onclick = function(){
			var location1 = document.querySelector(".sc"+(idx+1)).offsetTop;
			window.scrollTo({top:location1-96, behavior:'smooth'});
		}
	})
	
</script>
</html>