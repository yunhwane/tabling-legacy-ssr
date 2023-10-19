<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jyh.model.reviewDAO"
    import = "jyh.model.reviewDTO"
    import = "jyh.model.memberDTO"
    import = "java.util.*"%>
<%
	int pageSize = 3; // 한 페이지에 출력할 레코드 수
	
	memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
	String email = loginUser.getEmail();
	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
		pageNum = "1";
	}
	// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int count = 0;
	reviewDAO manage = new reviewDAO();
	count = manage.selectCount(email); // 데이터베이스에 저장된 총 갯수
	
		// getList()메서드 호출 / 해당 레코드 반환
	ArrayList<reviewDTO> list = manage.reviewView(email,currentPage);
	
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>찜꽁</title>
<link rel="stylesheet" href="/jyh/views/reviewList.css">
<style type="text/css">

    /* ㅇㅇ */
    .content{
        width: 100%;
        height: 500px;
        background-color: #fff;
    }  
</style>
</head>
<body>
<div class="wrapper">
    <header>
        <h1 class="logo">
        <a href = "/ljw/pg0000.jsp"><img src="/index_markup/img/main_logo.png" alt=""></a>
        </h1>
         <nav class="gnb">
            <ul>
                <li><a href="/myInfoController"><img src="/index_markup/img/myPageImg.png" alt=""></a></li>
            </ul>
         </nav>
    </header>
    <section>
        <div class="content">
            <div class ="cont_header">   
           <div class = "myPage1" onclick = "goMyInfo();">
             <h4>내정보 관리</h4>
           </div>
           <div class = "myPage2">
             <h4>리뷰 관리</h4>
           </div>
            </div>
            <div class = "content_form">
                    <div id = "e_form">
                    <h1>작성 리뷰</h1>
                    
<%
				if (count > 0) { // 데이터베이스에 데이터가 있으면
					int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
					for (int i = 0; i < list.size(); i++) {
						reviewDTO lists = list.get(i); // 반환된 list에 담긴 참조값
%>            
                    <div id = "inform" onclick = "goResNum('<%=lists.getResnum()%>')">
                    <div class = imgform>
                        <h1 class = "iems"><img src = "/img/kakaologo.png"></h1>
                        <div class ="container">
                            <h2><%=lists.getResName()%><span class = "col">★<%=lists.getStarScore()%>점</span><span><%=lists.getReviewDate()%></span></h2>
                                <div class = "itemss"><%=lists.getContent()%></div>
                        </div> 
                    </div>
                    </div>
                    <%
					}
				}else{
					%>
					<h2 align = "center">리뷰작성한 목록이 없습니다.</h2>
					<%
				}
                    %>
                    </div>
                    <div id = "dss">
                    <div class="pagination">
                    <%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="reviewList.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="reviewList.jsp?pageNum=<%=i%>"><%=i %></a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="reviewList.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%
							}
						}
					%>
                      </div>
                      <div id = "titleButton">
                        <button type="button" class="w-btn w-btn-indigo" onclick="goReviewList();">작성한 리뷰 보기</button>
                        <button type="button" class="w-btn w-btn-indigo" onclick="updatefunction();">작성 가능한 리뷰 보기</button>
                    </div>
                    
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
<script type = "text/javascript">
function goReviewList(){
	location.href = "/jyh/views/reviewList.jsp";
}
function goMyInfo(){
	location.href = "/myInfoController";
}
function goResNum(resnum){
	location.href = "/ymw/pg0012.jsp?resnum="+resnum;
}
</script>
</body>
</html>