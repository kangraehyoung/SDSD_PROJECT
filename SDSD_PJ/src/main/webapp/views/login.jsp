<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="loginPage">
    <h2>로그인</h2>
    <hr class="hr">
    <br>
    
    <div id="login_wrap">
        <form action="${ path }/member/login" id="login_form" method="POST">
            <div id="login_form_input">
                <input name="email" type="text" placeholder="아이디" size="40%" required>
                <br>
                <input name="password" type="password" placeholder="비밀번호" size="40%" required>
            </div>
            <div id="login_form_submit">
                <input type="submit" value="LOGIN">
            </div>
        </form>
        <br><br>
        <div id="login_link">
            <a href="${ path }/views/member/findIDnPW.jsp">아이디 찾기</a>
            <a href="${ path }/views/member/findIDnPW.jsp">비밀번호 찾기</a>
            <a href="#">회원가입</a>
        </div>
    </div>

    <br>

    <h4>또는 다른 SNS 계정으로 로그인</h4>
    <hr class="hr">
    <button id="naver_login">네이버 로그인</button><br>
    <button id="kakao_login">카카오 로그인</button>
</section>

<jsp:include page="/views/common/footer.jsp" />