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
		<%	DTO king = (DTO)request.getAttribute("king");
%>
		<tr>
			<td>부서명</td>
			<td>직급</td>
			<td>이름</td>
			<td>총 계약금액</td>
		</tr>
		<tr>
			<td><%=king.getBname() %></td>
			<td><%=king.getSrank() %></td>
			<td><%=king.getBname() %></td>
			<td><%=king.getIamount() %></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td colspan=4><h3>개인별 계약 조회 결과</h3></td>
		</tr>
		<tr>
			<td>증권번호</td>
			<td>가입자명</td>
			<td>계약금액</td>
			<td>계약일자</td>
		<tr>
			<%		
		List<DTO> list = (List)request.getAttribute("list2");
			
			for(int i = 0; i<list.size();i++){
				DTO user= list.get(i);
%>
		
		<tr>

			<td><%= user.getIno() %></td>

			<td><%=user.getIname() %></td>

			<td><%=user.getIamount() %></td>

			<td><%=user.getIdate() %></td>
		</tr>

		<%		
					}
			
%>

	</table>
</body>
</html>