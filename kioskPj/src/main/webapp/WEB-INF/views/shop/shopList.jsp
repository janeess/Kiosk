<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>키오스크 가게 리스트</title>
    <style>
         body { font-family: Arial, sans-serif; }
        .container { display: flex; }
        .shop-list { width: 30%; padding: 20px; border-right: 1px solid #ccc; }
        .menu-list { width: 70%; padding: 20px; }
        .shop-item { padding: 10px; cursor: pointer; font-color: black; }
        .shop-item:hover { background-color: #f0f0f0; }
        .menu-item { margin-bottom: 15px; }
        .menu-image { width: 100px; height: 100px; margin-right: 10px; }
        .menu-info { display: inline-block; vertical-align: top; }
    </style>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<jsp:include page="../common/header.jsp" />
	<br><br>
    <h2 id="shoplist" style="text-align:center;">메뉴를 선택해 주세요</h2>
    <br><br>
	<div class="container">
	 	<div class="shop-list">
	    	<form action="sList.do">
			    <div class="shop-grid">
			        <c:forEach var="s" items="${sList}" begin="0" end="5">
			            	 <div class="shop-item" onclick="showMenu('${s.shopId}')">${s.shopName}</div>
			        </c:forEach>
			    </div>
	        </form>
		</div>
			
			<!-- 메뉴리스트 -->
			<div id="menu-list" id="menuList"></div>
			
	 </div>
	 
	 
		<script>
			
		//메뉴 표시
			function showMenu(shopId) {
			    $.ajax({
			        url: 'getMenuList.do', // 메뉴 데이터를 가져오는 서버의 URL
			        type: 'GET',
			        data: { shopId: shopId },
			        success: function(menus) {
			        	  var menuListHtml = '';
			              menus.forEach(function(menu) {
			                  menuListHtml += '<div class="menu-item">' +
			                                      '<img src="' + menu.menuImageChange + '" alt="' + menu.menuName + '" class="menu-image">' +
			                                      '<div class="menu-info">' +
			                                          '<div><b>' + menu.menuName + '</b></div>' +
			                                          '<div>가격: ' + menu.price + '</div>' +
			                                      '</div>' +
			                                  '</div>';
			              });
			              $('#menuList').html(menuListHtml);
			          },
			          error: function() {
			              alert('메뉴를 불러오는 데 실패했습니다.');
			          }
			      });
			  }
			
			function displayMenu(menuData) {
			    var menuContainer = $('#menu-container'); // 메뉴를 표시할 컨테이너
			    menuContainer.empty(); // 기존 메뉴 데이터를 비웁니다.
			
			 // 페이지 로드 시 첫 번째 업체의 메뉴를 자동으로 표시
			    $(document).ready(function() {
			        var firstShopId = $('.shop-item').first().attr('onclick').match(/\d+/)[0];
			        if (firstShopId) {
			            showMenu(firstShopId);
			        }
			    });
			
		</script>
</body>
</html>
