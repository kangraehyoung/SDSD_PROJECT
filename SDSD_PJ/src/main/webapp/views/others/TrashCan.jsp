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

    <div class="second_tool"> <!-- 두번째 민트색 틀 -->
        <div class="st_map">
            <div class="stm_1">
                <h2>지도<img src="${ path }/resources/imgFile/map.png" alt="map"></h2>
            </div>
            <div id="map"></div> <!-- 지도 -->
               <!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=334344dce2f2aee24efdae6872bcd47a"></script> -->
                <script>
                    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                    var options = { //지도를 생성할 때 필요한 기본 옵션

	                center: new kakao.maps.LatLng(37.517547, 127.086363), //지도의 중심좌표.

	                level: 3 //지도의 레벨(확대, 축소 정도)
                    };

                    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
                 	
                    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
                    var mapTypeControl = new kakao.maps.MapTypeControl();

                    // 지도 타입 컨트롤을 지도에 표시합니다
                    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                    
                 	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
                    var zoomControl = new kakao.maps.ZoomControl();
                    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                    
                 // 마커를 표시할 위치와 title 객체 배열입니다 
                    var positions = [
                        {
                            title: '잠실GS25쓰레기통1', 
                            latlng: new kakao.maps.LatLng(37.519580, 127.093538)
                        },
                        {
                            title: '잠실GS25쓰레기통2', 
                            latlng: new kakao.maps.LatLng(37.518722, 127.089644)
                        },
                        {
                            title: '잠실스케이트장쓰레기통', 
                            latlng: new kakao.maps.LatLng(37.517753, 127.086164)
                        },
                        {
                            title: '잠실선착장쓰레기통',
                            latlng: new kakao.maps.LatLng(37.518323, 127.081430)
                        }
                    ];

                    // 마커 이미지의 이미지 주소입니다
                    var imageSrc = "${ path }/resources/imgFile/recycling-bag.png"; 
                        
                    for (var i = 0; i < positions.length; i ++) {
                        
                        // 마커 이미지의 이미지 크기 입니다
                        var imageSize = new kakao.maps.Size(20, 20); 
                        
                        // 마커 이미지를 생성합니다    
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
                        
                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            map: map, // 마커를 표시할 지도
                            position: positions[i].latlng, // 마커를 표시할 위치
                            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                            image : markerImage // 마커 이미지 
                        });
                    }
                </script>
            
            <div class="st_loca">
                <div class="stl_1">
                    <div>
                    <img src="${ path }/resources/imgFile/flag.png" alt="flag">
                    </div>
                    <div>
                    <p>현재 위치 : #</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/views/common/footer.jsp" />