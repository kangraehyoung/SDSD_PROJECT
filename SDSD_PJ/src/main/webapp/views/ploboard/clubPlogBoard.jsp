<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="clubPlogBoard_section">

    <div class="first_tool" style="padding: 80px 0 50px 0 !important; border-bottom: none !important;"> <!-- 첫번째 하늘색 틀-->
        <div class="head_title"> <!-- 요소 모음 div -->
            <div class="main_text"> <!-- 텍스트 div -->
                <div class="titleTextBox">
                    <h2><img src="${ path }/resources/imgFile/findTeam.png" alt="trashCan">플로깅 모임 인증</h2>
                    <!-- <p>지역, 모임 특징 등 키워드를 검색해 원하는 모임에 합류해보세요!</p> -->
                </div>
            </div>
            <div class="ht_search">
                <form class="ht_1">
                    <div class="ht_2">
                        <input type="text">
                        <button type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="ht_keyword">
                <div><p>추천 키워드</p></div>
                <div class="ht_hash">
                    <a href="#">#강남구</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#경기도</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#20대</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#한강</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#남산</a>
                </div>
            </div>
        </div>
        
        <div class="row buttonBox">
            <div class="col"></div>
            <div class="col boardBtn">
                <button>모임 플로깅 인증하기 <i class="bi bi-chevron-right"></i></button>
            </div>
            <div class="col indiBoard">
                <p onclick="location.href='/'">개인 플로깅 인증 바로가기 <i class="bi bi-box-arrow-up-right"></i></p>
            </div>
        </div>
    </div>
    
    

<jsp:include page="/views/common/footer.jsp" />