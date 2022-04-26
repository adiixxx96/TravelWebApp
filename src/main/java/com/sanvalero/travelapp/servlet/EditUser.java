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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Optional;

@WebServlet ("/edit-user")
public class EditUser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Comprobar login usuario
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("accesonopermitido.jsp");
        }

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userId = String.valueOf(currentUser.getId());
        User user = new User(name, username, password);

        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            userDao.modify(Integer.parseInt(userId), user);

            //Volvemos a asignar el currentuser con los datos de usuario modificados
            Optional<User> newUser = userDao.login(username, password);
            HttpSession session = request.getSession(true);
            session.setAttribute("currentUser", newUser.get());
            out.println("<br><div class='alert alert-success' role='alert'>Se ha modificado el usuario correctamente.</div>");
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Se ha producido un error. Puede ser que ese usuario ya exista.</div>");
        }
    }
}
