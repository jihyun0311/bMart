<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 .center-container {
        padding: 20px;
        margin: 0 auto;
    }

    table {
        width: 100%;
        border-collapse: separate;
    }

    td {
        padding: 10px;
        text-align: center;
    }
	sapn{
		font size=
	}

    button:hover {
        background-color: PINK;
    }

    button:active {
        background-color: skyblue;
    }
    button{
    padding:10px 20px;
   	border: none;
   	cursor: pointer;
    }
</style>
</head>
<body>
	<%--
       수강신청정답1을 완성하시오.
	 --%>
	 
	 <%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			

		int memberSize = 0; 
		String[][] memberList = new String[1000][5];
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				memberList[memberSize][0] = rs.getString(1);
				memberList[memberSize][1] = rs.getString(2);
				memberList[memberSize][2] = rs.getString(3);
				memberList[memberSize][3] = rs.getString(4);
				memberList[memberSize][4] = rs.getInt(5) + "";
				
				memberSize += 1;
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
			for(int i = 0; i < memberSize; i ++){
			//	System.out.println(Arrays.toString(memberList[i]));
			}
			
			
			int itemSize = 0; 
			String[][] itemList = new String[1000][7];
			
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_01_DBSAMPLE?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT * FROM ITEM";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int i = 0;
				while(rs.next()){
					itemList[i][0] = rs.getInt(1) + "";
					itemList[i][1] = rs.getString(2);
					itemList[i][2] = rs.getInt(3) + "";
					itemList[i][3] = rs.getString(4);
					itemList[i][4] = rs.getString(5);
					itemList[i][5] = rs.getInt(6) + "";
					itemList[i][6] = rs.getInt(7) + "";	
					i++;
				}
				itemSize = i;
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
			System.out.println(itemSize);
		%>
		<div align="center">
		<h2>배달의 민족</h2>
		<img alt="배달의민족" src="이미지/B마트 사진4.png" style="width:300px">
		</div>
		<hr style="color:skybule">
		
       	 <table style="border-spacing:20px; background:otmeal;" >
           	 <% for (int i = 0; i < itemSize; i++) {
           			int a = Integer.parseInt(itemList[i][2]) - Integer.parseInt(itemList[i][2])*Integer.parseInt(itemList[i][5])/100;
      				if(i % 3 == 0){
      		 %>		
      				<tr style="height:250px">
      		<%} %>	
               			<td width="150px" align="center" style="padding:10px;">
   				           
   				            <% if (itemList[i][6] != null && !itemList[i][6].equals("0")) { %>
                         	<%--재고가 0이 아니면 사진출력 --%>  
                         	
                         	<img alt="사진" src="이미지/<%=itemList[i][3] %>" style="width:300px; border-radius:15px;" >
                         	<h2><%=itemList[i][4] %></h2>
                         	<%--정보--%>
                         	
                         	<br>
                        	<%if(itemList[i][5].equals("0")) { %>
                         	<font size="6"><%=itemList[i][2] %></font>
                         	<%--할인이 0 이면 그냥 가격 출력--%>
                         	
                  			<%}else{ %>
                  			<font size="6" style="text-decoration:line-through"><%=itemList[i][2] %></font>
                  			<font size="6"><span style="color: red;"><%=itemList[i][5] %>%</span></font>
                  			<br>
                  			<font size="6"><b><%=a %></b></font>
                  			<%--할인이 0이 아니면 가격에 선을 긋고 할인된 가격 출력 --%>	
                  			<%} %>
                  		<%} %> 
                  		<br>
                  		<button onclick="windwo.location.href='00_footer.jsp'">장바구니담기</button>
                  	</td>
                  		<%if(i % 3 == 2){ %>
                </tr>
                <%} %>
           		<%} %>
       	 </table>
   		 

		