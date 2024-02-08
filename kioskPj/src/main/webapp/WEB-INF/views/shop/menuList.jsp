<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>가게 및 메뉴 리스트</title>
  <style>
        .container { display: flex; }
        .shop-list { width: 30%; overflow-y: auto; }
        .shop-item.active {background-color : #22354a; color: white;}
        .menu-list { width: 70%; display: flex; flex-wrap: wrap; padding: 40px; }
        .shop-item { padding: 30px; cursor: pointer; }
        .shop-item { background-color: #8a97a4; color: white; }
        .menu-item { width: 30%; margin: 10px; text-align: center; list-style-type: none;}
        .menu-image { width: 100px; height: 100px; list-style-type: none;}
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br>

<form action="getMenuList.do">
    <div class="container">
        <div class="shop-list">
            <!-- 상점 리스트 -->
            <c:forEach var="shop" items="${sList}" varStatus="status">
                <div class="shop-item"  data-shop-id="${shop.shopNum}" onclick="showMenusForShop('${shop.shopNum}')">${shop.shopName}</div>
            </c:forEach>
        </div>
		<ul class="menu-list" id="menuList">
		    <c:forEach items="${menus}" var="menu">
		    	<li class="menu-image"><img src="../img/MenuImg/" style="width:100px; height:100px;"></li><br><br>
		        <li class="menu-item"> ${menu.menuName} - ${menu.price} </li>
		    </c:forEach>
		</ul>
    </div>
    
 </form>

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
		    $(document).ready(function() {
		        // 상점 리스트 아이템에 대한 클릭 이벤트 핸들러 동적 바인딩
		        $(document).on('click', '.shop-item', function() {
		            
		        	var shopNum = $(this).data('shop-id');
		            showMenusForShop(shopNum);
		            
		            window.location.href = 'getMenuList.do?shopNum=' + shopNum;
		            
		        });
		    });
		 
		    
    
        
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
                    			  +	'<img src="../img/MenuImg/'+ menu.menuImageOrigin + 'style="width:100px; height:100px;">' + '<br>'
                    			  +	'<li class="menu-item">' 
                    			  + menu.menuName 
                    			  + ' - ' + menu.price + '원</li>';
                    });
                    $('#menuList').html(menusHtml);
                },
                error: function(xhr, status, error) {
                    console.error("Error: ", error);
                }
            });
        }		    
        

        
    </script>
</body>
</html>