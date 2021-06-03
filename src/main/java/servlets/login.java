package servlets;

import authorization.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user = request.getParameter("text_login");
        String passwd = request.getParameter("text_passwd");

        if (User.isAuthorized(user, passwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Niepoprawne dane logowania!");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }
}
