<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

 <jsp:include page="/views/common/header.jsp" />
<section class="titleSection">

        <div class="mt1">
            <div class="mainIcon">
                    <svg height="100" stroke="#3699c7" stroke-width="2" class="text-line" width="100%">
                        <text x="50%" dominant-baseline="central" text-anchor="middle" y="50%">쓰담쓰담</text>
                    </svg> 
                <div class="mi_img">
                    <img class="mi_img_1" src="${ path }/resources/imgFile/아픈지구아이콘.png" alt="">
                    <a href="${ path }/ploboard/ploGroupList"><img class="mi_img_2" src="${ path }/resources/imgFile/지구아이콘2.png" alt="plogging icon"></a>
                </div>
                <div class="mi_coment">
                    <p>지구를 여러분의 손으로 바꿔주세요!</p>
                </div>
            </div>
            <div class="mainScroll">
                <div class="srollDown_new" style="text-align: center;">
                    <a href="#nextSection">
                        <img src="${ path }/resources/imgFile/scrolldown_main.png" alt="scrollDown icon">
                    </a>
                </div>
                <h2></h2>
            </div>
        </div>
    </section>
    
    <section class="mainSection_01" id="nextSection">
        <div class="ms1">
            <div class="ms1_content">
                <div class="ms1t_1">
                    <span class="mst11">쓰담</span>
                    <span class="mst12">쓰담</span>
                    <span class="mst13">과</span>
                </div>
                <div class="ms1t_2">
                    <%-- <img class="mst21" src="${ path }/resources/imgFile/지구아이콘2.png" alt="earthicon"> --%>
                    <span class="mst22">작은</span>
                    <span class="mst23">행동</span>
                </div>
                <div class="ms1t_3">
                    <span class="mst31">하나</span>
                    <span class="mst32">하나</span>
                    <span class="mst33">모아</span>
                </div>
                <div class="ms1t_4">
                    <span class="mst41">함께</span>
                    <span class="mst42">지켜봐요 <i class="bi bi-emoji-wink"></i></span>
                </div>
                <div class="ms1t_5">
                    <span class="mst51"></span>
                    <span class="mst52">플로깅</span>
                    <span>모임은 물론</span>
                    <span class="mst52">챌린지</span>
                    <span>까지 다 준비해두었습니다<i class="bi bi-stars"></i></span>
                </div>
            </div>
            <div class="ms1_img">
                <div class="msi_1">
                    <img src="https://r2.community.samsung.com/t5/image/serverpage/image-id/2858216iF966CF430D380489/image-size/large?v=v2&px=999" alt="">
                </div>
            </div>
        </div>
    </section>

    <section class="mainSection_02">
        <div class="ms2">
            <div class="ms2_img">
                <div class="msi_2">
                    <img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/seedling_1f331.png" alt="">
                </div>
            </div>
            <div class="ms2_content">
                <div class="ms2t_1">
                    <img src="${ path }/resources/imgFile/crown1.png" alt="">
                </div>
                <div class="ms2t_2">
                    <p>쓰담쓰담 이달의 랭킹</p>
                </div>
                <div class="ms2t_3">
                    <div><img src="${ path }/resources/imgFile/goldmedal.png" alt=""></div>
                    <div>공병줍기크루</div>
                    <div>21회</div>
                </div>
                <div class="ms2t_4">
                    <div><img src="${ path }/resources/imgFile/silvermedal.png" alt=""></div>
                    <div>인계동아이언맨</div>
                    <div>16회</div>
                </div>
                <div class="ms2t_5">
                    <div><img src="${ path }/resources/imgFile/bronzemedal.png" alt=""></div>
                    <div>사직동불빠따</div>
                    <div>11회</div>
                </div>
                <button onclick="location.href='${ path }/others/ranking';">랭킹 더보기</button>
                <!-- <div class="ms2t_6">
                    <a href="">랭킹 더보기</a>
                </div> -->
                <div class="ms2t_7">
                    <p>* 개인 랭킹과 더많은 정보를 보고 싶다면..</p>
                    <p>랭킹 더보기를 눌러주세요!</p>
                </div>
            </div>
        </div>
    </section>

    <section class="mainSection_03">
        <div class="ms3"> <!-- 두번째 하늘색 틀 -->
            <div class="ms3_textBox"> <!-- 문자 박스 -->
                <div class="ms3_1">
                    <span>지구</span> 도
                </div>
                <div class="ms3_2">
                    <span>건강</span >도🏃
                </div>
                <div class="ms3_3">
                    지킬 <span>준비</span>
                </div>
                <div class="ms3_icon">
                    <img src="${ path }/resources/imgFile/지구아이콘2.png" alt="earthIcon">
                </div>
                <div class="ms3_4">
                    되셨나요?
                </div>
                <div class="ms3_5">
                    그렇다면
                </div>
            </div>
    		
    		
            <div class="ms3_abox">
            
    		<button onclick="location.href='${ path }/ploboard/ploGroupList';">플로깅 모임 검색 <i class="bi bi-search"></i></button>
                <%-- <div class="ms3_search"> 
                    <a href="${ path }/ploboard/ploGroupList" class="ms3s">플로깅 모임 검색</a>
                </div> --%>
            </div>
        </div>
    </section>
 <jsp:include page="/views/common/footer.jsp" />
 