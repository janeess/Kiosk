<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <title>메뉴 관리 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <main class="container">
        <div class="grid">
            <section>
                <hgroup>
                    <h2>상점 선택</h2>
                    <h3>선택한 상점에 대한 메뉴 리스트를 관리</h3>
                </hgroup>
                <p>상점을 선택해주세요:</p>
                <select id="storeSelect" name="storeSelect" required>
                    <option value="">상점 선택...</option>
                    <c:forEach var="shop" items="${sList}">
                        <option value="${shop.shopNum}">${shop.shopName}</option>
                    </c:forEach>
                </select>
                <br><br>
                <h3>메뉴 리스트</h3>
                <div id="menuList">선택한 상점의 메뉴 리스트가 여기에 표시됩니다.</div>
            </section>
        </div>
    </main>

    <script>
        $('#storeSelect').change(function() {
            var shopNum = $(this).val();
            $.ajax({
                url: 'getMenuList.ad',
                type: 'GET',
                data: { 'shopNum': shopNum },
                dataType: 'json',
                success: function(data) {
                    var menuListHtml = '<ul>';
                    $.each(data.menus, function(i, menu) {
                        menuListHtml += '<li>' + menu.menuName + ' - 가격: ' + menu.price + '원</li>';
                    });
                    menuListHtml += '</ul>';
                    $('#menuList').html(menuListHtml);
                },
                error: function(xhr, status, error) {
                    alert("메뉴를 불러오는 데 실패했습니다.");
                }
            });
        });
    </script>
</body>
</html>
