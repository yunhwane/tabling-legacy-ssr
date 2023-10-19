<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	import = "java.util.*"
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

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>찜꽁</title>
    <link rel="stylesheet" href="/index_markup/reset.css">
    <link rel="stylesheet" href="./style.css">
    <style type="text/css">
    </style>
    <script type="text/javascript" src="./script/power.js"></script>
    <script type="text/javascript" src="./script/shop_loginJS.js"></script>
</head>

<body>

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
                <div class="myshop_header">
                    <span class="myshop_name">${res.res_name }</span>
                    
                    <input type="button" class="myshop_edit" onclick="location.href='zzim_shop_func_edit.jsp'"
                        value="정보수정">
                </div>

                <hr>
                <div class="myshop_img_contain">
                    <img class="myshop_img"
                        src="${res.res_img }"
                        alt="">
                </div>
                <div class="myshop_contain_info">
                	<p class="myshop_info_smallHead">영업정보</p>
                    <p>가게번호 : ${res.resnum }</p>
                    <p>가게이름 : ${res.res_name }</p>
                    <p>가게이메일 : ${res.res_email }</p>
                    <p>가게주소 : ${res.res_addresss }</p>
                    <p>가게 전화번호 :${res.res_phonenum }</p>
                    <p>영업시간 : ${res.business_hours }</p>
                    <p>휴무일 : ${res.day_off }</p>
                    <p>브레이크타임 : ${res.break_time }</p>
                    <p>편의시설 : ${res.convenient }</p>
                    <p>소개 : ${res.introduce }</p>
                    <p>보증금 : ${res.deposit }원</p>
                    <p>등록일 : ${res.enroll_dateS }</p>
                    <p>웨이팅 : <span class="waiting_info">${res.wating }</span></p>
                    <p>즉시예약 : <span class="reservation_info">${res.reservation }</span></p>
                    
					<p class="myshop_info_smallHead">매장픽</p>
					<div class="pick_wrapper">
					<c:set var="moodArr" value="${fn:split(pick.mood,'/') }"/>
					<c:forEach var="moodL" items="${moodArr}">
   					<span class="pick_span">${moodL}</span>
					</c:forEach>
                    <span class="pick_span">${pick.purpose }</span>
                    <span class="pick_span">${pick.food_type }</span>
                    <span class="pick_span">${pick.table_type }</span>
                    </div>
                    <p class="myshop_info_smallHead">메뉴</p>
                    <p>메뉴종류 : ${menu.mcategory }</p>
		            <c:set var="menuArr" value="${fn:split(menu.menuname,'/') }"/>
		            <c:set var="priceArr" value="${fn:split(menu.price,'/') }"/>
		            <c:set var="imgArr" value="${fn:split(menu.food_img,'@') }"/>
		            <c:forEach var="i" begin="0" end="${fn:length(menuArr)-1 }">
		            <div class="shop_menu_contain">
		               <div class="shop_menu_contain_left">
		                  <img class="shop_menu_img" src="${imgArr[i] }">
		               </div>
		               <div class="shop_menu_contain_right">
		                  <p class="shop_menu_contain_p">${menuArr[i]}</p>
		                  <p class="shop_menu_contain_price">${priceArr[i]} 원</p>
		               </div>
					</div>
		            </c:forEach>
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
	var waitingS=document.querySelector(".waiting_info")
	var reservationS=document.querySelector(".reservation_info")
	console.log(waitingS.innerText)
	if(waitingS.innerText==1){
		waitingS.innerText="가능"
	}
	if(reservationS.innerText==1){
		reservationS.innerText="가능"
	}
	if(waitingS.innerText==0){
		waitingS.innerText="불가능"
	}
	if(reservationS.innerText==0){
		reservationS.innerText="불가능"
	}
</script>

</html>