<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "task_manager";
String userId = "root";
String password = "Password123!";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center">
	<font color="#FF00FF"><strong>Select query in JSP</strong></font>
</h2>
<table align="center" cellpadding="4" cellspacing="4">
	<tr>

	</tr>
	<tr bgcolor="#008000">
		<td><b>Id</b></td>
		<td><b>Name</b></td>
		<td><b>Date</b></td>
		<td><b>t_To</b></td>
		<td><b>t_from</b></td>
		<td><b>Details</b></td>
	</tr>
	<%
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM task";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
%>
	<tr bgcolor="#8FBC8F">

		<td><%=resultSet.getInt("task_id")%></td>
		<td><%=resultSet.getString("task_name")%></td>
		<td><%=resultSet.getDate("date")%></td>
		<td><%=resultSet.getTime("t_to")%></td>
		<td><%=resultSet.getTime("t_from")%></td>
		<td><%=resultSet.getString("details")%></td>
	</tr>

	<%
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>