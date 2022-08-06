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
                <a href="javasript:">마이 페이지</a>
            </div>
            <div class="menuList"><a href="javasript:">나의 활동</a></div>
            <div class="menuList">
                <span><img src="${ path }/resources/imgFile/checkblue_icon.png" alt="Check Icon"></span>
                <a href="javasript:" style="font-weight: bold;">개인 플로깅 인증</a>
            </div>
        </div>
    </div>
    <div class="contentBox">
        <div class="head_title2"> <!-- 요소 모음 div -->
            <div class="ht_search2">
                <form class="ht_12">
                    <div class="ht_22">
                        <input type="text">
                        <button type="submit">
                            <img src="${ path }/resources/imgFile/searchIcon_03.png" alt="search">
                        </button>
                    </div>
                </form>
            </div>
            <div class="ht_keyword2">
                <div><p>추천 키워드</p></div>
                <div class="ht_hash2">
                    <a href="#">#강남구</a>
                </div>
                <div class="ht_hash2">
                    <a href="#">#경기도</a>
                </div>
                <div class="ht_hash2">
                    <a href="#">#20대</a>
                </div>
                <div class="ht_hash2">
                    <a href="#">#한강</a>
                </div>
                <div class="ht_hash2">
                    <a href="#">#남산</a>
                </div>
            </div>
		</div>
    </div>
    <form action="${path}/indiboard/indiwrite" method="post" enctype="multipart/form-data">
    <div class="boardBox_p"> <!-- 세번째 부분 게시글 -->
      <div class="bb_file"> <!-- 파일 -->
        
          <div>
            <p>업로드할 사진을 선택해 주세요!</p>
            <p style="font-size: 5px;">* 사진은 순서대로 3장까지 업로드 가능해요!</p>
            <label class="bbf1" for="bbf1">사진등록1</label>
            <label class="bbf1" for="bbf2">사진등록2</label>
            <label class="bbf1" for="bbf3">사진등록3</label>
            <input name="upfile1" type="file" id="bbf1" style="display: none;">
            <input name="upfile2" type="file" id="bbf2" style="display: none;">
            <input name="upfile3" type="file" id="bbf3" style="display: none;">
          </div>
      
      </div>
      <div class="bb_board_p"> <!-- 게시글 -->
        <div class="bbbp_1">
          <div class="bbbp_1_profile_img">
            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjJfNCAg%2FMDAxNjU4NDU4NjY0NjY2.1XkvhsTxYYo8SQkD56GhVIRpSHwBZZjyH6JJ4o-bWDYg.jQd-dN1ab388dGG9iA2yBxfH0w0vzBO4s_0XIIO_0Xgg.JPEG.ymtlfet%2FIMG_7509.jpg&type=a340" alt="">
          </div>
<!--           <div class="bbbp_nickName" value="${loginMember.nickName }" name="nickName">
            <p>${loginMember.nickName }</p>
          </div> -->
          <input class="bbbp_nickName" name="nickName" value="${loginMember.nickName }" style="border: none;" readonly>
        </div>
        <div class="bbbp_2">
          <div class="bbbp_textBox">
            <!--  <form class="was-validated">-->
              <div class="mb-3">
                <textarea class="form-control" id="validationTextarea" name="content" placeholder="내용을 입력해 주세요!" required></textarea>
				<div class="bbbp2_keyword">
                	<span>#</span>
                	<input type="text" name="indikeyword" placeholder="게시글을 대표하는 키워드를 입력해주세요!" size="40px" style="border: none;">
              	</div>
              </div>
              <div class="bbbp2_input">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
                  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                  <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
                </svg>
                <div class="bbbp2_textCount">
                  <span id="bbcount">0</span>/<span id="bbmaxLength">2000</span>
                </div>
              </div>
            <!-- </form> -->
          </div>
        </div>
        <div class="bbbp_3">
            <div class="bbbp3_input">
              <!-- 배경색 선택 -->
              <label for="exampleColorInput">배경색 선택</label>
              <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#0054FF" title="Choose your color">
              <!-- 좋아요 댓글 숨기기 선택 -->
              <label for="flexSwitchCheckDefault" class="switch_hidden">좋아요 / 댓글 수 숨기기</label>
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
              </div>
            </div>
        </div>
      </div>
    </div>
    
    <div class="buttonBox_p">
      <div>
        <button class="btnprev" type=submit>공유하기</button>
      </div>
    </div>
    </form>
    <!-- 마지막 버튼 -->
</section>
<script>
    // 글자수 세기 스크립트
    $('#validationTextarea').on('keyup', (event) => {
    let target = $(event.target);
    let counter = $('#bbcount');
    let currentLength = target.val().length;
    let maxLength = parseInt($('#bbmaxLength').text());

    // 입력한 값의 글자수 세기
    console.log(currentLength);
    counter.text(currentLength);

    // 최대 글자 이상 입력 불가하게 설정
    if(currentLength > maxLength) {
        target.val(target.val().substr(0, maxLength));
    }
});
</script>

<jsp:include page="/views/common/footer.jsp" />