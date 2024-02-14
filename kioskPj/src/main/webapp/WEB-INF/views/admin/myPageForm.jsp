<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키오스크 관리자 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .centered-content {
        text-align: center;
        margin: auto;
    }
    .btn {
        display: inline-block;
        padding: 0.5rem 1rem;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 0.3rem;
        margin: 0.5rem 0;
    }
    .btn:hover {
        background-color: #0056b3;
    }
    .topContent h1 {
        margin-bottom: 2rem;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <div class="topContent">
        <h1 class="centered-content">'${loginUser.shopName}'님 환영합니다</h1>
    </div>
    
    <div class="centered-content">
        <a href="myPage.sh?shopId=${loginUser.shopId}" class="btn">마이페이지</a><br>
        <a href="manageMenus.ad" class="btn">메뉴 관리</a><br>
        
        <c:if test="${loginUser.shopId eq 'admin'}">
            <a href="manageAllShopsForm" class="btn">상점 관리</a><br>
        </c:if>
    </div>
</div>

</body>
</html>
