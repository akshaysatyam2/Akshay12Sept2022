<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%
int count=0;
String suser=(String)session.getAttribute("suser");
String sFatherName = request.getParameter("sFatherName");
String courseName = request.getParameter("courseName");
try
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022","admin","admin");
        PreparedStatement ps = cn.prepareStatement("insert into sCourseTaken values(?,?,?)");
        ps.setString(1, suser);
        ps.setString(2, sFatherName);
        ps.setString(3, courseName);
        ps.executeUpdate();
        count=1;
    }
    catch(Exception e)
    {
    	System.out.println(e);
    }
if (count==1){
	%>
	<jsp:include page="studentHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Course Selected...........");
    </script>
    <%
}
else{
	%>
	<jsp:include page="studentHome.jsp"></jsp:include>
    <script type="text/javascript">
    alert("Course Not Selected, try again...........");
    </script>
    <%
}
%>

</body>
</html>