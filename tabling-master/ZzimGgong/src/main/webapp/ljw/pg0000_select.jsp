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


<jsp:useBean id="schdao" class="ljw.SchhDao"/>
<jsp:useBean id="sch" class="ljw.vo.SchList"/>

      <div class="storeInfo_main">
             <jsp:useBean id="mainList" class="ljw.SchhDao"/>
             <c:forEach var="ml" items="${mainList.SLMain(param.selectBox) }">
             <div class="storeInfoDiv_main" onclick="pageMove('${ml.resnum}')">
                 <div class="storeImage">
                      <img alt="" src="${ml.res_img }">
                 </div>
                 <div class="storeDetail">
                    <div class="snum">${ml.resnum }</div>
                    <div>${ml.res_name }</div>
                    
                    <div class="star">
                       <c:set var="starCnt" value="0"/>
                       <c:forEach var="i" begin="1" end="${ml.sco }">
                          <c:set var="starCnt" value="${i }"/>
                          <span><img src="https://cdn-icons-png.flaticon.com/512/956/956100.png"></span>
                       </c:forEach>
                       <c:forEach var="i" begin="1" end="${5-starCnt }">
                          <c:set var="starCnt" value="${i }"/>
                          <span><img src="https://cdn-icons-png.flaticon.com/512/1828/1828970.png"></span>
                       </c:forEach>
                       <span class="rev">${ml.sco } (${ml.cnt })</span>
                    </div>
                    
                    <div>${ml.mcategory }</div>
                    <div>${ml.res_address }</div>
                 </div>
              </div>
              
              
              </c:forEach>

          </div>
          