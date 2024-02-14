<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 및 메뉴 리스트</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            max-width: 1600px;
            margin: 0 auto;
        }
        .shop-list {
            width: 30%;
            overflow-y: auto;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .shop-item {
            cursor: pointer;
            background-color: #8a97a4;
            color: white;
            margin: 10px 0;
            padding: 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .shop-item:hover, .shop-item.active {
            background-color: #22354a;
        }
	   .menu-list {
	        width: 70%;
	        display: flex;
	        flex-wrap: wrap;
	        padding: 20px;
	        justify-content: flex-start;
	        list-style-type: none;
	    }
    .menu-image img {
	        width: 250px; /* Fixed width to match image size */
	        height: 250px; /* Fixed height to match image size */
	        border-radius: 5px;
	        object-fit: contain; /* Ensure images cover the area nicely */
	    }
	    .menu-image {
        width: calc(33.333% - 30px); /* Adjust for 3x3 grid layout, including margin */
        margin: 15px; /* Margin around each item */
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
       @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }
        .shop-list, .menu-list {
            width: 100%;
        }
        .menu-image {
            width: calc(50% - 30px); /* Adjust for smaller screens */
        }
    }
    @media (max-width: 480px) {
        .menu-image {
            width: 100%; /* Full width for very small devices */
        }
    </style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br>
<div class="allForm">
	<form action="getMenuList.do" class="">
	    <div class="container">
	        <div class="shop-list">
	            <!-- 상점 리스트 -->
	            <c:forEach var="shop" items="${sList}" varStatus="status">
	                <div class="shop-item"  data-shop-id="${shop.shopNum}" onclick="showMenusForShop('${shop.shopNum}')">${shop.shopName}</div>
	            </c:forEach>
	        </div>
	       <ul class="menu-list" id="menuList">
	            <c:forEach items="${menus}" var="menu">
	                <li class="menu-image">
	                    <img src="resources/img/MenuImg/${menu.menuImageOrigin}" data-menu-num="${menu.menuNum}" onclick="orderMenu(this)"><Br>
	                    ${menu.menuName} <br>
	                    ${menu.price}원
	                </li>
	            </c:forEach>
	        </ul>
	    </div>
	 </form>
 </div>    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
		    // 상점 리스트 클릭 이벤트
		    $(document).ready(function() {
		        $(document).on('click', '.shop-item', function() {
		            
		        	var shopNum = $(this).data('shop-id');
		            showMenusForShop(shopNum);
		            
		            window.location.href = 'getMenuList.do?shopNum=' + shopNum;
		            
		        });
		    });
		 
    
        // 메뉴 보여주기
        function showMenusForShop(shopNum) {
            $.ajax({
                url: 'getMenuList.do',
                type: 'GET',
                data: { shopNum: shopNum },
                success: function(response) {
                	console.log(response); // 서버 응답 확인
                    var menusHtml = '';
                    $.each(response.menus, function(i, menu) {
                    	menusHtml += '<li class="menu-image">' 
                    			  +	'<img src="resources/img/MenuImg/'+ menu.menuImageOrigin + '">' + '<br>'
                    			  + menu.menuName 
                    			  + ' - ' + menu.price + '원';
                    });
                    $('#menuList').html(menusHtml);
                },
                error: function(xhr, status, error) {
                    console.error("Error: ", error);
                }
            });
        }		    
        
        
	    // 주문
        function orderMenu(element) {
            var menuNum = $(element).data('menu-num');
            // 주문 처리 로직 추가해야됨. 주문 페이지로 이동 or 주문 API를 호출
            // 이동 
            // window.location.href = 'orderPage.do?menuNum=' + menuNum;
        }   

        
    </script>
</body>
</html>