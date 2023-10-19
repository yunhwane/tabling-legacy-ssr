<%@page import="hds.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    
    import="jyh.model.*"
    import="hds.*"
    import="ymw.*"
    import="ljw.*"
    import="ljw.vo.*"
   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8" />
	
	<%
	String resNum = "";
    memberDTO loginUser = (memberDTO)session.getAttribute("sesID");
	String userEmail = loginUser.getEmail();
	%>

	<jsp:useBean id ="wndao" class="ljw.WaitingCrDao"/>
	<jsp:useBean id ="wn" class="ljw.vo.WaitingCurrent"/>

	
	${wndao.currentNum(sesID.email) }
	
  
