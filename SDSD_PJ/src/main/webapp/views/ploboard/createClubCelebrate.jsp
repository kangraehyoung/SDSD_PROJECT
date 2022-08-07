<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="createClubThxU_section">

    <div class="mainTextContainer">
        <div class="row">
            <div class="col-md-5 iconBox">
                <img src="${ path }/resources/imgFile/party-popper_Icon.png" alt="">
            </div>
            <div class="col-md-7 textBox">
                <p>
                    ${loginMember.name }님!<br>
                    모임을 생성 해주셔서 감사합니다! <br> 다시 로그인 해주세요! <span><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/twitter/322/winking-face_1f609.png" alt=""></span>
                </p>
                </div>
        </div>
    </div>

    <div class="buttonContainer">
        <!-- <p>주변에 모임을 홍보해보세요!</p> -->

        <div class="buttonBox">
                <button class="gotoMain" id="toMain">메인페이지 바로가기 <i class="bi bi-house-door"></i></button>
               <!-- <button onclick="location.href='${path}/ploGroup/myPloging?plogGroupName=${loginMember.myPloging}'">내 모임 바로가기 <i class="bi bi-people"></i></button>  --> 
                <button onclick="location.href='${path }/plogroup/invali'">로그인 하러가기 <i class="bi bi-people"></i></button>
        </div>
    </div>

</section>
<script>
$(document).ready(() => {
	$("#toMain").on("click", () => {
		location.replace("${path}/main")
	});
	
});

</script>

<jsp:include page="/views/common/footer.jsp" />