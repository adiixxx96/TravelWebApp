package com.sanvalero.travelapp.servlet;


import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.dao.UserDao;
import com.sanvalero.travelapp.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            Optional<User> user = userDao.login(username, password);
            if (user.isPresent()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser", user.get());
                System.out.println("sesión iniciada");
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("loginincorrect.jsp");
            }
            System.out.println("aqui");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
