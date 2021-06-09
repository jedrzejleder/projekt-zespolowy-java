package servlets;

import Database.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("text_login");
        String passwd = request.getParameter("text_passwd");
        String role = "2";
        try {
            Connection connection = DatabaseConnection.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        String sql = "INSERT INTO users(username, passwd, role) VALUES('" + user + "','" + passwd + "','" + role + "');";
        try {
            DatabaseConnection.executeDML(sql);
            System.out.println(sql);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException throwables) {
            System.err.println("Błąd polecenia " + sql);
            throwables.printStackTrace();
        }
    }
}
