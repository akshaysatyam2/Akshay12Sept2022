<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	margin: 0;
	background-image: url("bg4.avif");
	font-family: 'Times New Roman', Times, serif;
}

.center {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
}

.topnav {
  overflow: hidden;
  background-color: gray;
}

.topnav a {
  float: left;
  display: block;
  color: whitesmoke;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: whitesmoke;
  color: black;
}

.topnav a.active {
  background-color: white;
  color: grey;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

footer {
	position: relative;
	background-color: darkgray;
	width: 100%;
	color: black;
	height: 120px;
	bottom: 0px;
	z-index: 2;
}

footer h2 {
	position: absolute;
	text-align: right;
	left: 70%;
	bottom: 5px;
	padding-right: 3px;
}

table, tr, td {
	font-size: 20px;
	margin: 5px;
	padding: 5px;
	background-color: whitesmoke;
}
#addNotice{
	border: 3px solid black;
	border-radius: 15px;
	background-color: azure;
	padding: 5px;
	font-size: 20px;
}

</style>
</head>
<body>

	<div class="topnav" id="myTopnav">
		<a class="active">Employee Home</a> 
		<a href="showStudent.jsp">Show Students</a>
		<a href="addStudent.jsp">Add Student</a>
		<a href="addCourse.jsp">Add Course</a> 
		<a href="home.jsp">Logout</a>
		<a href="javascript:void(0);" class="icon" onclick="myResponsiveFunction()">
    <i class="fa fa-bars"></i>
  </a>
	</div>



	<h1>
		<center>
			<u>Queries</u>
		</center>
	</h1>
	<div>
		<table border="2px solid black" class="center">
			<tr>
				<td>Serial Number</td>
				<td>Name</td>
				<td>Phone</td>
				<td>Email</td>
				<td>Questions</td>
			</tr>
			<%
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/Akshay12Sept2022", "admin",
							"admin");
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("select * from contact ORDER BY (count)Desc");
					while (rs.next() == true) {
			%>

			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
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
	<hr>

	<div id="addNotice">
		<form action="addNoticeJDBC.jsp">
			<h2 >Enter the message for Notice</h2>
			<textarea rows="8" cols="60" name="notice"></textarea>
			<button type="submit">Post</button>
		</form>
	</div>

	<br>
	<br>
	<footer>
		<h2>
			&copy; Copyright Rights<br> Author: Akshay Kumar<br>Email
			ID: <a href="akshay.k@quadwave.com" target="_blank">akshay.k@quadwave.com</a>
		</h2>

	</footer>

	<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

</body>

</html>