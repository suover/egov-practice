<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>
<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>
</head>
<style>
body {
	font-size: 9pt;
}
button {
	font-size: 9pt;
}

table {
	width: 600px;
	border-collapse: collapse;
}
th, td {
	border: 1px solid #cccccc;
	padding: 3px;
}
.input1 {
	width:98%;
}
.textarea {
	width:98%;
	height:70px;
}
</style>

<script>

$(function(){
	$("#title").val("제목입력");
});

function fn_submit() {
	
	if ($.trim($("#title").val()) == "") {
	    alert("제목을 입력해주세요.");
	    $("#title").focus();
	    return false;
	}
	$("#title").val($.trim($("#title").val()));
	
	if ($.trim($("#pass").val()) == "") {
	    alert("암호를 입력해주세요.");
	    $("#pass").focus();
	    return false;
	}
	$("#pass").val($.trim($("#pass").val()));
	
	var formData=$("#frm").serialize();
	
	$.ajax({
		type: "POST",
		data: formData,
		url: "boardWriteSave.do",
		dataType: "text",
		success: function(data) {
			if (data == "ok") {
				alert("저장완료");
				location= "boardList.do";
			} else {
				alert("저장실패");
			}
		},
		error: function() {
			alert("오류발생");
		}
	});
	
}

</script>

<body>
<form id="frm">
<table>
	<caption>게시판 등록</caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content" class="textarea"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit(); return false;">저장</button>
			<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>