<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Remove User</title>
	</head>
	<body>
		<%@ page import="com.crudjspjava.bean.User, com.crudjspjava.dao.UserDAO" %>
		<%
			String id = request.getParameter("id");
			User user = UserDAO.getUser(Integer.parseInt(id));
		%>
		
		<h1>Are you sure?? Want to remove user:</h1>
		
		<form action="removeuser.jsp" method="post">
			<input type="hidden" name="id" value="<%= user.getId() %>" />
			<table>
				<tr>
					<td>Name: </td>
					<td><input type="text" name="name" value="<%= user.getName() %>" /> </td>
				</tr>
				<tr>
					<td>Password: </td>
					<td><input type="password" name="password" value="<%= user.getPassword() %>" /> </td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email" value=<%= user.getEmail() %> /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>
						<input type="radio" name="gender" value="Masculine" 
							<% if(user.getGender() == "Masculine") {
								%> checked <%
							}%>
						/>Masculine
						<input type="radio" name="gender" value="Feminine"
							<% if(user.getGender() == "Feminine") {
								%> checked <%
							} %>
						/>Feminine
					</td>
				</tr>
				<tr>
					<td>Country</td>
					<td>
						<select name="country">
							<option>Brazil</option>
							<option>EUA</option>
							<option>Argentina</option>
							<option>Mexico</option>
							<option>Chile</option>
							<option>Canada</option>
							<option>Other</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="Yes, Delete User"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>