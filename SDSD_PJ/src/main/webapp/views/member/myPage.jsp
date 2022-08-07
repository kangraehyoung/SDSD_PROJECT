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
                <span><img src="${ path }/resources/imgFile/checkblue_icon.png" alt="Check Icon"></span>
                <a href="javasript:">마이 페이지</a>
            </div>
            <div class="menuList"><a href="${ path }/member/myActivity">나의 활동</a></div>
            <div class="menuList"><a href="${ path }/indiboard/indilist">개인 플로깅 인증</a></div>
        </div>
    </div>

    <div class="personInfoBox_01">
        <div class="row contentBox">
            <div class="col profileImgBox">
                <img src="${ path }/resources/imgFile/프로필이미지예시.png" alt="profileImg">
            </div>
            <div class="col profileTextBox">
                <h3>${loginMember.name }님</h3> 
                
                <p class="crewInfo"><i class="bi bi-people-fill"></i> ${loginMember.myPloging }</p>
            </div>
        </div>
        <div class="btnBox">
            <button onclick="location.href='${path}/member/myUpdate'">정보 수정</button>
	         <button id="btnDelete">회원 탈퇴</button>
	         <button id="btnUpdatePwd">비밀번호 변경</button>
        </div>

		<!-- <div class="btnBox" id="btnDelete">
	         <button id="btnDelete">회원 탈퇴</button>
	    </div> -->
	</div>

    
    <div class="personInfoBox_02">
    	<div class="infoBox">
    		<!-- 닉네임 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">닉네임</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.nickName }">
		    	 </div>
	    	</div>
    		<!-- 생년 월일 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">생년월일</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.BDay }">
		    	 </div>
	    	</div>
	    	
    		<!-- 이메일 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">이메일</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.email }">
		    	 </div>
	    	</div>
	    	
    		<!-- 전화번호 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">전화번호</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.phone }">
		    	 </div>
	    	</div>
	    	
    		<!-- 활동지역 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">활동지역</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.address }">
		    	 </div>
	    	</div>
	    	
    		<!-- 성별 -->
	    	 <div class="mb-3 row">
	    	 	<label class="col-sm-5 col-form-label">성별</label>
		    	 <div class="col-sm-5">
		    	 	<input type="text" readonly class="form-control-plaintext" id="" value="${loginMember.gender }">
		    	 </div>
	    	</div>
	    	
    	</div>
    	
    	<!-- 
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
        </table> -->
        
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