<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  
    
    import="ymw.*"
    import="jyh.model.*"
    import="jds.*"
    import="hjw.*"
    import="ljw.*"
    import="ljw.vo.*"
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
        
        /* 지원 -추가*/
        position:relative;
        background-color: #797B84; 
    }
    
    /* 지원 */
    .content_in{
    	width:100%;
    	height:499px;
    	border-radius:45px 45px 0px 0px;
    	background-color:#fff;
    	position:absolute;
    	bottom:0px;
    }
    .rmt_info{
    	display:flex;
    	justify-content: center; /* 가운데정렬 */
    	padding-top:120px;
    	color:#61188B;
    	font-size:16px;
    }
	.rmt_info h3{
		padding:5px 0 17px;
		font-size:25px;
	}
	
	.rmt_cnt_wrapper{
		display:flex;
    	justify-content: center; /* 가운데정렬 */
    	gap:13px;
 
	}
	.rmt_cnt_wrapper img{
		width:30px;
		height:30px;
		line-height:40px;
		margin-top: 5px;
		
	}
	.rmt_cnt_wrapper input{
        border: 2px solid #601986;
        border-radius: 16px;
        width: 180px;
        height: 43px;
        text-align: center;
        display: block;
        font-size: 20px;
	}
	.rmt_wt{
		display: flex;
		justify-content: center; 
    	padding-top: 60px;
    	padding-bottom: 20px;
    	font-size: 20px;
    	color: #333;
    }
	.rmt_confirm {
   		display:flex;
   		justify-content:center;
   		color:#fff;
	    background-color:#601986;
	    border-radius:5px;
	    font-size:25px;
	    font-weight:900;
	    width:80%;
	    margin:0px auto;
	    line-height:45px; 
   }

</style>
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
    
    <section>
        <div class="content">
        <div class="content_in">
        
   		    <div class="rmt_info">
   		    	<form>
   		    		<div class="rmt_cnt">
    		    		본인을 포함한 대기인원<br>
    		    		<h3>방문하시는 인원을 선택하세요</h3>
    		   	  	</div>	
					<div class="rmt_cnt_wrapper">
                		<img src="/index_markup/img/myPageImg.png" alt="">
						<input type="number" name="resCnt" min="1" max="10" step="1" value="1"/>
            		</div>
            		
	<%-- DB로딩 --%>
	<jsp:useBean id="dao" class="ljw.WaitingDao"/>
	
	<%
		String loginUserEmail = loginUser.getEmail();
		
		String resnum = request.getParameter("resnum"); //parameter로 가게 번호
		String countResnum = request.getParameter("countResnum"); //parameter로 시간
		int countResnumInt = Integer.parseInt(countResnum);


		
	%>

   		    		<div class="rmt_wt">대기예상시간 <%=5+countResnumInt*5 %>분</div>
   		    		<input type="button" class="rmt_confirm" value="대기신청하기"/>
   		    	</form>
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
<script>
	
	var confirmButton = document.querySelector(".rmt_confirm");
	var resCnt = document.querySelector("[name=resCnt]");
	var resnum = "<%=resnum%>"
	var countResnum = <%=countResnum%>
	
	confirmButton.onclick = function(){
		alert("원격줄서기 신청완료");
		location.href="/ljw/pg3004_resCnt.jsp?resnum="+resnum+"&countResnum="+countResnum+"&resCnt=" + resCnt.value
	}
	

	
</script>
</html>