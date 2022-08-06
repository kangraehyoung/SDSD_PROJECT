<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

    <section class="Ranking">

        <div class="first_tool"> <!-- 첫번째 하늘색 틀-->
            <div class="r_head">
                <div class="r_title">
                    <div class="rt_1">
                        <h1>
                            쓰담쓰담 랭킹 
                            <img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/trophy_1f3c6.png" alt="trophy" style="width: 40px;">
                        </h1>
                    </div>
                    <div class="rt_2">
                        <p>
                            쓰담쓰담에서 내디딘 작은 발걸음 하나가 <br>
                            지구를 바꾸고 있습니다.🏃‍♀🏃‍♂
                        </p>
                    </div>
                </div>
                <div class="r_emoji">
                    <img src="https://emojipedia-us.s3.amazonaws.com/source/skype/289/seedling_1f331.png" alt="seedling">
                </div>
            </div>
        </div>
        <div class="second_tool">
            <div class="r_body">
                <div class="rb_1">
                    <h2>개인 플로깅 활동 랭킹</h2>
                    <form action="${path }/others/indiranking" method="post">
                    <div class="rb_1_list">
                        <div class="rbl1">
                            <div><img src="${ path }/resources/imgFile/goldmedal.png" alt=""></div>
                            <div>이정후</div>
                            <div>51회</div>
                        </div>
                        <div class="rbl2">
                            <div><img src="${ path }/resources/imgFile/silvermedal.png" alt=""></div>
                            <div>김태진</div>
                            <div>27회</div>
                        </div>
                        <div class="rbl2">
                            <div><img src="${ path }/resources/imgFile/bronzemedal.png" alt=""></div>
                            <div>이용규</div>
                            <div>19회</div>
                        </div>
                        <details>
                            <summary>랭킹 더보기</summary>
                            <div class="rbl3">
                                <div>5.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>6.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>7.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>8.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>9.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>10.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                        </details>
                    </div>
				</form>
                </div>
                <div class="rb_2">
                    <h2>모임별 플로깅 활동 랭킹</h2>
                    <div class="rb_2_list">
                        <div class="rbl1">
                            <div><img src="${ path }/resources/imgFile/goldmedal.png" alt=""></div>
                            <div>이정후</div>
                            <div>51회</div>
                        </div>
                        <div class="rbl2">
                            <div><img src="${ path }/resources/imgFile/silvermedal.png" alt=""></div>
                            <div>김태진</div>
                            <div>27회</div>
                        </div>
                        <div class="rbl2">
                            <div><img src="${ path }/resources/imgFile/bronzemedal.png" alt=""></div>
                            <div>이용규</div>
                            <div>19회</div>
                        </div>
                        <details>
                            <summary>랭킹 더보기</summary>
                            <div class="rbl3">
                                <div>5.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>6.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>7.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>8.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>9.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                            <div class="rbl3">
                                <div>10.</div>
                                <div>이용규</div>
                                <div>19회</div>
                            </div>
                        </details>
                    </div>
                </div>
            </div>
        </div>
        

    </section>
    
    
<jsp:include page="/views/common/footer.jsp" />