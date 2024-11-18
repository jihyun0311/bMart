<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		box-sizing: border-box;
		margin:0;
		padding:0;
	}
	a{
		text-decoration: none;
		background-color: transparent;
	}
	#loginBtn{
		color: rgb(255, 255, 255);
    	background-color: rgb(26, 124, 255);
    	font-weight: bold;
    	font-size: 18px;
   		line-height: 24px;
    	border-radius: 4px;
    	margin: 32px 0px 0px;
    	width: 100%;
    	justify-content: center;
   	 	align-items: center;
   	 	text-align: center;
    	padding: 15px 32px 16px;
    	border: none;
    	transition: background-color 0.07s ease;
	}
	#loginBtn:hover{
		background-color: rgb(0, 98, 231);
		cursor: pointer;
	}
	#img01{
		margin-top:20px;
		opacity: 0.7;
		border-radius:5px;
	}
	
	.error-message {
        color: red; /* 빨간 글자 색상 */
        background-color: rgb(254, 245, 245); /* 반투명 빨간 배경 */
        padding: 11px 12px 13px;
        border-radius: 4px;
        margin: 13px 0;
        font-size: 11px;
    }
</style>
</head>
<body>
<div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
	<div style="justify-content:center; display:flex; align-items:center; margin:0 auto; font-size:16px; padding:0 24px;">
		<div style="margin:auto 0px; padding:24px 0;">
		
			<div style="text-align:center; margin-bottom: 40px">
				<h5 style="font-weight:700; font-size:16px; line-height:24px; letter-spacing: -0.4px;">배달의민족</h5>
				<h2 style="font-weight:500; font-size:32px; line-height:48px; letter-spacing: -1.2px;">통합로그인</h2>
			</div>
        
			<form action="_03_loginPro.jsp" method="post">
				<table>
					<tr height="50px" align="center">
						<td width="350px" colspan="2">
						<input type="text" name="id" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline:none;" placeholder="아이디"></td>
					</tr>
					<tr height="50px" align="center">
						<td width="350px" colspan="2">
							<input type="password" name="pw" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline: none; margin-top:10px;" placeholder="비밀번호"></td>
					</tr>
					
					<% if (request.getParameter("error") != null) { %>
            			<tr height="45px">
            				<td width="350px" colspan="2"><div class="error-message">아이디 또는 비밀번호가 일치하지 않습니다.</div></td>
       				<% } %>
        
					<tr height="40px" align="center">
						<td align="left" width="130px"><label style="cursor: pointer;"><input type="checkbox" style="transform: scale(1.3); margin-right: 5px;"> 아이디 저장</label></td>
						<td align="right" width="180px"><a href="#" style="color: rgb(142, 146, 159); font-weight: 500; font-size: 11px; line-height: 20px;">아이디 · 비밀번호 찾기</a>
						<a href="_11_join.jsp"  style="color: rgb(142, 146, 159); font-weight: 500;  margin-left: 12px; font-size: 11px; line-height: 20px;">회원가입</a>
					</tr>
					<tr height="55px">
						<td width="350px" colspan="2"><input type="submit" value="로그인" id="loginBtn"></td>
					</tr>
					
					<tr height="70px">
						<td width="350px" colspan="2"><img src="img/1.jpg" width="350px" id="img01" alt="b마트홍보"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>