package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.Destination;
import com.sanvalero.travelapp.domain.Trip;

import java.sql.*;
import java.util.ArrayList;
import java.util.Optional;

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
        statement.setDate(2, trip.getStartDate());
        statement.setDate(3, trip.getEndDate());
        statement.setDouble(4, trip.getPrice());
        statement.executeUpdate();

        connection.commit();
        connection.setAutoCommit(true);
    }

    public ArrayList<Trip> findAll() throws SQLException {
        String sql = "SELECT * FROM trips ORDER BY start_date";
        ArrayList<Trip> trips = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Trip trip = fromResultSet(resultSet);
            trips.add(trip);
        }

        return trips;
    }

    public ArrayList<Trip> findAll(String searchtext) throws SQLException {
        String sql = "SELECT * FROM trips t INNER JOIN destinations d ON t.destination_id = d.id WHERE lower(d.name) LIKE ?";
        ArrayList<Trip> trips = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "%" + searchtext + "%");
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Trip trip = fromResultSet(resultSet);
            trips.add(trip);
        }

        return trips;
    }

    public Optional<Trip> findById(int id) throws SQLException {
        String sql = "SELECT * FROM trips WHERE id = ?";
        Trip trip = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            trip = fromResultSet(resultSet);
        }

        return Optional.ofNullable(trip);
    }


    private Trip fromResultSet(ResultSet resultSet) throws SQLException {
        Trip trip = new Trip();
        trip.setId(resultSet.getInt("id"));
        DestinationDao destinationDao = new DestinationDao(connection);
        String destinationId = resultSet.getString("destination_id");
        Destination destination =destinationDao.findById(Integer.parseInt(destinationId)).get();
        trip.setDestination(destination);
        trip.setStartDate(resultSet.getDate("start_date"));
        trip.setEndDate(resultSet.getDate("end_date"));
        trip.setPrice(resultSet.getDouble("price"));
        return trip;
    }
}
