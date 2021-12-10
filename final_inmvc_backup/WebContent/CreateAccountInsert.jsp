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
<title>CreateAccountInsert.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/CreateAccountInsert.css">
<style type="text/css">
	p 
	{ 
		font-size: small;
		color: red; 
	}
</style>
</head>
<body>

	<!-- 메뉴 영역 -->
	<div>
	<c:import url="MenuNavbar_new.jsp"></c:import>
	</div>

	<!-- 콘텐츠 영역 -->
<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원가입</h2>
          <p class="exTxt">회원가입 시 핸드폰 인증을 진행하셔야 합니다.</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" class="id" id="id" placeholder="ID를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>사용할 수 없는 아이디입니다.</p><p>아이디를 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" class="name" id="name" placeholder="이름을 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>이름을 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" class="nickname" placeholder="닉네임을 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>사용할 수 없는 닉네임입니다.</p><p>닉네임을 입력해주세요.</p><br /></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" class="password" placeholder="비밀번호를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>비밀번호를 입력해주세요.</p></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="text" class="password2" placeholder="비밀번호를 확인하세요."></td>
                </tr>
                 <tr>
                	<th></th>
                	<td><p>비밀번호 확인을 입력해주세요.</p></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="text" class="email" placeholder="이메일을 입력하세요.">
                  </td>
                <tr>
                	<th></th>
                	<td><p>이메일을 입력해주세요.</p></td>
                </tr>  
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" class="phone" placeholder="전화번호를 입력하세요."></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>이미 가입했거나, 현재 가입이 불가능한 번호입니다.</p>
						<p>휴대전화를 입력해주세요.</p></td>
                </tr>  
                <tr>
                  <th><span>인증번호 확인</span></th>
                  <td><input type="text" class="send_number" placeholder="인증번호를 입력하세요">
                     <button type="submit" class="btn" id="btn">인증번호 발송</button><br>
                  </td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td><input type="text" class="upun" readonly="readonly" placeholder="우편번호">
                   <button type="submit" class="btn" id="btn">우편번호 검색</button><br>
		<input type="text" class="address" readonly="readonly" placeholder="주소"></input>
		<input type="text" class="detailaddress" placeholder="상세주소 입력"></input></td>
                </tr>
                <tr>
                	<th></th>
                	<td><p>주소를 입력해주세요.</p></td>
                </tr>  
                <tr>
              </tbody>
            </table>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          </div><!-- join_form E  -->
          <div class="btn_wrap">
            <button type="submit" class="btn" id="btn">가입하기</button>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->

</body>
</html>