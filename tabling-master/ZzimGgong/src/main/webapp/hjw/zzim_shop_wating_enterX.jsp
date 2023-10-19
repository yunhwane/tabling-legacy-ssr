<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
     
    import="jyh.model.*"
    import="hds.*"
    import="ymw.*"
    import="hjw.*"
    import="ljw.*"
    import="ljw.vo.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />


	<%-- 
    <script type="text/javascript" src="./script/power.js"></script>
    <script type="text/javascript" src="./script/shop_loginJS.js"></script>
	--%>

 	<jsp:useBean id ="enXdao" class="hjw.WaitingStoreDao"/>
	<jsp:useBean id ="enX" class="hjw.WaitingStore"/>
	
	
	${enX.setUserEmail(param.userEmail) }
	${enX.setResnum(res.resnum) } 
	${enX.setWstarttimeS(param.wstarttimeS) }
	
	${enXdao.cancelWStore(enX) }