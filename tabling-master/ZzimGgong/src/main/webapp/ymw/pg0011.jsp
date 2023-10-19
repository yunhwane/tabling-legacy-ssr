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
        padding: 0px 10px;
        background-color: #fff;
    }
    .sch{
    		padding-top:20px;
    		display:flex;
    	}
   	.schBtn>button{
  		width: 40px;
	    height: 40px;
	    border: 1px solid gray;
	    border-radius: 6px 0px 0px 6px;
	    cursor:pointer;
   	}
   	.schInp{
   		width: 100%;
	    height: 40px;
	    margin-left: -1px;
	    border: 1px gray solid;
	    border-radius: 0px 6px 6px 0px;
	    background: white;
   	}
   	.schInp>input{
   		padding: 0px 10px;
	    width: 93%;
	    height: 100%;
	    border: none;
   	}
   	h3{
   		padding : 15px 0px;
   	}
   	.recKeyword{
   		display:flex;
   		justify-content: flex-start;
   		gap: 10px;
   	}
   	.recKeyword>li{
   		border:1px solid gray;
   		background:white;
   		padding: 5px;
   		border-radius: 10px;
   	}
   	.popSch>li{
   		padding: 0px 0px 7px 25px;
   	}
   	.schInp>button{
   		background-color: black;
	    color: white;
	    padding: 3px;
	    border-radius: 9px;
	    text-align: center;
	    cursor:pointer;
   	}
   	input[type=text]:focus{
   		outline:none;
   	}
   	.appKind{
   		padding-top: 20px;
   	}
	.appKind>ul{
		padding-top:10px;
		display:flex;
		gap: 10px;
	}
	.arrKind>ul{
		padding-top: 10px;
		display: flex;
		gap: 10px;
		align-items: flex-start;
		flex-direction: column;
		flex-wrap: wrap;
		align-content: flex-end;
		padding-right: 20px;
	}
	.appKind>ul>li{
		border: 2px solid #601986;
		padding:3px;
		border-radius: 9px;
		font-weight: 600;
		cursor:pointer;
	}
	.arrKind{
		display: flex;
    	align-items: flex-end;
	}
	.arrKind>select{
		width: 100px;
	    font-size: 15px;
	    font-weight: 900;
	    border: 2px solid #601986;
	    border-radius: 9px;
	    height: 30px;
	}
	.storeInfo{
		display: flex;
		padding-top: 20px;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.storeInfoDiv{
		width:200px;
		padding-bottom:20px;
	}
	.storeInfo img{
		width:200px;
		height:150px;
	}
	header{
		position: sticky;
		top: 0;
	}

	.sch_wrapper{
		position: sticky;
	    padding-top: 14px;
	    top: 46px;
	    background: white;
	}
	.arr{
		display:flex;
		justify-content: space-between;
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
	.rev{
		padding-left:5px;
	}
	.appKind2{
		display: flex;
		gap:10px;
	}
	.appKind2>div{
		border: 2px purple dashed;
		padding: 3px;
		border-radius: 9px;
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
    <jsp:useBean id="schList" class="ymw.dao.Sch"/>
    <c:if test="${not empty sesID }">
    	${schList.SchInsert(sesID.email,param.sch)}
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
        	<div class="sch_wrapper">
	        	<div class="sch">
	        		<div class="schBtn">
	        			<button type="button" onclick="backBtn()">이전</button>
	        		</div>
	        		<div class="schInp">
	        			<input name="schContent2" type="text" placeholder="매장을 검색해보세요." value="${param.sch}">
	        			<button id="delBtn" type="button" onclick="delBtn()">X</button>
	        		</div>
	        	</div>
        	</div>
        	<div class="arr">
	        	<div class="appKind">
	        		<ul>
	        			<li>전체</li>
	        			<li>원격줄서기</li>
	        			<li>즉시예약</li>
	        		</ul>
	        	</div>
	        	<div class="arrKind">
	        		<select>
	        			<option>별점높은순</option>
	        			<option>리뷰많은순</option>
	        			<option>신규매장순</option>
	        		</select>
	        	</div>
        	</div>
        	<div class="storeInfo">
       			<c:forEach var="sl" items="${schList.SL(param.sch,param.appKind,param.arrKind)}">
        			<div class="storeInfoDiv">
        				<div>
	       					<img src="${sl.res_img }">
	        			</div>
	        			<div>
	        				<div><span class="snum">${sl.resnum }</span></div>
	        				<div><span>${sl.mcategory }</span></div>
	        				<div><span>${sl.res_name }</span></div>
	        				<div class="star">
	        				
	        				<c:set var="starCnt" value="0"/>
	        				<c:forEach var="i" begin="1" end="${sl.sco }">
	        					<c:set var="starCnt" value="${i }"/>
	        					<span><img src="https://cdn-icons-png.flaticon.com/512/956/956100.png"></span>
	        				</c:forEach>
	        				<c:forEach var="i" begin="1" end="${5-starCnt }">
	        					<c:set var="starCnt" value="${i }"/>
	        					<span><img src="https://cdn-icons-png.flaticon.com/512/1828/1828970.png"></span>
	        				</c:forEach>
	        				<span class="rev">${sl.sco } (${sl.cnt })</span>
	        				</div>
	        				<div><span>${sl.res_address }</span></div>
	        				<div class="appKind2">
	        					<c:if test="${sl.wating == 1 }">
	        						<div><span>원격줄서기</span></div>
	        					</c:if>
	        					<c:if test="${sl.reservation == 1 }">
	        						<div><span>즉시예약</span></div>
	        					</c:if>
	        				</div>
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
var schInpOb2 = document.querySelector("[name=schContent2]")
var appKindArr = document.querySelectorAll(".appKind li")
var arrKindSel = document.querySelector(".arrKind>select")
var storeInfoDivs = document.querySelectorAll(".storeInfoDiv")
var snums = document.querySelectorAll(".snum")
snums.forEach(function(snum){
	snum.style.display = "none"
})

storeInfoDivs.forEach(function(inf,idx){
	inf.style.cursor = "pointer";
	if(inf.onclick = function(){
		location.href = "/ymw/pg0012.jsp?resnum="+snums[idx].innerText+"&sch="+schInpOb2.value
	}){
	}
})

start()
function start(){
	appKindArr.forEach(function(kind){
	if(kind.innerText=="${param.appKind}"){
		kind.style.color = "red";
	}
	})
	arrKindSel.value = "${param.arrKind}"
}
appKindArr.forEach(function(kind){
	if(kind.innerText=="${param.appKind}"){
		kind.style.color = "red";
	}
	kind.onclick = function(){
		var appKind = kind.innerText
		if(schInpOb2.value==""){
			alert("검색어를 입력해주세요.")
			schInpOb2.focus()
		}
		else{
			location.href="/ymw/pg0011.jsp?sch="+schInpOb2.value+"&appKind="+appKind+"&arrKind=${param.arrKind}"
		}
		
	}
})
arrKindSel.onchange = function(){
	var arrKind = arrKindSel.value
	if(schInpOb2.value==""){
		alert("검색어를 입력해주세요.")
		schInpOb2.focus()
	}
	else{
		location.href="/ymw/pg0011.jsp?sch="+schInpOb2.value+"&appKind=${param.appKind}&arrKind="+arrKind
	}
}
schInpOb2.onkeyup = function(){
	if(event.keyCode==13){
		if(schInpOb2.value==""){
			alert("검색어를 입력해주세요.")
			schInpOb2.focus()
		}
		else{
			location.href="/ymw/pg0011.jsp?sch="+schInpOb2.value+"&appKind=전체&arrKind=별점높은순"
		}
	}
}
function delBtn(){
	schInpOb2.value = ""
	schInpOb2.focus()
}
function backBtn(){
	location.href="pg0001.jsp"
}
</script>
</html>