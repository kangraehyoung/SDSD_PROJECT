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
                    <div>
                        <img src="https://mblogthumb-phinf.pstatic.net/MjAxODEwMzFfMjA3/MDAxNTQwOTQyNzcwMTcw.NtmoIbuWHdzf9bnzs_eJ8cr6Xf1SiZqaDa6JTqQ_bscg.xfNsHblfGcE2LAaMRe5CQV-28pOyOagCpX1T2IHOHqwg.JPEG.cosl922/output_3919720138.jpg?type=w800" class="img-fluid" alt="">
                    </div>
                    <div class="fileboxBtn">
                        <label for="uploadImages">사진 등록</label>
                        <input name="upfile1" type="file" id="uploadImages" multiple> 
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
                            <input name="writer" type="text" id="WriterName" class="form-control md-2" value="${ loginMember.nickName }" style="width: 50% !important;">
                        </div>
                    </div>

                    <!-- 인증 내용 -->
                    <div class="textWrap">
                        <textarea class="form-control" name="content" placeholder="내용을 입력해 주세요!" id="clubText" style="height: 300px; resize: none;"></textarea>
                        <p><span id="counter">0</span>/<span id="maxLength">2000</span></p>
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