<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% pageContext.setAttribute("replaceChar","\n"); %>
<!DOCTYPE html>
<html>
<head>
<style>
 .nav{
 	text-align: center;
 }
 #img{
 	background-size: contain;
 }
 .nav-item {
 	list-style-type: none;
 }
</style>
<meta charset="UTF-8">
<title>header</title>

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</head>
<body>


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center" align="center;">
        

				
	            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav" style="text-align: center;" >
	            	
	            	<!-- 홈화면 -->
		   	        <a class="nav-icon position-relative text-decoration-none" href="/index.jsp">
		                <i class="fa fa-fw fa-user text-dark mr-3"></i>
			                <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
			                	<img src="../resources/img/icon_home.png" style="width:50px; height:50px;" />
			                </span>
		          	</a>
		          	
		          	<!-- 로고 -->
	                <div class="flex-fill">
                        <li class="nav-item">
							<div class="header-main">
								<img src="../resources/img/kioskLogo.png" />
							</div>
                        </li>
	                </div>
	                
	                <!-- 로그인,마이페이지,로그아웃 -->
	                	<c:choose>
		                	<c:when test="${not empty loginUser}">
		                		<!-- 마이페이지 -->
					                 <a class="nav-icon position-relative text-decoration-none" href="myPageForm.sh" style="margin-right: 60px;">
					                 	 <i class="fa fa-fw fa-user text-dark mr-3"></i>
					                 	 <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
					                 	 	<img src="../resources/img/icon_mypage.png" style="width:50px; height:50px;"/>
				                           </span>
					                 </a>
				                 <!-- 로그아웃 -->
					                 <a class="nav-icon position-relative text-decoration-none" href="logout.sh">
					                 	 <i class="fa fa-fw fa-user text-dark mr-3"></i>
					                 	 <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
					                 	 	<img src="../resources/img/icon_signout.png" style="width:50px; height:50px;"/>
				                           </span>
					                 </a>
				             </c:when>
				             <c:otherwise>
			                 	<!-- 로그인 되지 않았을 때: 로그인 버튼 -->
					                 <a class="nav-icon position-relative text-decoration-none" href="loginForm.sh">
					                     <i class="fa fa-fw fa-user text-dark mr-3"></i>
					                     <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">
					                         <img src="../resources/img/icon_login.png" style="width:50px; height:50px;"/>
					                     </span>
					                 </a>
				             </c:otherwise>
		                </c:choose> 
		           </div>
	                 
             </div>
    </nav>
    <!-- Close Header -->
    


</body>
</html>