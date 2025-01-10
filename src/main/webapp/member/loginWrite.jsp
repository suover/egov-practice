<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>

<script>
	
$(function(){
	$("#btn_submit").click(function(){
		var userId = $.trim($("#userId").val());
		var pass = $.trim($("#pass").val());
		
		if (userId == "") {
			alert("아이디를 입력해주세요.");
			$("#userId").focus();
			return false;
		}
		
		if (pass == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		
		$.ajax({
			type: "POST",
			data: "userId="+userId+"&pass="+pass,
			url: "loginWriteSub.do",
			dataType: "text",
			success: function(result) {
				if (result == "ok") {
					alert(userId + "님 로그인 되었습니다.");
					location="boardList.do";
				} else {
					alert("로그인 정보를 다시 확인해주세요.");
				}
			},
			error: function() {
				alert("오류발생");
			}
		});
	});
});
	
</script>

</head>
<style>
body {
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}
a {
	text-decoration:none;
}
table {
	width:600px;
	border-collapse:collapse;
}
th, td {
	border:1px solid #cccccc;
	padding:3px;
	line-height:2;
}
.div_button {
	width:600px;
	text-align:center;
	margin-top:5px;
}
caption {
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom:5px;
}
</style>
<body>

<%@ include file="../include/topmenu.jsp" %>

<form name="frm" id="frm">
<table>
	<caption>로그인</caption>
	<tr>
		<th><label for="userId">아이디</label></th>
		<td>
			<input type="text" name="userId" id="userId" placeholder="아이디입력">
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
			<input type="password" name="pass" id="pass">
		</td>
	</tr>
	</table>
	<div class="div_button">
	<button type="button" id="btn_submit">로그인</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>