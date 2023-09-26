<%@page import="com.user.entities.Doctor"%>
<%@page import="com.user.entities.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.user.helper.ConnectionProvider"%>
<%@page import="com.user.dao.StudentDao"%>
<%@page import="com.user.entities.Message"%>
<%@page import="com.user.entities.Student"%>

<%
    StudentDao dao = new StudentDao(ConnectionProvider.getConnection());
    Doctor user = (Doctor) session.getAttribute("currentUser");
    String name = "";
    if (user == null) {
        Message m = new Message("You have loged out, please login.", "error", "alert-danger");
        session.setAttribute("msg", m);
        response.sendRedirect("login.jsp");
    } else {
        name = user.getName();
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">    

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Profile</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <!--icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body{
                background-color: #F1F1F1;
            }
            .profile{
                height: 520px;
                border-radius: 20px 0px 0px 20px;
                background-color: white;
            }
            .details{
                height: auto;
                background-color: #036c5f;
                /*border-radius: 0px 0px 0px 0px;*/
            }
            .profile-img{
                max-height: 150px;
                max-width: 150px;
                border-radius: 100%;
            }
            .upcoming{
                background-color: #eea676;
                color: white;
            }
            .pending{
                background-color: #eea676;
                color: white;
            }
        </style>

    </head>
    <body>
        <!-- navbar start -->

        <nav class="navbar navbar-expand-lg navbar-dark primary" style="z-index: 3; font-family: 'DM Sans', 'sans-serif'; position: -webkit-sticky; position: sticky; top: 0;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"
                   style="font-size: 26px; font-weight: 700; font-family: 'Brush Script MT', cursive;">
                    IBN-E-SINA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-5">
                    </ul>
                    <ul class="navbar-nav align-items-center text-white">
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white" id="profie" data-toggle="modal" data-target="#profile-model"><span class="fa fa-user-circle"> <%=name%></span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">Logout</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <!-- navbar end -->
        <div class="container p-4">
            <div class="row content">
                <div class="col-md-4 profile p-3">
                    <div style="width: auto;">
                        <div class="text-center">
                            <%
                                if(user.getEnrollment().equals("D123456")){
                            %>
                                    <img src="IMAGE/DrAnsari.jpeg" class="card-img-top profile-img" alt="doctor ansari">
                            <%
                                } else if(user.getEnrollment().equals("D123457")) {
                            %>
                                    <img src="IMAGE/DrRiyaz.jpg" class="card-img-top profile-img" alt="doctor riyaz">
                            <%
                                } else {
                            %>
                                <img src="IMAGE/default.png" class="card-img-top profile-img" alt="doctor image">
                            <%
                                }
                            %>
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%= user.getName()%></h5>
                            <p class="card-text"><%= user.getPost()%></p>
                        </div>
                        <ul class="list-group list-group-flush fw-bold">
                            <li class="list-group-item">Experience: <%= user.getExperience()%> years</li>
                            <li class="list-group-item">Phone: <%= user.getPhone()%></li>
                            <li class="list-group-item">Phone: <%= user.getEmail()%></li>
                        </ul>
                        <div class="card-body">
                            <a href="#" class="card-link">Edit profile</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 details">

                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col upcoming p-2">
                                    <h4 class="card-title">Appoinment Requests</h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <%
                                        if (user == null) {
                                            Message m = new Message("You have loged out, please login.", "error", "alert-danger");
                                            session.setAttribute("msg", m);
                                            response.sendRedirect("login.jsp");
                                        }
                                        ArrayList<Appointment> arr = dao.getPendingAppoinment(user.getEnrollment());
                                        for (int i = 0; i < arr.size(); i++) {
                                            Appointment ap = arr.get(i);
                                            Student st = dao.getStudent(ap.getSenroll());
                                    %>
                                    <div class="card m-4" style="width: auto;">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= st.getName()%></h5>
                                            <h6 class="card-subtitle mb-2 text-muted"><%= st.getCourse()%> <%= st.getAge()%> years, <%= st.getGender().toUpperCase()%></h6>
                                            <h6>(Request Date: <%= ap.getDate()%>)</h6>
                                            <p class="card-text">
                                                <b>Symptomes:</b> <%= ap.getSymptems()%>
                                            </p>
                                            <form class="row g-3" method="POST" action="UpdateAppointmentServlet">
                                                <div class="col-auto">
                                                    <input type="hidden" name="id" class="form-control" id="id" value="<%= ap.getAppointmentId()%>">
                                                    <input type="date" name="date" class="form-control" id="date" required>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="submit" class="btn secondary mb-3">Confirm</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                        }
                                        if (arr.isEmpty()) {
                                    %>
                                    <p class="card-subtitle p-2">Looks like no any Appoinment request..</p>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--                    <div class="row">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col pending p-2">
                                                        <h4 class="card-title">Pending Appoinment</h4>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                    <%
                        ArrayList<Appointment> arr1 = dao.getStudentPendingAppoinment(user.getEnrollment());
                        for (int i = 0; i < arr1.size(); i++) {
                            Appointment ap = arr1.get(i);
                            Doctor doc = dao.getDoctor(ap.getDenroll());
                    %>
                    <div class="card m-4" style="width: auto;">
                        <div class="card-body">
                            <h5 class="card-title"><%= doc.getName()%></h5>
                            <h6 class="card-subtitle mb-2 text-muted"><%= doc.getPost()%></h6>
                            <p class="card-text">
                                Your Appoinment has been requested. please wait! for further process.
                            </p>
                            <div>
                                <form method="POST" action="DeleteAppointmentServlet">
                                    <input type="hidden" id="apid" name="id" value="4252532">
                                    <button type="submit" id="btn" class="btn btn-lg secondary text-black">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                        if (arr1.isEmpty()) {
                    %>
                    <p class="card-subtitle p-2">Looks like no any Pending Appoinment..</p>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>-->

                </div>
            </div>
        </div>
        <script>
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0 so need to add 1 to make it 1!
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd;
            }
            if (mm < 10) {
                mm = '0' + mm;
            }

            today = yyyy + '-' + mm + '-' + dd;
            mm++;
            var max = yyyy + '-' + mm + '-' + dd;
            document.getElementById("date").setAttribute("min", today);
            document.getElementById("date").setAttribute("max", max);
            document.getElementById("date").setAttribute("defaultValue", today);
        </script>
    </body>
</html>
