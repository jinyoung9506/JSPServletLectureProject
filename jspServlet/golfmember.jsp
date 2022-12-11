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
		padding-left: 30%;
	}
	table {
		width: 60%;
	}
</style>
</head>
<body>
	<%@ include file="leftframe.jsp" %>
	<header id="header"> 골프연습장 회원관리 프로그램 </header>
<%
	ResultSet resultSet = (ResultSet)request.getAttribute("result");
	ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
%>
<div id="carrier">
	<table border="5px" id="tb">
		<caption>회원 정보 조회</caption>
		<tbody>
			<tr>
				<th>수강월</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>강의명</th>
				<th>강의 장소</th>
				<th>수강료</th>
				<th>등급</th>
			</tr>
		</tbody>
		<tbody align="center">
			<%
				while (resultSet.next()) {
			%>
					<tr>
			<%
					for (int i = 1; i <= resultSetMetaData.getColumnCount(); i++) {
						if (resultSetMetaData.getColumnLabel(i).equals("TUTITION")){
			%>			
							<td>&#x20a9;<%= resultSet.getString(resultSetMetaData.getColumnLabel(i)) %></td>
			<%
						} else if (resultSetMetaData.getColumnLabel(i).equals("REGIST_MONTH")) {
			%>				
							<td><%= resultSet.getString(resultSetMetaData.getColumnLabel(i)).substring(0, 4)%>년<%= resultSet.getString(resultSetMetaData.getColumnLabel(i)).substring(4, 6)%>월</td>
			<%				
						} else {
			%>
							<td><%= resultSet.getString(resultSetMetaData.getColumnLabel(i)) %></td>
			<%
						}
					}
			%>
					</tr>
			<%
				} 
			%>
		</tbody>
	</table>
</div>
</body>
</html>