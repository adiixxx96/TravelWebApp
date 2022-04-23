package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.Booking;
import com.sanvalero.travelapp.domain.Trip;
import com.sanvalero.travelapp.domain.User;

import java.sql.*;
import java.util.List;
import java.util.UUID;

public class BookingDao {
    private Connection connection;

    public BookingDao(Connection connection) {
        this.connection = connection;
    }

    public void add(Booking booking, User user, Trip trip) throws SQLException {
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
}
