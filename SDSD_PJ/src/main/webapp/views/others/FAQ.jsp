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
	                                <p><span class="title">A<em>.</em></span> 쓰레기통 찾기 페이지에서 확인 가능합니다! 
	                                	<span onclick="location.href='${ path }/others/trash'" style="color: rgb(73, 119, 245); border-bottom:1px solid rgb(73, 119, 245);">
	                                		<i class="bi bi-link-45deg"></i> 페이지 바로가기
	                                	</span>
	                               </p>
	                    </div>
	                </li>
	                <li>
	                            <a><span class="title">Q<em>.</em></span> 쓰담쓰담 랭킹은 어떤 기준으로 정해지는건가요?</a>
	                    <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 회원가입 후 등록한 인증 게시판의 개수를 기준으로 순위를 매기고 있습니다. 
	                        <span class="o_accordion_text_sub"></span></p>
	                    </div>
	                </li>
	                <li>
	                    <a><span class="title">Q<em>.</em></span> 모임이나 회원을 신고할 수 있는 방법이 있나요?</a>
	                    <div class="textBox">
	                        <p><span class="title">A<em>.</em></span>
	                        	우선 쓰담쓰담을 이용하시면서 불쾌한 경험을 하게 한 점 사과드립니다. <br>신고를 원하는 모임이나 회원이 있을 경우 쓰담쓰담 운영자에게 메일 보내주시면 조속히 처리하겠습니다! <br>
	                        	<span style="color: rgb(73, 119, 245); border-bottom:1px solid rgb(73, 119, 245);">
	                                		<i class="bi bi-envelope"></i> admin@sdsd.co.kr
	                             </span>
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