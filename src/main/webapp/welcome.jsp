<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="authorization.User" %><%--
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
    String username = sess.getAttribute("user").toString();
    System.out.println(username);
    int id = User.getID(username);
    ResultSet rs = null;
    try {
        rs = DatabaseConnection.getData("SELECT * FROM books WHERE owner=" + id);
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    int role = User.getRole(username);
%>


<table>
    <thead>
    <tr>
<%--        <th>ID</th>--%>
        <th>Title</th>
        <th>Author</th>
        <th>Is read?</th>
    </tr>
    </thead>
    <tbody>
    <%while(rs.next())
    {
    %>
    <tr>
<%--        <td><%=rs.getString("id") %></td>--%>
        <td><%=rs.getString("title") %></td>
        <td><%=rs.getString("author") %></td>
        <td><%=rs.getString("readed") %></td>
    </tr>
    <%}%>
    </tbody>
</table>
<br><br><br>

<body>
<title>Dodawanie Książek</title>
<form action="add" method="post">
    Title:  <input type="text" name="text_title" />
    Author: <input type="text" name="text_author" />
    isRead: <input type="text" name="text_bool" />
    <input type="submit" value="Dodaj">
</form>
</body>

<%if(role == 1)%>
<a href="admin.jsp"><button>Pokaż użytkowników</button></a>



<a href="Logout">Wyloguj</a>


</body>
</html>