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
			padding-left: 0%;
			padding-top: 15%;
		}
	
		#page-wrapper {
		  	margin-left: 0px;
		    padding: 0px;
		    height: 130%;
	  	}
	</style>
	<script type="text/javascript">
		function button1_click() {
			let rad1 = document.getElementById("rad1");
			let rad2 = document.getElementById("rad2");
			let rad3 = document.getElementById("rad3");
			let fr = document.getElementById("user");
			rad2.removeAttribute("checked");
			rad3.removeAttribute("checked");
			rad1.setAttribute("checked", "checked");
			fr.removeAttribute("src");
			fr.setAttribute("src", "scissor.html");
		}
		
		function button2_click() {
			let rad1 = document.getElementById("rad1");
			let rad2 = document.getElementById("rad2");
			let rad3 = document.getElementById("rad3");
			let fr = document.getElementById("user");
			rad1.removeAttribute("checked");
			rad3.removeAttribute("checked");
			rad2.setAttribute("checked", "checked");
			fr.removeAttribute("src");
			fr.setAttribute("src", "rock.html");
		}
		
		function button3_click() {
			let rad1 = document.getElementById("rad1");
			let rad2 = document.getElementById("rad2");
			let rad3 = document.getElementById("rad3");
			let fr = document.getElementById("user");
			rad1.removeAttribute("checked");
			rad2.removeAttribute("checked");
			rad3.setAttribute("checked", "checked");
			fr.removeAttribute("src");
			fr.setAttribute("src", "paper.html");
		}
	</script>
</head>
<body>
	<%@ include file="leftframe.jsp" %>
	<div align="center" id="divbox">
		<form action="RSPResult" method="post">
			<table>
				<tr>
					<td>
						<iframe src="user.html" width="250px" height="250px" id="user" name="user"></iframe>
						<div>
							<input type="radio" class="btn btn-primary" name="userInput" value="scissor" id="rad1"></input>
							<button type="button" id="button1" onclick="button1_click();" class="btn btn-primary">가위</button>
							<input type="radio" class="btn btn-primary" name="userInput" value="rock" id="rad2" ></input>
							<button type="button" id="button2" onclick="button2_click();" class="btn btn-primary">바위</button>
							<input type="radio" class="btn btn-primary" name="userInput" value="paper" id="rad3" ></input>
							<button type="button" id="button3" onclick="button3_click();" class="btn btn-primary">&nbsp;&nbsp;보&nbsp;&nbsp;</button>
						</div>
					</td>
					<td>
						<img alt="" src="rsp_img/라이언.jpg" width="250px", height="250px">
						<br><button type="submit" class="btn btn-primary" value="user" >결과는?</button>
					</td>
					<td>
						<img alt="" src="rsp_img/question-mark.png" width="250px", height="250px">
						<div>
							<button type="button" class="btn btn-primary">cpu</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</form>
</body>
</html>