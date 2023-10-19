<%@page import="hds.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>예약 승인 및 거절</title>
<link rel="stylesheet" href="/index_markup/reset.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        background-color: #fff;
        padding: 20px 0 45px 20px;
    }

    .content h3{
        font-weight: 600;
        font-size: 24px;
        line-height: 18px;
        color: #601986;
        line-height: 30px;
        padding-bottom: 20px;

    }

    .content p{
        color: #601986;
        font-weight: 400;
        font-size: 16px;
        line-height: 50px;
    }

    .info_wrap{
        line-height: 30px;
        color: #601986;
        padding: 10px 0;
    }

    .info_wrap img{
        padding-right: 14px;
    }

    /* 버튼 디자인 */

    .btn_wrapper{
        display: flex;
        justify-content: center;
        gap: 50px;
        padding-top: 45px;
    }

    .btn{
        background-color: #601986;
        width: 94px;
        height: 43px;
        text-align: center;
        border-radius: 10px;
        line-height: 43px;
        font-weight: 400;
        font-size: 16px;
        cursor: pointer;
        color: #fff;
    }

    .btn a{
        color: #fff;
        line-height: 43px;
        font-weight: 400;
        font-size: 16px;
    }
    
    .get_font{
		color: #222;
	    font-size: 22px;
	    font-weight: 600;
    }

</style>

<script>
/*
 
 */
</script>
</head>
<body>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>

<%

String user_email = request.getParameter("user_email");
String resnum = request.getParameter("resnum");
String reserve_start_time = request.getParameter("reserve_start_time");
String nickName = request.getParameter("nickName");
String phoneNum = request.getParameter("phoneNum");

reserve_start_time = reserve_start_time.replace("%", " ");

%>



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
            <h3>예약 승인 및 거절</h3>
            <p><b>* 예약 신청 정보</b></p>
<%
for(Reservation r : dao.showApproval(user_email, reserve_start_time, resnum)) {
%>
            <div class="info_wrap">
                <img src="/index_markup/img/myPageImg.png" alt="">
                방문인원 : <span class="get_font"><%=r.getReserve_apply_person()%>명</span>
            </div>
            <div class="info_wrap">
                <img src="/index_markup/img/date_icon.png" alt="">
                방문일시 : <span class="get_font"><%=r.getReserve_start_time()%></span>
            </div>
            <div class="info_wrap">
                요청사항 : <span class="get_font"><%=r.getReserve_request()%></span>
            </div>
           <p><b>* 고객 정보</b></p>
            <div class="info_wrap">
               고객 닉네임 : <span class="get_font"><%=nickName%></span><br>
               고객 연락처 : <span class="get_font"><%=phoneNum%></span>
            </div>
            
            <%if(r.getReserve_state()==1){
            	%>
            <div class="btn_wrapper">
                이미 승인된 예약건입니다.
            </div>
            <%}else if(r.getReserve_state()==0) {%>
            
            <div class="btn_wrapper">
                <div class="btn" id="addBtn">승인</div>
                <div class="btn" id="denyBtn">거절</div>
            </div>
            
            <%}else{ %>
            
           <div class="btn_wrapper">
                이미 거절한 예약건입니다.
            </div>
            
<%
            }
		}
%>
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
<%--
pg1003_DB.jsp?user_email=hds123@naver.com&resNum=2023-01-05 17:00&reserve_start_time=123-45-67890전송 완료!

 --%>
 <script type="text/javascript" src="/hjw/script/shop_loginJS.js"></script>
<script type="text/javascript">

	var addBtnOb = document.querySelector("#addBtn");
	var denyBtnOb = document.querySelector("#denyBtn");
	
	addBtnOb.onclick=function(){
		res_approval();
	}
	
	 function res_approval() {
		var qstr = "?user_email="+"<%=user_email%>"
				+"&resNum="+"<%=resnum%>"
				+"&reserve_start_time="+"<%=reserve_start_time%>";
			console.log(qstr);
			callAjax(qstr)
		}	
	 
	
	function callAjax(qstr) {
		var xhr = new XMLHttpRequest();
		xhr.open("get","pg1003_DB.jsp"+qstr, true);
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 & xhr.status==200){
				console.log("전송 완료!");
				var go_page = confirm("승인이 완료되었습니다. 예약 내역 확인 페이지로 가시겠습니까?");
				if(go_page){
					location.href="/hds/pg_1007.jsp?resnum=${param.resnum}"
				}
			}
		}
	}
	
	denyBtnOb.onclick=function(){
		res_deny();
	}
	
	 function res_deny() {
		var qstr = "?user_email="+"<%=user_email%>"
				+"&resNum="+"<%=resnum%>"
				+"&reserve_start_time="+"<%=reserve_start_time%>";
			console.log(qstr);
			callAjax02(qstr)
		}	
	 
	
	function callAjax02(qstr) {
		var xhr = new XMLHttpRequest();
		xhr.open("get","pg1003_2_DB.jsp"+qstr, true);
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 & xhr.status==200){
				console.log("전송 완료!");
				var go_page = confirm("예약 거절이 완료되었습니다. 예약 내역 확인 페이지로 가시겠습니까?");
				if(go_page){
					location.href="/hds/pg_1007.jsp?resnum=${param.resnum}"
				}
			}
		}
	}
	
	
	
	
	
</script>
</html>