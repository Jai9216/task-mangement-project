<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.db.TaskDb"%>
<jsp:useBean id="t2" class="com.db.Task">
	<jsp:setProperty name="t2" property="*" />
</jsp:useBean>

<%
out.println(t2.getId());

out.println(t2.getDeletemessage());
out.print("id "+request.getParameter("id"));
out.print("id "+request.getParameter("deletemessage"));
int i = TaskDb.delete(t2);
response.sendRedirect("index.jsp");
%>
