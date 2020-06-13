<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
		function chk(){
			alert("넘어옴");			
			if(!cha.ino.value){
				alert('증권번호 입력해주세요');
				ino.value.focus();
				return false;
			}
			return true;
		}
	</script>

<%		String r = (String)request.getAttribute("result");
 		System.out.print("넘어온 값 = "+r);
			if(r!=null){
				if(r.equals("true")) {
%>
<script type="text/javascript">
						alert("성공적으로 저장되었습니다.");
						location.href("index.jsp");
					</script>

<%				 }else if(r.equals("false")){
%>

<script type="text/javascript">
						alert("저장에 실패하였습니다.");
						location.href("index.jsp");
					</script>

<%	
				}
				
			}else{
				
				response.sendRedirect("gomain");
}
%>

</head>
<body>
	<form action="insert" name="cha" onsubmit="return chk()">
		<table>
			<tr>
				<td colspan=2 align=center>
					<h2>계약정보입력</h2>
				<td>
			</tr>
			<tr>
				<td>증권번호
				<td>
				<td><input type=text maxlength=5 name="ino"></td>
			</tr>
			<tr>
				<td>가입자명
				<td>
				<td><input type=text name=iname></td>
			</tr>
			<tr>
				<td>계약금액
				<td>
				<td><input type=text name=iamount></td>
			</tr>
			<tr>
				<td>직원번호
				<td>
				<td><input type=text maxlength=4 name=sno></td>
			</tr>
			<tr>
				<td colspan=2 align=center><input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>