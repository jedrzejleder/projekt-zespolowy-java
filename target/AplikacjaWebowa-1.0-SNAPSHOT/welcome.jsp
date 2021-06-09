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

<h1>Witaj, ${user}!</h1>
<h2>Twoja kolekcja:</h2>
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
        <th>Tytuł</th>
        <th>Autor</th>
        <th>Przeczytana?</th>
    </tr>
    </thead>
    <tbody>
    <%while(rs.next())
    {
    %>
    <tr>
        <td><%=rs.getString("title") %></td>
        <td><%=rs.getString("author") %></td>
        <td><%=rs.getString("readed") %></td>
        <td><INPUT type="Button" VALUE="Usuń" ONCLICK="buttonDelete(<%=rs.getString("id")%>)"></td>
    </tr>
    <%}%>
    </tbody>
</table>
<br>
<body>

<h2>Dodaj książkę do kolekcji:</h2>
<form action="add" method="post">
    Tytuł:  <input type="text" name="text_title" />
    Autor: <input type="text" name="text_author" />
    Przeczytana?: <select name="text_bool">
                        <option value=tak">tak</option>
                        <option value="nie">nie</option>
                  </select>
    <input type="submit" value="Dodaj">
</form>
</body>

<%if(role == 1)%><a href="admin.jsp"><button>Pokaż użytkowników</button></a>

<SCRIPT LANGUAGE="JavaScript">
    function buttonDelete(id){
        window.location.href="http://localhost:8080/AplikacjaWebowa_war/deleteBook?id="+id;
    }
</SCRIPT>
<a href="Logout">Wyloguj</a>


</body>
</html>