<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String log = "";
		boolean check = false;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select mem_name from member where mem_id=? and mem_pw=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()){
				log = rs.getString(1);
				check = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){
				conn.close();			
			}
			if(pstmt != null){
				pstmt.close();	
			}
			if(rs != null){
				rs.close();
			}
		}
		
		if(check){
			session.setAttribute("log", log);
			response.sendRedirect("_00_main.jsp");
		}else{
			response.sendRedirect("_01_login.jsp?error=true");
		}
	%>
</body>
</html>