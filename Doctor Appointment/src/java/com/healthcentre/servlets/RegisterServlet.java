package com.healthcentre.servlets;

import com.user.dao.StudentDao;
import com.user.entities.Student;
import com.user.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String enrollment = request.getParameter("stud_enrollment");
            String name = request.getParameter("stud_name");
            int age = Integer.parseInt(request.getParameter("stud_age"));
            String gender = request.getParameter("stud_gender");
            String course = request.getParameter("stud_course");
            String department = request.getParameter("stud_department").toUpperCase();
            String phone = String.valueOf(request.getParameter("stud_phone"));
            String email = request.getParameter("stud_email");
            String password = request.getParameter("stud_password");
            
            
            Student s = new Student(enrollment, name, age, gender, course, department, phone, email, password);
            StudentDao sd = new StudentDao(ConnectionProvider.getConnection());
            if(sd.saveStudent(s)) {
                HttpSession hs = request.getSession();
                hs.setAttribute("currentUser", s);
                response.sendRedirect("index.jsp");
            } else {
                out.println("Registration failed..<a href="+"register.jsp"+">GO BACK</a>");
            }
            
            
//            out.println(enrollment);
//            out.println(name);
//            out.println(age);
//            out.println(gender);
//            out.println(course);
//            out.println(department);
//            out.println(phone);
//            out.println(email);
//            out.println(password);
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
