package com.sanvalero.travelapp.domain;

public class Destination {

    private int id;
    private String name;
    private String area;
    private double score;

    public Destination() {

    }

    public Destination(String name, String area) {
        this.name = name;
        this.area = area;
        score = 5.0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}

