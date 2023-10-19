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
	   	.AllReview{
	   		display:flex;
	   		flex-direction: column;
    		gap: 20px;
	   	}
	   	.review{
	   		display:flex;
	   		flex-direction: column;
    		gap: 5px;
	   	}
	   	.reviews{
			display: flex;
			flex-direction: column;
		}
		.reviews>div{
			display: flex;
			flex-direction: column;
			padding: 15px 0;
			gap: 3px;
		}
		.reviews span{
			font-size: 14px;
			color: darkgray;
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
        	<c:set var="storeR" value="${schList.StoreReview(param.resnum) }"/>
        	<h3>리뷰 <span>${storeR.cnt}</span></h3>
        	<div class="reviews">
       			<c:set var="reviews" value="${schList.userReview(param.resnum)}" />
        		<c:set var="doneLoop" value="false" />
				<c:if test="${fn:length(reviews)>0}">
        		<c:forEach var="g" begin="0" end="${fn:length(reviews)-1}" varStatus="status">
        				<div class="menu">
		        			<div>
		       					<div class="star">
		       						<c:if test="${fn:length(reviews)>0}">
		       						<c:set var="starCnt" value="0"/>
				        				<c:forEach var="i" begin="1" end="${reviews[g].star_sco }">
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
        		</c:forEach>
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
	
	function back(){
		history.back()
	}
	
</script>
</html>