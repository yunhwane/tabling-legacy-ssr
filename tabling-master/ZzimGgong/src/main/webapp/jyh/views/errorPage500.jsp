<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
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
        background-color: #fff;
    }
    .container {
  padding: 2em;
}

/* GENERAL BUTTON STYLING */
button,
button::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
  background: none;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
  display: block;
  font-size: 1.6em;
  font-weight: bold;
  margin: 1em auto;
  padding: 2em 6em;
  position: relative;
  text-transform: uppercase;
}

button::before,
button::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

button:hover {
  color: #2ecc71;
}

.btn-1::after {
  height: 0;
  left: 0;
  top: 0;
  width: 100%;
}
.container {
   width:100%;
   background-color:#fff;
   display:flex;
   justify-content: center;
   flex-direction:column;
}
#errorMsg{
   margin-left:70px;
   color:#61188B;
   margin-bottom:10px;
}
#col{
   width:auto;
   margin-bottom:60px;
   margin-left:70px;
   font-size:14px;
   border-radius:4px;
}
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 100;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 100;
    transition: 0.25s;
}
.w-btn-green {
    background-color: #a470c2;
    color: #d7fff1;
}

.w-btn-green-outline {
    border: 3px solid #77af9c;
    color: #a470c2;
}

.w-btn-green-outline:hover {
    background-color: #77af9c;
    color: #d7fff1;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>

<div class="wrapper">
    <header>
        <h1 class="logo"><img src="/index_markup/img/main_logo.png" alt=""></h1>
         <nav class="gnb">
            <ul>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
<lottie-player src="https://assets1.lottiefiles.com/datafiles/HN7OcWNnoqje6iXIiZdWzKxvLIbfeCGTmvXmEm1h/data.json"  background="transparent"  speed="1"  style="width:100%; height: 300px;"  loop controls autoplay>
</lottie-player>
<div class="container">
  <div id = "errorMsg">
  <h1>자동차 속도는 500 에러 페이지</h1>
  <h4> 내부 서버오류입니다. 계속 오류가 발생하면 wjsdbsghks96@naver.com으로 연락주세요. </h4>
  <div id = "col"><button class="w-btn w-btn-green" type="button" onclick = "goHome();">
         메인화면
    </button></div>
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
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<script type="text/javascript">
function goHome(){
	location.href = "/ljw/pg0000.jsp";
}
</script>
</html>