<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>	
	/* a 태그에 직접 스타일 적용 */
	.myPageFormCss a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: white; /* 텍스트 색상을 하얀색으로 */
	}
	
</style>

<body>
<jsp:include page="../common/header.jsp"/>
<br>
	<div class="topContent">
		<div class="topInnerOuter" style="font-size:50px; text-align:center;">
			<h1 style="text-align:center;">'${loginUser.shopName}'님 환영합니다</h1>
		</div>
	</div>
	<br><br>
	
	<!-- if 구문으로 관리자일때 / 업체일때 구분해서 버튼 만들기 -->
	<div style="text-align:center;" class="myPageFormCss">
  <a href="myPage.sh?shopId=${loginUser.shopId}" class="btn btn-secondary">마이페이지</a><br><br>
    <a href="/" class="btn btn-secondary">메뉴 관리</a><br><br>
		
		<c:if test="${loginUser.shopId eq 'admin'}">
		<a href="manageAllShopsForm" class="btn btn-secondary">상점 관리</a><br><br>
		</c:if>
	</div>
	
</body>
</html>