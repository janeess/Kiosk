<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
    <title>키오스크 메인 화면</title>
    <style>
        @media (max-width: 768px) {
            nav ul {
                padding: 0;
                margin: 0;
                list-style: none;
                display: flex;
                justify-content: space-between;
            }
            nav img {
                height: 40px;
            }
        }
    </style>
</head>
<body>
<nav class="container-fluid">
    <ul>
        <li><a href="/index.jsp"><img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="홈" style="height:50px;"></a></li>
    </ul>    
    <div style="text-align:center;">
        <img src="../resources/img/common/kioskLogo.png" alt="로고" style="height:100px;">
    </div>
   	<c:choose>
		<c:when test="${not empty loginUser}">
		    <ul style="float:right;">
		        <li><a href="myPageForm.sh"><img src="../resources/img/common/icon_myPage.png" alt="마이페이지" style="height:50px;"></a></li>
		        <li><a href="logout.sh"><img src="../resources/img/common/icon_signout.png" alt="로그아웃" style="height:50px;"></a></li>
		    </ul>
		 </c:when>
		 <c:otherwise>
		     <ul style="float:right;">
		        <li><a href="loginForm.sh"><img src="../resources/img/common/icon_login.png" alt="로그인" style="height:50px;"></a></li>
		    </ul>
		 </c:otherwise>
	</c:choose> 
</nav>
<br><br>
</body>
</html>
