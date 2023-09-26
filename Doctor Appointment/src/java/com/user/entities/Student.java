package com.user.entities;

public class Student {
 
    private String enrollment;
    private String name;
    private int age;
    private String gender;
    private String course;
    private String department;
    private String phone;
    private String email;
    private String password;

    public Student(String enrollment, String name, int age, String gender, String course, String department, String phone, String email, String password) {
        this.enrollment = enrollment;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.course = course;
        this.department = department;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public Student() {
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
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
