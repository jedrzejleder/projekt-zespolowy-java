package servlets;

import Database.DatabaseConnection;
import authorization.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "add", value = "/add")
public class add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Author = request.getParameter("text_author");
        String Title = request.getParameter("text_title");
        String isRead = request.getParameter("text_bool");
        HttpSession sess = request.getSession(false);
        String username = sess.getAttribute("user").toString();
        int id = User.getID(username);

        try {
            Connection connection = DatabaseConnection.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        String sql = "INSERT INTO books(title,author,readed,owner) VALUES('" + Title + "','" + Author + "','" + isRead + "','" + id + "');";
       // String sql = "INSERT INTO books(title,author,owner) VALUES('" + Author + "','" + Title + "','" + id + "');";

        try {
            DatabaseConnection.executeDML(sql);
            System.out.println(sql);
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } catch (SQLException throwables) {
            System.err.println("Błąd polecenia " + sql);
            throwables.printStackTrace();
        }
    }
}
