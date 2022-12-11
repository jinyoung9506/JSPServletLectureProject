<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Golf</title>
<style type="text/css">
	#carrier {
		padding-top: 15%;
		padding-left: 40%;
	}
	table {
		width: 30%;
	}
	td {
		text-align: left;
	}
</style>
</head>
<body>
	<%
		ResultSet resultSet = (ResultSet)request.getAttribute("members");
		ResultSet resultSet1 = (ResultSet)request.getAttribute("members2");
		ResultSet resultSet2 = (ResultSet)request.getAttribute("classarea");
		ResultSet resultSet3 = (ResultSet)request.getAttribute("classnameandtccode");
	%>
	<%@ include file="leftframe.jsp" %>
	<header id="header"> 골프연습장 회원관리 프로그램 </header>
	<script type="text/javascript">
	function classChange(e) { 
		let target = document.getElementById("fee");
		let code = document.getElementById("cno");
		if (e.value.includes('100')) {
			target.value = 100000;
			if (code.value > 20000) {
				target.value = target.value / 2;
			}
		}
		if (e.value.includes('200')) {
			target.value = 200000;
			if (code.value > 20000) {
				target.value = target.value / 2;
			}
		}
		if (e.value.includes('300')) {
			target.value = 300000;
			if (code.value > 20000) {
				target.value = target.value / 2;
			}
		}
		if (e.value.includes('400')) {
			target.value = 400000;
			if (code.value > 20000) {
				target.value = target.value / 2;
			}
		}
	}
	
	
	function nameChange(e) {
		let code = document.getElementById("cno");
		
		<%
		while (resultSet1.next()) {
	 	%>
			if(e.value.includes('<%=resultSet1.getString("C_NAME")%>')) {
				code.value = <%=resultSet1.getString("C_NO") %>
			}
		<%
		}							
		%>
	}
</script>
<div id="carrier">
	<form method="post" action="GOLF2add.ctrl" accept-charset="UTF-8">
		<table border="5px" id="tb">
			<caption>수강 신청</caption>
			<tbody align="center">
				<tr>
					<th>수강월</th><td><input type="text" maxlength="6" name="regist_month" > 예)202203</td>
				</tr>
				<tr>
					<th>회원명</th>
					<td>
						<select name="member_name" id="name" onchange="nameChange(this)">
							<%
								while (resultSet.next()) {
							 %>
							<option value="<%= resultSet.getString("C_NAME") %>"><%= resultSet.getString("C_NAME") %></option>
							<%
								}							
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원번호</th><td><input type="text" maxlength="5" id="cno" value="10001" name="member_number"></td>
				</tr>
				<tr>
					<th>강의장소</th>
					<td>
						<select name="class_area" id="area" onchange="areaChange(this)">
							<%
								while (resultSet2.next()) {
							 %>
							<option value="<%= resultSet2.getString("CLASS_AREA") %>"><%= resultSet2.getString("CLASS_AREA") %></option>
							<%
								}							
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>강의명</th><td><select name="teacher_code" id="area" onchange="classChange(this)">
							<%
								while (resultSet3.next()) {
							 %>
							<option value="<%= resultSet3.getString("TEACHER_CODE") %>"><%= resultSet3.getString("CLASS_NAME") %></option>
							<%
								}							
							%>
						</select></td>
				</tr>
				<tr>
					<th>수강료</th><td><input type="text" size="6" id="fee" name="class_tutition"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="제출하기">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

</body>
</html>