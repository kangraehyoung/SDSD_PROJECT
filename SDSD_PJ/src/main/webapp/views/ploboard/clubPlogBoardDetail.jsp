<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="clubPlogBoardDetail_section">
    <div class="titleBox">
        <h2><img src="${ path }/resources/imgFile/findTeam.png" alt="trashCan">플로깅 모임 인증</h2>
    </div>

    <div class="plogBoardWrap">
        <div class="container-fluid contentContainer">
            <div class="row">
                <!-- 이미지 슬라이드 박스 -->
                <div class="col imgSlideCol">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <!-- 버튼 박스 -->
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="https://ahopsi.com/wp-content/uploads/2022/03/%EC%97%90%ED%8E%A0%ED%83%91%EA%B3%BC-%EC%9C%A0%EB%A6%AC-%ED%94%BC%EB%9D%BC%EB%AF%B8%EB%93%9C%EA%B0%80-%EB%B9%9B%EB%82%98%EB%8A%94-%E2%80%98%EB%AF%B8%EB%93%9C%EB%82%98%EC%9E%87-%EC%9D%B8-%ED%8C%8C%EB%A6%AC.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="https://ahopsi.com/wp-content/uploads/2022/03/%EC%97%90%ED%8E%A0%ED%83%91%EA%B3%BC-%EC%9C%A0%EB%A6%AC-%ED%94%BC%EB%9D%BC%EB%AF%B8%EB%93%9C%EA%B0%80-%EB%B9%9B%EB%82%98%EB%8A%94-%E2%80%98%EB%AF%B8%EB%93%9C%EB%82%98%EC%9E%87-%EC%9D%B8-%ED%8C%8C%EB%A6%AC.jpg" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>

                <!-- 인증 내용 및 댓글 창 -->
                <div class="col nameCol">
                    <!-- 닉네임 섹션 -->
                    <div class="nameContainer">
                        <div class="profileImgBox">
                            <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/01/111043065.2.jpg" alt="profileImg">
                        </div>
                        <div class="profileName">
                            <input type="text" id="WriterName" class="form-control md-2" value="닉네임 가져올 칸" style="width: 50% !important;">
                        </div>
                    </div>

                    <!-- 인증 내용 -->
                    <div class="textWrap">
                        <p>게시글 내용 들어갈 자리<br>두번째 줄</p>
                        <span class="keyword">#키워드 들어갈 자리</span><br>
                        <span class="clubName">모임 이름 :  </span>
                    </div>

                    <!-- 댓글 내용  c:if로 묶어서 처리하면 됨-->
                    <div class="commentWrap">
                        <div class="profileImgBox">
                            <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/01/111043065.2.jpg" alt="profileImg">
                        </div>
                        <div class="commentBox">
                            <p>
                                <span class="commentName">닉네임</span>
                                댓글 들어갈 자리
                                <span class="commentLike">
                                    <!-- 하트 누르기 전 -->
                                    <i class="bi bi-heart"></i>
                                    <!-- 하트 누른 후 -->
                                    <i class="bi bi-heart-fill"></i>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div class="commentWrap">
                        <div class="profileImgBox">
                            <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/01/111043065.2.jpg" alt="profileImg">
                        </div>
                        <div class="commentBox">
                            <p>
                                <span class="commentName">닉네임</span>
                                댓글 들어갈 자리
                                <span class="commentLike">
                                    <!-- 하트 누르기 전 -->
                                    <i class="bi bi-heart"></i>
                                    <!-- 하트 누른 후 -->
                                    <i class="bi bi-heart-fill"></i>
                                </span>
                            </p>
                        </div>
                    </div>

                    <!-- 좋댓공저 아이콘 -->
                    <div class="iconContainer">
                        <div class="iconBox">
                            <i class="bi bi-heart"></i>
                            <i class="bi bi-chat"></i>
                            <i class="bi bi-share"></i>
                            <i class="bi bi-bookmark-heart"></i>
                        </div>

                        <div class="textBox">
                            <p>
                                <span class="likeCount">좋아요 27개</span>
                                <span class="timeInfo">작성 시간</span>
                            </p>
                        </div>
                    </div>

                    <!-- 댓글 입력창 -->
                    <div class="inputCommentWrap input-group mb-3">
                        <input type="text" class="form-control" placeholder="댓글을 입력해주세요">
                        <button class="btn btn-outline-primary" type="button" id="button-addon2">작성</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row plogBoardButtonWrap">
        <!-- 이전 게시글 버튼 -->
        <div class="col prevBtnBox">
            <button id="btnBeforePage"><i class="bi bi-chevron-left"> </i>이전</i></button>
        </div>
        <!-- 게시글 수정/삭제 버튼 -->
        <div class="col boardBtnBox">
            <button id="btnUpdate">수정 <i class="bi bi-pencil-square"></i></button>
            <button id="btnDelete" class="delete">삭제 <i class="bi bi-trash3"></i></button>
        </div>
        <!-- 다음 게시글 버튼 -->
        <div class="col nextBtnBox">
            <button id="btnNextPage">다음 <i class="bi bi-chevron-right"></i></button>
        </div>
    </div>
</section>

<!-- 상세페이지 스크립트 구현 -->
<script type="text/javascript">
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			location.replace("${path}//groupboard/groupDelete?groupBorNo=${groupBoard.groupBorNo}");
		})
		
		$("#btnUpdate").on("click", () => {
			location.replace("${path}/groupboard/groupUpdate?groupBorNo=${groupBoard.groupBorNo}");
		})
		$("#btnBeforePage").on("click", () => {
			location.replace("${path}/groupboard/detail?groupBorNo=${contentInfo.prevContent}");
		})
		$("#btnNextPage").on("click", () => {
			location.replace("${path}/groupboard/detail?groupBorNo=${contentInfo.nextContent}");
		})
	});
</script>

<jsp:include page="/views/common/footer.jsp" />