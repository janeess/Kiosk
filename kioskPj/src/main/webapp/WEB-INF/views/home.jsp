<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<style>
h4{
	display: inline-block; 
	width: 100%; 
	text-align: center;
}
</style>
</head>
<body>
	<c:if test="${not empty errorMsg}">
		<script type="text/javascript">
			alert("${errorMsg}");
		<%session.removeAttribute("errorMsg");%>
		</script>
	</c:if>
	<c:if test="${not empty alertMsg}">
		<script type="text/javascript">
			alert("${alertMsg}");
		<%session.removeAttribute("alertMsg");%>
		</script>
	</c:if>

	<jsp:include page="../views/common/header.jsp" />
	<jsp:include page="../views/common/main.jsp" />
	<br>
	<!--<jsp:include page="../views/common/footer.jsp" />-->
</body>
</html>
