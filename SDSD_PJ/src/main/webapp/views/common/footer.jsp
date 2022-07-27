<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
	<footer>
        <div class="footer_wrapper">
            <div class="textbox textbox_1">
                <h2><span><img src="${ path }/resources/imgFile/지구아이콘2.png" alt="logoBox" /></span>쓰담쓰담</h2>
                <p>Copyright @쓰담쓰담 All rights reserved</p>
                <a href="">이용약관</a>
                <a href="">개인정보처리방침</a>
            </div>
            
            <div class="textbox textbox_2">
                <h2>About Us</h2>
                <div class="iconBox">
                    <div class="icon icon_01">
                        <img src="${ path }/resources/imgFile/board_icon.png" alt="문의 Icon">
                        <p><a href="">문의</a></p>
                    </div>
                    <div class="icon icon_02">
                        <img src="${ path }/resources/imgFile/FAQ_icon.png" alt="FAQ Icon">
                        <p><a href="${ path }/faq">FAQ</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- 부트스트랩 JS CDN 추가  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 