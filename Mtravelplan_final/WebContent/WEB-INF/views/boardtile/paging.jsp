<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="base.util.StringUtil"%>
<%
	int totalRecordCount	= StringUtil.stringToInt(request.getParameter("totalRecordCount"));
	int pageNumber			= StringUtil.stringToInt(request.getParameter("pageNumber"));
	int pageCountPerScreen	= StringUtil.stringToInt(request.getParameter("pageCountPerScreen"));
	int recordCountPerPage	= StringUtil.stringToInt(request.getParameter("recordCountPerPage"));
	
	int totalPageCount = totalRecordCount / recordCountPerPage;
	
	if ((totalRecordCount % recordCountPerPage) != 0) {
		totalPageCount++;
	}
	
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	
	if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;
	
	if (((pageNumber+1) % pageCountPerScreen) == 0)
	{
	    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	    screenEndPageIndex = pageNumber+1;
	}
%>
			<div style="float:left; width:96%; text-align:center;"> 
				<a href="#none" title="처음페이지" onclick="goPage('0');"><img src="<%=application.getContextPath()%>/image/arrow_first.gif" alt="처음페이지" style="width:9px; height:9px;"/></a>&nbsp;		
		    <%
		    	if (screenStartPageIndex > 1)
		    	{
		    %>
		        	<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1%>');"><img src="<%=application.getContextPath()%>/image/arrow_prev.gif" alt="이전페이지" style="width:9px; height:9px;"/></a>&nbsp;	
			<%
				}
		    	
		    	for (int i=screenStartPageIndex; i<screenEndPageIndex ;i++)
		    	{
		    		if (i==pageNumber)
		    		{
		    %>	
		                <span style="font-size:9pt; color:#000000; font-weight:bold;"><%=i+1%></span>&nbsp;
		    <% 
		    		} else { 
		    %>	
		                <a href="#none" title="<%=i+1%>페이지" onclick="goPage('<%=i%>');" style="font-size:7.5pt; color:#000000; font-weight:normal;"><%=i+1%></a>&nbsp;
		    <%		}
		    		
		    	}
		    	
		    	if (screenEndPageIndex < totalPageCount)
		    	{
		    %>	
		            <a href="#none" title="다음페이지" onclick="goPage('<%=screenEndPageIndex %>');"><img src="<%=application.getContextPath()%>/image/arrow_next.gif" alt="다음페이지" style="width:9px; height:9px;"/></a>&nbsp;
		    <%
		    	} // end if
		    
			    int end_page = 0;
			    if (totalPageCount > 0)
			    {
			        end_page = totalPageCount - 1;
			    }
		    %>
		        	<a href="#none" title="마지막페이지" onclick="goPage('<%=end_page %>');" ><img src="<%=application.getContextPath()%>/image/arrow_end.gif" alt="마지막페이지" style="width:9px; height:9px;" /></a>
			</div>		
			<div style="float:left; width:4%; text-align:center;">		
		  		<span style="font-size:1em; color:#000000;"><%=pageNumber+1%>/<%=totalPageCount%></span>		
		 	</div>