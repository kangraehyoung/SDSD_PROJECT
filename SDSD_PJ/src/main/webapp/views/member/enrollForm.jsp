<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<section class="enlollJE2">
    <div class="enrollTemrs_title"> <!-- 오븐 기준 민트색 배경 틀 -->
        <!-- 회원가입  -->
        <h2>회원가입</h2>

        <!-- 약관 동의 >> 정보 입력 -->
        <ul class="StepTerms">
            <li onclick="location.href='${ path }/member/agreePage'" style="cursor: pointer; color: rgb(98, 98, 98);">1. 약관 동의</li>
            <li>
                <img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/backhand-index-pointing-right_1f449.png" class="arrowIcon" alt="arrow Icon">
            </li>
            <li>
            	2.정보입력
            </li>
        </ul>
    </div>
 	<div class="second_tool"> <!-- 오븐 기준 하늘색 배경 틀 -->
            <form action="${ path }/member/enroll" method="POST" class="join_form"> <!-- 폼 틀 -->
                <div class="second_tool_1"> <!-- 필수 입력 정보 틀 -->
                    <div class="st_head"> <!-- 필수 정보 헤드 -->
                        <div><h4>필수 입력 정보</h4></div>
                        <div><p>쓰담쓰담 로그인 시 사용됩니다.</p></div>
                    </div>
                    <div class="st_input"> <!-- 필수 정보 input -->
                        <div class="sti_label">
                            <div class="stl_id"><label for="newEmail">아이디(이메일주소) <span>*</span></label></div>
                            <div class="stl_pwd"><label for="password">비밀번호 <span>*</span></label></div>
                            <div class="stl_pwd2"><label for="password2">비밀번호 재입력 <span>*</span></label></div>
                        </div>
                        <div class="sti_input">
                            <div class="sti_id">
                                <input type="email" name="email" id="newEmail" placeholder="이메일 형식의 아이디를 입력하세요." required size="51px" value>
                                <input type="button" id="checkDuplicate" value="중복검사">
                            </div>
                            <div class="sti_pwd">
                                <input type="password" id="password" name="password" placeholder="9자 이상의 비밀번호를 입력하세요." required size="60px" minlength="8">
                            </div>
                            <div class="sti_pwd2">
                                <input type="password" id="password2" name="password2" placeholder="9자 이상의 비밀번호를 입력하세요." size="60px" required minlength="8">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="second_tool_2"> <!-- 마이페이지 입력 정보 틀 -->
                    <div class="st_head2"> <!-- 회원 정보 헤드 -->
                        <div><h4>회원 입력 정보</h4></div>
                        <div><p>마이페이지에 노출되는 정보입니다.</p></div>
                    </div>
                    <div class="st_input2"> <!-- 회원 정보 input -->
                        <div class="sti2_label">
                            <div class="stl_name"><label for="name">이름</label></div>
                            <div class="stl_date"><label for="date">생년월일</label></div>
                            <div class="stl_nickName"><label for="nickName">닉네임</label></div>
                            <div class="stl_phone"><label for="phone">전화번호</label></div>
                            <div class="stl_area"><label for="area">활동지역</label></div>
                            <div class="stl_gender"><label>성별</label></div>
                        </div>
                        <div class="sti2_input">
                            <div class="name_input">
                                <input type="text" id="name" name="name" value>
                            </div>
                            <div class="date_input">
                                <input type="date" id="date" name="birthDate" value>
                            </div> 
                            <div class="nickname_input">
                                <input type="text" id="nickName" name="nickName" value>
                            </div>
                            <div class="phoneNumber_input">
                                <input type="text" id="phone" name="phone" placeholder="'-'없이 입력하세요." value>
                            </div>
                            <div class="st_select_area">
                                <select name="address" id="area">
                                    <option selected>---</option>
                                    <optgroup label="특별시 및 광역시">
                                    <option value="seoul">서울특별시</option>
                                    <option value="incheon">인천광역시</option>
                                    <option value="daejeon">대전광역시</option>
                                    <option value="gwangju">광주광역시</option>
                                    <option value="daegu">대구광역시</option>
                                    <option value="busan">부산광역시</option>
                                    <option value="ulsan">울산광역시</option>
                                    </optgroup>
                                    <optgroup label="도">
                                    <option value="gyeonggi">경기도</option>
                                    <option value="gangwon">강원도</option>
                                    <option value="chungbuk">충청북도</option>
                                    <option value="chungnam">충청남도</option>
                                    <option value="jeonbuk">전라북도</option>
                                    <option value="jeonnam">전라남도</option>
                                    <option value="gyeongbuk">경상북도</option>
                                    <option value="gyeongnam">경상남도</option>
                                    <option value="jeju">제주도</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="gender_input">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="남자" checked>
                                    <label class="form-check-label" for="inlineRadio1">남</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="여자">
                                    <label class="form-check-label" for="inlineRadio2">여</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="st_btn"><!-- 버튼 박스 -->
                    <button class="fisrt_stbtn" onclick="location.href='${ path }/member/agreePage'">이전으로</button>
                    <button type="submit" class="second_stbtn">가입하기</button>
                </div>
            </form>
        </div>
</section>

<script>
	$(document).ready(() => {
		
		$("#checkDuplicate").on("click", () => {
			
			let email = $("#newEmail").val().trim();
			
			$.ajax({
				type: "POST",
				url: "${path}/member/idCheck",
				dataType: "json",
				data: {
					email
				},
				success: (obj) => {
					console.log(obj);
					if(obj.duplicate === true) {
						alert("이미 사용중인 아이디 입니다.");
					} else {
						alert("사용 가능한 아이디 입니다.")
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});
	});
</script>

<jsp:include page="/views/common/footer.jsp" />