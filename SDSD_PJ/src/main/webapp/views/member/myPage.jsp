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
                <span><img src="${ path }/resources/imgFile/checkIcon_mypage.png" alt="Check Icon"></span>
                <a href="javasript:">마이 페이지</a>
            </div>
            <div class="menuList"><a href="javasript:">나의 활동</a></div>
            <div class="menuList"><a href="javasript:">개인 플로깅 인증</a></div>
        </div>
    </div>

    <div class="personInfoBox_01">
        <div class="contentBox">
            <div class="profileImgBox">
                <img src="${ path }/resources/imgFile/recycling.png" alt="">
            </div>
            <div class="profileTextBox">
                <h3>${loginMember.name }님</h3> 
                
                <p class="crewInfo">
	                <img alt="groupIcon" src="${ path }/resources/imgFile/mypage_groupIcon.png">
	                모임 이름
                </p>
            </div>
        </div>
        <div class="btnBox">
            <button onclick="location.href='${path}/views/member/UpdateMyPage.jsp'">정보 수정</button>
	         <button id="btnDelete">회원 탈퇴</button>
	         <button id="btnUpdatePwd">비밀번호 변경</button>
        </div>

		<!-- <div class="btnBox" id="btnDelete">
	         <button id="btnDelete">회원 탈퇴</button>
	    </div> -->
	</div>

    
    <div class="personInfoBox_02">
        <table>
            <tr>
                <th>닉네임</th>
                <td>${loginMember.nickName }</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${loginMember.BDay }</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${loginMember.email }</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${loginMember.phone }</td>
            </tr>
            <tr>
                <th>활동지역</th>
                <td>${loginMember.address }</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>${loginMember.gender }</td>
            </tr>
        </table>
    </div>

</section>
<script>
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			location.replace("${ path }/member/delete");
		}			
	});
	
	$(document).ready(() => {
		$("#btnUpdatePwd").on("click", () => {
			let url = "${ path }/member/updatePwd";
			let status = "left=500px,top=200px,width=400px,height=200px";
			
			open(url, "", status);
		});
	});
</script>



<jsp:include page="/views/common/footer.jsp" />