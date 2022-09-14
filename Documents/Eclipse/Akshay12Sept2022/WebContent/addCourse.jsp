<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Course</title>
<style>
body {
	display: block;
	margin-left: 30%;
	margin-top: 10%;
	background-image:url("bg4.avif");
}

form {
	height: 200px;
	width: 380px;
	padding:15px;
	background-color: bisque;
	border: 2px solid black;
	border-radius:10px;
}
button{
hight:20px;
width:100px;
font-size:15px;
border-radius:10px;
}
.whitesmokeBG{
background-color: whitesmoke;

}
</style>

</head>
<body>

<form action="addCourseJDBC.jsp">
		<h1 background-color="gray">
			<center><u>Add Student</u></center>
		</h1>
		<table>
			<tr>
				<td>Course:</td>
				<td><input type="text" name="course"></td>
			</tr>
			<tr>
				<td>Course Price:</td>
				<td><input type="text" name="coursePrice"></td>
			</tr>
			<tr>
				<td>Course Duration:</td>
				<td><input type="text" name="courseDuration"></td>
			</tr>
			
			<tr>
				<td><button type="reset">Reset</button></td>
				<td><button type="submit">Add Course</button></td>
			</tr>
		</table>
	</form>
	<h1>
		
			<u>Currently Avilable Courses and its details</u>
		
	</h1>
	<div>
		<table border="2px solid black" class="center whitesmokeBG">
			<tr >
				<td>Course ID</td>
				<td>Course Name</td>
				<td>Course Price</td>
				<td>Course Duration</td>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
							"admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from sAcademicCourse");
					while (rs.next() == true) {
			%>

			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="deleteCourse.jsp?id=<%=rs.getString(1) %> "><button type="button"  class="delete">Delete</button></a>
					<a href="updateCourse.jsp?id=<%=rs.getString(1) %>"><button type="button"  class="update">Update</button></a>
				</td>
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