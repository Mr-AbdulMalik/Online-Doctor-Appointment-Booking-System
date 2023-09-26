package com.healthcentre.servlets;

import com.user.dao.StudentDao;
import com.user.entities.Doctor;
import com.user.entities.Message;
import com.user.entities.Student;
import com.user.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String enrollment = request.getParameter("student_enrollment");
            String password = request.getParameter("student_password");
            StudentDao dao = new StudentDao(ConnectionProvider.getConnection());

            if (enrollment.charAt(0) == 'D') {
                Doctor doc = dao.getDoctor(enrollment, password);

                if (doc == null) {
                    Message msg = new Message("Invalid! enrollment id or password.", "error", "alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Done");
                    HttpSession s = request.getSession();
                    s.setAttribute("currentUser", doc);
                    response.sendRedirect("doctor_profile.jsp");
                }
            } else {
                Student user = dao.getStudent(enrollment, password);

                if (user == null) {
                    Message msg = new Message("Invalid! enrollment id or password.", "error", "alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                } else {
                    out.println("Done");
                    HttpSession s = request.getSession();
                    s.setAttribute("currentUser", user);
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
