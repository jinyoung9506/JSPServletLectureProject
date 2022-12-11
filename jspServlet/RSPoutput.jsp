<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0;}
		table{align-content: center;}
		a:hover{text-decoration: none; color: white;}
		label {background: skyblue;}
		td {text-align: center;}
		
		#divbox {
			padding-left: 30%;
			padding-top: 15%;
		}
	
		#page-wrapper {
		  	margin-left: 0px;
		    padding: 0px;
		    height: 130%;
	  	}
</style>
</head>
<body>
<%@ include file="leftframe.jsp" %>
<div id="divbox">
	<table>
		<tr>
			<td>
				<div>
					<iframe src="${userInput}.html" width="250px" height="250px"></iframe>
					<div>
						<p>user</p>
					</div>
				</div>
			</td>
			<td>
				<img alt="" src="rsp_img/${result}.gif" width="250px", height="250px">
				<br><div>${result}</div>
			</td>
			<td>
				<div>
					<iframe src="${cpuInput}.html" width="250px" height="250px"></iframe>
					<div>
						<p>cpu</p>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td><button type="button" class="btn btn-primary"><a href="RSP.ctrl">다시하기</a></button></td>
		</tr>
	</table>
</div>
</body>
</html>