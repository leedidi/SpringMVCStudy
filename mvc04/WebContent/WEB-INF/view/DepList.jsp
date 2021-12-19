<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DepartmentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>


</head>
<body>

<!-----------------------------------------------------------------------------
   #15. DepList.jsp
   - 부서 리스트 출력 페이지
   - 사용자가 접근하는 부서 데이터 출력 페이지
----------------------------------------------------------------------------->

<div>

	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmpMenu.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 부서 리스트 ]</h1>
		<hr>

		<br><br>
		<table id="customers" class="table">
			<tr>
				<!-- 항목 15EA -->
				<th>부서 번호</th>
				<th>부서 이름</th>
			</tr>
			<tr>
			<c:forEach var="department" items="${departmentList }">
			<tr>
				<td>${department.departmentId }</td>
				<td>${department.departmentName }</td>				
			</tr> 
			</c:forEach> 
			 
		</table>		
	</div>

	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>
	
</div>


</body>
</html>