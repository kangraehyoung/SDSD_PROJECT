<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="faq_section">

	<div class="faq_title">
       <div>
       		<h2>FAQ</h2>
       		<p>
       			회원들이 자주 묻는 질문들! 보기 좋게 모아봤어요<i class="bi bi-emoji-wink"></i><br>
       			<span>*궁금하신 사항에 대한 답변이 없다면 문의글 작성 부탁드립니다.</span>
       		</p>
       		<button type="button" class="btn btn-primary">문의글 작성 바로가기 <i class="bi bi-pencil"></i></button>
       </div>
	</div>
	<div class="o_accordion_section">
	    <div class="content_container">
	        <div>
	            <div class="inner_box">
	                <ul class="o_accordion">
	                <li>
	                    <a><span class="title">Q<em>.</em></span> 플로깅 할때 필요한 준비물이 있나요?</a>
	                    <div class="textBox">
	                    <p><span class="title">A<em>.</em></span> 
	                    	<i class="bi bi-check-lg"></i> 쓰레기 담을 봉투 : 환경 보호를 위해 에코백이나 못 쓰는 가방을 사용하는 것을 추천드려요! 종량제 봉투를 활용하셔도 좋습니다. <br>
	                    	<i class="bi bi-check-lg"></i> 다회용 장갑 혹은 집계 : 위생을 지키고 부상을 방지하기 위해 꼭 챙겨주세요!<br>
	                    	<i class="bi bi-check-lg"></i> 편한 옷차림과 편한 시발 : 벌레 물림이나 풀독을 방지하기 위해 긴 바지 차림을 추천드립니다.
	                    </div>
	                </li>
	                <li>
	                            <a><span class="title">Q<em>.</em></span> 플로깅 모임은 어떻게 만들수 있나요</a>
	                    <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 
	                            	쓰담쓰담 회원이시라면 누구나 플로깅 모임을 만드실 수 있습니다! <br>
	                            	아직 회원이 아니시라면 지금 바로 회원가입 하신 후 모임 생성 페이지를 통해 플로깅 모임의 리더가 되어주세요!
	                            </p>
	                    </div>
	                </li>
	                <li>
	                            <a><span class="title">Q<em>.</em></span> 쓰레기통 위치가 궁금해요</a>
	                    <div class="textBox">
	                                <p><span class="title">A<em>.</em></span> 쓰레기통 지도를 확인해주세요!
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                </li>
	                <li>
	                            <a><span class="title">Q<em>.</em></span> 플로깅 질문 2</a>
	                    <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 3~5개월 계약 시 보증금은 300만 원이고, 6개월 이상 계약 시 보증금은 1,000~2,000만 원으로 룸 타입별로 상이합니다. 보증금 조정 및 전세 계약은 불가합니다.
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                </li>
	                <li>
	                    <a><span class="title">Q<em>.</em></span> 플로깅 질문 3</a>
	                    <div class="textBox">
	                        <p><span class="title">A<em>.</em></span> 게스트 초대가 가능하며, 함께 라운지 등 공용 공간을 이용하실 수 있습니다.<br>단, 코로나 19 예방을 위해 5인 집합 금지 수칙을 준수 및 방문자 정보 기록을 요청드립니다.
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                </li>
	                <li>
	                    <a><span class="title">Q<em>.</em></span> 플로깅 질문 4</a>
	                    <div class="textBox">
	                        <p><span class="title">A<em>.</em></span> 전입 신고 가능합니다.
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                </li>
	                <li>
	                    <a><span class="title">Q<em>.</em></span> 플로깅 질문 5</a>
	                    <div class="textBox">
	                        <p><span class="title">A<em>.</em></span> 소프트웨어 개발, 컨설팅 등 자택에서 사업자 등록이 가능한 업종이라면 가능하며 정확한 내용은 세무사와 확인 부탁드립니다.<br>
	                            전입 신고와 사업자등록은 향후 신규 오픈 지점에 따라 상이해질 수 있습니다.
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                    </li>
	                    </ul>
	                </div>
	        </div>
	    </div>
	</div>

</section>


<jsp:include page="/views/common/footer.jsp" />