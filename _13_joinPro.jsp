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
		String pwch = request.getParameter("pwch");
		String name = request.getParameter("name");
		String gen = request.getParameter("gen");
		int age = Integer.parseInt(request.getParameter("age"));
		boolean check = true;
		boolean check2 = false;
		boolean check3 = false;
		
		if(id.compareTo("")!=0){
			try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			String s = " select * from member where mem_id=? ";
			pstmt = conn.prepareStatement(s);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = false;
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
		
		if(pw.equals(pwch)){
			check2 = true;
		}
		
		
		
		if(check==true && check2==true){
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				String s = " insert into member values (?, ?, ?, ?, ?) ";
				pstmt = conn.prepareStatement(s);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, gen);
				pstmt.setInt(5, age);
				int re = pstmt.executeUpdate();
				if(re==1){
					check3 = true;
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
			response.sendRedirect("_01_login.jsp");
		}else if(check==false){
			response.sendRedirect("_11_join.jsp?error=true");
		}else if(check2==false){
			response.sendRedirect("_11_join.jsp?error2=true");
		}
		}else{
			response.sendRedirect("_11_join.jsp?error3=true");
		}
		
	%>
</body>
</html>