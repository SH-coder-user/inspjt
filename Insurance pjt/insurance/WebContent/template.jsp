<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String name =(String)session.getAttribute("name");  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

a:link {
	text-decoration: none;
}

.container {
	display: flex;
	flex-direction: column;
	height: 100%;
}

header {
	padding: 20px;
	text-align: center;
}

nav {
	width: 100%;
	background-color: black;
}

li {
	display: inline-block;
	height: 50px;
}

li a {
	display: inline-block;
	width: 150px;
	color: white;
}

section {
	width: 100%;
	height: 700px;
}

footer {
	width: 100%;
	height: 50px;
	background: black;
	color: white;
}

footer h3 {
	text-align: center;
	line-height: 50px;
}
</style>
</head>
<body class="container">
	<header>
	<h1>(과정평가형 정보처리산업기사)보험 관리 프로그램 ver2019-12</h1>
	</header>
	<nav>
	<ol>

		<%if(name==null){ %>
		<li><a href="gologin">로그인</a></li>
		<li><a href="#">계약정보 입력</a></li>
		<li><a href="#">전체조회</a></li>
		<li><a href="goviewone">개인별 조회</a></li>
		<li><a href="#">보험왕 조회</a></li>
		<% } else{	%>
		<li><a href="gologout">로그아웃</a></li>
		<li><a href="goinsert">계약정보 입력</a></li>
		<li><a href="goviewall">전체조회</a></li>
		<li><a href="goviewone">개인별 조회</a></li>
		<li><a href="gokingview">보험왕 조회</a></li>

		<%} %>
	</ol>
	</nav>
	<section> <jsp:include page='${target }.jsp' /> </section>
	<footer>
	<h3>HRDKOREA Copyright@2019 Service of Korea</h3>
	</footer>
</body>
</html>