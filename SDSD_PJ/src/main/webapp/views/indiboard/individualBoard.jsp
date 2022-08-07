<%@page import="com.sdsd.mvc.indiboard.model.vo.IndiBoard"%>
<%@page import="java.util.List"%>
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
                    <a href="${ path }/member/myPage">마이 페이지</a>
                </div>
                <div class="menuList"><a href="${ path }/member/myActivity">나의 활동</a></div>
                <div class="menuList">
                    <span><img src="${ path }/resources/imgFile/checkblue_icon.png"></span>
                    <a href="${ path }/indiboard/indilist" style="font-weight: bold;">개인 플로깅 인증</a>
                </div>
            </div>
        </div>
        <div class="contentBox">
            <div class="head_title2"> <!-- 요소 모음 div -->
                <div class="ht_search2">
                    <form class="ht_12" action="${ path }/indiboard/indikeysearch" method="get">
                        <div class="ht_22">
                            <input type="text" name="indiketword">
                            <button type="submit">
                                <img src="${ path }/resources/imgFile/searchIcon_03.png" alt="search">
                            </button>
                        </div>
                    </form>
                </div>
                <div class="ht_keyword2">
                    <div><p>추천 키워드</p></div>
                    <div class="ht_hash2">
                        <a href="${ path }/indiboard/indikeysearch?indiketword=강남구">#강남구</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="${ path }/indiboard/indikeysearch?indiketword=경기도">#경기도</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="${ path }/indiboard/indikeysearch?indiketword=20대">#20대</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="${ path }/indiboard/indikeysearch?indiketword=한강">#한강</a>
                    </div>
                    <div class="ht_hash2">
                        <a href="${ path }/indiboard/indikeysearch?indiketword=남산">#남산</a>
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
        <%
        List<IndiBoard> list = (List<IndiBoard>)request.getAttribute("indiboardlist"); 
        System.out.println("List!!!! : " + list);
        %>
        <div class="row plogBoard_Container">
			<c:forEach var="indiboard" items="${ indiboardlist }">
            <!-- 인증 게시글 1개 당 한 div -->
            <div class="col-md-3 boardImgBox" onclick="location.href='${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}'">
            	<c:if test="${indiboard.borFileList[0] != 'null'}">
                	<img src="${path }/resources/upload/board/${indiboard.borFileList[0]}">
                </c:if>
            	<c:if test="${indiboard.borFileList[0] == 'null'}">
                	<img src="${path }/resources/upload/board/xsymbol.png">
                </c:if>
                <div class="hoverBox">
                    <div class="hb_lc">
                        <!-- 부트스트랩 하트 -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                        </svg>
                        <div class="hb_like">27</div>
                        <!-- 부트스트랩 댓글 -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
                        </svg>
                        <div class="hb_coment">15</div>
                    </div>
                    <a href="${ path }/indiboard/detail?maBorNo=${indiboard.maBorNo}">자세히 보기</a>
                </div>
            </div>
			</c:forEach>
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

<jsp:include page="/views/common/footer.jsp" />