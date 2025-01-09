<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#birth" ).datepicker({
    changeMonth: true,
    changeYear: true
  });
  
  $("#btn_zipcode").click(function(){
	 
	  var w = 500;
	  var h = 100;
	  var url = "post1.do";
	  
	  window.open(url, 'zipcode', 'width=' + w + ', height=' + h);
	  
  });
  
  $("#btn_idcheck").click(function(){
	  var userId = $.trim($("#userId").val());
	  if (userId == "") {
		  alert("아이디를 입력해주세요.")
		  $("#userId").focus();
		  return false;
	  }
	  
	  $.ajax({
		type: "POST",
		data: "userId="+userId,
		url: "idcheck.do",
		dataType: "text",
		success: function(result) {
			if (result == "ok") {
				alert("사용 가능한 아이디입니다.");
			} else {
				alert("이미 사용중인 아이디입니다.");
			}
		},
		error: function() {
			alert("오류발생");
		}
	  });
	  
  });
  
  $("#btn_submit").click(function(){
	  
	 var userId = $("#userId").val();
	 var pass = $("#pass").val();
	 var name = $("#name").val();
	 
	 userId = $.trim(userId);
	 pass = $.trim(pass);
	 name = $.trim(name);
	 
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
	 if (name == "") {
		 alert("이름을 입력해주세요.");
		 $("#name").focus();
		 return false;
	 }
	 
	 $("#userId").val(userId);
	 $("#pass").val(pass);
	 $("#name").val(name);
	 
	 var formData = $("#frm").serialize();
	 
	 $.ajax({
			type: "POST",
			data: formData,
			url: "memberWriteSave.do",
			dataType: "text",
			success: function(result) {
				if (result == "ok") {
					alert("가입완료");
					location= "loginWrite.do";
				} else {
					alert("가입실패");
				}
			},
			error: function() {
				alert("오류발생");
			}
		});
	 
  });
  
  
} );
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

<table>
	<tr>
		<th width="25%">홈</th>
		<th width="25%"><a href="/myproject_new/boardList.do">게시판</a></th>
		<th width="25%"><a href="/myproject_new/memberWrite.do">회원가입</a></th>
		<th width="25%"><a href="/myproject_new/loginWrite.do">로그인</a></th>
	</tr>
</table>

<form name="frm" id="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="userId">아이디</label></th>
		<td>
			<input type="text" name="userId" id="userId" placeholder="아이디입력">
			<button type="button" id="btn_idcheck">중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td>
			<input type="password" name="pass" id="pass">
		</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>
			<input type="text" name="name" id="name">
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="gender" id="gender_m" value="M">남
			<input type="radio" name="gender" id="gender_f" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
			<input type="text" name="birth" id="birth">
		</td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
			<input type="text" name="phone" id="phone"> (예:010-1234-1234)
		</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>
			<input type="text" name="zipcode" id="zipcode">
			<button type="button" id="btn_zipcode">우편번호찾기</button>
			<br>
			<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>