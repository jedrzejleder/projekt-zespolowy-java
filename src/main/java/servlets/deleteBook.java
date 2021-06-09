package servlets;

import Database.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "deleteBook", value = "/deleteBook")
public class deleteBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            Connection connection = DatabaseConnection.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        String sql = "DELETE FROM books where id="+id;

        try {
            DatabaseConnection.executeDML(sql);
            System.out.println(sql);
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } catch (SQLException throwables) {
            System.err.println("Błąd polecenia " + sql);
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
