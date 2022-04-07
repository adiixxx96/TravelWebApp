package com.sanvalero.travelapp;

import com.sanvalero.travelapp.dao.Database;
import com.sanvalero.travelapp.dao.UserDao;
import com.sanvalero.travelapp.domain.User;
import com.sanvalero.travelapp.exception.UserAlreadyExistsException;
import com.sanvalero.travelapp.exception.UserNotFoundException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;

public class Menu {
    private Scanner keyboard;
    private Database database;
    private Connection connection;
    private User currentUser;

    public Menu() {
        keyboard = new Scanner(System.in);
    }

    public void connect() {
        database = new Database();
        connection = database.getConnection();
    }

    public void showMenu() {
        connect();

        String choice = null;

        do {
            System.out.println("Bienvenido");
            System.out.println("1. Añadir un usuario");
            System.out.println("2. Loguearse");
            System.out.println("3. Eliminar un usuario");
            System.out.println("s. Salir");
            System.out.print("Opción: ");
            choice = keyboard.nextLine();

            switch (choice) {
                case "1":
                    addUser();
                    break;
                case "2":
                    login();
                    break;
                case "3":
                    deleteUser();
                    break;
            }
        } while (!choice.equals("s"));
    }

    private void login() {
        System.out.print("¿Cuál es tu usuario? ");
        String username = keyboard.nextLine();
        System.out.print("¿Cuál es tu contraseña? ");
        String password = keyboard.nextLine();

        UserDao userDao = new UserDao(connection);
        try {
            currentUser = userDao.getUser(password, username)
                    .orElseThrow(UserNotFoundException::new);
        } catch (SQLException sqle) {
            System.out.println("No se ha podido comunicar con la base de datos. Inténtelo de nuevo");
            System.exit(0);
        } catch (UserNotFoundException unfe) {
            System.out.println(unfe.getMessage());
            System.exit(0);
        }
    }

    public void addUser() {
        UserDao userDao = new UserDao(connection);

        System.out.print("Name: ");
        String name = keyboard.nextLine();
        System.out.print("Username: ");
        String username = keyboard.nextLine();
        System.out.print("Password: ");
        String password = keyboard.nextLine();
        User user = new User(name.trim(), username.trim(), password.trim());

        try {
            userDao.add(user);
            System.out.println("El usuario se ha registrado correctamente");
        } catch (UserAlreadyExistsException uaee) {
            System.out.println(uaee.getMessage());
        } catch (SQLException sqle) {
            System.out.println("No se ha podido registrar el usuario. Inténtelo de nuevo");
        }
    }

    public void deleteUser() {
        UserDao userDao = new UserDao(connection);

        System.out.print("Usuario a eliminar: ");
        String username = keyboard.nextLine();
        try {
            boolean deleted = userDao.delete(username);
            if (deleted)
                System.out.println("El usuario se ha eliminado correctamente");
            else
                System.out.println("El usuario no se ha podido eliminar porque no existe");

        } catch (SQLException sqle) {
            System.out.println("No se ha podido conectar con la base de datos. Inténtelo de nuevo");
        }
    }
}
