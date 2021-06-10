package servlets;

import Database.DatabaseConnection;
import com.example.AplikacjaWebowa.HelloServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "switchReaded", value = "/switchReaded")
public class switchReaded extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String readed = request.getParameter("readed");

        try {
            Connection connection = DatabaseConnection.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        String sql = "";
        if(readed.equals("tak"))
            sql = "UPDATE books SET readed = 'nie' WHERE id ="+id;
        else if(readed.equals("nie"))
            sql = "UPDATE books SET readed = 'tak' WHERE id ="+id;

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
