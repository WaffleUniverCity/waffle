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
				<li class="bgcolor"><a href="#"><b class="glyphicon glyphicon-link"></b>&nbsp;회원가입</a></li>
				<li class="bgcolor" style=""><a href="#"><b class="glyphicon glyphicon-log-out"></b>&nbsp;로그인</a></li>
			</ul>
		</div>
	</div>
	</nav>
	</div>


 	<div class="container-fluid">
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
 			</div>
 			<div class="col-md-4 col-xs-12 login">				
 			</div>
 		</div>
 	</div>
</body>
<script>
	var y = $("#year");
	var m = $("#month");
	var d = <%=cal.get(Calendar.DATE) %>;

	$().ready(function()
	{
		onCalendar();
	});
	
	function yearChange(result)
	{
		var year = Number(y.text());
		var turn = Number(result.getAttribute("value"));
			
		$("#year").text(year + turn);
		onCalendar();
	}
	
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
		
		for(var i = 1; i < days[month - 1] + week; i++)
		{	
			if(i % 7 == 1)
				str += "<tr>";
				
			str += "<td"
			
			if(i % 7 == 0)
				str += " class='sun'";
			else if(i % 7 == 1)
				str += " class='sat'";
			
			str += ">";
			
			if(i >= week)
				str += i - week + 1;
			str += "</td>";
			
			if(i % 7 == 0)
				str += "</tr>";
		}
		
		for(var i = 1; i < 7 - week; i++)
			str += "<td></td>";
		
		$("#tbl > tbody").append(str);
	}
</script>
</html>