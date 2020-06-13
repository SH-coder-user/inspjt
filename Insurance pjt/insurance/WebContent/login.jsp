<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, insurance.DTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%		String rs = (String)request.getAttribute("result");
	
		if(rs!=null){
			if(rs.equals("true")){
%>
<script>
					alert('로그인이 완료되었습니다.')
					location.href("gomain");
				</script>

<%				} else if(rs.equals("false")){%>
<script>
					alert('로그인정보오류');
					history.go(-1);
				</script>

<%				}
		}else{
		response.sendRedirect("index.jsp");
		}
%>
</head>
<body>
	<h1>로그인</h1>

	<form action="login" method=post>
		<table>
			<tr>
				<td>직원번호</td>
				<td><input type=text name=sno></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name=spass></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type=submit value="로그인"></td>
			</tr>
		</table>
	</form>
</body>
</html>