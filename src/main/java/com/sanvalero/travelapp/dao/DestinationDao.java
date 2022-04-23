package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.Destination;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class DestinationDao {

    private Connection connection;

    public DestinationDao(Connection connection) {
        this.connection = connection;
    }

    public boolean modify(String name, Destination destination) throws SQLException {
        String sql = "UPDATE destinations SET name = ?, area = ?, score = ? WHERE name = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, destination.getName());
        statement.setString(2, destination.getArea());
        statement.setDouble(3, destination.getScore());
        statement.setString(4, name);
        int rows = statement.executeUpdate();
        return rows == 1;
    }

    public ArrayList<Destination> findAll() throws SQLException {
        String sql = "SELECT * FROM destinations ORDER BY name";
        ArrayList<Destination> destinations = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Destination destination = fromResultSet(resultSet);
            destinations.add(destination);
        }

        return destinations;
    }

    public ArrayList<Destination> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM destinations WHERE INSTR(name, ?) != 0 OR INSTR(area, ?) != 0 ORDER BY name";
        ArrayList<Destination> destinations = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        statement.setString(2, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Destination destination = fromResultSet(resultSet);
            destinations.add(destination);
        }

        return destinations;
    }

    public Optional<Destination> findByName(String name) throws SQLException {
        String sql = "SELECT * FROM destinations WHERE name = ?";
        Destination destination = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            destination = fromResultSet(resultSet);
        }

        return Optional.ofNullable(destination);
    }

    public Optional<Destination> findById(int id) throws SQLException {
        String sql = "SELECT * FROM destinations WHERE id = ?";
        Destination destination = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            destination = fromResultSet(resultSet);
        }

        return Optional.ofNullable(destination);
    }

    private Destination fromResultSet(ResultSet resultSet) throws SQLException {
        Destination destination = new Destination();
        destination.setId(resultSet.getInt("id"));
        destination.setName(resultSet.getString("name"));
        destination.setArea(resultSet.getString("area"));
        destination.setScore(resultSet.getDouble("score"));
        return destination;
    }

    private boolean existsDestination(String name) throws SQLException {
        Optional<Destination> destination = findByName(name);
        return destination.isPresent();
    }
}
