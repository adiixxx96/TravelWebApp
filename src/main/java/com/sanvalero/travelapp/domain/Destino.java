package com.sanvalero.travelapp.domain;

public class Destino {

    private int id;
    private String nombre;
    private String area;
    private double puntuacion;

    public Destino(String nombre, String area) {
        this.nombre = nombre;
        this.area = area;
        puntuacion = 5.0;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public double getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(double puntuacion) {
        this.puntuacion = puntuacion;
    }
}
