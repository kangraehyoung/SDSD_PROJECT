<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="findClub_section">

    <div class="first_tool" style="padding: 80px 0 50px 0 !important; border-bottom: none !important;"> <!-- 첫번째 하늘색 틀-->
        <div class="head_title"> <!-- 요소 모음 div -->
            <div class="main_text"> <!-- 텍스트 div -->
                <div class="titleTextBox">
                    <h2><img src="${ path }/resources/imgFile/findTeam.png" alt="trashCan">플로깅 모임 찾기</h2>
                    <p>지역, 모임 특징 등 키워드를 검색해 원하는 모임에 합류해보세요!</p>
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
        
        <div class="buttonBox">
        	<c:if test="${not empty loginMember }">
	            <button id="createClub">모임 만들기</button>
        	</c:if>
        	<c:if test="${ empty loginMember }">
	            <button id="createClub2">모임 만들기</button>
        	</c:if>
        	
        	<c:if test="${not empty loginMember }">
            	<button id="viewJoinedClub">가입한 모임 바로가기</button>
        	</c:if>
        	<c:if test="${ empty loginMember }">
            	<button id="viewJoinedClub2">가입한 모임 바로가기</button>
        	</c:if>
        </div>
    </div>


    <div class="contentWrap">
        <div class="contentBody">
            <!-- 첫번째 줄  1번째 모임 -->
            <c:forEach var="ploGroup" items="${ ploGroupList }">
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='${ path }/ploboard/findDetail?ploGrNo=${ploGroup.spBorNum }'">
                    <img src="${path }/resources/upload/board/${ploGroup.spbBorFile}" alt="img">
                    <div class="hoverBox">
                        <p>리더 | ${ PloGroup.spbWriterName }</p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
    
    <!-- page 네비게이션 -->
        <div style="margin-top: 10px;">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="${ path }/indiboard/indilist?page=${ pageInfo.prevPage }" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
                    <li class="page-item"><a class="page-link" href="${ path }/indiboard/indilist?page=${ status.current }">${ status.current }</a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="${ path }/indiboard/indilist?page=${ pageInfo.nextPage }" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    
</section>
<script>
	// 모임만들기 클릭시 로그인 확인
	$(document).ready(() => {
		$("#createClub2").on("click", () => {
			alert("로그인 시 이용 가능합니다.");
		});
		$("#viewJoinedClub2").on("click", () => {
			alert("로그인 시 이용 가능합니다.");
		});
		$("#createClub").on("click", () => {
			location.replace("${path}/plogroup/createPloGroup");
		});
	});
</script>

<jsp:include page="/views/common/footer.jsp" />