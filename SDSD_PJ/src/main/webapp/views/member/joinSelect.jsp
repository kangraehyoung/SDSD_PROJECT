<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<!-- 참고 사이트 : https://rankingmarathon.com/register -->
<section class="joinSelect">
    <h2>회원가입</h2>
    <div class="joinBox_01">
            <div class="btnBox_01">
                <a href="${ path }/member/agreePage" class="enrollBtn">쓰담쓰담 회원가입 하기!</a>
                <div class="btnBox_02">
                    <span>이미 쓰담쓰담 회원이신가요?</span>
                <a href="${ path }/member/login" class="loginBtn">로그인하기</a>
                </div>
            </div>
        <br><br>
    </div>

    <br>
    <div class="joinBox_02">
        <h3>또는 다른 SNS 계정으로 가입하기</h3>
            <button id="naverEnroll">
                <div class="btnWrap_img">
                    <img src="https://rankingmarathon.com/images/Logo/naver-30.png" alt="네이버로그인">
                </div>
                <div class="btnWrap_text">
                    <span>네이버로 시작하기</span>
                </div>
            </button>
            <button id="kakaoEnroll">
                <div class="btnWrap_img">
                    <img src="https://rankingmarathon.com/images/Logo/kakao25.png" alt="카카오로 시작하기">
                </div>
                <div class="btnWrap_text">
                    <span>카카오로 시작하기</span>
                </div>
            </button>
        </div>
</section>

<jsp:include page="/views/common/footer.jsp" />