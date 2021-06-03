<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Jędrek
  Date: 12.05.2021
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Witamy!</title>
</head>
<style type="text/css">
    body {
        background-color: antiquewhite;
    }
</style>
<body>
<%
    HttpSession sess = request.getSession(false);
    if (sess.getAttribute("user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<h1>Witamy na stronie!</h1>
<p>Zalogowany uzytkownik: <b>${user}</b></p>
<br><br>
<%
    ResultSet rs = null;
    try {
        rs = DatabaseConnection.getData("SELECT * FROM users");
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
%>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <%while(rs.next())
    {
    %>
    <tr>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("username") %></td>
    </tr>
    <%}%>
    </tbody>
</table>
<a href="Logout">Wyloguj</a>

</body>
</html>
