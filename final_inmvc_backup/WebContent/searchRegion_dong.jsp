<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchRegion.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" 
integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<!-- 뷰 개인 설정 -->
<style type="text/css">
	/* 
	#seoulmap
	{
		border: 10pt;
		border-color: skyblue;
	}
 */
</style>

</head>
<body>

<div>
	<c:import url="MenuNavbar_new.jsp"></c:import>
</div>

<br><br><br><br><br>

<div>
	<h1>지역 조회</h1>
	<h3>구와 동 모두 선택했을 경우</h3>
</div>
<br><br>
<div class="selectGuDong"> 
	<table>
		<tr>
			<th>서울 특별시</th>
			
			<td>지역</td>
			<td>
				<select class="custom-select d-block w-100" id="searchGu" required="">
					<option>- 구 선택 -</option>
					<option value="1">강남구</option>
					<option value="2">강동구</option>
					<option value="3">강북구</option>
					<option value="4">강서구</option>
					<option value="5">관악구</option>
					<option value="6">광진구</option>
					<option value="7">구로구</option>
					<option value="8">금천구</option>
					<option value="9">노원구</option>
					<option value="10">도봉구</option>
					<option value="11">동대문구</option>
					<option value="12">동작구</option>
					<option value="13">마포구</option>
					<option value="14">서대문구</option>
					<option value="15">서초구</option>
					<option value="16">성동구</option>
					<option value="17">성북구</option>
					<option value="18">송파구</option>
					<option value="19">양천구</option>
					<option value="20">영등포구</option>
					<option value="21">용산구</option>
					<option value="22">은평구</option>
					<option value="23">종로구</option>
					<option value="24">중구</option>
					<option value="25">중랑구</option>
				</select>  
			</td>
			
			<td>
				<select class="custom-select d-block w-100" id="searchDong" required="">
				<option>- 동 선택 -</option>
				<option value="1">서초1동 </option>
				<option value="2">서초2동 </option>
				<option value="3">서초3동 </option>
				<option value="4">서초4동 </option>
				<option value="5">잠원동 </option>
				<option value="6">반포본동 </option>
				<option value="7">반포1동  </option>
				<option value="8">반포2동 </option>
				<option value="9">반포3동</option>
				<option value="10">반포4동 </option>
				<option value="11">방배본동 </option>
				<option value="12">방배1동 </option>
				<option value="13">방배2동 </option>
				<option value="14">방배3동 </option>
				<option value="15">방배4동 </option>
				<option value="16">양재1동 </option>
				<option value="17">양재2동 </option>
				<option value="18">내곡동</option>
			</select>  
			</td>
		</tr>
	</table>
</div>
<br><br>



<!-- data-toggle="buttons" -->
	
<div class="container">

	<img src="<%=cp%>/images/seoulmap.gif" class="border border-info">

	<br><br>
	
	<div class="custom-control custom-checkbox" >
		<hr>
		<label class="btn1">
			<input type="checkbox"> 주거비(월세)
		</label>
		<label class="btn2">
			<input type="checkbox"> 주거비(전세)
		</label>
		<label class="btn3">
			<input type="checkbox"> 주거비(매매)
		</label>
		<label class="btn4">
			<input type="checkbox"> 치안
		</label>
		<label class="btn5">
			<input type="checkbox"> 대중교통
		</label>	
	</div>
	
	<div class="custom-control custom-checkbox" >
		<label class="btn6">
			<input type="checkbox"> 교통혼잡도
		</label>
		<label class="btn7">
			<input type="checkbox"> 생활편의시설
		</label>
		<label class="btn8">
			<input type="checkbox"> 반려동물
		</label>
		<hr>
		
	</div>
	
	<div style="text-align: right; padding-right: 350pt;">
		<button type="button" class="btn btn-primary">필터 적용</button>
	</div>
	
	
</div>				


<br><br>
<div class="searchTable">
        <table class="table table-striped table-sm">	<!-- 이 클래스명 변경하면 안 됨! -->
          <thead>
            <tr>
              <th>
              	<select class="custom-select d-block w-100" id="selectGu" required="">
         			<option value="">구분</option>
        			 <option>구분 오름차순</option>
        			 <option>구분 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectWolse" required="">
         			<option value="">주거비(월세)</option>
        			 <option>월세 오름차순</option>
        			 <option>월세 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectJeonse" required="">
         			<option value="">주거비(전세)</option>
        			 <option>전세 오름차순</option>
        			 <option>전세 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectMaemae" required="">
         			<option value="">주거비(매매)</option>
        			 <option>매매 오름차순</option>
        			 <option>매매 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectChian" required="">
         			<option value="">치안</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectDaejung" required="">
         			<option value="">대중교통</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
              <th>
              	<select class="custom-select d-block w-100" id="selectHonjob" required="">
         			<option value="">교통혼잡도</option>
        			 <option>점수 오름차순</option>
        			 <option>점수 내림차순</option>
    			</select>
              </th>
            </tr>
          </thead>
          <tbody>
          
          <!-- 코멘트는 클릭해서 보기로 한 것 같아서 안 넣었어요 -->
          
            <tr>
              <td>평균</td>
              <td>1000/80 만원</td>
              <td>1억 2천</td>
              <td>1억 8천</td>
              <td>4.5</td>
              <td>3.3</td>
              <td>4.3</td>
            </tr>
             <tr>
              <td>1</td>
              <td>2000/90 만원</td>
              <td>2억 2천</td>
              <td>2억</td>
              <td>4.0</td>
              <td>3.5</td>
              <td>4.0</td>
            </tr>
             <tr>
              <td>2</td>
              <td>1500/70 만원</td>
              <td>2억 2천</td>
              <td>1억 7천</td>
              <td>4.1</td>
              <td>3.7</td>
              <td>4.1</td>
            </tr>
             <tr>
              <td>3</td>
              <td>1000/45 만원</td>
              <td>1억 1천</td>
              <td>1억 1천</td>
              <td>3.8</td>
              <td>3.5</td>
              <td>4.0</td>
            </tr>
            <tr>
              <td>...</td>
              <td>...</td>
              <td>...</td>
              <td>...</td>
              <td>...</td>
              <td>...</td>
              <td>...</td>
            </tr>
            
           
          </tbody>
        </table>
      </div>



</body>
</html>