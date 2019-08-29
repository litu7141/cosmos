<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
  <head>
  <title>Company Information</title>
  </head>
  <body>
  <%!
     String stuid,stuname,email,class,enroll,city,country;
	 Connection conn;
	 Statement stmtsave;
 public void doConnect(){
 try{
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 }
 catch(ClassNotFoundException cnfe){
   System.out.println("Driver Load Error"+cnfe);
   }
  try{
  conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
  }
  catch(SQLException se){
   System.out.println("Connection Error"+se);
   }
   }
%>
  <%
     stuid=request.getParameter("txtstuid");
     stuname=request.getParameter("txtstuname");
	 email=request.getParameter("txtmail");
	 class=request.getParameter("txtclass");
	 enroll=request.getParameter("txtyear");
	 city=request.getParameter("txtcity");
	 country=request.getParameter("txtcountry");
	 doConnect();
	 try{
	     stmtsave=conn.createStatement();
		 tmtsave.executeUpdate("insert into tblstudent values('"+stuid+"','"+stunamename+"','"+email+"','"+class+"','"+enroll+"')");
		out.println("<script type='text/javaScript'>");
		out.println("alert('Data Saved Successfully')");
		out.println("setTimeout(function(){window.location.href='STUDENT.html'},500);");
		out.println("</script>");
		 }
		 catch(SQLException se){
		  out.println("Your Registration Fails...Try Again Later.."+se);
		  }
		  %>
		  </body>
		  </html>
