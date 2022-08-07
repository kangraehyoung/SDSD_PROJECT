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
                <a href="javasript:">마이 페이지</a>
            </div>
            <div class="menuList"><a href="javasript:">나의 활동</a></div>
            <div class="menuList">
                <span><img src="${ path }/resources/imgFile/checkblue_icon.png" alt="Check Icon"></span>
                <a href="javasript:" style="font-weight: bold;">개인 플로깅 인증</a>
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
		</div>
    </div>
    
     <%
     	IndiBoard indiBoard = (IndiBoard)request.getAttribute("indiBoard");
        System.out.println("st!!!! : " + indiBoard);
        %>
    <div class="boardBox"> <!-- 세번째 부분 게시글 -->
      <div class="bb_imgs"> <!-- 사진 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
            <c:if test="${indiBoard.borFileList[0] != 'null'}">
              <img src="${path }/resources/upload/board/${indiBoard.borFileList[0]}" class="d-block w-100" alt="...">
            </c:if>
            <c:if test="${indiBoard.borFileList[0] == 'null'}">
              <img src="${path }/resources/upload/board/xsymbol.png" class="d-block w-100" alt="...">
            </c:if>
            </div>
            <div class="carousel-item">
            <c:if test="${indiBoard.borFileList[1] != 'null'}">
              <img src="${path }/resources/upload/board/${indiBoard.borFileList[1]}" class="d-block w-100" alt="...">
            </c:if>
            <c:if test="${indiBoard.borFileList[1] == 'null'}">
              <img src="${path }/resources/upload/board/xsymbol.png" class="d-block w-100" alt="...">
            </c:if>
            </div>
            <div class="carousel-item">
             <c:if test="${indiBoard.borFileList[2] != 'null'}">
              <img src="${path }/resources/upload/board/${indiBoard.borFileList[2]}" class="d-block w-100" alt="...">
            </c:if>
            <c:if test="${indiBoard.borFileList[2] == 'null'}">
              <img src="${path }/resources/upload/board/xsymbol.png" class="d-block w-100" alt="...">
            </c:if>
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
      <div class="bb_board"> <!-- 게시글 -->
        <div class="bbb_1">
          <div class="bbb_1_profile_img">
             <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjJfNCAg%2FMDAxNjU4NDU4NjY0NjY2.1XkvhsTxYYo8SQkD56GhVIRpSHwBZZjyH6JJ4o-bWDYg.jQd-dN1ab388dGG9iA2yBxfH0w0vzBO4s_0XIIO_0Xgg.JPEG.ymtlfet%2FIMG_7509.jpg&type=a340" alt="">  
          </div>
          <div class="bbb_nickName">
            <p>${indiBoard.writerName}</p>
          </div>
        </div>
        <div class="bbb_2">
          <div class="bbb_textBox">
            ${indiBoard.borContent } 
            <br>
            <span>#${indiBoard.indikeyword }</span>
          </div>
        </div>

        <div class="bbb_3" style="border: none;"> <!-- 댓글 -->
        <form action="${ path }/indiboard/indireplydelete" method="get">
        
   
        
        <c:forEach var="reply" items="${ indiBoard.replies }">
        <input type="hidden" value="${ indiBoard.maBorNo }" name="maBorNo">
        <input type="hidden" value="${ reply.no }" name="no">
          <div class="bbb_comentBox">
            <div class="bbb_1_profile_img">
              <img src="https://search.pstatic.net/sunny/?src=http%3A%2F%2Ffile3.instiz.net%2Fdata%2Fcached_img%2Fupload%2F2019%2F11%2F05%2F19%2Fa154febe3a793e3e96c3bfd6dc9b7bfc.jpg&type=a340" alt="">
            </div>
            <div class="bbb_Nickname">
              <!--  <p>${ reply.repwriterId }</p> -->
              <sub><c:out value="${ reply.repwriterId }"/></sub>
            </div>
            <div class="bbb_coment">
              <sub><c:out value="${ reply.repcontent }"/></sub>
              	
              	<c:if test="${reply.repwriterId eq loginMember.nickName }">
              	<button id="btnReplyDelete" type="submit">삭제</button>
              	</c:if>
            </div>
            <div>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
              </svg>
            </div>
          </div>
         </c:forEach>
         </form>
         </div>
     
        <div class="bbb_4">
          <div class="bbb4_icon">
            <!-- 부트스트랩 하트 -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
              <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
            </svg>
            <!-- 부트스트랩 댓글 -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
              <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
            </svg>
            <!-- 부트스트랩 공유 -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
              <path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"/>
            </svg>
            <!-- 부트스트랩 북마크 -->
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
              <path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
              <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
            </svg>
          </div>
          <div class="bbb4_liketime">
            <div class="bbb4_like">
			  <p>이 게시글을 ${indiBoard.readCount } 명이 봤어요! </p>
              <p>좋아요 <span>27</span>개</p>
            </div>
            <div class="bbb4_time">
              <p>${indiBoard.updateDate }</p>
            </div>
          </div>
        </div>
        <div class="bbb_5">
        <form action="${ path }/indiboard/indireply" method="post">
          <div class="bbb5_input">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
              <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
              <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
            </svg>
            	<div class="input-group mb-3">
              		<input name="repcontent" type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" style="border: none;">
              		<button class="btn btn-outline-secondary" type="submit" id="button-addon2">작성</button>
            		<input type="hidden" name="repboardNo" value="${ indiBoard.maBorNo }">
            	</div>
         	 </div>
         </form>
        </div>
      </div>
    </div>
    <!-- 마지막 버튼 -->
    <div class="buttonBox_D">
      <div>
        <button class="btnprev" id="btnBeforePage">이전</button>
        <button class="btnprev" id="btnDelete">삭제</button>
        <button class="btnprev" id="btnUpdate">수정</button>
        <button class="btnnext" id="btnNextPage">다음</button>
      </div>
    </div>
</section>

<script type="text/javascript">
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			location.replace("${path}/indiboard/indidelete?maBorNo=${indiBoard.maBorNo}");
		})
		
		$("#btnUpdate").on("click", () => {
			location.replace("${path}/indiboard/indiUpdate?maBorNo=${indiBoard.maBorNo}");
		})
		$("#btnBeforePage").on("click", () => {
			location.replace("${path}/indiboard/detail?maBorNo=${contentInfo.prevContent}");
		})
		$("#btnNextPage").on("click", () => {
			location.replace("${path}/indiboard/detail?maBorNo=${contentInfo.nextContent}");
		})
	});
</script>


<jsp:include page="/views/common/footer.jsp" />