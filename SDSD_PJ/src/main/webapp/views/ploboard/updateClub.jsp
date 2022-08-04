<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="createClub_section">
	<form action="${ path }/ploboard/GroupUpdate" method="POST" enctype="multipart/form-data">
    <div class="titleBox">
        <h2>모임 수정하기</h2>
    </div>
	<input type="hidden" value="${ loginMember.nickName }" name="nickName">
    <div class="createForm_Wrap">
        <div class="container-fluid">
            <div class="row">
                <!-- 모임 사진 박스 -->
                <div class="col">
                    <!-- 모임 이미지 -->
                    <div>
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEwMzFfMjA3/MDAxNTQwOTQyNzcwMTcw.NtmoIbuWHdzf9bnzs_eJ8cr6Xf1SiZqaDa6JTqQ_bscg.xfNsHblfGcE2LAaMRe5CQV-28pOyOagCpX1T2IHOHqwg.JPEG.cosl922/output_3919720138.jpg?type=w800" class="img-fluid" alt="">
                    </div>
                    <div class="fileUploadBox">
                        <div class="fileboxBtn">
                            <label for="uploadImages">사진 등록</label>
                            <input type="file" id="uploadImages" multiple name="upfile1"> 
                        </div>
                        <p class="subText">* 최대 4장 4MB 이하</p>
                    </div>
                    
                </div>

                <!-- 모임 정보 박스 -->
                <div class="col clubInfoForm">
                    <!-- 모임 이름 -->
                    <div class="mb-3 row">
                        <label for="clubName" class="col-sm-3 col-form-label">${loginMember.myPloging }</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="clubName" value="쓰레깅" name="pgName">
                        </div>
                    </div>

                    <!-- 최대 인원 수 -->
                    <!-- 
                    <div class="mb-3 row">
                        <label for="clubMember" class="col-md-3 col-form-label">최대 인원 수</label>
                        <div class="col-sm-4">
                            <input type="number" class="form-control" min="3" max="100" id="clubMember" value="3" name="ploNop">
                        </div>
                    </div>
                     -->

                    <!-- 주 활동 지역 -->
                    <!-- 
                    <div class="mb-3 row">
                        <label for="clubLocation" class="col-md-3 col-form-label">주 활동 지역</label>
                        <div class="col-sm-8">
                            <select class="form-select" aria-label="Default select example" name="local">
                                <option selected>---</option>
                                <optgroup label="특별시 및 광역시">
                                <option value="seoul">서울특별시</option>
                                <option value="incheon">인천광역시</option>
                                <option value="daejeon">대전광역시</option>
                                <option value="gwangju">광주광역시</option>
                                <option value="daegu">대구광역시</option>
                                <option value="busan">부산광역시</option>
                                <option value="ulsan">울산광역시</option>
                                </optgroup>
                                <optgroup label="도">
                                <option value="gyeonggi">경기도</option>
                                <option value="gangwon">강원도</option>
                                <option value="chungbuk">충청북도</option>
                                <option value="chungnam">충청남도</option>
                                <option value="jeonbuk">전라북도</option>
                                <option value="jeonnam">전라남도</option>
                                <option value="gyeongbuk">경상북도</option>
                                <option value="gyeongnam">경상남도</option>
                                <option value="jeju">제주도</option>
                                </optgroup>
                            </select>
                        </div>
                    </div>
					 -->
					 
                    <!-- 선호 성별 -->
                    <!-- 
                    <div class="mb-3 row">
                        <label for="clubGender" class="col-md-3 col-form-label">선호 성별</label>
                        <div class="col-sm-7" style="transform: translateY(20%);">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" for="inlineCheckbox1">남</label>
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="남" name="gender">
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" for="inlineCheckbox2">여</label>
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="여" name="gender">
                            </div>
                        </div>
                    </div>
					 -->
					 <!-- 모임장이 누구인지 가져오기위한 것 -->
					 <input type="hidden" name="nickName" value="${loginMember.nickName }">
					 <!-- 멤버에 업데이트를 위한 모임장 넘버 -->
					 <input type="hidden" name="leaderNo" value="${loginMember.no }">
					 
                    <!-- 모임 소개 -->
                    <div class="mb-3 row">
                        <label for="clubText" class="col-md-3 col-form-label">모임 소개</label>
                        <div>
                            <textarea class="form-control" placeholder="우리 지구 지켜..환경 오염 뿌셔" id="clubText" style="height: 150px; resize: none;" name="content"></textarea>
                        </div>
                    </div>

                    <!-- 키워드 선택 -->
                    <div class="mb-3 row">
                        <label for="clubKeyword" class="col-md-3 col-form-label">키워드 선택</label>
                        <div class="col-md-12">
                            <input type="checkbox" class="btn-check" id="clubKeyword1" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword1">#키워드 1</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword2" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword2">#키워드 2</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword3" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword3">#키워드 3</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword4" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword4">#키워드 4</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword5" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword5">#키워드 5</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword6" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword6">#키워드 6</label>
                        </div>
                        <div class="col-md-12" style="margin-top: 10px;">
                            <input type="checkbox" class="btn-check" id="clubKeyword7" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword7">#키워드 7</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword8" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword8">#키워드 8</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword9" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword9">#키워드 9</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword10" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword10">#키워드 10</label>

                            <input type="checkbox" class="btn-check" id="clubKeyword11" autocomplete="off">
                            <label class="btn btn-outline-primary" for="clubKeyword11">#키워드 11</label>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>

    <div class="buttonBox">
        <input class="submitBtn" type="submit" value="모임 수정">
        <input class="resetBtn" type="reset" value="취소">
    </div>
	</form>
</section>








<jsp:include page="/views/common/footer.jsp" />