package com.user.dao;

import com.user.entities.Appointment;
import com.user.entities.Doctor;
import com.user.entities.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao {
    private final Connection conn;

    public StudentDao(Connection conn) {
        this.conn = conn;
    }
    
    public boolean saveStudent(Student s) {
        
        boolean flag = false;
        try {
            String q = "insert into student(enrollment, name, age, gender, course, department, phone, email, password) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement p = this.conn.prepareStatement(q);
            p.setString(1, s.getEnrollment());
            p.setString(2, s.getName());
            p.setInt(3, s.getAge());
            p.setString(4, s.getGender());
            p.setString(5, s.getCourse());
            p.setString(6, s.getDepartment());
            p.setString(7, s.getPhone());
            p.setString(8, s.getEmail());
            p.setString(9, s.getPassword());
            p.executeUpdate();
            flag = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public Student getStudent(String enroll, String password) {
        Student student = null;

        try {
            String query = "select * from student where enrollment = ? and password = ?;";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, enroll);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setName(rs.getString("name"));
                student.setEnrollment(rs.getString("enrollment"));
                student.setEmail(rs.getString("email"));
                student.setGender(rs.getString("gender"));
                student.setPassword(rs.getString("password"));
                student.setAge(rs.getInt("age"));
                student.setCourse(rs.getString("course"));
                student.setDepartment(rs.getString("department"));
            }
        } catch (SQLException e) {
        }

        return student;
    }
    
    public Student getStudent(String enroll) {
        Student student = null;

        try {
            String query = "select * from student where enrollment = ?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, enroll);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setName(rs.getString("name"));
                student.setEnrollment(rs.getString("enrollment"));
                student.setEmail(rs.getString("email"));
                student.setGender(rs.getString("gender"));
                student.setPassword(rs.getString("password"));
                student.setAge(rs.getInt("age"));
                student.setPhone(rs.getString("phone"));
                student.setCourse(rs.getString("course"));
                student.setDepartment(rs.getString("department"));
            }
        } catch (SQLException e) {
        }

        return student;
    }
    
    public boolean saveAppoinment(Appointment ap) {
        String[] arr = ap.getDate().split("-");
        String date = arr[2] +"-"+ arr[1] +"-"+ arr[0];
        boolean flag = false;
        try {
            String q = "insert into appointment(id, senroll, denroll, date, symptems, status, done) values(?,?,?,?,?,?,?)";
            PreparedStatement p = this.conn.prepareStatement(q);
            p.setString(1, ap.getAppointmentId());
            p.setString(2, ap.getSenroll());
            p.setString(3, ap.getDenroll());
            p.setString(4, date);
            p.setString(5, ap.getSymptems());
            p.setInt(6, ap.getStatus());
            p.setInt(7, ap.getDone());
            p.executeUpdate();
            flag = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean updateAppoinment(String id, String datee) {
        boolean flag = false;
        String[] arr = datee.split("-");
        String date = arr[2] +"-"+ arr[1] +"-"+ arr[0];
        try {
            String q = "update appointment set date = ?, status = 1 where id = ?;";
            PreparedStatement p = this.conn.prepareStatement(q);
            p.setString(1, date);
            p.setString(2, id);
            p.executeUpdate();
            flag = true;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public ArrayList<Appointment> getStudentUpcomingAppoinment(String senroll) {
        Appointment ap = null;
        ArrayList<Appointment> arr = new ArrayList<>();
        try {
            String query = "select * from appointment where senroll = ? and status=1";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, senroll);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                ap = new Appointment();
                ap.setAppointmentId(rs.getString("id"));
                ap.setSenroll(rs.getString("senroll"));
                ap.setDenroll(rs.getString("denroll"));
                ap.setDate(rs.getString("date"));
                ap.setSymptems(rs.getString("symptems"));
                ap.setStatus(rs.getInt("status"));
                ap.setDone(rs.getInt("done"));
                arr.add(ap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arr;
    }
    
    public ArrayList<Appointment> getPendingAppoinment(String enroll) {
        Appointment ap = null;
        ArrayList<Appointment> arr = new ArrayList<>();
        try {
            String query = "select * from appointment where denroll = ? and status=0";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, enroll);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                ap = new Appointment();
                ap.setAppointmentId(rs.getString("id"));
                ap.setSenroll(rs.getString("senroll"));
                ap.setDenroll(rs.getString("denroll"));
                ap.setDate(rs.getString("date"));
                ap.setSymptems(rs.getString("symptems"));
                ap.setStatus(rs.getInt("status"));
                ap.setDone(rs.getInt("done"));
                arr.add(ap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arr;
    }
    
    public ArrayList<Appointment> getStudentPendingAppoinment(String senroll) {
        Appointment ap = null;
        ArrayList<Appointment> arr = new ArrayList<>();
        try {
            String query = "select * from appointment where senroll = ? and status=0";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, senroll);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                ap = new Appointment();
                ap.setAppointmentId(rs.getString("id"));
                ap.setSenroll(rs.getString("senroll"));
                ap.setDenroll(rs.getString("denroll"));
                ap.setDate(rs.getString("date"));
                ap.setSymptems(rs.getString("symptems"));
                ap.setStatus(rs.getInt("status"));
                ap.setDone(rs.getInt("done"));
                arr.add(ap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arr;
    }
    
    public ArrayList<Appointment> getDoctorAppoinment(String denroll) {
        Appointment ap = null;
        ArrayList<Appointment> arr = new ArrayList<>();
        try {
            String query = "select * from appointment where denroll = ? and done=0";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, denroll);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {
                ap = new Appointment();
                ap.setAppointmentId(rs.getString("id"));
                ap.setSenroll(rs.getString("senroll"));
                ap.setDenroll(rs.getString("denroll"));
                ap.setDate(rs.getString("date"));
                ap.setSymptems(rs.getString("symptems"));
                ap.setStatus(rs.getInt("status"));
                ap.setDone(rs.getInt("done"));
                arr.add(ap);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return arr;
    }
    
    public Doctor getDoctor(String denroll) {
        Doctor doc = null;
        try {
            String query = "select * from doctor where enrollment = ?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, denroll);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                doc = new Doctor();
                doc.setEnrollment(denroll);
                doc.setName(rs.getString("name"));
                doc.setPost(rs.getString("post"));
                doc.setExperience(rs.getInt("experience"));
                doc.setPhone(rs.getString("phone"));
                doc.setEmail(rs.getString("email"));
                doc.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doc;
    }
    
    public Doctor getDoctor(String denroll, String password) {
        Doctor doc = null;
        try {
            String query = "select * from doctor where enrollment = ? and password = ?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, denroll);
            psmt.setString(2, password);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                doc = new Doctor();
                doc.setEnrollment(denroll);
                doc.setName(rs.getString("name"));
                doc.setPost(rs.getString("post"));
                doc.setExperience(rs.getInt("experience"));
                doc.setPhone(rs.getString("phone"));
                doc.setEmail(rs.getString("email"));
                doc.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return doc;
    }
    
    public boolean deleteAppoinment(String id) {
        boolean flag = false;
        try {
            String query = "delete from appointment where id = ?";
            PreparedStatement psmt = conn.prepareStatement(query);
            psmt.setString(1, id);
            psmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
