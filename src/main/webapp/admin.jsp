<%@ page import="java.sql.ResultSet" %>
<%@ page import="Database.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: szymo
  Date: 09.06.2021
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Panel Administratora</title>
</head>
<body>
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
<table border=1 style="text-align:center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <%while(rs.next())
    {
    %>
    <tr>
        <td><%=rs.getString("id") %></td>
        <td><%=rs.getString("username") %></td>
        <td><%=rs.getString("role") %></td>
    </tr>
    <%}%>
    </tbody>
</table><br><br>
<%}
catch(Exception e){
    System.out.println(e.getMessage());%><br><%
    }
%>
</body>
</html>
