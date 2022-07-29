<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="loginPage">
   <h2>로그인</h2>
   
   <div class="loginBox">
       <form action="${ path }/member/login" id="login_form" method="POST">
           <div class="inputBox">
               <input name="email" type="text" placeholder="아이디" size="40%" required>
               <br>
               <input name="password" type="password" placeholder="비밀번호" size="40%" required>
           </div>
           <button id="loginBtn">
               <div class="btnWrap_text">
                   <span>LOGIN</span>
               </div>
           </button>
       </form>
       <div class="loginLinkBox">
           <a href="${ path }/views/member/findIDnPW.jsp">아이디 찾기</a>
           <div class="vLine">
               <span>|</span>
           </div>
           <a href="${ path }/views/member/findIDnPW.jsp">비밀번호 찾기</a>
           <div class="vLine">
               <span>|</span>
           </div>
           <a href="${ path }/member/joinSelect">회원가입</a>
       </div>
   </div>

   <br>

   <div class="snsLoginBox">
       <h3>또는 다른 SNS 계정으로 가입하기</h3>
       <button id="naverLogin">
               <div class="btnWrap_img">
                   <img src="https://rankingmarathon.com/images/Logo/naver-30.png" alt="네이버로그인">
               </div>
               <div class="btnWrap_text">
                   <span>네이버로 시작하기</span>
               </div>
           </button>
           <button id="kakaoLogin">
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