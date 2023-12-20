<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.db.TaskDb"%>
<jsp:useBean id="t" class="com.db.Task">
	<jsp:setProperty name="t" property="*" />
</jsp:useBean>

<%
out.println(t.getId());
out.println(t.getStartdate());
out.println(t.getEnddate());
out.println(t.getSimlink());
out.println(t.getTaskname());
int i = TaskDb.update(t);
response.sendRedirect("index.jsp");
%>
