<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
        <!-- Bootstrap CSS -->
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='resources/css/login.css'/>"/>
  	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <title>로그인 페이지</title>
</head>
<body class="text-center">
	<jsp:include page="../common/header.jsp" />
	

    <div id="container">
    <form action="login.sh" method="post" onsubmit="return actionLogin(this);">
        
        <div id="loginBoxTitle">Login</div>
	        <div id="inputBox">
	        	<div class="input-form-box"><label for="username">아이디</label><input type="text" name="shopId" id="shopId" class="form-control"></div>
	        	<div class="input-form-box"><label for="password">비밀번호</label><input type="password" name="shopPwd" id="shopPwd" class="form-control"></div>
		        <div class="button-login-box" >
		            <button type="submit" class="btn btn-primary btn-xs" style="width:100%">로그인</button>
		        </div>
       		</div>
    </form>
   </div> 
    <script>
    
    
	    function actionLogin(form){
	    	var username = $("#shopId").val();
	    	var password = $("#shopPwd").val();

	    	if (username == "" || username == null ) {
	    		alert("아이디를 입력하셔야 합니다.");
	    		$("#shopId").focus();
	    		return false;
	    	}

	    	if (password == "" || password == null ) {
	    		alert("비밀번호를 입력하셔야 합니다.");
	    		$("#shopPwd").focus();
	    		return false;
	    	}
	    	
			return true;
	    }


    </script>
</body>
</html>