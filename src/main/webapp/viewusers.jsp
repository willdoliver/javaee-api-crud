
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>View of Users</title>
	</head>
	<body>
		<%@ page import="com.crudjspjava.dao.UserDAO, com.crudjspjava.bean.*, java.util.*" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		<h1>Showing Users</h1>
		
		<%
		String pageId = request.getParameter("page");
		
		// ToDo
		// Dinamic pagination

		int ini = 0;
		int total = 3;

		if (pageId != null) {
			ini = Integer.parseInt(pageId);
			
			if (ini > 1) {
				ini = (ini - 1) * total + 1;
			} else {
				ini = ini - 1;
			}
		}
		
		// List<User> list = UserDAO.getAllUsers();
		List<User> list = UserDAO.getUserPaginated(ini, total);
		request.setAttribute("list", list);
		%>
		
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Country</th>
				<th>Edit</th>
				<th>Remove</th>
				<th>Remove Now</th>
			</tr>
			<c:forEach items="${list}" var="userList">
				<tr>
					<td>${userList.getId()}</td>
					<td>${userList.getName()}</td>
					<td>${userList.getEmail()}</td>
					<td>${userList.getGender()}</td>
					<td>${userList.getCountry()}</td>
					<td><a href="editform.jsp?id=${userList.getId()}">Edit</a></td>
					<td><a href="removeform.jsp?id=${userList.getId()}">Remove</a></td>
					<td><a href="removenow.jsp?id=${userList.getId()}">Remove Now</a></td>
				</tr>
			</c:forEach>
		</table>
		<br>
			<a href="viewusers.jsp?page=1">1</a>
			<a href="viewusers.jsp?page=2">2</a>
			<a href="viewusers.jsp?page=3">3</a>
		
		<br>
		<a href="adduserform.jsp">Add New User</a>
	</body>
</html>