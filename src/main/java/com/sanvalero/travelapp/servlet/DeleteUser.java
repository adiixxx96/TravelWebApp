package com.sanvalero.travelapp.servlet;

import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.dao.UserDao;
import com.sanvalero.travelapp.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete-user")
public class DeleteUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        //Comprobar login usuario
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
        }

        String username = request.getParameter("username");
        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            userDao.delete(username);
            response.sendRedirect("login.jsp");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
