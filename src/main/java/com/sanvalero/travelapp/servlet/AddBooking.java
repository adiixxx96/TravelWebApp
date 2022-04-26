package com.sanvalero.travelapp.servlet;

import javax.servlet.annotation.WebServlet;
import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.dao.UserDao;
import com.sanvalero.travelapp.domain.User;
import com.sanvalero.travelapp.dao.BookingDao;
import com.sanvalero.travelapp.domain.Booking;
import com.sanvalero.travelapp.dao.TripDao;
import com.sanvalero.travelapp.domain.Trip;
import com.sanvalero.travelapp.exception.UserAlreadyExistsException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@WebServlet("/add-booking")
public class AddBooking extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Comprobar login usuario
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
        }

        String tripId = request.getParameter("idTrip");
        Database database = new Database();
        TripDao tripDao = new TripDao(database.getConnection());
        Trip trip = null;
        try {
            Optional<Trip> optionalTrip = tripDao.findById(Integer.parseInt(tripId));
            trip = optionalTrip.get();

            Booking booking = new Booking();
            BookingDao bookingDao = new BookingDao(database.getConnection());
            bookingDao.add(currentUser, trip);
            out.println("<div class='alert alert-success' role='alert'>Pedido realizado correctamente</div>");
            response.sendRedirect("personalarea.jsp");

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            out.println("Ha habido un error de conexión con la bbdd");
        }
    }





}
