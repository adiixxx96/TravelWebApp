package com.sanvalero.travelapp.domain;

import java.time.LocalDate;
import java.util.Date;

public class Booking {
    private String code;
    private Date bookingDate;
    private User user;
    private Trip trip;

    public Booking() {
    }

    public Booking(String code, Date bookingDate, User user, Trip trip) {
        this.code = code;
        this.bookingDate = bookingDate;
        this.user = user;
        this.trip = trip;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }
}