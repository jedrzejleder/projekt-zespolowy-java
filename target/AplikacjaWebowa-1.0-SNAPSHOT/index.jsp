<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logowanie</title>
</head>
<body>

    <jsp:useBean id="beanUser" class="beans.User" />

    <%
        beanUser.setId(5);
    %>

    <form action="login" method="post">
        login: <input type="text" name="text_login" width="25" />
        haslo: <input type="password" name="text_passwd" width="25" />
        <input type="submit" value="Zaloguj">
    </form>

    <p style="color: red">${error}</p>

</body>
</html>