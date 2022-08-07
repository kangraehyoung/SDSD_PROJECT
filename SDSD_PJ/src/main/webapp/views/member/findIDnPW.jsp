<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<section class="findidpwd">
    <div class="find">
        <div class="findHead">
            <div class="fh_1"><h3>아이디 찾기<img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/magnifying-glass-tilted-left_1f50d.png" alt=""></h3></div>
            <div class="fh_2"><h3>비밀번호 찾기<img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/magnifying-glass-tilted-left_1f50d.png" alt=""></h3></div>
        </div>
        <div class="findbody">
            <div class="findId1">
                <div class="ficontent">
                    <form action="${ path }/member/searchId" id="searchId" method="POST">
                        <input type="text" class="findId1_2" name="name" id="name" placeholder=" 가입 시 입력한 이름을 입력해주세요." value>
                        <input type="text" class="findId1_2" name="phone" id="phone" placeholder=" 가입 시 입력한 전화번호를 입력해주세요." value>
                        <button class="findId1_3" onclick="searchId()">아이디 전송</button>
                    </form>
                </div>
            </div>
            <div class="findPwd1">
                <div class="ficontent2">
                    <form action="${path }/SearchPwd" id="searchPwd" method="get">
                    <div>
                        <input type="text" class="findPwd1_3" name="email" placeholder=" 가입 시 입력한 이메일 주소를 입력해주세요.">
                        <div class="fi_phone">
                            <input type="text" name="phone2" placeholder=" 가입 시 입력한 전화번호를 입력해주세요." class="findPwd1_4">
                            <button>인증번호받기</button>  
                        </div>
                        <div class="fi_repwd">
                        <input name="certNumber" class="findPwd1_5" type="text" placeholder=" 인증번호를 입력해주세요.">
                        <button class="findPwd1_6" type="submit">비밀번호 재설정</button>   
                        </div>
                    </div>  
                	</form>     
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/views/common/footer.jsp" />