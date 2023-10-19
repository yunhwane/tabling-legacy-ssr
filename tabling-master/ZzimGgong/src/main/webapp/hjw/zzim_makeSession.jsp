<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   	import = "java.util.*"
    import="ymw.*"
    import="jyh.model.*"
    import="hds.*"
    import="hjw.*"
    import="ljw.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/*
 
 */
</script>
</head>
<jsp:useBean id="dao" class="hjw.ZzimDao"/>
<jsp:useBean id="waitDao" class="hjw.WaitingStoreDao"/>
<jsp:useBean id="res" class="hjw.Restaurant"/>
<jsp:setProperty property="*" name="res"/>
<jsp:useBean id="pick" class="hjw.ResPick"/>
<jsp:setProperty property="*" name="pick"/>
<jsp:useBean id="menu" class="hjw.Menu"/>
<jsp:setProperty property="*" name="menu"/>
<jsp:useBean id="wait" class="hjw.Waiting"/>
<jsp:setProperty property="*" name="wait"/>
<body>
   <c:if test="${not empty dao.login(res)}">
		<c:set var="res" scope="session" value="${dao.login(res)}"/> 
        <c:set var="pick" scope="session" value="${dao.getPickInfo(pick) }"/>
        <c:set var="menu" scope="session" value="${dao.getMenuInfo(menu) }"/>
        <c:set var="wait" scope="session" value="${waitDao.getWaitingInfo(wait) }"/>
        
   </c:if>
<%--
	
--%>
</body>
<script>
	var isFail='${res.resnum}'
	if(isFail==''){
	   alert("사용자코드를 입력해주세요.")
	   location.href="shop_login.jsp"
	}else if(isFail!=''){
	   alert("가게정보를 불러오는데 성공했습니다.")
	   location.href="zzim_shop.jsp?resnum=${param.resnum}"
	}
/*

 */
</script>
</html>