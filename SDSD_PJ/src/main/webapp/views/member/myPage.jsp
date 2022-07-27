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

    <!-- c:if 사용해서 보여줄 버튼 나누기 -->
    <!-- 1) 정보 수정 누르기 전 -->
    <p style="text-align: center; background-color: #1f1f1f; color: #ffffff; padding: 0; margin: 30px 0 0 0;">정보 수정 버튼 누르기 전 보이는 화면</p>
    <div class="personInfoBox_01">
        <div class="contentBox">
            <div class="profileImgBox">
                <img src="../resources/imgFile/recycling.png" alt="">
            </div>
            <div class="profileTextBox">
                <p>이정후님</p>
                <p>모임</p>
                <p>모임 이름</p>
            </div>
        </div>
<<<<<<< HEAD
=======

   <!-- 2) 정보 수정 누르기 후 -->
   <p style="text-align: center; background-color: #1f1f1f; color: #ffffff; padding: 0; margin: 30px 0 0 0;">정보 수정 버튼 누르면 보이는 화면</p>
    <div class="personInfoBox_01">
        <div class="contentBox">
            <div class="profileImgBox">
                <img src="../resources/imgFile/recycling.png" alt="">
                <button>사진 변경</button>
            </div>
            <div class="profileTextBox">
                <p>이정후님</p>
                <p>모임</p>
                <p>모임 이름</p>
            </div>
        </div>
        <!-- c:if 사용해서 보여줄 버튼 나누기 -->
        <!-- 1) 정보 수정 누르기 전 -->
      	
	        <div class="btnBox">
	            <a href="${path}/views/member/UpdateMyPage.jsp">정보 수정</a>
	        </div>

	        <div class="btnBox" id="btnDelete">
	            <a>회원 탈퇴</a>
	        </div>
	   
       
        <!-- 2) 정보 수정 누르기 후 -->
	   	<!-- 
	        <div class="btnBox">
	            <a href="javascript:">수정 완료</a>
	        </div>
	    -->
>>>>>>> bac9bdaecea1a707cd77268540cb0f1e4bd2295c
        <div class="btnBox">
            <button onclick="location.href='${path}/views/member/UpdateMyPage.jsp'">정보 수정</button>
        </div>
<<<<<<< HEAD
		<div class="btnBox" id="btnDelete">
	         <button>회원 탈퇴</button>
	    </div>
=======
        <!-- 2) 정보 수정 누르기 후 -->
        <div class="btnBox">
            <button>수정 완료</button>
        </div>
>>>>>>> bac9bdaecea1a707cd77268540cb0f1e4bd2295c
    </div>
    
    <p style="text-align: center; background-color: #1f1f1f; color: #ffffff; padding: 0; margin: 0;">정보 수정 버튼 누르기 전 보이는 화면</p>
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
</script>



<jsp:include page="/views/common/footer.jsp" />