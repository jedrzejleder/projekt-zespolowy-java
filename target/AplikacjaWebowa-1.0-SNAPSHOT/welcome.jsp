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
    * {
        box-sizing: border-box;
        margin: 0;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: navajowhite;
        padding: 30px 15px;
        font-family: "Comic Sans MS";
        margin-bottom: 20px;
    }

    nav a {
        margin: 0 5px;
        text-decoration: none;
        transition: color .3s;
    }

    nav a:visited {
         color: inherit;
     }

    nav a:hover {
        color: darkorange;
    }

    body {
        background-color: antiquewhite;
        text-align: center;
        font-family: sans-serif;
    }

    main {
        display: flex;
        justify-content: space-evenly;
        align-items: flex-start;
    }

    main h2 {
        margin-bottom: 20px;
    }

    .form {
        width: 300px;
    }

    table {
        /*margin: 25px auto 0 auto;*/
        border-collapse: collapse;
        padding: 20px;
        border-radius: 10px;
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

    .tab-header {
        border-bottom: 1px solid dimgrey;
        background-color: #d57603 !important;
    }

    form {
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 100px;
    }

    input, select{
        margin-bottom: 20px;
        width: 300px;
        padding: 10px 15px;
        background-color: inherit;
        border: none;
        border-radius: 0;
        border-bottom: 1px solid darkorange;
    }

    select {
        text-align-last: center;
    }

    .button {
        width: auto;
        padding: 5px 10px;
    }

    .styled-button {
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        background-color: rgb(255, 208, 153);
    }

    .styled-button:hover {
        background-color: rgb(255, 194, 75);
    }

    .readed {
        text-transform: uppercase;
    }

</style>
<body>
    <%
    HttpSession sess = request.getSession(false);
    if (sess.getAttribute("user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
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
<nav>
    <h2>Domowa Biblioteczka</h2>
    <h3>Witaj, ${user}!</h3>
    <div>
        <%if(role == 1)%><a href="admin.jsp">Pokaż użytkowników</a>
        <a href="Logout">Wyloguj</a>
    </div>
</nav>
<main>
<div class="list">
    <h2>Twoja kolekcja:</h2>

    <table>
        <thead>
        <tr class="tab-header">
            <%--        <th>ID</th>--%>
            <th>Tytuł</th>
            <th>Autor</th>
            <th>Przeczytana?</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%while(rs.next())
        {
        %>
        <tr>
            <td><%=rs.getString("title") %></td>
            <td><%=rs.getString("author") %></td>
            <td class="readed"><%=rs.getString("readed") %> </td>
            <td><INPUT class="button styled-button" type="Button" VALUE="Przeczytałem!" ONCLICK="switchReaded('<%=rs.getString("id")%>','<%=rs.getString("readed")%>')"></td>
            <td><INPUT class="button styled-button" type="Button" VALUE="Usuń" ONCLICK="buttonDelete(<%=rs.getString("id")%>)"></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<div class="form">
    <h2>Dodaj książkę:</h2>
    <form action="add" method="post">
        Tytuł:  <input type="text" name="text_title" />
        Autor: <input type="text" name="text_author" />
        Przeczytana? <select name="text_bool">
        <option value="nie">NIE</option>
        <option value="tak">TAK</option>

    </select>
        <input class="styled-button" type="submit" value="Dodaj">
    </form>
</div>
</main>

<SCRIPT LANGUAGE="JavaScript">
    function buttonDelete(id){
        window.location.href="http://localhost:8080/AplikacjaWebowa_war_exploded/deleteBook?id="+id;
    }
</SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
    function switchReaded(id,readed){
        window.location.href="http://localhost:8080/AplikacjaWebowa_war_exploded/switchReaded?id="+id+"&readed="+readed;
    }
</SCRIPT>

</body>
</html>