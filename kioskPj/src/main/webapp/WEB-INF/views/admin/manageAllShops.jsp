<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #shp {
        margin: 0;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    
    table {
        width: 80%; 
        margin-top: 20px;
        border-collapse: collapse; 
    }

    .admin_board_wrap {
        margin: auto; 
    }

    .admin_board_head {
        background-color: #f2f2f2; 
        color: #333; 
        text-align: center; 
        padding: 10px; 
        border-bottom: 1px solid #ddd; 
    }

    .admin_board_content {
        text-align: center;
        padding: 10px;
        border-bottom: 1px solid #ddd; 
    }

    .pagination {
        justify-content: center; 
        padding-bottom: 20px; 
    }

    .page-link {
        color: #333; 
    }

    .page-item.disabled .page-link {
        color: #ccc; 
    }

    .page-item.active .page-link {
        background-color: #007bff; 
        color: white; 
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br>
			<div class="shp">
			<br>
			<h3 style="text-align:center;">상점 리스트</h3> <br><br>
				<table id="memberList" class="admin_board_wrap">
					<thead class="admin_boardList">
					    <tr>
					      <th class="admin_board_head">상점 아이디</th>
					      <th class="admin_board_head">상점명</th>
	 					  <th class="admin_board_head">대표자명</th>
	 					  <th class="admin_board_head">상점 이메일</th>
	 					  <th class="admin_board_head">계약일</th>
						  <th class="admin_board_head">현재 STATUS</th>
						  <th class="admin_board_head">STATUS 변경</th>
					    </tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${sList}">
							<tr class="admin_board_content">
								<td class="admin_board_content_nm">${s.shopId}</td>
							    <td class="admin_board_content_nm">${s.shopName}</td>
							    <td class="admin_board_content_nm">${s.shopRepresentative}</td>
							    <td class="admin_board_content_nm">${s.shopEmail}</td>
							    <td class="admin_board_content_nm">${s.contractPeriod}</td>
							    <td class="admin_board_content_nm">${s.userStatus}</td>
							    <td class="admin_board_content_nm">
						        <select name="userStatus" onchange="changeStatus('${s.shopId}', this.value)">
								    <option value="Y" ${s.userStatus == 'Y' ? 'selected' : ''}>활성</option>
								    <option value="N" ${s.userStatus == 'N' ? 'selected' : ''}>비활성</option>
								</select>
						        </td>
						    </tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
			
			
				<script>
					function changeStatus(shopId, status) {
					    $.ajax({
					        url: 'changeStatus', // 상태 변경을 처리하는 서버의 URL
					        method: 'POST',
					        data: {shopId: shopId, userStatus: status},
					        success: function(response) {
					            alert("상태가 변경되었습니다.");
					            window.location.reload();
					        },
					        error: function(xhr, status, error) {
					            alert("상태 변경 실패: " + error);
					        }
					    });
					}
			</script> 
			
			
			
		<br><br><br>	
		<div id="pagingArea">
        <ul class="pagination">
		<!-- currentPage가 1이면 숨기기 --> 
        <c:choose>
           	<c:when test="${pi.currentPage ne 1 }">
            	<li class="page-item"><a class="page-link" href="memberManage.form?currentPage=${pi.currentPage-1}">Previous</a></li>
            </c:when>
	                 <c:otherwise><!-- currentPage가 1일경우 (1페이지) -->
	                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    </c:otherwise>
                	</c:choose>
                	<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
	                  <c:choose>
                		<c:when test="${pi.currentPage eq p }">
                			<li class="page-item disabled"><a class="page-link" href="memberManage.form?currentPage=${p}">${p}</a></li>
                		</c:when>
                		<c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="memberManage.form?currentPage=${p}">${p}</a></li>
                		</c:otherwise>
                		</c:choose>
                	</c:forEach>
                    
					<!-- currentPage가 maxPage와 일치하면 숨기기  -->
                    <c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="memberManage.form?currentPage=${pi.currentPage +1}">Next</a></li>
						</c:otherwise>                    
                    </c:choose>
        	</ul>
   		</div>
</body>
</html>