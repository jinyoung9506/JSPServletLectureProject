<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Left</title>
	<style>
	  /* 사이드바 래퍼 스타일 */
	  * {margin: 0;}
	  #page-wrapper {
	    padding-left: 250px;
	  }
	  
	  #sidebar-wrapper {
	    position: fixed;
	    width: 250px;
	    height: 100%;
	    margin-left: -250px;
	    background: #000;
	    overflow-x: hidden;
	    overflow-y: auto;
	  }
	  
	  #page-content-wrapper {
	    width: 100%;
	    padding: 20px;
	  }
	  /* 사이드바 스타일 */
	  
	  .sidebar-nav {
	    width: 250px;
	    margin: 0;
	    padding: 0;
	    list-style: none;
	  }
	  
	  .sidebar-nav li {
	    text-indent: 1.5em;
	    line-height: 2.8em;
	  }
	  
	  .sidebar-nav li a {
	    display: block;
	    text-decoration: none;
	    color: #999;
	  }
	  
	  .sidebar-nav li a:hover {
	    color: #fff;
	    background: rgba(255, 255, 255, 0.2);
	  }
	  
	  .sidebar-nav > .sidebar-brand {
	    font-size: 1.3em;
	    line-height: 3em;
	  }
	  
	  .golf_fold {
	  	display: none;
	  }
	
	</style>
	<script type="text/javascript">
		function golf_click() {
			let fold = document.getElementsByClassName("golf_fold");
			if (fold.item(0).style.display == "none") {
				for (let i = 0; i < fold.length; i++) {
					fold.item(i).style.display = "block";
				}
			} else {
				for (let i = 0; i < fold.length; i++) {
					fold.item(i).style.display = "none";
				}
			}
		}
	</script>
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="Main.ctrl">Main</a>
      </li>
      <li><a href="RSP.ctrl">RSP</a></li>
      <li><a href="POLL.ctrl">POLL</a></li>
      <li><a href="#" onclick="golf_click();">GOLF</a></li>
      <ul>
      	<li class="golf_fold"><a href="GOLF1.ctrl">강사조회</a></li>
		<li class="golf_fold"><a href="GOLF2.ctrl">수강신청</a></li>
		<li class="golf_fold"><a href="GOLF3.ctrl">회원정보조회</a></li>
		<li class="golf_fold"><a href="GOLF4.ctrl">강사매출현황</a></li>
      </ul>
    </ul>
  </div>
 </div>
</body>
</html>