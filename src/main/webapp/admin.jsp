<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="authorization.User" %><%--
  Created by IntelliJ IDEA.
  User: szymo
  Date: 09.06.2021
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Administratora</title>
</head>
<style>
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

    table {
        margin: 0 auto;
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

    .styled-button {
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        background-color: rgb(255, 208, 153);
    }

    .styled-button:hover {
        background-color: rgb(255, 194, 75);
    }
</style>
<body>

<nav>
    <h2>Domowa Biblioteczka</h2>
    <div>
        <a href="welcome.jsp">Biblioteka</a>
        <a href="Logout">Wyloguj</a>
    </div>
</nav>

<%
    try
    {
        ResultSet rs=null;
        try{
            rs = DatabaseConnection.getData("SELECT * FROM users");
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
%>

<table>
    <thead>
    <tr class="tab-header">
        <th>ID</th>
        <th>Nazwa użytkownika</th>
        <th>Rola</th>
        <th>Usuń użytkownika</th>
    </tr>
    </thead>
    <tbody>
    <%while(rs.next())
    {
    %>
    <tr>
        <%
            String role;
            if(rs.getString("role").equals("1")){
                role = "Administrator";
            } else
                role = "Użytkownik";
        %>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("username") %></td>
        <td><%=role%></td>
        <td><INPUT class="styled-button" type="Button" VALUE="Usuń" ONCLICK="buttonDelete(<%=rs.getString("id")%>)"></td>
    </tr>
    <%}%>
    </tbody>
</table><br><br>
<%}
catch(Exception e){
    System.out.println(e.getMessage());%><br><%
    }
%>

<SCRIPT LANGUAGE="JavaScript">
    function buttonDelete(id){
        window.location.href="http://localhost:8080/AplikacjaWebowa_war/deleteUser?id="+id;
    }
</SCRIPT>
</body>
</html>
