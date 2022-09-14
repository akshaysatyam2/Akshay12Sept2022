<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students</title>
<style>
	body{
		padding: 0%;
		margin: 10px;
		background-image: url("bg4.avif");
	}
	.mainBody{
		background-color: azure;
	}
	table, tr, td{
	padding:5px;
	}
</style>
</head>
<body>
<div class="mainBody">

	<h1><center><u>Student Details:-</u></center></h1>
	<table border="3px solid black">
	<tr>
		
		<td>sFirstName</td>
		<td>sLastName</td>
		<td>sPhoneNumber</td>
		<td>sEmailAddress</td>
		<td>sDOB</td>
		<td>sGender</td>
		<td>sFatherName</td>
		<td>courseName</td>
	</tr>
		<%
		String command="SELECT sFirstName, sLastName, sPhoneNumber, sEmailAddress, sDOB, sGender, sFatherName, courseName FROM sDetails INNER JOIN sCourseTaken ON sDetails.user = sCourseTaken.user";
		String suser=(String)session.getAttribute("suser"); 
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin", "admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery(command);
					while (rs.next() == true) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				
			</tr>

			<%
				}
			%>
		</table>
		<%
			} catch (Exception e) {
				System.out.println(e);
			}
		%>

</div>


</body>
</html>