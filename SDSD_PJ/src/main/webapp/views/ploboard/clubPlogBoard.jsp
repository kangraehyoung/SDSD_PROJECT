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
                <button onclick="location.href='${ path }/groupboard/groupwrite'"> 모임 플로깅 인증하기 <i class="bi bi-chevron-right"></i></button>
            </div>
            <div class="col indiBoard">
                <p onclick="location.href='/'">개인 플로깅 인증 바로가기 <i class="bi bi-box-arrow-up-right"></i></p>
            </div>
        </div>
       </div>
        <!-- 
            모임 플로깅 인증 게시판 섬네일 나열 
            - 한 줄에 4장의 사진 정렬되도록 세팅
        -->
        <div class="row plogBoard_Container">

            <!-- 인증 게시글 1개 당 한 div -->
            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_01.png" alt="" class="img-fluid">

                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>

            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_02.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>
            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_03.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>

            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_04.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>

            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_05.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>

            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_06.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>
            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_07.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>
            <div class="col-md-3 boardImgBox" onclick="location.href='/'">
                <img src="${ path }/resources/imgFile/ploggingImg_08.png" alt="" class="img-fluid">
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <i class="bi bi-heart"></i>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <i class="bi bi-chat"></i>
                        <div class="hb_coment">15</div>
                    </div>
                    <a>자세히 보기</a>
                </div>
            </div>
        </div>

        <!-- page 네비게이션 -->
        <div style="margin-top: 10px;">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>




    </section>
    
    

<jsp:include page="/views/common/footer.jsp" />