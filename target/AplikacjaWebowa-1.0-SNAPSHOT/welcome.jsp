<%--
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
<a href="Logout">Wyloguj</a>

</body>
</html>
