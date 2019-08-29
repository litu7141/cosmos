<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%!
    Connection conn;
	Statement stmtFill,stmtShow;
	ResultSet rsFill,rsShow;
         String stuid,stuname[],email[],class[],enroll[],city[],country[];
		 int i;
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
      stuname=new String[20];
	  email=new String[20];
	  class=new String[20];
	  enroll=new String[20];
	  city=new String[20];
	  country=new String[20];
	 i=0;
	  try{
	 stmtShow=conn.createStatement();
	 rsShow=stmtShow.executeQuery("Select* from tblstudent");
	 while(rsShow.next()){
	   stuname[i]=rsShow.getString("stuname");
	   email[i]=rsShow.getString("email");
	   class[i]=rsShow.getString("class");
	   enroll[i]=rsShow.getString("enroll");
	   city[i]=rsShow.getString("city");
	   country[i]=rsShow.getString("country");
		i=i+1;
    }
 }
     catch(SQLException se){
	  System.out.println("Error");
	  }
  %>
<head>
<title>Company Information</title>
 <Script language="javascript">
 function Showstudentdata(){
   var jstuname=new Array();
   var jemail=new Array();
   var jclass=new Array();
   var jenroll=new Array();
   var jcity=new Array();
   var jcountry=new Array();
    
   var j,k;
   j=0;
   <%
   i=0;
   while(i<stuname.length){
 %>
     jstuname[j]="<%=stuname[i]%>";
	 jemail[j]="<%=email[i]%>";
	 jclass[j]="<%=class[i]%>";
	 jcity[j]="<%=city[i]%>";
	 jenroll[j]="<%=enroll[i]%>";
	 jcity[j]="<%=city[i]%>";
	 jcountry[j]="<%=country[i]%>";

  j=j+1;
	 <%
	    i=i+1;
	   }
	  %>
    k=document.f1.cmbstuid.selectedIndex;
    document.f1.txtstuname.value=jstuname[k-1];
    document.f1.txtmail.value=jemail[k-1];
    document.f1.txtclass.value=jclass[k-1];	
	document.f1.txtenroll.value=jenroll[k-1];
	document.f1.txtcity.value=jcity[k-1];
	document.f1.txtcountry.value=jcountry[k-1];
	}
	
	
 </script>

 <title>Student Information</title>
 </head>
 <body>
 <script language="javascript">
 function gologin(){
	window.location="USER_studentfc.jsp";
	}
	</script>
 
 
<body background="elogbg.jpg">
<center>
<table width="95%">
   <tr height="70" bgcolor="Black">
      <td align="center" valign="middle">
	     <font face="elephant"size="5" color="white">
		     Student Registration System
		 </font>
		 
	  </td>
   </tr>
</table>
<center>
 <font face="elephant" color="Blue" size="5">
 Student Information
 </font>
 </center>
<br>
<form name="f1" action="USER_students.jsp" method="get">
 <table width="800" border="0">
 <tr>
 <td align="left">Student ID :</td>
 <td>
 <Select name="cmbstuid" onChange="Showstudentdata()">
	<option value="">-select-</option>
	<%
	 doConnect();
	try{
	    stmtFill=conn.createStatement();
		rsFill=stmtFill.executeQuery("Select * from tblstudent");
		while(rsFill.next()){
		  cmpregd=rsFill.getString("stuid");
		  %>
		<option value="<%=stuid%>"><%=stuid%></option>
		<%
		  }
		  }
	catch(SQLException se){
	System.out.println("Error");
	}
	%>
 </tr>
<tr>
 <td align="left">Student Name :</td>
<td><input type="text" name="txtstuname" size="35" required>*</td>
</tr> 
<tr>
<td align="left">E-Mailid :</td>
<td><input type="email" name="txtmail" required>*</td>
</td>
</tr>
<tr>
<td align="left">Class:</td>
<td><input type="text" name="txtclass" size="35"></td>
</tr>
 <tr>
 <td align="left">Enrollment Year :</td>
 <td><input type="text" name="txtyear" size="35"></td>
 </tr>
<tr>
<td align="left">City :</td>
<td><input type="text" name="txtcity"></td>
</tr>
<tr>
<td align="left">Country :</td>
<td><input type="text" name="txtcountry" required>*</td>
</tr>
</table>
</table>
<br><br><br><br>
<center>
<input type="submit" name="btnsave" value="Submit">&nbsp;&nbsp;
<input type="button" name="btnclear" value="reset" onclick="gologin()">&nbsp;&nbsp;
</center>
</font>
</form>
<br>
<table width="95%">
   <tr height="60" bgcolor="Black">
      <td align="right" valign="middle">
	     <font face="elephant" size="4" color="White">
		   <marquee> &copy; Student Registration System</marquee>
		 </font>
		 
	  </td>
   </tr>
</table>
</center>
</body>
</html>

