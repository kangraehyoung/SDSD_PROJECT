<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

    <div class="first_tool"> <!-- 첫번째 민트색 틀-->
        <div class="icon"> <!-- 아이콘 -->
            <img src="${ path }/resources/imgFile/축하2.gif" class="celebrate" alt="celebrate">
        </div> 
        <div class="maintitle1">
            <h3>쓰담쓰담</h3> 
        </div> <!-- 쓰담쓰담 -->
        <br>
        <div class="maintitle2">
            <h3>회원 가입을 축하드립니다! &nbsp;<span><img src="${ path }/resources/imgFile/winking-face_1f609.png"></span></h3>
        </div> <!-- 회원 가입을 축하드립니다! -->
    </div>

    <div class="second_tool"> <!-- 두번째 하늘색 틀 -->
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

        <div class="third_tool">
            <div class="th_search"> <!-- 첫번째 버튼 -->
                <img src="${ path }/resources/imgFile/검색.png" alt="search">
                <a href="#" class="search1">플로깅 모임 검색</a>
            </div>
            <div class="th_home"> <!-- 두번째 버튼 -->
                <img src="${ path }/resources/imgFile/홈으로.png" alt="home">
                <a href="${ path }/views/login.jsp" class="home">홈으로</a>
            </div>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp" />