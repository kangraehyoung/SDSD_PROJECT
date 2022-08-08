<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쓰담쓰담</title>
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_common.css?v0.0.10" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_loginPage.css?v0.0.4" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_mainPage.css?v0.1.05" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_joinPage.css?v0.0.6" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_faq.css?v0.0.10" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_joinCelebrate.css?v0.0.5" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_tc_pc.css?v0.0.5" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_mypage.css?v0.0.15" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_club.css?v0.2.04" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_tc_pc.css?v0.0.2" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_mypage.css?v0.0.5" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_IindividualBoard.css?v0.0.8" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_My_Activity.css?v0.0.4" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_Ranking.css?v0.0.2" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_Challenge.css?v0.0.2" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_IntroPage.css?v0.0.5" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/sdsd_plogCourse.css?v0.0.8" type="text/css">
    
    <!-- 부트스트랩 및 라이브러리 -->
    <link rel="stylesheet" href="${ path }/resources/css/animationLib.css?v0.0.1" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- jQuery 추가 -->
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <script src="${ path }/resources/js/ssp_menu.js"></script>
    <script src="${ path }/resources/js/FAQ_Accodion.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=334344dce2f2aee24efdae6872bcd47a&libraries=services"></script>
    
</head>
<body>
	<header class="topMenu_Container">
	    <section class="topMenu">
	        <div class="logoBox">
	            <a href="${path }/">
	                <img src="${ path }/resources/imgFile/지구아이콘2.png" alt="logoBox" />
	            쓰담쓰담<span>쓰레기를 담고 쓰레기를 담아!</span>
	            </a>
	        </div>
	        <nav>
	            <ul class="nav_list">
	                <li class="nav_item"><a href="${ path }/introduce">소개</a></li>
	                <li class="nav_item">
	                    <a href="#">개인 플로깅</a>
	                        <ul class="sub_item menu_01">
	                            <c:if test="${not empty loginMember }">
	                            <li><a href="${ path }/member/myPage">마이 페이지</a></li>
	                            <li><a href="${ path }/member/myActivity">나의 활동</a></li>
	                            </c:if>
	                            <c:if test="${empty loginMember }">
	                            <li><a href="${path }/member/login" id="logincheck">마이 페이지</a></li>
	                            <li><a href="${path }/member/login" id="logincheck2">나의 활동</a></li>
	                            </c:if>
	                            <li><a href="${ path }/indiboard/indilist">개인 플로깅 인증 게시판</a></li>
	                        </ul>
	                </li>
	                <li class="nav_item">
	                    <a href="#">모임 플로깅</a>
	                        <ul class="sub_item menu_02">
	                            <li><a href="${ path }/ploboard/ploGroupList">모임 찾기</a></li>
	                            <li><a href="${ path }/plogroup/createPloGroup">모임 생성</a></li>
	                            <li><a href="${ path }/groupboard/grouplist">모임 플로깅 인증 게시판</a></li>
	                        </ul>
	                </li>
	                <li class="nav_item">
	                    <a href="#">OTHERS</a>
	                    <ul class="sub_item menu_03">
	                        <li><a href="${ path }/others/ranking">랭킹</a></li>
	                        <li><a href="${ path }/other/challenge">챌린지</a></li>
	                        <li><a href="${ path }/others/trash">쓰레기통 찾기</a></li>
	                        <li><a href="${ path }/others/course">플로깅 코스</a></li>
	                        <li><a href="${ path }/other/faq">FAQ</a></li>
	                    </ul>
	                </li>
	                <c:if test="${empty loginMember}">
	                <li class="loginBtn">
	                    <a href="${ path }/member/login">로그인</a>
	                </li>
	                </c:if>
	                <c:if test="${not empty loginMember}">
	                <li class="logoutBtn">
	                    <a href="${ path }/logout">로그아웃</a>
	                </li>
	                </c:if>
	            </ul>
	        </nav>
	    </section>
    </header>
<script>
	// 마이페이지 클릭시 로그인 확인
	$(document).ready(() => {
		$("#logincheck").on("click", () => {
			alert("로그인 시 이용 가능합니다.");
		});
		$("#logincheck2").on("click", () => {
			alert("로그인 시 이용 가능합니다.");
		});
	});
</script>