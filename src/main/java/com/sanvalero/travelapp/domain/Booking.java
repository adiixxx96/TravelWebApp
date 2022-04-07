package com.sanvalero.travelapp.domain;

import java.time.LocalDate;

public class Booking {
    private String code;
    private int userId;
    private int tripId;
    private LocalDate bookingDate;

    public Booking(String code, int userId, int tripId, LocalDate bookingDate) {
        this.code = code;
        this.userId = userId;
        this.tripId = tripId;
        this.bookingDate = bookingDate;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }
}
