package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.Destination;
import com.sanvalero.travelapp.domain.Trip;
import com.sanvalero.travelapp.domain.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class TripDao {
    private Connection connection;

    public TripDao(Connection connection) {
        this.connection = connection;
    }

    public void add(Trip trip, Destination destination) throws SQLException {
        String sql = "INSERT INTO trips (destination_id, start_date, end_date, price) VALUES (?, ?, ?, ?)";

        connection.setAutoCommit(false);

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, destination.getId());
        statement.setDate(2, Date.valueOf(trip.getStartDate()));
        statement.setDate(3, Date.valueOf(trip.getEndDate()));
        statement.setDouble(4, trip.getPrice());
        statement.executeUpdate();

        connection.commit();
        connection.setAutoCommit(true);
    }

}
