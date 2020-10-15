<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<style>
	*
	{
		margin : 0;
		padding : 0;
	    text-align : center;
	}
	
	.login
	{
		display : table;
		height : 200px;
	}
	
	.box
	{
	    display : table-cell;
	    vertical-align : middle;
   	}
   	
   	#calendar
   	{
   		width : 100%;
   		height : 550px;   		
   	}
   	
   	#cal_head
   	{
   		height : 50px;
   	}
   	
   	#cal_body
   	{
   		border: 1px groove;
   	}
   	   	   		
   	#tbl > tbody td
   	{
   		height : 100px;
   	}
   	
   	#tbl > thead
   	{
   		font-weight : bold;
   	}
   	
   	.sun
   	{
   		color : red;
   	}
   	
   	.sat
   	{
   		color : blue;
   	}
   	.bgcolor
	{
		background-color:#81F7BE;
		
	}
	
	.subject
	{
		font-size: 20pt;
		text-align: center;
		font-weight: bold;
	}

	.title-text
	{
		font-size: 15pt;
		font-weight: bold;	
		text-align: center;
	}
	
	.day:hover
	{
		cursor : Pointer;
		background-color : gray;
	}

</style>
<body>

	
	
	<div class="header">
	<nav class="navbar navbar-default">
	<div class="container display-lg-up">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">와플병원</a>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li class="droupdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">환자검색<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a
							href="/adm/code_manager.php?gu=good_type">본사상품코드</a>
							<ul class="dropdown-menu">
								<li><a href="#">본상품코드관리</a></li>
								<li><a href="#">엑셀파일 업로드</a></li>
							</ul></li>
						<li class="divider"></li>
						<li><a href="/adm/code_manager.php?gu=deal_kind">쇼핑몰코드</a></li>
					</ul></li>
				<li class="droupdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">입원<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="/bbs/bbs_admin.php">엑셀주문서등록</a></li>
						<li class="divider"></li>
						<li><a href="/adm/code_manager.php?gu=deal_kind">쇼핑몰코드</a></li>
					</ul></li>
				<li><a href="/adm/good_manager.php?who=100">수술실</a></li>
				<li><a href="/adm/good_manager.php?who=100">입원실</a></li>
				<li><a href="/adm/good_manager.php?who=200">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="bgcolor"><a href="#"><b class="glyphicon glyphicon-link"></b>&nbsp;내 일정 관리</a></li>
				<li class="bgcolor" style=""><a href="#"><b class="glyphicon glyphicon-log-out"></b>&nbsp;로그아웃</a></li>
			</ul>
		</div>
	</div>
	</nav>
	</div>


 	<div class="container-fluid">
 	
 		<div class="row panel subject">
 			<div class="col-md-1"></div>
 			<div class="col-md-7 col-xs-12">
 				<p>세균과</p>
 			</div>
		</div>
		
 		<div class="row">
 			<div class="col-md-1"></div>
 			<div class="col-md-7 col-xs-12">
 				<div id="calendar">
 					<div id="cal_head">
 						<button type="button" id="yearDown" value="-1" onclick="yearChange(this);">◀</button> <button type="button" id="monthDown" value="-1" onclick="monthChange(this);">◁</button>
 						<span id="year"><%=cal.get(Calendar.YEAR) %></span>년 <span id="month"><%=cal.get(Calendar.MONTH) + 1 %></span>월
 						<button type="button" id="monthUp" value="1" onclick="monthChange(this);">▷</button> <button type="button" id="yearUp" value="1" onclick="yearChange(this);">▶</button>
 					</div>
 					<div id="cal_body">
	 					<table id="tbl" style="width : 100%;">
	 						<thead>
	 							<tr>
		 							<br>
		 							<td>일</td>
		 							<td>월</td>
		 							<td>화</td>
		 							<td>수</td>
		 							<td>목</td>
		 							<td>금</td>
		 							<td>토</td>
	 							</tr>
	 						</thead>
	 						<tbody></tbody>
	 					</table>
 					</div>
 				</div>
				
				<br><br><br><br><br><br><br><br>
				
 				<div class="row panel panel-default">
					<div class="col-md-1"></div>
				
					<div class="col-md-10 col-xs-12">
					<br>
					<p class="title-text">오늘의 진료</p><br>
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="#">신성철 교사</a></li>
					  <li role="presentation"><a href="#">김태균 교수</a></li>
					  <li role="presentation"><a href="#">문승주 교수</a></li>
					</ul>
					
					<ul class="list-group">
					 <li class="list-group-item ">
					  	<div class="row">
						  	<div class="col-md-1 col-xs-1">
						  		<span>순번</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span>환자 이름</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span>내용</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-5">
						  		<span>시간</span>		
						  	</div>					  		
					 	</div>			  	
					  </li>
					  <li class="list-group-item ">
					  	<div class="row">
						  	<div class="col-md-1 col-xs-1">
						  		<span>1</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span>최호석</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span style="color: green">진료</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-5">
						  		<span>09:00 ~ 09:30</span>		
						  	</div>					  		
					 	</div>			  	
					  </li>
					  <li class="list-group-item">
					  	<div class="row">
						  	<div class="col-md-1 col-xs-1">
						  		<span>2</span>		
						  	</div>					  	
						  	<div class="col-md-3 col-xs-3">
						  		<span>길동규</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span style="color: green">진료</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-5">
						  		<span>09:30 ~ 10:00</span>		
						  	</div>	
					 	</div>			  	
					  </li>
					  <li class="list-group-item">
					  	<div class="row">
						  	<div class="col-md-1">
						  		<span>3</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span>신재민</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span style="color: green">진료</span>		
						  	</div>	
						  	<div class="col-md-3 col-xs-5">
						  		<span>11:30 ~ 11:00</span>		
						  	</div>					  	
					 	</div>			  	
					  </li>
					  <li class="list-group-item">
					  	<div class="row">
						  	<div class="col-md-1">
						  		<span>4</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span>하일권</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-3">
						  		<span style="color: red">수술</span>		
						  	</div>
						  	<div class="col-md-3 col-xs-5">
						  		<span>09:00 ~ 09:30</span>		
						  	</div>						  		
					 	</div>			  	
					  </li>				  
					</ul>
					</div>
					<div class="col-md-1"></div>
				</div>
			
 				
 				
 				
 				
 			</div>
			<div class="col-md-3 panel panel-default">
			<br><p class="title-text">근무자 현황</p>
				<div class="panel-body">
					<ul class="list-group list-group-horizontal">					
						<li class="list-group-item board-header" style="background-color: #81F7BE">
							<span>오늘 근무자</span>						
						</li>
						<li class="list-group-item board-body">
						<a href="#">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" 
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd"
	  						 d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>
	 						 신성철
	 					</a>
						</li>
						<li class="list-group-item board-body">
						<a href="#">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" 
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd"
	  						 d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>
	 						 김태균
	 					</a>
						</li>
						<li class="list-group-item board-body">
						<a href="#">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" 
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd" 
	  						d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							</svg>
	 						 문승주
	 					</a>
						</li>					
					</ul>
				</div>
				
				<div class="panel-body">	
					<ul class="list-group list-group-horizontal">					
						<li class="list-group-item board-header" style="background-color: #81F7BE">
							<span>휴가자</span>						
						</li>
						<li class="list-group-item board-body">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" 
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd"
	  						 d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>
	 						 임종덕
						</li>
						<li class="list-group-item board-body">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" 
							fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  						<path fill-rule="evenodd" 
	  						d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
							</svg>
	 						 박형근
						</li>				
					</ul>
				</div>		
			</div>

		</div>
	</div>
