<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<section class="findClub_section">

    <div class="first_tool"> <!-- 첫번째 하늘색 틀-->
        <div class="head_title"> <!-- 요소 모음 div -->
            <div class="main_text"> <!-- 텍스트 div -->
                <div class="titleTextBox">
                    <h2><img src="${ path }/resources/imgFile/findTeam.png" alt="trashCan">플로깅 모임 찾기</h2>
                    <p>지역, 모임 특징 등 키워드를 검색해 원하는 모임에 합류해보세요!</p>
                </div>
            </div>
            <div class="ht_search">
                <form class="ht_1">
                    <div class="ht_2">
                        <input type="text">
                        <button type="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="ht_keyword">
                <div><p>추천 키워드</p></div>
                <div class="ht_hash">
                    <a href="#">#강남구</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#경기도</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#20대</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#한강</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#남산</a>
                </div>
            </div>
        </div>
        
        <div class="buttonBox">
            <button>모임 만들기</button>
            <button>가입한 모임 바로가기</button>
        </div>
    </div>


    <div class="contentWrap">
        <div class="contentBody">
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
        </div>
        <div class="contentBody">
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
        </div>
    
        <div class="contentBody">
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
    
            <!-- 첫번째 줄  1번째 모임 -->
            <div class="contentBox">
                <div class="imgBox" onclick="location.href='/'">
                    <img src="https://www.fastfive.co.kr/wp-content/uploads/2021/05/3_interior_1.png" alt="img">
                    <div class="hoverBox">
                        <p>리더 | </p>
                        <p>활동 지역 | </p>
                        <!-- a 태그가 먹히지 않으니 div imgBox onclick 스크립트를 통해 상세페이지 이동! -->
                        <a>모임 상세보기</a>
                    </div>
                </div>
                <div class="textBox">
                    <h3 class="mainText">모임이름</h3>
                </div>
                <div class="iconBox">
                    <i class="bi bi-heart-fill"></i><span>999</span>
                    <i class="bi bi-people-fill"></i><span>51</span>
                </div>
            </div>
        </div>
    </div>
    
</section>

<jsp:include page="/views/common/footer.jsp" />