<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
	<form name="searchFrm">
		<input type="hidden" name="name">
		<input type="hidden" name="email">
		<input type="hidden" name="phone">
	</form>
<div class="find">
    <div class="findId1">
        <div class="findId1_1">아이디 찾기</div>
        <form action="${ path }/member/searchId" id="searchId" method="POST">
	        <input type="text" class="findId1_2" name="name" id="name" placeholder="가입할 때 입력하신 이름을 입력해주세요." value>
	        <input type="text" class="findId1_2" name="phone" id="phone" placeholder="가입할 때 입력하신 전화번호를 입력해주세요." value>
	        <button class="findId1_3" onclick="searchId()">아이디 전송</button>
        </form>
    </div>

    <div class="v_line"></div>

    <div class="findPwd1">
        <div class="findPwd1_1">비밀번호 찾기</div>
        <div class="findPwd1_2">
            <input type="text" class="findPwd1_3" name="email" placeholder="가입할 때 입력하신 이메일 주소를 입력해주세요." value>
            <div style="display: flex; width: 100%;">
                <input type="number" name="phone2" placeholder="가입할 때 입력하신 전화번호를 입력해주세요." value class="findPwd1_4">
                <button>인증번호받기</button>
            </div>
            <input name="certNumber" class="findPwd1_5" type="number" placeholder="인증번호를 입력해주세요." value>
        </div>
        <button class="findPwd1_6">비밀번호 재설정</button>
    </div>
</div>
<script>
function searchId(){
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    if(name == "" && email == "" && phone == ""){
       alert("모든 정보를 입력해주세요.");
       return;
    }
    
    var url = "/searchId"; // 요청 서블릿 url
    
    var title ="searchId"; //윈도우 창 이름

    var popup = window.open("",title,status); //빈창 오픈
    
    searchFrm.name.value=name;
    searchFrm.email.value=email;
    searchFrm.phone.value=phone;
    
    searchFrm.target = title;//popup창과 form태그를 연결
    //action,method설정 후 form태그 submit
    searchFrm.action = url;
    searchFrm.method="post";
    
    searchFrm.submit();
 }
</script>

<jsp:include page="/views/common/footer.jsp" />