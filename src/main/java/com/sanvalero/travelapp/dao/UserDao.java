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

        connection.setAutoCommit(false);

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getName());
        statement.setString(2, user.getUsername());
        statement.setString(3, user.getPassword());
        statement.executeUpdate();

        connection.commit();
        connection.setAutoCommit(true);
    }

    public boolean delete(String username) throws SQLException {
        String sql = "DELETE FROM users WHERE username = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        int rows = statement.executeUpdate();

        return rows == 1;
    }

    public boolean modify(int userId, User user) throws SQLException {
        String sql = "UPDATE users SET name = ?, username = ?, password = ? WHERE id = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getName());
        statement.setString(2, user.getUsername());
        statement.setString(3, user.getPassword());
        statement.setInt(4, userId);
        int rows = statement.executeUpdate();
        return rows == 1;
    }

    public Optional<User> login(String username, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
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

    public Optional<User> findById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
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
