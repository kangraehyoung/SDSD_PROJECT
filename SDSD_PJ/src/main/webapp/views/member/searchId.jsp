<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sdsd.mvc.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin : 0 auto;
		padding : 0;
	}
	#button{
		margin-left : 70px;
		margin-top : 20px;
	}
	#userName{
		color:#1f4e5f;
		text-align : center;
		font-size:15px;
	}
	#userId{
		text-align : center;
	}
</style>
</head>
	<body>
		<div class="wrap">
		<div id="userName">님의 아이디</div><br>
		<div id="userId">입니다.</div>
		</div>
	</body>
</html>