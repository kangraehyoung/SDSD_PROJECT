<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sdsd.mvc.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<% Member member = (Member)request.getAttribute("members"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<div id="name"><%= member.getName()%>님의 아이디</div><br>
		<div id="email"><%= member.getEmail() %> 입니다.</div>
	</div>
</body>
</html>