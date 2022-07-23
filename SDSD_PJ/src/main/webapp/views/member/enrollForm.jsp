<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<div>
	<div class="enrollTemrs_title"> <!-- 오븐 기준 민트색 배경 틀 -->
        <!-- 회원가입  -->
        <h2>회원가입</h2>

        <!-- 약관 동의 >> 정보 입력 -->
        <ul class="StepTerms">
            <li onclick="location.href='${ path }/views/member/agree.jsp'" style="cursor: pointer; color: rgb(98, 98, 98);">1. 약관 동의</li>
            <li><img src="${ path }/resources/imgFile/right-arrow.png" class="arrowIcon" alt="arrow Icon"></li>
            <li>
            	<img src="${ path }/resources/imgFile/지구아이콘.png" class="earthIcon" alt="earth Icon">2.정보입력
            </li>
        </ul>
    </div>
 	<div class="second_tool"> <!-- 오븐 기준 하늘색 배경 틀 -->
            <form action="${ path }/member/enroll" method="POST" class="join_form"> <!-- 폼 틀 -->
                <div class="senond_tool_1"> <!-- 필수 입력 정보 틀 -->
                    <div class="st_head"> <!-- 필수 정보 헤드 -->
                        <div><h4>필수 입력 정보</h4></div>
                        <div><p>쓰담쓰담 로그인 시 사용됩니다.</p></div>
                    </div>
                    <div class="st_input"> <!-- 필수 정보 input -->
                        <div class="st_id"> <!-- 아이디 입력 박스 -->
                            <div><label>아이디(이메일주소) *</label></div>
                            <div>
                                <input type="email" name="email" placeholder="이메일 형식의 아이디를 입력하세요." required value>
                            </div>
                        </div>
                        <div class="st_pwd"> <!-- 비밀번호 입력 박스-->
                            <div><label>비밀번호 *</label></div>
                            <div>
                                <input type="password" name="password" placeholder="6자 이상의 비밀번호를 입력하세요." required value>
                            </div>
                        </div>
                          	<!--  <div class="st_pwd2"> 비밀번호 재입력 박스
                            <div><label>비밀번호 재입력 *</label></div>
                            <div>
                                <input type="password2" name="password2" placeholder="6자 이상의 비밀번호를 입력하세요." required value>
                            </div>
                            -->
                        </div>
                        	
                    </div>
                </div>
                <div class="second_tool_2"> <!-- 마이페이지 입력 정보 틀 -->
                    <div class="st_head2"> <!-- 회원 정보 헤드 -->
                        <div><h4>회원 입력 정보</h4></div>
                        <div><p>마이페이지에 노출되는 정보입니다.</p></div>
                    </div>
                    <div class="st_input2"> <!-- 회원 정보 input -->
                        <div class="st_name"> <!-- 이름 입력 박스 -->
                            <div><label>이름</label></div>
                            <div>
                                <input type="text" name="name" value>
                            </div>
                        </div>
                        <!--  <div class="st_birthDay"> 
                            <div><label>생년월일</label></div>
                            <div>
                                <input type="date" name="birthDate" value>
                            </div> 
                        -->
                        </div>
                        <div class="st_nickname"> <!-- 닉네임 입력 박스 -->
                            <div><label>닉네임</label></div>
                            <div>
                                <input type="text" name="nickName" value>
                            </div>
                        </div>
                        <div class="st_phoneNumber"> <!-- 전화번호 입력 박스 -->
                            <div><label>전화번호</label></div>
                            <div>
                                <input type="number" name="phone" placeholder="'-'없이 입력하세요." value>
                            </div>
                        </div>
                        <div class="st_area"> <!-- 활동지역 입력 박스 -->
                            <div><label for="area">활동지역</label></div>
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
                        </div>
                            <div class="st_gender"> <!-- 성별 입력 박스 -->
                            <div><label>성별</label></div>
                            <div>
                                <input type="gender" name="gender" placeholder="남자 or 여자 입력하세요" required value>
                            </div>
                        
                        </div>
                    </div>
                </div>
                <div class="st_btn"><!-- 버튼 박스 -->
                    <button>이전으로</button>
                    <button type="submit">가입하기</button>
                </div>
            </form>
        </div>
    </div>


<jsp:include page="/views/common/footer.jsp" />