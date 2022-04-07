package com.sanvalero.travelapp.domain;

import java.time.LocalDate;

public class Trip {

    private int id;
    private int destinationId;
    private LocalDate startDate;
    private LocalDate endDate;
    private double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDestinationId() {
        return destinationId;
    }

    public void setDestinationId(int destinationId) {
        this.destinationId = destinationId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Trip(int destinationId, LocalDate startDate, LocalDate endDate, double price) {
        this.destinationId = destinationId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;


    }
}
