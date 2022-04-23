package com.sanvalero.travelapp.domain;

import java.sql.Date;
import java.time.LocalDate;

public class Trip {

    private int id;
    private LocalDate startDate;
    private LocalDate endDate;
    private double price;
    private Destination destination;

    public Trip() {
    }

    public Trip(int id, LocalDate startDate, LocalDate endDate, double price, Destination destination) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.price = price;
        this.destination = destination;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }
}
