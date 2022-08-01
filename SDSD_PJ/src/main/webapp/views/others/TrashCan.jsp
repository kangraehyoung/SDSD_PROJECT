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

	                center: new kakao.maps.LatLng(37.517547, 127.086363), //지도의 중심좌표.

	                level: 3 //지도의 레벨(확대, 축소 정도)
                    };
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.517547, 127.086363), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption); 

         	// 마커를 표시할 위치와 title 객체 배열입니다 
            var positions = [
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