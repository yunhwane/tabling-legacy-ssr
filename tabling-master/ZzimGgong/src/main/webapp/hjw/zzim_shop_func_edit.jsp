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
		p{
			display: block;
		}
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
                </div>
                <hr> 
                <form action="zzim_update_res.jsp">
                	<div class="myshop_contain_info">
	                	<p class="myshop_info_smallHead">영업정보</p>
	                	<div class="myshop_edit_myshop" style="padding-bottom:5%;">
		                	<div class="myshop_edit_myshop_left">
		                		<p>가게이름</p>
			                    <p>가게이메일</p>
			                    <p>가게주소</p>
			                    <p>가게 전화번호</p>
			                    <p>영업시간</p>
			                    <p>휴무일</p>
			                    <p>브레이크타임</p>
			                    <p>편의시설</p>
			                    <p>소개</p>
			                    <p>보증금</p>
			                    <p>웨이팅</p>
			                    <p>즉시예약</p>
		                	</div>
		                	<div class="myshop_edit_myshop_right">
		                		<p>: <input class="myshop_text" name="res_name" type="text" value="${res.res_name }"></p>
		                		<p>: <input class="myshop_text" name="res_email" type="text" value="${res.res_email }"></p>
		                		<p>: <input class="myshop_text" name="res_addresss" type="text" value="${res.res_addresss }"></p>
		                		<p>: <input class="myshop_text" name="res_phonenum" type="text" value="${res.res_phonenum }"></p>
		                		<p>: <input class="myshop_text" name="business_hours" type="text" value="${res.business_hours }"></p>
		                		<p>: <input class="myshop_text" name="day_off" type="text" value="${res.day_off }"></p>
		                		<p>: <input class="myshop_text" name="break_time" type="text" value="${res.break_time }"></p>
		                		<p>: <input class="myshop_text" name="convenient" type="text" value="${res.convenient }"></p>
		                		<p>: <input class="myshop_text" name="introduce" type="text" value="${res.introduce }"></p>
		                		<p>: <input class="myshop_text" name="deposit" type="text" value="${res.deposit}"></p>
		                		<p>: <input class="myshop_text" name="wating" type="text" value="${res.wating }"></p>
		                		<p>: <input class="myshop_text" name="reservation" type="text" value="${res.reservation }"></p>
		                		<input type="hidden"  name="resnum"  value="${res.resnum }">
		                	</div>
	                	</div>
	                	<input type="submit" value="변경">
					</div>
				</form>
				<form action="zzim_update_pick.jsp">
					<div class="myshop_contain_info">
						<p class="myshop_info_smallHead">매장픽</p>
						<div class="pick_wrapper" style="padding-bottom: 5%">
							<c:set var="moodArr" value="${fn:split(pick.mood,'/') }"/>
							<c:forEach var="moodL" items="${moodArr}">
		   					<span class="pick_span">${moodL}</span>
							</c:forEach>
		                    <span class="pick_span">${pick.purpose }</span>
		                    <span class="pick_span">${pick.food_type }</span>
		                    <span class="pick_span">${pick.table_type }</span>
	                    </div>
	                    <div class="myshop_edit_myshop" style="padding-bottom:5%;">
		             		<div class="myshop_edit_myshop_left">
		             			<p>분위기</p>
			                    <p>목적</p>
			                    <p>음식종류</p>
			                    <p>테이블종류</p>
							</div>
		                	<div class="myshop_edit_myshop_right">
		                		<p>: <input class="myshop_text" type="text" name="mood" value="${pick.mood }"></p>
			                    <p>: <input class="myshop_text" type="text" name="purpose" value="${pick.purpose }"></p>
			                    <p>: <input class="myshop_text" type="text" name="food_type" value="${pick.food_type }"></p>
			                    <p>: <input class="myshop_text" type="text" name="table_type" value="${pick.table_type }"></p>
								<input type="hidden"  name="resnum"  value="${res.resnum }">
							</div>
						</div>
						<input type="submit" value="변경">
					</div>
				</form>

				<form action="zzim_update_res.jsp">
					<div class="myshop_contain_info">
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
<script>
</script>

</html>