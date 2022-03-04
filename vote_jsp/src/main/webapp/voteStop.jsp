<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 마감</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
	
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs=null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://18.205.188.103:3306/test?&useSSL=false";
			con = DriverManager.getConnection(url, "lion", "1234");
			String sql = "update manager set flag=0 where id='admin'";

			pstmt = con.prepareStatement(sql);

			pstmt.execute();
	        
			out.println("<h1>투표마감 성공 하였습니다. 감사합니다</h1>");
		}catch(ClassNotFoundException ce){
			System.out.println(ce.getMessage());
			out.println("<h1>투표마감에 실패 하였습니다</h1>");
		}catch(SQLException se){
			System.out.println(se.getMessage());
			out.println("<h1>투표마감에 실패 하였습니다</h1>");
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(SQLException se){
				System.out.println(se.getMessage());
			}
		}
	%>
</body>
</html>