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
<title>IdSearch.jsp</title>


	
	<table width="1330px" height="430px" align="center">
		<tr>
		<td>
		 <table width="600px" align="center" border="0"
		  style="color: black; background-color: #F6F6F6; font-size: 20px;">
		  <tr>
		   <td>
		    <table width="750px" align="center" border=0;
		     style="background-color: white; margin-top: 3%">
		     <tr>
		      <td align="center"><img src=" "
		       height="30px"></td>
		      <td>아이디 찾기</td>
		      <td><div id="">| 휴대 전화로 인증</td>
		      <td width="300px"></td>
		     </tr>
		    </table>
		   </td>
		  </tr>
		  <tr>
		    <td>
		     <table width="800px" height="300px" align="center"
		      style="border: dotted 5px none; margin-top: 4%">
		
		      <tr>
		       <td>
		        <table width="300px" height="30px" border="0"
		         style="margin-top: 3%; color: black; font-size: 18px;">
		         <tr>
		          <td>&nbsp;&nbsp; <img src=" "
		           height="30px">
		          </td>
		          <td >&nbsp;이름,핸드폰번호로 찾기</td>
		         </tr>
		        </table>
		       </td>
		      </tr>
		
		      <tr>
		       <td>
		        <table width="380px" height="70px" align="center" border="0"
		         style="font-size: 16px;">
		         <tr>
		          <td>이름</td>
		          <td><input type="text" name="name"></td>
		         </tr>
		         <tr>
		          <td>휴대폰</td>
		          <td>
		          <input type="text" name="phone1" style="width: 70px">
		           - <input type="text" name="phone2" style="width: 70px">
		           - <input type="text" name="phone3" style="width: 70px"></td>
		         </tr>
		        </table>
		       </td>
		      </tr>
		      <tr>
		       <td>
				<table width="140px" height="10px" border="0"
				 style="margin-top: 2%" align="center">
				 <tr>
				  <td><input type="button" name="enter2" value="  찾기  "
				   align="center"
				   style="cursor: pointer; background: white; color: black; border-color: black;"
				   onclick="location='IdFound.jsp'">
				  
				  <td><input type="button" name="cancle2"
				   value="  취소  " align="center"
				   style="cursor: pointer; background: white; color: black; border-color: black"
				   onClick="main.jsp"></td>
				 </tr>
	</table>
	
<!-- <style type="text/css">
/* 사각 칸 */
p.story 
{
	color: #4B4B4B;
	font-size: 11px;
	text-indent: 1.5em;
	line-height: 15px;
	padding: 60px;
	margin: 20px;
	font-size: 20px;
	color: black; 
	border: 2px solid black;
}
</style>
</head>
<body>

	<h1>&emsp;&nbsp;아이디 찾기</h1>
	<hr>
	<p class="story">
	
	아이디 찾기 : 
	
	</p> -->

</body>
</html>