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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/add-user")
public class AddUser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = new User(name, username, password);

        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            userDao.add(user);
            out.println("<br><div class='alert alert-success' role='alert'>El usuario se ha registrado correctamente</div>");
        } catch (UserAlreadyExistsException uaee) {
            out.println("<br><div class='alert alert-danger' role='alert'>El usuario ya existe</div>");
            uaee.printStackTrace();
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Se ha producido un error</div>");
            sqle.printStackTrace();
        }
    }
}
