<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.db.TaskDb"%>
<jsp:useBean id="t" class="com.db.Task"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>
<%
int i = TaskDb.save(t);
if(i>0){
	response.sendRedirect("index.jsp");
}else{
	out.print(i);
	response.sendRedirect("adduser-error.jsp");
}
%>