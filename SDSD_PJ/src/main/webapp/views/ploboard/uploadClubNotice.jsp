<%@page import="com.sdsd.mvc.ploGroup.model.vo.PloGroup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<!-- 사용 안함 
<section class="uploadClubNotice_section">
    <div class="titleBox">
        <h2>모임 공지사항 등록</h2>
    </div>
    <form action="${ path }/plogroup/notice" method="post">
    <div class="formContainer">
        <div class="formWrap">
            <div class="mb-3 row">
                <label for="clubNoticeTitle" class="col-sm-4 col-form-label noticeLabel" >공지 제목</label>
                <div class="col-sm-6">
                	<input type="hidden" value="${ploGroup.spBorNum}" name="noticeBorNo">
                    <input type="text" class="form-control" id="clubNoticeTitle" name="noticeContent">
                </div>
            </div>
		
            <div class="mb-3 row">
                <label for="clubText" class="col-sm-4 col-form-label noticeLabel">공지 내용</label>
                <div class="col-sm-6">
                    <textarea class="form-control" placeholder="우리 지구 지켜..환경 오염 뿌셔" id="clubText" style="height: 300px; resize: none;"></textarea>
                </div>
            </div>
        </div>
        <div class="buttonBox">
            <input class="submitBtn" type="submit" value="등록">
            <input class="resetBtn" type="reset" value="취소">
        </div>
    </div>
    </form>
</section>



<jsp:include page="/views/common/footer.jsp" />-->