<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

 <section class="ploggingPerson">
        <div class="titleBox">
            <h2>개인 플로깅</h2>
            <div class="menuBox">
                <div class="menuList">
                    <a href="javasript:">마이 페이지</a>
                </div>
                <div class="menuList"><a href="javasript:">나의 활동</a></div>
                <div class="menuList">
                    <span><img src="${ path }/resources/imgFile/흠.png"></span>
                    <a href="javasript:">개인 플로깅 인증</a>
                </div>
            </div>
        </div>
        <div class="contentBox">
            <div class="head_title2"> <!-- 요소 모음 div -->
                <div class="ht_search2">
                    <form class="ht_12">
                        <div class="ht_22">
                            <input type="text">
                            <button type="submit">
                                <img src="${ path }/resources/imgFile/serachIcon_03.png" alt="search">
                            </button>
                        </div>
                    </form>
                </div>
                <div class="ht_keyword2">
                    <div><p>추천 키워드</p></div>
                    <div class="ht_hash2">
                        <a href="#">#강남구</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="#">#경기도</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="#">#20대</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="#">#한강</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="#">#남산</a>
                    </div>
                </div>
                <div class="btns">
                    <div>
                    </div>
                    <div class="col1">
                        <button><a href="">인증 게시글 작성하기!</a></button>
                    </div>
                    <div class="col2">
                        <img src="${ path }/resources/imgFile/flag.png" alt="">
                        <br>
                        <a href="">모임 플로깅 인증으로 가기!</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="picture">
            <div class="p1">
                <div class="p1_1">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/05/11/06/mountains-7302806__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p1_2">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/06/18/34/florence-7305768__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p1_3">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/24/14/12/path-7341731__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p1_4">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/15/14/36/lake-pukaki-7323302__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p1_5">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/07/07/24/clouds-7306684__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
            </div>
            <div class="p2">
                <div class="p2_1">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/07/07/24/clouds-7306684__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p2_2">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/15/14/36/lake-pukaki-7323302__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p2_3">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/06/18/34/mountains-7305769__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p2_4">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/06/18/34/florence-7305768__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
                <div class="p2_5">
                    <a href="">
                        <img src="https://cdn.pixabay.com/photo/2022/07/05/11/06/mountains-7302806__340.jpg" alt="">
                    </a>
                    <div class="blur">자세히보기</div>
                </div>
            </div>

        </div>
    
    </section>

<jsp:include page="/views/common/footer.jsp" />