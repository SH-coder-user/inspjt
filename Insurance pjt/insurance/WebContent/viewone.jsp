<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, insurance.DTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan=4><h3>개인별 계약 조회 결과</h3></td>
		</tr>
		<tr>
			<td>증권번호</td>
			<td>계약금액</td>
			<td>계약직원이름</td>
			<td>계약일자</td>
		<tr>
			<%		List<DTO> list = (List)request.getAttribute("list");
			if(list!=null){
			for(int i = 0; i<list.size();i++){
				DTO user= list.get(i);
%>
		
		<tr>

			<td><%= user.getIno() %></td>

			<td><%=user.getIamount() %></td>

			<td><%=user.getSname() %></td>

			<td><%=user.getIdate() %></td>
		</tr>

		<%			}
			}else{
%>
		<script>
		alert("계약 내용이 존재하지 않습니다.");
		history.go(-1);
	</script>

		<%			} 
%>
	</table>
</body>
</html>