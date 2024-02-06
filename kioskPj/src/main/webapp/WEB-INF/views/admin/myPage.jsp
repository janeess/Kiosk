<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Core -->
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!-- XML -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- I18N -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- Database -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	 .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        
        table * {margin:5px;}
        table {width:100%;}
        
        
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>'${s.shopName}'님 마이페이지</h2>
			<br>
			<input type="hidden" id="shopId" value="${s.shopId}">
			<div class="form-group">
				<label for="shopId">ID : </label>
				<input type="text" class="form-control" id="shopId" value="${s.shopId}" name="shopId" readonly> <br>
				
				<label for="shopPwd">*비밀번호 : </label>
				<input type="password" class="form-control" id="shopPwd" value="${s.shopPwd}" name="shopPwd" readonly> <br>
				
				<c:if test="${s.shopId ne 'admin'}">
				<label for="shopName">*업체명 : </label>
				<input type="text" class="form-control" id="shopName" value="${s.shopName}" name="shopName" readonly> <br>
				</c:if>
				
				<label for="shopRepresentative">*대표자 : </label>
				<input type="text" class="form-control" id="shopRepresentative" value="${s.shopRepresentative}" name="shopRepresentative" readonly> <br>
				
				<label for="shopPhone">*핸드폰번호 : </label>
				<input type="text" class="form-control" id="shopPhone" value="${s.shopPhone}" name="shopPhone" readonly> <br>
				
				<label for="shopEmail">*이메일 : </label>
				<input type="text" class="form-control" id="shopEmail" value="${s.shopEmail}" name="shopEmail" readonly> <br>
				
				<c:if test="${s.shopId ne 'admin'}">
				<label for="contractPeriod">계약기간(등록일로부터 1년) : </label>
				<input type="text" class="form-control" id="contractPeriod" value="<fmt:formatDate value="${s.contractPeriod}" pattern="yyyy-MM-dd"/>" name="contractPeriod" readonly> ~ 
				<input type="text" class="form-control" id="contractPeriodEnd" value="<fmt:formatDate value="${contractPeriodEnd}" pattern="yyyy-MM-dd"/>" name="contractPeriodEnd" readonly>
				</c:if>
				<br>
				
			</div>
				<a href="/updateShopForm.sh" class="btn btn-secondary">회원정보 수정</a>
				<a href="resetPwdForm.sh" class="btn btn-secondary">비밀번호 재설정</a>
				<a href="myPageForm.sh" class="btn btn-secondary">목록</a>
		</div>
		<br>
	</div>

	
</body>
</html>