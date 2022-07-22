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
    <link rel="stylesheet" href="${ path }/resources/css/ssp_common.css" type="text/css">
    <link rel="stylesheet" href="${ path }/resources/css/login.css" type="text/css">

    <!-- jQuery 추가 -->
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <script src="${ path }/resources/js/ssp_menu.js"></script>
    
</head>
<body>
    <section class="topMenu">
        <div class="logoBox">
            <a href="/">
                <img src="${ path }/resources/imgFile/지구아이콘.png" alt="logoBox" />
            쓰담쓰담<span>쓰레기를 담고 쓰레기를 담아!</span>
            </a>
        </div>
        <nav>
            <ul class="nav_list">
                <li class="nav_item"><a href="/introduce">소개</a></li>
                <li class="nav_item">
                    <a href="#">개인 플로깅</a>
                        <ul class="sub_item menu_01">
                            <li><a href="">마이 페이지</a></li>
                            <li><a href="">나의 활동</a></li>
                            <li><a href="">개인 플로깅 인증 게시판</a></li>
                        </ul>
                </li>
                <li class="nav_item">
                    <a href="#">모임 플로깅</a>
                        <ul class="sub_item menu_02">
                            <li><a href="">모임 찾기</a></li>
                            <li><a href="">모임 생성</a></li>
                            <li><a href="">모임 플로깅 인증 게시판</a></li>
                        </ul>
                </li>
                <li class="nav_item">
                    <a href="#">OTHERS</a>
                    <ul class="sub_item menu_03">
                        <li><a href="">랭킹</a></li>
                        <li><a href="">챌린지</a></li>
                        <li><a href="">쓰레기통 찾기</a></li>
                        <li><a href="">플로깅 코스</a></li>
                        <li><a href="">FAQ</a></li>
                    </ul>
                </li>
                <li class="loginBtn"><a href="${ path }/views/login.jsp">로그인</a></li>
                <li class="logoutBtn"><a href="">로그아웃</a></li>
            </ul>
        </nav>
    </section>