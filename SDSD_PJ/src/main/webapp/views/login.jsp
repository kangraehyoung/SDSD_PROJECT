<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <jsp:include page="/views/common/header.jsp" />

    <h2>로그인</h2>
    <hr class="hr">
    <br>
    
    <div id="login_wrap">
        <form id="login_form">
            <div id="login_form_input">
                <input type="text" placeholder="아이디" size="40%" required>
                <br>
                <input type="password" placeholder="비밀번호" size="40%" required>
            </div>
            <div id="login_form_submit">
                <input type="submit" value="LOGIN">
            </div>
        </form>
        <br><br>
        <div id="login_link">
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 찾기</a>
            <a href="#">회원가입</a>
        </div>
    </div>

    <br>

    <h4>또는 다른 SNS 계정으로 로그인</h4>
    <hr class="hr">
    <button id="naver_login">네이버 로그인</button><br>
    <button id="kakao_login">카카오 로그인</button>

 <jsp:include page="/views/common/footer.jsp" />