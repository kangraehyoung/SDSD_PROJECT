<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

 <div class="faq_title">

        <section>
            <h2>FAQ</h2>
        </section>
    </div>
<div class="o_accordion_section">

    <div class="content_container">
    <section>
        <div class="inner_box">
            <ul class="o_accordion">
            <li>
              <a><span class="title">Q<em>.</em></span> 입주 상담을 신청했는데 이후 과정은 어떻게 되나요?</a>
              <div class="textBox">
                <p><span class="title">A<em>.</em></span> 전담 커뮤니티 매니저가 월-금 10:00AM~7:00PM 내 직접 연락을 드리고 전화로 상담을 도와드립니다.<br>(통화가 어려우신 경우 카톡 및 문자 상담도 가능합니다.)<br>상담 후 방문 투어를 신청해 직접 공간을 살펴보실 수 있으며 계약서 작성 후 입주 가능합니다.
                <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
                      <a><span class="title">Q<em>.</em></span> 직접 방문하는 것 외에 공간을 살펴볼 수 있는 방법이 있나요?</a>
              <div class="textBox">
                      <p><span class="title">A<em>.</em></span> 직접 방문이 어려우신 경우, 사진 및 VR 영상을 통해 공간을 살펴보실 수 있으며<br>전화 투어를 통해 공간 및 서비스에 대해 안내 받으실 수 있습니다. 전화 투어를 희망하시는 경우 상담 시 말씀해주세요.
                  <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
                      <a><span class="title">Q<em>.</em></span> 단기 계약이 가능한가요?</a>
              <div class="textBox">
                         <p><span class="title">A<em>.</em></span> 최소 3개월부터 1개월 단위로 자유롭게 계약이 가능합니다.
                  <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
                      <a><span class="title">Q<em>.</em></span> 보증금은 얼마인가요? 보증금 조정이나 전세가 가능한가요?</a>
              <div class="textBox">
                      <p><span class="title">A<em>.</em></span> 3~5개월 계약 시 보증금은 300만 원이고, 6개월 이상 계약 시 보증금은 1,000~2,000만 원으로 룸 타입별로 상이합니다. 보증금 조정 및 전세 계약은 불가합니다.
                  <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
              <a><span class="title">Q<em>.</em></span> 게스트를 초대할 수 있나요?</a>
              <div class="textBox">
                  <p><span class="title">A<em>.</em></span> 게스트 초대가 가능하며, 함께 라운지 등 공용 공간을 이용하실 수 있습니다.<br>단, 코로나 19 예방을 위해 5인 집합 금지 수칙을 준수 및 방문자 정보 기록을 요청드립니다.
                  <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
              <a><span class="title">Q<em>.</em></span> 전입 신고가 가능한가요?</a>
              <div class="textBox">
                  <p><span class="title">A<em>.</em></span> 전입 신고 가능합니다.
                  <span class="o_accordion_text_sub"></span></p>
              </div>
            </li>
            <li>
                <a><span class="title">Q<em>.</em></span> 사업자 등록이 가능한가요?</a>
                <div class="textBox">
                    <p><span class="title">A<em>.</em></span> 소프트웨어 개발, 컨설팅 등 자택에서 사업자 등록이 가능한 업종이라면 가능하며 정확한 내용은 세무사와 확인 부탁드립니다.<br>
                        전입 신고와 사업자등록은 향후 신규 오픈 지점에 따라 상이해질 수 있습니다.
                    <span class="o_accordion_text_sub"></span></p>
                </div>
              </li>
              </ul>
          </div>
    </section>
    </div>
</div>




<jsp:include page="/views/common/footer.jsp" />