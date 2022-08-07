<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />


<section class="clubPlogBoardWrite_section">
    <div class="titleBox">
        <h2><img src="${ path }/resources/imgFile/findTeam.png" alt="clubIcon">플로깅 모임 인증 등록</h2>
    </div>
    <div class="plogBoardWrap">
        <div class="container-fluid contentContainer">
        <form action="${path}/groupboard/groupwrite" method="POST" enctype="multipart/form-data">
        	<input type="hidden" value="${loginMember.myPloging }" name="groupName">
        	<input type="hidden" value="${loginMember.nickName}" name="nickName">
            <input type="hidden" value="${GroupBoard.groupBorNo }" name="no">
            <input type="hidden" value="${GroupBoard.borTitle}"  name="title">
            <div class="row">
                <!-- 모임 이미지 -->
                <div class="col">
                    <div class="fileboxBtn">
                    	<div>
	                        <label for="uploadImages1"><i class="bi bi-image"></i> 사진 등록 1</label>
	                        <input name="upfile1" type="file" id="uploadImages1"> 
	                        <label for="uploadImages2"><i class="bi bi-image-fill"></i> 사진 등록 2</label>
	                        <input name="upfile2" type="file" id="uploadImages2"> 
                    	</div>
                    	<div style="margin-top: 10px;">
	                        <label for="uploadImages3"><i class="bi bi-image-fill"></i> 사진 등록 3</label>
	                        <input name="upfile3" type="file" id="uploadImages3"> 
	                        <label for="uploadImages4"><i class="bi bi-image"></i> 사진 등록 4</label>
	                        <input name="upfile4" type="file" id="uploadImages4"> 
                        </div>
                        <p class="subText">* 최대 4장 4MB 이하</p>
                    </div>
                </div>

                <!-- 작성 칸 -->
                <div class="col nameCol">
                    <!-- 닉네임 섹션 -->
                    <div class="nameContainer">
                        <div class="profileImgBox">
                            <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2022/01/01/111043065.2.jpg" alt="profileImg">
                        </div>
                        <div class="profileName">
                            <input name="writer" type="text" id="WriterName" class="form-control md-2" value="${loginMember.nickName }" style="width: 50% !important;" readonly>
                        </div>
                    </div>

                    <!-- 인증 내용 -->
                    <div class="textWrap">
                        <textarea class="form-control" name="content" id="clubText" style="height: 300px; resize: none;"> ${groupBoard.borContent } </textarea>
                        <p><span id="counter">0</span>/<span id="maxLength">2000</span></p>
                   
	                    <!-- 키워드 입력 --> 
	                    <div class="mb-3 row">
	                    	<label for="clubKeyword" class="col-md-1 col-form-label" style="color: rgb(50, 157, 245); font-weight: 600; text-align: right;">#</label>
	                        <div class="col-sm-9">
	                            <input type="text" name="groupkeyword" value="${ groupBoard.groupkeyword }" class="form-control" placeholder="키워드를 입력해주세요" style="border: none !important;">
                        	</div>

                    <div class="extraWrap">
	                        <div class="inputBox">
	                            <!-- 배경색 선택 -->
	                            <label for="plogBoardColorPick">배경색 선택</label>
	                            <input type="color" class="form-control form-control-color" id="plogBoardColorPick" value="#CDE7F9" title="Choose your color">
	                            <!-- 좋아요 댓글 숨기기 선택 -->
	                            <label for="flexSwitchCheckDefault" class="switch_hidden">좋아요 / 댓글 수 숨기기</label>
	                            <div class="form-check form-switch">
	                                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
	                            </div>
	                        </div>
                    	</div>
                
                
                </div>


            </div>
            
        </div>
    </div>
    

    <div class="row plogBoardButtonWrap">
        <div class="col"></div>
        <div class="col boardBtnBox">
            <button type="submit">공유하기 <i class="bi bi-send"></i></button>
        </div>
        <div class="col nextBtnBox"></div>
    </div>
    </form>
    </div>
    </div>
    

</section>

<script>
    // 글자수 세기 스크립트
    $('#clubText').on('keyup', (event) => {
    let target = $(event.target);
    let counter = $('#counter');
    let currentLength = target.val().length;
    let maxLength = parseInt($('#maxLength').text());

    // 입력한 값의 글자수 세기
    console.log(currentLength);
    counter.text(currentLength);

    // 최대 글자 이상 입력 불가하게 설정
    if(currentLength > maxLength) {
        target.val(target.val().substr(0, maxLength));
    }
});
</script>


<jsp:include page="/views/common/footer.jsp" />