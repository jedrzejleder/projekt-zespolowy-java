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
    <meta charset="UTF-8">
    <title>Witamy!</title>
</head>
<style type="text/css">
    body {
        background-color: antiquewhite;
        text-align: center;
        font-family: sans-serif;
    }

    table {
        margin: 50px auto 0 auto;
        border-collapse: collapse;
        padding: 20px;
        border-radius: 25px;
        box-shadow: 5px 5px 10px grey;
        overflow: hidden;
    }

    td, th {
        padding: 1rem;
        text-align: center;
    }

    tr:nth-child(even) {
        background-color: orange;
    }

    tr:nth-child(odd) {
        background-color: darkorange;
    }

    form {
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100px;
    }

    input {
        margin-bottom: 10px;
        width: 200px;
    }

    .add-form {
        text-align: center;
    }

</style>
<body>
<%
    HttpSession sess = request.getSession(false);
    if (sess.getAttribute("user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>

<h1>Domowa biblioteka</h1>
<p>Witaj <b>${user}</b>!</p>
<a href="Logout">Wyloguj</a>

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
%>
<table>
    <thead>
    <tr>
<%--        <th>ID</th>--%>
        <th>Title</th>
        <th>Author</th>
        <th>Is read?</th>
        <th></th>
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
        <td><button>Przeczytałem!</button></td>
    </tr>
    <%}%>
    </tbody>
</table>
<br><br><br>
<div class="add-form">
<h2>Dodawanie Książek</h2>
<form action="add" method="post">
    Title:  <input type="text" name="text_title" />
    Author: <input type="text" name="text_author" />
    isRead: <input type="text" name="text_bool" />
    <input type="submit" value="Dodaj">
</form>
</div>




</body>
</html>