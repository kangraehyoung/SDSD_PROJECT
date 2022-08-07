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
                     <div class="fileUploadBox">
                        <div class="fileboxBtn">
                        	<div>
	                            <label for="uploadImages1"><i class="bi bi-image"></i> 사진 등록</label>
	                            <input type="file" id="uploadImages1"  name="upfile1"> 
	                            <label for="uploadImages2"><i class="bi bi-image-fill"></i> 사진 등록</label>
	                            <input type="file" id="uploadImages2"  name="upfile2"> 
                        	</div>
                            <div style="margin-top: 10px;">
	                            <label for="uploadImages3"><i class="bi bi-image-fill"></i> 사진 등록</label>
	                            <input type="file" id="uploadImages3"  name="upfile3"> 
	                            <label for="uploadImages4"><i class="bi bi-image"></i> 사진 등록</label>
	                            <input type="file" id="uploadImages4"  name="upfile4"> 
                            </div>
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
					<input type="hidden" value="${ploGroup.spBorNum }" name="spBorNum">
                    <!-- 키워드 선택 -->
                    <div class="mb-3 row">
                        <label for="clubKeyword" class="col-md-3 col-form-label">키워드 선택</label>
                                            <div class="mb-3 row">
                    	<label for="clubKeyword" class="col-md-1 col-form-label" style="color: rgb(50, 157, 245); font-weight: 600; text-align: right;">#</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="clubKeyword" name="spbKeyword" placeholder="키워드를 입력해주세요" style="border: none !important;">
                        </div>
                    </div>
	


                </div>
            </div>
        </div>
    </div>
</div>
    <div class="buttonBox">
        <input class="submitBtn" type="submit" value="모임 수정">
        <input class="resetBtn" type="button" onclick="location.href='${ path }/ploboard/ploGroupList'" value="취소">
    </div>
	</form>
</section>








<jsp:include page="/views/common/footer.jsp" />