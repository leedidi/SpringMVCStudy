<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MenuNavbar_admin.jsp</title>
<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<a class="navbar-brand mr-auto mr-lg-0 font-weight-bold" href="#">서로</a>
		<button class="navbar-toggler p-0 border-0" type="button"
			data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse offcanvas-collapse" id="Main">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="Main_admin.jsp">&nbsp;&nbsp;메인</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown01"
					data-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;알림/공지</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="<%=cp%>/Introduction.jsp">서비스
							소개</a> <a class="dropdown-item" href="<%=cp%>/NoticeList.jsp">공지사항</a>
						<a class="dropdown-item" href="<%=cp%>/FaqListNode.jsp">자주 묻는
							질문</a>
					</div></li>
				<!-- <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;회원조회</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="<%=cp%>/AccountList.jsp">회원 리스트 조회</a> <a class="dropdown-item" href="<%=cp%>/WithdrawalAccountList.jsp">탈퇴회원 리스트 조회</a>
					</div></li> -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdown01"
					data-toggle="dropdown" aria-expanded="false">&nbsp;&nbsp;회원조회</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="<%=cp%>/AccountList.jsp">회원 리스트</a>
						<a class="dropdown-item" href="<%=cp%>/WithdrawalAccountList.jsp">탈퇴회원
							리스트</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=cp%>/ReportCheck.jsp">&nbsp;&nbsp;신고처리</a></li>
			</ul>

			<ul
				class="navbar-nav mr-auto navbar-right navbar-nav my-2 my-md-0 mr-md-3">
				<li class="nav-item"><a class="nav-link" href="#">&nbsp;&nbsp;로그아웃</a></li>
			</ul>

			<!-- 원래는 이거(회원가입/로그인)였다가 로그인하면 마이페이지/ 로그아웃으로 변경된다.
		    <ul class="navbar-nav mr-auto navbar-right navbar-nav my-2 my-md-0 mr-md-3">
		       <li class="nav-item">
		       	<a class="nav-link" href="#">회원 가입</a>
		     	</li>
		     	<li class="nav-item">
		       	<a class="nav-link" href="#">&nbsp;&nbsp;로그인</a>
		    	 </li>
		    </ul>
		    -->
		</div>
	</nav>
</body>
</html>