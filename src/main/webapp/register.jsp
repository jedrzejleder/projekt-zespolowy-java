<%--
  Created by IntelliJ IDEA.
  User: Jędrek
  Date: 03.06.2021
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        * {
            box-sizing: border-box;
            margin: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: antiquewhite;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input {
            margin-bottom: 10px;
            width: 200px;
        }

        button {
            width: 200px;
        }
    </style>
    <body>
        <title>Rejestracja</title>
        <form action="Register" method="post">
            Login: <input type="text" name="text_login" />
            Hasło: <input type="password" name="text_passwd" />
            <input type="submit" value="Zarejestruj">
        </form>
    </body>
</head>
<body>

</body>
</html>
