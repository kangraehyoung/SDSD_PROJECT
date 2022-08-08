<%@page import="com.sdsd.mvc.member.model.vo.Member"%>
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
	                        <c:if test="${ ploGroup.spbFileList[0] != 'null'}">
	                        	<img src="${path }/resources/upload/board/${ploGroup.spbFileList[0]}" class="d-block w-100" alt="...">
		                    </c:if>
							<c:if test="${ploGroup.spbFileList[0] == 'null' }">
		                    	<img src="${path }/resources/upload/board/xsymbol.png" alt="img">
	                   	    </c:if>
                        </div>
                        <div class="carousel-item">
	                        <c:if test="${ ploGroup.spbFileList[1] != 'null'}">
	                      	  <img src="${path }/resources/upload/board/${ploGroup.spbFileList[1]}" class="d-block w-100" alt="...">
		                    </c:if>
		                    <c:if test="${ploGroup.spbFileList[1] == 'null' }">
		                 	   <img src="${path }/resources/upload/board/xsymbol.png" alt="img">
	                   	    </c:if>
                        </div>
                        <div class="carousel-item">
	                        <c:if test="${ ploGroup.spbFileList[2] != 'null'}">
	                        	<img src="${path }/resources/upload/board/${ploGroup.spbFileList[2]}" class="d-block w-100" alt="...">
		                    </c:if>
		                    <c:if test="${ploGroup.spbFileList[2] == 'null' }">
		                    	<img src="${path }/resources/upload/board/xsymbol.png" alt="img">
	                   	    </c:if>
                        </div>
                        <div class="carousel-item">
	                        <c:if test="${ ploGroup.spbFileList[3] != 'null'}">
	                        	<img src="${path }/resources/upload/board/${ploGroup.spbFileList[3]}" class="d-block w-100" alt="...">
		                    </c:if>
		                    <c:if test="${ploGroup.spbFileList[3] == 'null' }">
		                    	<img src="${path }/resources/upload/board/xsymbol.png" alt="img">
	                   	    </c:if>
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
                        ${ploGroup.plogGroupName }
                        <!-- 좋아요 누르기 전 하트 모양 -->
                        <a href=""><i class="bi bi-heart"></i></a>
                        <!-- 좋아요 누른 후 하트 모양 -->
                        <a href="" class="pressLike"><i class="bi bi-heart-fill"></i></a>
                    </p>
            </div>


                <div class="clubInfoList">
                    <ul>
                        <li><span>모임 리더 : ${ploGroup.spbWriterName }</span> </li>
                        <li><span>멤버 수 : </span> </li>
                        <li><span>활동 지역 : ${ploGroup.address }</span> </li>
                        <li><span>소개 : ${ploGroup.spbContent } </span>
                        	<br>
            				<span class="keyword">#${ploGroup.spbKeyword}</span> 
            			</li>
                    </ul>
                </div>

                <!-- 모임 가입 안한 일반 USER가 보는 버튼 -->
                <form action="${ path }/plogroup/joinPloGroup" method="POST">
                <input type="hidden" value="${ ploGroup.plogGroupName }" name="pgName">
                <input type="hidden" value="${ loginMember.no }">
                <c:if test="${ploGroup.plogGroupName ne loginMember.myPloging && ploGroup.spbWriterNum ne loginMember.no }">
                <div class="buttonBox">
                    <button>모임 가입하기</button>
                </div>
                </c:if>
                </form>
                <!-- 모임 가입한 일반 USER가 보는 버튼 -->
                <c:if test="${ ploGroup.plogGroupName eq loginMember.myPloging && ploGroup.spbWriterNum ne loginMember.no}">
                <form action="${path }/ploboard/outGroup">
                <div class="buttonBox">
                    <button type="submit">모임 탈퇴하기</button>
                </div>
                </form>
                </c:if>
                <!-- 모임장이 보는 버튼 -->
                <c:if test="${ploGroup.spbWriterNum eq loginMember.no }">
                <div class="buttonBox">
                    <button id="updateBtn">모임 정보 수정</button>
                    <button class="deleteBtn" id="deleteBtn1">모임 삭제하기</button>
                </div>
                </c:if>
                
            </div>
        </div>
    </div>

    <div class="clubNotice_buttonBox">
            <a id="ClubSchedule" class="active">모임 일정</a>
            <a id="ClubNotice" style="margin-left: 50px;">공지사항</a>
    </div>
	<div class="clubInfo_Wrap">
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
	    
	    <!-- 공지사항 부분 -->
            <div id="ClubNotice_Info" class="clubNotice_infoBox_03">
                <!-- 모임 리더에게만 보이는 버튼 -->
                <!-- <div class="buttonBox">
                    <button onclick="location.href='${ path }/plogroup/noticeinsert?spBorNom=${ploGroup.spBorNum}'">공지사항 작성</button>
                </div> -->
                <div class="tableBox">
                <form action="${ path }/ploboard/noticeDelete" method="get">
                    <table class="table table-hover" >
                        <thead class="table-light">
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">작성 일자</th>
                            <th scope="col">공지 내용</th>
                            <th scope="col">작성자</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="notice" items="${ ploGroup.notices }">
                        <input type="hidden" value="${ ploGroup.spBorNum }" name="spBorNum">
                        <input type="hidden" value="${ notice.no }" name="no">
                        <tr>
                            <th scope="row">${ notice.no }</th>
                            	<td>${ notice.noticeCreateDate }</td>
                            	<td>${ notice.noticeContent }</td>
                            <td>
                            	<c:out value="${ notice.noticeWriterId }"/>
                            	<c:if test="${ploGroup.spbWriterNum eq loginMember.no }">
                            		<button id="btnNoticeDelete" type="submit">삭제</button>
                            	</c:if>
                            </td>
                        </tr>
                        </c:forEach>
                        <!--  <tr>
                            <th scope="row">2</th>
                            <td>2020/08/20</td>
                            <td>북극곰 절대 지켜</td>
                            <td>모임 리더</td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>2020/08/20</td>
                            <td>곰은 사람을 찢고 세미프로젝트는 내 멘탈을 찢어</td>
                            <td>모임 리더</td>
                        </tr>
                        -->
                        </tbody>
                    </table>
                    </form>
                </div>
                <!-- page 네비게이션 -->
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
                
                <div class="uploadClubNotice_section">
                <c:if test="${ploGroup.spbWriterNum eq loginMember.no }">
				    <form action="${ path }/ploboard/notice" method="post">
				    <div class="formContainer">
				        <div class="formWrap">
				            <div class="mb-3 row">
				                <label for="clubNoticeTitle" class="col-sm-2 col-form-label noticeLabel" >공지 내용</label>
				                <div class="col-sm-9">
				                	<input type="hidden" value="${ploGroup.spBorNum}" name="noticeBorNo">
				                    <input type="text" class="form-control" id="clubNoticeTitle" name="noticeContent" placeholder="공지 내용을 입력해주세요.">
				                </div>
				            </div>
						<%-- <%
						PloGroup plogGroup = (PloGroup)request.getAttribute("plogGroup");
				        System.out.println("플로깅vo : " + plogGroup);
				        %> --%>
				        <!-- 공지내용과 제목 입력칸 합침 -->
				            <!-- <div class="mb-3 row">
				                <label for="clubText" class="col-sm-4 col-form-label noticeLabel">공지 내용</label>
				                <div class="col-sm-6">
				                    <textarea class="form-control" placeholder="우리 지구 지켜..환경 오염 뿌셔" id="clubText" style="height: 300px; resize: none;"></textarea>
				                </div>
				            </div> -->
				        </div>
				        <div class="buttonBox">
				            <input class="submitBtn" type="submit" value="등록">
				            <input class="resetBtn" type="reset" value="취소">
				        </div>
				    </div>
				    </form>
				    </c:if>
				</div>

            </div>
            
         
         
	<input type="hidden" value="${ploGroup.spBorNum}" name="spBorNum">
	
</section>
<script type="text/javascript">
$(document).ready(() => {
		$("#updateBtn").on("click", () => {
			location.replace("${path}/ploboard/GroupUpdate?spBorNum=${ploGroup.spBorNum}");
		});
		$("#deleteBtn1").on("click", () => {
			location.replace("${path}/ploboard/deleteGroup?spBorNum=${ploGroup.spBorNum}");
		});
		
});



</script>

<jsp:include page="/views/common/footer.jsp" />