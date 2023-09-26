package com.healthcentre.servlets;

import com.user.dao.StudentDao;
import com.user.entities.Appointment;
import com.user.entities.Student;
import com.user.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppointmentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String denroll = request.getParameter("denroll");
            String date = request.getParameter("date");
            String symptems = request.getParameter("symptems");
            Student user = (Student) request.getSession().getAttribute("currentUser");
            Appointment ap = new Appointment();
            ap.setAppointmentId();
            ap.setSenroll(user.getEnrollment());
            ap.setDenroll(denroll);
            ap.setDate(date);
            ap.setSymptems(symptems);
            ap.setStatus(0);
            ap.setDone(0);
            StudentDao sd = new StudentDao(ConnectionProvider.getConnection());
            if(sd.saveAppoinment(ap)) {
                response.sendRedirect("student_profile.jsp");
            } else {
                out.print("Something went wrong!!");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
