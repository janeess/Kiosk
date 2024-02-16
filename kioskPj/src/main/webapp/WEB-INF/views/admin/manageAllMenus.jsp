<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <title>메뉴 관리 페이지</title>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br>
	    <main class="container">
	        <div class="grid">
	            <section>
	                <hgroup>
	                    <h2>상점 선택</h2>
	                    <h3>선택한 상점에 대한 메뉴 리스트를 관리합니다.</h3>
	                </hgroup>
	                <p>상점을 선택해주세요:</p>
	                <select id="storeSelect" name="storeSelect">
	                    <option value="">상점 선택...</option>
			               <c:forEach var="shop" items="${sList}">
	                        <option value="${shop.shopNum}">${shop.shopName}</option>
	                    </c:forEach>
	                </select>
	                <h3>메뉴 리스트</h3>
	                <p>선택한 상점의 메뉴 리스트가 여기에 표시됩니다.</p>
	                	 <c:forEach var="menu" items="${menus}">
	                        <div>${menu.menuName}</div>
	                    </c:forEach>
	            </section>
	        </div>
	    </main>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $("#storeSelect").change(function() {
            var shopNum = $(this).val(); 
            
            if(shopNum) {
                $.ajax({
                    url: "getMenuList.ad", 
                    type: "GET",
                    data: { shopNum: shopNum },
                    dataType: "json", 
                    success: function(menus) {
                        var menuListHtml = ""; 
                        $.each(menus, function(index, menu) {
                            menuListHtml += "<div>" + menu.menuName + "</div>"; 
                        });
                        $("#menuList").html(menuListHtml); /
                    },
                    error: function(xhr, status, error) {
                        console.error("Error fetching menus: " + error);
                    }
                });
            } else {
                $("#menuList").html("<p>선택한 상점의 메뉴 리스트가 여기에 표시됩니다.</p>"); 
            }
        });
    });

		    
	</script>
	
	
</body>
</html>