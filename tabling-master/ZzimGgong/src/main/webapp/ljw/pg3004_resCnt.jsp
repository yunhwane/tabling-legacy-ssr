<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"  

    import="ymw.*"
    import="jyh.model.*"
    import="jds.*"
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
<title>Insert title here</title>
<link href="/a00_com/a01_common.css" rel="stylesheet">

</head>
<body>

 <jsp:useBean id="dao" class="ljw.WaitingDao"/>

 	<%
 		memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
 		String loginUserEmail = loginUser.getEmail();
		
		String resnum = request.getParameter("resnum"); //parameter로 가게 번호
		String countResnum = request.getParameter("countResnum"); //parameter로 시간
		String personNum = request.getParameter("resCnt");
	

		int countResnumInt = Integer.parseInt(countResnum);
		int personNumInt = Integer.parseInt(personNum);

		
		dao.insertWaiting(new Waiting(resnum, loginUserEmail, personNumInt,"F","F"));
		dao.updWaitingNum(new Waiting(resnum, loginUserEmail));
		
		%>

</body>
<script>

	location.href="/ljw/pg0000.jsp";

</script>
</html>