<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.btn btn-secondary {
	    color: white; 
	    text-decoration: none; 
	}
	.btn btn-secondary hover{
	    color: white; 
	    text-decoration: none; 
	}
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
			<h3 style="text-align:center;">상점 리스트</h3> <br>
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
						  <th class="admin_board_head">비밀번호 초기화</th>
						  <th class="admin_board_head">삭제</th>
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
						        <td class="admin_board_content_nm">
						         	<button onclick="resetPassword('${s.shopId}')" class="btn btn-warning">비밀번호 초기화</button>
						        </td>
						        <td class="admin_board_content_nm">
						        	<button class="btn btn-danger" onclick="deleteShop('${s.shopId}')" >삭제</button>
						        </td>
						    </tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>	
				<br><br>
				<div id="ibtn" style="text-align: center;">
					<a href="enrollShopForm.sh" class="btn btn-secondary">상점 등록</a>
					<a href="myPageForm.sh" class="btn btn-secondary">목록</a>
				</div>
				<br><br>
				
			<script>
			
			
					<!-- 수정 -->
					function changeStatus(shopId, status) {
					    $.ajax({
					        url: 'changeStatus',
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
					
					<!-- 삭제 -->
					function deleteShop(shopId) {
					    if(confirm("모든 데이터가 삭제됩니다. 해당 상점을 삭제하시겠습니까?")) {
					        $.ajax({
					            url: 'delete.sh', // 서버 측 처리 URL
					            method: 'POST',
					            data: {shopId: shopId}, // 서버로 전달할 데이터
					            success: function(response) {
					                alert("상점이 삭제되었습니다.");
					                window.location.reload(); // 페이지 새로 고침
					            },
					            error: function(xhr, status, error) {
					                alert("삭제 실패: " + error);
					            }
					        });
					    }
					}
					
					
					<!--비밀번호 초기화 -->
					function resetPassword(shopId) {
					    if (confirm("해당 상점의 비밀번호를 초기화하시겠습니까?")) {
					        $.ajax({
					            url: 'resetPassword.sh', 
					            type: 'POST',
					            data: { shopId: shopId },
					            success: function(response) {
					                alert("비밀번호가 초기화되었습니다.");
					                window.location.reload();
					            },
					            error: function(xhr, status, error) {
					                alert("비밀번호 초기화 실패: " + error);
					            }
					        });
					    }
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