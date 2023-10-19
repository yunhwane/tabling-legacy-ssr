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
	   	h3{
	   		padding:15px 0px;
	   	}
	   	h4{
	   		padding: 15px 0px;
	   	}
	   	.pick{
	   		display:flex;
	   		gap: 15px;
    		flex-wrap: wrap;
	   	}
	   	.pick>span{
	   		border: 1px solid gray;
		    border-radius: 10px;
		    padding: 5px;
	   	}
    </style>
    <section>
    	<c:set var="moodArray" value="${fn:split(schList.StoreRespick(param.resnum).mood,'/')}" />
		<c:set var="purposeArray" value="${fn:split(schList.StoreRespick(param.resnum).purpose,'/')}" />
		<c:set var="food_typeArray" value="${fn:split(schList.StoreRespick(param.resnum).food_type,'/')}" />
		<c:set var="table_typeArray" value="${fn:split(schList.StoreRespick(param.resnum).table_type,'/')}" />
        <div class="content">
        	<div class="sch_wrapper">
	        	<div class="sch">
	        		<div class="schBtn">
	        			<button type="button" onclick="back()">이전</button>
	        		</div>
	        	</div>
        	</div>
        	<h3>매장 Pick</h3>
        	<div>
        		<h4>분위기</h4>
        		<div class="pick">
        			<c:forEach var="mood" items="${moodArray}">
        				<span>${mood }</span>
        			</c:forEach>
        		</div>
        		
        		<h4>목적</h4>
        		<div class="pick">
        			<c:forEach var="purpose" items="${purposeArray}">
        				<span>${purpose }</span>
        			</c:forEach>
        		</div>
        		
        		<h4>음식</h4>
        		<div class="pick">
        			<c:forEach var="food_type" items="${food_typeArray}">
        				<span>${food_type }</span>
        			</c:forEach>
        		</div>
        		
        		<h4>테이블</h4>
        		<div class="pick">
        			<c:forEach var="table_type" items="${table_typeArray}">
        				<span>${table_type }</span>
        			</c:forEach>
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

</body>
<script type="text/javascript">
	
	function back(){
		history.back()
	}
	
</script>
</html>