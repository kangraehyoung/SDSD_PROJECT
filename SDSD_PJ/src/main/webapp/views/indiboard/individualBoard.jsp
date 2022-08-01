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
                    <span><img src="${ path }/resources/imgFile/checkIcon_mypage.png"></span>
                    <a href="javasript:" style="font-weight: bold;">개인 플로깅 인증</a>
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
                                <img src="${ path }/resources/imgFile/searchIcon_03.png" alt="search">
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
                        <button><a href="${ path }/indiboard/indiwrite">인증 게시글 작성하기!</a></button>
                    </div>
                    <div class="col2">
                        <img src="${ path }/resources/imgFile/layout.png" alt="">
                        <br>
                        <a href="">모임 플로깅 인증으로 가기!</a>
                    </div>
                </div>
            </div>
        </div>
        
        <c:if test="${empty indiboardlist}">
        <div>
        	<h2>조회된 글이 없습니다.</h2>
        </div>
        </c:if>
       
        <c:if test="${not empty indiboardlist }">
        <div class="picture">
            <div class="p1">
		        <c:forEach var="indiboard" items="${ indiboardlist }">
				 <div class="p1_1">
                    <a href="${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}">
                      <!--  <img src="https://cdn.pixabay.com/photo/2022/07/05/11/06/mountains-7302806__340.jpg" alt="">  -->  
                        <img src="${path }/resources/upload/board/${indiboard.borFile}" >
                    </a>
                    <div class="blur"><a href="${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}">자세히보기</a></div>
                </div>
            </c:forEach>
            </div>
	<!-- 
                <div class="p1_1">
                    <a href="${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}">
                        <img src="https://cdn.pixabay.com/photo/2022/07/05/11/06/mountains-7302806__340.jpg" alt="">  
                        <img src="${path }/resources/upload/board/${indiboard.borFile}" >
                    </a>
                    <div class="blur"><a href="${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}">자세히보기</a></div>
                </div>
     -->
                <!-- <div class="p1_2">
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
                </div>  -->
            
            <!-- <div class="p2">
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
            </div>  -->

       
        </div>
        </c:if>
        <div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/indiboard/indilist?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/indiboard/indilist?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button disabled>${ status.current }</button>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button onclick="location.href='${ path }/indiboard/indilist?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>


			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/indiboard/indilist?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/indiboard/indilist?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
    
    </section>

<jsp:include page="/views/common/footer.jsp" />