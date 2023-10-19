<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
	import="ymw.*"
    import="jyh.model.*"
    import="jds.*"
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
<title>Insert title here</title>
<link rel="stylesheet" href="../index_markup/reset.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        background-color: #fff;
        padding: 30px 0;
    }

    .content h2{
        line-height: 50px;
        color: #601986;
        text-align: center;
        font-size: 30px;
    }

    .content p {
        color: #333;
        font-size: 15px;
        padding: 30px 0 30px 35px;
        line-height: 20px;
    }

    .content a{
        color: #601986;
    }


</style>
<script>
/*
 
 */
</script>
</head>
<body>
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
        <div class="content">
            <h2>예약 신청 완료</h2>
            <p>
                예약 신청이 완료되었습니다. 가게에서 신청 내역을 확인한 후<br>
                승인, 거절할 수 있습니다.
                신청 결과, 거절 사유 등은 마이페이지에서<br>
                확인 가능합니다.<br>
                <br>
                예약 신청 후 취소 의사를 밝히지 않은 채, 3회 이상 매장에 방문하지 않은<br>
                경우 노쇼 패널티를 받습니다. 
                노쇼 패널티를 받게된 회원님의 경우<br> 
                예약 신청이 불가합니다. 이 점 유의 부탁 드립니다.<br>
                <br>
                추가로 궁금하신 점은 <a href="#"><i><u>찜꽁 고객센터</u></i></a>로 문의해 주세요.<br>
                감사합니다.
            </p>
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
/*

 */
</script>
</html>