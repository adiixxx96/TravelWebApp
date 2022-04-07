package com.sanvalero.travelapp.dao;

import com.sanvalero.travelapp.domain.User;
import com.sanvalero.travelapp.exception.UserAlreadyExistsException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDao {

    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public void add(User user) throws SQLException, UserAlreadyExistsException {
        if (existsUser(user.getUsername()))
            throw new UserAlreadyExistsException();

        String sql = "INSERT INTO users (name, username, password) VALUES (?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getName());
        statement.setString(2, user.getUsername());
        statement.setString(3, user.getPassword());
        statement.executeUpdate();
    }

    public Optional<User> getUser(String password, String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE password = ? AND username = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, password);
        statement.setString(2, username);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setUsername(resultSet.getString("password"));
            user.setPassword(resultSet.getString("username"));
        }

        return Optional.ofNullable(user);
    }

    public Optional<User> findByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = new User();
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setUsername(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
        }

        return Optional.ofNullable(user);
    }


    private boolean existsUser (String username) throws SQLException {
        Optional<User> user = findByUsername(username);
        return user.isPresent();
    }
}
