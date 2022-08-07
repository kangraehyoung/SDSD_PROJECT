<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="joincb">
    <div class="second_tool"> <!-- 두번째 하늘색 틀 -->
        <div class="row">
            <div class="col-md-5 iconBox">
                <img src="${ path }/resources/imgFile/party-popper_Icon.png" alt="">
            </div>
            <div class="col-md-7 textBox">
                <p>
                    가입을 축하드립니다! <span><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/twitter/322/winking-face_1f609.png" alt=""></span>
                </p>
                </div>
        </div>
        <div class="st_textBox"> <!-- 문자 박스 -->
            <div class="stt_1">
                <span>지구</span>도
            </div>
            <div class="stt_2">
                <span>건강</span>도
            </div>
            <div class="stt_3">
                지킬<span>준비</span>!
            </div>
            <div class="stt_icon">
                <img src="${ path }/resources/imgFile/지구아이콘2.png" alt="earthIcon">
            </div>
            <div class="stt_4">
                되셨나요?
            </div>
            <div class="stt_5">
                그렇다면
            </div>
        </div>

        <div class="buttonContainer">
            <!-- <p>주변에 모임을 홍보해보세요!</p> -->
    
            <div class="buttonBox">
            		
                    <button class="gotoMain" onclick="location.href='${path}/'">메인페이지 바로가기 <i class="bi bi-house-door"></i></button>
                    <button onclick="location.href='${path}/member/login'">마이페이지 바로가기 <i class="bi bi-people"></i></button>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/views/common/footer.jsp" />