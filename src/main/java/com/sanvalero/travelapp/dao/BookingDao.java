package com.sanvalero.travelapp.dao;

import java.sql.*;
import java.util.List;
import java.util.UUID;

public class BookingDao {
    private Connection connection;

    public OrderDao(Connection connection) {
        this.connection = connection;
    }

    public void addOrder(User user, List<Book> books) throws SQLException {
        String orderSql = "INSERT INTO orders (code, user_id, date) VALUES (?, ?, ?)";

        connection.setAutoCommit(false);

        PreparedStatement orderStatement = connection.prepareStatement(orderSql,
                PreparedStatement.RETURN_GENERATED_KEYS);
        orderStatement.setString(1, UUID.randomUUID().toString());
        orderStatement.setInt(2, user.getId());
        orderStatement.setDate(3, new Date(System.currentTimeMillis()));
        orderStatement.executeUpdate();

        // Obtener el orderId generado en la sentencia anterior (el último AUTO_INCREMENT generado)
        ResultSet orderKeys = orderStatement.getGeneratedKeys();
        orderKeys.next();
        int orderId = orderKeys.getInt(1);
        orderStatement.close();

        for (Book book : books) {
            String bookSql = "INSERT INTO order_book (order_id, book_id) VALUES (?, ?)";

            PreparedStatement bookStatement = connection.prepareStatement(bookSql);
            bookStatement.setInt(1, orderId);
            bookStatement.setInt(2, book.getId());
            bookStatement.executeUpdate();
        }

        connection.commit();
        connection.setAutoCommit(true);
    }
}
