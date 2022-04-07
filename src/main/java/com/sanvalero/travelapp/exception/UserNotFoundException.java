package com.sanvalero.travelapp.exception;

public class UserNotFoundException extends Exception {

    public UserNotFoundException(String message) {
        super(message);
    }

    public UserNotFoundException() {
        super("El usuario no existe");
    }
}
