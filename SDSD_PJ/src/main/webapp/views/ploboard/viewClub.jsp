<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="viewClub_section">
    <div class="titleBox">
        <h2>모임 상세보기</h2>
    </div>

    <div class="clubInfo_container container-fluid">
        <div class="row">
            <!-- 모임 이미지 슬라이드 -->
            <div class="col-6">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators ploClubSlide">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <img src="https://img.freepik.com/premium-vector/plogging-run-and-clean-plogging-movement-or-marathon-man-and-woman-picking-up-litter-during-plogging-in-park-or-outdoor-collect-garbage-while-running-in-flat-style_7737-2044.jpg?w=2000" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                        <img src="https://img.freepik.com/premium-vector/plogging-run-and-clean-plogging-movement-or-marathon-man-and-woman-picking-up-litter-during-plogging-in-park-or-outdoor-collect-garbage-while-running-in-flat-style_7737-2044.jpg?w=2000" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                        <img src="https://img.freepik.com/premium-vector/plogging-run-and-clean-plogging-movement-or-marathon-man-and-woman-picking-up-litter-during-plogging-in-park-or-outdoor-collect-garbage-while-running-in-flat-style_7737-2044.jpg?w=2000" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="https://img.freepik.com/premium-vector/plogging-run-and-clean-plogging-movement-or-marathon-man-and-woman-picking-up-litter-during-plogging-in-park-or-outdoor-collect-garbage-while-running-in-flat-style_7737-2044.jpg?w=2000" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button> -->
                </div>
            </div>

            <!-- 모임 정보 박스 -->
            <div class="col-6 clubInfoBox">
                <div class="titleText">
                    <p>
                        모임명
                        <!-- 좋아요 누르기 전 하트 모양 -->
                        <a href=""><i class="bi bi-heart"></i></a>
                        <!-- 좋아요 누른 후 하트 모양 -->
                        <a href="" class="pressLike"><i class="bi bi-heart-fill"></i></a>
                    </p>
            </div>

                <div class="keywordText">
                    <a href="/">#키워드1</a>
                    <a href="/">#키워드2</a>
                </div>

                <div class="clubInfoList">
                    <ul>
                        <li><span>모임 리더 :</span> </li>
                        <li><span>멤버 수 : </span> </li>
                        <li><span>활동 지역 : </span> </li>
                        <li><span>소개 : </span> </li>
                    </ul>
                </div>

                <!-- 모임 가입 안한 일반 USER가 보는 버튼 -->
                <div class="buttonBox">
                    <button>모임 가입하기</button>
                </div>
                <!-- 모임 가입한 일반 USER가 보는 버튼 -->
                <div class="buttonBox">
                    <button>모임 탈퇴하기</button>
                </div>
                <!-- 모임장이 보는 버튼 -->
                <div class="buttonBox">
                    <button>모임 정보 수정</button>
                    <button class="deleteBtn">모임 삭제하기</button>
                </div>
            </div>
        </div>
    </div>

    <div class="clubNotice_buttonBox">
        <a href="javascript:" class="selected">모임 일정</a>
        <a href="javascript:">공지사항</a>
    </div>

    <div class="clubNotice_infoBox_01">
        <div class="calendarCotainer">
            <div class="calendar">
                <div class="header">
                    <div class="year-month"></div>
                    <div class="nav">
                    <button class="nav-btn go-prev" onclick="prevMonth()"><i class="bi bi-chevron-left"></i></button>
                    <button class="nav-btn go-today" onclick="goToday()">Today</button>
                    <button class="nav-btn go-next" onclick="nextMonth()"><i class="bi bi-chevron-right"></i></button>
                </div>
                </div>
                <div class="main">
                    <div class="days">
                        <div class="day">일</div>
                        <div class="day">월</div>
                        <div class="day">화</div>
                        <div class="day">수</div>
                        <div class="day">목</div>
                        <div class="day">금</div>
                        <div class="day">토</div>
                    </div>
                    <div class="dates"></div>
                </div>
            </div>
        </div>  
    </div>
    
    <div class="clubNotice_infoBox_02">

        <div class="scheduleInfo">
            <p class="titleText">모임 공지</p>
            <ol>
                <li><span>일시 : </span></li>
                <li><span>장소 : </span></li>
                <li><span>준비물 : </span></li>
            </ol>
        </div>
    </div>
</section>




<jsp:include page="/views/common/footer.jsp" />