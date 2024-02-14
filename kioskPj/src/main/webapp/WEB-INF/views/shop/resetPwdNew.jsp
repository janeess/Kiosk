<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.group {
	display: flex;
	justify-content: center; /* 수평 중앙 정렬 */
    flex-direction: column; /* 자식 요소들을 세로로 정렬 */
    align-items: center; /* 자식 요소들을 수직 중앙 정렬 */
    text-align: center; /* 텍스트 중앙 정렬 */
	
}
ul.form {
	list-style: none;
   }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<br>
		<c:if test="${not empty errorMsg}">
		<script type="text/javascript">
			alert("${errorMsg}");
			<%session.removeAttribute("errorMsg"); %>
		</script>
	</c:if>
	<c:if test="${not empty alertMsg}">
		<script type="text/javascript">
			alert("${alertMsg}");
			<%session.removeAttribute("alertMsg"); %>
		</script>
	</c:if>
	
	<form action="resetPwdNew.sh" method="POST" class="content" onsubmit="return validatePwd()">
	<div class="group">
		<h3 class="tit-st4">비밀번호 변경</h3>
		<div class="box">
			<div class="top" id="ck_input">
			</div>
				<div class="form_w form2" style="">
					<h4 class="t">새롭게 변경할 비밀번호를 입력해주세요.</h4>
					<ul class="form">
						<li>
							<label for="shopPwd" class="tt">새 비밀번호</label>
							<div class="cont">
								<input type="text" name="newPwd" id="newPwd">
							</div>
						</li>
						<li>
							<span class="tt">새 비밀번호 확인</span>
							<div class="cont">
								<div class="tel_confirm">
									<label for="pw2" class="hide"></label>
									<input type="text" name="newPwd2" id="newPwd2" onchange="isSame();">
								<span id=same></span>
								<button type="submit" class="bg-black" id="check">비밀번호 변경</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</form>
<script>
$(function(){
	$(document).ready(function() {
		var msg = "${msg}";
		if(msg != ""){
		alert(msg);    
		}
		});
});

	function validatePwd() {
	    var password = document.getElementById("newPwd").value;
	    var confirm = document.getElementById("newPwd2").value;
	
	    // 비밀번호 조건: 영문, 숫자, 특수문자 조합, 8~20자
	    var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^]).{8,20}$/;
	
	    if (!regex.test(password)) {
	        alert("비밀번호는 영문, 숫자, 특수문자(!@#$%^) 조합의 8~20자여야 합니다.");
	        return false;
	    }
	
	    if (password !== confirm) {
	        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return false;
	    }
	
	    return true;
	}
</script>
</body>
</html>