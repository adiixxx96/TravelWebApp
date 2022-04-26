package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.Booking;
import com.sanvalero.travelapp.domain.Trip;
import com.sanvalero.travelapp.domain.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class BookingDao {
    private Connection connection;

    public BookingDao(Connection connection) {
        this.connection = connection;
    }

    public void add(User user, Trip trip) throws SQLException {
        String sql = "INSERT INTO bookings (code, user_id, trip_id, booking_date) VALUES (?, ?, ?, ?)";

        connection.setAutoCommit(false);

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, UUID.randomUUID().toString());
        statement.setInt(2, user.getId());
        statement.setInt(3, trip.getId());
        statement.setDate(4, new Date(System.currentTimeMillis()));
        statement.executeUpdate();

        connection.commit();
        connection.setAutoCommit(true);
    }

    public boolean delete(String code) throws SQLException {
        String sql = "DELETE FROM bookings WHERE code = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, code);
        int rows = statement.executeUpdate();

        return rows == 1;
    }

    public List<Booking> findAll(User user) throws SQLException {
        String sql = "SELECT * FROM bookings WHERE user_id = ? ORDER BY booking_date";
        ArrayList<Booking> bookings = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, user.getId());
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Booking booking = fromResultSet(resultSet);
            bookings.add(booking);
        }

        return bookings;
    }

    private Booking fromResultSet(ResultSet resultSet) throws SQLException {
        Booking booking = new Booking();
        booking.setCode(resultSet.getString("code"));

        UserDao userDao = new UserDao(connection);
        String userId = resultSet.getString("user_id");
        User user = userDao.findById(Integer.parseInt(userId)).get();
        booking.setUser(user);
        TripDao tripDao = new TripDao(connection);
        String tripId = resultSet.getString("trip_id");
        Trip trip = tripDao.findById(Integer.parseInt(tripId)).get();
        booking.setTrip(trip);
        booking.setBookingDate(resultSet.getDate("booking_date"));
        return booking;
    }

}
