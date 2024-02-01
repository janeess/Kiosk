<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>키오스크 가게 리스트</title>
    <style>
        .shop-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 10px;
			grid-template-rows: repeat(2, auto);            
        }
        .shop-item {
            text-align: center;
        }
        .shop-image {
            width: 100%;
            height: auto;
        }
        #shoplist {
        	text-align: center;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br><br>
    <h2 id="shoplist">가게를 선택해 주세요</h2>
    <br>

    <div class="shop-grid">
        <c:forEach var="s" items="${sList}" begin="0" end="5">
            <div class="shop-item">
                <img src="${s.shopLogoImage}" alt="가게 로고" class="shop-image">
                <p><b>${s.shopName}</b></p>
            </div>
        </c:forEach>
    </div>

    
</body>
</html>
