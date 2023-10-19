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
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즉시 예약 신청</title>
<link rel="stylesheet" href="/index_markup/reset.css">
<style type="text/css">

    section{
        padding-bottom: 50px;
        background-color: #fff;
    }
    /* 예약 정보 input css */
    .res_info{
        width: 100%;
        background-color: #fff;
        font-weight: 500;
        font-size: 20px;
        line-height: 18px;
        color: #601986;
        padding-top: 30px;
    }

    .res_info p{
        padding: 24px 20px;
    }

    .res_info span{
        font-size: 14px;
        line-height: 20px;
    }

    [type="number"]{
        border: 1px solid #601986;
        border-radius: 10px;
        width: 127px;
        height: 49px;
        text-align: center;
        padding-left: 30px;
        display: block;
        font-size: 20px;
        margin-left: 338px;
    }

    .cnt_wrapper{
        position: relative;
    }

    .cnt_wrapper img{
        position: absolute;
        right: 122px;
        top: 12px;
    }

    select{
        width: 160px; 
        padding: 7px 0; 
        border: 1px solid #601986;
        border-radius: 10px;
        font-family: inherit;  
        background: url('../index_markup/img/select_arrow.png') no-repeat 95% 50%; 
        -webkit-appearance: none; 
        -moz-appearance: none;
        appearance: none;
        font-size: 20px;
        text-align: center;
    }

    [name="resDate"]{
        width: 214px; 
        padding: 7px 0 7px 42px; 
        border: 1px solid #601986;
        border-radius: 10px;
        font-family: inherit;  
        background: url('../index_markup/img/select_arrow.png') no-repeat 95% 50%; 
        -webkit-appearance: none; 
        -moz-appearance: none;
        appearance: none;
        font-size: 20px;
        text-align: center;
    }

    input[type="date"]::-webkit-clear-button,
    input[type="date"]::-webkit-inner-spin-button { 
        display: none;
    } 
    input[type="date"]::-webkit-calendar-picker-indicator { 
    background: transparent;
    z-index: 1;
    } 

    .date_input_wrapper{
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        padding-right: 31px;
        position: relative;
    }

    .date_input_wrapper img:first-child{
        position: absolute;
        right: 210px;
        top: 8px;

    }

    .img02{
        position: absolute;
        right: 155px;
        top: 67px;

    }

    [type="button"]{
        width: 203px;
        height: 48px;
        background: #601986;
        border-radius: 10px;
        border: none;
        font-weight: 500;
        font-size: 20px;
        line-height: 18px;
        color: #FFFFFF;
        font-family: inherit;
        display: block;
        margin: 46px auto 0;
        cursor: pointer;
    }

    textarea{
        border: 1px solid #601986;
        border-radius: 10px;
        display: block;
        margin: auto;
        padding: 10px;
        font-family: inherit;
    }

</style>
<script>
/*
 
 */
</script>
</head>
<body>
<%
	String resnum = request.getParameter("resnum");
%>
<div class="wrapper">
<%
    memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
	String user_email = loginUser.getEmail();
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
        <div class="res_info">
            <form>
            <p class="res_cnt">
                <span>본인 포함 식사할 인원</span><br>
                방문하시는 인원을 선택하세요
            </p>

            <div class="cnt_wrapper">
                <img src="/index_markup/img/myPageImg.png" alt="">
                <input type="number" id="resCnt" name="resCnt"  min="1" max="10" step="1" value="1"/>
            </div>

            <p>방문 일시를 선택하세요</p>
            <div class="date_input_wrapper">
                <img src="../index_markup/img/date_icon.png" alt="">
                <input type="date" name="resDate" id="resDate"><br>
                <img class="img02" src="/index_markup/img/clock_icon.png" alt="">
                <select name="resTime" id="resTime">
                    <option value="11:30">11 : 30</option>
                    <option value="12:00">12 : 00</option>
                    <option value="12:30">12 : 30</option>
                    <option value="13:00">13 : 00</option>
                    <option value="13:30">13 : 30</option>
                    <option value="14:00">14 : 00</option>
                    <option value="14:30">14 : 30</option>
                    <option value="15:00">15 : 00</option>
                    <option value="15:30">15 : 30</option>
                    <option value="16:00">16 : 00</option>
                    <option value="16:30">16 : 30</option>
                    <option value="17:00">17 : 00</option>
                    <option value="17:30">17 : 30</option>
                    <option value="18:00">18 : 00</option>
                    <option value="18:30">18 : 30</option>
                    <option value="19:00">19 : 00</option>
                    <option value="19:30">19 : 30</option>
                    <option value="20:00">20 : 00</option>
                    <option value="20:30">20 : 30</option>
                    <option value="21:00">21 : 00</option>
                </select>
            </div>
            <p>요청사항을 입력하세요</p>
            <textarea name="addReq" id="addReq" cols="60" rows="10"></textarea>
            <input type="button" value="다음으로" id="nextBtn">
            </form>
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
	var resCntOb = document.querySelector("[name=resCnt]");
	var resDateOb = document.querySelector("[name=resDate]");
	var resTimeOb = document.querySelector("[name=resTime]");
	var addReqOb = document.querySelector("[name=addReq]");
	var nextBtnOb = document.querySelector("#nextBtn");
	
	nextBtnOb.onclick=function(){
		insert_res();
	}
	
	 function insert_res() {
			var resCntVal = resCntOb.value;
			var resDateVal = resDateOb.value;
			var resTimeVal = resTimeOb.value;
			var addReqVal = addReqOb.value;
			var qstr = "?reserve_apply_person="+resCntVal
					+"&reserve_start_time="+resDateVal+" "+resTimeVal
					+"&reserve_request="+addReqVal+"&resnum="+"<%=resnum%>"+"&userEmail="+"<%=user_email%>";
			
			console.log(qstr);
			callAjax(qstr);
		}	
	 
	function callAjax(qstr) {
		var xhr = new XMLHttpRequest()
		xhr.open("get","pg1001_DB_fmt.jsp"+qstr, true);
		xhr.send()
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 & xhr.status==200){
				console.log("전송 완료");
                location.href="pg_1001_2.jsp"
			}
		}
	}

	
</script>
</html>