package com.sanvalero.travelapp.servlet;

import com.sanvalero.travelapp.dao.BookingDao;
import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/delete-booking")
public class DeleteBooking extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Comprobar login usuario
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
        }
        String code = request.getParameter("code");
        Database database = new Database();
        BookingDao bookingDao = new BookingDao(database.getConnection());
        try {
            bookingDao.delete(code);
            response.sendRedirect("personalarea.jsp");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }



    }
}
