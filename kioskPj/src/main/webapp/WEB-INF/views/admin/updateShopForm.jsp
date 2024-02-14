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
        .button-group {
		    display: flex;
		    justify-content: flex-start;
		     margin-right: 10px; 
		}
		#btnupdate {
	    margin-right: 10px; 
	}
        
        
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
		
			<h2>'${loginUser.shopName}' 정보</h2>
			<br>
			<input type="hidden" id="shopId" value="${loginUser.shopId}">
			
			<form name="board" id="board" method="post" action="update.sh">
			<div class="form-group">
				<label for="shopId">*ID : </label>
				<input type="text" class="form-control" id="shopId" value="${loginUser.shopId}" name="shopId" readonly> <br>
				
				<c:if test="${loginUser.shopId ne 'admin'}">
				<label for="shopName">*업체명 : </label>
				<input type="text" class="form-control" id="shopName" value="" name="shopName">
				</c:if>
				
				<label for="shopRepresentative">*대표자 : </label>
				<input type="text" class="form-control" id="shopRepresentative" value="" name="shopRepresentative"> <br>
				
				<label for="shopPhone">*핸드폰번호 : </label>
				<input type="text" class="form-control" id="shopPhone" value="" name="shopPhone"> <br>
				
				<label for="shopEmail">*이메일 : </label>
				<input type="text" class="form-control" id="shopEmail" value="" name="shopEmail"> <br>
				
				<br>
				
			</div>
			 <div class="button-group">
				<button type="submit" class="bbs-btn-st2 bg-purple3" id="btnupdate" onclick="formCheck();return false;" formaction="update.sh" style="width: auto; max-width: 150px;">수정</button>
				<button class="bbs-btn-st2 bg-black_r" onclick="history.back();return false;" style="width: auto; max-width: 150px;">취소</button>
			</div>
			</form>
		</div>
		<br>
	</div>
	
	<script>
    function formCheck() {
        // 필수 필드 가져오기
        var shopName = $("#shopName").val();
        var shopRepresentative = $("#shopRepresentative").val();
        var shopPhone = $("#shopPhone").val();
        var shopEmail = $("#shopEmail").val();


        // 업체명 검사
        if (shopName === "") {
            alert("업체명을 입력하세요.");
            $("#shopName").focus();
            return false;
        }

        // 대표자 검사
        if (shopRepresentative === "") {
            alert("대표자 이름을 입력하세요.");
            $("#shopRepresentative").focus();
            return false;
        }

        // 핸드폰번호 검사 (기본적인 형식 검사)
        var phonePattern = /^01[0179][0-9]{7,8}$/; // 간단한 휴대폰 번호 패턴
        if (!phonePattern.test(shopPhone)) {
            alert("올바른 핸드폰 번호를 입력하세요.");
            $("#shopPhone").focus();
            return false;
        }

        // 이메일 검사 (기본적인 이메일 형식 검사)
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailPattern.test(shopEmail)) {
            alert("올바른 이메일 주소를 입력하세요.");
            $("#shopEmail").focus();
            return false;
        }

        // 모든 검사를 통과하면 AJAX 요청 실행
        $.ajax({
            url: 'update.sh', 
            type: 'POST', 
            data: $('#board').serialize(), // 폼 데이터 직렬화
            success: function(response) {
            	alert('성공적으로 수정완료되었습니다.');
                $('#board').submit();
            },
            error: function(error) {
            	alert('수정 중 오류가 발생했습니다.');
            }
        });

    	return false;
    }
</script>
	
	
</body>
</html>