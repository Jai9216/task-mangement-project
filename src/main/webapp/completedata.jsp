<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.db.TaskDb,com.db.Task,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<Task> list1 = TaskDb.getAllRecordsC();
request.setAttribute("list",list1);
%>

<c:forEach items="${list}" var="t">
<tr>
<td>${t.getTaskname()}</td>
<td>${t.getStatus()}</td>
<td>${t.getStartdate()}</td>
<td>${t.getEnddate()}</td>
</tr>
</c:forEach>


</body>
</html>