<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>회원가입</title>
<script>
	
	// 인증번호 메일 전송 메서드(ajax)
	function sendMail(){
	    var email = document.getElementById("email").value;		// 입력한 이메일 문자열을 가져옵니다.
		
	    $.ajax({
			type: "post",
			async: false,
			url: "/member/sendMail",
			datatype: "text",
			data: {email: email},
			success: function(data, textStatus) {
				
			}
		})
	    
	}
	
</script>
</head>
<body>
	
	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp" %>
	
	<h1>회원가입</h1>
	<form action="/member/signUp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		비밀번호 재입력 : <input type="password" name="rePwd"><br>
		이름 : <input type="text" name="name"><br>
		핸드폰번호 : <input type="tel" name="phone"><br>
		이메일 : <input type="text" name="email" id="email"> <button type="button" onclick="sendMail();">인증번호 전송</button><br>
		전공 : 
		<select name="major">
			<option value="스마트웹">스마트웹</option>	
			<option value="빅데이터">빅데이터</option>	
		</select>
		<input type="submit" value="가입">
	</form>
	
</body>
</html>