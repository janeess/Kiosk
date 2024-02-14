<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <title>메뉴 관리</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

<main class="container">
    <div class="grid">
        <section>
            <hgroup>
                <h2>메뉴 항목 관리</h2>
                <h3>메뉴 추가</h3>
            </hgroup>
            <form class="grid" enctype="multipart/form-data">
			  <select id="storeSelect" name="storeSelect" onchange="storeSelect()" required>
				<option value="">상점 선택</option>
				    <c:forEach var="shop" items="${sList}" varStatus="status">
						    <option value="${shop.shopNum}">${shop.shopName}</option>
				    </c:forEach>
				</select>
                <input type="text" id="menuName" name="menuName" placeholder="메뉴 이름" aria-label="메뉴 이름" required>
                <input type="number" id="menuPrice" name="menuPrice" placeholder="가격" aria-label="가격" required>
                <input type="file" id="menuImage" name="menuImage" accept="img/MenuImg/*" aria-label="메뉴 사진">
                <button type="submit" onclick="event.preventDefault()">메뉴 추가</button>
            </form>
            <br><br>
            
            
            <h3>메뉴 리스트</h3>
            <table id="memberList" class="admin_board_wrap">
					<thead class="admin_boardList">
					    <tr>
					      <th class="admin_board_head">메뉴</th>
					    </tr>
					</thead>
					<tbody>
					
					</tbody>
			</table>
        </section>
    </div>
</main>