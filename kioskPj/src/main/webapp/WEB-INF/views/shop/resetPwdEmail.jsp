<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<style>
.group {
	text-align : center;
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
	<div class="sub_page">
			<form action="resetPwdEmail.sh" method="post" class="content">
				<input type="hidden" name ="num" value="${num}">
					<div class="group">
						 <h3 class="tit-st4">인증번호 입력</h3>
						 <div class="box">
							<div class="top" id="ck_input"></div>
								<div class="form_w form2" style="">
									<h4 class="t">인증번호를 입력해주세요.</h4>
									<ul class="form">
										<li>
											<label for="shopPwd" class="tt">인증 번호</label>
											<div class="cont">
												<div class="tel_confirm">
													<input type="text" name="emailAuthNum" placeholder="인증번호를 입력하세요">
													<button type="submit" id="check" value="확인" class="bg-black btn-c">확인</button>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
			</form>
		</div>
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