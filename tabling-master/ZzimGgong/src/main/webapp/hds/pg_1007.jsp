<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<title>예약 신청 내역(가게)</title>
<link rel="stylesheet" href="/index_markup/reset.css">
<style type="text/css">
	    .content{
        width: 100%;
        background-color: #fff;
        padding: 50px 0;
    }

    .content h3{
        font-weight: 600;
        font-size: 30px;
        line-height: 18px;
        color: #601986;
        line-height: 30px;
		text-align: center;
        padding-bottom: 50px;
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
	    width: 480px;
	    margin: auto;
	    padding-left: 20px;
}
    }

    .info_wrap img{
        padding-right: 14px;
    }
    
    .info_wrap li{
    	color: #333;
    }
    
    .info_wrap h2{
    	font-size: 20px;
    	line-height: 30px;
    }
	
	.content button {
		padding: 10px;
	    border-radius: 5px;
	    border: none;
	    color: #fff;
	    background-color: #601986;
	    font-size: 15px;
	    font-weight: 600;
	    display: block;
	    margin: 10px auto 50px;
	    cursor: pointer;
	}
}
	
</style>
<script type="text/javascript" src="./script/power.js"></script>
<script type="text/javascript" src="./script/shop_loginJS.js"></script>
</head>
<body>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>

<%
	String user_email = "";
	String resnum = request.getParameter("resnum");
%> 
<div class="wrapper">
      <header>
         <h1 class="logo"><a href="/hjw/zzim_shop.jsp?resnum=${param.resnum}"><img src="/index_markup/img/main_logo.png" alt=""></a></h1>
         <nav class="gnb">
            <ul>
               <li><a href="/hjw/zzim_shop.jsp?resnum=${param.resnum}"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
               <li><button onclick="logout()">종료</button></li>
            </ul>
         </nav>
      </header>
    <section>
        <div class="content">
            <h3>예약 내역 확인하기</h3>
<%
for(Reservation r : dao.showResList(user_email, resnum)) {
	String state="";
	if(r.getReserve_state()==1){
		state="신청 완료 ";
	}
%>
            <div class="info_wrap">
            	<div class="res_info_box">
	            	<h2><%=r.getNickName() %>님 예약 정보</h2>
	            	<ul>
	            		<li>예약인원 : <%=r.getReserve_apply_person() %>명</li>
	            		<li>방문일시 : <%=r.getReserve_start_time() %></li>
	            	</ul>
            	</div>
            </div>
            <button onclick="location.href='pg_1003.jsp?user_email=<%=r.getUser_email()%>&reserve_start_time=<%=r.getReserve_start_time()%>&nickName=<%= r.getNickName()%>&phoneNum=<%=r.getPhoneNum()%>&resnum=<%=resnum%>'">
	            <%=r.getNickName() %>님의 예약 승인/거절
            </button>
<%} %>
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
<script type="text/javascript" src="/hjw/script/shop_loginJS.js"></script>
</html>