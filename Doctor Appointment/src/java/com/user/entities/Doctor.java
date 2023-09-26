package com.user.entities;

public class Doctor {
    private String enrollment;
    private String name;
    private String post;
    private int experience;
    private String phone;
    private String email;
    private String password;

    public Doctor() {
    }

    public Doctor(String enrollment, String name, String post, int experience, String phone, String email, String password) {
        this.enrollment = enrollment;
        this.name = name;
        this.post = post;
        this.experience = experience;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public String getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(String enrollment) {
        this.enrollment = enrollment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
