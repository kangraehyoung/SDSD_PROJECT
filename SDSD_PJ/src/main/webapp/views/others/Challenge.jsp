<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
	
	<section class="Challenge">

        <div class="first_tool"> <!-- 첫번째 하늘색 틀-->
            <div class="c_head">
                <div class="c_title">
                    <div class="ct_1">
                        <h1>
                            챌린지
                            <img src="${ path }/resources/imgFile/dizzy.png" alt="dizzy" style="width: 40px;">
                        </h1>
                    </div>
                    <div class="ct_2">
                        <p>
                            건강과 지구를 위해 플로깅 외에도<br>
                            무엇을 할 수 있을까요?🤷<br>
                            저희가 소개해드릴게요!😎
                        </p>
                    </div>
                </div>
                <div class="c_emoji">
                    <img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/four-leaf-clover_1f340.png" alt="네잎클로버">
                </div>
            </div>
        </div>
        <div class="second_tool">
            <div class="c_content">
                <div class="c_maincard">
                    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <a href="https://blog.lotte.co.kr/37968"><img src="https://lotteblog.s3.ap-northeast-2.amazonaws.com/wp-content/uploads/2020/06/KakaoTalk_20200610_102040743.png" class="d-block w-100" alt="..."></a>
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>1일 1그린</h5>
                                    <p>나와의 약속이자 나만의 루틴을 SNS에서 인증</p>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <a href="https://www.laneige.com/kr/ko/brand/hug-campaign/index.html"><img src="https://image.edaily.co.kr/images/photo/files/NP/S/2022/07/PS22071500206.jpg" class="d-block w-100" alt="..."></a>
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>허그 캠페인</h5>
                                    <p>글로벌 뷰티브랜드 라네즈가 허그 캠페인을 전개한다.</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <a href="https://www.igloo.co.kr/"><img src="http://www.boannews.com/media/upFiles2/2022/05/300003288_2757.jpg" class="d-block w-100" alt="..."></a>
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>고고 챌린지</h5>
                                    <p>일상에서 실천 가능한 환경보호 방법 소개</p>
                                </div>
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="c_subcard">
                    <div class="cs_1">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <div class="col">
                                <div class="card h-100">
                                    <a href="https://familyseoul.or.kr/node/13323#mobile_menu"><img src="https://familyseoul.or.kr/sites/default/files/wysiwyg/001_19.png" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">에코 싱글즈</h6> <br><br><br>
                                        <a href="https://familyseoul.or.kr/node/13323#mobile_menu">바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="http://www.yes24.com/Product/Goods/99955856"><img src="https://image.yes24.com/goods/99955856/XL" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">1일 1환경 챌린지!</h6> <br><br><br>
                                        <a href="http://www.yes24.com/Product/Goods/99955856">바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="https://www.korea.kr/news/visualNewsView.do?newsId=148889221"><img src="https://www.korea.kr/newsWeb/resources/attaches/2021.06/25/c6cb2a755ceb9229e276abe30f666c05.jpg" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">환경 보호 챌린지</h6> <br><br><br>
                                        <a href="https://www.korea.kr/news/visualNewsView.do?newsId=148889221">바로가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cs_2">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <div class="col">
                                <div class="card h-100">
                                    <a href="https://www.eco.or.kr/activity/?q=YToyOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjtzOjQ6InBhZ2UiO2k6MTM7fQ%3D%3D&bmode=view&idx=8458071&t=board"><img src="https://cdn.imweb.me/upload/S202105036f28b062b0a26/8042c27af0d32.jpeg" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">거꾸로 챌린지</h6> <br><br><br>
                                        <a href="https://www.eco.or.kr/activity/?q=YToyOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjtzOjQ6InBhZ2UiO2k6MTM7fQ%3D%3D&bmode=view&idx=8458071&t=board">바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="http://www.me.go.kr/home/web/board/read.do?pagerOffset=20&maxPageItems=10&maxIndexPages=10&searchKey=&searchValue=&menuId=10392&orgCd=&boardId=1409070&boardMasterId=713&boardCategoryId=&decorator="><img src="http://www.me.go.kr/upload/1/editor/202011/10/20201110162311.png" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">기후행동 1.5℃</h6> <br><br><br>
                                        <a href="http://www.me.go.kr/home/web/board/read.do?pagerOffset=20&maxPageItems=10&maxIndexPages=10&searchKey=&searchValue=&menuId=10392&orgCd=&boardId=1409070&boardMasterId=713&boardCategoryId=&decorator=">바로가기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="https://magazine.hankyung.com/job-joy/article/202011038399b"><img src="https://img.hankyung.com/photo/202012/1604368951161_1.jpg" class="card-img-top" alt="..."></a>
                                    <div class="card-body">
                                        <h6 class="card-title">제로웨이스트</h6> <br><br><br>
                                        <a href="https://magazine.hankyung.com/job-joy/article/202011038399b">바로가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </section>

<jsp:include page="/views/common/footer.jsp" />