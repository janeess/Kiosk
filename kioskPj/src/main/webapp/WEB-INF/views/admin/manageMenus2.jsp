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
    <form action="getMenuList.ad" class="">
	    <main class="container">
	        <div class="grid">
	            <section>
	                <hgroup>
	                    <h2>상점 선택</h2>
	                    <h3>선택한 상점에 대한 메뉴 리스트를 관리</h3>
	                </hgroup>
	                <p>상점을 선택해주세요:</p>
	                <select id="storeSelect" name="storeSelect">
		                <option value="">상점 선택...</option>
		                <c:forEach var="shop" items="${sList}" varStatus="status">
		                    <option class="shop-item" value="${shop.shopNum}">${shop.shopName}</option>
		                </c:forEach>
	                </select>
	                <button type="submit" data-shop-id="${shop.shopNum}" onclick="showMenusForShop('${shop.shopNum}')">메뉴 보기</button>
	                <h3>메뉴 리스트</h3>
	                <p>선택한 상점의 메뉴 리스트가 여기에 표시됩니다.</p>
	            </section>
	        </div>
	    </main>
     </form>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    $(document).ready(function() {
    	$('#storeSelect').change(function() {
    	    var shopNum = $(this).val();
            
    	    showMenusForShop(shopNum);
            
        });
    });
		

	</script>
	
	
	
		
</body>
</html>