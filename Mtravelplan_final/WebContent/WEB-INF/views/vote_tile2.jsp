<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html lang="ko">



<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/vote.css" />
<style type="text/css">
</style>





<div id="body_wrap">

   <div id="main_wrap">

      <div id="top_wrap" align="center">
         <tiles:insertAttribute name="top_inc"/>
      </div>
      
      
      
      
      <div id="hap_wrap">
      
         <div id="left_view">
            <tiles:insertAttribute name="left_menu"/>
         </div>
         
       <div id="main_view"> 
       
         <div id="main_leftview" style="float: left;width: 50%">
            <tiles:insertAttribute name="main_left_view"/>
         </div>
         
         <div id="main_rightview" style="float: right; width: 50%">
            <tiles:insertAttribute name="main_right_view"/>
         </div>
         
         <div id="main_bottom_view" style="float:left ; width: 100%">
            <tiles:insertAttribute name="main_bottom_view"/>
         </div>
         
      </div>
      
     </div>
      
      


   </div>
   
   
</div>

</html>