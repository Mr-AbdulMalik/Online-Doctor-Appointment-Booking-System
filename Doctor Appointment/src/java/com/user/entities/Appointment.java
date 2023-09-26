package com.user.entities;

public class Appointment {

    private String senroll;
    private String denroll;
    private String date;
    private String Symptems;
    private int status;
    private int done;
    private String appointmentId;

    public Appointment() {
    }

    public Appointment(String appointmentId, String senroll, String denroll, String date, String Symptems, int status, int done) {
        this.senroll = senroll;
        this.denroll = denroll;
        this.date = date;
        this.Symptems = Symptems;
        this.status = status;
        this.done = done;
        this.appointmentId = appointmentId;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId() {
        long min = 100000000;
        long max = 999999999;
        long id = (long) Math.floor(Math.random() * (max - min + 1) + min);
        this.appointmentId = String.valueOf(id);
    }
    
    public void setAppointmentId(String id) {
        this.appointmentId = id;
    }

    public String getSenroll() {
        return senroll;
    }

    public void setSenroll(String senroll) {
        this.senroll = senroll;
    }

    public String getDenroll() {
        return denroll;
    }

    public void setDenroll(String denroll) {
        this.denroll = denroll;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSymptems() {
        return Symptems;
    }

    public void setSymptems(String Symptems) {
        this.Symptems = Symptems;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDone() {
        return done;
    }

    public void setDone(int done) {
        this.done = done;
    }

}
