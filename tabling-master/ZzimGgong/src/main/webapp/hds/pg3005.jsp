<%@page import="hds.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jyh.model.*"
    import="hds.*"
    import="ymw.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />

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
        background-color: #fff;
    }
    
    /* 지원 */   
	nav.searchmenu{
		width: 100%;
		background-color: #fff;
		display: block
	}
	nav.searchmenu>.menu{
		display:flex;
	    justify-content:center;
	    gap:60px;
	    padding-top:20px;
	    padding-bottom:20px;
	    font-size:18px;
	    font-weight:800;
	    color:#4C4C47;
	}
	nav.searchmenu>.menu>li:hover{
		color:#601986;
	}
	#choice{
		color:#601986;
		font-weight:900;
	}
	div.crsmenu{
		display:flex;
		justify-content:center;
		padding: 0px 50px 10px;
	}
	div.crsmenu>div{
		width:30%;
		display:inline-flex;
	    font-size:20px;
	    font-weight:800;
	    color:#333;
	    background-color:#E1E5F2;
	    border-radius:5px;
	    height:40px;
	    margin:0 auto; 
	    justify-content:center;
	    line-height:40px; 
	}
	
	.crst{
   		margin: 0px 50px;
   		border: 2px solid #601986;
   		padding-bottom:20px;
   		border-radius: 40px;
   		height:380px;
   		width:80%;
   		position:absolute;
   		display:block;
   		/*
   		right:0px;
   		top:157px;
		*/
   }
	.crst>h1 {
		display:flex;
   		justify-content:center;
   		padding-top: 170px;
   		color:#601986;
	}
	
   .crst_rsv{
   		margin: 0px 50px;
   		border: 2px solid #601986;
   		padding-bottom:20px;
   		border-radius: 40px;
   		height:380px;
   		width:80%;
   		position:absolute;
   		display:none;
   		right:0px;
   		top:157px;
   }
   .crst_rmt{
   		margin: 0px 50px;
   		border: 2px solid #601986;
   		padding-bottom:20px;
   		border-radius: 40px;
   		height:380px;
   		width:80%;
   		position:absolute;
   		display:none;
   		right:0px;
   		top:157px;
   }
   .crst01{
   		display:flex;
   		justify-content:center;
   		color:#333;
   		flex-wrap:wrap;	
   }
   .crst01>#rstname{
  		display:block;
   		margin:0px auto;
   		padding:20px 0px 10px;
   		width:100%;
   		text-align:center;
   		font-size:30px;
   }
   .crst01>div{
		display:inline-flex;
		margin:0px auto;
		width:50%;
		justify-content:space-between;
		padding-bottom:25px;
   }
   .crst01>div>div{
      	display:inline-flex;
   		justify-content:center;
   	    background-color:#E1E5F2;
	    border-radius:18px;
	    width:90px;
	    height:33px;
	    font-size:18px;
	    line-height:33px;
   }
   .crst01>div>div>img{
		height:20px;
		width:20px;
		margin:auto 1px;
   }
   
   .crst02{
   		display:flex;
   		justify-content:center;
   		color:#333;
   		flex-wrap:wrap;	
   		padding:0px 0px 20px;
   }
   .crst02>h2{
   		display:block;
   		margin:0px auto 5px auto;
   		text-align:center;
   		font-size:23px;
   		width:100%;
   }
   .crst02>h1{
   		display:inline-flex;
   		text-align:center;
   		font-size:45px;
   		color:#da6e85;
   }
   .crst02>img{
   		display:inline-flex;
   		align-self: center;
		height:20px;
		width:20px;
   }
   
   .crst03{
   		display:flex;
   		justify-content:center;
   		color:#333;
   		flex-wrap:wrap;
   		padding-bottom: 20px;	
   }
   .crst03>h4{
 		display:block;
   		margin:0px auto;
   		padding-bottom:5px;
   		text-align:center;
   		width:100%;
   		font-size: 18px;
   }
    .crst03>h5{
 		display:block;
   		margin:2.5px auto;
   		text-align:center;
   		width:100%;
   }
   .crst04{
   		display:flex;
   		justify-content:center;
   		color:#333;
	    background-color:#E1E5F2;
	    border-radius:5px;
	    font-size:25px;
	    font-weight:900;
	    width:50%;
	    margin:0px auto;
	    line-height:40px; 
   }
   
   /*
   솜 css
   */

	.res_wrapper{
		border-bottom: 2px solid #601986;
	    width: 365px;
	    margin: auto;
	    padding: 10px;
	}
	
	.res_wrapeer:last-child{
		border-bottom: none;
	}
	
	.res_wrapper p{
		line-height: 28px;
	}

	.crst_rsv h2{
		font-size: 23px;
	    text-align: center;
	    line-height: 60px;
	}
	
	.res_state_text{
		color: #601986;
		font-size: 20px;
		padding-left: 15px;
		font-weight: 700;
	}

