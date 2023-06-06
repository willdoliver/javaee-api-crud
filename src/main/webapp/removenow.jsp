<%@page import="com.crudjspjava.dao.UserDAO" %>
<jsp:useBean id="u" class="com.crudjspjava.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	String id = request.getParameter("id");
	UserDAO.removeUserById(Integer.parseInt(id));
	response.sendRedirect("viewusers.jsp");
%>