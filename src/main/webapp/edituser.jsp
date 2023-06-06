<%@page import="com.crudjspjava.dao.UserDAO" %>
<jsp:useBean id="u" class="com.crudjspjava.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	int i = UserDAO.updateUser(u);
	response.sendRedirect("viewusers.jsp");
%>
