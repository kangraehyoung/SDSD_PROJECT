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
                    (모임 생성자)님!<br>
                    모임을 생성 해주셔서 감사합니다! <span><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/twitter/322/winking-face_1f609.png" alt=""></span>
                </p>
                </div>
        </div>
    </div>

    <div class="buttonContainer">
        <p>주변에 모임을 홍보해보세요!</p>

        <div class="buttonBox">
            <a href="#"><img src="${ path }/resources/imgFile/kakaoTalkShareBtn.png" alt="" style="margin-right: 5px;"></a>
            <a href="#"><img src="${ path }/resources/imgFile/copyLinkBtn.png" alt="" style="margin-left: 5px;"></a>
        </div>
    </div>

</section>

<jsp:include page="/views/common/footer.jsp" />