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
                    <a href="${ path }/member/myPage">마이 페이지</a>
                </div>
                <div class="menuList">
                    <span><img src="${ path }/resources/imgFile/checkblue_icon.png" alt="Check Icon"></span>
                    <a href="javasript:" style="font-weight: bold;">나의 활동</a>
                </div>
                <div class="menuList"><a href="${ path }/indiboard/indilist">개인 플로깅 인증</a></div>
            </div>
        </div>
        <div class="ma_Content">
            <div class="mc_1">
                <div class="mc_1_1">
                    <div>나의 캘린더</div>
                </div>
                <div class="mc_1_2">
                    <div class="ma_calendar1">
                        <div class="mc_img">
                            <img src="${ path }/resources/imgFile/달력.png">
                        </div>
                        <div class="cal_nav">
                            <a href="javascript:;" class="nav-btn go-prev">prev</a>
                            <div class="year-month"></div>
                            <a href="javascript:;" class="nav-btn go-next">next</a>
                        </div>
                    </div>
                    <div class="ma_calendar2">
                        <div class="sec_cal">
                            <div class="cal_wrap">
                                <div class="days">
                                    <div class="day">MON</div>
                                    <div class="day">TUE</div>
                                    <div class="day">WED</div>
                                    <div class="day">THU</div>
                                    <div class="day">FRI</div>
                                    <div class="day">SAT</div>
                                    <div class="day">SUN</div>
                                </div>
                            <div class="dates"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mc_2">
                <div class="mc_2_1">
                    <div>목표 수행 현황</div>
                </div>
                <div class="mc_2_2">
                    <div class="mc22_1">
                        <form action="">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>보고싶은 달을 선택해주세요!</option>
                                <option value="1">1월</option>
                                <option value="2">2월</option>
                                <option value="3">3월</option>
                                <option value="4">4월</option>
                                <option value="5">5월</option>
                                <option value="6">6월</option>
                                <option value="7">7월</option>
                                <option value="8">8월</option>
                                <option value="9">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                        </form>
                    </div>
                    <div class="mc22_2">
                    <div class="mc22_21">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                30km 걷기!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                종량제 100ℓ 가득!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                플라스틱 100대 처치!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                담배꽁초 100개 줍줍!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                        </ul>
                    </div>
                    <div class="mc22_22">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                한강공원 플로깅 2회!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                플로깅 모임 생성!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                인스타그램 업로드!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>
                            <li class="list-group-item">
                                추천 코스 플로깅!
                                <span class="badge bg-primary rounded-pill">완료</span>
                            </li>  
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
            <div class="mc_3">
                <div class="mc_3_1">
                    <div>올해 목표 달성 현황</div>
                </div>
                <div class="mc_3_2">
                    <div class="mc_32_1">
                        <form action="">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>보고싶은 연도를 선택해주세요!</option>
                                <option value="2020년">2020년</option>
                                <option value="2021년">2021년</option>
                                <option value="2022년">2022년</option>
                            </select>
                        </form>
                    </div>
                    <div class="mc_32_2">
                        <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
                        </div>
                        <div class="percent">
                            <span class="percent_number">75</span>% 달성!
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
<jsp:include page="/views/common/footer.jsp" />