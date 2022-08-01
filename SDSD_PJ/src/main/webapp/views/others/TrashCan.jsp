<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

  <div class="first_tool"> <!-- 첫번째 하늘색 틀-->
        <div class="head_title"> <!-- 요소 모음 div -->
            <div class="main_text"> <!-- 텍스트 div -->
                <div class="mt_first">
                    <img src="${ path }/resources/imgFile/trashCan.png" alt="trashCan">
                    <h2>쓰레기통 찾기</h2>
                </div>
            </div>
            <div class="sub_text">
                <p>지역 키워드를 검색해 쓰레기통 위치를 탐색해보세요!</p>
            </div>
            <div class="ht_search">
                <form class="ht_1">
                    <div class="ht_2">
                        <input type="text">
                        <button type="submit">
                            <img src="${ path }/resources/imgFile/searchIcon_03.png" alt="search">
                        </button>
                    </div>
                </form>
            </div>
            <div class="ht_keyword">
                <div><p>추천 키워드</p></div>
                <div class="ht_hash">
                    <a href="#">#잠실</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#뚝섬</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#여의도</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#한강</a>
                </div>
                <div class="ht_hash">
                    <a href="#">#북악산</a>
                </div>
            </div>
        </div>
    </div>

    <div class="second_tool_m"> <!-- 두번째 민트색 틀 -->
        <div class="st_map">
            <div class="stm_1">
                <h2>지도<img src="${ path }/resources/imgFile/map.png" alt="map"></h2>
            </div>
            <div id="map"></div> <!-- 지도 -->
            <div class="hAddr">
			<div>
            	<img src="${ path }/resources/imgFile/flag.png" alt="flag">
            </div>
        		<span class="title">현재 위치 :</span>&nbsp;
        		<span id="centerAddr"></span>
    		</div>
               <!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=334344dce2f2aee24efdae6872bcd47a"></script> -->
                <script>
                    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                    var options = { //지도를 생성할 때 필요한 기본 옵션

	                center: new kakao.maps.LatLng(37.520277, 127.122590), //지도의 중심좌표.

	                level: 5 //지도의 레벨(확대, 축소 정도)
                    };
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.520277, 127.122590), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                };  

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 

         	// 마커를 표시할 위치와 title 객체 배열입니다 
            var positions = [
            	// 송파구
            	{
                    title: '<div>GS25한강잠실1호점</div>', 
                    latlng: new kakao.maps.LatLng(37.519580, 127.093538)
                },
                {
                    title: '<div>GS25한강잠실2호점</div>', 
                    latlng: new kakao.maps.LatLng(37.518722, 127.089644)
                },
                {
                    title: '<div>잠실한강공원수영장</div>', 
                    latlng: new kakao.maps.LatLng(37.517753, 127.086164)
                },
                {
                    title: '<div>이랜드잠실선착장</div>',
                    latlng: new kakao.maps.LatLng(37.518323, 127.081430)
                },
                {
                    title: '<div>올림픽공원1번출구</div>',
                    latlng: new kakao.maps.LatLng(37.516561, 127.131514)
                },
                {
                    title: '<div>올림픽공원4번출구</div>',
                    latlng: new kakao.maps.LatLng(37.516649, 127.130839)
                },
                {
                    title: '<div>석촌호수동호</div>',
                    latlng: new kakao.maps.LatLng(37.512013, 127.107796)
                },
                {
                    title: '<div>올림픽공원테니스장</div>',
                    latlng: new kakao.maps.LatLng(37.513240, 127.128620)
                },
                {
                    title: '<div>올림픽공원테니스장</div>',
                    latlng: new kakao.maps.LatLng(37.513240, 127.128620)
                },
                {
                    title: '<div>올림픽공원장미광장</div>',
                    latlng: new kakao.maps.LatLng(37.512745, 127.127314)
                },
                {
                    title: '<div>올림픽회관</div>',
                    latlng: new kakao.maps.LatLng(37.520955, 127.116130)
                },
                {
                    title: '<div>올림픽선수촌아파트</div>',
                    latlng: new kakao.maps.LatLng(37.515273, 127.134085)
                },
                {
                    title: '<div>개룡근린공원</div>',
                    latlng: new kakao.maps.LatLng(37.494524, 127.130494)
                },
                {
                    title: '<div>롯데호텔공항버스</div>',
                    latlng: new kakao.maps.LatLng(37.510681, 127.100553)
                },
                {
                    title: '<div>종합운동장5번출구</div>',
                    latlng: new kakao.maps.LatLng(37.511366, 127.072736)
                },
                {
                    title: '<div>올림픽홀1-3</div>',
                    latlng: new kakao.maps.LatLng(37.51478, 127.12699)
                },
                {
                    title: '<div>올림픽홀1-1</div>',
                    latlng: new kakao.maps.LatLng(37.5150613, 127.1271355)
                },
                {
                    title: '<div>올림픽홀티켓박스</div>',
                    latlng: new kakao.maps.LatLng(37.5153881, 127.1271355)
                },
                {
                    title: '<div>올림픽테니스장</div>',
                    latlng: new kakao.maps.LatLng(37.5147028, 127.1284129)
                },
                {
                    title: '<div>실내테니스장</div>',
                    latlng: new kakao.maps.LatLng(37.5140784, 127.1276414)
                },
                {
                    title: '<div>우리금융아트홀</div>',
                    latlng: new kakao.maps.LatLng(37.5174393, 127.1249653)
                },
                {
                    title: '<div>벨로드롬</div>',
                    latlng: new kakao.maps.LatLng(37.5174981, 127.1238605)
                },
                {
                    title: '<div>88마당</div>',
                    latlng: new kakao.maps.LatLng(37.5179469, 127.1237261)
                },
                {
                    title: '<div>시니어복합시설</div>',
                    latlng: new kakao.maps.LatLng(37.5182341, 127.1234428)
                },
                {
                    title: '<div>핸드볼경기장2-2</div>',
                    latlng: new kakao.maps.LatLng(37.5177339, 127.1257116)
                },
                {
                    title: '<div>핸드볼경기장티켓부스</div>',
                    latlng: new kakao.maps.LatLng(37.517822, 127.1259315)
                },
                {
                    title: '<div>핸드볼경기장2-3</div>',
                    latlng: new kakao.maps.LatLng(37.5178977, 127.1263379)
                },
                {
                    title: '<div>핸드볼경기장티켓박스</div>',
                    latlng: new kakao.maps.LatLng(37.5179799, 127.1265458)
                },
                {
                    title: '<div>핸드볼경기장2-4</div>',
                    latlng: new kakao.maps.LatLng(37.5178108, 127.1267271)
                },
                {
                    title: '<div>핸드볼경기장2-5</div>',
                    latlng: new kakao.maps.LatLng(37.517647, 127.126935)
                },
                {
                    title: '<div>조각공원</div>',
                    latlng: new kakao.maps.LatLng(37.516695, 127.1208994)
                },
                {
                    title: '<div>소마미술관</div>',
                    latlng: new kakao.maps.LatLng(37.5163341, 127.1192773)
                },
                {
                    title: '<div>소마미술관산책로</div>',
                    latlng: new kakao.maps.LatLng(37.5168984, 127.1194319)
                },
                {
                    title: '<div>소마미술관1관입구</div>',
                    latlng: new kakao.maps.LatLng(37.5174135, 127.1177823)
                },
                {
                    title: '<div>소마미술관공원</div>',
                    latlng: new kakao.maps.LatLng(37.5165567, 127.1174648)
                },
                {
                    title: '<div>평화의광장1</div>',
                    latlng: new kakao.maps.LatLng(37.5178916, 127.1171765)
                },
                {
                    title: '<div>평화의광장2</div>',
                    latlng: new kakao.maps.LatLng(37.5179531, 127.1169297)
                },
                {
                    title: '<div>수변무대1</div>',
                    latlng: new kakao.maps.LatLng(37.5181812, 127.1176435)
                },
                {
                    title: '<div>수변무대2</div>',
                    latlng: new kakao.maps.LatLng(37.517781, 127.1178071)
                },
                {
                    title: '<div>88마당1</div>',
                    latlng: new kakao.maps.LatLng(37.5179414, 127.1252197)
                },
                {
                    title: '<div>88마당2</div>',
                    latlng: new kakao.maps.LatLng(37.5183908, 127.1259594)
                },
                {
                    title: '<div>88마당3</div>',
                    latlng: new kakao.maps.LatLng(37.5187104, 127.1261723)
                },
                {
                    title: '<div>88마당4</div>',
                    latlng: new kakao.maps.LatLng(37.5189825, 127.1262702)
                },
                {
                    title: '<div>88마당5</div>',
                    latlng: new kakao.maps.LatLng(37.51902, 127.1262698)
                },
                {
                    title: '<div>88마당6</div>',
                    latlng: new kakao.maps.LatLng(37.5196308, 127.1261444)
                },
                {
                    title: '<div>88마당7</div>',
                    latlng: new kakao.maps.LatLng(37.5200557, 127.1256009)
                },
                {
                    title: '<div>88마당8</div>',
                    latlng: new kakao.maps.LatLng(37.5190479, 127.1245576)
                },
                {
                    title: '<div>88마당9</div>',
                    latlng: new kakao.maps.LatLng(37.5184115, 127.1237439)
                },
                {
                    title: '<div>88마당10</div>',
                    latlng: new kakao.maps.LatLng(37.5178844, 127.1244027)
                },
                {
                    title: '<div>88마당11</div>',
                    latlng: new kakao.maps.LatLng(37.5176935, 127.1247641)
                },
                {
                    title: '<div>올림픽수영장1</div>',
                    latlng: new kakao.maps.LatLng(37.519968, 127.126092)
                },
                {
                    title: '<div>올림픽체조경기장1</div>',
                    latlng: new kakao.maps.LatLng(37.5185463, 127.1270634)
                },
                {
                    title: '<div>올림픽체조경기장2</div>',
                    latlng: new kakao.maps.LatLng(37.5187875, 127.1266182)
                },
                {
                    title: '<div>올림픽체조경기장3</div>',
                    latlng: new kakao.maps.LatLng(37.5192018, 127.126537)
                },
                {
                    title: '<div>올림픽체조경기장4</div>',
                    latlng: new kakao.maps.LatLng(37.51961, 127.1266775)
                },
                {
                    title: '<div>올림픽체조경기장5</div>',
                    latlng: new kakao.maps.LatLng(37.519855, 127.1277997)
                },
                {
                    title: '<div>올림픽수영장2</div>',
                    latlng: new kakao.maps.LatLng(37.5206703, 127.1272689)
                },
                {
                    title: '<div>올림픽수영장3</div>',
                    latlng: new kakao.maps.LatLng(37.5211261, 127.1272582)
                },
                {
                    title: '<div>88호수수변무대</div>',
                    latlng: new kakao.maps.LatLng(37.5206064, 127.1255678)
                },
                {
                    title: '<div>88마당12</div>',
                    latlng: new kakao.maps.LatLng(37.5204964, 127.1254283)
                },
                {
                    title: '<div>88마당13</div>',
                    latlng: new kakao.maps.LatLng(37.5206237, 127.1256583)
                },
                {
                    title: '<div>서울역사편찬원1</div>',
                    latlng: new kakao.maps.LatLng(37.5218291, 127.124523)
                },
                {
                    title: '<div>서울역사편찬원2</div>',
                    latlng: new kakao.maps.LatLng(37.522466, 127.1245643)
                },
                {
                    title: '<div>몽촌정 팔각정</div>',
                    latlng: new kakao.maps.LatLng(37.5228356, 127.1253656)
                },
                {
                    title: '<div>까치다리1</div>',
                    latlng: new kakao.maps.LatLng(37.5228843, 127.1264847)
                },
                {
                    title: '<div>까치다리2</div>',
                    latlng: new kakao.maps.LatLng(37.5225617, 127.1267791)
                },
                {
                    title: '<div>백제전시관1</div>',
                    latlng: new kakao.maps.LatLng(37.520705, 127.123188)
                },
                {
                    title: '<div>백제전시관2</div>',
                    latlng: new kakao.maps.LatLng(37.5208423, 127.1234897)
                },
                {
                    title: '<div>백제전시관3</div>',
                    latlng: new kakao.maps.LatLng(37.5210939, 127.124339)
                },
                {
                    title: '<div>백제전시관4</div>',
                    latlng: new kakao.maps.LatLng(37.5207155, 127.1253049)
                },
                {
                    title: '<div>백제전시관5</div>',
                    latlng: new kakao.maps.LatLng(37.5207766, 127.1255889)
                },
                {
                    title: '<div>88마당14</div>',
                    latlng: new kakao.maps.LatLng(37.5202725, 127.1261166)
                },
                {
                    title: '<div>올림픽테니스장2</div>',
                    latlng: new kakao.maps.LatLng(37.515208, 127.128882)
                },
                {
                    title: '<div>실내테니스장2</div>',
                    latlng: new kakao.maps.LatLng(37.51437, 127.127653)
                },
                {
                    title: '<div>한얼광장1</div>',
                    latlng: new kakao.maps.LatLng(37.517597, 127.1277249)
                },
                {
                    title: '<div>한얼광장2</div>',
                    latlng: new kakao.maps.LatLng(37.579041, 127.1279529)
                },
                {
                    title: '<div>한얼광장3</div>',
                    latlng: new kakao.maps.LatLng(37.5182817, 127.1278336)
                },
                {
                    title: '<div>국민체력인증센터</div>',
                    latlng: new kakao.maps.LatLng(37.5171874, 127.1284535)
                },
                {
                    title: '<div>만남의광장1</div>',
                    latlng: new kakao.maps.LatLng(37.5172768, 127.1285561)
                },
                {
                    title: '<div>만남의광장2</div>',
                    latlng: new kakao.maps.LatLng(37.5172768, 127.1285561)
                },
                {
                    title: '<div>만남의광장3</div>',
                    latlng: new kakao.maps.LatLng(37.5173151, 127.1293664)
                },
                {
                    title: '<div>만남의광장4</div>',
                    latlng: new kakao.maps.LatLng(37.5170351, 127.1290855)
                },
                {
                    title: '<div>3대3농구장</div>',
                    latlng: new kakao.maps.LatLng(37.5160969, 127.1283462)
                },
                {
                    title: '<div>만남의광장5</div>',
                    latlng: new kakao.maps.LatLng(37.5167585, 127.1297426)
                },
                {
                    title: '<div>만남의광장6</div>',
                    latlng: new kakao.maps.LatLng(37.5165817, 127.1301771)
                },
                {
                    title: '<div>만남의광장7</div>',
                    latlng: new kakao.maps.LatLng(37.5165059, 127.1303589)
                },
                {
                    title: '<div>만남의광장8</div>',
                    latlng: new kakao.maps.LatLng(37.5167617, 127.1306448)
                },
                {
                    title: '<div>가족놀이동산1</div>',
                    latlng: new kakao.maps.LatLng(37.5209402, 127.123255)
                },
                {
                    title: '<div>가족놀이동산2</div>',
                    latlng: new kakao.maps.LatLng(37.5230441, 127.1223323)
                },
                {
                    title: '<div>가족놀이동산3</div>',
                    latlng: new kakao.maps.LatLng(37.5234828, 127.122956)
                },
                {
                    title: '<div>가족놀이동산4</div>',
                    latlng: new kakao.maps.LatLng(37.5236514, 127.123316)
                },
                {
                    title: '<div>가족놀이동산5</div>',
                    latlng: new kakao.maps.LatLng(37.5244882, 127.1227917)
                },
                {
                    title: '<div>나홀로나무1</div>',
                    latlng: new kakao.maps.LatLng(37.5234448, 127.1222415)
                },
                {
                    title: '<div>몽촌역사관</div>',
                    latlng: new kakao.maps.LatLng(37.5241598, 127.1244067)
                },
                {
                    title: '<div>피크닉장1</div>',
                    latlng: new kakao.maps.LatLng(37.5237958, 127.1220698)
                },
                {
                    title: '<div>피크닉장2</div>',
                    latlng: new kakao.maps.LatLng(37.5241457, 127.1218935)
                },
                {
                    title: '<div>나홀로나무2</div>',
                    latlng: new kakao.maps.LatLng(37.5232842, 127.1189893)
                },
                {
                    title: '<div>나홀로나무3</div>',
                    latlng: new kakao.maps.LatLng(37.5216632, 127.1191958)
                },
                {
                    title: '<div>나홀로나무4</div>',
                    latlng: new kakao.maps.LatLng(37.521535, 127.119851)
                },
                {
                    title: '<div>나홀로나무5</div>',
                    latlng: new kakao.maps.LatLng(37.5213231, 127.1172217)
                },
                {
                    title: '<div>곰말다리1</div>',
                    latlng: new kakao.maps.LatLng(37.5213242, 127.1179141)
                },
                {
                    title: '<div>곰말다리2</div>',
                    latlng: new kakao.maps.LatLng(37.5213231, 127.1172217)
                },
                {
                    title: '<div>지구촌공원</div>',
                    latlng: new kakao.maps.LatLng(37.5170922, 127.121414)
                },
                {
                    title: '<div>야생화학습장1</div>',
                    latlng: new kakao.maps.LatLng(37.5177456, 127.1216276)
                },
                {
                    title: '<div>야생화학습장2</div>',
                    latlng: new kakao.maps.LatLng(37.5180703, 127.1219555)
                },
                {
                    title: '<div>야생화학습장3</div>',
                    latlng: new kakao.maps.LatLng(37.5185923, 127.1211763)
                },
                {
                    title: '<div>곰말다리3</div>',
                    latlng: new kakao.maps.LatLng(37.5211774, 127.1177729)
                },
                {
                    title: '<div>음악분수1</div>',
                    latlng: new kakao.maps.LatLng(37.5204402, 127.1178142)
                },
                {
                    title: '<div>음악분수2</div>',
                    latlng: new kakao.maps.LatLng(37.5199935, 127.1185793)
                },
                {
                    title: '<div>음악분수3</div>',
                    latlng: new kakao.maps.LatLng(37.5191814, 127.1188243)
                },
                {
                    title: '<div>음악분수4</div>',
                    latlng: new kakao.maps.LatLng(37.5179733, 127.118944)
                },
                {
                    title: '<div>물레방아</div>',
                    latlng: new kakao.maps.LatLng(37.5172595, 127.1196699)
                },
                {
                    title: '<div>평화의광장3</div>',
                    latlng: new kakao.maps.LatLng(37.5188471, 127.1163051)
                },
                {
                    title: '<div>평화의광장4</div>',
                    latlng: new kakao.maps.LatLng(37.5187264, 127.1156362)
                },
                {
                    title: '<div>평화의광장5</div>',
                    latlng: new kakao.maps.LatLng(37.5180156, 127.1158136)
                },
                {
                    title: '<div>평화의광장6</div>',
                    latlng: new kakao.maps.LatLng(37.5181884, 127.116518)
                },
                {
                    title: '<div>평화의광장7</div>',
                    latlng: new kakao.maps.LatLng(37.5193465, 127.1163108)
                },
                {
                    title: '<div>평화의광장8</div>',
                    latlng: new kakao.maps.LatLng(37.5195321, 127.1163949)
                },
                {
                    title: '<div>몽촌해자</div>',
                    latlng: new kakao.maps.LatLng(37.5198127, 127.1166712)
                },
                {
                    title: '<div>들꽃마루</div>',
                    latlng: new kakao.maps.LatLng(37.5129723, 127.1267228)
                },
                // 성동구
                {
                    title: '<div>서울숲푸르지오</div>',
                    latlng: new kakao.maps.LatLng(37.543585, 127.022833)
                },
                {
                    title: '<div>서울숲역3번출구</div>',
                    latlng: new kakao.maps.LatLng(37.542910, 127.044397)
                },
                {
                    title: '<div>서울숲역2번출구</div>',
                    latlng: new kakao.maps.LatLng(37.542974, 127.044674)
                }
            ];

            // 마커 이미지의 이미지 주소입니다
             var imageSrc = "${ path }/resources/imgFile/recycling-bag.png"; 
                
           	 for (var i = 0; i < positions.length; i ++) {
                
                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(20, 20) 
                
                // 마커 이미지를 생성합니다    
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
                
                // 마커를 생성합니다
                var marker2 = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image : markerImage // 마커 이미지 
                });
                
                // 마커에 표시할 인포윈도우를 생성합니다 
                var infowindow2 = new kakao.maps.InfoWindow({
                    content: positions[i].title // 인포윈도우에 표시할 내용
                });

                // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                kakao.maps.event.addListener(marker2, 'mouseover', makeOverListener(map, marker2, infowindow2));
                kakao.maps.event.addListener(marker2, 'mouseout', makeOutListener(infowindow2));
            }

            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
            function makeOverListener(map, marker2, infowindow2) {
                return function() {
                    infowindow2.open(map, marker2);
                };
            }

            // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
            function makeOutListener(infowindow2) {
                return function() {
                    infowindow2.close();
                };
            }
           	 
            
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);

            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                        
                        var content = '<div class="bAddr">' +
                                        detailAddr + 
                                    '</div>';

                        // 마커를 클릭한 위치에 표시합니다 
                        marker.setPosition(mouseEvent.latLng);
                        marker.setMap(map);

                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                        infowindow.setContent(content);
                        infowindow.open(map, marker);
                    }   
                });
            });

            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'idle', function() {
                searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            });

            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
            }

            function searchDetailAddrFromCoords(coords, callback) {
                // 좌표로 법정동 상세 주소 정보를 요청합니다
                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
            }

            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var infoDiv = document.getElementById('centerAddr');

                    for(var i = 0; i < result.length; i++) {
                        // 행정동의 region_type 값은 'H' 이므로
                        if (result[i].region_type === 'H') {
                            infoDiv.innerHTML = result[i].address_name;
                            break;
                        }
                    }
                }    
            }
                 	
                </script>
            
            <div class="st_loca">
                <div class="stl_1">
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp" />