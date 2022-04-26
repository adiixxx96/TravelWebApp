package com.sanvalero.travelapp.domain;

import java.sql.Date;

public class Trip {

    private int id;
    private Destination destination;
    private Date startDate;
    private Date endDate;
    private double price;

    public Trip() {
    }

    public Trip(Destination destination, Date startDate, Date endDate, double price) {
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
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

