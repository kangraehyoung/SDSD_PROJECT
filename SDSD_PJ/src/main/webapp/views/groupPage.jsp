<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${ pageContext.request.contextPath }"/>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${path }/plo/groupjoin" method="POST">
		<input type="hidden" name="plo_num">
		<input name="plo_leader">
		<input name="plo_title">
		<input name="plo_intro">
		<input name="plo_memNum">
		<button type="submit">등록하기</button>
	</form>


</body>
</html>