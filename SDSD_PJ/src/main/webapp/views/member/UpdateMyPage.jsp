<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="ploggingPerson">
<form action="${path }/member/myPage" method="post">
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
               	<div>
	                <button>사진 변경</button>
               	</div>
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
	        <button type="submit">수정 완료</button>
	    </div>
   </div>
  
    <div class="personInfoBox_02">
		<input type="hidden" name="no" value="${loginMember.no }">
        <table>
            <tr>
                <th>닉네임</th>
                
                <td><input type="text" name="nickname" placeholder="수정할 닉네임을 입력"></td>
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
                <td><input type="number" name="phone" placeholder="'-'없이 입력하세요." value></td>
            </tr>
            <tr>
                <th>활동지역</th>
                <td> 
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
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>남</td>
            </tr>
        </table>

    </div>
    </form>
</section>
<script>
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			location.replace("${path}/member/delete");
		}			
	});
	
</script>



<jsp:include page="/views/common/footer.jsp" />