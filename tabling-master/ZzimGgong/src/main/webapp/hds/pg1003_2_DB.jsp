<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="hds.*"
   %>

<jsp:useBean id="dao" class="hds.reservation_Dao"/>

<%

String email = request.getParameter("user_email");
String res_Num = request.getParameter("resNum");
String start_time = request.getParameter("reserve_start_time");

start_time = start_time.replace("%", " ");
System.out.println(start_time);

dao.res_deny(email, res_Num, start_time);

%>
