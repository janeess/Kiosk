<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>키오스크 첫 화면</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <style>
        @media (max-width: 768px) {
            .grid {
                padding: 0;
                margin: 0;
                list-style: none;
                display: flex;
                justify-content: space-between;
            }
            main img {
                width: 100%;
                max-width: 300px; /* 이미지가 너무 크지 않도록 최대 너비 설정 */
            }
        }
    </style>
</head>
<body>
<main class="container" style="text-align:center;">
	   <div class="grid">
        <section>
            <a href="getMenuList.do"><img src="../resources/img/common/touchicon.png" alt="터치 로고" style="height:150px;">
            <h2>주문하실 분은 화면을 터치해주세요</h2></a>
        </section>
    </div>
</main>

</body>
</html>
