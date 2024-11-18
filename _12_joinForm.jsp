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
		font-size:14px;
	}
	a{
		text-decoration: none;
		background-color: transparent;
	}
	#joinBtn{
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
    	width:100%;
	}
	#joinBtn:hover{
		background-color: rgb(0, 98, 231);
		cursor: pointer;
	}
    .age-input {
        width: 100%;
        height: 40px;
        padding: 5px 12px;
        font-size: 16px;
        background: rgb(255, 255, 255);
        border: 1px solid rgb(215, 219, 230);
        border-radius: 4px;
        outline: none;
    }
   .radio-button-group {
        display: flex;
        gap: 10px;
    }
	.radio-button-group input[type="radio"] {
        display: none; 
    }
    .radio-button-group label {
    	display:inline-block;
    	width:150px;
        padding: 10px 20px;
        border: 1px solid rgb(215, 219, 230);
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
        color: #333;
        transition: background-color 0.2s ease, color 0.2s ease;
        text-align: center;
         margin-top:10px;
    }
    .radio-button-group input[type="radio"] + label {
        background-color: white;
    }
    .radio-button-group input[type="radio"]:checked + label {
        background-color: rgb(26, 124, 255);
        color: white;
        border-color: rgb(26, 124, 255);
        font-weight: bold;
    }
    .error-message {
        color: red; 
        background-color: rgb(254, 245, 245);
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
				<h4 style="font-weight:500; font-size:32px; line-height:48px; letter-spacing: -1.2px;">회원가입</h4>
			</div>
			
			<form action="_13_joinPro.jsp" method="post">
				<table>
					<tr height="50px" align="center">
						<td width="100px" align="center">아이디</td>
						<td width="300px"><input type="text" name="id" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline:none;" placeholder="아이디"></td>
    				</tr>
    				<% if (request.getParameter("error") != null) { %>
            			<tr height="45px">
            				<td width="350px" colspan="2"><div class="error-message">중복된 아이디입니다.</div></td>
            			</tr>
       				<% } %>
       				<% if (request.getParameter("error3") != null) { %>
            			<tr height="45px">
            				<td width="350px" colspan="2"><div class="error-message">아이디 입력.</div></td>
            			</tr>
       				<% } %>
    				<tr height="50px" align="center">
						<td width="100px" align="center">비밀번호</td>
						<td width="300px"><input type="password" name="pw" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline:none; margin-top:10px;" placeholder="비밀번호"></td>
    				</tr>
    				<tr height="50px" align="center">
						<td width="100px" align="center">비밀번호 확인</td>
						<td width="300px"><input type="password" name="pwch" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline:none; margin-top:10px;" placeholder="비밀번호 확인"></td>
    				</tr>
    				<% if (request.getParameter("error2") != null) { %>
            			<tr height="45px">
            				<td width="350px" colspan="2"><div class="error-message">비밀번호가 틀립니다.</div></td>
       				<% } %>
    				<tr height="50px" align="center">
						<td width="100px" align="center">이름</td>
						<td width="300px"><input type="text" name="name" style="width:100%; height:50px; padding: 11px 0px 13px 12px; font-size: 16px; background: rgb(255, 255, 255);
    border: 1px solid rgb(215, 219, 230); border-radius: 4px; outline:none; margin-top:10px;" placeholder="이름"></td>
    				</tr>
    				<tr height="50px" align="center">
						<td width="100px" align="center">성별</td>
						<td width="300px">
							<div class="radio-button-group"><input type="radio" id="male" name="gen" value="남"><label for="male">남자</label>
                        		<input type="radio" id="female" name="gen" value="여"><label for="female">여자</label>
                   			</div>
                   		</td>
    				</tr>
    				<tr height="50px" align="center">
						<td width="100px" align="center">나이</td>
						<td width="300px"><input type="number" class="age-input" name="age" min="1" max="100" style=" margin-top:10px;"></td>
    				</tr>
    				<tr height="55px">
						<td width="300px" colspan="2" align="right"><input type="submit" value="회원가입" id="joinBtn" style=" margin-top:30px;"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>