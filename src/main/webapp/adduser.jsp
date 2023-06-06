<%@page import="com.crudjspjava.dao.UserDAO" %>
<jsp:useBean id="u" class="com.crudjspjava.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	int i = UserDAO.addUser(u);
	
	if (i > 0) {
		response.sendRedirect("adduser-success.jsp");
	} else {
		response.sendRedirect("adduser-error.jsp");
	}
%>