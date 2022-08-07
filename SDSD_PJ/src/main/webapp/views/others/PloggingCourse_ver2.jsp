<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<section class="plogCourse_section_01">
    <div class="titleBox">
        <h2><img src="https://emojipedia-us.s3.amazonaws.com/source/microsoft-teams/337/man-running-light-skin-tone_1f3c3-1f3fb-200d-2642-fe0f.png" alt="clubIcon">플로깅 추천 코스 </h2>
    </div>
</section>

<section class="plogCourse_section_02">
    <div class="plogCourseTab_row_01">
        <div>
            <div class="btn_container">
                <section>
                    <div id="plogCourseTab_Icon_01" class="btnBox active">
                        <div class="textItem">
                        <p class="text">서울 강남</p> 
                        </div>
                    </div>
                    <div id="plogCourseTab_Icon_02" class="btnBox">
                        <div class="textItem">
                        <p class="text">서울 강북</p> 
                        </div>
                    </div>
                    <div id="plogCourseTab_Icon_03" class="btnBox">
                        <div class="textItem">
                        <p class="text">경기 남부</p> 
                        </div>
                    </div>
                    <div id="plogCourseTab_Icon_04" class="btnBox">
                        <div class="textItem">
                        <p class="text">경기 북부</p> 
                        </div>
                    </div>
                    <%-- <div id="plogCourseTab_Icon_05" class="btnBox">
                        <div class="textItem">
                        <p class="text">부산</p> 
                        </div>
                    </div> --%>
                </section>
            </div>
    
        </div>
    </div>



    <div class="plogCourseTab_row_02">
		<!-- 서울 강남 -->
		<div id="plogCourseTab_Info_01" class="content_container content_container_01 active">
			<section>
				<div class="contentBox">
					<div class="itemBox itemBox_1"> 
						<h4>잠실 석촌 호수</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 한 바퀴 3km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img.redbull.com/images/q_auto,f_auto/redbullcom/2020/5/9/rgcmuwb1s2br5nvpzrxd/j1" alt="" width="100%">
						<p>'벨리곰'과 함께 사진을 찍기 위해 찾아가는 관광 명소 중 하나지만, 달리는 러너들에게도 인기 있는 장소입니다. 석촌호수는 호수를 따라 돌기 때문에 순환코스로 이루어져 초보 러너들에게 안성맞춤 코스입니다. 좀 더 달리고 싶을 때도 코스의 위험 요소를 따로 알아볼 필요 없이 달릴 수 있습니다. 특히, 100m마다 거리가 표시되어 있어 거리를 확인하기에도 아주 좋습니다. 질 무렵부터 러닝을 시작하면 석촌호수 야경을 보며 마무리할 수 있다고 하니, 해가 길어진 요즘, 퇴근 후 달려보는 것은 어떨까요?</p> 
					</div>
					<div class="itemBox itemBox_2">
						<h4>여의도 공원</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 2.5km</p>
						<p class="courseInfo"><i class="bi bi-reception-1"></i> 난이도 : 하</p>
						<img src="https://img.redbull.com/images/q_auto,f_auto/redbullcom/2020/5/9/x1dwggewf4l5e0lvrk7b/y" alt="" width="100%">
						<p>여의도 공원은 남산 공원과 마찬가지로 발목과 무릎에 무리가 가지 않고 미끄럼 방지에도 효과적인 우레탄으로 포장된 길이 있습니다. 가장 큰 장점은 회사와 가까이 위치한 사람들은 퇴근 후 러닝을 바로 즐길 수 있다는 점입니다. 보행로가 따로 잘 조성되어 있는 점도 하나의 장점이죠. 여의도 공원은 다른 공원에 비해 단정한 느낌을 주며 고층 빌딩들의 은은한 빛을 받아 하루를 마무리하기에 아주 좋은 곳입니다. 좋은 날, 가볍게 입고 선선한 바람과 따스한 햇살을 느끼며 달려보세요!</p> 
					</div>
					<div class="itemBox itemBox_3">
						<h4>동작대교 남단 <i class="bi bi-arrow-right"></i> 한남대교 남단</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이:  5 km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://t1.daumcdn.net/cfile/blog/242A274255D2E72F0D" alt="" width="100%">
						<p>평탄한 코스가 강변을 따라 뻗어 있어 가볍게 산책과 러닝을 즐기는 사람들에게 최적의 코스입니다. 달리면서 보이는 넓은 한강과 건너편의 남산의 모습이 어우러져 어느새 도심 속에서 자연을 즐길 수 있는 스스로를 발견하게 되는 코스. 특히 다리를 건너지 않는 코스로 바로 옆에서 달리는 차들을 만날 일이 없다는 것이 장점입니다.</p> 
					</div>
				</div>
			</section>
		</div>

		<!-- 서울 강북 -->
		<div id="plogCourseTab_Info_02" class="content_container content_container_01">
			<section>
				<div class="contentBox">
					<div class="itemBox itemBox_1"> 
						<h4>마포대교</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 한 바퀴 3.5km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img.wkorea.com/w/2018/07/style_5b52b0a698fd3-1200x800.jpg" alt="" width="100%">
						<p>서강대교 북단에서 한강변을 끼고 달리기 시작해 마포대교를 건너는 코스입니다. 길이 평탄해 초보자 러너들도 쉽게 도전해볼 수 있는 코스로, 시간도 30분으로 적당해 체력을 기르기 위한 코스로 적당한 코스입니다. 만약 너무 짧게 느껴진다면 마포대교 남단을 기점으로 돌아오는 것까지 한 코스로 달려도 좋습니다. 낮에 달려도 좋지만 밤에 달리면 서강대교 북단에서 마포대교 북단까지 달리면서 외국 못지 않은 야경을 즐길 수 있습니다!</p> 
					</div>
					<div class="itemBox itemBox_2">
						<h4>남산공원</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이 : 남측 순환로 8km</p>
						<p class="courseInfo"><i class="bi bi-reception-3"></i> 난이도 : 중상</p>
						<img src="https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fredbull%2F74b5d6e52be7497d9bbc4778297fed91.JPG" alt="" width="100%">
						<p>이보다 더 서울다운 코스가 있을까요? 남산이라고 하면 야경 명소로 유명한 곳이라 러너라면 누구나 이곳을 선망합니다. 초보자 러너부터 전문 러너까지 실력에 따른 코스가 있어 '러너들의 성지'라고 불리기도 하는데요. 특히, 오르막이 많고 내리막과 반복되는 남측 순환로 코스는 초보자에게는 힘든 코스일 수 있으니 주의하세요!
						</p> 
					</div>
					<div class="itemBox itemBox_3">
						<h4>서울숲</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이:  3km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img.hani.co.kr/imgdb/resize/2019/0606/00500040_20190606.JPG" alt="" width="100%">
						<p>도심에서 진정한 자연을 맛볼 수 있습니다. 서울에서 흙 길을 찾기가 쉽지 않지만, 서울숲은 잘 정돈된 흙 길이 조성되어 있습니다. 또한 길이 평탄해 초보 러너들이 러닝을 즐기기에 좋으며, 자전거에게 방해받지 않고 달릴 수 있습니다. 정겨운 흙 내음 맡으며 싱그러운 초록의 오솔길을 달려보세요.</p> 
					</div>
				</div>
			</section>
		</div>
	
		<!-- 경기 남부 -->
		<div id="plogCourseTab_Info_03" class="content_container content_container_01">
			<section>
				<div class="contentBox">
					<div class="itemBox itemBox_1"> 
						<h4>수원화성성곽길</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 12 km</p>
						<p class="courseInfo"><i class="bi bi-reception-3"></i> 난이도 : 중상</p>
						<img src="https://ggtour.or.kr/cgi/upload_img/2021841370_editor_image.jpg" alt="" width="100%" height="200px">
						<p>우리나라 성곽건축사상 가장 독보적으로 평가받고있으며 1997년 유네스코 세계문화유산 으로 지정된 수원 화성을 돌아보며 우리문화의 우수성을 느낄 수 있는 역사·사적길입니다! 곳곳에 화장실과 쓰레기통이 있어 플로깅 코스로 매우 적합한 곳입니다!</p> 
					</div>
					<div class="itemBox itemBox_2">
						<h4>의왕 백운호수</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이 :3.9km</p>
						<p class="courseInfo"><i class="bi bi-reception-3"></i> 난이도 : 중상</p>
						<img src="https://www.m-i.kr/news/photo/202201/889585_657467_5927.jpg" alt="" width="100%"  height="200px">
						<p>백운호수를 돌아 이어지는 산책길로 주변 풍경을 감상하며 걷기 좋은 곳입니다! 유동인구가 많은 만큼 버려져 있는 쓰레기도 많은 곳으로 플로깅 활동을 통해 백운호수를 깨끗하게 만들어보러 가보시는 것도 좋을 것 같습니다!</p> 
					</div>
					<div class="itemBox itemBox_3">
						<h4>궁평항<i class="bi bi-arrow-right"></i>전곡항</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이:  19.5km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중</p>
						<img src="https://blog.kakaocdn.net/dn/AI7xE/btqK3DlhtK8/SkJ0hrBPq57fxHmzqK9LGk/img.png" alt="" width="100%" height="200px">
						<p>해변에는 100년이 넘게 자란 곰솔들이 숲을 이루고 있어 볼거리가 많은 코스입니다. 산책길로 새롭게 조성된 코스라 화장실, 쓰레기통 등 편의시설이 많아 플로깅하기에 최적의 장소입니다. 새로운 장소에서 플로깅을 해보고 싶으시다면 이 코스를 추천드립니다!</p> 
					</div>
				</div>
			</section>
		</div>

		<!-- 경기 북부 -->
		<div id="plogCourseTab_Info_04" class="content_container content_container_01">
			<section>
				<div class="contentBox">
					<div class="itemBox itemBox_1"> 
						<h4>일산호수공원 산책로</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 5.8 km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/3fuW/image/xVaOXxQnDVtv8lJb_nZ6Oxd7tjU" alt="" width="100%" height="200px">
						<p>국내 최대의 인공호수, 고양세계 꽃박람회, 노래하는 분수대 등 다양한 이벤트와 시설이 설치되어 있습니다!  3 호선 정발산역 하차 2,3 번 출구로 도보 10 분 거리에 위치해있어 뚜벅이들에게도 좋은 장소입니다. 조형물, 인공시냇물, 돌계단 위 보드매니아, 주말 공연 등 다양한 볼거리로 가족단위 나들이에도 추천드립니다!</p> 
					</div>
					<div class="itemBox itemBox_2">
						<h4>임진각평화누리공원</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이 : 남측 순환로 8km</p>
						<p class="courseInfo"><i class="bi bi-reception-3"></i> 난이도 : 중상</p>
						<img src="https://blog.kakaocdn.net/dn/M4r41/btqJ4GwAFtp/f6ifVgUp3fRYr44ul3Qta0/img.jpg" alt="" width="100%" height="200px">
						<p>바람 소리가 기분 좋게 만드는 곳입니다. 넓은 동산에 걸으면서 사진 찍기도 좋은 장소로 플로깅도 하고 인생샷도 건져보시는 것 어떠신가요? 바람이 부는 날이면 빠르게 돌아가는 바람개비도 또 하나의 장관입니다. 독특한 조형물도 있어 구경하느라 시간 가는 줄 모를 수도 있어요!
						</p> 
					</div>
					<div class="itemBox itemBox_3">
						<h4>율곡공원<i class="bi bi-arrow-right"></i>장남교</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이:  18.3km</p>
						<p class="courseInfo"><i class="bi bi-reception-4"></i> 난이도 : 상</p>
						<img src="https://blog.kakaocdn.net/dn/cN7rvX/btrg4JCtPOG/SitVFE9B1catN41pog4yXK/img.jpg" alt="" width="100%" height="200px">
						<p>다양한 표정을 보여주는 코스입니다. 봄부터 가을까지 꽃이 환하게 피는 율곡습지공원부터 시작해 임진강변 자투리땅을 개간해 만든 논둑길을 따라가기도 하고, 마을 사람들이 넘어 다녔을 오솔길을 걷기도 합니다. 임진강과 나란히 가는 구간에서는 강물이 바로 옆으로 흐른다. 안개 자욱한 강마을 길은 신비롭게 느껴지기도 합니다.</p> 
					</div>
				</div>
			</section>
		</div>
		
		<!-- 부산  시간 부족...못하겠음-->
		<%-- <div id="plogCourseTab_Info_05" class="content_container content_container_01">
			<section>
				<div class="contentBox">
					<div class="itemBox itemBox_1"> 
						<h4>마포대교</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이: 한 바퀴 3.5km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img.wkorea.com/w/2018/07/style_5b52b0a698fd3-1200x800.jpg" alt="" width="100%">
						<p>서강대교 북단에서 한강변을 끼고 달리기 시작해 마포대교를 건너는 코스입니다. 길이 평탄해 초보자 러너들도 쉽게 도전해볼 수 있는 코스로, 시간도 30분으로 적당해 체력을 기르기 위한 코스로 적당한 코스입니다. 만약 너무 짧게 느껴진다면 마포대교 남단을 기점으로 돌아오는 것까지 한 코스로 달려도 좋습니다. 낮에 달려도 좋지만 밤에 달리면 서강대교 북단에서 마포대교 북단까지 달리면서 외국 못지 않은 야경을 즐길 수 있습니다!</p> 
					</div>
					<div class="itemBox itemBox_2">
						<h4>남산공원</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이 : 남측 순환로 8km</p>
						<p class="courseInfo"><i class="bi bi-reception-3"></i> 난이도 : 중상</p>
						<img src="https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2Fredbull%2F74b5d6e52be7497d9bbc4778297fed91.JPG" alt="" width="100%">
						<p>이보다 더 서울다운 코스가 있을까요? 남산이라고 하면 야경 명소로 유명한 곳이라 러너라면 누구나 이곳을 선망합니다. 초보자 러너부터 전문 러너까지 실력에 따른 코스가 있어 '러너들의 성지'라고 불리기도 하는데요. 특히, 오르막이 많고 내리막과 반복되는 남측 순환로 코스는 초보자에게는 힘든 코스일 수 있으니 주의하세요!
						</p> 
					</div>
					<div class="itemBox itemBox_3">
						<h4>서울숲</h4>
						<p class="courseInfo"><i class="bi bi-signpost"></i> 길이:  3km</p>
						<p class="courseInfo"><i class="bi bi-reception-2"></i> 난이도 : 중하</p>
						<img src="https://img.hani.co.kr/imgdb/resize/2019/0606/00500040_20190606.JPG" alt="" width="100%">
						<p>도심에서 진정한 자연을 맛볼 수 있습니다. 서울에서 흙 길을 찾기가 쉽지 않지만, 서울숲은 잘 정돈된 흙 길이 조성되어 있습니다. 또한 길이 평탄해 초보 러너들이 러닝을 즐기기에 좋으며, 자전거에게 방해받지 않고 달릴 수 있습니다. 정겨운 흙 내음 맡으며 싱그러운 초록의 오솔길을 달려보세요.</p> 
					</div>
				</div>
			</section>
		</div> --%>
		
		
		
	</div>
</section>


<jsp:include page="/views/common/footer.jsp" />