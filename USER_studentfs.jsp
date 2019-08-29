<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<html>
  <head>
    <title>Student Information </title>
  </head>
  <body>
     <%!
	    Connection conn;
		Statement stmtUpdate,stmtDelete; 
		String stuid,stuname,email,class,enroll,city,country;
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
	  doConnect();
	     stuid=request.getParameter("cmbstuid");
		stuname=request.getParameter("txtstunamename");
		 email=request.getParameter("txtmail");
		 class=request.getParameter("txtclass");
		 enroll=request.getParameter("txtenroll");
		 city=request.getParameter("txtcity");
		 country=request.getParameter("txtcountry");
		 btnupdate=request.getParameter("btnupdate");
		 btndelete=request.getParameter("btndelete");
		 if(btnupdate!=null){
		    try{
			   stmtUpdate=conn.createStatement();
			   stmtUpdate.executeUpdate("update tblstudent set stuname='"+stuname+"',email='"+email+"',class='"+class+"',enroll='"+enroll+"',city='"+city+"',country='"+country+"' where stuid='"+stuid+"'");
			   out.println("<script type='text/javaScript'>");
		out.println("alert('Your Data Updated Successfully')");
		out.println("setTimeout(function(){window.location.href='USER_studentfc.jsp'},500);");
		out.println("</script>");
			   }
			   catch(SQLException se){
			     System.out.println("unable to update"+se);
				 }
				}
				else if(btndelete!=null){
				 try{
				 stmtDelete=conn.createStatement();
				 stmtDelete.executeUpdate("Delete from tblstudent where stuid='"+stuid+"'");
				 out.println("<script type='text/javaScript'>");
		out.println("alert('Your Data Removed Successfully')");
		out.println("setTimeout(function(){window.location.href='USER_studentfc.jsp'},500);");
		out.println("</script>");
				 }
				 catch(SQLException se){
				   out.println("unable to delete");
				   }
				  }
				  %>
				  </body>
				  </html>
				  