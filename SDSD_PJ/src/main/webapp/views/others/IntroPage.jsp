<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="introTitle_section">
    <div class="titleBox">
        <h2>플로깅이란?</h2>
    </div>
</section>

<section class="introContent_section_01">
    <div class="contentContainer">
        <div class="slideBox">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${ path }/resources/imgFile/ploggingImg_07.png" class="d-block w-100" alt="slideImg">
                    </div>
                    <div class="carousel-item">
                        <img src="${ path }/resources/imgFile/ploggingImg_06.png" class="d-block w-100" alt="slideImg">
                    </div>
                    <div class="carousel-item">
                        <img src="${ path }/resources/imgFile/ploggingImg_12.png" class="d-block w-100" alt="slideImg">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="textBox">
            <p class="title"><span>&nbsp;Plogging&nbsp;</span></p>
            <p class="titleSub">Plocka upp + Jogging</p>
            <p class="text">플로깅이란 줍다라는 뜻의 스웨덴어와 달린다는 뜻의 영어의 합성어로 조깅을 하면서 주변의 쓰레기들을 줍고 치우는 활동을 뜻합니다.<br>우리나라에서는 줍깅(줍다 + 조깅)이라고도 불립니다.</p>
        </div>
    </div>

</section>

<section class="introContent_section_02">
    <div class="contentContainer">
        <div class="textBox">
            <p class="title">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/woman-running-light-skin-tone_1f3c3-1f3fb-200d-2640-fe0f.png" alt="">
                <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/325/man-running-light-skin-tone_1f3c3-1f3fb-200d-2642-fe0f.png" alt="">
            </p>
            <p class="titleSub">플로깅, 러닝 + 근력운동 효과</p>
            <p class="text">달리면서 지방을 태우는 것은 물론 쓰레기를 줍기 위해 몸을 구부릴 때 근력까지 강화할 수 있어 운동 효과가 큽니다. 이러한 여러 장점들로 인해 MZ세대에서 새로운 운동 트렌드로 자리 잡았고 각종 SNS에 인증샷을 남기며 자연스럽게 유행이 되었습니다.</p>
        </div>

        <div class="slideBox">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${ path }/resources/imgFile/ploIntroducePage_img.png" class="d-block w-100" alt="slideImg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="introContent_section_03">
    <h3>플로깅 관련 기사 클립</h3>

    <div class="contentBox">
        <div class="itemBox itemBox_1">
            <img loading="lazy" src="https://webresource.hidoc.co.kr/design/images/logo_hidoc.png" width="" height="30" alt="신문사logo">
            <h4>지구의 날, 환경과 건강을 지키는 ‘플로깅’ 하는 법</h4>
            <p>플로깅(Plogging)은 ‘이삭을 줍는다’는 뜻의 스웨덴어 Plocka upp과 영단어 Jogging의 합성어로 달리면서 쓰레기를 줍는 친환경 조깅을 의미한다. 이번 지구의 날 플로깅에 도전해보면 어떨까? 혼자 하기도 함께 하기도 좋은 플로깅의 방법과 운동 효과를 알아보았다.</p> 
            <strong><i class="bi bi-person"></i>하이닥 운동상담 김정현</strong>
            <a class="o_moreBtn main-middle-btn-article1" href="https://www.hidoc.co.kr/healthstory/news/C0000690188" target="_blank">기사 전문 보기 <i class="bi bi-chevron-double-right"></i></a>
        </div>
        <div class="itemBox itemBox_2">
            <img loading="lazy" src="https://img.etnews.com/2022/etnews/images/et_logo_sp40.png" width="" height="30" alt="신문사logo" style="background-color: #0f0f32;">
            <h4>“운동하면서 친구도 만들어요” 요즘 세대 '플로깅' 인기</h4>
            <p>이번 5월 플로깅데이는 참여 가능 인원을 50명으로 제한했는데, 접수 개시 5분 만에 120여개 이상 신청이 몰리며 조기 마감됐다. 등산이나 조깅처럼 격한 운동이 아니기 때문에 봉사 과정에서 담소를 나누면서 참가자 간 친분을 쌓을 수 있어 좋았다는 반응이 많았다.</p> 
            <strong><i class="bi bi-person"></i>이형두 기자</strong>
            <a class="o_moreBtn main-middle-btn-article1" href="https://www.etnews.com/20220522000047" target="_blank">기사 전문 보기 <i class="bi bi-chevron-double-right"></i></a>
        </div>
        <div class="itemBox itemBox_3">
            <img loading="lazy" src="https://bravo.etoday.co.kr/images/bravo_footer_logo.png?v=2" width="" height="30" alt="신문사logo" style="background-color: #353a38;">
            <h4>플로깅, 나도 지구도 건강해지는 특별한 운동</h4>
            <p>한유사랑 이타서울 대표는 “플로깅은 환경과 인간에 대한 배려의 마음을 사회에 나눌 수 있는 선한 인간다움의 순간”이라며 플로깅의 가치를 설명했다. 이어 “쓰레기를 줍는것은 적극적인 선행 활동이자, 삶의 품격을 높이고 주변의 공감을 끌어낼 수 있다”고 덧붙였다.</p> 
            <strong><i class="bi bi-person"></i>문혜진 기자</strong>
            <a class="o_moreBtn main-middle-btn-article1" href="https://bravo.etoday.co.kr/view/atc_view.php?varAtcId=12727" target="_blank">기사 전문 보기 <i class="bi bi-chevron-double-right"></i></a>
        </div>
    </div>

</section>

<section class="introContent_section_04">
    <h3>플로깅 관련 영상</h3>

    <div class="videoContainer">
        <div class="videoBox box_01">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/7XrxTrejx8w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <p><i class="bi bi-youtube"></i> <span>환경부 | </span>요즘 유행하는 북유럽 운동문화 플로깅! 건강을 지키며 환경도 지켜요! </p>
        </div>
        <div class="videoBox box_02">
            <iframe width="560" height="315" src="https://www.youtube.com/embed/dZvyeAxCQCI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <p><i class="bi bi-youtube"></i> <span>14F |</span> 
                ‘미세플라스틱 오염 지역’ 세계 2위 등극 우리에게 ‘플로깅’이 필요한 이유</p>
        </div>
    </div>
</section>

<section class="introContent_section_05">
    <h3>플로깅, 쓰담쓰담과 함께 시작해봐요</h3>

    <div class="buttonBox">
        <div class="button createClubBtn">
            <p>
                플로깅 고수이신가요?<br>
                그 노하우를 살려 모임의 리더가 되어보세요!
            </p>
            <c:if test="${not empty loginMember }">
            	<a href="${ path }/plogroup/createPloGroup""><i class="bi bi-plus-circle-fill"></i> 모임 만들기 </a>
            </c:if>
            <c:if test="${empty loginMember }">
             	<a href="${path }/member/login" id="logincheck3"><i class="bi bi-plus-circle-fill"></i> 모임 만들기 </a>
            </c:if>
        </div>

        <div class="button findClubBtn">
            <p>
                플로깅을 시작해보시고 싶으신가요?<br>
                마음에 쏙 드는 모임을 찾아보세요!
            </p>
            <a href="${ path }/ploboard/ploGroupList"><i class="bi bi-search"></i> 모임 검색하기</a>
        </div>
    </div>
</section>
<script>
	// 모임 생성하기 클릭시 로그인 확인
	$(document).ready(() => {
		$("#logincheck3").on("click", () => {
			alert("로그인 시 이용 가능합니다.");
		});
	});
</script>

<jsp:include page="/views/common/footer.jsp" />