<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    
    import="ymw.*"
    import="ymw.dao.*"
    import="ymw.vo.*"
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

<link rel="stylesheet" href="/index_markup/reset.css"/>
<style type="text/css">

    /* ㅇㅇ */
   .content{
       width: 100%;
       background-color: #fff;
   }
   
   
   /* 지원 */   
   nav.searchmenu{
      width: 100%;
      background-color: #fff;
      display: block
   }
   .search {
      padding-top:20px;
      display:flex;
      width:60%;
      margin:0 auto; /* 가운데정렬 */
      justify-content: center; /* 가운데정렬 */
   }
   
   
   nav.searchmenu>.search>form>input[type=text]{
      background-color:#E1E5F2;
      height:40px;
      border-radius:12px 0px 0px 12px;
      border:none;
      display:block;
      padding-left:20px;
      width:300px;
   }
   nav.searchmenu>.search>form>input[type=text]:click{
      border:none;
   }
   nav.searchmenu>.search>form>button{
      background-color:#E1E5F2;
      height:40px;
      width:40px;
      border:none;
      display:none;
   }
   nav.searchmenu>.search>div>button{
      background-color:#E1E5F2;
      height:40px;
      width:40px;
      border-radius:0px 12px 12px 0px;
      border:none;
   }
   nav.searchmenu>.search>div>button>img{
      height:20px;
      width:20px;
   }
   nav.searchmenu>.menu{
      display:flex;
       justify-content:center;
       gap:60px;
       padding-top:20px;
       padding-bottom:20px;
       font-size:18px;
       font-weight:800;
       color:#4C4C47;
   }
   nav.searchmenu>.menu>li:hover{
      color:#601986;
       cursor:pointer;
   }
   
   .content>.advertising{
      height:200px;
      background-color:#F1F3F9;
   }
   

   .banner>div{
      display:inline-block;
      padding-top:40px;
      
   }
   .banner>div>h3{
      display:block;
      padding: 2px;
   }
   .banner>img{
      display:inline-block;
      height:140px;
   }
   
   .content>h3{
      display:flex;
       justify-content:center;
       padding-top:30px;
   }
   
   
   /* select */
   select{
      -webkit-appearance: none;
       -moz-appearance: none;
      appearance: none;
   }
   /* IE에서 화살표 제거 */
   select::-ms-expand{
      display:none;
   }

   .selectBox * { box-sizing:border-box; color:#333;}
   .selectBox{
      width: 180px;
      height: 32px;
      border-radius:16px;
      border:2px solid #601986;
      background: url('../index_markup/img/select_arrow.png') no-repeat 92% 50%;
      background-size:12px;
      text-align: center;
      padding-right: 13px;
      margin-top: 10px;
      margin-left: 310px;
   }   
   
   .storeInfo_main{
      display:flex;
      padding:20px;
      flex-wrap:wrap;
      justify-content:space-between;
   }
   .storeInfo_main>.storeInfoDiv_main{
      width:200px;
      padding-bottom:20px;
   }
   .storeInfoDiv_main>.storeImage{
      width:100%;
      height:100px;
      border-radius:5px;
      border:0.5px solid #4C4C47;
   }
   .storeInfoDiv_main img{
      display:block;
      height:98.5px;
      margin:0 auto;
   }
   .storeInfoDiv_main>.storeDetail{
      color:#333;
      padding-top:5px;
      padding-left:3px;
   }
   
   /* 상단 고정 */
   header{
      position:sticky;
      top:0;
      z-index:999;
   }
   nav.searchmenu{
      position:sticky;
      top:46px;
      background-color:#fff;
   }
   
   input:focus {outline: none;}
   
   /*
   .bj-button i:before {
       display: block;
   }
   .icon--search:before {
       content: "\f1cb";
   }
   */


#container {
  width: 100%;
  height: 200px;
  overflow: hidden;
  margin: 0 auto;
}

.img {
  display: none;
  width: 100%;
  height: 200px;
}

.img.on {
  display: block;
}



   /* 가게db화면 */
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
   .snum{
      display: none;
   }
   .storeInfoDiv_main{
      cursor:pointer;
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
           <h1 class="logo"><img src="/index_markup/img/main_logo.png" alt=""></h1>
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
        <h1 class="logo"><img src="/index_markup/img/main_logo.png" alt=""></h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    </c:if>
    
    <section>
        <div class="content">
        
          <nav class="searchmenu">
             <div class="search" onclick="location.href='/ymw/pg0001.jsp';"> <!-- .search onclick>>link -->
                <form>
                   <input type="text" name="search" placeholder="매장이름을 검색하세요" >
                   <button type="button"></button>
                </form>   
                <div>
                   <button type="button"><img src="/index_markup/img/search_icon.png" alt=""></button>
                </div>
             </div>
             <ul class="menu">
                <li onclick="location.href='/hds/res_index.jsp';">즉시예약</li>
                <li onclick="location.href='/ljw/pg3001.jsp';">원격줄서기</li>
                <c:if test="${not empty sesID }">
                	<li onclick="location.href='/ljw/pg3005.jsp';">주문현황</li>
                </c:if>
                <c:if test="${empty sesID }">
                	<li onclick="alert('로그인 후 이용 가능합니다.')">주문현황</li>
                </c:if>
             </ul>
          </nav>
          
         <div id="container">
           <img class="img" src="/index_markup/img/mainBanner01.png" />
           <img class="img" src="/index_markup/img/mainBanner02.png" />
           <img class="img" src="/index_markup/img/mainBanner03.png" />
         </div>
       
          <h3>내 주변 맛집으로 찜꽁</h3>
       
            <select class="selectBox">
               <option class="option">별점높은순</option>
               <option class="option">리뷰많은순</option>       
            </select>
          <div class="here"></div>
          
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

   var lis = document.querySelectorAll(".mpstores li");
   var inputOb = document.querySelector("[name=search]")
   lis.forEach(function(li){
      li.onclick=function(){
         li.style.color="#601986";
         li.style.fontWeight="600"
      }
   })
   
   inputOb.onclick=function(){
      inputOb.style.border="none"
   }

   
   

   const images = document.querySelectorAll('.img');
   let current = 0;

   function showSlide() {
     for(let i=0; i<images.length; i++) {
       images[i].classList.remove('on');
     }
     current++;
     if(current > images.length) {
       current = 1;
     }
     images[current - 1].classList.add('on');
     setTimeout(showSlide, 2000);
   }

   showSlide();
   
   
   
   //가게db화면
   var selectBoxOb = document.querySelector(".selectBox")
   
   var snums = document.querySelectorAll(".snum")
   
   snums.forEach(function(snum){
      snum.style.display = "none"
   })

   
   
   
   function response(){
      var selectBox = selectBoxOb.value
      
      var xhr = new XMLHttpRequest()
      xhr.open("get", "/ljw/pg0000_select.jsp?selectBox="+selectBox, true)
      xhr.send()
      
      xhr.onreadystatechange=function(){
         if(xhr.readyState==4&&xhr.status==200){
            var here = document.querySelector(".here")
            here.innerHTML=xhr.responseText
         }
      }
      var storeInfoDivs = document.querySelectorAll(".storeInfoDiv_main")
      storeInfoDivs.forEach(function(inf,idx){
         inf.style.cursor = "pointer";
         inf.onclick = function(){
            location.href = "/ymw/pg0012.jsp?resnum="+snums[idx].innerText
         }
      })
      
   }
   function pageMove(move){
      location.href="/ymw/pg0012.jsp?resnum="+move
   }
   
   response()
   selectBoxOb.onchange = response

</script>
</html>