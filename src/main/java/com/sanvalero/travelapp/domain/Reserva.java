package com.sanvalero.travelapp.domain;

import java.time.LocalDate;

public class Reserva {
    private String codigo;
    private int idUsuario;
    private int idViaje;
    private LocalDate fecha;

    public Reserva(String codigo, int idUsuario, int idViaje, LocalDate fecha) {
        this.codigo = codigo;
        this.idUsuario = idUsuario;
        this.idViaje = idViaje;
        this.fecha = fecha;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdViaje() {
        return idViaje;
    }

    public void setIdViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }
}
