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
<jsp:useBean id="res" class="hjw.Restaurant"/>
<jsp:setProperty property="*" name="res"/>
<jsp:useBean id="pick" class="hjw.ResPick"/>
<jsp:setProperty property="*" name="pick"/>

<c:set var="updateRes" value="${dao.updateRestaurant(res)}"/>
<c:if test="${updateRes>0}">
	<c:set var="res" scope="session" value="${dao.login(res)}"/>
</c:if>

<body>

<%--
	
--%>
</body>
<script>
/* var updateRes="${updateRes}";
var updatePick="${updatePick}";
if(updateRes>0 || updatePick>0){
	alert("변경을 완료 했습니다.")
	location.href="zzim_shop_func.jsp?resnum=${param.resnum}"
}else{
	alert("변경을 실패했습니다.")
	location.href="zzim_shop_func_edit.jsp"
} */
alert("${updateRes>0?'수정 성공':'수정안됨'}")
location.href="zzim_shop_func.jsp?resnum=${param.resnum}"
/*

 */
</script>
</html>