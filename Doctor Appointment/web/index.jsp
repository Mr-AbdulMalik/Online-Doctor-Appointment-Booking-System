<%@page import="com.user.entities.Message"%>
<%@page import="com.user.entities.Student"%>
<%
    Student user = (Student) session.getAttribute("currentUser");
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>IBN-E-SINA</title>
        <style>
            .header1{
                background-image: url("IMAGE/healthcentre.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                width: 100%;
                height: 740px;
            }
            .book-btn{
                padding: 12px 24px;
                border-radius: 40px;
                color: #eea676;
                text-transform: uppercase;
                background-color: #036c5f;
            }

            .book-btn:hover{
                background-color: #eeeeee;
                transition-timing-function: ease-in-out;
            }
            .book-apt:hover{
                background-color: #eea676;
                transition-timing-function: ease-in-out;
            }
            .heading {
                background-color: #fbf7f3;
                margin-bottom: 0px;
            }
            .doctors{
                margin-top: 0px;
            }
            .our-doctors{
                background-color: #036c5f;
                color: #eea676;
                border-radius: 30px;
                font-style: italic;
            }
        </style>
    </head>
    <body>
        <!-- navbar start -->

        <nav class="navbar navbar-expand-lg navbar-dark primary" style="z-index: 3; font-family: 'DM Sans', 'sans-serif'; position: -webkit-sticky; position: sticky; top: 0;">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"
                   style="font-size: 26px; font-weight: 700; font-family: 'Brush Script MT', cursive;">
                    IBN-E-SINA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-5">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#our_doctors">Doctors</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav align-items-center text-white">
                        <li class="nav-item">
                            <a href="student_profile.jsp" class="nav-link text-white" id="profie" data-toggle="modal" data-target="#profile-model"><span class="fa fa-user-circle"> <%=name%></span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">Logout</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>

        <!-- navbar end -->

        <!--heading start-->

        <div class="container-fluid header1">
            <div class="row">
                <div class="col pt-5 text-center">
                    <h1 style="font-family: 'Brush Script MT', cursive;">University Health Centre</h1>
                </div>
            </div>
        </div>

        <div class="container doctors" style="font-family:'Segoe UI', Tahoma;">
            <div class="row pt-4">
                <span class="our-doctors" id="our_doctors"><h2 class="col align-self-center text-center">Our Doctors</h2></span>
            </div>
            <div class="row text-center justify-content-evenly pb-5 pt-0">
                <div class="col-lg-3 p-3 py-5 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/DrAnsari.jpeg" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 100%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. Mohd. Khutubuddin Ansari</h5>
                    <h6 class="fw-bold text-uppercase">Chief Consultant</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
                <div class="col-lg-3 py-5 p-3 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/DrRiyaz.jpg" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 50%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. K. Riyaz</h5>
                    <h6 class="fw-bold text-uppercase">Medical Officer</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
                <div class="col-lg-3 py-5 p-3 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/default.png" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 100%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. XYZ</h5>
                    <h6 class="fw-bold text-uppercase">Chief Consultant</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button disabled class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
            </div>
            <div class="row text-center justify-content-evenly pb-5 pt-0">
                <div class="col-lg-3 py-5 p-3 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/default.png" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 100%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. XYZ</h5>
                    <h6 class="fw-bold text-uppercase">Chief Consultant</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button disabled class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
                <div class="col-lg-3 py-5 p-3 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/default.png" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 100%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. XYZ</h5>
                    <h6 class="fw-bold text-uppercase">Chief Consultant</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button disabled class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
                <div class="col-lg-3 py-5 p-3 secondary align-self-center card mt-5 d-flex">
                    <div class="d-flex justify-content-center">
                        <img src="IMAGE/default.png" class="secondary mb-1 img-fluid icon" style="height: 150px; width: 150px; border-radius: 100%; border: 2px solid #036c5f" alt="image1">
                    </div>
                    <h5 class="mt-2">Dr. XYZ</h5>
                    <h6 class="fw-bold text-uppercase">Chief Consultant</h6>
                    <h6 class="">(General physician)</h6>
                    <div>
                        <button disabled class="btn book-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" id="bookbtn1" type="button">Book An Appoinment</button>                   
                    </div>
                </div>
            </div>
        </div>

        <!--footer-->
        <div class="container-fluid text-white primary">
            <div class="row p-5">
                <div id="block-vershblockcopyright" class="col-md-6">
                    <p><strong>© Copyright 2022. All Rights Reserved.</strong></p>
                    <p><sub><strong>Disclaimer : </strong>This website is designed to disseminate information/activities related to MANUU </sub></p>
                </div>
            </div>
        </div>

        <!--togel-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" style="font-family: 'Trebuchet MS', sans-serif;" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Appoinment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form class="row g-3" id="login_form" action="AppointmentServlet" method="POST">
                            <div class="form-group col-md-6">
                                <label for="gender">Doctor</label>
                                <select class="form-select" id="gender" name="denroll" required>
                                    <option selected>--Select doctor--</option>
                                    <option value="D123456">Dr. Ansari</option>
                                    <option value="D123457">Dr. Riyaz</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="date">Select Date</label>
                                <input type="date" name="date" class="form-control" id="date"
                                       min=""  max="">
                            </div>
                            <div class="form-group col">
                                <label for="symptems">Symptems</label>
                                <textarea type="text" name="symptems" class="form-control" id="password"
                                          placeholder="Writes your symptems..."></textarea>
                            </div>
                            <div class="d-grid d-flex justify-content-center">
                                <button type="submit" id="btn" class="btn book-apt text-white primarybtn btn-lg secondary text-black">Book Appoinment</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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