</body>
</html>
 			
 			
 			
 			
 			
 			
 			
 		</div>
 	</div>
</body>
<script>
	var y = $("#year");
	var m = $("#month");
	var d = <%=cal.get(Calendar.DATE) %>;
	var nowm = <%=cal.get(Calendar.MONTH)%> + 1;

	$().ready(function()
	{
		onCalendar();
	});
	
	// 연도 변환
	function yearChange(result)
	{
		var year = Number(y.text());
		var turn = Number(result.getAttribute("value"));
			
		$("#year").text(year + turn);
		onCalendar();
	}
	
	// 개월 변환
	function monthChange(result)
	{
		var year = Number(y.text());
		var month = Number(m.text());
		var turn = Number(result.getAttribute("value"));
		
		if(month + turn > 12)
		{
			$("#year").text(year + turn);
			$("#month").text(1);
			onCalendar();
			return;	
		}
		else if(month + turn < 1)
		{
			$("#year").text(year + turn);
			$("#month").text(12);
			onCalendar();
			return;	
		}
		
		$("#month").text(month + turn);
		onCalendar();
	}
	
	function onCalendar()
	{
		$("#tbl > tbody").empty();
		var year = Number(y.text());
		var month = Number(m.text());
		var str = "";
		var totalDate = (year - 1) * 365 + parseInt((year - 1) / 4) - parseInt((year - 1) / 100) + parseInt((year - 1) / 400);
		var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		
		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
			days[1] = 29;
		
		for(var i = 0; i < month - 1; i++)
			totalDate += days[i];
		// 로그인
		totalDate += d;
		
		var week = totalDate % 7;
		
		for(var i = 1; i <= days[month - 1] + week; i++)
		{	
			if(i % 7 == 1)
				str += "<tr>";				
			
			str += "<td class="
			
			if(i - week + 1 == d && nowm == month)	
				str += "'bgcolor day'";
			
			if(i < week)
				str += "''";
			else if(i % 7 == 0)
				str += "'sun day'";
			else if(i % 7 == 1)
				str += "'sat day'";
			else
				str += "'normal day'";
			
			
			
			if(i > week)
			{
				str += " onclick='location.href=\"www.naver.com\"'>";
				str += i - week;
			}
			str += "</td>";
			
			if(i % 7 == 0)
				str += "</tr>";
		}
		if(days[month - 1] + week != 35)
		{
			for(var i = 1; i < 7 - week; i++)
				str += "<td></td>";
		}
		
		$("#tbl > tbody").append(str);
	}
</script>
</html>