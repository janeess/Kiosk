<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.group {
	text-align : center;
}
ul.form {
	list-style: none;
   }
</style>
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
	
		<form class = "content" action="resetPwd.sh" method="post">
			<div class="group">
				<h3 class="tit-st4">비밀번호 재설정</h3> <br>
				<div class="box">
					<div class="top" id="ck_input">
					</div>
						<div class="form_w form2" style="">
							<h4 class="t">본인확인 이메일주소와 입력한 이메일 주소가 같아야, 비밀번호를 메일로 받을 수 있습니다.</h4>
							<ul class="form">
								<li>
									<label for="shopName" class="tt">업체명</label>
									<div class="cont">
										<input type="text" name="shopName" id="shopName">
									</div>
								</li>
								<li>
									<span class="tt">이메일 주소</span>
									<div class="cont">
										<div class="tel_confirm">
											<label for="email" class="hide">이메일</label>
											<input type="text" name="chkEmail" id="chkEmail">
										<button type="submit" id="check" class="bg-black btn-c">인증번호 받기</button>
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
</script>

</body>
</html>