</style>

<script type="text/javascript">

</script>
</head>
<body>
<jsp:useBean id="dao" class="hds.reservation_Dao"/>
<div class="wrapper">
<%
	String resNum = "";
    memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
	String userEmail = loginUser.getEmail();
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
        
		    <nav class="searchmenu">
		    	<ul class="menu">
		    		<li onclick="location.href='/hds/res_index.jsp';">즉시예약</li>
		    		<li onclick="location.href='/ljw/pg3001_logout.jsp';">원격줄서기</li>
		    		<li id="choice" onclick="location.href='/ljw/pg3005.jsp';">주문현황</li>
		    	</ul>
		    	<div class="crsmenu">
					<div class="crstRsrv">즉시예약</div>
		    		<div class="crstRmln">원격줄서기</div>
		    	</div>
		    </nav>
			<div class="crst">
				<h1>사용하시는 서비스가 없습니다</h1>
		    </div>
		    <div class="crst_rsv">
				<!-- 즉시 예약 -->
				<h2>나의 즉시 예약 현황</h2>
<%
for(Reservation r : dao.showCurrentRes(userEmail, resNum)) {

	String state="";
	if(r.getReserve_state()==1){
		state="예약 확정";
	}else if(r.getReserve_state()==2){
		state="가게측 예약 거절";
	}else{
		state="가게 승인 대기 중";
	}
	
%>

			<div class="res_wrapper">
				<p>
					방문 식당 : <%=r.getRes_name() %><span class="res_state_text"><%=state%></span><br>
					식당 연락처 : <%=r.getRes_phoneNum() %><br>
					방문 일시 : <%=r.getReserve_start_time() %><br>
				</p>
			</div>
<%} %>
		    </div>
		    <div class="crst_rmt">
			    <div class="crst01">
			    	<h1 id="rstname">상호명</h1>
			    	<div>
			    		<div id="phonecall"><img src="/index_markup/img/phonecall_icon.png" alt="">전화</div>
			    		<div id="location"><img src="/index_markup/img/locationpin_icon.png" alt="">위치</div>
			    	</div>
			    </div>
			    <div class="crst02">
			    	<h2>현재 내 입장 순서는</h2>
			    	<h1>3번</h1>
			    	<img src="/index_markup/img/circlearrow_icon.png" alt=""/>
			    </div>
			    <div class="crst03">
			    	<h4>대기번호 3</h4>
			    	<h5>인원 3명</h5>
			    	<h5>접수일시 2222년 2월 2일 2시 2분 </h5>
			    </div>
			    <div class="crst04">대기 취소하기</div>
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
	
	var crstRsvButtonOb = document.querySelector(".crstRsrv")
	var crstRmtButtonOb = document.querySelector(".crstRmln")
	
	var crstBlankOb = document.querySelector(".crst")
	var crstRsvOb = document.querySelector(".crst_rsv")
	var crstRmtOb = document.querySelector(".crst_rmt")
	
	//실시간예약 버튼 클릭 시
	crstRsvButtonOb.addEventListener("click", function(){
		crstRsvButtonOb.style.color="#f6f6f6"
		crstRsvButtonOb.style.background="#601986"
		crstRsvOb.style.display="block"
		
		crstRmtButtonOb.style.color="#333"
		crstRmtButtonOb.style.background="#E1E5F2"
		crstRmtOb.style.display="none"
		crstBlankOb.style.display="none"
	})
	
	// onload : 문서나 객체가 로딩되었을 때
	// ondblclick : 더블클릭했을 때


	//원격줄서기 버튼
	crstRmtButtonOb.addEventListener("click", function(){
		crstRmtButtonOb.style.color="#f6f6f6"
		crstRmtButtonOb.style.background="#601986"
		crstRmtOb.style.display="block"
			
		crstRsvButtonOb.style.color="#333"
		crstRsvButtonOb.style.background="#E1E5F2"
		crstRsvOb.style.display="none"
		crstBlankOb.style.display="none"
		
	})
	
</script>
</html>