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
			<h2>업체 등록</h2>
			<br>
			<form name="board" id="board" method="post" action="enrollShop.sh">
			<div class="form-group">
				<label for="shopId">ID : </label>
				<input type="hidden" name="chkshopIdYN" id="chkshopIdYN" value="N">
				<input type="text" class="form-control" id="shopId" value="" name="shopId"> <br>
				<button type="button" class="bg-black chkshopId">중복확인</button><br><br>
				
				<label for="shopPwd">*비밀번호 : </label>
				<input type="password" class="form-control" id="shopPwd" value="" name="shopPwd"> <br>
				
				<label for="shopName">*업체명 : </label>
				<input type="text" class="form-control" id="shopName" value="" name="shopName"> <br>
				<input type="hidden" name="chkshopNAMEYN" id="chkshopNAMEYN" value="N">
				<button type="button" class="bg-black chkshopName">중복확인</button><br><br>
				
				<label for="shopRepresentative">*대표자 : </label>
				<input type="text" class="form-control" id="shopRepresentative" value="" name="shopRepresentative"> <br>
				
				<label for="shopPhone">*핸드폰번호(숫자만 입력해주세요) : </label>
				<input type="text" class="form-control" id="shopPhone" value="" name="shopPhone"> <br>
				
				<label for="shopEmail">*이메일 : </label>
				<input type="text" class="form-control" id="shopEmail" value="" name="shopEmail"> <br>
				
				<br>
				
			</div>
				<button type="button" class="btn btn-secondary" onclick="formCheck();return false;" formaction="enrollShop.sh">등록</button>
				<button class="btn btn-secondary" onclick="history.back();return false;">취소</button>
			</form>
		</div>
		<br>
	</div>
	
	<script>
    function formCheck() {
        // 필수 필드 가져오기
        var shopPwd = $("#shopPwd").val();
        var shopName = $("#shopName").val();
        var shopRepresentative = $("#shopRepresentative").val();
        var shopPhone = $("#shopPhone").val();
        var shopEmail = $("#shopEmail").val();
		
        
		if ($("#chkshopIdYN").val() != 'Y') {
			alert("아이디 중복체크를 하셔야 합니다.");
			$('#shopId').focus();
			return;
		}
		
		if ($("#chkshopNAMEYN").val() != 'Y') {
			alert("업체명 중복체크를 하셔야 합니다.");
			$('#shopName').focus();
			return;
		}
		
        // 비밀번호 검사
        // 조건: 8 ~ 14자, 최소 하나의 특수문자
        var pwdPattern = /^(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,14}$/;
        if (!pwdPattern.test(shopPwd)) {
            alert("비밀번호는 8자 이상 14자 이하로 입력해야하며, 최소 하나의 특수문자가 포함되어야 합니다");
            $("#shopPwd").focus();
            return false;
        }

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
            url: 'enrollShop.sh', 
            type: 'POST', 
            data: $('#board').serialize(), // 폼 데이터 직렬화
            success: function(response) {
            	alert('등록이 완료되었습니다.');
            	window.location.href = "manageAllShopsForm";
            },
            error: function(error) {
            	alert('등록 중 오류가 발생했습니다.');
            }
        });

    	return false;
    }
    
	// 아이디 중복 체크
	$(function() {
		$("#shopId").change(function() {
			$("#chkshopIdYN").val("N");
		});
		
		$(".chkshopId").click(
				function() {
					var id = $("#shopId").val();
					
					if (id == '') {
						alert("아이디를 입력해주세요.");
						$('#shopId').focus();
						return false;
					}

					if (!id.match('^[a-zA-Z0-9]{4,20}$')) {
						alert('아이디는 특수문자를 제외한 영문, 숫자 조합 4~20자로 사용 가능합니다.');
						$('#shopId').focus();
						return false;
					}
					
					$.ajax({
						url : "checkDupId.sh",
						data : {
							checkId : id
						},
						success : function(result) {
							if (result == "NNNNN") { 
								alert("아이디가 중복됩니다.");
								$("#chkshopIdYN").val("N");
								$('#shopId').focus();
								return false;
							}
							alert("사용 가능한 아이디입니다.");
							$("#chkshopIdYN").val("Y");
						},
						error : function() {
							console.log("통신 실패!")
						}
					})
				});
		});
	
	// 업체명 중복 체크
		$(function() {
		$("#shopName").change(function() {
			$("#chkshopNAMEYN").val("N");
		});
		
		$(".chkshopName").click(
				function() {
					var name = $("#shopName").val();
					
					if (name == '') {
						alert("업체명을 입력해주세요.");
						$('#shopName').focus();
						return false;
					}

					if (!name.match(/^[가-힣]{1,15}$/)) {
						alert('업체명은 한글만 입력 가능합니다.');
						$('#shopName').focus();
						return false;
					}
					
					$.ajax({
						url : "checkDupName.sh",
						data : {
							checkName : name
						},
						success : function(result) {
							if (result == "NNNNN") { 
								alert("업체명이 중복됩니다.");
								$("#chkshopNAMEYN").val("N");
								$('#shopName').focus();
								return false;
							}
							alert("사용 가능한 업체명입니다.");
							$("#chkshopNAMEYN").val("Y");
						},
						error : function() {
							console.log("통신 실패!")
						}
					})
				});
		});					

    
</script>
	
</body>
</html>