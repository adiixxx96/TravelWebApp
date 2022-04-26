package com.sanvalero.travelapp.servlet;


import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.dao.UserDao;
import com.sanvalero.travelapp.domain.User;
import com.sanvalero.travelapp.exception.UserAlreadyExistsException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            Optional<User> user = userDao.login(username, password);
            if (user.isPresent()) {
                //Asignamos currentuser para mantener al usuario logueado durante la sesión
                HttpSession session = request.getSession(true);
                session.setAttribute("currentUser", user.get());
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("loginincorrect.jsp");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
