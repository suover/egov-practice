<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 400px;
	border-collapse: collapse; /* cell 간격 없음 */
}

th, td {
	border: 1px solid #cccccc;
	padding: 5px;
}
</style>

<script>
function fn_submit() {
	
	if(document.frm.name.value == "") {
		alert("코드명을 입력해주세요.");
		document.frm.name.focus();
		return false;
	}
	document.frm.submit();
}
</script>

<body>

<form name="frm" method="post" action="codeModifySave.do">
<input type="hidden" name="code" value="${vo.code}">
	<table>
		<tr>
			<th>분류</th>
			<td>
				<select name="gid">
					<option value="1" <c:if test="${vo.gid == '1'}"> selected </c:if> >Job(업무)</option>
					<option value="2" <c:if test="${vo.gid == '2'}"> selected </c:if> >Hobby(취미)</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>코드명</th>
			<td><input type="text" name="name" value="${vo.name}"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit" onclick="fn_submit(); return false;">저장</button>
				<button type="button" onclick="location='codeList.do'">취소</button>
			</th>
		</tr>
	</table>
</form>

</body>
</html>